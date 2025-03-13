//
//  NetworkManager.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import Foundation

protocol NetworkManaging {
    func fetch<T:Codable>(url urlString: String, as type: T.Type) async throws -> (T?, Error?)
}

final class NetworkManager: NetworkManaging {
        
    enum ServiceError: String, Error {
        case network = "Network error."
        case data = "No data returned from request."
        case url = "URL is incorrect."
    }
    
    func fetch<T:Codable>(url urlString: String, as type: T.Type) async throws -> (T?, Error?) {
        guard let url = URL(string: urlString) else {
            return (nil, ServiceError.url)
        }
        var output: Data?
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            output = data
        } catch {
            return (nil, ServiceError.network)
        }
        do {
            guard let output else {
                return (nil, ServiceError.data)
            }
            let data = try JSONDecoder().decode(T.self, from: output)
            return (data, nil)
        } catch {
            return (nil, ServiceError.data)
        }
    }
    
}
