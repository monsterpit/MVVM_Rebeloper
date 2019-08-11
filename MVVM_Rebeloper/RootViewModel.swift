//
//  RootViewModel.swift
//  MVVM_Rebeloper
//
//  Created by MB on 8/11/19.
//  Copyright © 2019 MB. All rights reserved.
//

// ViewModel
// we want to add state of view in ViewModel of View like text of label and color of view
import Foundation

protocol RootViewModelDelegate{
    func didStartFetchingMessage(_ message : String?)
    func didFinishFetchingMessage(_ message : String?)
}


class RootViewModel{
    
    var rootViewModelDelegate : RootViewModelDelegate?
    
    let user : User
    
    init(user : User) {
        self.user = user
    }
    
    func startFetchMessage(){
        
        rootViewModelDelegate?.didStartFetchingMessage("Fetching...")
        
        DispatchQueueHelper.delay(bySeconds: 3.0, dispatchLevel: .background) {
            
            var message : String? = "Hello there"
            
            if message == nil{
                message = "Failed to fetch the message from server"
            }
            
            
            DispatchQueueHelper.delay(bySeconds: 0, completion: { [unowned self] in
   
                self.rootViewModelDelegate?.didFinishFetchingMessage(message)
            })
        }
        
    }
    
}
