//
//  DetailViewController.swift
//  MyJournal
//
//  Created by Yuanqing Jiang on 15/01/2017.
//  Copyright © 2017 LegDay. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var journalObj: Journal = Journal()
    var journalDetail:Journal?
    
   // var journalDetail:String?
    
    @IBOutlet weak var quoteContent: UILabel!
    @IBOutlet weak var journalDateLabel: UILabel!
    
    @IBOutlet weak var noteContent: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
     //   journalDateLabel.text = journalObj.quote
        self.noteContent.text = journalDetail?.note
        self.quoteContent.text = journalDetail?.quote
        // Do any additional setup after loading the view.
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
