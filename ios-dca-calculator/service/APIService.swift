//
//  APIService.swift
//  ios-dca-calculator
//
//  Created by Charlie on 2/8/21.
//

import Foundation
import Combine

struct APIService {
    var API_KEY: String {
        return keys.randomElement() ?? "Error"
    }
    
    let keys = ["2755LN68QXLCF6C4", "EUQ4GTTIXAGZUZML", "6RNLW156DFWT88RN"]
    
    func fetchSymbolsPublisher(keywords: String) ->AnyPublisher<SearchResults, Error>{
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(API_KEY)"
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data})
            .decode(type: SearchResults.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
