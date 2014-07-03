//
//  BIDCustomPickerComponentPickerViewController.swift
//  Pickers
//
//  Created by demon on 14-6-30.
//  Copyright (c) 2014年 demon. All rights reserved.
//

import UIKit

class BIDCustomPickerComponentPickerViewController: UIViewController {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    @IBOutlet var picker: UIPickerView
    @IBOutlet var winLabel: UILabel
    var images=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.images=[UIImage(named:"seven"),UIImage(named:"bar"),UIImage(named:"crown")
        ,UIImage(named:"cherry"),UIImage(named:"lemon"),UIImage(named:"apple")]
        var now=time(nil)
        srandom(CUnsignedInt(now))
        //func time(_: CMutablePointer<time_t>)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func spin(sender: AnyObject) {
        var win:Bool=false
        var numInRow:Int = 1
        var lastVal:Int = -1
        
        for(var i=0;i<5;i++){
            var newValue:Int = random() % self.images.count
            if(newValue==lastVal){
                numInRow++
            }else{
                numInRow=1
            }
            lastVal=newValue
            self.picker.selectRow(newValue,inComponent:i,animated:true)
            self.picker.reloadComponent(i)
            if(numInRow>=3){
                win=true
            }
        }
        if(win){
            self.winLabel.text="YOU Win"
        }else{
            self.winLabel.text="YOU Lose"
        }
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 5
    }
    func pickerView(pickerView: UIPickerView!,
        numberOfRowsInComponent component: Int)->Int{
             return self.images.count
    }
    func pickerView(pickerView: UIPickerView!,
        viewForRow row: Int,
        forComponent component: Int,
        reusingView view: UIView!) -> UIView!{
            var image:UIImage=self.images[row] as UIImage
            var imagesView=UIImageView(image:image)
            return imagesView
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
