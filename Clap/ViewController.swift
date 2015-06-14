//
//  ViewController.swift
//  Clap
//
//  Created by 清水美希 on 2015/06/14.
//  Copyright (c) 2015年 Miki Shimizu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController:
UIViewController,UIPickerViewDelegate,AVAudioPlayerDelegate {
    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer : AVAudioPlayer!
    var soundCount:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
        // Do any additional setup after loading the view, typically from a nib.
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //いくつカテゴリーを持つか
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //いくつ選択肢をつくるか
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 10
    }
    
    //選択肢になにを表示していくか1
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        return "\(row+1)回"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }
    
    @IBAction func playButton(){
        
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }


}

