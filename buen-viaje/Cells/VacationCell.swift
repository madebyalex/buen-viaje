//
//  VacationCell.swift
//  buen-viaje
//
//  Created by Alexander on 18.09.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
//

import UIKit
import SDWebImage

class VacationCell: UITableViewCell {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 8)
    }

    func configureCell(vacation: Vacation) {
        titleLbl.text = vacation.title
        priceLbl.text = vacation.price.formatToCurrencyString()
        
        let imageUrl = vacation.images[0]
        if let url = URL(string: imageUrl) {
            
            mainImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            mainImage.sd_setImage(with: url, placeholderImage: UIImage(named: "Bg_image_01"))
        }
        
        
    }
    
}
