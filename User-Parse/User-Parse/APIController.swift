//
//  APIController.swift
//  User-Parse
//
//  Created by Kenny on 1/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class APIController {
    var user: [User] = []
    
    let baseURL = URL(string: "https://randomuser.me/api/?format=json&results=20")!
    
    typealias CompletionHandlerWithError = (Error?) -> ()
    
    func getUsers(completion: @escaping CompletionHandlerWithError) {
        
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            
            if let error = error {
                NSLog("Error getting users \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("No data")
                completion(NSError())
                return
            }
            
            do {
                let newUsers = try JSONDecoder().decode(UserResults.self, from: data)
                print(newUsers)
                self.user = newUsers.results
            } catch {
                NSLog("Error decoding users: \(error)")
                completion(error)
                return
            }
            completion(nil)
        }.resume()
        
    }
}
