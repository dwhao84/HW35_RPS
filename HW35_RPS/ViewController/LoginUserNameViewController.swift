//
//  LoginNameViewController.swift
//  HW35_RPSGame
//
//  Created by Dawei Hao on 2023/10/8.
//

import UIKit

class LoginUserNameViewController: UIViewController {

    let userLabel = UILabel()

    let loginBtn = UIButton(type: .custom)

    let loginUserNameTextField = UITextField()

    var enteredPlayerName: String?


    override func viewDidLoad() {
        super.viewDidLoad()

        configureLoginView()
    }


    func configureLoginView () {
        view.backgroundColor = .white

        userLabel.font = UIFont.systemFont(ofSize: 22)
        userLabel.text = "Name:"
        userLabel.textColor = .darkGray
        userLabel.textAlignment = .left
        userLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(userLabel)

        let btnHeight = 15
        loginBtn.configuration = .filled()
        loginBtn.setTitle("Play", for: .normal)
        loginBtn.isUserInteractionEnabled = true
        loginBtn.layer.cornerRadius = CGFloat(btnHeight / 2)
        loginBtn.clipsToBounds = true
        view.addSubview(loginBtn)


        loginUserNameTextField.delegate = self

        loginUserNameTextField.placeholder = "Enter your Name"
        loginUserNameTextField.borderStyle = .roundedRect
        loginUserNameTextField.backgroundColor = .systemGray6
        loginUserNameTextField.keyboardType = .default
        loginUserNameTextField.keyboardAppearance = .default
        view.addSubview(loginUserNameTextField)

        userLabel.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginUserNameTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
                userLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
                userLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),

                loginUserNameTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 20),
                loginUserNameTextField.leadingAnchor.constraint(equalTo: userLabel.leadingAnchor),
                loginUserNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                loginUserNameTextField.heightAnchor.constraint(equalToConstant: 44), // Standard touch target size

                loginBtn.topAnchor.constraint(equalTo: loginUserNameTextField.bottomAnchor, constant: 20),
                loginBtn.leadingAnchor.constraint(equalTo: loginUserNameTextField.leadingAnchor),
                loginBtn.trailingAnchor.constraint(equalTo: loginUserNameTextField.trailingAnchor),
                loginBtn.heightAnchor.constraint(equalToConstant: 44) // Standard button height
            ])

        loginBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
    }

    @objc func loginBtnTapped () {
        let gameVC = GameViewController()
        let navVC = UINavigationController(rootViewController: gameVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        }

}


extension LoginUserNameViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
