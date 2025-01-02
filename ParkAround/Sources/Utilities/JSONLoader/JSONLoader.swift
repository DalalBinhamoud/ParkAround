//
//  JSONLoader.swift
//  ParkAround
//
//  Created by Dalal Macbook on 01/01/2025.
//

import Foundation

class JSONLoader {
    static func loadJSON<T: Decodable>(for fileName: String, as type: T.Type) -> T? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            // failed
            return nil
        }

        do {

            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(type, from: data)
            return decodedData
        } catch {
            // failed to decode
            return nil
        }
    }
}
