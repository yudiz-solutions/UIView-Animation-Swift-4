//
//  ViewController.swift
//  KSAnimationDemo
//
//  Created by Yudiz on 26/02/18.
//  Copyright © 2018 Yudiz. All rights reserved.
//

import UIKit

//MARK:- AllViewController
class AllViewController: ParentVC {
    
    //BarButton
    @IBOutlet weak var btnAllView: UIBarButtonItem!
    @IBOutlet weak var btnCollectionView: UIBarButtonItem!
    @IBOutlet weak var btnTableView: UIBarButtonItem!
    
    
    //View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
}

//MARK:- UI Related
extension AllViewController {
    func prepareUI() {
        removeAnimation()
    }
    
    func removeAnimation() {
        
    }
}

//MARK:- UIButton Actions
extension AllViewController {
    
    @IBAction func tapBtnAllView(_ sender: UIBarButtonItem) {
        view.animationRandom()
    }
    
    @IBAction func tapBtnCollectionView(_ sender: UIBarButtonItem) {
        collectionView.animationRandom()
    }
    
    @IBAction func tapBtnTableView(_ sender: UIBarButtonItem) {
        let offset = AnimationType.from(direction: .bottom, offSet: 30.0)
        tableView.animateAll(withType: [offset])
    }
}

//MARK:- UITableView Delegate and DataSource
extension AllViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.imgV.image = UIImage(named: arrImages[indexPath.row])
        cell.lbl.text = "Image"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK:- UICollectionView Delegate, FlowDelegate and DataSource
extension AllViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        let obj = collectionView.frame.size.width / 4
        return CGSize(width: obj, height: obj)
    }
}
