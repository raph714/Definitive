//
//  ContentView.swift
//  Definitive
//
//  Created by Raphael DeFranco on 2/25/23.
//

import SwiftUI

struct SentenceView: View {
    @State private var model = SentenceViewModel()
    
    var body: some View {
        HStack {
            InputView(model: $model)
            DictionaryView(model: $model)
        }
        .background {
            LinearGradient(gradient: Gradient(colors: [.myLightOrange, .myDarkOrange]), startPoint: .top, endPoint: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SentenceView()
    }
}
