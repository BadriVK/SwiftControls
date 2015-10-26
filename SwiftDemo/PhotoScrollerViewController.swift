//
//  PhotoScrollerViewController.swift
//  SwiftDemo
//
//  Created by Arpit Vishwakarma on 03/09/15.
//  Copyright (c) 2015 Arpit. All rights reserved.
//

import UIKit
import Photos





class PhotoScrollerViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    var index: NSInteger!
    var imagesArray: PHFetchResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.backgroundColor = UIColor.blackColor()
        
        var i: Int
        for i = 0; i < imagesArray.count; i++
        {
            let tmpObject:PHAsset = (imagesArray[i] as? PHAsset)!
            let imageView:UIImageView = UIImageView()
            imageView.image = self.getAssetThumbnail(tmpObject)
            imageView.contentMode = .ScaleAspectFit
            imageView.frame =  CGRect(x:CGFloat(i) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            scrollView.addSubview(imageView)
        }
        
        scrollView.pagingEnabled = true;
        scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * CGFloat(imagesArray.count), scrollView.frame.size.height)
    }
    
    //MARK: - Get image from PHAsset
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.defaultManager()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.synchronous = true
        manager.requestImageForAsset(asset, targetSize: CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT), contentMode: .AspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        
        return thumbnail
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   

}
