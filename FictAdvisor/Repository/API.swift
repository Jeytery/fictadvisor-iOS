//
//  API.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import Foundation

protocol Repository {
    var baseURl: String { get }
    func getTeachers()
}

extension Repository {
    var baseURl: String { return "https://api.fictadvisor.com/" }
}

class RestApi: Repository {
    func getTeachers() {
        
    }
}

class API {
    static let shared: Repository = RestApi()
}
