//
//  TableViewCell.swift
//  testApp
//
//  Created by Frank on 6/27/21.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {

    struct Constants {
        static let reuseIdentifier = "TableViewCell"
    }

    let label: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
