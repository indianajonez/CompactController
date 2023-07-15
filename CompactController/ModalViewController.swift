//
//  ModalViewController.swift
//  CompactController
//
//  Created by Ekaterina Saveleva on 15.07.2023.
//

import UIKit

class ModalViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var switchButton: UISegmentedControl = {
       let switchButton = UISegmentedControl(items: ["280pt","150pt"])
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.selectedSegmentIndex = 0
        switchButton.tintColor = .black
        switchButton.backgroundColor = .systemGray3
        switchButton.addTarget(self, action: #selector(switchSize(_:)), for: .valueChanged)
        
        return switchButton
    }()
    
    private lazy var closeButton: UIButton = {
    
        let button = UIButton()
        let buttonImageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .large)
        button.tintColor = .systemGray3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle", withConfiguration: buttonImageConfig), for: .normal)
        button.addTarget(self, action: #selector(crossButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        view.backgroundColor = .systemBackground

        view.addSubview(switchButton)
        view.addSubview(closeButton)
        setupConstraits()
    }
    
    // MARK: - Private methods
    
    private func setupConstraits() {
        NSLayoutConstraint.activate([
        
            switchButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            switchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.centerYAnchor.constraint(equalTo: switchButton.centerYAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    @objc private func switchSize(_ sender:UISegmentedControl) {
       
        switch (sender.selectedSegmentIndex) {
        case 0:
            self.preferredContentSize = CGSize(width: 300, height: 280)
        case 1:
            self.preferredContentSize = CGSize(width: 300, height: 150)

        default:
            break
        }
    }
    
    @objc private func crossButton() {
        self.dismiss(animated: true)
    }

}

    // MARK: - ModalViewController

extension ModalViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.1)
    }
}

