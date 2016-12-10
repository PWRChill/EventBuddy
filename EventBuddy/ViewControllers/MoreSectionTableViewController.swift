//
//  MoreSectionTableViewController.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 08/12/16.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class MoreSectionTableViewController: UITableViewController {

    var data = [SingularObjectModel]()
    var selectedModel: SingularObjectModel?
    var titleString: String?
    
    private struct Storyboard {
        static let sectionToDetailSegue = "SectionToDetailSegue"
        static let cell = "MoreSectionTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.title = self.titleString
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cell, for: indexPath) as? MoreSectionTableViewCell
        
        cell?.set(singularObjectModel: self.data[indexPath.row])
        
        return cell ?? MoreSectionTableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedModel = self.data[indexPath.row]
        self.performSegue(withIdentifier: Storyboard.sectionToDetailSegue, sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier else { return }
        
        switch id {
        case Storyboard.sectionToDetailSegue:
            if let dvc = segue.destination as? DetailViewController {
                dvc.model = self.selectedModel
            }

        default:
            print("unknown id")
        }
    }
 

}
