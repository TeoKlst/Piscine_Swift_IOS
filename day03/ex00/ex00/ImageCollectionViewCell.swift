//
//  ImageCollectionViewCell.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/11.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    func setImage(image: Image, activityViewer: UIActivityIndicatorView) {
//        http://CodeToTakeImagesFromAssets
//        pictureImageView.contentMode = .scaleAspectFit
//        pictureImageView.image = image.image
        
        let url = image.url
        downloadImage(from: url, activityView: activityViewer)
        pictureImageView.downloaded(from: image.url)
    }
    
//    func validateIMG(url: URL) {
//        let urlCompare = URL(string: "")!
//        if (url == urlCompare) {
//            let alert = UIAlertController(title: "Error", message: "Failed to load image from web", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
//            self.ImageViewController(alert, animated: true, completion: nil)
//        } else {}
//    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, activityView: UIActivityIndicatorView) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.pictureImageView.image = UIImage(data: data)
                activityView.stopAnimating()
            }
        }
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
