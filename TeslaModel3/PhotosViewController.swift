//
//  PhotosViewController.swift
//  TeslaModel3
//
//  Created by Sophia Shaw on 12/7/17.
//  Copyright © 2017 Soph Shaw. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
       
    let photoDataSource = PhotoDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = photoDataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showPhoto"?:
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                let photo = photoDataSource.images[selectedIndexPath.row]
                let destinationVC = segue.destination as! PhotoInfoViewController
                
                destinationVC.image = photo
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }

}
