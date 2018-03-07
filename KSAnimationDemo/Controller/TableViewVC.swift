//
//  TableViewVC.swift
//  KSAnimationDemo
//
//  Created by Yudiz on 01/03/18.
//  Copyright © 2018 Yudiz. All rights reserved.
//

import UIKit

//MARK:- TableViewVC
class TableViewVC: ParentVC {
    
    var tableViewAnimation = ["Random All", "Bottom", "Top", "Right", "Left", "Rotation", "Zoom Out"]
    
    //View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK:- UIButton Actions
extension TableViewVC {
    
    @IBAction func tapBtnAnimate(_ sender: UIBarButtonItem) {
        actionSheetAlert(title: animateTitle, message: nil, actionTitles: tableViewAnimation, actions: [{action1 in
            if action1.title == "Random All" {
                for subViews in self.tableView.visibleCells {
                    subViews.contentView.animationRandom()
                }
            }
            }, {action2 in
                if action2.title == "Bottom" {
                    for subViews in self.tableView.visibleCells {
                        let bottomAnimation = AnimationType.from(direction: .bottom, offSet: 30.0)
                        subViews.contentView.animateAll(withType: [bottomAnimation])
                    }
                }
            }, {action3 in
                if action3.title == "Top" {
                    for subViews in self.tableView.visibleCells {
                        let topAnimation = AnimationType.from(direction: .top, offSet: 30.0)
                        subViews.contentView.animateAll(withType: [topAnimation])
                    }
                }
            }, {action4 in
                if action4.title == "Right" {
                    for subViews in self.tableView.visibleCells {
                        let rightAnimation = AnimationType.from(direction: .right, offSet: 30.0)
                        subViews.contentView.animateAll(withType: [rightAnimation])
                    }
                }
            }, {action5 in
                if action5.title == "Left" {
                    for subViews in self.tableView.visibleCells {
                        let leftAnimation = AnimationType.from(direction: .left, offSet: 30.0)
                        subViews.contentView.animateAll(withType: [leftAnimation])
                    }
                }
            }, {action6 in
                if action6.title == "Rotation" {
                    for subViews in self.tableView.visibleCells {
                        let zoomInAnimation = AnimationType.zoom(scale: -0.3)
                        subViews.contentView.animateAll(withType: [zoomInAnimation])
                    }
                    
                }
            }, {action7 in
                if action7.title == "Zoom Out" {
                    for subViews in self.tableView.visibleCells {
                        let zoomOut = AnimationType.zoom(scale: 0.8)
                        subViews.contentView.animateAll(withType: [zoomOut])
                    }
                }
            }])
        tableView.reloadData()
    }
}

//MARK:- UITableView Delegate and DataSource
extension TableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175 * _widthRatio
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.imgV.image = UIImage(named: arrImages[indexPath.row])
        cell.lbl.text = "Image \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
