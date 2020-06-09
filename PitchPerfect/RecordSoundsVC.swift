//
//  RecordSoundsVC.swift
//  PitchPerfect
//
//  Created by mahmoud diab on 6/4/20.
//  Copyright © 2020 Diab. All rights reserved.
//

import UIKit
import AVFoundation
class RecordSoundsVC: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordingLable: UILabel!
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var audioRecorder : AVAudioRecorder!
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
        
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        
        stopRecordingButton.isEnabled = true
        recordingButton.isEnabled = false
        recordingLable.text = " Recording in progress . . . "
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        audioRecorder.delegate = self
        
    }
    
    @IBAction func stopRecording(_ sender:AnyObject) {
        
        recordingButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        recordingLable.text = "Tap to Record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if flag{
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("Recording wasn't successful")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording"
        {
            let PlaySoundVC = segue.destination as! PlaySoundsVC
            let recordedAudioURL = sender as! URL
            PlaySoundVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    
}

