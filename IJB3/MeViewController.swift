//
//  MeViewController.swift
//  IJB3
//
//  Created by Penn on 17/10/2017.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import Popover

class MeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var popover: Popover!
    
    let menus = ["me", "me2", "me3"]
    
    @IBOutlet weak var more: UIBarButtonItem!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func moreMenu(_ sender: UIBarButtonItem) {
        let startPoint = CGPoint(x: self.view.frame.width - 60, y: 55)

        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false

        let aView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 180))
        aView.addSubview(tableView)
        
        popover = Popover(options: nil, showHandler: nil, dismissHandler: nil)
        popover.show(aView, point: startPoint)
//        let startPoint = CGPoint(x: self.view.frame.width - 60, y: 55)
//        let aView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 180))
//        let popover = Popover(options: nil, showHandler: nil, dismissHandler: nil)
//        popover.show(aView, point: startPoint)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(menus[indexPath.row])
        popover.dismiss()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = menus[(indexPath as NSIndexPath).row]
        
        return cell
    }
}
