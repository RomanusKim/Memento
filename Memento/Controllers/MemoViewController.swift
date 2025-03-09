//
//  MemoViewController.swift
//  Memento
//
//  Created by romanus on 3/9/25.
//

import UIKit

class MemoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var contentTitle: UITextField!
    
    var memoData: Memo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.delegate = self
        contentTitle.delegate = self
     
        setupUI()
    }
    
    
    func setupUI() {
        
        titleLabel.text = memoData?.title
        contentTitle.text = memoData?.content
    }
    
}

extension MemoViewController: UITextFieldDelegate {
    
}
