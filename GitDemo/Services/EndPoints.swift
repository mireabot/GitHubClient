//
//  EndPoints.swift
//  GitDemo
//
//  Created by Mikhail Kolkov on 14.01.21.

import Foundation

protocol EndPoints {
    
    var scheme: String { get }
    
    // Example: "github.com"
    var baseUrl: String { get }
    
    // GET/POST
    var method: String { get }
    
    var path: String { get }
    
    var parameter: [URLQueryItem] { get }
    
}
