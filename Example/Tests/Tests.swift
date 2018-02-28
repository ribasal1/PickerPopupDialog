import UIKit
import XCTest

@testable import PickerPopupDialog

class Tests: XCTestCase {
    
    static var pickerPopupDialog: PickerPopupDialog!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let pickerView = PickerPopupDialog.init()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

}
