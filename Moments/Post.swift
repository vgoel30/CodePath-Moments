//
//  Post.swift
//  Moments
//
//  Created by Varun Goel on 3/12/16.
//  Copyright © 2016 Varun Goel. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    
    //custom Post object
    class func postUserImage(image: UIImage?, text: String? , withCompletion completion: PFBooleanResultBlock?) {
        
        let post = PFObject(className: "Post")
        
        post["media"] = getPFFileFromImage(image)
        post["author"] = PFUser.currentUser()
        post["caption"] = text
        post.saveInBackgroundWithBlock(completion)
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
}