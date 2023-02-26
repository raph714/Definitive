//
//  InputView.swift
//  Definitive
//
//  Created by Raphael DeFranco on 2/25/23.
//

import SwiftUI

struct InputView: View {
    @Binding var model: SentenceViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Write a sentence: ")
                    .font(.largeTitle)
                
                TextField("Once upon a time...", text: $model.sentence, axis: .vertical)
                    .font(.title)
                    .textSelection(.enabled)
                    .padding(8)
                    .background(content: {
                        Color.white
                    })
                    .cornerRadius(4)
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(model.words, id: \.self) { word in
                            Button {
                                model.wordSelected(word)
                            } label: {
                                Text(word)
                            }
                        }
                    }
                    .padding(.bottom, 16)
                }
                
                Spacer()
            }
            .padding(24)
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(model: .constant(SentenceViewModel()))
    }
}
