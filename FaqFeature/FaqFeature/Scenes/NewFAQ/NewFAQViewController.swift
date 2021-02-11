//
//  NewFAQViewController.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 08/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import UIKit

class NewFAQViewController: UIViewController {

    var viewModel: NewFAQViewModel
    
    lazy var customView: NewFAQView = {
        let view = NewFAQView()
        return view
    }()
    
    init(viewModel: NewFAQViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        title = "Adicionar pergunta"
        customView.bottomButton.action = addNewFaq
        configBinds()
    }
    
    private func addNewFaq(){
        //TODO: Check if all fields are filled correctly
        
        let question = customView.questionTitleTextField.text
        let answer = customView.answerTextField.text
        let color = customView.colorPicker.selectedColor ?? UIColor.purple
        let colorHex = UIColorConverter.hexStringFromColor(color: color)
        let model = FAQModel(question: question, answer: answer, colorHex: colorHex)
        viewModel.saveFaq(model)
    }
    
    private func configBinds(){
        viewModel.loading.bind (skip: true) { [weak self] (loading) in
            guard let self = self else {return}
            self.customView.isUserInteractionEnabled = !loading
            loading ? self.customView.bottomButton.startLoading()
            : self.customView.bottomButton.stopLoading()
        }
        
        viewModel.error.bind(skip: true) {[weak self] (error) in
            guard let self = self else {return}
            if let error = error{
                print(error)
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
