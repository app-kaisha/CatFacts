//
//  FactView.swift
//  CatFacts
//
//  Created by app-kaihatsusha on 16/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct FactView: View {
    
    @State private var factVM = FactViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("🐈 Cat Fact:")
                .font(.system(size: 42, weight: .bold))
            Text(factVM.fact)
                .multilineTextAlignment(.center)
                .font(.title2)
            Button("Dismiss") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .presentationDetents([.medium]) // 1/2 height sheet
        .task {
            await factVM.getData()
        }
    }
}

#Preview {
    FactView()
}
