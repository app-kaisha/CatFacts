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
                Text(cat.breed)
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
