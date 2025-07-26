//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 6/17/25.
//

import Foundation

let t = Int(readLine()!)!
var apt: [[Int]] = Array(repeating: Array(repeating: 0, count: 14), count: 15)

for i in 0..<14 {
    apt[0][i] = i+1
}

for i in 1...14 {
    for j in 0..<14 {
        if j == 0 {
            apt[i][j] = 1
            continue
        }
        apt[i][j] = apt[i][j-1]+apt[i-1][j]
    }
}

for _ in 0..<t {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    print(apt[k][n-1])
}
