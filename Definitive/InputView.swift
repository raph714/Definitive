//
//  InputView.swift
//  Definitive
//
//  Created by Raphael DeFranco on 2/25/23.
//

import SwiftUI

struct InputView: View {
    @Binding var sentence: String
    var wordSelected: (String) -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Put it in me: ")
                .font(.largeTitle)
            TextField("Enter a sentence", text: $sentence)
                .textSelection(.enabled)
            HStack {
                ForEach(words, id: \.self) { word in
                    Button {
                        wordSelected(word)
                    } label: {
                        Text(word)
                    }
                }
            }
            
            Spacer()
        }
        .padding(24)
    }
    
    var words: [String] {
        let words = sentence.components(separatedBy: " ")
        let filteredWords = words.filter({ !$0.isEmpty })
        return filteredWords
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(sentence: .constant(""), wordSelected: {_ in})
    }
}
