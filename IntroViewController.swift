//
//  IntroViewController.swift
//  Carousel
//
//  Created by Blake Hudelson on 2/10/16.
//  Copyright © 2016 Blake Hudelson. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate,UIActionSheetDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var fieldInitialY: CGFloat!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 1625
        )

        // Do any additional setup after loading the view.
    }
   
    func scrollViewDidScroll(scrollView: UIScrollView){
        var offset = scrollView.contentOffset.y
        
        // content offset: 0->568
        // x offset: -30->0
        // y offset: -285->0
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -385, r2Max: 0)
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        var t1x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -50, r2Max: 0)
        var t1y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        
        var t2x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 30, r2Max: 0)
        var t2y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -350, r2Max: 0)
        var t2scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.3, r2Max: 1)
        
        var t3x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 150, r2Max: 0)
        var t3y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -480, r2Max: 0)
        var t3rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        var t3scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.3, r2Max: 1)
        
        var t4x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        var t4y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -420, r2Max: 0)
        var t4rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        var t4scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.3, r2Max: 1)
        
        var t5x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -170, r2Max: 0)
        var t5y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -490, r2Max: 0)
        var t5rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 12, r2Max: 0)
        var t5scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.5, r2Max: 1)
        
        var t6x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -70, r2Max: 0)
        var t6y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -350, r2Max: 0)
        var t6rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        var t6scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.3, r2Max: 1)
        
    
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(t1x), CGFloat(t1y))
        tile1View.transform = CGAffineTransformScale(tile1View.transform,CGFloat(scale),CGFloat(scale))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform,CGFloat(rotation * CGFloat(M_PI) / 180))
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(t2x), CGFloat(t2y))
        tile2View.transform = CGAffineTransformScale(tile2View.transform,CGFloat(t2scale),CGFloat(t2scale))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform,CGFloat(rotation * CGFloat(M_PI) /  -180))
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(t3x), CGFloat(t3y))
        tile3View.transform = CGAffineTransformScale(tile3View.transform,CGFloat(t3scale),CGFloat(t3scale))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform,CGFloat(t3rotation * CGFloat(M_PI) / 90))
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(t4x), CGFloat(t4y))
        tile4View.transform = CGAffineTransformScale(tile4View.transform,CGFloat(t4scale),CGFloat(t4scale))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform,CGFloat(t4rotation * CGFloat(M_PI) / 300))
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(t5x), CGFloat(t5y))
        tile5View.transform = CGAffineTransformScale(tile5View.transform,CGFloat(t5scale),CGFloat(t5scale))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform,CGFloat(t5rotation * CGFloat(M_PI) / 120))
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(t6x), CGFloat(t6y))
        tile6View.transform = CGAffineTransformScale(tile6View.transform,CGFloat(t6scale),CGFloat(t6scale))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform,CGFloat(t6rotation * CGFloat(M_PI) / 160))
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
