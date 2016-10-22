//
//  MoreTableViewController.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 22.10.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {

    var data = [String:[String]]()
    
    private func getSection(number: Int) -> [String] {
        
        var returnArray = [String]()
        
        switch number {
        case 0:
            returnArray += self.data["Food"] ?? [String]()
        case 1:
            returnArray += self.data["Entertainment"] ?? [String]()
        case 2:
            returnArray += self.data["Sport"] ?? [String]()
        default:
            break
        }

        return returnArray
    }
    private var sections: [String] {

        return ["Food","Entertainment","Sport"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.data["Food"] = ["McDonald", "KFC", "Orient Express", "Sevi Kebab", "Sevi Kepap"]

        self.data["Entertainment"] = ["Cinema City", "Multikino", "Teatr Wspolczesny"]
        self.data["Sport"] = ["Running", "Swimming pool"]
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.getSection(number: section).count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as? MoreTableViewCell

        cell?.placeName.text = self.getSection(number: indexPath.section)[indexPath.row]

        return cell ?? MoreTableViewCell()
    }
 
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreHeaderTableViewCell") as? MoreHeaderTableViewCell
        
        cell?.titleLabel?.text = self.sections[section]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
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
