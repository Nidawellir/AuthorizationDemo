//
//  MainViewController.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import UIKit

final class MainViewController: UIViewController {
     
    // MARK: - Private properties
    
    private let mainView: MainView = .init()
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
}

extension MainViewController {
    private func configureViews() {
        mainView.delegate = self
    }
}

// MARK: - MainViewDelegate

extension MainViewController: MainViewDelegate {
    func didTapExitButton() {
        switch ResetUserManager().execute() {
        default: (UIApplication.shared.delegate as? AppDelegate)?.start()
        }
    }
}
