//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/18.
//

import Foundation
import RxSwift
import RxCocoa

// 뷰 모델 추가되는 것
// 1. 의존성을 주입하는 생성자.
// 2. 바인딩에 사용되는 프로퍼티와 메소드


class MemoListViewModel : CommonViewModel {
    
    var memoList : Observable<[Memo]> {
        return storage.memoList()
    }
    
    
    
}
