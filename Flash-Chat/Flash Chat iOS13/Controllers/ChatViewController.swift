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
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        title = Constants.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages() {
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
                
                self.messages = []
                
                if let err = error {
                    print("Cannot read messages: \(err.localizedDescription)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No messages")
                    return
                }
                
                for doc in documents {
                    let data = doc.data()
                    if let messageSender = data[Constants.FStore.senderField] as? String, let messageBody = data[Constants.FStore.bodyField] as? String {
                        let msg = Message(sender: messageSender, body: messageBody)
                        self.messages.append(msg)
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        }
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
            Constants.FStore.bodyField: messageBody,
            Constants.FStore.dateField: Date().timeIntervalSince1970
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
        let currentMessage = messages[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = currentMessage.body

        if currentMessage.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: Constants.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.purple)
            cell.label.textColor = UIColor(named: Constants.BrandColors.lightPurple)
        }
        
        return cell
    }
}
