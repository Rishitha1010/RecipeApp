import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("LOGIN", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    let signUpButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("SIGN UP", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 1.5
            button.layer.cornerRadius = 20
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)

            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: 235/255,
            green: 152/255,
            blue: 55/255,
            alpha: 1.0
        )
        view.addSubview(imageView)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        setupConstraints()
        func setupConstraints() {
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 200),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                
               
                loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                loginButton.topAnchor.constraint(equalTo:imageView.bottomAnchor, constant: 100),
                loginButton.heightAnchor.constraint(equalToConstant: 50),
                
                signUpButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
                signUpButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
                signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
                signUpButton.heightAnchor.constraint(equalToConstant: 50)
            ])
            
        }
    }
}
