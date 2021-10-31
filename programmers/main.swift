//
//  progeammers 다리를 지나는 트럭.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/10/29.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 0
    var bridge : [Int] = []
    var nonPassTruck = 0
    while (nonPassTruck != truck_weights.count-1){
        
        if (bridge.reduce(0){$0 + $1} < weight){
            if bridge.count < bridge_length{
                bridge.append(truck_weights[nonPassTruck])
                nonPassTruck += 1
            }
        }
        
        time += 1
    }
    return time
}

