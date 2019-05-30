//
//  APIController.swift
//  Trip Splitr
//
//  Created by Jonathan Ferrer on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class APIController {


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

//
//    func getTrips(completion: @escaping (Result<[TripName], NetworkError>) -> Void) {
//        
//        //                guard let bearer = bearer else {
//        //                    NSLog("No bearer token available")
//        //                    completion(.failure(.noBearer))
//        //                    return
//        //                }
//        
//        let requestURL = baseURL
//            .appendingPathComponent("users")
//        
//        var request = URLRequest(url: requestURL)
//        
//        // If the method is GET, there is no body
//        request.httpMethod = HTTPMethod.get.rawValue
//        
//        //                // This is our method of authenticating with the API.
//        //                request.addValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")
//        
//        URLSession.shared.dataTask(with: request) { (data, _, error) in
//            
//            //            if let response = response as? HTTPURLResponse,
//            //                response.statusCode == 401 {
//            //                completion(.failure(.badAuth))
//            //                return
//            //            }
//            
//            if let error = error {
//                NSLog("Error getting trips: \(error)")
//                completion(.failure(.apiError))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(.noDataReturned))
//                return
//            }
//            
//            let decoder = JSONDecoder()
//            
//            do {
//                let trips = try decoder.decode([TripName].self, from: data)
//                completion(.success(trips))
//            } catch {
//                NSLog("Error decoding trips: \(error)")
//                completion(.failure(.noDecode))
//            }
//            }.resume()
//    }

    
    
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
