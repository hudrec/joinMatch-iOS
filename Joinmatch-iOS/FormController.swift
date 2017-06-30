//
//  ViewController.swift
//  iOSHelloDevs
//
//  Created by Profesores on 5/29/17.
//  Copyright © 2017 UPC. All rights reserved.
//

import UIKit

class FormController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var skillSlider: UISlider!
    @IBOutlet weak var welcomeLabel: UILabel!
    let defaultMessage = "Please write your name. Use the slider to indicate your development skill level. Let's start!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        welcomeLabel.text = defaultMessage
    }
    @IBAction func trashAction(_ sender: UIBarButtonItem) {
        nameTextField.text = ""
        skillSlider.value = 0
        welcomeLabel.text = defaultMessage
    }
    
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let nameParagraph = nameTextField.text!.isEmpty ? "Don't be shy, write your name. " : "Welcome " + nameTextField.text! + "!"
        var skillParagraph: String
        switch skillSlider.value {
        case 0: skillParagraph = "Please share how do you rate your development skill."
        case 50...skillSlider.maximumValue: skillParagraph = "You are a great developer!"
        default: skillParagraph = "You are a rising star!"
        }
        welcomeLabel.text = "\(nameParagraph)\n\(skillParagraph)"
    }
    @IBAction func didEndOnExitAction(_ sender: UITextField) {
        self.view.endEditing(true)
    }
    
}

