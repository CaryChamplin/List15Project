# Xcode SwiftUI iOS15 List Project

Lists are the staple of many non-game iOS apps. This post describes the SwiftUI and Swift code to implement a favorites list app with rows consisting of type of favorite and the favorite as shown in the demo video.



The example app will have a vertically scrollable list with each row consisting of multiple editable text fields per row (example uses 2 text fields/row), use previous/next buttons to propagate text field focus through the list. In addition, a row can be deleted from the list or moved to a new location within the list by dragging the row. Rows are automatically scrolled into view as the focus is propagated using the previous/next buttons.

SwiftUI for iOS15 brings two key features to list that make coding this example much cleaner: bindable lists and the focus state property wrapper.

See original post at: https://champlintechnologiesllc.com/post-32_swift_ios15_list-project/
