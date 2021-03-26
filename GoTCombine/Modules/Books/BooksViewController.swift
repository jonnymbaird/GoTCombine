//
//  BooksViewController.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 19/03/2021.
//

import Foundation
import UIKit
import Combine

class BooksViewController: UIViewController {
    private lazy var contentView = BooksView()
    private let viewModel: BooksViewModel
    private var subscriptions = Set<AnyCancellable>()
    
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
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
    private func setupBindings() {
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = true
    }
}

extension BooksViewController: UITableViewDelegate {
    
}

extension BooksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BooksTableViewCell", for: indexPath)
        return cell
    }
    
    
}
