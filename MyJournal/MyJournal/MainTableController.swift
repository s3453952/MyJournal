//
//  MainTableController.swift
//  MyJournal
//
//  Created by Yuanqing Jiang on 14/01/2017.
//  Copyright © 2017 LegDay. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class MainTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var curTableView: UITableView!
    let hour:Int = 9
    let minute:Int = 0
    
    var headers: [String] = ["This Week", "Last Month", "Previous Journals"]
    
    override func viewWillAppear(_ animated: Bool) {
        curTableView.reloadData()
        if ReachabilityStatus.isConnected() == false{
            let alert = UIAlertController(title: "No Internet Connection", message: "Please check the network connection", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Notification scheduler (not used in final submission)
        //scheduleNotifiy(hour: hour, minute: minute)

        // Do any additional setup after loading the view, typically from a nib.
            }
    
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.getInstance.journalManager.getJournalEntriesCount()
    }
    
     //headers
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
   }
    
    // cell reuse
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Get Cell from queue
        let cell = tableView.dequeueReusableCell(withIdentifier: "recell", for: indexPath) as! CustomCell

        //Popluate Cell
        let journal = Model.getInstance.journalManager.getJournalEntryByIndex(id: indexPath.item)
        cell.textLabel?.text = journal.date
        cell.detailTextLabel?.text = journal.quote
        cell.journal = journal
       
        
        // add segue identifier
        
        
        return cell
        
    }
    
    //Delete item if removed from model
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if Model.getInstance.journalManager.deleteJournalEntryByIndex(id: indexPath.item)
            {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }            
        }
    }
    
    //Prepare for segue into details view page if cell selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DetailViewSegue"){
            let cell = sender as! CustomCell
            let detailView = segue.destination as! DetailViewController
            detailView.journalDetail = cell.journal
        }
    }

    
    // segue to the detail page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
    //Notification for user to enter journal entry for the day (not used in submission)
    /**
    func scheduleNotifiy(hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = "My Journey"
        content.subtitle = "Good Morning"
        content.body = "Seize the day and never let any moment slip away"
        content.badge = 1
        
        var time = DateComponents()
        time.hour = hour
        time.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: true)
        let requestIdentifier = "MyJournalNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler:{ error in })
    }
 **/
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // dummy generation

    
}
