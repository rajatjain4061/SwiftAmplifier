//
//  UIImage.swift
//  SwiftAmplifier
//
//  Created by Rajat Jain on 26/07/17.
//  Copyright © 2017 rajatjain4061. All rights reserved.
//  Fork this repo on Github: https://github.com/rajatjain4061/SwiftAmplifier
//

import Foundation
import UIKit


extension UIImage {
    /**
     Convert an UIView into image
     
     - parameter view: view to convert into image
     - parameter highResolution: true for highResolution image
     */
    convenience init(view: UIView, highResolution:Bool = false) {
        if highResolution == false {
            UIGraphicsBeginImageContext(view.frame.size)
        } else {
            // Gradually increase the number for high resolution.
            let scale:CGFloat = 1.0
            
            UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, scale)
            
        }
        
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
    
    /**
     fix image is rotated after uploading to server
     https://stackoverflow.com/questions/5427656/ios-uiimagepickercontroller-result-image-orientation-after-upload
     
     */
    func fixOrientation() -> UIImage {
        if (self.imageOrientation == .up) {
            return self
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        self.draw(in: rect)
        
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return normalizedImage
    }
}

