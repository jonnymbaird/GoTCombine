//
//  BooksTableViewCell.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 26/03/2021.
//

import UIKit

class BooksTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let temp: UILabel = UILabel()
        temp.textColor = UIColor(redInt: 255, greenInt: 255, blueInt: 255, alpha: 1)
        temp.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return temp
    }()
    
    private let dateLabel: UILabel = {
        let temp: UILabel = UILabel()
        temp.textColor = UIColor(redInt: 195, greenInt: 202, blueInt: 206, alpha: 0.84)
        temp.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return temp
    }()
    
    private let pagesLabel: UILabel = {
        let temp: UILabel = UILabel()
        temp.textColor = UIColor(redInt: 189, greenInt: 189, blueInt: 189, alpha: 0.8)
        temp.font = UIFont.italicSystemFont(ofSize: 12)
        temp.textAlignment = .right
        return temp
    }()
    
    private let divider: UIView = {
        let temp: UIView = UIView()
        temp.backgroundColor = UIColor(redInt: 228, greenInt: 228, blueInt: 228, alpha: 0.13)
        temp.height(1)
        return temp
    }()
    
    // MARK: - Initialisation
    init() {
        super.init(style: .default, reuseIdentifier: BooksTableViewCell.reuseIdentifier)
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
        selectionStyle = .none
        setConstraints()
    }
    
    private func setConstraints() {
        addSubviews([titleLabel, dateLabel, pagesLabel, divider])
        titleLabel.leftToSuperview(offset: 16, usingSafeArea: true)
        titleLabel.topToSuperview(offset: 12)
        
        dateLabel.topToBottom(of: titleLabel, offset: 4)
        dateLabel.left(to: titleLabel)
        
        pagesLabel.centerY(to: titleLabel)
        pagesLabel.rightToSuperview(offset: -16)
        pagesLabel.width(110)
        
        titleLabel.rightToLeft(of: pagesLabel, priority: .defaultLow)
        
        divider.edgesToSuperview(excluding: .top)
        divider.topToBottom(of: dateLabel, offset: 20)
    }
    
    func build(with book: BookDisplayModel) {
        titleLabel.text = book.name
        dateLabel.text = book.date
        pagesLabel.text = book.numberofPages
    }
}
