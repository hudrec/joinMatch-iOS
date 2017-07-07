//
//  FirstViewController.swift
//  Joinmatch-iOS
//
//  Created by Jorge Ríos on 25/06/17.
//  Copyright © 2017 Joinmatch-team. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBAction func editAction(_ sender: UIBarButtonItem) {
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width / 2;
        self.imgProfile.clipsToBounds = true;
        self.imgProfile.layer.borderWidth = 3.0;
        self.imgProfile.layer.borderColor = UIColor.white.cgColor;
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

