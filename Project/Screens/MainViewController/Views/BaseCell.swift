//
//  BaseCell.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit

class BaseCell: UICollectionViewCell {
  static var reuseIdentifier: String {
      String(describing: Self.self)
  }
}
