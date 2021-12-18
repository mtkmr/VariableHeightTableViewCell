//
//  UILabel+.swift
//  VariableHeightTableViewCell
//
//  Created by Masato Takamura on 2021/11/27.
//

import UIKit

extension UILabel {
    func lineNumber() -> Int {
        let oneLineRect  =  "a".boundingRect(
            with: self.bounds.size,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: self.font ?? UIFont()],
            context: nil
        )
        let boundingRect = (self.text ?? "").boundingRect(
            with: self.bounds.size,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: self.font ?? UIFont()],
            context: nil
        )

        return Int(boundingRect.height / oneLineRect.height)
    }
}
