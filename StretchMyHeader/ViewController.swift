//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Chris Dean on 2018-03-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import UIKit

private let kTableHeaderHeight: CGFloat = 250.0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var headerView: UIView!
    let items = [
        NewsItem(category: .world, summary: "Climate change protests, divestments meet fossil fuels realities"),
        NewsItem(category: .europe, summary: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
        NewsItem(category: .middleEast, summary: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
        NewsItem(category: .africa, summary: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
        NewsItem(category: .asiaPacific, summary: "Despite UN ruling, Japan seeks backing for whale hunting"),
        NewsItem(category: .americas, summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
        NewsItem(category: .world, summary: "South Africa in $40 billion deal for Russian nuclear reactors"),
        NewsItem(category: .europe, summary: "'One million babies' created by EU student exchanges")
    ]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
    }

    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.newsItem = item
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

