//
//  ClassBVC.swift
//  DelegateTutorial
//
//  Created by James Rochabrun on 2/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//MARK: step 1 Add Protoccol here
//Is a good practice to name your protocols adding the word delegate at the end of the class name, in this case, ClassBVCDelegate.
protocol ClassBVCDelegate: class {
    var stringToPass: String? { get set }
    func changeBackgroundColor(_ color: UIColor?)
    
    func passStringAndProcess(_ stringFromClassB: String?)
}

class ClassBVC: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
//MARK: step 2 Create a delegate property here, don't forget to make it weak!
    weak var delegate: ClassBVCDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.backgroundColor = .cyan
        firstView.layer.borderColor = UIColor.white.cgColor
        firstView.layer.borderWidth = 2.0
        firstView.layer.cornerRadius = firstView.frame.width / 2
        firstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        secondView.backgroundColor = .brown
        secondView.layer.borderColor = UIColor.white.cgColor
        secondView.layer.borderWidth = 2.0
        secondView.layer.cornerRadius = secondView.frame.width / 2
        secondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))

    }
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    func handleTap(_ tapGesture: UITapGestureRecognizer) {
        
        view.backgroundColor = tapGesture.view?.backgroundColor
        //MARK: step 3 Add the delegate method call here
        delegate?.stringToPass = "something here"
        delegate?.changeBackgroundColor(tapGesture.view?.backgroundColor)
        delegate?.passStringAndProcess("get this and process")
    }
}
