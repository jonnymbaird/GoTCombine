//
//  BooksTableViewCell.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 26/03/2021.
//

import UIKit

class BooksTableViewCell: UITableViewCell {
    
    private let testLabel: UILabel = {
        let temp: UILabel = UILabel()
        temp.text = "Test"
        temp.textColor = .white
        temp.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return temp
    }()
    
    // MARK: - Initialisation
    init() {
        super.init(style: .default, reuseIdentifier: "BooksTableViewCell")
        privateInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            privateInit()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func privateInit() {
        backgroundColor = .clear
        setConstraints()
    }
    
    private func setConstraints() {
        addSubview(testLabel)
        testLabel.edgesToSuperview()
    }
}
