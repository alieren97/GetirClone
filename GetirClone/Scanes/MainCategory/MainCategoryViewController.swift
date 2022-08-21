//
//  MainCategoryView.swift
//  GetirClone
//
//  Created by Ali Eren on 14.08.2022.
//

import Foundation
import UIKit

class MainCategoryViewController: UIViewController,Layouting {
    typealias ViewType = MainCategoryView
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}
