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

How does clipsToBounds work?: [StackOverflow: How does clipsToBounds work?](http://stackoverflow.com/questions/20449256/how-does-clipstobounds-work)

###informative links

[enable-disable-auto-layout-constraints](http://stackoverflow.com/questions/32218495/enable-disable-auto-layout-constraints)
[dynamic-height-issue-for-uitableview-cells-swift/36185105#36185105](http://stackoverflow.com/questions/30494702/dynamic-height-issue-for-uitableview-cells-swift/36185105#36185105)

Articles
===
Articles written by myself during my journey to iOS development.

- [UISearchBar（一）修改背景层和输入框层的背景颜色和边框颜色](http://cheng-kang.github.io/2016/03/19/UISearchBar%EF%BC%88%E4%B8%80%EF%BC%89%E4%BF%AE%E6%94%B9%E8%83%8C%E6%99%AF%E5%B1%82%E5%92%8C%E8%BE%93%E5%85%A5%E6%A1%86%E5%B1%82%E7%9A%84%E8%83%8C%E6%99%AF%E9%A2%9C%E8%89%B2%E5%92%8C%E8%BE%B9%E6%A1%86%E9%A2%9C%E8%89%B2/)
- [AutoLayout：UITableViewCell 自适应高度的一个例子](http://cheng-kang.github.io/2016/03/19/AutoLayout%EF%BC%9AUITableViewCell%20%E8%87%AA%E9%80%82%E5%BA%94%E9%AB%98%E5%BA%A6%E7%9A%84%E4%B8%80%E4%B8%AA%E4%BE%8B%E5%AD%90/)
- [AutoLayout：constraint priority 约束优先级（九宫格续，一个更优方案）](http://cheng-kang.github.io/2016/03/20/AutoLayout%EF%BC%9Aconstraint%20priority%20%E7%BA%A6%E6%9D%9F%E4%BC%98%E5%85%88%E7%BA%A7%EF%BC%88%E4%B9%9D%E5%AE%AB%E6%A0%BC%E7%BB%AD%EF%BC%8C%E4%B8%80%E4%B8%AA%E6%9B%B4%E4%BC%98%E6%96%B9%E6%A1%88%EF%BC%89/)

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

###11.hide keyboard


Add the following to your viewDidLoad():
```
let tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
tap.cancelsTouchesInView = false
view.addGestureRecognizer(tap)
```
and then add the following method declaration:
```
func dismissKeyboard()
{
    view.endEditing(true)
}
```

###12.UITableViewCell automatic resizing

```
func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
}

func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
}
```
参考：[Automatically resizing UITableViewCells with Dynamic Type and NSAttributedString](https://www.hackingwithswift.com/read/32/2/automatically-resizing-uitableviewcells-with-dynamic-type-and-ns)

###13.change view size
```
view.frame.CGRectMake(0 , 0, self.view.frame.width, self.view.frame.height * 0.7) 
```



By the Way
===

1 Trapper should actually be Tapper. It's a typing mistake.
