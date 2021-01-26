//
//  StepViewController.swift
//  Podomètre
//
//  Created by Mohamed dennoun on 23/01/2021.
//  Copyright © 2021 Mohamed dennoun. All rights reserved.
//

import UIKit
import CoreMotion

class StepViewController: UIViewController {
    
    @IBOutlet var distence: UILabel!
    @IBOutlet var step: UILabel!
    @IBOutlet var floorAscended: UILabel!
    @IBOutlet var floorDescended: UILabel!
    @IBOutlet var curCadence: UILabel!
    @IBOutlet var curPace: UILabel!
    @IBOutlet var startDate: UILabel!
    @IBOutlet var endDate: UILabel!
    
    
    let pedometer = CMPedometer()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("start here")

        if CMPedometer.isStepCountingAvailable() {
            let calendar = Calendar.current
            pedometer.queryPedometerData(from: calendar.startOfDay(for: Date()), to: Date()) { (data, error) in
               
                DispatchQueue.main.async{
                   
                    guard let dist = data?.distance,
                    let step = data?.numberOfSteps,
                    let floorAsc = data?.floorsAscended,
                    let floorDesc = data?.floorsDescended,
                    let cadence = data?.currentCadence,
                    let pace = data?.currentPace,
                    let start = data?.startDate,
                    let end = data?.endDate else {
                        return
                        
                    }
                    
                    self.distence.text = "Distance : \(dist)"
                    self.step.text = "numberOfSteps : \(step)"
                    self.floorAscended.text = "floorsAscended : \(floorAsc)"
                    self.floorDescended.text = "floorsDescended : \(floorDesc)"
                    self.curCadence.text = "currentCadence : \(cadence)"
                    self.curPace.text = "currentPace : \(pace)"
                    self.startDate.text = "startDate : \(start)"
                    self.endDate.text = "endDate : \(end)"
                }
                
            }
        }
        pedometer.startUpdates(from: Date()) { (data, error) in
            
            guard let dist = data?.distance,
            let step = data?.numberOfSteps,
            let floorAsc = data?.floorsAscended,
            let floorDesc = data?.floorsDescended,
            let cadence = data?.currentCadence,
            let pace = data?.currentPace,
            let start = data?.startDate,
            let end = data?.endDate else {
                return
                
            }
            
            self.distence.text = "Distance : \(dist)"
            self.step.text = "numberOfSteps : \(step)"
            self.floorAscended.text = "floorsAscended : \(floorAsc)"
            self.floorDescended.text = "floorsDescended : \(floorDesc)"
            self.curCadence.text = "currentCadence : \(cadence)"
            self.curPace.text = "currentPace : \(pace)"
            self.startDate.text = "startDate : \(start)"
            self.endDate.text = "endDate : \(end)"
                    
        }
    }


}