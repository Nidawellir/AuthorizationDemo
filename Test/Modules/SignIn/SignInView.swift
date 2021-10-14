//
//  SignInView.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func didTapSignInButton(login: String, password: String)
}

final class SignInView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: SignInViewDelegate?
    
    // MARK: - Views properties
    
    private let stackView: UIStackView = .init()
    private let loginTextField: UITextField = .init()
    private let passwordTextField: UITextField = .init()
    private let signInButton: UIButton = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods

extension SignInView {
    private func configureView() {
        backgroundColor = .white
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.backgroundColor = .gray
        loginTextField.layer.cornerRadius = 8
        loginTextField.autocorrectionType = .no
        loginTextField.autocapitalizationType = .none
        
        passwordTextField.backgroundColor = .gray
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.isSecureTextEntry = true

        signInButton.backgroundColor = .green
        signInButton.layer.cornerRadius = 8
        signInButton.setTitle("Войти", for: .normal)
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }
    
    private func configureLayouts() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(signInButton)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            signInButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc
    func didTapSignInButton() {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text,
            !login.isEmpty,
            !password.isEmpty
        else { return }
        
        delegate?.didTapSignInButton(login: login, password: password)
    }
}

