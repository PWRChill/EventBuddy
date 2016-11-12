//
//  GameViewController.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 09.11.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBAction func scrollViewWasTapped(_ sender: UITapGestureRecognizer) {
    
        let items = Array(RealmAdapter.fetchModels(GroupModel.self).first!.models)
        let index = sender.location(in: self.scrollView).x / self.scrollView.frame.width
        
        self.selectedModel = items[Int(index)]
        
    }
    
    var selectedModel: SingularObjectModel? {
        didSet {
            self.performSegue(withIdentifier: Storyboard.gameToDetailSegue, sender: self)
        }
    }
    
    private struct Storyboard {
        static let gameToDetailSegue = "GameToDetailSegue"
    }
    
    override func viewDidLayoutSubviews() {
        self.setupScrollView()
    }

    private func setupScrollView() {
        
        let items = Array(RealmAdapter.fetchModels(GroupModel.self).first!.models)
        let scrollViewSize = self.scrollView.bounds.size
        let size = CGSize(
            width: scrollViewSize.width,
            height: (self.tabBarController?.tabBar.frame.origin.y)! -
                    (self.navigationController?.navigationBar.frame.origin.y)!)
        
        for (index,item) in items.enumerated() {
            
            let scrollItem = ScrollItemView.scrollItemView(model: item)
            scrollItem.frame = CGRect(origin: CGPoint(x: CGFloat(index)*size.width, y: 0), size: size)
            scrollView.addSubview(scrollItem)
            
        }
        
        scrollView.contentSize = CGSize(width: size.width*CGFloat(items.count), height: size.height)
        scrollView.contentInset = .zero
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
        guard let id = segue.identifier else { return }
        
        switch id {
        case Storyboard.gameToDetailSegue:
            if let dvc = segue.destination as? DetailViewController {
                dvc.model = self.selectedModel
            }
        default:
            print("unknown id")
        }
    }

}
