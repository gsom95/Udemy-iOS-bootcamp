//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages = [
        Message(sender: "1@2.com", body: "Hi!"),
        Message(sender: "a@b.com", body: "Hello, World!"),
        Message(sender: "1@2.com", body: """
Can you hear me, Major Tom?
There is someone over the garden wall. We need to check.
Proceed with caution. May the Force be with you, my dear friend.
"""),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self

        title = Constants.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        guard let messageSender = Auth.auth().currentUser?.email else {
            print("Cannot get current user")
            return
        }
        
        guard let messageBody = messageTextfield.text else {
            print("No message text")
            return
        }
        
        db.collection(Constants.FStore.collectionName).addDocument(data: [
            Constants.FStore.senderField: messageSender,
            Constants.FStore.bodyField: messageBody
        ]) { (error) in
            if let err = error {
                print("Error adding the document: \(err.localizedDescription)")
                return
            }
            
            print("Document successfully added.")
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        
        return cell
    }
}
