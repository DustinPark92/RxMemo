//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/18.
//

import Foundation
import RxSwift
import RxCocoa
import Action

// 뷰 모델 추가되는 것
// 1. 의존성을 주입하는 생성자.
// 2. 바인딩에 사용되는 프로퍼티와 메소드


class MemoListViewModel : CommonViewModel {
    
    var memoList : Observable<[Memo]> {
        return storage.memoList()
    }
    
    func performUpdate(memo: Memo) -> Action<String,Void> {
        return Action { input in
            return self.storage.update(memo: memo, content: input).map { _ in }
        }
    }
    
    func performCancel(memo : Memo) -> CocoaAction {
        return Action {
            return self.storage.delete(memo: memo).map { _ in }
        }
    }
    
    func makeCreateAction() -> CocoaAction {
        return CocoaAction {
            _ in
            return self.storage.createMemo(content: "")
                .flatMap { memo -> Observable<Void> in
                    let composeViewModel = MemoComposeViewModel(title: "새 메모", sceneCoordinator: self.sceneCoordinator, storage: self.storage, saveAction: self.performUpdate(memo: memo), cancelAction: self.performCancel(memo: memo))
                    
                    let composeSecene = Scene.compose(composeViewModel)
                    return self.sceneCoordinator.transition(to: composeSecene, using: .modal, animated: true).asObservable().map { _ in }
            }
        }
    }
    
    
}
