//
//  FactViewModel.swift
//  CatFacts
//
//  Created by app-kaihatsusha on 16/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
// https://catfact.ninja/facts

import Foundation

@Observable
class FactViewModel {
    
//    private struct Returned: Codable {
//        var data: [Fact]
//        var total: Int
//        var next_page_url: String?
//    }
//    
//    private struct Fact: Codable {
//        var fact: String
//        var length: Int
//    }
    private struct Returned: Codable {
        var fact: String
    }
    
    var fact: String = ""
    
    var isLoading = false
    var urlString = "https://catfact.ninja/fact"
    
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
            print("😎 JSON returned! Fact: \(returned.fact)")
            Task { @MainActor in
                //self.fact = returned.data.randomElement()?.fact ?? ""
                self.fact = returned.fact
                //self.urlString = returned.next_page_url ?? ""
                isLoading = false
            }
        } catch {
            isLoading = false
            print("😡 ERROR: Could not get data from \(urlString) \(error.localizedDescription)")
        }
    }
}
