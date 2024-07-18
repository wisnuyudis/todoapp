//
//  NoItemsView.swift
//  todoApp
//
//  Created by sdt on 18/07/24.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There are no items!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.red.opacity(0.7) :
                        Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0.0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y : animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear (perform: addAnimation)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
    
    func addAnimation () {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
        .navigationTitle("Title")
}
