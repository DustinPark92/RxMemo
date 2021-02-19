//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/18.
//

import UIKit

class MemoDetailViewController: UIViewController,viewModelBindableType {
    
    var viewModel : MemoDetailViewModel!
    
    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx_disposeBag)
        
        viewModel.contents
            .bind(to: listTableView.rx.items) {
                (tableView , row , value) in
                
                
                switch row {
                case 0 :
                    let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell")!
                    cell.textLabel?.text = value
                    return cell
                case 1 :
                    let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell")!
                    cell.textLabel?.text = value
                    return cell
                default:
                    fatalError()
                }
                
            }.disposed(by: rx_disposeBag)
    }
    
}
