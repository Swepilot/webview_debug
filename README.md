# webview_debug

A runnable project to demonstrate the issue when using .loadHtmlString to help debugging an issue possibly related to https://github.com/flutter/flutter/issues/155137

This project is using the boilerplate code from `flutter create` combined with the example code from https://pub.dev/packages/webview_flutter.
Added is the option to load either local html or a remote webpage

## Getting Started

<ol>
   <li>Run the project on an Android device</li>
   <li>Tap the "Load local html" button and observe if any text is shown.</li>
      <ul>If not shown: Simply tap the screen and the text will show (this is the bug)</ul>
      <ul>If shown: Go back and try again. The bug does not replicate every time</ul>
   <li>A "Load flutter.dev" button is provided to show remote webpages always load/display correctly</li>
</ol>
