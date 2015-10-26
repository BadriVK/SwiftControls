//
//  CollectionViewController.swift
//  SwiftDemo
//
//  Created by Arpit Vishwakarma on 02/09/15.
//  Copyright (c) 2015 Arpit. All rights reserved.
//

import UIKit
import Photos

class CollectionViewController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: - UIView Lifecycles

    var images: PHFetchResult!
    let imageManager = PHCachingImageManager()
    var imageCacheController: ImageCacheController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        images = PHAsset.fetchAssetsWithMediaType(.Image, options: nil)
        imageCacheController = ImageCacheController(imageManager: imageManager, images: images, preheatSize: 1)
        //PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)

        self.title = "UICollectionView"
        
        // Do any additional setup after loading the view.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 2, left:2, bottom: 2, right: 2)
        layout.itemSize = CGSize(width: (UIScreen.mainScreen().bounds.width/3.23), height: 120)
        
        collectionView.collectionViewLayout = layout;
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UICollectionView DataSources
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) 
        // Configure the cell
        let tmpObject:PHAsset = (images[indexPath.item] as? PHAsset)!
        let image:UIImage = self.getAssetThumbnail(tmpObject)
        let imageView:UIImageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGrayColor()
        imageView.image = image
        imageView.frame = CGRectMake(0, 0, cell.frame.width, cell.frame.height)
        cell.contentView.addSubview(imageView)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
       
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        //var controller = storyboard.instantiateViewControllerWithIdentifier("PhotoScrollerViewController") as! UIViewController
        let controller : PhotoScrollerViewController = storyboard.instantiateViewControllerWithIdentifier("PhotoScrollerViewController") as! PhotoScrollerViewController

        controller.index = indexPath.row
        controller.imagesArray = images;
        
        self.navigationController?.pushViewController(controller, animated: true)
       
    }

    //MARK: - Get image from PHAsset
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.defaultManager()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.synchronous = true
        manager.requestImageForAsset(asset, targetSize: CGSize(width: 100.0, height: 100.0), contentMode: .AspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
    
    //MARK: - Random Color
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
   
    

}
