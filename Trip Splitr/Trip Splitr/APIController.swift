//
//  APIController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class APIController {

    func logIn(with username: String, password: String, completion: @escaping (Error?) -> Void) {
        let requestURL = baseURL.appendingPathComponent("auth/login")

        var request = URLRequest(url: requestURL)

        request.httpMethod = HTTPMethod.post.rawValue

        // The body of our request is JSON.
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let user = SignIn(username: username, password: password)

        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            NSLog("Error encoding User: \(error)")
            completion(error)
            return
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {

                // Something went wrong
                completion(NSError())
                return
            }

            if let error = error {
                NSLog("Error logging in: \(error)")
                completion(error)
                return
            }

            // Get the bearer token by decoding it.

            guard let data = data else {
                NSLog("No data returned from data task")
                completion(NSError())
                return
            }

            let decoder = JSONDecoder()

            do {
                let bearer = try decoder.decode(Bearer.self, from: data)

                // We now have the bearer to authenticate the other requests
                self.bearer = bearer
                completion(nil)
            } catch {
                NSLog("Error decoding Bearer: \(error)")
                completion(error)
                return
            }
            }.resume()
    }


    func getTrips(completion: @escaping (Result<[TripName], NetworkError>) -> Void) {

        //                guard let bearer = bearer else {
        //                    NSLog("No bearer token available")
        //                    completion(.failure(.noBearer))
        //                    return
        //                }

        let requestURL = baseURL
            .appendingPathComponent("trips")

        var request = URLRequest(url: requestURL)

        // If the method is GET, there is no body
        request.httpMethod = HTTPMethod.get.rawValue

        //                // This is our method of authenticating with the API.
        //                request.addValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, _, error) in

            //            if let response = response as? HTTPURLResponse,
            //                response.statusCode == 401 {
            //                completion(.failure(.badAuth))
            //                return
            //            }

            if let error = error {
                NSLog("Error getting trips: \(error)")
                completion(.failure(.apiError))
                return
            }

            guard let data = data else {
                completion(.failure(.noDataReturned))
                return
            }

            let decoder = JSONDecoder()

            do {
                let trips = try decoder.decode([TripName].self, from: data)
                completion(.success(trips))
            } catch {
                NSLog("Error decoding trips: \(error)")
                completion(.failure(.noDecode))
            }
            }.resume()
    }



    func fetchImage(at urlString: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        let imageUrl = URL(string: urlString)!

        var request = URLRequest(url: imageUrl)
        request.httpMethod = HTTPMethod.get.rawValue

        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let _ = error {
                completion(.failure(.apiError))
                return
            }

            guard let data = data else {
                completion(.failure(.noDataReturned))
                return
            }

            let image = UIImage(data: data)!
            completion(.success(image))
            }.resume()
    }


    func getUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {

        //                guard let bearer = bearer else {
        //                    NSLog("No bearer token available")
        //                    completion(.failure(.noBearer))
        //                    return
        //                }

        let requestURL = baseURL
            .appendingPathComponent("users")

        var request = URLRequest(url: requestURL)

        // If the method is GET, there is no body
        request.httpMethod = HTTPMethod.get.rawValue

        //                // This is our method of authenticating with the API.
        //                request.addValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, _, error) in

            //            if let response = response as? HTTPURLResponse,
            //                response.statusCode == 401 {
            //                completion(.failure(.badAuth))
            //                return
            //            }

            if let error = error {
                NSLog("Error getting users: \(error)")
                completion(.failure(.apiError))
                return
            }

            guard let data = data else {
                completion(.failure(.noDataReturned))
                return
            }

            let decoder = JSONDecoder()

            do {
                let users = try decoder.decode([User].self, from: data)
                completion(.success(users))
            } catch {
                NSLog("Error decoding trips: \(error)")
                completion(.failure(.noDecode))
            }
            }.resume()
    }

    
    
    // Properties
    var bearer: Bearer?
    private let baseURL = URL(string: "https://tripsplitr.herokuapp.com/")!




    // Enums
    enum NetworkError: Error {
        case noDataReturned
        case noBearer
        case badAuth
        case apiError
        case noDecode
    }

    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }

}
