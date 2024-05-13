//
//  ViewController.swift
//  table view
//
//  Created by Sauth.P on 11/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView =  UIScrollView()
    let containerView = UIView()
    let signInWith = SignInWithContainer()
    let rowSocialAction = RowSocialAction()

    let titleLabel = CustomLabel()
    let subTitle = CustomLabel()
    let userNameTF = CustomTextField()
    let pwTF = CustomTextField()
    let button = ReusableFilledButton()
    let dontHaveAccount = ReusableFooterAuth()
//    var bottomContraint = NSLayoutConstraint()
    
    var stackCircleView = UIStackView()
    

    
    
    let someImageView: UIImageView = {
       let theImageView = UIImageView()
       theImageView.image = UIImage(named: "sticker.png")
       theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
       return theImageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        dontHaveAccount.translatesAutoresizingMaskIntoConstraints = false
        stackCircleView.translatesAutoresizingMaskIntoConstraints = false
        
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        circleView.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        stackCircleView.addArrangedSubview(circleView)
        
        titleLabel.text = "Welcome Back"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        
        subTitle.text = "Please enter your username and password to login to the app. "
        subTitle.font = UIFont.systemFont(ofSize: 14)
        subTitle.numberOfLines = 0
        
        userNameTF.placeholder = "Enter Username"

        pwTF.placeholder = "Enter Password"
        pwTF.isSecureTextEntry = true
        pwTF.enablePasswordToggle()
        
        
        
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .black
        
        signInWith.translatesAutoresizingMaskIntoConstraints = false
        rowSocialAction.translatesAutoresizingMaskIntoConstraints = false
        signInWith.backgroundColor = .systemRed
        
        setUpKeyBoardEvent() // set up keyboard event

        
        
        addSubView()
        self.setupContraints()
    }
    func addSubView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        containerView.addSubview(someImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitle)
        containerView.addSubview(userNameTF)
        containerView.addSubview(pwTF)
        containerView.addSubview(button)
        containerView.addSubview(signInWith)
        containerView.addSubview(rowSocialAction)
        containerView.addSubview(dontHaveAccount)
        view.addSubview(stackCircleView)
    }
    
    // setUpKeyBoardEvent
    func setUpKeyBoardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // click on the view to dismiss the keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        let keyboardFrame = keyboardSize.cgRectValue
        let keyboardHeight = keyboardFrame.height
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInset
        view.layoutIfNeeded()
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
        view.layoutIfNeeded()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    



}

extension ViewController {

    func setupContraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // scroll view  to safe area
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            /// stack view to top -10 and right -40
            stackCircleView.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            stackCircleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            // height 40 and width 40
            stackCircleView.heightAnchor.constraint(equalToConstant: 260),
            stackCircleView.widthAnchor.constraint(equalToConstant: 260),

             
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),


            someImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            someImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            someImageView.widthAnchor.constraint(equalToConstant: 100),
            someImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: someImageView.bottomAnchor, constant: AppSpacing.xLg),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: AppSpacing.large),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -AppSpacing.large),
 
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppSpacing.small),
            subTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: AppSpacing.large),
            subTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -AppSpacing.large),
            
            userNameTF.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: AppSpacing.xLg),
            userNameTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: AppSpacing.large),
            userNameTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -AppSpacing.large),
            

            pwTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: AppSpacing.medium),
            pwTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: AppSpacing.large),
            pwTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:-AppSpacing.large),
            
            button.topAnchor.constraint(equalTo: pwTF.bottomAnchor, constant: AppSpacing.xLg),
            button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: AppSpacing.large),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -AppSpacing.large),
            
            signInWith.topAnchor.constraint(equalTo: button.bottomAnchor, constant: AppSpacing.xLg),
            signInWith.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: AppSpacing.large),
            signInWith.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -AppSpacing.large),
            
            rowSocialAction.topAnchor.constraint(equalTo: signInWith.bottomAnchor, constant: AppSpacing.xLg),
            rowSocialAction.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: AppSpacing.large),
            rowSocialAction.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -AppSpacing.large),
            
            dontHaveAccount.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dontHaveAccount.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -AppSpacing.large),
            dontHaveAccount.topAnchor.constraint(equalTo: rowSocialAction.bottomAnchor, constant: AppSpacing.xLg)
            
            
        ])
        
            
    }
}


class CircleView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
}
