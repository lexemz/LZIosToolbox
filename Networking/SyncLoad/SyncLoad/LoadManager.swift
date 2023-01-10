//
//  LoadManager.swift
//  SyncLoad
//
//  Created by Igor Buzykin on 01.12.2022.
//

import Foundation

class Loader {
    let urls = [
        URL(string: "https://randomuser.me/api/?page=1&results=10&seed=abc")!,
        URL(string: "https://randomuser.me/api/?page=2&results=10&seed=abc")!,
        URL(string: "https://randomuser.me/api/?page=3&results=10&seed=abc")!,
    ]

    func load(completion: @escaping (_ results: [RandomUserAPIRoot], _ errors: [Error]) -> Void) {

        
        var result: [RandomUserAPIRoot] = []
        var errors: [Error] = []
        
        let dispatchGroup = DispatchGroup()
        for url in urls {
            dispatchGroup.enter()
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                defer { dispatchGroup.leave() }
                if let error {
                    print(error.localizedDescription)
                    errors.append(error)
                    return
                }
                
                if let data {
                    do {
                        let randomUserAPI = try JSONDecoder().decode(RandomUserAPIRoot.self, from: data)
                        result.append(randomUserAPI)
                    } catch let error {
                        errors.append(error)
                    }
                }
            }
            task.resume()
        }
        
        
        dispatchGroup.notify(queue: .main) {
            completion(result, errors)
        }
    }
}
