//
//  NewFAQViewController.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 08/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class NewFAQViewController: UIViewController {

    lazy var customView: NewFAQView = {
        let view = NewFAQView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Adicionar pergunta"
    }
}
