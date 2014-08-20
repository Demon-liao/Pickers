//
//  BIDSingleComponentPickerViewController.swift
//  Pickers
//
//  Created by demon on 14-6-30.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDSingleComponentPickerViewController: UIViewController {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    @IBOutlet var singlePicker: UIPickerView!
    @IBOutlet var loadMore: UIButton!
    var characterNames=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.characterNames=["luke","leia","Han","ChewB","ArT","tHREE","LAN","asda"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        var row:NSInteger=self.singlePicker.selectedRowInComponent(0)
        var selected:AnyObject=self.characterNames[row]
        var title="你选择的是\(selected)"
        var alert=UIAlertView()
        alert.message=title
        alert.addButtonWithTitle("YES")
        alert.show()
    }
    @IBAction func loadMoreFn(sender: AnyObject) {
        self.characterNames=["22","111","333","444"]
        self.singlePicker.reloadAllComponents()
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    func pickerView(pickerView: UIPickerView!,
        numberOfRowsInComponent component: Int)->Int{
         return self.characterNames.count
    }
    func pickerView(pickerView: UIPickerView!,
        titleForRow row: Int,
        forComponent component: Int) -> String!{
          return self.characterNames[row] as NSString
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
