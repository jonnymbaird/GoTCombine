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
        privateInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let hello: UILabel = {
        let temp: UILabel = UILabel()
        temp.text = "Hello World"
        temp.textColor = .white
        temp.font = .boldSystemFont(ofSize: 20)
        return temp
    }()
    
    private func privateInit() {
        addSubview(hello)
        hello.centerInSuperview()
    }
}
