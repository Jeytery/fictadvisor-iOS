//
//  API.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import Foundation

typealias ResultCompletion<ReturType, ErrorType: Error> = (Result<ReturType, ErrorType>) -> Void
typealias VoidCompletion<ErrorType: Error> = (ErrorType?) -> Void

protocol Repository {
    var baseURl: String { get }
    func getTeachers()
    
    func search(_ title: String, completion: @escaping ResultCompletion<Int, Error>)
}

extension Repository {
    var baseURl: String { return "https://api.fictadvisor.com/" }
}

class RestApi: Repository {
    func getTeachers() {
        //https://api.fictadvisor.com/teachers
    }
    
    func search(_ title: String, completion: @escaping ResultCompletion<Int, Error>) {
        print(baseURl + "search?search=\(title)")
        let a = "https://api.fictadvisor.com/search?search=\(title)"
        guard let url = URL(string: a) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
          
            
            guard let data = data else { return }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
            print(json)
            
            
            completion(.success(0))
        }
        task.resume()
    }
}

class API {
    static let shared: Repository = RestApi()
}
