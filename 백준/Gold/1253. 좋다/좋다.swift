//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 1/12/25.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }

let sortedArr = arr.sorted { $0 < $1 }

func solution() {
    var answer = 0
    
    for i in 0..<n {
        var start = 0
        var end = n-1
        while start < end {
            let sum = sortedArr[start] + sortedArr[end]
            if sum == sortedArr[i] {
                if (i != start) && (end != i) {
                    answer += 1
                    break
                } else if start == i {
                    start += 1
                } else if end == i {
                    end -= 1
                }
            } else if sum < sortedArr[i] {
                start += 1
            } else {
                end -= 1
            }
        }
    }
    print(answer)
}

solution()
