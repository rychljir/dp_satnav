//
//  ApplicationState.swift
//  Satnav
//
//  Created by Petr Mares on 24.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import Foundation

struct ApplicationState{
    public static var tasksStates = [false, false, false, false, false, false, false]{
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(tasksStates, forKey: "SavedState")
        }
    }
    
    public static func loadTaskStates(){
        let defaults = UserDefaults.standard
        if let savedState = defaults.array(forKey: "SavedState")  as? [Bool]{
            if(savedState.count>0){
              ApplicationState.tasksStates = savedState
            }
        }
    }
    
    public static func deleteTaskStates(){
        ApplicationState.tasksStates = [false, false, false, false, false, false, false]
    }
    
    public static func setTaskState(index: Int, state: Bool){
        ApplicationState.tasksStates[index] = state
    }

    public static func getTaskState(index: Int) -> Bool{
        return ApplicationState.tasksStates[index]
    }
}
