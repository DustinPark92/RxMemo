//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/18.
//

import UIKit

class MemoListViewController: UIViewController,viewModelBindableType {

    var viewModel: MemoListViewModel!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        
    }
    
    
    func bindViewModel() {
        
    }
    


}
