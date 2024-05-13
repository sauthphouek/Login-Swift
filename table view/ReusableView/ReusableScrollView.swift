//
//  ReusableScrollView.swift
//  table view
//
//  Created by Sauth.P on 11/5/24.
//

import UIKit


class ReusableScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        self.translatesAutoresizingMaskIntoConstraints = false
        // set up contraints
        setupContraint()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupContraint() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.topAnchor),
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
