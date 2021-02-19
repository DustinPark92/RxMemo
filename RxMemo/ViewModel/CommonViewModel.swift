//
//  CommonViewModel.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/19.
//

import Foundation
import RxSwift
import RxCocoa



class CommonViewModel : NSObject {
    // 네비게이션 타이틀을 위한 드라이버
    
    let title : Driver<String>
    
    
    //Scene coordinator와 저장소를 저장하는 속성 선언
    
    let sceneCoordinator : SceneCoordinatorType
    let storage : MemoStorageType
    //protocol로 선언 의존성을 쉽게 선언 할 수 있다.
    
    init(title : String,sceneCoordinator : SceneCoordinatorType , storage : MemoStorageType ) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
    
    
    
    
    
}
