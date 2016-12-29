iosDev
===
Try to learn and practice developing iOS app with Swift.

> 部分项目截图、涉及内容的介绍：[《Intro to Projects》](https://github.com/cheng-kang/iosDev/blob/master/Intro%20to%20Porjects.md)。例如：

![](http://7u2sl0.com1.z0.glb.clouddn.com/ios_Screen%20Shot%202016-04-13%20at%208.55.56%20PM%20edited.png)

###ios tutorial

- [the new boston](https://www.youtube.com/playlist?list=PL6gx4Cwl9DGDgp7nGSUnnXihbTLFZJ79B)
- [Devslopes Video Lessons](https://www.udemy.com/ios9-swift/learn/#/)
- [A Beginner’s Guide to NSDate in Swift](http://www.appcoda.com/nsdate)
- [Swift A Day](https://github.com/lindadong/swift-a-day)

videos better watch again:

- [Intro to statck view](https://www.udemy.com/ios9-swift/learn/#/lecture/3382880)

###websites to check

- [blackmoondev](http://blackmoondev.com/)
- Get clear idea of MVC: [Model View Controller (MVC)](https://www.udemy.com/ios9-swift/learn/#/lecture/3383172)
- Extensions are fun: [Extensions](https://www.udemy.com/ios9-swift/learn/#/lecture/3383204)
- How does clipsToBounds work?: [StackOverflow: How does clipsToBounds work?](http://stackoverflow.com/questions/20449256/how-does-clipstobounds-work)
- Parse JSON with NSJSONSerialization: [How to parse JSON using NSJSONSerialization](https://www.hackingwithswift.com/example-code/system/how-to-parse-json-using-nsjsonserialization)
- Error handling in Swift 2: try, catch, do and throw: [Error handling in Swift 2: try, catch, do and throw](https://www.hackingwithswift.com/new-syntax-swift-2-error-handling-try-catch)

**Transform**
- [introduction-to-3d-drawing-in-core-animation](http://www.thinkandbuild.it/introduction-to-3d-drawing-in-core-animation-part-1/)
- [CATransform3D 特效详解](http://blog.sina.com.cn/s/blog_8f5097be0101b91z.html)
```
print(img.frame.height)
var tf = CATransform3DIdentity
tf.m34 = 1/(-500)
tf = CATransform3DRotate(tf, -45.0 * CGFloat(M_PI) / 180.0, 1.0, 0.0, 0.0)
self.img.layer.transform = tf
print(img.frame.height)
```


###informative links

- [enable-disable-auto-layout-constraints](http://stackoverflow.com/questions/32218495/enable-disable-auto-layout-constraints)
- [dynamic-height-issue-for-uitableview-cells-swift/36185105#36185105](http://stackoverflow.com/questions/30494702/dynamic-height-issue-for-uitableview-cells-swift/36185105#36185105)
- [iOS Fundamentals: Frames, Bounds, and CGGeometry](http://code.tutsplus.com/tutorials/ios-fundamentals-frames-bounds-and-cggeometry--cms-21196)
- [about UILabel](http://stackoverflow.com/questions/1054558/vertically-align-text-to-top-within-a-uilabel/1054681#1054681)

Articles
===
Articles written by myself during my journey to iOS development.

- [UISearchBar（一）修改背景层和输入框层的背景颜色和边框颜色](http://cheng-kang.github.io/2016/03/19/UISearchBar%EF%BC%88%E4%B8%80%EF%BC%89%E4%BF%AE%E6%94%B9%E8%83%8C%E6%99%AF%E5%B1%82%E5%92%8C%E8%BE%93%E5%85%A5%E6%A1%86%E5%B1%82%E7%9A%84%E8%83%8C%E6%99%AF%E9%A2%9C%E8%89%B2%E5%92%8C%E8%BE%B9%E6%A1%86%E9%A2%9C%E8%89%B2/)
- [AutoLayout：UITableViewCell 自适应高度的一个例子](http://cheng-kang.github.io/2016/03/19/AutoLayout%EF%BC%9AUITableViewCell%20%E8%87%AA%E9%80%82%E5%BA%94%E9%AB%98%E5%BA%A6%E7%9A%84%E4%B8%80%E4%B8%AA%E4%BE%8B%E5%AD%90/)
- [AutoLayout：constraint priority 约束优先级（九宫格续，一个更优方案）](http://cheng-kang.github.io/2016/03/20/AutoLayout%EF%BC%9Aconstraint%20priority%20%E7%BA%A6%E6%9D%9F%E4%BC%98%E5%85%88%E7%BA%A7%EF%BC%88%E4%B9%9D%E5%AE%AB%E6%A0%BC%E7%BB%AD%EF%BC%8C%E4%B8%80%E4%B8%AA%E6%9B%B4%E4%BC%98%E6%96%B9%E6%A1%88%EF%BC%89/)
- [【译】iOS 基础：Frames、Bounds 和 CGGeometry](http://cheng-kang.github.io/2016/03/26/%E3%80%90%E8%AF%91%E3%80%91iOS%20%E5%9F%BA%E7%A1%80%EF%BC%9AFrames%E3%80%81Bounds%20%E5%92%8C%20CGGeometry/)
- [仿微博 iOS 客户端 TabBar 中间按钮](http://cheng-kang.github.io/2016/03/30/%E4%BB%BF%E5%BE%AE%E5%8D%9A%20iOS%20%E5%AE%A2%E6%88%B7%E7%AB%AF%20TabBar%20%E4%B8%AD%E9%97%B4%E6%8C%89%E9%92%AE/)
- [自定义 UITabBar 总结（一个模拟 instagram TabBar 的例子）](http://cheng-kang.github.io/2016/03/31/%E8%87%AA%E5%AE%9A%E4%B9%89%20UITabBar%20%E6%80%BB%E7%BB%93%EF%BC%88%E4%B8%80%E4%B8%AA%E6%A8%A1%E6%8B%9F%20instagram%20TabBar%20%E7%9A%84%E4%BE%8B%E5%AD%90%EF%BC%89/)
- [实现 instagram 底部弹出菜单的一个例子（模拟 instagram 系列）](http://cheng-kang.github.io/2016/04/03/%E5%AE%9E%E7%8E%B0%20instagram%20%E5%BA%95%E9%83%A8%E5%BC%B9%E5%87%BA%E8%8F%9C%E5%8D%95%E7%9A%84%E4%B8%80%E4%B8%AA%E4%BE%8B%E5%AD%90%EF%BC%88%E6%A8%A1%E6%8B%9F%20instagram%20%E7%B3%BB%E5%88%97%EF%BC%89/)
- [Swift 实现多个 TableView 的侧滑与切换（模拟 instagram 系列）](http://cheng-kang.github.io/2016/04/06/Swift%20%E5%AE%9E%E7%8E%B0%E5%A4%9A%E4%B8%AA%20TableView%20%E7%9A%84%E4%BE%A7%E6%BB%91%E4%B8%8E%E5%88%87%E6%8D%A2%EF%BC%88%E6%A8%A1%E6%8B%9F%20instagram%20%E7%B3%BB%E5%88%97%EF%BC%89/)
- [AutoLayout 中需要注意的点](http://chengkang.me/2016/04/07/AutoLayout%20中需要注意的点/)
- [模拟凤凰新闻 | 更复杂的标签动画 - Swift 实现多个 TableView 的侧滑与切换](http://chengkang.me/2016/04/08/%E6%A8%A1%E6%8B%9F%E5%87%A4%E5%87%B0%E6%96%B0%E9%97%BB%20%7C%20%E6%9B%B4%E5%A4%8D%E6%9D%82%E7%9A%84%E6%A0%87%E7%AD%BE%E5%8A%A8%E7%94%BB%20-%20Swift%20%E5%AE%9E%E7%8E%B0%E5%A4%9A%E4%B8%AA%20TableView%20%E7%9A%84%E4%BE%A7%E6%BB%91%E4%B8%8E%E5%88%87%E6%8D%A2/)
- [【译】UICollectionView 轻松重排](http://chengkang.me/2016/04/12/%E3%80%90%E8%AF%91%E3%80%91UICollectionView%20%E8%BD%BB%E6%9D%BE%E9%87%8D%E6%8E%92/)
- [UICollectionView 总结](http://chengkang.me/2016/04/13/UICollectionView%20%E6%80%BB%E7%BB%93/)

To Do
===
- Custom gif RefreshControl
- addTextFieldWithConfigurationHandler
- deinit

Nice Frameworks
===
- [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [ShareSDK](http://www.mob.com)

Notes
===
**If the layout isn't what you expect, check if you've added the constraints!!!**

**Use 'Equal Widths' to set the width of any StackView inside ScrollView, otherwise the width will go wrong.**

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

###14.set UICollectionViewCell spacing & line spacing
```
let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
layout.minimumInteritemSpacing = 1
layout.minimumLineSpacing = 1

collectionView.collectionViewLayout = layout
```

###15.UITableViewCell Animation

override willDisplayCell
```
override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
    forRowAtIndexPath indexPath: NSIndexPath) {
    //Animation Code
}
```

###16.self.view.endEditing(true)

###17.draw image with render color
```
drawImage(UIImage(named: "image")!, size: CGSizeMake(30, 30), renderColor: UIColor(red: 149.0/255, green: 149.0/255, blue: 149.0/255, alpha: 1))
```

###18.replace sub-string
```
let text = (stringName as NSString).stringByReplacingOccurrencesOfString("whatever", withString: "")
```

###19.The file “” couldn’t be opened because you don’t have permission t

clean and re-build

###20.check if text is Int
```
if Int(strToCheck) == nil {
  print("Not Int")
} else {
  print("Is Int")
}
```

###21.localizedStringWithFormat
```
String.localizedStringWithFormat(NSLocalizedString("Blahblahblah %d.", comment: "Some Comment"), intVar)
```

###22.an alertView example, pop up at the screen center
```
import UIKit

class ExampleAlertView: UIView {
    
    
    @IBOutlet weak var wechatPayButton: UIButton!
    @IBOutlet weak var alipayButton: UIButton!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    private var shadowBtn: UIButton!
    
    let ApplicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    private var showView: UIView {
        return ApplicationDelegate.window!
    }
    
    private var confirmClosure: (() -> ())?
    private var cancelClosure: (() -> ())?
    
    
    @objc private func shadowBtnClick() {
        
        UIView.animateWithDuration(0.15, animations: {
            self.shadowBtn.alpha = 0
            self.alpha = 0
        }) { (success) in
            self.shadowBtn.removeFromSuperview()
            self.removeFromSuperview()
        }
    }

    class func exampleAlertView(initialMoney: String, canInput: Bool, confirmClosure:(()->()), cancelClosure: (() -> ())) -> DXPayAlertView {
        let alert = NSBundle.mainBundle().loadNibNamed("ExampleAlertView", owner: nil, options: nil).first as! ExampleAlertView
        alert.confirmClosure = confirmClosure
        alert.cancelClosure = cancelClosure
        
        return alert
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.shadowBtn = UIButton(frame: UIScreen.mainScreen().bounds)
        self.shadowBtn.addTarget(self, action: #selector(ExampleAlertView.shadowBtnClick), forControlEvents: .TouchUpInside)
        self.shadowBtn.backgroundColor = UIColor.blackColor()
        shadowBtn.alpha = 0.4
        UIApplication.sharedApplication().keyWindow?.addSubview(shadowBtn)
    }
    
    func show() {
        let size = UIScreen.mainScreen().bounds.size
        self.shadowBtn.center = CGPoint(x: size.width/2, y: size.height/2)
        self.center = self.shadowBtn.center
        self.shadowBtn.frame = self.showView.bounds
        self.shadowBtn.alpha = 0
        self.alpha = 0
        
        self.transform = CGAffineTransformMakeScale(1.2, 1.2)
        
        UIView.animateWithDuration(0.25) {
            
            self.shadowBtn.alpha = 0.4
            self.showView.addSubview(self.shadowBtn)
            
            UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: .CurveEaseInOut, animations: {
                self.showView.addSubview(self)
                self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                
                self.alpha = 1
                }, completion: { (_) in
                    self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    self.showView.addSubview(self)
                    self.alpha = 1
            })
        }
    }
    
    @IBAction func confirmBtnClick(sender: UIButton) {
        self.confirmClosure?()
        shadowBtnClick()
    }
    
    @IBAction func cancelBtnClick(sender: UIButton) {
        self.cancelClosure?()
        shadowBtnClick()
    }
}
```

23.deinit
```
deinit{
    print("WhicheverController deinit")
    // some code
}
```

24.deselectTableViewCell
```
tableView.deselectRowAtIndexPath(indexPath, animated: true)
```

25.get image from url
```
let url = NSURL(string: image.url)
let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
imageView.image = UIImage(data: data!)

//If you want to make the code run async, you can easily achieve this with GCD:

let url = NSURL(string: image.url)
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
    let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
    dispatch_async(dispatch_get_main_queue(), { 
        imageView.image = UIImage(data: data!)
    });
}
```

26.double tap gesture will cause tab switch slowing down, the reason is it needs a minimum amount of time to wait for possible taps.

27.format time label
```
func getStatusTime(dateStr: String) -> String {
    
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = dateFormatter.dateFromString(dateStr)!
    
    //判断是否是同一年
    if isSameYear(date) {
        
        let calendar = NSCalendar.currentCalendar()
        
        if calendar.isDateInToday(date) {
            
            
            let time = abs(Int32(date.timeIntervalSinceNow))
            
            if time < 60 {
                
                return "刚刚"
            }else if time < 60 * 60 {
                
                return "\(time/60) 分钟前"
            }else{
                
                return "\(time / 60 / 60)小时前"
            }
            
        }else if calendar.isDateInYesterday(date) {
            
            dateFormatter.dateFormat = "HH:mm"
            return "昨天" + dateFormatter.stringFromDate(date)
            
        }else {
            
            dateFormatter.dateFormat = "MM-dd HH:mm"
            return dateFormatter.stringFromDate(date)
        }
        
    }else {
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.stringFromDate(date)
    }
}

func isSameYear(date: NSDate) -> Bool{
    
    dateFormatter.dateFormat = "yyyy"
    
    return dateFormatter.stringFromDate(date) == dateFormatter.stringFromDate(NSDate())
    
}
```

28.how-to-add-ellipses-on-a-uitextview
```
You can do that by setting the properties of the textContainer like so:

textView.textContainer.maximumNumberOfLines = 2;
textView.textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
```

29.imageWithRenderingMode

To make imageWithRenderingMode work, you need to seperate creating UIImage and setting renderingmode
```
// Correct way
let image = UIImage(named: "ImageName")!
self.someImgview.image = image.imageWithRenderingMode(.AlwaysTemplate)

// Wrong way
self.someImgview.image = UIImage(named: "ImageName")!.imageWithRenderingMode(.AlwaysTemplate)
```

30.get text view content height

**To update UITextView height with it's content height, you need to update the correspond height constraint.** Otherwise, it won't work.
```
extension UITextView {
    func heightThatFitsContent() -> CGFloat {
        let fixedWidth = self.frame.width
        let newSize = self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT)))
        
        return newSize.height
    }
}

**textViewHeightConstraint.constant = textview.heightThatFitsContent()**
```

31.keyboard events, keyboard willShow
```
NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)

func keyboardWillShow(notification:NSNotification) {
    let userInfo:NSDictionary = notification.userInfo!
    let keyboardFrame:NSValue = userInfo.valueForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
    let keyboardRectangle = keyboardFrame.CGRectValue()
    let keyboardHeight = keyboardRectangle.height
}
```

32.get version number
```
func getVersion() -> String {
  let dict = NSBundle.mainBundle().infoDictionary
  return dict!["CFBundleShortVersionString"]! as! String
}
```

33.get build version
```
func getBuildVersion() -> String {
  let dict = NSBundle.mainBundle().infoDictionary
  return dict!["CFBundleVersion"]! as! String
}
```

34.alert with confirmAct, cancelAct, and textfield
```
func showCustomAlert(title: String, message: String, textfiledSetting: (textfield: UITextField)->()), cancelAct: ((alert: UIAlertController)->())?, confirmAct: ((alert: UIAlertController)->())?) {
  let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
  let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (_) -> Void in
    cancelAct?(alert: alert)
  }
  let confirm = UIAlertAction(title: "Confirm", style: .Default) { (_) -> Void in
    confirmAct?(alert: alert)
  }
  alert.addTextFieldWithConfigurationHandler(textfieldSetting)
  alert.addAction(confirm)
  alert.addAction(cancel)
  ApplicationDelegate.window?.rootViewController?.presentViewController(alert, animated: true, complettion: nil)
}
```

35.UIFont' is not convertible to '(name: String, size: CGFloat) -> UIFont?'
```
UIFont(name: "Roboto-Regular", size: 15) ×
UIFont.init(name: "Roboto-Regular", size: 15) √
```

36.hex string to NSData [Reference](http://stackoverflow.com/questions/26501276/converting-hex-string-to-nsdata-in-swift)
```
extension String {

    /// Create `NSData` from hexadecimal string representation
    ///
    /// This takes a hexadecimal representation and creates a `NSData` object. Note, if the string has any spaces or non-hex characters (e.g. starts with '<' and with a '>'), those are ignored and only hex characters are processed.
    ///
    /// - returns: Data represented by this hexadecimal string.

    func dataFromHexadecimalString() -> NSData? {
        let data = NSMutableData(capacity: characters.count / 2)

        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .CaseInsensitive)
        regex.enumerateMatchesInString(self, options: [], range: NSMakeRange(0, characters.count)) { match, flags, stop in
            let byteString = (self as NSString).substringWithRange(match!.range)
            var num = UInt8(byteString, radix: 16)
            data?.appendBytes(&num, length: 1)
        }

        return data
    }
}
```

37.Hex Color Convenience Function
```
// Hex Color Convenience Function
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
```

38.add gesture recognizer after setting the frame

39.set center after setting the size

40.customize uipickerview

You can override pickerview:attributtedStringForTitle to change title color. However, you cannot change font with this method.

To customize font, use pickerview:viewForRow

41.if you see the error "Enum case 'someCase' not found in type 'someEnumType'", add ! to 'someEnumTypeVar'
```
// Error
switch someEnumTypeVar {
case .someCase:
    <#code#>
default:
    <#code#>
}
```
```
// Fixed
switch someEnumTypeVar! {
case .someCase:
    <#code#>
default:
    <#code#>
}
```

By the Way
===

1 Trapper should actually be Tapper. It's a typing mistake.
