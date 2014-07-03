//
//  BIDDoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by demon on 14-6-30.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDDoubleComponentPickerViewController: UIViewController {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    var kFillingComponent=0
    var kBreadComponent=1
    @IBOutlet var doublePicker: UIPickerView
    var fillingTypes=[]
    var breadTypes=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillingTypes=["一","二","三","四"]
        self.breadTypes=["1","2","3","4"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bottonPressed(sender: AnyObject) {
        var fillingRow:Int=self.doublePicker.selectedRowInComponent(kFillingComponent)
        var breadRow:Int=self.doublePicker.selectedRowInComponent(kBreadComponent)
        var filling=self.fillingTypes[fillingRow] as String
        var bread=self.breadTypes[breadRow] as String
        var msg="数据1:\(filling)--数据2:\(bread)"
        var alert=UIAlertView()
        alert.message=msg
        alert.addButtonWithTitle("YES")
        alert.show()
    }
    //指定2个选择器
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 2
    }
    func pickerView(pickerView: UIPickerView!,
        numberOfRowsInComponent component: Int)->Int{
            if(component==kBreadComponent){
                return self.breadTypes.count
            }else{
                return self.fillingTypes.count

            }
            
    }
    func pickerView(pickerView: UIPickerView!,
        titleForRow row: Int,
        forComponent component: Int) -> String!{
            if(component==kBreadComponent){
                return self.breadTypes[row] as NSString
            }else{
                return self.fillingTypes[row] as NSString
                
            }
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
