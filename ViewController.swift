//
//  ViewController.swift
//  DemoDatePicker
//
//  Created by Hitesh on 14/09/22.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var imgDate : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgDate.isUserInteractionEnabled = true
        imgDate.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let imgView = tapGestureRecognizer.view as! UIImageView
        let datePicker = UIDatePicker()//Date picker
        let datePickerSize = CGSize(width: 320, height: 216) //Date picker size
        datePicker.frame = CGRect(x: 0, y: 0, width: datePickerSize.width, height: datePickerSize.height)
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 5
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        datePicker.preferredDatePickerStyle = .wheels
        let popoverView = UIView()
        popoverView.backgroundColor = UIColor.clear
        popoverView.addSubview(datePicker)
            // here you can add tool bar with done and cancel buttons if required

        let popoverViewController = UIViewController()
        popoverViewController.view = popoverView
        popoverViewController.view.frame = CGRect(x: 0, y: 0, width: datePickerSize.width, height: datePickerSize.height)
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.preferredContentSize = datePickerSize
        popoverViewController.popoverPresentationController?.sourceView = imgView // source button
        popoverViewController.popoverPresentationController?.sourceRect = imgView.bounds // source button bounds
        popoverViewController.popoverPresentationController?.delegate = self // to handle popover delegate methods
        self.present(popoverViewController, animated: true, completion: nil)

        // Your action
    }
    @objc func dateChanged(_ datePicker: UIDatePicker) {
            print("DATE :: \(datePicker.date)")
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            // Force popover style
        return UIModalPresentationStyle.none
    }


}

