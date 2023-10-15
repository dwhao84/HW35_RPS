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
    var loginUserNameTextField = UITextField()
    var enteredPlayerName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLoginView ()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        loginUserNameTextField.becomeFirstResponder()
        print("viewDidAppear")
    }


    // Create function for tap loginNameTextField.
    @objc func didTapLoginNameTextField () {
        print("loginNameTextField tapped")
    }
    // Create function for dismiss keyboard.
    @objc func dissmissKeyboard () {
        view.endEditing(true)
    }

// MARK: - Import textField delegate
    func configureTextFieldDelegate () {
        loginUserNameTextField.delegate = self
    }

// MARK: - ConfigureLoginView UI
    func configureLoginView () {

        configureTextFieldDelegate()

        view.backgroundColor = .white

        let cornerRadiusValue = 20.0

        // userLabel
        userLabel.font = UIFont.systemFont(ofSize: 22)
        userLabel.text = "Name:"
        userLabel.textColor = .darkGray
        userLabel.textAlignment = .left
        userLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(userLabel)

        // loginBtn
        loginBtn.configuration = .filled()
        loginBtn.setTitle("Play", for: .normal)
        loginBtn.isUserInteractionEnabled = true
        loginBtn.layer.cornerRadius = cornerRadiusValue 
        loginBtn.clipsToBounds = true
        view.addSubview(loginBtn)

        // loginUserNameTextField
        loginUserNameTextField.placeholder = "Enter your Name"
        loginUserNameTextField.borderStyle = .roundedRect
        loginUserNameTextField.backgroundColor = .systemGray6
        loginUserNameTextField.keyboardType = .default
        loginUserNameTextField.keyboardAppearance = .default
        loginUserNameTextField.layer.cornerRadius = cornerRadiusValue / 4
        loginUserNameTextField.clipsToBounds = true
        loginUserNameTextField.isUserInteractionEnabled = true
        loginUserNameTextField.isEnabled = true
        loginUserNameTextField.keyboardAppearance = .default
        loginUserNameTextField.keyboardType = .default
        view.addSubview(loginUserNameTextField)

        // Add tapGesture for loginUserNameTextField.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapLoginNameTextField))
        loginUserNameTextField.addGestureRecognizer(tapGesture)

        // AutoLayout
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
        // Using GUARD LET to make sure the loginUserNameTextField.text is playerNameLabel & playerNameLabel is not Empty, otherwise return EMPTY.
        guard let playerNameLabel = loginUserNameTextField.text, !playerNameLabel.isEmpty else {
            return
        }
        let gameViewController = GameViewController()
        gameViewController.modalPresentationStyle = .fullScreen
        gameViewController.playerName = playerNameLabel
        present(gameViewController, animated: true)
    }
}

extension LoginUserNameViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginUserNameTextField.resignFirstResponder()
        print("textFieldShouldReturn")
        return true
    }

}
