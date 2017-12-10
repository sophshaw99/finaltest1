//
//  PhotoDataSource.swift
//  TeslaModel3
//
//  Created by Sophia Shaw on 12/7/17.
//  Copyright © 2017 Soph Shaw. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {
    
    var images = [#imageLiteral(resourceName: "tesla1"), #imageLiteral(resourceName: "car3"), #imageLiteral(resourceName: "tesla2"), #imageLiteral(resourceName: "car0"), #imageLiteral(resourceName: "tesla3"), #imageLiteral(resourceName: "tesla4"), #imageLiteral(resourceName: "car1"), #imageLiteral(resourceName: "tesla5"), #imageLiteral(resourceName: "car2"), #imageLiteral(resourceName: "tesla6"), #imageLiteral(resourceName: "tesla7"), #imageLiteral(resourceName: "car4"), #imageLiteral(resourceName: "tesla8"), #imageLiteral(resourceName: "tesla9"), #imageLiteral(resourceName: "car5"), #imageLiteral(resourceName: "tesla10")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "PhotoCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }

    
}
