//
//  programmers42746.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2022/02/10.
//

import Foundation
func solution(_ numbers:[Int]) -> String {
    var stringNumbers = numbers.map{String($0)}
    var sortedNumbers = stringNumbers.sorted { $0+$1 > $1+$0}.reduce(""){$0 + $1}
    if Int(sortedNumbers) == 0{
        return "0"
    }else{
        return sortedNumbers
    }
}

print(solution([3, 30, 34, 5, 9]))
