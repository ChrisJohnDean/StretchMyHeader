//
//  TableViewCell.swift
//  StretchMyHeader
//
//  Created by Chris Dean on 2018-03-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var headline: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var newsItem: NewsItem? {
        didSet {
            if let item = newsItem {
                category.text = item.category.rawValue
                category.textColor = item.category.toColor()
                headline.text = item.summary
            } else {
                category.text = nil
                headline.text = nil
            }
        }
    }

}
