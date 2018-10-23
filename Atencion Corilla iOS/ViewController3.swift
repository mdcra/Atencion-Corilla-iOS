//
//  ViewController3.swift
//  Atencion Corilla iOS
//
//  Created by Maria del Carmen Ramos Alamo on 10/22/18.
//  Copyright © 2018 Maria del Carmen Ramos Alamo. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var ReturnHomeButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func ReturnHomeTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "GoBackHome", sender: self)
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
