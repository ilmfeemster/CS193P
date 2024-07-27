//
//  ContentView.swift
//  Memorize
//
//  Created by Immanuel Matthews-Feemster on 7/14/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentEmojis: [String] = []
    
    let halloweenEmojis = ["👻", "🎃", "😈", "🧙🏽‍♀️", "👹", "🧟", "🍭", "🌕", "💀", "😱", "🧛🏽", "🪦"]
    
    let holidayEmojis = ["🎅", "❄️", "☃️", "🛷", "🎄", "🎁", "🤶", "🧝", "🍫", "🧊", "💀", "🧟‍♀️"]
    
    let flagEmojis = ["🇺🇸", "🇰🇷", "🇵🇭", "🇵🇪", "🇳🇬", "🇳🇿", "🇲🇽", "🇱🇾", "🇯🇵", "🇮🇱", "🇭🇹", "🇧🇷", ]
    
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .center)
            ScrollView {
                cards
            }
            Spacer()
            cardThemes
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<currentEmojis.count, id: \.self) { index in
                CardView(content: currentEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardThemes: some View {
        HStack {
            Button(action: {currentEmojis = halloweenEmojis}, label: {
                Image(systemName: "die.face.1.fill")
            })
            Button(action: {currentEmojis = holidayEmojis}, label: {
                Image(systemName: "die.face.2.fill")
            })
            Button(action: {currentEmojis = flagEmojis}, label: {
                Image(systemName: "die.face.3.fill")
            })
        }
    }
}
    

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}
