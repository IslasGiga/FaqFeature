//
//  NewFAQView.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 08/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class NewFAQView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var questionTitleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Título da pergunta"
        return textField
    }()
    
    lazy var answerTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Resposta da pergunta"
        return textField
    }()
    
    lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cor"
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    lazy var colorPicker: UIView = {
        let view = UIView()
        view.backgroundColor = .snowRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var bottomButton: SnowButton = {
        let button = SnowButton(title: "Adicionar")
        return button
    }()
    
    init(){
        super.init(frame: .zero)
        initialize()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        backgroundColor = .lightGray
        addSubview(containerView)
        containerView.addSubview(questionTitleTextField)
        containerView.addSubview(answerTextField)
        containerView.addSubview(colorLabel)
        containerView.addSubview(colorPicker)
        containerView.addSubview(bottomButton)
    }
    
    private func setupConstraints(){
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        
        questionTitleTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        questionTitleTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        questionTitleTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        questionTitleTextField.heightAnchor.constraint(equalToConstant: 70).isActive = true

        answerTextField.topAnchor.constraint(equalTo: questionTitleTextField.bottomAnchor, constant: 16).isActive = true
        answerTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        answerTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        answerTextField.heightAnchor.constraint(equalToConstant: 100).isActive = true

        colorLabel.topAnchor.constraint(equalTo: answerTextField.bottomAnchor, constant: 16).isActive = true
        colorLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        colorLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true

        colorPicker.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 16).isActive = true
        colorPicker.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        colorPicker.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        colorPicker.heightAnchor.constraint(equalToConstant: 60).isActive = true

        bottomButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        bottomButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        bottomButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
}
