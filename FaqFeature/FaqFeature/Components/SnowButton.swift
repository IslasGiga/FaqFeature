//
//  SnowButton.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 06/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class SnowButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
    var action: (() -> Void)?

    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.snowBlue, for: .normal)
        backgroundColor = .snowYellow
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        titleLabel?.font = UIFont.arialFont
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton(){
        action?()
    }
    
}
