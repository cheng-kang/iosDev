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

By the Way
===

1 Trapper should actually be Tapper. It's a typing mistake.
