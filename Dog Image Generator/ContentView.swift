//
//  ContentView.swift
//  Dog Image Generator
//
//  Created by Preetam Beeravelli on 3/13/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dogViewModel: DogViewModel = DogViewModel()
    var body: some View {
        ZStack {
            Color(red: 1, green: 0.984, blue: 0.953)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("DOGS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.627, green: 0.471, blue: 0.353))
                    .padding()
                    
                Text("For Every DOG Lover Out There, Generate As Many Pictures As You Need And Forget Your Sadness")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.627, green: 0.471, blue: 0.353))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                if dogViewModel.url == nil{
                    ProgressView()
                }
            
                AsyncImage(url: dogViewModel.url) { AsyncImagePhase in
                    AsyncImagePhase.image?.resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(style: StrokeStyle(lineWidth: 10))
                                .fill(Color(red: 0.722, green: 0.451, blue: 0.2))
                                .frame(width: 305, height: 305, alignment: .center)
                                
                        })
                }
                .padding()
                Button {
                    dogViewModel.fetchURL()
                } label: {
                    Text("Generate")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 60)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.red, Color.yellow]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                }
                Spacer()
                Text("Made With ❤ On Dogs")
                    .foregroundColor(Color(red: 0.8, green: 0.4, blue: 0.4))
                    .font(.footnote)
            }
            .onAppear{
                dogViewModel.fetchURL()
            }
        .padding(30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
