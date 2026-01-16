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
            
        }
        .listStyle(.plain)
        .navigationTitle("\(cat.breed)")
    }
}

#Preview {
    NavigationStack {
        DetailView(cat: CatBreed(breed: "Tiger", country: "UK", origin: "Africa", coat: "Shiney", pattern: "Patchy"))
    }
}
