//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 1/12/25.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var arr: [[Int]] = []
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

for i in 0..<n {
    let rowValue = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append(rowValue)
}

func solution() {
    for i in 1...n {
        for j in 1...n {
            dp[i][j] = dp[i][j-1]+dp[i-1][j]-dp[i-1][j-1]+arr[i-1][j-1]
        }
    }
    
    for _ in 0..<m {
        let query = readLine()!.split(separator: " ").map{Int($0)!}
        let x1 = query[0]
        let y1 = query[1]
        let x2 = query[2]
        let y2 = query[3]
        print(dp[x2][y2]-dp[x2][y1-1]-dp[x1-1][y2]+dp[x1-1][y1-1])
    }
}

solution()
