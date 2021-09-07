//
//  ViewController.swift
//  UIHostingExample
//
//  Created by seongho.hong on 2021/08/14.
//

import UIKit
import UIHosting
import SwiftUI

final class ViewController: UIViewController {
    
    private lazy var vStack: UIStackView = {
        let vStack: UIStackView = UIStackView(frame: .zero)
        vStack.axis = .vertical
        return vStack
    }()
    
    private lazy var presentHostingControllerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Present HostingController", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(onTapHostingControllerButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var presentViewControllerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Present ViewController", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(onTapViewControllerButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(vStack)
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        vStack.addArrangedSubview(presentHostingControllerButton)
        vStack.addArrangedSubview(presentViewControllerButton)
    }
    
    @objc
    private func onTapHostingControllerButton() {
        let controller = UIHostingController(rootView: ExampleSwiftUIContent())
        present(controller, animated: true)
    }
    
    @objc
    private func onTapViewControllerButton() {
        let controller = TableViewController()
        present(controller, animated: true)
    }
}
