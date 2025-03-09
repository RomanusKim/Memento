//
//  MemoTableViewCell.swift
//  Memento
//
//  Created by romanus on 3/9/25.
//

import UIKit

class MemoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // 상세보기 화면으로 이동시키기
    }

    func setData(_ memo: Memo) {
        titleLabel.text = memo.title
        dateLabel.text = memo.date.description
    }
}
