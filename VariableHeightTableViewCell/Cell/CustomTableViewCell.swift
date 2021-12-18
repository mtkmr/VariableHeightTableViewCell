//
//  CustomeTableViewCell.swift
//  VariableHeightTableViewCell
//
//  Created by Masato Takamura on 2021/11/27.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    static let className = String(describing: CustomTableViewCell.self)

    @IBOutlet private weak var memoLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        memoLabel.text = nil
    }

    func configure(text: String) {
        memoLabel.text = text
    }
}
