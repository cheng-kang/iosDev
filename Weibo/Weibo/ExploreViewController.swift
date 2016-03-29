//
//  ExploreViewController.swift
//  Weibo
//
//  Created by Ant on 3/27/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: SearchBarButtonView!
    
    @IBOutlet weak var slider: UIScrollView!
    
    var sections: [[Dictionary<String, AnyObject>]] = [
        [
            [
                "image" : UIImage(named: "explore_hot")!,
                "title" : "热门微博",
                "subtitle" : "全站最热微博尽搜罗",
                "segue" : "GoToHot",
                "new": true
            ],
            [
                "image" : UIImage(named: "explore_find")!,
                "title" : "找人",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
        ],
        [
            [
                "image" : UIImage(named: "explore_top")!,
                "title" : "微博头条",
                "subtitle" : "随时随地一起看新闻",
                "segue" : "GoToHot",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_game")!,
                "title" : "玩游戏",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_around")!,
                "title" : "周边",
                "subtitle" : "发现\"英国\"值得去的地儿",
                "segue" : "GoToHot",
                "new": false
            ],
        ],
        [
            [
                "image" : UIImage(named: "explore_stock")!,
                "title" : "股票",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_film")!,
                "title" : "电影",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_hongrentao")!,
                "title" : "红人淘",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_music")!,
                "title" : "听歌",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_travel")!,
                "title" : "旅游",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
            [
                "image" : UIImage(named: "explore_more")!,
                "title" : "更多频道",
                "subtitle" : "",
                "segue" : "GoToHot",
                "new": false
            ],
        ],
    ]
    
    var sliderImages = [UIImage(named: "slider-1"),UIImage(named: "slider-2"),UIImage(named: "slider-3"),UIImage(named: "slider-4")]
    var dots: [UIView] = []
    var currentPage: Int!
    var sliderTimer: NSTimer!
    let sliderScrollInterval = 5.0
    let sliderScrollAnimationDuration = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.backgroundColor = COLOR_LIGHT_GREY
        self.tableView.backgroundColor = COLOR_LIGHT_GREY
        
        searchBar.configureView(UIColor.clearColor(), barBgColor: UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1), content: "大家正在搜：程康是谁啊")
        
        slider.delegate = self
        initSlider()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BarCell") as! BarCell
        cell.initCell(sections[indexPath.section][indexPath.row]["image"] as! UIImage, title: sections[indexPath.section][indexPath.row]["title"] as! String, subtitle: sections[indexPath.section][indexPath.row]["subtitle"] as! String, new: sections[indexPath.section][indexPath.row]["new"] as! Bool)
        
        if indexPath.row == sections[indexPath.section].count - 1 {
            cell.layer.shadowOffset = CGSizeMake(0, 0.5)
            cell.layer.shadowColor = UIColor.lightGrayColor().CGColor;
            cell.layer.shadowRadius = 0.5
            cell.layer.shadowOpacity = 0.3
            cell.clipsToBounds = false
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        view.backgroundColor = UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vw = UIView()
        return vw
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(sections[indexPath.section][indexPath.row]["segue"] as! String, sender: nil)
    }
    
    func initSlider() {
        let WIDTH = self.view.frame.width
        let HEIGHT = self.slider.frame.size.height
        let COUNT = self.sliderImages.count
        
        for var i = 0; i < COUNT; i++ {
            let imgView = UIImageView(image: self.sliderImages[i])
            self.slider.addSubview(imgView)
            imgView.frame = CGRectMake(WIDTH * CGFloat(i+1), 0, WIDTH, HEIGHT)
            
            if i == 0 {
                let extraImgView = UIImageView(image: self.sliderImages[COUNT-1])
                self.slider.addSubview(extraImgView)
                extraImgView.frame = CGRectMake(0, 0, WIDTH, HEIGHT)
            } else if i == COUNT - 1 {
                let extraImgView = UIImageView(image: self.sliderImages[0])
                self.slider.addSubview(extraImgView)
                extraImgView.frame = CGRectMake(WIDTH * CGFloat(COUNT+1), 0, WIDTH, HEIGHT)
            }
            
            let dot = UIView()
            dot.backgroundColor = COLOR_FOR_SLIDER_DOT_NOT_ACTIVE
            self.tableView.addSubview(dot)
            dot.frame = CGRectMake(WIDTH - (8 * CGFloat(COUNT - i)), HEIGHT - 8, RADIUS_DOT, RADIUS_DOT)
            dot.layer.cornerRadius = RADIUS_DOT / 2
            self.dots.append(dot)
        }
        self.dots[0].backgroundColor = COLOR_FOR_SLIDER_DOT_ACTIVE
        self.currentPage = 0
        
        self.slider.contentSize = CGSizeMake(WIDTH * CGFloat(COUNT + 2), HEIGHT)
        self.slider.contentOffset.x = WIDTH
        
        startTimer()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = Int(self.slider.contentOffset.x / self.slider.frame.size.width) - 1
        let WIDTH = self.slider.frame.size.width
        let PAGE_COUNT = self.sliderImages.count
        
        print(page)
        
        if page == -1 {
            self.slider.contentOffset.x = WIDTH * CGFloat(PAGE_COUNT)
        } else if page == PAGE_COUNT{
            self.slider.contentOffset.x = WIDTH
        } else {
            dots[currentPage].backgroundColor = COLOR_FOR_SLIDER_DOT_NOT_ACTIVE
            currentPage = page
            dots[currentPage].backgroundColor = COLOR_FOR_SLIDER_DOT_ACTIVE
        }
        startTimer()
    }
    
    
    func startTimer() {
        if sliderTimer != nil {
            sliderTimer.invalidate()
        }
        sliderTimer = NSTimer.scheduledTimerWithTimeInterval(sliderScrollInterval, target: self, selector: "sliderScrollRight", userInfo: nil, repeats: true)
    }
    
    func sliderScrollRight() {
        let WIDTH = self.slider.frame.size.width
        let PAGE_COUNT = self.sliderImages.count
        let LAST_PAGE = PAGE_COUNT - 1
        
        if self.currentPage == LAST_PAGE {
            UIView.animateWithDuration(sliderScrollAnimationDuration, animations: { () -> Void in
                self.slider.contentOffset.x = WIDTH
            })
        } else {
            UIView.animateWithDuration(sliderScrollAnimationDuration, animations: { () -> Void in
                self.slider.contentOffset.x += WIDTH
            })
        }
    }
}
