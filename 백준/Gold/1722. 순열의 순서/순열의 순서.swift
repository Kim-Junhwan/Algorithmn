//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 6/17/25.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int($0)!}

var factorial: [Int] = Array(repeating: 0, count: 21)
var s: [Int] = Array(repeating: 0, count: 21)
var visited: [Bool] = Array(repeating: false, count: 21)

factorial[0] = 1

for i in 1...n {
    factorial[i] = factorial[i-1] * i
}

if (input[0] == 1) {
    var answer = ""
    var k = input[1]
    for i in 1...n {
        var count = 1
        for j in 1...n {
            if visited[j] {
                continue
            }
            if k <= (count * factorial[n-i]) {
                k -= ((count-1) * factorial[n-i])
                s[i] = j
                visited[j] = true
                break
            }
            count += 1
        }
    }
    for i in 1...n {
        answer += "\(s[i]) "
    }
    print(answer)
} else {
    var k = 1
    for i in 1...n {
        s[i] = input[i]
        var count = 0
        for j in 1..<s[i] {
            if !visited[j] {
                count += 1
            }
        }
        k += count * factorial[n-i]
        visited[s[i]] = true
    }
    print(k)
}
