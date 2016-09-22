# Swift 设计模式（iOS） 读书笔记

## MVC 
- Model: 存储数据并且定义如何操作这些数据
- View: 负责 Model 的可视化展示，和负责用户的交互
- Controller: 把数据在 View 中展示出来，监听各种事件，负责数据的各种操作

**各司其职，减少依赖**

## Singleton 单例模式
```
class SomeClass: NSObject {
	class var sharedInstance: SomeClass {
		struct Singleton {
			static let instance = SomeClass()
		}
		
		return Singleton.instance
	}
}
```

1. 创建一个计算类型的`类变量`
2. 在`类变量`中嵌套一个 Singleton 结构体
3. Signleton 封装一个景太敞亮
4. 返回计算后的属性值

## Facade 外观模式
- 把使用和背后的实现逻辑解耦，只暴露简单的接口，而非内复杂的业务逻辑。

## Decorator 装饰者模式
- Extension 扩展
	- 再不用继承的情况下，给已存在的类、结构体或者枚举类添加新的功能。
	- 在拓展方法前面添加对应拓展的前缀，如：se_（SomeExtension），这样有利于与类的原有方法进行区分，避免使用时产生冲突。
- Delegation 委托
	- 例如 UITableView 和数据层应该分别独立。视图层负责显示数据，数据层负责提供数据。所以用 UITableViewDelegate 和 UITableViewDataSource 来配合。

## Adapter 适配器模式
```
@objc protocol SomeDelegate {
	func someFunction(para1: String, para2: String)
	optional func someOtherFunction(para1: String, para2: String)
}
```

```
...
	weak var delegate: SomeDelegate?
...
```

## Observer 观察者模式

在 MVC 里，观察者模式意味着需要允许 Model 对象和 View 对象进行交流，而不能有直接的关联。

- Notification
```
// 发送
NSNotificationCenter.defaultCenter().postNotificationName("someName", object: self, userInfo: ["para1": "something"])
// 订阅
NSNotificationCenter.defaultcenter().addObserver(self, selector:"handleNotification:", name: "someName", object: nil)

// 记得取消订阅
deinit {
	NSNotificationCenter.defaultCenter().removeObserver(self)
}

func handleNotification(notification: NSNotification) {
	let para1 = userInfo["para1"] as! NSString
	
	// some logic
}
```

- Key-Value Observing（KVO）
```
someObject.addObserver(self, forKeyPath: "what", options: NSKeyValueObservingOptions([.New, .Old]), context: nil)

deinit {
	someObject.removeObserver(self, forKeyPath: "what")
}

override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
    if keyPath == "what" {
        // some logic
    }
}
```

## Memento 备忘录模式
- UserDefaults
```
NSUserDefaults.standardUserDefaults()
```
- Archiving
**实现 NSCoding 协议**
```
class SomeClass: NSObject, NSCoding {

	var a: String!
	
	required init(coder decoder: NSCoder) {
		super.init()
		self.a = decoder.decodeObjectForKey("a") as! String
	}
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(a, forKey: "a")
	}
}

...
	func save() {
    let filename = NSHomeDirectory().stringByAppendingString("/Documents/object.bin")
    let data = NSKeyedArchiver.archivedDataWithRootObject(someObject)
    data.writeToFile(filename, atomically: true)
	}
...
	func load() {
		if let data = NSData(contentsOfFile: NSHomeDirectory().stringByAppendingString("/Documents/object.bin")) {
			let unarchiveObject = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! SomeClass
		}
	}
```

