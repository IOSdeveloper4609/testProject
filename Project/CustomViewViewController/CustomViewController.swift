//
//  CustomViewController.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit

public protocol CustomViewController: UIViewController {
    
    associatedtype CustomView: UIView

    var customView: CustomView { get }
}

public extension CustomViewController {
    
    var customView: CustomView {
        guard let view = view as? CustomView else {
            fatalError("Expected view of type \(CustomView.self), but got \(type(of: view)).")
        }
        return view
    }
}
