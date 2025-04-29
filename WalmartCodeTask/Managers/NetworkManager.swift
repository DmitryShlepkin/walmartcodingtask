//
//  NetworkManager.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import Foundation

protocol NetworkManaging {
    func fetch<T:Codable>(url urlString: String, as type: T.Type) async -> Result<T?, NetworkManager.NetworkError>
}

final class NetworkManager: NetworkManaging {
        
    enum NetworkError: String, Error {
        case network = "Network error."
        case data = "No data returned from request."
        case url = "URL is incorrect."
    }

    func fetch<T:Codable>(url urlString: String, as type: T.Type) async -> Result<T?, NetworkError> {
        guard let url = URL(string: urlString) else {
            return .failure(.url)
        }
        var output: Data?
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            output = data
        } catch {
            return .failure(.network)
        }
        do {
            guard let output else {
                return .failure(.data)
            }
            let data = try JSONDecoder().decode(T.self, from: output)
            return .success(data)
        } catch {
            return .failure(.data)
        }
    }
    
}
