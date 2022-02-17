//
//  OperationViewController.swift
//  GCD
//
//  Created by Nathaniel Whittington on 2/17/22.
//

import UIKit

class OperationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        let operationA = BlockOperation{
            print("Operation A")
            
        }
        

        let operationB = BlockOperation{[operationA]
            
            if operationA.isCancelled{
                print("Operation is canceled")
                return
            }
            print("Opertation B")
        }

//Adding dependency for operation B
        operationB.addDependency(operationA)
//Creating Queue
        let queue = OperationQueue()
//adding operation B before opertaion A in the Queue
        //cancel operation
        operationA.cancel()
        
        queue.addOperation(operationB)
        
        
        queue.addOperation(operationA)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
