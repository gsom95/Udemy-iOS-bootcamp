//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Igor on 29.06.2020.
//  Copyright © 2020 GsomGsom. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var leftDiceNumber = Int.random(in: 1...6)
    @State var rightDiceNumber = Int.random(in: 1...6)

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()

                HStack {
                    DiceView(diceNumber: leftDiceNumber)
                    DiceView(diceNumber: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()

                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color(.red))
            }
            .padding(.vertical)
        }
    }
}

struct DiceView: View {
    let diceNumber: Int

    var body: some View {
        Image("dice\(diceNumber)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
