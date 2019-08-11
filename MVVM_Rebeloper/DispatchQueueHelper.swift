//
//  DispatchQueueHelper.swift
//  MVVM_Rebeloper
//
//  Created by MB on 8/11/19.
//  Copyright © 2019 MB. All rights reserved.
//

import Foundation

class DispatchQueueHelper{
    
    fileprivate init(){}
    
    public static func delay(bySeconds : Double , dispatchLevel : Dipatchlevel = .main , completion : @escaping ()-> ()){
        let dispatchTime = DispatchTime.now() + bySeconds
        dispatchLevel.dispatch.asyncAfter(deadline: dispatchTime, execute: completion)
    }
    
    public enum Dipatchlevel{
        case main,interactive ,userInitiated ,utility , background
        
        var dispatch : DispatchQueue{
            switch self{
            case .main:          return DispatchQueue.main
            case .interactive:   return DispatchQueue.global(qos: .userInteractive)
            case .userInitiated: return DispatchQueue.global(qos: .userInitiated)
            case .utility:       return DispatchQueue.global(qos: .utility)
            case .background:    return DispatchQueue.global(qos: .background)

            }
        }
    }
}
