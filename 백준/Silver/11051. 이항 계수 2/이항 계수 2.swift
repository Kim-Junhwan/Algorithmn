//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 6/17/25.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
let k = nk[1]
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

func solution() {
    if k == 0 {
            print(1)
            return
        } else if k == 1 {
            print(n)
            return
        }
    for i in 0...n {
        dp[i][1] = i
        dp[i][0] = 1
        dp[i][i] = 1
    }
    
    for i in 2...n {
        for j in 1..<i {
            dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
            dp[i][j] %= 10007
        }
    }
    print(dp[n][k])
}

solution()
