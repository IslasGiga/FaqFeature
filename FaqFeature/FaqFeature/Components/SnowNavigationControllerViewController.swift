//
//  SnowNavigationControllerViewController.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 05/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class SnowNavigationControllerViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .blue
        if let customFont = UIFont(name: "ArialRoundedMTBold", size: 18) {
            navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                 .font: customFont
            ]
        }
    }
}
