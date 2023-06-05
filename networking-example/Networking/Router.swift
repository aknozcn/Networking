//
//  Router.swift
//  networking-example
//
//  Created by akin on 5.06.2023.
//

import UIKit

enum Router {
    case getQuotes
}

extension Router {
    var scheme: String {
        switch self {
        case .getQuotes:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getQuotes:
            return "api.breakingbadquotes.xyz"
        }
    }
    
    var path: String {
        switch self {
        case .getQuotes:
            return "/v1/quotes"
        }
    }
    
    var method: String {
        switch self {
        case .getQuotes:
            return "GET"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getQuotes:
            return nil
        }
    }
}
