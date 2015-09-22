//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var buttonFaceA: UIButton!
    @IBOutlet var buttonFaceB: UIButton!
    @IBOutlet var buttonDelete: UIButton!
    @IBOutlet var buttonDismiss: UIButton!
    
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func ButtonPrintA(){
        self.textDocumentProxy.insertText("I ❤ Swift ")
    }
    
    func ButtonPrintB(){
        self.textDocumentProxy.insertText("Me Too~~ ")
    }
    
    func didTapDelete() {
        self.textDocumentProxy.deleteBackward()
    }
    
    @IBAction func buttonFaceC(sender: UIButton) {
        if sender.tag == 0{
            self.textDocumentProxy.insertText("I ❤ You ")
        }else{
            self.textDocumentProxy.insertText("I ❤ You too ")
        }
        
    }
    
    

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        
        view.backgroundColor = keyboardView.backgroundColor //UIColor.blueColor()
        
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        buttonFaceA.addTarget(self,action: "ButtonPrintA", forControlEvents: .TouchUpInside)
        buttonFaceB.addTarget(self,action: "ButtonPrintB", forControlEvents: .TouchUpInside)
        
        buttonDelete.addTarget(self, action: "didTapDelete", forControlEvents: .TouchUpInside)
        buttonDismiss.addTarget(self, action: "dismissKeyboard", forControlEvents: .TouchUpInside)
        
    }


}
