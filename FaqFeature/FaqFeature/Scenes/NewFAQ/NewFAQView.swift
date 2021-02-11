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
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var questionTitleTextField: SnowTextField = {
        let textView = SnowTextField(title: "Título da pergunta")
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var answerTextField: SnowTextField = {
        let textView = SnowTextField(title: "Resposta da pergunta")
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var colorPicker: SnowColorPickerView = {
        let view = SnowColorPickerView(title: "Cor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var bottomButton: SnowBottomButton = {
        let button = SnowBottomButton(title: "Adicionar")
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
        backgroundColor = .snowLightGray
        addSubview(shadowView)
        addSubview(containerView)
        containerView.addSubview(questionTitleTextField)
        containerView.addSubview(answerTextField)
        containerView.addSubview(colorPicker)
        containerView.addSubview(bottomButton)
    }
    
    private func setupConstraints(){
        shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        shadowView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        shadowView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        containerView.topAnchor.constraint(equalTo: shadowView.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: shadowView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: shadowView.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor).isActive = true
        
        
        questionTitleTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        questionTitleTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        questionTitleTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
//        questionTitleTextField.heightAnchor.constraint(equalToConstant: 70).isActive = true

        answerTextField.topAnchor.constraint(equalTo: questionTitleTextField.bottomAnchor, constant: 16).isActive = true
        answerTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        answerTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true


        colorPicker.topAnchor.constraint(equalTo: answerTextField.bottomAnchor, constant: 16).isActive = true
        colorPicker.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        colorPicker.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        colorPicker.heightAnchor.constraint(equalToConstant: 60).isActive = true

        bottomButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        bottomButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        bottomButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
}

extension NewFAQView{
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        shadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.cornerRadius = 10
    }
    
}
