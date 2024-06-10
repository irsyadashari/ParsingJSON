//
//  ViewModel.swift
//  ParsingJSON
//
//  Created by Irsyad Ashari on 16/05/24.
//

import Foundation

struct MainViewModel {
    func getData() -> [Result.Response] {
        if let url = Bundle.main.url(forResource: "response-json", withExtension: "json"),
                     let data = try? Data(contentsOf: url),
                     let result = try? JSONDecoder().decode(Result.self, from: data) {
                        return result.response
        }
        return []
    }
}
