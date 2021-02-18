//
//  Memo.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/18.
//

import Foundation

//메모 모델 구현
struct Memo : Equatable {
    var content : String
    var insertDate : Date
    var identify : String
    
    init(content : String , insertDate : Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identify = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    
    
    //새로운 메모를 생성
    init(original : Memo , updatedContent: String) {
        self = original
        self.content = updatedContent
        
    }
    
}
