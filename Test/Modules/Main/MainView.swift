//
//  MainView.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func didTapExitButton()
}

final class MainView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: MainViewDelegate?
    
    // MARK: - View properties
    
    private let exitButton: UIButton = .init()
    
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

extension MainView {
    private func configureView() {
        backgroundColor = .white
        
        exitButton.backgroundColor = .green
        exitButton.layer.cornerRadius = 8
        exitButton.setTitle("Выйти", for: .normal)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
    }
    
    private func configureLayouts() {
        addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            exitButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            exitButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            exitButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            exitButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc
    private func didTapExitButton() {
        delegate?.didTapExitButton()
    }
}
