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
        navigationBar.barTintColor = .snowBlue
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                             .font: UIFont.arialBoldFont(withSize: 18)]
        navigationBar.tintColor = .white
        
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        
    }
}
