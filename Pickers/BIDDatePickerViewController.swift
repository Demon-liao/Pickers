//
//  BIDDatePickerViewController.swift
//  Pickers
//
//  Created by demon on 14-6-30.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDDatePickerViewController: UIViewController {
//
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        var now:NSDate=NSDate.date()
        self.datePicker.setDate(now, animated:false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        var selected:NSDate=self.datePicker.date
        var dateFormat:NSDateFormatter=NSDateFormatter()
        dateFormat.dateFormat="yyyy-MM-dd HH:mm"
        var date=dateFormat.stringFromDate(selected)
        var msg="你选择的时间为\(date)"
         //init(title: String!, message: String!, delegate: AnyObject!, cancelButtonTitle: String!) /
        var alert=UIAlertView()
        alert.message=msg
        alert.addButtonWithTitle("YES")
        alert.show()
    }
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
