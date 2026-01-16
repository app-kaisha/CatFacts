//
//  CatViewModel.swift
//  CatFacts
//
//  Created by app-kaihatsusha on 16/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation

@Observable
class CatViewModel {
    
    private struct Returned: Codable {
        var data: [CatBreed]
    }
    
    var urlString = "https://catfact.ninja/breeds"
    var breeds: [CatBreed] = []
    
    var isLoading = false
    
    
    func getData() async {
        
        isLoading = true
        print("🕸️ We are accessing the url \(urlString)")
        // Create URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode JSON into data structure
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("😡 JSON ERROR: Could not decode returned JSON data")
                isLoading = false
                return
            }
            
            // Confirm data was decoded:
            print("😎 JSON returned! Cat Count: \(returned.data.count)")
            Task { @MainActor in
                self.breeds = returned.data
                
                isLoading = false
            }
        } catch {
            isLoading = false
            print("😡 ERROR: Could not get data from \(urlString) \(error.localizedDescription)")
        }
    }
    
}
