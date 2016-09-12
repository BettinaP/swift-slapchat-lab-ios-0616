//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var localMessages = [Message]()
    let store = DataStore.sharedDataStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
        store.fetchData()
        self.tableView.reloadData()
        
        self.localMessages = self.store.messages
        print("messages being passed from store: \(self.localMessages)")

        if localMessages.count == 0 {
            generateTestData()
            self.localMessages = store.messages
            print("messages being passed from store if array is empty:\(self.localMessages)")
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        store.fetchData()
        self.localMessages = store.messages
        self.tableView.reloadData()
    }
    
    
    
    func generateTestData() {
        let message1 = NSEntityDescription.insertNewObjectForEntityForName(Message.entityName, inManagedObjectContext: store.managedObjectContext) as! Message
        message1.content = "Bettina"
        message1.createdAt = NSDate()
        
        let message2 = NSEntityDescription.insertNewObjectForEntityForName(Message.entityName, inManagedObjectContext: store.managedObjectContext) as! Message
        message2.content = "Erica"
        message2.createdAt = NSDate()
        
        
        let message3 = NSEntityDescription.insertNewObjectForEntityForName(Message.entityName, inManagedObjectContext: store.managedObjectContext) as! Message
        message3.content = "Susan"
        message3.createdAt = NSDate()
        
        store.saveContext()
        store.fetchData()
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        return store.messages.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath) 
        
        cell.textLabel!.text = self.localMessages[indexPath.row].content
        
        return cell
    }
    
}
