//
//  UIHostingCell.swift
//  UIHosting
//
//  Created by seongho.hong on 2021/08/14.
//

import UIKit
import SwiftUI

@available(iOS 14.0, *)
public final class HostingCell<Content>: UITableViewCell where Content: View {

    private let hostingController = UIHostingController<Content?>(rootView: nil)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hostingController.view)
        hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func prepareForReuse() {
        super.prepareForReuse()
        
        hostingController.willMove(toParent: nil)
        hostingController.rootView = nil
        hostingController.removeFromParent()
    }
    
    public func configure(view: Content, parent: UIViewController?) {
        parent?.addChild(hostingController)
        hostingController.rootView = view
        hostingController.view.invalidateIntrinsicContentSize()
        hostingController.didMove(toParent: parent)
    }
}
