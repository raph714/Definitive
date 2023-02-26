//
//  AppViewModel.swift
//  Definitive
//
//  Created by Raphael DeFranco on 2/25/23.
//

import Foundation

struct SentenceViewModel {
    var sentence: String = ""
    var selectedWord: String = ""
    
    var words: [String] {
        var someWords = [String]()
        sentence.enumerateSubstrings(in: sentence.startIndex..<sentence.endIndex, options: .byWords) { substring, _, _, _ in
            if let substring {
                someWords.append(substring)
            }
        }
        return someWords
    }
    
    mutating func wordSelected(_ word: String) {
        selectedWord = word
    }
    
    mutating func replaceSelectedWord(with definition: String) {
        sentence = sentence.replacingOccurrences(of: selectedWord, with: definition)
    }
}
