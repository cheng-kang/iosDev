//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var dict = Dictionary<String, String>()

var d = Dictionary<String, String>()
d["a"] = "a"

let a = dict[d["a"]!] == nil
dict[d["a"]!] = "a"


var b = 1
var c = b
b = 2
c

var aa = "abcdefgcd"
var bb = "cd"

aa.rangeOfString(bb)

var ab:[Int] = []
ab.append(1)
ab.append(2)
ab = []
print(ab)

let bbc = Range(40..<40)
bbc.startIndex
var abc: Int = bbc.startIndex

var pp = ""
pp.componentsSeparatedByString("\n")

var nn = 2.0
floor(nn) == nn

var aaa:String?
aaa ?? ""
aaa = "aaa"
aaa ?? ""

var bbb:NSString?
bbb = String("aaa")
bbb ?? ""

" ".characters.count

let an = String.localizedStringWithFormat(NSLocalizedString("%f %% of the question price)", comment: ""), nn)

print(floor(10.2))
floor(10.7)
print(round(10.23))
round(10.7)



NSCalendar.currentCalendar().component(.Weekday, fromDate: NSDate())



for i in 0..<0 {
    print(i)
}
