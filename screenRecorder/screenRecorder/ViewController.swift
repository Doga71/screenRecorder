//
//  ViewController.swift
//  screenRecorder
//
//  Created by Aditya kumar on 09/04/21.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {
    
    let recorder = RPScreenRecorder.shared()
    
    @IBAction func Orange(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.orange
        
    }
    
    
    
    @IBAction func Grey(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.gray
    }
    
    
    @IBAction func Black(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.black
    }
    
    
    @IBAction func RecordButton(_ sender: Any) {
        recorder.startRecording{ (error) in
        if let error = error {
            print(error)
        }
        }
    }
    
    
    @IBAction func Stop(_ sender: Any) {
        recorder.stopRecording{
            (preview, error) in
            if let preview = preview {
                preview.previewControllerDelegate = self
                self.present(preview, animated: true, completion: nil)
            }
            if let error = error {
                print(error)
            }
        }
    }
    
    
}

extension ViewController: RPPreviewViewControllerDelegate{
    func didFinish (_previewController: RPPreviewViewControllerDelegate){
        dismiss(animated: true, completion: nil)
    }
}

