//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 1/12/25.
//

import Foundation

let n = Int(readLine()!)!

var numArr = Array((1...n))

func solution() {
    var start = 0
    var end = 0
    var answer = 1
    var sum = 1
    
    while end != n-1 {
        if sum < n {
            end += 1
            sum += numArr[end]
        } else if sum > n {
            sum -= numArr[start]
            start += 1
        } else {
            answer += 1
            end += 1
            sum += numArr[end]
        }
    }
    
    print(answer)
}

solution()
