//
//  BooksViewController.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 19/03/2021.
//

import Foundation
import UIKit
import Combine

enum Section {
    case main
}

typealias DataSource = UITableViewDiffableDataSource<Section, Book>
typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Book>

class BooksViewController: UIViewController {
    private lazy var contentView = BooksView()
    private let viewModel: BooksViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    private lazy var dataSource = makeDataSource()
    
    init(viewModel: BooksViewModel = BooksViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        setupNavBar()
        applySnapshot(animatingDifferences: false)
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
        contentView.tableView.delegate = self
    }
    
    private func setupBindings() {
        contentView.button.addTarget(self, action: #selector(reload), for: .touchUpInside)
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func reload() {
        applySnapshot()
    }
    
}

extension BooksViewController: UITableViewDelegate {

}

private extension BooksViewController {
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            tableView: contentView.tableView,
            cellProvider: { (tableView, indexPath, book) ->
                UITableViewCell? in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: BooksTableViewCell.reuseIdentifier,
                    for: indexPath) as? BooksTableViewCell
                cell?.build(with: book.displayModel)
                return cell
            })
        return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.books)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
