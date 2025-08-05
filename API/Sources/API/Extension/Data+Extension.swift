//
//  Data+Extension.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

extension Data {
  mutating func appendString(_ string: String) {
    guard let data = string.data(using: .utf8) else { return }
    append(data)
  }
}
