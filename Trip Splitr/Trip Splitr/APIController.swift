//
//  APIController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class APIController {


    func signUp(with username: String, password: String, completion: @escaping (Error?) -> Void) {

        let requestURL = baseURL.appendingPathComponent("auth/register")

        var request = URLRequest(url: requestURL)

        request.httpMethod = HTTPMethod.post.rawValue

        // The body of our request is JSON.
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let user = User(id: <#T##Int#>, name: <#T##String#>, userName: <#T##String#>, password: <#T##String#>, avatar: <#T##String#>)

        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            NSLog("Error encoding User: \(error)")
            completion(error)
            return
        }

        URLSession.shared.dataTask(with: request) { (_, response, error) in

            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {

                // Something went wrong
                completion(NSError())
                return
            }

            if let error = error {
                NSLog("Error signing up: \(error)")
                completion(error)
                return
            }

            completion(nil)
            }.resume()
    }

    func logIn(with username: String, password: String, completion: @escaping (Error?) -> Void) {
        let requestURL = baseURL.appendingPathComponent("auth/login")

        var request = URLRequest(url: requestURL)

        request.httpMethod = HTTPMethod.post.rawValue

        // The body of our request is JSON.
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let user = User(id: <#T##Int#>, name: <#T##String#>, userName: <#T##String#>, password: <#T##String#>, avatar: <#T##String#>)

        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            NSLog("Error encoding User: \(error)")
            completion(error)
            return
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {

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
