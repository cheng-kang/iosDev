//
//  ViewController.swift
//  GraphicsPractice
//
//  Created by Ant on 5/18/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterTest()
    }

    func filterTest() {
        
        let context = CIContext()
        let cImage = CIImage(CGImage: self.image.image!.CGImage!)
        
        let gaussianBlur = CIFilter(name: "CIGaussianBlur")
        gaussianBlur?.setValue(cImage, forKey: "inputImage")
        gaussianBlur?.setValue(1, forKey: "inputRadius")
        var result = gaussianBlur?.valueForKey("outputImage") as! CIImage
        
        let imageRef = context.createCGImage(result, fromRect: CGRectMake(100, 20, self.image.frame.width, self.image.frame.height))
        
        let image = UIImage(CIImage: result)
        self.image.image = image
    }

}

