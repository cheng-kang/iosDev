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

###3.animationImages
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






By the Way
===

1 Trapper should actually be Tapper. It's a typing mistake.
