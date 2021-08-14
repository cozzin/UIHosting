//
//  ExampleSwiftUIContent.swift
//  UIHostingExample
//
//  Created by seongho.hong on 2021/08/14.
//

import SwiftUI

@available(iOS 14.0, *)
struct ExampleSwiftUIContent: View {
    
    var body: some View {
        Button("My Button") { }
        
        TableViewWrapper(Array(0..<1000)) { data in
            ExampleSwiftUIRow(count: data)
        }
    }
}
