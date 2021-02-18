//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/18.
//

import UIKit



protocol viewModelBindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
    
    
    
}


//개별 뷰 컨트롤러에서 바인드 뷰모델을 할 필요가 없기 때문에 간결해 진다.
extension viewModelBindableType where Self: UIViewController {
    mutating func bind(viewModel : Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
    
}
