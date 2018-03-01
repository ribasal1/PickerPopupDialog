# PickerPopupDialog

[![CI Status](http://img.shields.io/travis/ribasal1/PickerPopupDialog.svg?style=flat)](https://travis-ci.org/ribasal1/PickerPopupDialog)
[![Version](https://img.shields.io/cocoapods/v/PickerPopupDialog.svg?style=flat)](http://cocoapods.org/pods/PickerPopupDialog)
[![License](https://img.shields.io/cocoapods/l/PickerPopupDialog.svg?style=flat)](http://cocoapods.org/pods/PickerPopupDialog)
[![Platform](https://img.shields.io/cocoapods/p/PickerPopupDialog.svg?style=flat)](http://cocoapods.org/pods/PickerPopupDialog)

## Description

PickerPopupDialog is a a popup iOS picker control written in Swift 4. It lets you input any type of data in the format [(Any, String)].

![Sample Video](https://media.giphy.com/media/ZvHpCQGfVNECnnnrXh/giphy.gif)


## Table of Contents

* [Example](#example)
* [Installation](#installation)
* [Usage](#usage)
* [Author](#author)
* [License](#license)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

### CocoaPods

PickerPopupDialog is available through [CocoaPods](http://cocoapods.org).

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift and Objective-C that simplifies the use of 3rd-party
libraries like `PickerPopupDialog` in your projects.

First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod "PickerPopupDialog"
```

Second, install `PickerPopupDialog` into your project:

```bash
pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and
provides you with binary frameworks.

To integrate `PickerPopupDialog` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ruby
github "ribasal1/PickerPopupDialog"
```

Run `carthage update` to build the framework and drag the built `PickerPopupDialog.framework` (in Carthage/Build/iOS folder)
into your Xcode project (Linked Frameworks and Libraries in `Targets`).

### Manually

1. Copy `PickerPopupDialog.swift` into your project
2. That's it

## Usage

Import if you are using Cocoapods

```ruby
import PickerPopupDialog
```

Set the data source, in viewDidLoad for example. It must be of type [(Any, String)]
```ruby
let pickerView = PickerPopupDialog()
let myDataSource : [(Any, String)] = [(1, "First item"),(2, "Second item")]
pickerView.setDataSource(myDataSource)
```
Show the picker and use the selected value
```ruby
pickerView.showDialog("My Title", doneButtonTitle: "Ok", cancelButtonTitle: "cancel") { (result) -> Void in
    //do something with the selected value
    //Value = result.0
    //Text = result.1
    
    //close window
    self.dismiss(animated: true, completion: nil)
}
```

## Author

Alberto Ribas, github@linkmedia.ch

## License

PickerPopupDialog is available under the MIT license. See the LICENSE file for more info.
