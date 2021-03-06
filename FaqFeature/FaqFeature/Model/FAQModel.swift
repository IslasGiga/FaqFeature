//
//  FAQModel.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 09/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import Foundation
import FirebaseFirestore

public struct FAQModel{
    let question: String
    let answer: String
    let colorHex: String
    
    public init(question: String, answer: String, colorHex: String){
        self.question = question
        self.answer = answer
        self.colorHex = colorHex
    }
    
    public init(fromDict dict : [String: Any]){
        question = dict["question"] as? String ?? ""
        answer = dict["answer"] as? String ?? ""
        colorHex = dict ["colorHex"] as? String ?? ""
    }
    
    public var toDict: [String: Any]{
        return [
            "question": question,
            "answer": answer,
            "colorHex": colorHex
        ]
    }
    
    public var colorValue: UIColor{
        return UIColorConverter.colorWithHexString(hexString: colorHex)
    }
}
