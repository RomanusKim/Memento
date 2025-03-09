//
//  DataManager.swift
//  Memento
//
//  Created by romanus on 3/9/25.
//

import Foundation

class DataManager {
    
    // ViewController가 요청하면 배열 리턴
    var memoDataArray: [Memo] = []
    
    func makeMemoData() {
        memoDataArray = [
            Memo(title: "1", content: "A", date: Date.now),
            Memo(title: "2", content: "B", date: Date.now),
            Memo(title: "3", content: "C", date: Date.now)
        ]
    }
    
    func getMemoData() -> [Memo] {
        return memoDataArray
    }
}
