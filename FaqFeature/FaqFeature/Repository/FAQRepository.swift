//
//  FAQRepository.swift
//  FaqFeature
//
//  Created by Islas Girão Garcia on 09/02/21.
//  Copyright © 2021 Islas Girão Garcia. All rights reserved.
//

import Foundation
import FirebaseFirestore

public enum RepositoryError: Error{
    case snapshotNil
    
    var localizedDescription: String{
        switch self{
        case .snapshotNil: return "Snapshot value is null"
        }
    }
}

public class FAQRepository{
    
    private let db: Firestore
    
    init(){
        db = Firestore.firestore()
    }
    
    func getAllFaq(completion: @escaping (Result<[FAQModel], Error>) -> Void){
        db.collection("faq").getDocuments { (snapshot, error) in
            if let error = error{
                completion(.failure(error))
            }else if let snapshot = snapshot{
                let documents = snapshot.documents
                let faqList = documents.compactMap({
                    FAQModel(fromDict: $0.data())
                })
                completion(.success(faqList))
            }else{
                completion(.failure(RepositoryError.snapshotNil))
            }
        }
    }
    
    func insetFaq(_ faq: FAQModel, completion: @escaping(Error?) -> Void){
        db.collection("faq").addDocument(data: faq.toDict, completion: completion)        
    }
}


