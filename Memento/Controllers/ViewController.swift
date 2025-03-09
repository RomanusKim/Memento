//
//  ViewController.swift
//  Memento
//
//  Created by romanus on 3/4/25.
//

import UIKit

class ViewController: UIViewController {

    var memoArray: [Memo] = []
    var memoDataManager = DataManager()
    
    @IBOutlet weak var memoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.dataSource = self
        
        memoDataManager.makeMemoData()
        memoArray = memoDataManager.getMemoData()
    }
    
}

extension ViewController: UITableViewDataSource {
    // 몇번씩 호출되는 경우가 있음.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 몇개를 표시할지 데이터의 갯수만큼으로 하는것이 좋다.
        return memoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoTableViewCell
        
        cell.setData(memoArray[indexPath.row])
        
        return cell
    }
}
