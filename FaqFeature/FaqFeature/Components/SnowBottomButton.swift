//
//  SnowBottomButton.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 08/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class SnowBottomButton: UIButton {

    var action: (() -> Void)?

    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.snowBlue, for: .normal)
        backgroundColor = .snowYellow
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        titleLabel?.font = UIFont.arialBoldFont(withSize: 18)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton(){
        action?()
    }
}
