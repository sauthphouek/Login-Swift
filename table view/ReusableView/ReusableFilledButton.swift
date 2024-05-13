//
//  ReusableButton.swift
//  table view
//
//  Created by Sauth.P on 11/5/24.
//

import UIKit

class ReusableFilledButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBlue
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.heightAnchor.constraint(equalToConstant: 46).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// outline button
class ReusableOutlineButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.borderWidth = 1
        self.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// text button
class ReusableTextButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setTitleColor(.systemBlue, for: .normal)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        // pdding
        self.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
