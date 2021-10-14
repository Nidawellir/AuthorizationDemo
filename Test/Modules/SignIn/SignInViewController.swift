//
//  SignInViewController.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import UIKit

final class SignInViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let signInManager: SignInManager = .init()
    private let signInView: SignInView = .init()
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        view = signInView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
}

// MARK: - Private methods

extension SignInViewController {
    private func configureViews() {
        signInView.delegate = self
    }
}

// MARK: - SignInViewDelegate

extension SignInViewController: SignInViewDelegate {
    func didTapSignInButton(login: String, password: String) {
        switch signInManager.execute(login: login, password: password) {
        case .success:
            (UIApplication.shared.delegate as? AppDelegate)?.start()
        case let .failure(error):
            print(error)
        }
    }
}
