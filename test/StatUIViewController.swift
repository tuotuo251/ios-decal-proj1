//
//  StatUIViewController.swift
//  test
//
//  Created by Ziwei Yin on 10/16/16.
//  Copyright © 2016 Ziwei Yin. All rights reserved.
//

import UIKit

class StatUIViewController: UIViewController {
    var numberfinished = 0
    @IBOutlet weak var number: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        number.text = String(numberfinished)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
