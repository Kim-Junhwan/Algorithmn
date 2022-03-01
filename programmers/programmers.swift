//
//  progeammers 다리를 지나는 트럭.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/10/29.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 0
    var wait = truck_weights
    var w = 0
    var times = [Int]()
    var weights = [Int]()
    
    while !wait.isEmpty{
        time += 1
        if !times.isEmpty{
            if time == times.first! {
                times.removeFirst()
                w -= weights.first!
                weights.removeFirst()
            }
        }
        if w+wait.first! <= weight{
            w += wait.first!
            weights.append(wait.first!)
            times.append(time+bridge_length)
            wait.removeFirst()
        }
    }
    return times.last!
}
