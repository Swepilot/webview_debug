# webview_debug

A runnable project to demonstrate the issue when using .loadHtmlString to help debugging the issue in https://pub.dev/packages/webview_flutter

This project is using the boilerplate code from `flutter create` combined with the example code from https://pub.dev/packages/webview_flutter.
Added is the option to load either local html or a remote webpage

## Getting Started

1. Run the project on an Android device
2. Tap the "Load local html" button and observe if any text is shown.
   a. If not shown: Simply tap the screen and the text will show (this is the bug)
   b. If shown: Go back and try again. The bug does not replicate every time
3. A "Load flutter.dev" button is provided to show remote webpages always load/display correctly
