//
//  DictionaryResponse.swift
//  Definitive
//
//  Created by Raphael DeFranco on 2/25/23.
//

import Foundation

struct DictionaryResponse: Codable {
    let meanings: [DictionaryMeaning]
    
    static var empty: DictionaryResponse {
        return DictionaryResponse(meanings: [])
    }
}

struct DictionaryMeaning: Codable, Identifiable {
    var id = UUID()
    let partsOfSpeech: String?
    let definitions: [DictionaryDefinition]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.partsOfSpeech = try? container.decode(String.self, forKey: .partsOfSpeech)
        self.definitions = try container.decode([DictionaryDefinition].self, forKey: .definitions)
    }
}

struct DictionaryDefinition: Codable, Identifiable {
    var id = UUID()
    let definition: String
    let example: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.definition = try container.decode(String.self, forKey: .definition)
        self.example = try? container.decode(String.self, forKey: .example)
    }
}
