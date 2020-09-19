//
//  ThumbnailCell.swift
//  buen-viaje
//
//  Created by Alexander on 19.09.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
//

import UIKit
import SDWebImage

class ThumbnailCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    func configureCell(url: String) {
        img.layer.cornerRadius = 3.0
        guard let imageUrl = URL(string: url) else { return }
        img.sd_imageIndicator = SDWebImageActivityIndicator.medium
        img.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "Bg_image_01"))
    }
    
}
