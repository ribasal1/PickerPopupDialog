//
//  ViewController.swift
//  PickerPopupDialog
//
//  Created by ribasal1 on 11/08/2017.
//  

import UIKit
import PickerPopupDialog


class ViewController: UIViewController {
    
    /*typealias arrayAny = (Any, String)*/

    let pickerView = PickerPopupDialog()
    let arrayDataSource : [(Any, String)] = [(1, "First item"),(2, "Second item")]
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        textLabel.text = "No text selected"
        pickerView.setDataSource(arrayDataSource)
        
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        pickerView.showDialog("My Title", doneButtonTitle: "Ok", cancelButtonTitle: "cancel") { (result) -> Void in
            
            self.textLabel.text = "Selected value:\n\n Text:\(result.1)\n Value:\(result.0)"
            
            //close window
            self.dismiss(animated: true, completion: nil)
        }
    }

}

