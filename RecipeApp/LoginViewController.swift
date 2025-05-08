//
//  LoginViewController.swift
//  RecipeApp
//
//  Created by West Agile Labs on 08/04/25.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "food")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let separatorLabel: UILabel = {
        let label = UILabel()
        label.text = "Login or signup with"
        label.textColor = .black
        label.font = dynamicFont(ofSize: 0.022, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leftLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rightLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Email"
        textField.layer.borderWidth = 2
        textField.layer.borderColor = appColor.cgColor
        textField.layer.cornerRadius = 8
        textField.font = dynamicFont(ofSize: 0.02)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.3)]
        textField.attributedPlaceholder = NSAttributedString(string: "Enter Your Email", attributes: attributes)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Enter Your Password"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 2
        textField.layer.borderColor = appColor.cgColor
        textField.layer.cornerRadius = 8
        textField.font = dynamicFont(ofSize: 0.02)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.3)]
        textField.attributedPlaceholder = NSAttributedString(string: "Enter Your Password", attributes: attributes)
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = appColor
        button.titleLabel?.font = dynamicFont(ofSize: 0.02, weight: .semibold)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.textColor = .black
        label.font = dynamicFont(ofSize: 0.018, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leftOrLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rightOrLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        let text = "Don't have an account? Sign Up"
        let attributedText = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "Sign Up")
        attributedText.addAttribute(.foregroundColor, value: appColor, range: range)
        label.attributedText = attributedText
        label.font = dynamicFont(ofSize: 0.018)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let googleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "google"), for: .normal)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()

    private let facebookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()

    private let appleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "apple"), for: .normal)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()
    private lazy var socialStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleButton, facebookButton, appleButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(separatorLabel)
        view.addSubview(leftLine)
        view.addSubview(rightLine)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(leftOrLine)
        view.addSubview(orLabel)
        view.addSubview(rightOrLine)
        view.addSubview(signUpLabel)
        view.addSubview(socialStackView)
        
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            separatorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: view.frame.height * 0.02),
            separatorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leftLine.centerYAnchor.constraint(equalTo: separatorLabel.centerYAnchor),
            leftLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leftLine.trailingAnchor.constraint(equalTo: separatorLabel.leadingAnchor, constant: -12),
            leftLine.heightAnchor.constraint(equalToConstant: 1),
            
            rightLine.centerYAnchor.constraint(equalTo: separatorLabel.centerYAnchor),
            rightLine.leadingAnchor.constraint(equalTo: separatorLabel.trailingAnchor, constant: 12),
            rightLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rightLine.heightAnchor.constraint(equalToConstant: 1),
            
            emailTextField.topAnchor.constraint(equalTo: separatorLabel.bottomAnchor, constant: view.frame.height * 0.025),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.065),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: view.frame.height * 0.015),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: view.frame.height * 0.02),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: view.frame.height * 0.02),
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leftOrLine.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            leftOrLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leftOrLine.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -10),
            leftOrLine.heightAnchor.constraint(equalToConstant: 1),
            
            rightOrLine.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            rightOrLine.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 10),
            rightOrLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rightOrLine.heightAnchor.constraint(equalToConstant: 1),
            
            signUpLabel.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: view.frame.height * 0.03),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            googleButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier:0.09),
            googleButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            facebookButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.09),
            facebookButton.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.06),
            appleButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.09),
            appleButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),

            socialStackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: view.frame.height * 0.03),
            socialStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    // MARK: - TextField Highlight
    @objc func handleLogin() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if email.isEmpty {
            showResponsiveAlert(title: "Error", message: "Email field cannot be empty.")
            return
        }
        
        if !isValidEmail(email) {
            showResponsiveAlert(title: "Invalid Email", message: "Please enter a valid email address.")
            return
        }
        
        if password.count < 8 {
            showResponsiveAlert(title: "Error", message: "Password must be at least 8 characters long.")
            return
        }
        
        // All validations passed
        showLoginSuccessPopup()
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }

    
    func showResponsiveAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)

        // Optional: tweak for iPad or dynamic font
        alertController.view.tintColor = appColor
        present(alertController, animated: true)
    }


    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    func showLoginSuccessPopup() {
        let alert = UIAlertController(title: "Success", message: "Login Successful!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            // Clear the fields after acknowledging success
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
            print("User acknowledged login success.")
            
            
            let tableVC = TableViewController()
            self.navigationController?.pushViewController(tableVC, animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }

}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
