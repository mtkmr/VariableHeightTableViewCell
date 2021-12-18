//
//  String+.swift
//  VariableHeightTableViewCell
//
//  Created by Masato Takamura on 2021/11/27.
//

import UIKit

extension String {
    /// Stringの高さを求める
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [ .font: font], context: nil)

        return ceil(boundingBox.height)
    }

    /// Stringの幅を求める
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
