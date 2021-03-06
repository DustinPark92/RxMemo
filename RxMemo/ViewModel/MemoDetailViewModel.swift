//
//  MemoDetailViewModel.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/18.
//

import Foundation
import RxSwift
import RxCocoa
import Action


class MemoDetailViewModel : CommonViewModel {
    let memo : Memo
    
    private var formatter : DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "Ko_kr")
        f.dateStyle = .medium
        f.timeStyle = .medium
        return f
    }()
    
    var contents : BehaviorSubject<[String]>
    
    
    init(memo : Memo, title : String, sceneCoordinator : SceneCoordinator , storage : MemoStorageType) {
        self.memo = memo
        
        contents = BehaviorSubject<[String]>(value: [
            memo.content,
            formatter.string(from: memo.insertDate)
        ])
        
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
        
        
        
    }
    
}
