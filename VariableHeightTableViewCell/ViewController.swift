//
//  ViewController.swift
//  VariableHeightTableViewCell
//
//  Created by Masato Takamura on 2021/11/27.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeight: NSLayoutConstraint!
    //サンプルデータ
    private let memoTextArray: [String] = [
        "メモですメモですメモですメモです",
        "メモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモです",
        "メモです",
        "メモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモです",
        "メモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモですメモです"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTableViewHeight()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CustomTableViewCell.className, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.className)
    }

    ///tableViewの高さ
    private func setupTableViewHeight() {
        let topAndBottomMargin: CGFloat = 8.0 * 2
        var totalTableViewCellHeight: CGFloat = 0
        for text in memoTextArray {
            totalTableViewCellHeight += (memoLabelHeightOnTableViewCell(text: text) + topAndBottomMargin)
        }
        self.tableViewHeight.constant = totalTableViewCellHeight
    }

    ///tableViewのmemoLabelの高さ
    private func memoLabelHeightOnTableViewCell(text: String) -> CGFloat {
        let leadingAndTrailingMargin: CGFloat = 15.48 * 2
        let numberOfHorizontalParts: CGFloat = 4      //水平方向に並んだ部品の数
        let totalPartsSpace: CGFloat = 8.26 * numberOfHorizontalParts     //部品間の距離
        let textWidthRatio: CGFloat = 5 / 11
        let textHeight = text.height(withConstrainedWidth: (view.frame.width - leadingAndTrailingMargin - totalPartsSpace) * textWidthRatio,
                                     font: .systemFont(ofSize: 14, weight: .medium)
        )
        return textHeight
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memoTextArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.className, for: indexPath) as! CustomTableViewCell
        cell.configure(text: memoTextArray[indexPath.row])
        return cell
    }

}

extension ViewController: UITableViewDelegate {

}

