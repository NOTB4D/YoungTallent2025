//
//  Bundle+Extension.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

extension Bundle {
    func infoForKey(_ key: String) -> String? {
        (infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
}
