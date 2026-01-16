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
    @State private var sheetIsShown = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(catVM.breeds) { cat in
                    LazyVStack(alignment: .leading) {
                        NavigationLink {
                            DetailView(cat: cat)
                        } label: {
                            Text(cat.breed)
                                .font(.title2)
                        }
                    }
                    .task {
                        await catVM.loadNextIfNeeded(catBreed: cat)
                    }
                }
                .listStyle(.plain)
                
                if catVM.isLoading {
                    ProgressView()
                        .tint(.red)
                        .scaleEffect(4)
                }
            }
            .navigationTitle("Cat Breeds:")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Text("\(catVM.breeds.count) of \(catVM.total) breeds")
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Load All") {
                        Task {
                            await catVM.loadAll()
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsShown.toggle()
                    } label: {
                        Text("🐈‍⬛")
                        Image(systemName: "lightbulb.fill")
                    }
                    .buttonStyle(.bordered)

                }
            }
 
        }
        .sheet(isPresented: $sheetIsShown) {
            FactView()
        }
        .task {
            await catVM.getData()
        }

    }
}

#Preview {
    ListView()
}
