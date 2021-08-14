//
//  ExampleSwiftUIRow.swift
//  UIHostingExample
//
//  Created by seongho.hong on 2021/08/14.
//

import SwiftUI

@available(iOS 14.0, *)
struct ExampleSwiftUIRow: View {
    let count: Int

    var body: some View {
        Text(String(repeating: "TestRow", count: count))
            .padding()
            .background(Color(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1)
            ))
    }
}

@available(iOS 14.0, *)
struct ExampleSwiftUIRow_Previews: PreviewProvider {
    static var previews: some View {
        ExampleSwiftUIRow(count: 100)
            .previewLayout(.sizeThatFits)
    }
}
