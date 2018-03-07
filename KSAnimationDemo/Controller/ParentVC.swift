//
//  ParentVC.swift
//  KSAnimationDemo
//
//  Created by Yudiz on 01/03/18.
//  Copyright © 2018 Yudiz. All rights reserved.
//

import UIKit

//Screen Related
let _screenSize = UIScreen.main.bounds.size
let _screenFrame = UIScreen.main.bounds

//Ratio
var _heightRatio : CGFloat = {
    switch UIDevice.current.userInterfaceIdiom {
    case .pad:
        return _screenSize.height/768
    default:
        return _screenSize.height/667
    }
}()
var _widthRatio : CGFloat = {
    switch UIDevice.current.userInterfaceIdiom {
    case .pad:
        return _screenSize.width/1024
    default:
        return _screenSize.width/375
    }
}()

// ------------------------------------------------------------------------------------------------------------------------------- //

//MARK:- CollectionViewCell
class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgV: UIImageView!
    
    //NSLayoutConstraint
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        constraintUpdate()
    }
    
    // This will update constaints and shrunk it as device screen goes lower.
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * _widthRatio
                const.constant = v2
            }
        }
    }
}

//MARK:- TableViewCell
class TableViewCell: UITableViewCell {
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    //NSLayoutConstraint
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        constraintUpdate()
    }
    
    // This will update constaints and shrunk it as device screen goes lower.
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * _widthRatio
                const.constant = v2
            }
        }
    }
}

// ------------------------------------------------------------------------------------------------------------------------------- //

//MARK:- ParentVC
class ParentVC: UIViewController {
    
    //IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    //NSLayoutConstraint
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?
    
    //Variable Declaration
    var arrImages: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "0", "1", "2", "3", "4", "5", "6", "7", "0", "1", "2", "3", "4", "5", "6", "7", "0", "1", "2", "3", "4", "5", "6", "7", "0", "1", "2", "3", "4", "5", "6", "7", "0", "1", "2", "3", "4", "5", "6", "7", "0", "1", "2", "3", "4", "5", "6", "7", "0", "1", "2", "3", "4", "5", "6", "7"]
    
    //Constant Variable
    let animateTitle = "Animate"
    
    var allAnimation = ["Random All", "Bottom", "Top", "Right", "Left", "Rotate Right", "Rotate Left", "Rotation", "Zoom Out"]
    
    //View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareParentUI()
    }
}

//MARK:- UI Related
extension ParentVC {
    func prepareParentUI() {
        constraintUpdate()
    }
    
    // This will update constaints and shrunk it as device screen goes lower.
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * _widthRatio
                const.constant = v2
            }
        }
        if let vConst = verticalConstraints {
            for const in vConst {
                let v1 = const.constant
                let v2 = v1 * _heightRatio
                const.constant = v2
            }
        }
    }
}

//MARK:- Other Methods
extension ParentVC {
    
    func actionSheetAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
