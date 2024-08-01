//
//  Array.swift
//  Project
//
//  Created by Азат on 31.07.2024.
//

import Foundation

extension Array {
  subscript(safe index: Int) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
