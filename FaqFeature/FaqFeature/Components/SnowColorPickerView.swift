//
//  SnowColorPickerView.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 08/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class SnowColorPickerView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.arialBoldFont(withSize: 14)
        label.textColor = .snowTextGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.title
        return label
    }()
    
    private var greenColorView: ColorView = {
        let view = ColorView(color: .snowGreen)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var redColorView: ColorView = {
        let view = ColorView(color: .snowRed)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var yellowColorView: ColorView = {
        let view = ColorView(color: .snowYellow)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var blueColorView: ColorView = {
        let view = ColorView(color: .snowBlue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title: String
    
    var selectedColor: UIColor? = nil
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        initialize()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        self.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(greenColorView)
        containerView.addSubview(redColorView)
        containerView.addSubview(yellowColorView)
        containerView.addSubview(blueColorView)
        
        greenColorView.didCheck = didCheck(color:)
        redColorView.didCheck = didCheck(color:)
        yellowColorView.didCheck = didCheck(color:)
        blueColorView.didCheck = didCheck(color:)
    }
    
    
    private func setupConstraints(){
        
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        greenColorView.widthAnchor.constraint(equalToConstant: 31).isActive = true
        greenColorView.heightAnchor.constraint(equalToConstant: 31).isActive = true
        greenColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        greenColorView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true

        redColorView.widthAnchor.constraint(equalToConstant: 31).isActive = true
        redColorView.heightAnchor.constraint(equalToConstant: 31).isActive = true
        redColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        redColorView.leftAnchor.constraint(equalTo: greenColorView.rightAnchor, constant: 25).isActive = true

        yellowColorView.widthAnchor.constraint(equalToConstant: 31).isActive = true
        yellowColorView.heightAnchor.constraint(equalToConstant: 31).isActive = true
        yellowColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        yellowColorView.leftAnchor.constraint(equalTo: redColorView.rightAnchor, constant: 25).isActive = true

        blueColorView.widthAnchor.constraint(equalToConstant: 31).isActive = true
        blueColorView.heightAnchor.constraint(equalToConstant: 31).isActive = true
        blueColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        blueColorView.leftAnchor.constraint(equalTo: yellowColorView.rightAnchor, constant: 25).isActive = true
//
    }
    
    private func didCheck(color: UIColor){
        print("\(color)")
        let colorViews: [ColorView] = [
            greenColorView,
            blueColorView,
            redColorView,
            yellowColorView
        ]
        
        for colorView in colorViews{
            colorView.shouldShowCheckmark(color == colorView.color)
        }
        selectedColor = color
    }
}

class ColorView: UIView{
    
    var color: UIColor
    
    var didCheck: ((UIColor) -> Void)?
    
    var tapGestureRecognizer: UIGestureRecognizer!
    
    lazy var checkmarkImage: UIImageView = {
        let imageView = UIImageView(image: UIImage.checkmark)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = self.color
        return view
    }()
    
    init(color: UIColor){
        self.color = color
        super.init(frame: .zero)
        initialize()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initialize(){
        addSubview(containerView)
        addSubview(checkmarkImage)
        checkmarkImage.isHidden = true
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        containerView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupConstraints(){
        
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
        
        checkmarkImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkmarkImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        checkmarkImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        checkmarkImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    func shouldShowCheckmark(_ checked: Bool){
        checkmarkImage.isHidden = !checked
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.snowTextGray.cgColor
        self.layer.cornerRadius = self.bounds.height/2
        self.layer.masksToBounds = true
        containerView.layer.cornerRadius = containerView.bounds.height/2
        containerView.layer.masksToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.snowTextGray.cgColor
        self.layer.cornerRadius = self.bounds.height/2
        self.layer.masksToBounds = true
        containerView.layer.cornerRadius = containerView.bounds.height/2
        containerView.layer.masksToBounds = true
    }
    
    @objc private func handleTap(){
        didCheck?(self.color)
    }
    
}
