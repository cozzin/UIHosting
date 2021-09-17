# UIHosting

## 🚀 Motivation
- Using SwiftUI in UITableViewCell
- [UITableViewCell에서 SwiftUI 사용하기 - SwiftUI와 UIKit을 함께 사용하며 겪은 시행착오](https://medium.com/@hongseongho/uitableviewcell%EC%97%90%EC%84%9C-swiftui-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0-43321a9e9e90)

## 🧰 Setup
1. In your Xcode project, navigate to File > Swift Packages > Add Package Dependancy...
2. Paste the following into the URL field: https://github.com/cozzin/UIHosting

## 🧑‍💻 Usage
```swift
import UIHosting

private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    tableView.register(UIHostingCell<ExampleSwiftUIRow>.self, forCellReuseIdentifier: "UIHostingCell")
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
}()

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "UIHostingCell", for: indexPath) as! UIHostingCell<ExampleSwiftUIRow>
    cell.configure(ExampleSwiftUIRow(count: data[indexPath.row]))
    return cell
}
```
