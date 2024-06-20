//
//  ContentView.swift
//  Good Greek
//
//  Created by John Medlock on 6/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        
        ZStack {
            
            Color(red: 0.4627, green: 0.8392, blue: 1.0).ignoresSafeArea()
            
            VStack {
                Image("ggLogo").resizable().cornerRadius(15).aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/).padding(.all)
                
                Text("Welcome to Good Greek").font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding()
                
                TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(.all)
                    .frame(width: 200, height: 25)
                    .alignmentGuide(VerticalAlignment.center) { _ in 0 }
                
                TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(.all).frame(width: 200, height: 25).alignmentGuide(VerticalAlignment.center, computeValue: { _ in 0})
                
            }
            
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
