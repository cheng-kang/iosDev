//
//  ViewController.swift
//  WebRequestPractice
//
//  Created by Ant on 5/15/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.getDataFromURL("http://pokeapi.co/api/v2/pokemon/1/")
//        self.getDataFromURL2(NSURL(string: "http://pokeapi.co/api/v2/pokemon/1/")!)
        
//        var a: Int?
//        var c:Int? = 2
//        if let b = c {
//            print("111")
//        } else {
//            print("222")
//        }
//        self.test()
//        self.postTest()
        self.alamofireTest()
        
    }
    
    func getDataFromURL(targetURLString: String) {
        let targetURL = NSURL(string: targetURLString)
        let request = NSURLRequest(URL: targetURL!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
//            print(response)
            
//            print(data)
//            print(error)
            do {
                try print(NSJSONSerialization.JSONObjectWithData(data!, options: []))
            } catch let error as NSError {
                print(error)
            }
//            if error {
//                print(response)
//                print(data)
//            } else {
//                print("Error!")
//            }
        }
    }
    
    func getDataFromURL2(targetURL: NSURL) {
        let data = NSData(contentsOfURL: targetURL)
        do {
            try print(NSJSONSerialization.JSONObjectWithData(data!, options: []))
        } catch let error as NSError {
            print(error)
        }
    }
    
    func test() {
        
        let str = "{\"names\": [\"Bob\", \"Tim\", \"Tina\"]}"
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(str, options: [])
        } catch {
            //nothing
        }
        
    }
    
    func postTest() {
        let url:NSURL = NSURL(string: "http://api.postcodes.io/postcodes")!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let paramString = [
            "postcodes" : ["OX49 5NU", "M32 0JG", "NE30 1DP"]
        ]
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(paramString, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            print(error)
            print(response)
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            if let isError = error {
                print(error)
            } else {
                do {
//                    let b = try NSJSONSerialization.dataWithJSONObject(data!, options: [])
//                    print(b)
                    print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                } catch let err as NSError {
                    print(err)
                }
            }
        }
//        let task = session.dataTaskWithRequest(request) {
//            (
//            let data, let response, let error) in
//            
//            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
//                print("error")
//                return
//            }
//            
//            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print(dataString)
//            
//        }
        
        task.resume()
    }
    
    func alamofireTest() {
        
        let paramString = [
            "postcodes" : ["OX49 5NU", "M32 0JG", "NE30 1DP"]
        ]
        let httpHeader = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        Alamofire.request(.POST, "http://api.postcodes.io/postcodes", parameters: paramString).responseJSON { (response) -> Void in
            if response.result.isSuccess {
                print(NSString(data: response.data!, encoding: NSUTF8StringEncoding))
            } else {
                print("Nah")
            }
        }
    }


}

