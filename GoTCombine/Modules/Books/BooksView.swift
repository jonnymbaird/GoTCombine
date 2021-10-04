//
//  BooksView.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 19/03/2021.
//

import Foundation
import UIKit

class BooksView: UIView {
    init() {
        super.init(frame: .zero)
        setupTableView()
        privateInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let backgroundImage: UIImageView = {
        let temp = UIImageView()
        temp.image = UIImage(named: "imgBooks")
        temp.contentMode = .scaleAspectFill
        temp.clipsToBounds = true
        return temp
    }()
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(BooksTableViewCell.self, forCellReuseIdentifier: BooksTableViewCell.reuseIdentifier)
    }
    
    private func privateInit() {
        addSubview(backgroundImage)
        backgroundImage.edgesToSuperview(usingSafeArea: false)

        addSubview(tableView)
        tableView.edgesToSuperview(insets: UIEdgeInsets(
                                    top: UIScreen.main.bounds.height / 3,
                                    left: 0,
                                    bottom: 0,
                                    right: 0),
                                   usingSafeArea: true)
    }
}
