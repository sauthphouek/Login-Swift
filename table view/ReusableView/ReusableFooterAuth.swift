//
//  ReusableFooterAuth.swift
//  table view
//
//  Created by Sauth.P on 13/5/24.
//

import Foundation


import UIKit

class ReusableFooterAuth: UIView {
    
    let dontHaveAccount = CustomLabel()
    let signUpButton = ReusableTextButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        configure()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        dontHaveAccount.text = "Don't have an account?"
        dontHaveAccount.font = UIFont.systemFont(ofSize: 13)
        dontHaveAccount.textColor = .black
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        self.addSubview(dontHaveAccount)
        self.addSubview(signUpButton)
        
        dontHaveAccount.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

    }
    
    private func setContraints() {
        NSLayoutConstraint.activate([
            dontHaveAccount.topAnchor.constraint(equalTo: self.topAnchor),
            dontHaveAccount.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dontHaveAccount.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: self.topAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: dontHaveAccount.trailingAnchor, constant: 2),
            signUpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @objc private func signUpButtonTapped() {
        print("Sign up button tapped")
    }
    
    
}
