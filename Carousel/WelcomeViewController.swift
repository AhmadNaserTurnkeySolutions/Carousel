//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Kyle Pickering on 9/20/14.
//  Copyright (c) 2014 Kyle Pickering. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var welcomeImage: UIImageView!
    @IBOutlet weak var tile1Image: UIImageView!
    @IBOutlet weak var tile2Image: UIImageView!
    @IBOutlet weak var tile3Image: UIImageView!
    @IBOutlet weak var tile4Image: UIImageView!
    @IBOutlet weak var tile5Image: UIImageView!
    @IBOutlet weak var tile6Image: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500, 0]
    var xOffsets : [Float] = [-50, 55, 10, 100, -130, -95, 0]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65, 1]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10, 0]
    var tiles = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = welcomeImage.frame.size
        scrollView.delegate = self
        
        tiles = [tile1Image, tile2Image, tile3Image, tile4Image, tile5Image, tile6Image]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        var offset = Float(scrollView.contentOffset.y)
        if offset <= 568 {
            for (index, tile) in enumerate(tiles) {
                transformXY(tile as UIImageView, index: index, offset: offset)
                transformRotation(tile as UIImageView, index: index, offset: offset)
                transformScale(tile as UIImageView, index: index, offset: offset)
            }
        } else {
            for tile in tiles {
                transformXY(tile as UIImageView, index: 6, offset: offset)
                transformRotation(tile as UIImageView, index: 6, offset: offset)
                transformScale(tile as UIImageView, index: 6, offset: offset)
            }
        }
    }
    
    func transformXY(picture: UIImageView, index: Int, offset: Float){
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[index], r2Max: 0)
        
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[index], r2Max: 0)
        
        picture.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
    }

    func transformRotation(picture: UIImageView, index: Int, offset: Float){
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[index], r2Max: 0)
        
        picture.transform = CGAffineTransformRotate(picture.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func transformScale(picture: UIImageView, index: Int, offset: Float) {
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[index], r2Max: 1)
        picture.transform = CGAffineTransformScale(picture.transform, CGFloat(scale), CGFloat(scale))
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min:
        Float, r2Max: Float) -> Float {
            var ratio = (r2Max - r2Min) / (r1Max - r1Min)
            return value * ratio + r2Min - r1Min * ratio
    }
}
