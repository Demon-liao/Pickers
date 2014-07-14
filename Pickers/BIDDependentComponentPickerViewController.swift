//
//  BIDDependentComponentPickerViewController.swift
//  Pickers
//
//  Created by demon on 14-6-30.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDDependentComponentPickerViewController: UIViewController {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    var kStateComponent=0
    var kZipComponet=1
    var stateZips=[:]
    var states=[]
    var zips=[]
    @IBOutlet var dependentPicker: UIPickerView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载plist文件
        var bundle:NSBundle=NSBundle.mainBundle()//获取项目的资源包
        var plistURL:NSURL=bundle.URLForResource("statedictionary", withExtension: "plist") //载入plist数据
        self.stateZips=NSDictionary(contentsOfURL:plistURL)
        var allStates=self.stateZips.allKeys as Array<String> //转换确定数组内容的类型值，否则不能sort
        var sortedStates=sorted(allStates, backwards) //按照字母排序
        self.states=sortedStates
        var selectedState:NSString=self.states[0] as NSString //初始化赋值
        println(self.stateZips)
        self.zips=self.stateZips[selectedState] as NSArray
        // Do any additional setup after loading the view.
    }
    func backwards(s1: String, s2: String) -> Bool {
        return s1 < s2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bottonPressed(sender: AnyObject) {
        var stateRow:Int=self.dependentPicker.selectedRowInComponent(kStateComponent)
        var zipRow:Int=self.dependentPicker.selectedRowInComponent(kZipComponet)
        var state:String!=self.states[stateRow] as NSString
        var zip:String!=self.zips[zipRow] as NSString
        var title="你选择的邮编是\(zip)"
        var msg="\(zip) 这个邮编属于 \(state)"
        var alert=UIAlertView()
        alert.title=title
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
            if(component==kStateComponent){
                return self.states.count
            }else{
                return self.zips.count
                
            }
            
    }
    func pickerView(pickerView: UIPickerView!,
        titleForRow row: Int,
        forComponent component: Int) -> String!{
            if(component==kStateComponent){
                return self.states[row] as NSString
            }else{
                return self.zips[row] as NSString
                
            }
    }
    //联动操作方法
    func pickerView(pickerView: UIPickerView!,
        didSelectRow row: Int,
        inComponent component: Int){
            if(component==kStateComponent){
                var selectedState:NSString=self.states[row] as NSString
                self.zips=self.stateZips[selectedState] as NSArray
                self.dependentPicker.reloadComponent(kZipComponet)//刷新组件内容--邮编
                self.dependentPicker.selectRow(0,inComponent:kZipComponet,animated:true)
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
