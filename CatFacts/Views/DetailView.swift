//
//  DetailView.swift
//  CatFacts
//
//  Created by app-kaihatsusha on 16/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @State var cat: CatBreed
    
    var body: some View {
        List {
            HStack {
                Text("Country")
                    .bold()
                Spacer()
                Text("\(cat.country)")
                    .foregroundStyle(.secondary)
            }
            
            HStack {
                Text("Origin")
                    .bold()
                Spacer()
                Text("\(cat.origin)")
                    .foregroundStyle(.secondary)
            }
            
            HStack {
                Text("Coat")
                    .bold()
                Spacer()
                Text("\(cat.coat)")
                    .foregroundStyle(.secondary)
            }
            
            HStack {
                Text("Pattern")
                    .bold()
                Spacer()
                Text("\(cat.pattern)")
                    .foregroundStyle(.secondary)
            }
            
            // https://upload.wikimedia.org/wikipedia/commons/9/9b/Gustav_chocolate.jpg
                VStack {
                    AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/9/9b/Gustav_chocolate.jpg")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                        
                    } placeholder: {
                        Image(systemName: "rectangle.slash")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.secondary)
                            .fontWeight(.thin)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                        Text("Image Not Available")
                    }
                    
                }
        }
        .font(.title2)
        .listStyle(.plain)
        .navigationTitle("\(cat.breed)")
    }
}

#Preview {
    NavigationStack {
        DetailView(cat: CatBreed(breed: "Burmese", country: "Burma & Thailand", origin: "Natural", coat: "Short", pattern: "Solid"))
    }
}
