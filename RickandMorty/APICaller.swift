//
//  APICaller.swift
//  RickandMorty
//
//  Created by huseyin.kucuk on 11.11.2021.
//

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    struct Constants {
        static let mainURL = URL(string: "https://rickandmortyapi.com/api/character")
    }
    
    private init () {}
    
    public func getData(completion: @escaping ( Result<[Characters], Error>) -> Void){//isimlendirmlere tam fonksiyona göre ver
        guard let url = Constants.mainURL else {//swift generics
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print ("Data:\(result.results.count)")
                    completion(.success(result.results))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

struct APIResponse: Codable {
    let results: [Characters]
}

struct Characters: Codable {
    let name: String
    let created: String
    let image: String
}


