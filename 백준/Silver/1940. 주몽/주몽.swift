//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 1/12/25.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

let sortedArr = arr.sorted { $0 < $1 }

func solution() {
    var start = 0
    var end = sortedArr.count-1
    var answer = 0
    
    while start != end {
        var sum = sortedArr[start]+sortedArr[end]
        if sum == m {
            answer += 1
            end -= 1
        } else if sum < m {
            start += 1
        } else {
            end -= 1
        }
    }
    print(answer)
}

solution()
