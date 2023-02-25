//
//  DictionaryView.swift
//  Definitive
//
//  Created by Raphael DeFranco on 2/25/23.
//

import SwiftUI

struct DictionaryView: View {
    @Binding var selectedWord: String
    @State private var definitions: DictionaryResponse = .empty
    
    var body: some View {
        VStack(spacing: 36) {
            HStack {
                Text(selectedWord)
                    .font(.largeTitle)
                    .textCase(.uppercase)
                Spacer()
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(definitions.meanings) { meaning in
                        ForEach(meaning.definitions) { definition in
                            Text(definition.definition)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .padding(24)
        .onChange(of: selectedWord) { newValue in
            lookupWord()
        }
    }
    
    func lookupWord() {
        DictionaryData.shared.getDefinitions(for: selectedWord) { response in
            
            if !response.isEmpty {
                definitions = response.first!
            }
        }
    }
}



struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView(selectedWord: .constant("hello"))
    }
}
