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
        let color = customView.colorPicker.selectedColor
        
        guard let selectedColor = color, !question.isEmpty, !answer.isEmpty else{
            let alert = UIAlertController(title: "Erro!", message: "Preencha todos os campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        let colorHex = UIColorConverter.hexStringFromColor(color: selectedColor)
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
                let alert = UIAlertController(title: "Erro!", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                    alert.dismiss(animated: true, completion: nil)
                }))
                DispatchQueue.main.async { [weak self] in
                    self?.present(alert, animated: true, completion: nil)
                }
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

