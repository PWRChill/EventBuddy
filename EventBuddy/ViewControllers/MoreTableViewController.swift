//
//  MoreTableViewController.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 22.10.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {

    @IBOutlet var searchBar: UISearchBar!

    var data = [GroupModel]()
    var selectedModel: BaseModel? = nil
    private struct Storyboard {
        static let moreToDetailSegue = "MoreToDetailSegue"
        static let moreToSectionSegue = "MoreToSectionSegue"
        static let cell = "MoreTableViewCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self
        self.data = Array(RealmAdapter.fetchModels(GroupModel.self))
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cell, for: indexPath) as? MoreTableViewCell

        cell?.set(groupModel: self.data[indexPath.row])

        return cell ?? MoreTableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedModel = self.data[indexPath.row]
        
        if let _ = self.selectedModel as? GroupModel {
            self.performSegue(withIdentifier: Storyboard.moreToSectionSegue, sender: self)
        } else {
            self.performSegue(withIdentifier: Storyboard.moreToDetailSegue, sender: self)
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let id = segue.identifier else { return }
        
        switch id {
        case Storyboard.moreToDetailSegue:
            if let dvc = segue.destination as? DetailViewController {
                dvc.model = self.selectedModel as? SingularObjectModel
            }
        case Storyboard.moreToSectionSegue:
            if  let dvc = segue.destination as? MoreSectionTableViewController,
                let selectedModel = self.selectedModel as? GroupModel {
                dvc.data = Array(selectedModel.models)
                dvc.titleString = selectedModel.name
            }
        default:
            print("unknown id")
        }
    }
}

extension MoreTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        self.search(for: "")
        self.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.search(for: searchText)
        
    }
    
    private func search(for text: String) {
        
        if text == "" {
            self.data = Array(RealmAdapter.fetchModels(GroupModel.self))
        } else {
            self.data = RealmAdapter.getData(for: text)
        }
        
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
