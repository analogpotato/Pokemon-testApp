//
//  CustomCell.swift
//  testApp
//
//  Created by Frank on 6/28/21.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {

    struct Constants {
        static let reuseIdentifer: String = "CustomCell"
    }

    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        return label
    }()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    func setupViews() {
        
        contentView.addSubview(stackView)
       
        stackView.addArrangedSubview(thumbnailView)
        stackView.addArrangedSubview(label)
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        label.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
//        label.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
