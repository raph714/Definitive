//
//  DictionaryView.swift
//  Definitive
//
//  Created by Raphael DeFranco on 2/25/23.
//

import SwiftUI

struct DictionaryView: View {
    @Binding var model: SentenceViewModel
    @State private var definitions: DictionaryResponse = .empty
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(model.selectedWord)
                        .font(.largeTitle)
                        .textCase(.uppercase)
                    Spacer()
                }
                .padding(.top)
                
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(definitions.meanings) { meaning in
                        ForEach(meaning.definitions) { definition in
                            ZStack {
                                Text(definition.definition)
                                    .lineLimit(nil)
                                    .onTapGesture {
                                        model.replaceSelectedWord(with: definition.definition)
                                    }
                            }
                            .padding()
                            .background {
                                Color.white
                            }
                            .cornerRadius(8)
                        }
                    }
                }
            }
            .padding(24)
        }
        .onChange(of: model.selectedWord) { newValue in
            lookupWord()
        }
    }
    
    func lookupWord() {
        DictionaryData.shared.getDefinitions(for: model.selectedWord) { response in
            if !response.isEmpty {
                definitions = response.first!
            }
        }
    }
}



struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView(model: .constant(SentenceViewModel()))
    }
}
