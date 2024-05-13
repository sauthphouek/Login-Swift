//
//  CustomLabel.swift
//  table view
//
//  Created by Sauth.P on 11/5/24.
//

import UIKit

class CustomLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 16)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
