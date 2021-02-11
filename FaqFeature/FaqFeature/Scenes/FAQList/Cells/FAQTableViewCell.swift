//
//  FAQTableViewCell.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 06/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    
    var expanded: Bool = false{
        didSet{
            expanded ? expandCell() : contractCell()
        }
    }
    
    private var bottomConstraint: NSLayoutConstraint?
    
    static let id: String = "FAQTableViewCell"
    
    private var model: FAQModel?
    
    private var expandButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "down"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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

    lazy var colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.arialBoldFont(withSize: 18)
        label.text = model?.question
        return label
    }()
    
    lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.arialFont(withSize: 16)
        label.text = model?.answer
        label.numberOfLines = 0
        return label
    }()
    
    func setup(model: FAQModel){
        self.model = model
        colorView.backgroundColor = model.colorValue
        initialize()
        setupConstraints()
    }
    
    private func initialize(){
        contentView.addSubview(shadowView)
        contentView.addSubview(containerView)
        containerView.addSubview(colorView)
        containerView.addSubview(colorView)
        containerView.addSubview(expandButton)
        containerView.addSubview(questionLabel)
    }
    
    private func setupConstraints(){
        
        shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        shadowView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        shadowView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        containerView.topAnchor.constraint(equalTo: shadowView.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: shadowView.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: shadowView.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor).isActive = true
        
        colorView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        colorView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: 3).isActive = true
        colorView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        expandButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        expandButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        expandButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        expandButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        
        questionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        questionLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        questionLabel.rightAnchor.constraint(equalTo: expandButton.rightAnchor, constant: -16).isActive = true
        bottomConstraint = questionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        bottomConstraint?.isActive = true
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.cornerRadius = 10
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.cornerRadius = 10
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = .white
        selectedBackgroundView = UIView()
    }
}

extension FAQTableViewCell{
    
    fileprivate func expandCell(){
        expandButton.setImage(UIImage(named: "up"), for: .normal)
        bottomConstraint?.isActive = false
        containerView.addSubview(answerLabel)
        answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 16).isActive = true
        answerLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        answerLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        answerLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
    }
    
    fileprivate func contractCell(){
        expandButton.setImage(UIImage(named: "down"), for: .normal)
        answerLabel.removeFromSuperview()
        bottomConstraint?.isActive = true
    }
}
