//
//  TextCell.swift
//  ParsingJSON
//
//  Created by Irsyad Ashari on 16/05/24.
//

import UIKit

class TextCell: UITableViewCell {
    private let labelView = UILabel()
    private let paddingSize: Double = 16.0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: paddingSize).isActive = true
        labelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: paddingSize).isActive = true
        labelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: paddingSize).isActive = true
        labelView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: paddingSize).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(textValue: String) {
        labelView.text = textValue
    }
}
