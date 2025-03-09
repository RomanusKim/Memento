//
//  ViewController.swift
//  Memento
//
//  Created by romanus on 3/4/25.
//

import UIKit

class ViewController: UIViewController {

//    var memoArray: [Memo] = []
    var memoDataManager = DataManager()
    
    @IBOutlet weak var memoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTableView.dataSource = self
        memoTableView.delegate = self
        
        title = "Memento"
        
        memoDataManager.makeMemoData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        // to Add
    }
}

extension ViewController: UITableViewDataSource {
    // 몇번씩 호출되는 경우가 있음.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 몇개를 표시할지 데이터의 갯수만큼으로 하는것이 좋다.
        return memoDataManager.getMemoData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoTableViewCell

        let array = memoDataManager.getMemoData()
        let memo = array[indexPath.row]

        cell.titleLabel.text = memo.title
        cell.dateLabel.text = memo.date.description
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    // Cell Select 됐다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //perform segue
        // 다음 화면 이동
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    // 스토리보드로 화면 이동시 항상 prepare 함수로 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // identifier 확인
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! MemoViewController
            
            let array = memoDataManager.getMemoData()
            
            let indexPath = sender as! IndexPath
            
            detailVC.memoData = array[indexPath.row]
        }
    }
    
    
    
}
