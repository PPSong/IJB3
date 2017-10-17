//
//  MeViewController.swift
//  IJB3
//
//  Created by Penn on 17/10/2017.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import Popover
import SnapKit

class MeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var popover: Popover!
    
    let menus = ["me", "me2", "logout"]
    
    @IBOutlet weak var more: UIBarButtonItem!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func moreMenu(_ sender: UIBarButtonItem) {
        
        let startPoint = CGPoint(x: self.view.frame.width - 30, y: 67)

        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none

        let aView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 180))
        aView.addSubview(tableView)
        
        tableView.snp.makeConstraints { (m) in
            m.width.equalToSuperview()
            m.height.equalToSuperview().offset(-18)
            m.top.equalToSuperview().offset(18)
            m.left.equalToSuperview()
        }
        
        popover = Popover(options: nil, showHandler: nil, dismissHandler: nil)
        popover.show(aView, point: startPoint)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        popover.dismiss()
        print(menus[indexPath.row])
        switch indexPath.row {
        case 2:
            logout()
        default:
            print("nothing to do")
        }
    }
    
    func logout() {
        dismiss(animated: true, completion: nil)
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
