//
//  UITableVIew+Ext.swift
//  ParsingJSON
//
//  Created by Irsyad Ashari on 16/05/24.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

