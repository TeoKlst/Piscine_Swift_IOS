//
//  DeathListScreenViewController.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/10.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class DeathListScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var deathNotePages: [DeathNotePage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deathNotePages = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createArray() -> [DeathNotePage] {
        
        var tempDeathNote: [DeathNotePage] = []
        
        let page1 = DeathNotePage(name: "Bob", deathreason: "Construction accident")
        let page2 = DeathNotePage(name: "Objective-C", deathreason: "You are looking at the reason")
        let page3 = DeathNotePage(name: "Blizzard Entertainment", deathreason: "'Every Voice Matters'")
        
        tempDeathNote.append(page1)
        tempDeathNote.append(page2)
        tempDeathNote.append(page3)
        
        return tempDeathNote
    }
}

extension DeathListScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deathNotePages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let deathNotePage = deathNotePages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeathNotesCell") as! DeathNotesCell
        
        cell.setCell(deathNotePage: deathNotePage)
        
        return cell
    }
}
