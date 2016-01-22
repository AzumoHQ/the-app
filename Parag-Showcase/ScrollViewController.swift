//
//  ScrollViewController.swift
//  Parag-Showcase
//
//  Created by Parag Pardeshi on 1/22/16.
//  Copyright © 2016 Parag Pardeshi. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 1) Create the three views used in the swipe container view
        let AVc :ViewController0 =  ViewController0(nibName: "ViewController0", bundle: nil)
        let BVc :ViewController1 =  ViewController1(nibName: "ViewController1", bundle: nil)
        let CVc :ViewController2 =  ViewController2(nibName: "ViewController2", bundle: nil)
        
        
        // 2) Add in each view to the container view hierarchy
        //    Add them in opposite order since the view hieracrhy is a stack
        self.addChildViewController(CVc)
        self.scrollView!.addSubview(CVc.view)
        CVc.didMoveToParentViewController(self)
        
        self.addChildViewController(BVc)
        self.scrollView!.addSubview(BVc.view)
        BVc.didMoveToParentViewController(self)
        
        self.addChildViewController(AVc)
        self.scrollView!.addSubview(AVc.view)
        AVc.didMoveToParentViewController(self)
        
        
        // 3) Set up the frames of the view controllers to align
        //    with eachother inside the container view
        var adminFrame = AVc.view.frame
        adminFrame.origin.x = self.view.frame.size.width
        BVc.view.frame = adminFrame
        
        var BFrame = BVc.view.frame
        BFrame.origin.x = self.view.frame.size.width * 2
        CVc.view.frame = BFrame
        
        
        // 4) Finally set the size of the scroll view that contains the frames
        let scrollWidth: CGFloat  = 3 * self.view.frame.width
        let scrollHeight: CGFloat  = self.view.frame.size.height
        self.scrollView!.contentSize = CGSizeMake(scrollWidth, scrollHeight)
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
