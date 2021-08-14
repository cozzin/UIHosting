//
//  TableViewWrapper.swift
//  UIHostingExample
//
//  Created by seongho.hong on 2021/08/14.
//

import UIKit
import SwiftUI
import UIHosting

@available(iOS 14.0, *)
struct TableViewWrapper<Data, Content>: UIViewRepresentable where Content: View {

    typealias UIViewType = UITableView

    final class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        fileprivate var data: [Data]
        private let content: (Data) -> Content
        private var cellHeightsDictionary: [String: CGFloat] = [:]

        init(_ data: [Data], _ content: @escaping (Data) -> Content) {
            self.data = data
            self.content = content
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UIHostingCell", for: indexPath) as! UIHostingCell<Content>
            cell.configure(
                view: content(data[indexPath.row]),
                parent: tableView.parentViewController
            )
            return cell
        }
    }

    private let data: [Data]
    private let content: (Data) -> Content

    init(_ data: [Data], _ content: @escaping (Data) -> Content) {
        self.data = data
        self.content = content
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(data, content)
    }

    func makeUIView(context: Context) -> UIViewType {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.allowsMultipleSelection = true
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UIHostingCell<ExampleSwiftUIRow>.self, forCellReuseIdentifier: "UIHostingCell")
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        return tableView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        context.coordinator.data = data
        uiView.reloadData()
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        sequence(first: self) { $0.next }
            .lazy
            .compactMap { $0 as? UIViewController }
            .first
    }
}
