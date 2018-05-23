//
//  ViewController.swift
//  DelegateTutorial
//
//  Created by James Rochabrun on 2/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//MARK: step 4 adopt the protocol here
class ClassAVC: UIViewController {
    var stringToPass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("string to pass : \(String(describing: stringToPass))")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    //MARK: step 5 create a reference of Class B and bind them through the prepareforsegue method
        if let nav = segue.destination as? UINavigationController, let classBVC = nav.topViewController as? ClassBVC{
            classBVC.delegate = self //self is the ClassAVC which has been delegated!
        }

    }
}

extension ClassAVC: ClassBVCDelegate{
    //MARK: step 6 finally use the method of the contract here
    func changeBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
    
    func passStringAndProcess(_ stringFromClassB: String?) {
        print("string from class B : \(String(describing: stringFromClassB))")
    }
}

