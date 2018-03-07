//
//  CollectionViewVC.swift
//  KSAnimationDemo
//
//  Created by Yudiz on 01/03/18.
//  Copyright © 2018 Yudiz. All rights reserved.
//

import UIKit

//MARK:- CollectionViewVC
class CollectionViewVC: ParentVC {
    
    //View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
}

//MARK:- UI Related
extension CollectionViewVC {
    
    func prepareUI() {
        
    }
}

//MARK:- UIButton Actions
extension CollectionViewVC {
    
    @IBAction func tapBtnAnimate(_ sender: UIBarButtonItem) {
        actionSheetAlert(title: animateTitle, message: nil, actionTitles: allAnimation, actions: [{action1 in
            if action1.title == "Random All" {
                self.collectionView.animationRandom()
            }
        }, {action2 in
            if action2.title == "Bottom" {
                let bottomAnimation = AnimationType.from(direction: .bottom, offSet: 30.0)
                self.collectionView.animateAll(withType: [bottomAnimation])
            }
        }, {action3 in
            if action3.title == "Top" {
                let topAnimation = AnimationType.from(direction: .top, offSet: 30.0)
                self.collectionView.animateAll(withType: [topAnimation])
            }
        }, {action4 in
            if action4.title == "Right" {
                let rightAnimation = AnimationType.from(direction: .right, offSet: 30.0)
                self.collectionView.animateAll(withType: [rightAnimation])
            }
        }, {action5 in
            if action5.title == "Left" {
                let leftAnimation = AnimationType.from(direction: .left, offSet: 30.0)
                self.collectionView.animateAll(withType: [leftAnimation])
            }
        }, {action6 in
            if action6.title == "Rotate Right" {
                let rightAnimation = AnimationType.from(direction: .right, offSet: 30.0)
                let angle = AnimationType.rotate(angle: 0.3)
                self.collectionView.animateAll(withType: [rightAnimation, angle])
            }
        }, {action7 in
            if action7.title == "Rotate Left" {
                let leftAnimation = AnimationType.from(direction: .left, offSet: 30.0)
                let angle = AnimationType.rotate(angle: -0.3)
                self.collectionView.animateAll(withType: [leftAnimation, angle])
            }
        }, {action8 in
            if action8.title == "Rotation" {
                let zoomInAnimation = AnimationType.zoom(scale: -0.3)
                self.collectionView.animateAll(withType: [zoomInAnimation])
            }
        }, {action9 in
            if action9.title == "Zoom Out" {
                let zoomOutAnimation = AnimationType.zoom(scale: 0.3)
                self.collectionView.animateAll(withType: [zoomOutAnimation])
            }
        }])
        collectionView.reloadData()
    }
    
    func zoomInOut() {
        let zoomOutAnimation = AnimationType.zoom(scale: 0.3)
        let angle = AnimationType.from(direction: .bottom, offSet: 30.0)
        self.collectionView.animate(withType: [angle, zoomOutAnimation], reversed: true, initialAlpha: 0.0, finalAlpha: 1.0, delay: 0.1, duration: 0.5, backToOriginalForm: true, completion: {
            //
        })
    }
}

//MARK:- UICollectionView Delegate, FlowDelegate and DataSource
extension CollectionViewVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imgV.image = UIImage(named: arrImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let obj = collectionView.frame.size.width / 3
        return CGSize(width: obj, height: obj)
    }
}
