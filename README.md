iosDev
###
Try to learn and practice developing iOS app with Swift.

ios tutorial
---
[the new boston](https://www.youtube.com/playlist?list=PL6gx4Cwl9DGDgp7nGSUnnXihbTLFZJ79B)
[Devslopes Video Lessons](https://www.udemy.com/ios9-swift/learn/#/)

Notes
###

##change the present view
1 set the storyboard_id them
2 for example:
  ```
  let tv =
  self.storyboard?.instantiateViewControllerWithIdentifier("TapViewControl
  ler") as! TapViewController
              self.presentViewController(tv, animated: true, completion:
  nil)
  ```
