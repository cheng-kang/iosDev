import Foundation

let format = "[A-Za-z0-9]{4,}"
let aaa = NSPredicate(format: "SELF MATCHES %@", format)
aaa.evaluate(with: "aaa")


func getDatetimeText(fromDate date: Date, withFormat format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: date)
}

NSTimeZone(name: "Europe/London")?.localizedName(.shortGeneric, locale: Locale.current)
NSTimeZone(name: "America/Los_Angeles")?.localizedName(.generic, locale: Locale.current)
NSTimeZone(name: "Asia/Shanghai")?.localizedName(.generic, locale: Locale.current)
NSTimeZone(abbreviation: "GMT")
NSTimeZone.local.secondsFromGMT()
NSTimeZone(name: "America/Los_Angeles")?.secondsFromGMT
Date(timeIntervalSinceNow: 3600)
let GMTDate = Date().addingTimeInterval(-TimeInterval(NSTimeZone.local.secondsFromGMT()))
GMTDate
let PTDate = GMTDate.addingTimeInterval(TimeInterval((NSTimeZone(name: "America/Los_Angeles")?.secondsFromGMT)!))
let UKTDate = GMTDate.addingTimeInterval(TimeInterval(NSTimeZone(name: "Europe/London")!.secondsFromGMT))
let CHNDate = GMTDate.addingTimeInterval(TimeInterval(NSTimeZone(name: "Asia/Shanghai")!.secondsFromGMT))
let a = getDatetimeText(fromDate: UKTDate, withFormat: "d")
let b = getDatetimeText(fromDate: PTDate, withFormat: "d")
NSTimeZone(name: "Asia/Shanghai")

let ab: Double = Double(TimeZone.current.secondsFromGMT())
let ac: Double = Double(TimeZone(identifier: "America/Los_Angeles")!.secondsFromGMT())
let di = ab - ac





func getDateAtTimezone(_ timezoneName: String) -> Date {
    let date = Date()
    
    let GMTDate = date.addingTimeInterval(-TimeInterval(TimeZone.current.secondsFromGMT()))
    
    let dateAtTimezone = GMTDate.addingTimeInterval(TimeInterval(TimeZone(identifier: timezoneName)!.secondsFromGMT()))
    
    return dateAtTimezone
}

func getDateAtTime(_ time: String, inFormat format: String, ofDate date: Date) -> Date {
    let df = DateFormatter()
    df.defaultDate = date
    df.dateFormat = "HH:mm"
    return df.date(from: time)!
}

let a1 = getDateAtTime("06:00", inFormat: "HH:mm", ofDate: Date())
let dd = a1.addingTimeInterval(di)


let a2 = getDateAtTimezone("America/Los_Angeles")
let a3 = Date().timeIntervalSince(a2)


let a4 = a1.timeIntervalSince(a2)
let a5 = a2.addingTimeInterval(a4)



func getDateAtTimezone(_ timezoneName: String, atTime time: String, inFormat format: String) -> Date {
    let dateNow = Date()
    let dateAtTime = getDateAtTime(time, inFormat: format, ofDate: dateNow)
    
    let GMTDate = dateNow.addingTimeInterval(-TimeInterval(TimeZone.current.secondsFromGMT()))
    
    let dateAtTimezone = GMTDate.addingTimeInterval(TimeInterval(TimeZone(identifier: timezoneName)!.secondsFromGMT()))
    
    return dateAtTimezone
}

func getTimeStringAtTimezone(_ to: String, fromTimezone from: String, withTimeString time: String) -> String {
    let fromDateSecondsFromGMT = NSTimeZone(name: from)!.secondsFromGMT
    let toDateSecondsFromGMT = NSTimeZone(name: to)!.secondsFromGMT
    
    let df = DateFormatter()
    df.timeZone = TimeZone(identifier: from)
    df.defaultDate = Date()
    df.dateFormat = "HH:mm"
//    let fromDate = df.date(from: time)!
    let fromDate = getDateAtTimezone(from, atTime: time, inFormat: "HH:mm")
    let toDate = fromDate.addingTimeInterval(TimeInterval(fromDateSecondsFromGMT - toDateSecondsFromGMT))

    
    return df.string(from: toDate)
    
}

getTimeStringAtTimezone("Europe/London", fromTimezone: "America/Los_Angeles", withTimeString: "03:06")


getTimeStringAtTimezone("Asia/Shanghai", fromTimezone: "America/Los_Angeles", withTimeString: "03:06")

let from = "America/Los_Angeles"
let to = "Europe/London"
let time = "06:00"

let fromDateSecondsFromGMT = NSTimeZone(name: from)!.secondsFromGMT
let toDateSecondsFromGMT = NSTimeZone(name: to)!.secondsFromGMT
let dif = fromDateSecondsFromGMT - toDateSecondsFromGMT

let dff = DateFormatter()
dff.timeZone = TimeZone(identifier: "America/Los_Angeles")
//dff.defaultDate = Date()
dff.dateFormat = "HH:mm"
let fromDate = dff.date(from: time)!
let toDate = fromDate.addingTimeInterval(TimeInterval(dif > 0 ? dif : -dif))

Int(a)! - Int(b)!

Date()

func getGMTDateOfLocalTodayWithFormat(_ format: String, dateString: String) -> Date {
    let localSecondsFromGMT = TimeZone.current.secondsFromGMT()
    
    let df = DateFormatter()
    df.defaultDate = Date()
    df.dateFormat = format
    
    let localDate = df.date(from: dateString)!
    let GMTDate = localDate.addingTimeInterval((Double)(-localSecondsFromGMT))
    
    return GMTDate
}

getGMTDateOfLocalTodayWithFormat("HH:mm", dateString: "08:24")

func getDateInFormat(format: String, byDayOfWeek day: Int, timeOfDay time: String, timeZoneIdentifier: String) {
    let df = DateFormatter()
    df.timeZone = TimeZone(identifier: timeZoneIdentifier)
    
    df.dateFormat = format
}

let aDate = Date()
let cld = Calendar.current
let cpns = cld.component(.weekdayOrdinal, from: aDate)
let bDate = cld.date(byAdding: .day, value: 3, to: aDate)

var calend = Calendar.current
calend.timeZone = TimeZone(identifier: "America/Los_Angeles")!
calend.date(bySettingHour: 3, minute: 0, second: 0, of: Date())
calend.isDateInToday(getDateAtTime("01:00", inFormat: "HH:mm", ofDate: Date()))
calend.isDateInYesterday(getDateAtTime("01:00", inFormat: "HH:mm", ofDate: Date()))
calend.startOfDay(for: Date())


Date().compare(getGMTDateOfLocalTodayWithFormat("HH:mm", dateString: "08:24"))

let df = DateFormatter()
df.defaultDate = Date()
df.dateFormat = "HH:mm"
df.date(from: "11:10")

"00:12" > "11:10"
"12:00" > "10:30"
"23:23" > "12:30"



public enum NameStyle : Int {
    
    case standard
    
    case shortStandard
    
    case daylightSaving
    
    case shortDaylightSaving
    
    case generic
    
    case shortGeneric
}
