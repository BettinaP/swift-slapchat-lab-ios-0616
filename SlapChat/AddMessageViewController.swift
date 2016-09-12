//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Bettina on 9/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {
    @IBOutlet weak var messageTextField: UITextField!
    let store = DataStore.sharedDataStore

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        let message = NSEntityDescription.insertNewObjectForEntityForName(Message.entityName, inManagedObjectContext: store.managedObjectContext) as! Message
        message.content = self.messageTextField.text
        message.createdAt = NSDate()
        
        store.saveContext()
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
