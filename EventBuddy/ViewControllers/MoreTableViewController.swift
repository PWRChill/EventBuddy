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
    
    var selectedSection: Int? {
        didSet {
         
            if  let selectedSection = self.selectedSection,
                oldValue == selectedSection {
                
                self.selectedSection = nil
            
            }
            
            self.tableView.reloadData()
        }
    }
    
    var selectedModel: SingularObjectModel? {
        didSet {
            self.performSegue(withIdentifier: Storyboard.moreToDetailSegue, sender: self)
        }
    }
    
    private struct Storyboard {
        static let moreToDetailSegue = "MoreToDetailSegue"
        static let cell = "MoreTableViewCell"
        static let header = "MoreHeaderTableViewCell"
    }
    
    private func getSection(number: Int) -> [SingularObjectModel] {
        
        return Array(self.data[number].models)
    }

    private func getSectionNumber(for sectionTitle: String) -> Int? {
        
        for (index,groupModel) in self.data.enumerated() {
            if groupModel.name == sectionTitle {
                return index
            }
        }

        return nil
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data = Array(RealmAdapter.fetchModels(GroupModel.self))
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let selectedSection = self.selectedSection,
            selectedSection == section {
            
            return self.getSection(number: section).count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cell, for: indexPath) as? MoreTableViewCell

        cell?.placeName.text = self.getSection(number: indexPath.section)[indexPath.row].name

        return cell ?? MoreTableViewCell()
    }
 
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.header) as? MoreHeaderTableViewCell
        
        cell?.sectionTitleButton.setTitle(self.data[section].name, for: .normal)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    @IBAction func sectionHeaderWasPressed(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        self.selectedSection = self.getSectionNumber(for: buttonTitle)

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedModel = self.data[indexPath.section].models[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let id = segue.identifier else { return }
        
        switch id {
        case Storyboard.moreToDetailSegue:
            if let dvc = segue.destination as? DetailViewController {
                dvc.model = self.selectedModel
            }
        default:
            print("unknown id")
        }
    }
}

extension MoreTableViewController: UISearchBarDelegate {
    
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
    
}
