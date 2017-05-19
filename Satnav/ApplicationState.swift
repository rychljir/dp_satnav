//
//  ApplicationState.swift
//  Satnav
//
//  Created by Jiri Rychlovsky on 24.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import Foundation


/*
 
 Struct for storing users progress to UserDefaults
 
 */
struct ApplicationState{
    
    //saves on set progress to UserDefaults
    public static var tasksStates = [false, false, false, false, false, false, false]{
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(tasksStates, forKey: "SavedState")
        }
    }
    
    //loads progress from UserDefaults
    public static func loadTaskStates(){
        let defaults = UserDefaults.standard
        if let savedState = defaults.array(forKey: "SavedState")  as? [Bool]{
            if(savedState.count>0){
              ApplicationState.tasksStates = savedState
            }
        }
    }
    
    //deletes saved progress
    public static func deleteTaskStates(){
        ApplicationState.tasksStates = [false, false, false, false, false, false, false]
    }
    
    
    //set progress from chapter
    public static func setTaskState(index: Int, state: Bool){
        ApplicationState.tasksStates[index] = state
    }

    //get progress from chapter
    public static func getTaskState(index: Int) -> Bool{
        return ApplicationState.tasksStates[index]
    }
}
