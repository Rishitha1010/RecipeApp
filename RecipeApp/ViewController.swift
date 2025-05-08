import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("LOGIN", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 20
        button.titleLabel?.font = dynamicFont(ofSize: 0.02,weight: .semibold)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    private let signUpButton: UIButton = {
            let button = UIButton(type: .system)
        button.setTitle("SIGN UP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 1.5
            button.layer.cornerRadius = 20
        button.titleLabel?.font = dynamicFont(ofSize: 0.02, weight: .semibold)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appColor
        view.addSubview(imageView)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        setupConstraints()
        }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4),
            imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginButton.topAnchor.constraint(equalTo:imageView.bottomAnchor, constant: 100),
            loginButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06),
            
            
            signUpButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signUpButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06)
        ])
        
        loginButton.addTarget(self, action: #selector(LoginButtonAction), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(SignInButtonAction), for: .touchUpInside)

    }
    
    
    
    @objc func LoginButtonAction() {
        let loginScreen = LoginViewController()
        self.navigationController?.pushViewController(loginScreen, animated: true)
    }
    
    @objc func SignInButtonAction(){
        
    }

}
