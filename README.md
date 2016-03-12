iosDev
===
Try to learn and practice developing iOS app with Swift.

###ios tutorial

[the new boston](https://www.youtube.com/playlist?list=PL6gx4Cwl9DGDgp7nGSUnnXihbTLFZJ79B)

[Devslopes Video Lessons](https://www.udemy.com/ios9-swift/learn/#/)

videos better watch again:

- [Intro to statck view](https://www.udemy.com/ios9-swift/learn/#/lecture/3382880)

###websites to check

[blackmoondev](http://blackmoondev.com/)

Get clear idea of MVC: [Model View Controller (MVC)](https://www.udemy.com/ios9-swift/learn/#/lecture/3383172)
Extensions are fun: [Extensions](https://www.udemy.com/ios9-swift/learn/#/lecture/3383204)

Notes
===

###1.change present view

1 set storyboard_id

2 for example:
  ```
  let tv = self.storyboard?.instantiateViewControllerWithIdentifier("TapViewController") as! TapViewController
  self.presentViewController(tv, animated: true, completion: nil)
  ```
  
###2.differences between the content modes

![differences between the content modes](https://dragdis.blob.core.windows.net/assets/2016/03/10/FE81E6EFF703050F64A3D08AC2609D78.png)

###3.how to load and play a audio

[How to play sounds using AVAudioPlayer](https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer)

drag the audio file to the app directory and just press enter

```
import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var btnSound: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch {
            
        }
    }
    ...
```

###4.animationImages
```
    @IBOutlet weak var monsterImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imgArray = [UIImage]()
        //init your image array, for example
        for var x = 1; x <= 4; x++ {
            let img = UIImage(named: "idle\(x).png")
            imgArray.append(img!)
        }
        
        monsterImg.animationImages = imgArray
        monsterImg.animationDuration = 0.8
        monsterImg.animationRepeatCount = 0
        monsterImg.startAnimating()
        
        //animationImages
        //An array of UIImage objects to use for an animation.
        
        //animationDuration
        //The amount of time it takes to go through one cycle of the images.
        //The time duration is measured in seconds. The default value of this property is equal to the number of images multiplied by 1/30th of a second. Thus, if you had 30 images, the value would be 1 second.
        
        //animationRepeatCount
        //Specifies the number of times to repeat the animation.
        //The default value is 0, which specifies to repeat the animation indefinitely.
    }
```
###5.a dragable image class
```
import Foundation
import UIKit

class DragImg: UIImageView {
    
    var originalPosition: CGPoint!
    
    //why override this?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //what's this?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.center = originalPosition
    }
}

```

###6.NSTimer
```
var timer: NSTimer!
timer = NSTimer.scheduledTimerWithTimeInterval(TIME_INCREMENT, target:self, selector: "FUNCTION", userInfo: nil, repeats: BOOL)
```

###7.NSNotificationCenter
```
//somewhere
NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "NOTIFICATION_NAME", object: nil))

//somewhere else
NSNotificationCenter.defaultCenter().addObserver(self, selector: "FUNCTION", name: "NOTIFICATION_NAME", object: nil)
```

###8.must add these init when create a subclass of UIImageView
```
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
```

An article about 'init': [Swift init patterns](https://theswiftdev.com/2015/08/05/swift-init-patterns/)

###9.Segue
pass message to the next segue
```
//somewhere
  performSegueWithIdentifier("IDENTIFIER", sender: A_SENDER)
  
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyOBject?) {
  if segue.identifier == "IDENTIFIER" {
    if let whatVC = segue.destinationViewController as ? SomeViewController {
      if let theString = sender as? String {
        whatVC.someStr = theString
      }
    }
  }
}
```

###10.Extensions
```
extension Double {
  var currency: String {
    return "$\(self)"
  }
}
```

###11.To load page with http protocol
edit the info.plist
```
NSAppTransportSecurity Dictionary
NSAllowsArbitraryLoads Boolean YES
```






By the Way
===

1 Trapper should actually be Tapper. It's a typing mistake.
