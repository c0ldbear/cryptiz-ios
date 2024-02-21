//
//  Bundle+Info.swift
//  Cryptiz
//
//  Created by Teddy Juhlin-Henricson on 2024-02-21.
//

import Foundation

extension Bundle {
    func info(for infoPlistKey: String) -> String {
        guard let valueString = infoDictionary?[infoPlistKey] as? String else { return "" }
        return valueString.replacingOccurrences(of: "\\", with: "")
    }
}
