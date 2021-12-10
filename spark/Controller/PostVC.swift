//
//  PostVC.swift
//  spark
//
//  Created by spark inc on 04/04/1443 AH.
//

import UIKit


class PostVC: UIViewController {

    let imageArray = [#imageLiteral(resourceName: "user4"), #imageLiteral(resourceName: "user1"), #imageLiteral(resourceName: "user2"), #imageLiteral(resourceName: "user5")]
    var imageIndex = 1
    @IBOutlet weak var frontImage: DesignableImage!
    @IBOutlet weak var backImage: DesignableImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frontImage.image = imageArray[imageIndex-1]
        backImage.image = imageArray[imageIndex]
        // Do any additional setup after loading the view.
    }
    
    func imageTransitionAnimation(direction: UISwipeGestureRecognizer.Direction) {
        
        let originalBackImageFrame = backImage.frame
        let originalFrontImageXPoint = frontImage.frame.origin.x
        let originalFrontImageYPoint = frontImage.frame.origin.y
        let frontImageWidth = frontImage.frame.width
        let frontImageHeight = frontImage.frame.height
        let frontImageXPoint = (view.frame.width  * 1.1 ) + frontImage.frame.width / 2
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.frontImage.rotation = direction == .right ? 90 : -90
            self.frontImage.frame.origin.x = direction == .right ? frontImageXPoint  : -frontImageXPoint
            self.backImage.frame = CGRect(x: originalFrontImageXPoint, y: originalFrontImageYPoint, width: frontImageWidth, height: frontImageHeight)
        } completion: { _ in
            self.backImage.frame = originalBackImageFrame
            self.frontImage.rotation = 0
            self.frontImage.frame.origin.x = originalFrontImageXPoint
            
            self.frontImage.image = self.backImage.image
            self.imageIndex += 1
            if self.imageIndex == self.imageArray.count { self.imageIndex = 0}
            self.backImage.image = self.imageArray[self.imageIndex]
        }

    }

    @IBAction func imageSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        imageTransitionAnimation(direction: sender.direction)
    }
    
    
    @IBAction func didPressPostButton(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: Date())
        
        let courseData: [String : Any] = [
            "title": "Spark 101",
            "date": formattedDate,
            "price": Int.random(in: 0...1_000_000)
        ]
        
        DataService.instance.postCourse(withValues: courseData) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("✅")
            }
            
        }
    }
    
}
