//
//  ViewController.swift
//  DropDown-TableViewDemo
//
//  Created by sks on 16/7/29.
//  Copyright © 2016年 Dingduola. All rights reserved.
//

import UIKit
let KScreen_Width = UIScreen.mainScreen().bounds.size.width
let KScreen_Height = UIScreen.mainScreen().bounds.size.height
let imgHeight : CGFloat = 200


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var imageView : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 240/255, green: 240/255, blue: 100/255, alpha: 1)
        self.navigationController?.navigationBar.alpha = 0
        
        let rightButton = UIButton.init(type: .Custom)
        rightButton.frame = CGRectMake(KScreen_Width-40, 32, 20, 20)
        rightButton .setBackgroundImage(UIImage.init(named: "1"), forState: .Normal)
        rightButton.addTarget(self, action: #selector(ViewController.click), forControlEvents: .TouchUpInside)
       self.navigationController?.view .addSubview(rightButton)
        
        /**
         去除导航栏黑线
         */
        if ((self.navigationController?.navigationBar .respondsToSelector(#selector(self.navigationController?.navigationBar.setBackgroundImage(_:forBarMetrics:)))) != nil){
            for view in (self.navigationController?.navigationBar.subviews)! as [UIView] {
                if view is UIImageView {
                    for view2 in view.subviews {
                        if view2 is UIImageView {
                            view2.hidden = true;
                        }
                    }
                }
            }
        }
        

        tableView.contentInset = UIEdgeInsetsMake(imgHeight, 0, 0, 0)
        imageView = UIImageView.init(frame: CGRectMake(0, -imgHeight, KScreen_Width, imgHeight))
        imageView.image = UIImage.init(named: "1468895691727")
        imageView.contentMode = .ScaleAspectFill
        tableView .addSubview(imageView)
        
        
    }

    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let offsetY  = scrollView.contentOffset.y
        let offsetH  = imgHeight + offsetY - 20
        
        if offsetH <= 0 {
            imageView?.frame = CGRectMake(0, -imgHeight+offsetH, KScreen_Width, imgHeight-offsetH)
            self.navigationController?.navigationBar.alpha = 0
        } else {
            
            let min = offsetH/(imgHeight-64) < 1 ? offsetH / (imgHeight-64) : 1
            
            self.navigationController?.navigationBar.alpha = min
        }
        
    }
    
    // MARK: - Table view data source
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = String(format: "第%ld行",indexPath.row+1)
     // Configure the cell...
     
     return cell
     }
    
    
    //右侧按钮点击
    func click() {
        print("点击了按钮")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

