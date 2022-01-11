//
//  BaseViewController.swift
//  BaseApplication
//
//  Created by Wac on 24/04/19.
//  Copyright © 2019 Wac. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    var fieldArray = [UITextField]()
    var txtField: UITextField!
    
    // Get only properties
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // Change aspect needs
    }
    
    // MARK: - Helper
    
    // Add gesture recognizer for background
    func hideKeyboardWhileTappedAround() {
        let backgroundGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onBackgroundTap(sender:)))
        self.view.addGestureRecognizer(backgroundGestureRecognizer)
    }
    
    // To add next or done button for number / phone pad
    func addToolBar(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        txtField = textField
        let index = fieldArray.index(of: txtField)
        let doneButton:UIBarButtonItem
        
        if fieldArray.count == 0 {
            doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePressed))
            doneButton.tag = txtField.tag
        } else if index == fieldArray.count-1 {
            doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePressed))
            doneButton.tag = txtField.tag
        }else{
            doneButton = UIBarButtonItem(title: "Next", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePressed))
            doneButton.tag = txtField.tag
        }
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        textField.inputAccessoryView = toolBar
    }
    
    // MARK: - Actions
    
    @objc func onBackgroundTap(sender: UIGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // To dismiss view controller
    @IBAction func dismissView(sender: UIButton) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    // To pop view controller
    @IBAction func popView(sender: UIButton) {
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func donePressed(_ sender: UIBarButtonItem) {
        // can override this func from child class or add a default event for done
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
