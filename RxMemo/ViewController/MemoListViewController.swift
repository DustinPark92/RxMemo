//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/18.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController,viewModelBindableType {

    var viewModel: MemoListViewModel!
    
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        
    }
    
    
    func bindViewModel() {
        
        listTableView.dataSource = nil
        
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by:rx_disposeBag)
        
        viewModel.memoList
            .bind(to: listTableView.rx.items(cellIdentifier: "cell")) { row, memo, cell in
                cell.textLabel?.text = memo.content
            }.disposed(by: rx_disposeBag)
    }
    


}
