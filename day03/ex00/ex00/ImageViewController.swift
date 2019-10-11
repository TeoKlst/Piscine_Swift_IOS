//
//  ImageViewController.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/11.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var image: [Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Begin of code")
        
        image = createArray()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
    }
    
    func createArray() -> [Image] {
        
        var tempImage: [Image] = []
        
        let yourImage: UIImage = UIImage(named: "Gull_portrait_ca_usa")!
        
        let urlStringOne = URL(string: "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg")!
        let urlStringTwo = URL(string: "https://mymodernmet.com/wp/wp-content/uploads/2019/03/nat-geo-instagram-photo-contest-large.jpg")!
        let urlStringThree = URL(string: "https://parade.com/wp-content/uploads/2019/07/Apollo_21.jpg")!
        let urlStringFour = URL(string: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/04/24/10/nat-geo-head.jpg")!
        
        let IMGOne = Image(image: yourImage, url: urlStringOne)
        let IMGTwo = Image(image: yourImage, url: urlStringTwo)
        let IMGThree = Image(image: yourImage, url: urlStringThree)
        let IMGFour = Image(image: yourImage, url: urlStringFour)
        
        tempImage.append(IMGOne)
        tempImage.append(IMGTwo)
        tempImage.append(IMGThree)
        tempImage.append(IMGFour)
        
        return tempImage
    }
}

extension ImageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        Getting image from row/cell here
        let images = image[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.color = UIColor.black
        activityIndicator.center = CGPoint(x: cell.contentView.bounds.size.width/2, y: cell.contentView.bounds.size.height/2)
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

//        cell.contentView.addSubview(activityViewer)

        cell.setImage(image: images, activityViewer: activityIndicator)
        
        return cell
    }
}

extension UIActivityIndicatorView {
    func assignColor(_ color: UIColor) {
        style = .large
        self.color = color
    }
}

