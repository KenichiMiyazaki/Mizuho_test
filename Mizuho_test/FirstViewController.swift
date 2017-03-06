//
//  FirstViewController.swift
//  Mizuho_test
//
//  Created by Kenichi Miyazaki on 2017/03/06.
//  Copyright © 2017年 Kenichi Miyazaki. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textView1: UITextField!
    @IBOutlet weak var textView2: UITextField!
    @IBOutlet weak var textView3: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapSaveBtn(_ sender: UIButton) {
        let memo = Memo()
        memo.text1 = textView1.text!
        memo.text2 = textView2.text!
        let anss : String = StockMemos.postMemo(memo)
        textView3.text=anss
    }

}

