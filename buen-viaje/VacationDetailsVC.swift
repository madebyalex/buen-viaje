//
//  VacationDetailsVC.swift
//  buen-viaje
//
//  Created by Alexander on 19.09.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
//

import UIKit
import SDWebImage

class VacationDetailsVC: UIViewController {
    
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var airfareLbl: UILabel!
    @IBOutlet weak var numberOfNightsLbl: UILabel!
    @IBOutlet weak var activitiesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var vacation: Vacation!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Package details"
        
        titleLbl.text = vacation.title
        priceLbl.text = "\(vacation.price.formatToCurrencyString())"
        airfareLbl.text = vacation.airfare
        numberOfNightsLbl.text = "\(vacation.numberOfNights) nights"
        descriptionLbl.text = vacation.description
        activitiesLbl.text = vacation.activities
        
        let imageUrl = vacation.images[0]
        if let url = URL(string: imageUrl) {
            
            mainImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            mainImage.sd_setImage(with: url, placeholderImage: UIImage(named: "Bg_image_01"))
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension VacationDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vacation.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbCell", for: indexPath) as! ThumbnailCell
        
        let imageUrl = vacation.images[indexPath.row]
        cell.configureCell(url: imageUrl)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageUrl = vacation.images[indexPath.item]
        if let url = URL(string: imageUrl) {
            
            mainImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            mainImage.sd_setImage(with: url, placeholderImage: UIImage(named: "Bg_image_01"))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 104, height: 64)
    }
    
    
}
