//
//  BooksViewController.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 19/03/2021.
//

import UIKit
import Combine

typealias DataSource = UITableViewDiffableDataSource<Section, Book>
typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Book>

enum Section {
    case main
}

class BooksViewController: UIViewController {
    private lazy var contentView = BooksView()
    private let viewModel: BooksViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    private lazy var dataSource: DataSource! = nil
    
    init(viewModel: BooksViewModel = BooksViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getBooks()
        
        makeDataSource()
        setupBindings()
        setupNavBar()
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
        contentView.tableView.delegate = self
    }
    
    private func setupBindings() {
        viewModel.books
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: self.applySnapshot)
            .store(in: &subscriptions)
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension BooksViewController: UITableViewDelegate {

}

extension BooksViewController {
    func makeDataSource() {
        let tableView = contentView.tableView
        dataSource = DataSource(
            tableView: tableView,
            cellProvider: { (tableView, indexPath, book) ->
                UITableViewCell? in
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: BooksTableViewCell.reuseIdentifier,
                        for: indexPath) as? BooksTableViewCell else {
                    fatalError("Could not create new Book cell")
                }
                cell.build(with: book.displayModel)
                return cell
            })
    }
    
    func applySnapshot(_ books: [Book]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(books)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
}
