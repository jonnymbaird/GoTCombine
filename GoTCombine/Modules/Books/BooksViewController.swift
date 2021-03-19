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
        view = contentView
        
        setupBindings()
        setupNavBar()
    }
    
    private func setupBindings() {
    }
    
    private func setupNavBar() {
        //navigationController?.navigationBar.isHidden = false
        //navigationController?.navigationBar.isHidden = true
    }
}
