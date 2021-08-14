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
        
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("present example hostingController", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc
    private func onTapButton() {
        let controller = UIHostingController(rootView: ExampleSwiftUIContent())
        present(controller, animated: true)
    }
}
