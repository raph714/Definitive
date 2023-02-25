//
//  ContentView.swift
//  Definitive
//
//  Created by Raphael DeFranco on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sentence: String = ""
    @State private var selectedWord: String = ""
    
    var body: some View {
        HStack {
            InputView(sentence: $sentence) { newWord in
                selectedWord = newWord
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            DictionaryView(selectedWord: $selectedWord)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background {
            Color(.systemGray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
