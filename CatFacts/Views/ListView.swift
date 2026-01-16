//
//  ListView.swift
//  CatFacts
//
//  Created by app-kaihatsusha on 16/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State private var catVM = CatViewModel()
    
    var body: some View {
        NavigationStack {
            List(catVM.breeds) { cat in
                NavigationLink {
                    DetailView(cat: cat)
                } label: {
                    Text(cat.breed)
                        .font(.title2)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Cat Breeds:")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Text("\(catVM.breeds.count) of \(catVM.total) breeds")
                }
            }
        }
        .task {
            await catVM.getData()
        }

    }
}

#Preview {
    ListView()
}
