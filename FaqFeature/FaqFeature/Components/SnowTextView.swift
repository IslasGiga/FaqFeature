//
//  SnowTextView.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 08/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class SnowTextField: UIView {

    var title: String
    
    var text: String {
        return textView.text
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Título da pergunta"
        label.textColor = .snowTextGray
        label.font = UIFont.arialBoldFont(withSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textContainer.heightTracksTextView = true
        textView.isScrollEnabled = false
        return textView
    }()
    
    init(title: String = ""){
        self.title = title
        super.init(frame: .zero)
        initialize()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        addSubview(containerView)
        containerView.addSubview(textView)
        addSubview(titleLabel)
        insertSubview(titleView, belowSubview: titleLabel)
    }
    
    private func setupConstraints(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        textView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        textView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        textView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
        textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        titleView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: -4).isActive = true
        titleView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 4).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 4
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.snowTextGray.cgColor
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        containerView.layer.cornerRadius = 4
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.snowTextGray.cgColor
    }

}
