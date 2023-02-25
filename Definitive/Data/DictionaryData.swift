//
//  DictionaryData.swift
//  Definitive
//
//  Created by Raphael DeFranco on 2/25/23.
//

import Foundation

struct DictionaryData {
    static let shared = DictionaryData()
    
    func getDefinitions(for word: String, completion: @escaping ([DictionaryResponse]) -> Void) {
        guard let requestUrl = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)") else {
            print("Error for \(word)")
            completion([DictionaryResponse.empty])
            return
        }
        
        let request = URLRequest(url: requestUrl)
        print(request)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data else {
                print(String(describing: error))
                completion([DictionaryResponse.empty])
                return
            }
            
            do {
                let dictResponse = try JSONDecoder().decode([DictionaryResponse].self, from: data)
                completion(dictResponse)
            } catch {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString)
                
                print(String(describing: error))
                completion([DictionaryResponse.empty])
            }
        }.resume()
    }
}
