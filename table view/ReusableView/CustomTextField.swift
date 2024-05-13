import UIKit

// ReusableTextField.swift
class CustomTextField: UITextField {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }

  private func configure() {
    self.textColor = .black
    self.font = UIFont.systemFont(ofSize: 14)
    self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    self.layer.cornerRadius = 8
    self.layer.borderWidth = 1
      self.layer.borderColor = UIColor.systemGray4.cgColor
    
    let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    self.leftView = padding
    self.leftViewMode = .always
    self.rightView = padding
    self.rightViewMode = .always
    self.translatesAutoresizingMaskIntoConstraints = false
      
  }
    
    // when focus is on the text field
    override func becomeFirstResponder() -> Bool {
        self.layer.borderColor = UIColor.systemBlue.cgColor
        return super.becomeFirstResponder()
    }
    
    // when focus is off the text field
    override func resignFirstResponder() -> Bool {
        self.layer.borderColor = UIColor.systemGray.cgColor
        return super.resignFirstResponder()
    }
    
    // when the text field is disabled
    override var isEnabled: Bool {
        didSet {
            self.layer.borderColor = isEnabled ? UIColor.systemGray.cgColor : UIColor.systemRed.cgColor
        }
    }
    
    // when the text field is selected
    override var isSelected: Bool {
        didSet {
            self.layer.borderColor = isSelected ? UIColor.systemBlue.cgColor : UIColor.systemGray.cgColor
        }
    }
    
}


extension UITextField {
    
    // set password toggle image
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .regular)
            if (isSecureTextEntry) {
                let eyeIcon = UIImage(systemName: "eye.slash", withConfiguration: configuration)
                button.setImage(eyeIcon, for: .normal)
            } else {
                let eyeIcon = UIImage(systemName: "eye", withConfiguration: configuration)
                button.setImage(eyeIcon, for: .normal)
            }
    
    }

    // enable password toggle
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.tintColor = .systemGray

        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
        
    }
    
    // toggle password visibility
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}
