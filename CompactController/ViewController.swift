//
//  ViewController.swift
//  CompactController
//
//  Created by Ekaterina Saveleva on 15.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(presentButton)
        setupConstraits()
    }
    
    // MARK: - Private methods
    
    private func setupConstraits() {
        NSLayoutConstraint.activate([
            
            presentButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            presentButton.heightAnchor.constraint(equalToConstant: 40),
            presentButton.widthAnchor.constraint(equalToConstant: 100),
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
            
        ])
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        
        presentPopUp(sender, sourceRect: sender.bounds)
    }
    
}



    // MARK: - Extension

extension UIViewController {
    func presentPopUp(_ button: UIButton, sourceRect: CGRect) {
        let view = ModalViewController()
        view.popoverPresentationController?.permittedArrowDirections = .up
        view.preferredContentSize = CGSize(width: 300, height: 280)
        view.modalPresentationStyle = .popover

        view.popoverPresentationController?.sourceView = button
        view.popoverPresentationController?.sourceRect = sourceRect
        view.popoverPresentationController?.delegate = view
        self.present(view, animated: true, completion: {
            view.view.superview?.layer.cornerRadius = 4.0
        })
    }
}

