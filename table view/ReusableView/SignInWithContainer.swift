//
//  SignInWithContainer.swift
//  table view
//
//  Created by Sauth.P on 13/5/24.
//

import Foundation
import UIKit

class SignInWithContainer: UIView {
    
    let orSignInWith = CustomLabel()
    let line1 = UIView()
    let line2 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        orSignInWith.text = "or sign in with"
        orSignInWith.font = UIFont.systemFont(ofSize: 14)
        orSignInWith.textColor = .black
        
        line1.backgroundColor = .systemGray
        line2.backgroundColor = .systemGray
        
        self.addSubview(orSignInWith)
        self.addSubview(line1)
        self.addSubview(line2)
        
        orSignInWith.translatesAutoresizingMaskIntoConstraints = false
        line1.translatesAutoresizingMaskIntoConstraints = false
        line2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            line1.centerYAnchor.constraint(equalTo: orSignInWith.centerYAnchor),
            line1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            line1.trailingAnchor.constraint(equalTo: orSignInWith.leadingAnchor, constant: -AppSpacing.large),
            line1.heightAnchor.constraint(equalToConstant: 0.8),
            
            orSignInWith.topAnchor.constraint(equalTo: self.bottomAnchor, constant: AppSpacing.large),
            orSignInWith.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            orSignInWith.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            orSignInWith.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: AppSpacing.large),
            
            line2.centerYAnchor.constraint(equalTo: orSignInWith.centerYAnchor),
            line2.leadingAnchor.constraint(equalTo: orSignInWith.trailingAnchor, constant: AppSpacing.large),
            line2.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            line2.heightAnchor.constraint(equalToConstant: 0.8),
            
      ])
    }
}


class RowSocialAction: UIView {
        
        let googleButton = ReusableOutlineButton()
        let facebookButton = ReusableOutlineButton()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configure() {
            googleButton.setTitle("Google", for: .normal)
            googleButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            googleButton.setImage(UIImage(named: "google"), for: .normal)
            googleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: AppSpacing.medium)
        
            facebookButton.setTitle("Facebook", for: .normal)
            facebookButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            facebookButton.setImage(UIImage(named: "facebook"), for: .normal)
            facebookButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: AppSpacing.medium)
            // set image width
            facebookButton.imageView?.widthAnchor.constraint(equalToConstant: 20).isActive = true
            facebookButton.imageView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            self.addSubview(googleButton)
            self.addSubview(facebookButton)
            
            googleButton.translatesAutoresizingMaskIntoConstraints = false
            facebookButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                googleButton.topAnchor.constraint(equalTo: self.topAnchor),
                googleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                googleButton.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -AppSpacing.medium),
                googleButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                
                facebookButton.topAnchor.constraint(equalTo: self.topAnchor),
                facebookButton.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: AppSpacing.medium),
                facebookButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                facebookButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
        }
}
