
//
//  PickerPopupDialog.swift
//  PickerPopupDialog
//
//  Created by Alberto Ribas on 08.11.17.
//

import UIKit

public class PickerPopupDialog: UIView,UIPickerViewDataSource, UIPickerViewDelegate {
    /* defaults  */
    public typealias anyStringType = (Any, String)
    public typealias PickerPopupCompletion = (_ result: anyStringType) -> Void
    
    fileprivate let titleHeight: CGFloat = 30
    fileprivate let buttonHeight: CGFloat = 50
    fileprivate let doneButtonTag: Int = 1
    fileprivate var dialogView:   UIView!
    fileprivate var titleLabel:   UILabel!
    fileprivate var pickerView: UIPickerView!
    fileprivate var cancelButton: UIButton!
    fileprivate var doneButton:   UIButton!
    
    
    /* picker styling*/
    fileprivate let pickerBackgroundColor: UIColor = UIColor.white
    fileprivate let pickerBorderColor: CGColor = UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0).cgColor
    
    /* Text Styling */
    fileprivate let titleLabelColor: UIColor = UIColor.darkGray
    fileprivate let doneButtonColor: UIColor = UIView().tintColor
    fileprivate let cancelButtonColor: UIColor = UIColor.red
    fileprivate let titleLabelFont:  UIFont = UIFont.systemFont(ofSize: 16)
    fileprivate let doneButtonFont:  UIFont = UIFont.systemFont(ofSize: 15)
    fileprivate let cancelButtonFont:  UIFont = UIFont.systemFont(ofSize: 14)
    
    // callback
    fileprivate var callback: PickerPopupCompletion?
    
    // data
    
    fileprivate var pickerValues: [anyStringType]!
    fileprivate var selectedValue: anyStringType?
    
    // MARK: - Init
    override init(frame: CGRect){
        super.init(frame: frame)
        initView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    fileprivate func initView() {
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        self.dialogView = createDialogView()
        self.addSubview(self.dialogView!)
    }
    
    @objc fileprivate func createDialogView() -> UIView {
        
        let dialogSize = CGSize(width: 300, height: 250 + buttonHeight)
        
        let dialogContainer = UIView(frame: CGRect(x: (self.frame.size.width - dialogSize.width) / 2, y: (self.frame.size.height - dialogSize.height) / 2, width: dialogSize.width, height: dialogSize.height))
        
        dialogContainer.backgroundColor = pickerBackgroundColor
        dialogContainer.layer.shouldRasterize = true
        dialogContainer.layer.rasterizationScale = UIScreen.main.scale
        dialogContainer.layer.cornerRadius = 7
        dialogContainer.layer.borderColor = pickerBorderColor
        dialogContainer.layer.borderWidth = 1
        dialogContainer.layer.shadowRadius = 12
        dialogContainer.layer.shadowOpacity = 0.1
        dialogContainer.layer.shadowOffset = CGSize(width: -6, height: -6)
        dialogContainer.layer.shadowColor = UIColor.black.cgColor
        dialogContainer.layer.shadowPath = UIBezierPath(roundedRect: dialogContainer.bounds, cornerRadius: dialogContainer.layer.cornerRadius).cgPath
        
        //Title
        self.titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 280, height: titleHeight))
        self.titleLabel.textColor = titleLabelColor
        
        self.titleLabel.textAlignment = NSTextAlignment.center
        self.titleLabel.font = titleLabelFont
        dialogContainer.addSubview(self.titleLabel)
        
        // PickerView
        pickerView = UIPickerView.init(frame: CGRect(x: 0, y: titleHeight, width: dialogSize.width, height: dialogSize.height - buttonHeight - 10))
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        dialogContainer.addSubview(pickerView)
        
        // Line
        let lineView = UIView(frame: CGRect(x: 0, y: dialogContainer.bounds.size.height - buttonHeight, width: dialogContainer.bounds.size.width, height: 1))
        lineView.backgroundColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        dialogContainer.addSubview(lineView)
        
        // Button
        let buttonWidth = dialogContainer.bounds.size.width / 2
        
        self.cancelButton = UIButton(type: UIButtonType.custom) as UIButton
        self.cancelButton.frame = CGRect(x: 0, y: dialogContainer.bounds.size.height - buttonHeight, width: buttonWidth, height: buttonHeight)
        self.cancelButton.setTitleColor(cancelButtonColor, for: UIControlState())
        self.cancelButton.setTitleColor(cancelButtonColor, for: UIControlState.highlighted)
        self.cancelButton.titleLabel!.font =  cancelButtonFont
        self.cancelButton.layer.cornerRadius = 7
        self.cancelButton.addTarget(self, action: #selector(PickerPopupDialog.clickButton(_:)), for: UIControlEvents.touchUpInside)
        dialogContainer.addSubview(self.cancelButton)
        
        self.doneButton = UIButton(type: UIButtonType.custom) as UIButton
        self.doneButton.tag = doneButtonTag
        self.doneButton.frame = CGRect(x: buttonWidth, y: dialogContainer.bounds.size.height - buttonHeight, width: buttonWidth, height: buttonHeight)
        self.doneButton.setTitleColor(doneButtonColor, for: UIControlState())
        self.doneButton.setTitleColor(doneButtonColor, for: UIControlState.highlighted)
        self.doneButton.titleLabel!.font = doneButtonFont
        self.doneButton.layer.cornerRadius = 7
        self.doneButton.addTarget(self, action: #selector(PickerPopupDialog.clickButton(_:)), for: UIControlEvents.touchUpInside)
        dialogContainer.addSubview(self.doneButton)
        
        self.doneButton.setTitle("OK", for: UIControlState())
        self.cancelButton.setTitle("Cancel", for: UIControlState())
        
        return dialogContainer
    }
    
    // MARK: public func
    public func setDataSource(_ source: [anyStringType]) {
        
        self.pickerValues = source
        
        selectedValue = self.pickerValues[0]
    }
    
    func selectRow(_ row: Int) {
        
        self.selectedValue = self.pickerValues[row]
        
        self.pickerView.selectRow(row, inComponent: 0, animated: true)
    }
    
    public func showDialog(_ title: String, doneButtonTitle: String = "OK", cancelButtonTitle: String = "Cancel", callback: @escaping PickerPopupCompletion) {
        
        self.titleLabel.text = title
        self.doneButton.setTitle(doneButtonTitle, for: UIControlState())
        self.cancelButton.setTitle(cancelButtonTitle, for: UIControlState())
        self.callback = callback
        
        UIApplication.shared.windows.first!.addSubview(self)
        UIApplication.shared.windows.first!.endEditing(true)
        
        // Animation
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        self.dialogView!.layer.opacity = 0.5
        self.dialogView!.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: UIViewAnimationOptions.curveEaseInOut,
            animations: { () -> Void in
                self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
                self.dialogView!.layer.opacity = 1
                self.dialogView!.layer.transform = CATransform3DMakeScale(1, 1, 1)
        },
            completion: nil
        )
    }
    
    func close() {
        
        // Animation
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: UIViewAnimationOptions(),
            animations: { () -> Void in
                self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
                self.dialogView!.layer.opacity = 0.1
                self.dialogView!.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        }) { (finished: Bool) -> Void in
            
            self.removeFromSuperview()
        }
    }
    
    // MARK: Button Event
    @objc func clickButton(_ sender: UIButton!) {
        if sender.tag == doneButtonTag {
            
            self.callback?(selectedValue!)
        }
        
        close()
    }
    
    // MARK: - Picker Delegates
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return pickerValues.count == 0 ? 0 : 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedValue = self.pickerValues[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerValues.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.pickerValues[row].1
    }
    
}

