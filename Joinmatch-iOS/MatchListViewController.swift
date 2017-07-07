//
//  EntriesViewController.swift
//  CarCareOnBoard
//
//  Created by Angel Velasquez on 6/25/17.
//  Copyright © 2017 UPC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class EntryTableViewCell: UITableViewCell {
    

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    
    static func build(cell: EntryTableViewCell, from entry: Entry) -> EntryTableViewCell {
        cell.name.text = "\(entry.name)"
        cell.address.text = "\(entry.address)"
        return cell
    }
}

class Entry {
    var name: String?
    var address: String?
    
}

class MatchListViewController: UITableViewController {
    var entries: [Entry] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //entries = carCareDataStore.findAllFuelUpEntries()
        
        
    }
    
    func getAllEvents() -> [Entry]{
        var entries: [Entry] = []
        let eventsEndPoint = "https://fast-forest-67021.herokuapp.com/api/events/"
        Alamofire.request(eventsEndPoint).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success:
                print("Everything is OK")
                let jsonObject = JSON(response.result.value!)
                if let events = jsonObject.array {
                    for event in events{
                        
                    }
                    
                    
                }
                
                
            case .failure(let error):
                print("\(error)")
            }
        })

        
        return entries;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        entries = self.getAllEvents()
        print(entries.count)
        tableView.reloadData()
        print("Entries count when will appear is \(entries.count)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("Entries count is \(entries.count)")
        return entries.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = EntryTableViewCell.build(
            cell: tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EntryTableViewCell,
            from: self.entries[indexPath.row])
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
  }


