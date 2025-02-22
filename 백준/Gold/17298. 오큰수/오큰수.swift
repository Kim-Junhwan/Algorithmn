//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2/22/25.
//

import Foundation

let n = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map{Int($0)!}

func solution() {
    var stack: [Int] = []
    var answerArr: [Int] = Array(repeating: 0, count: n)
    for i in 0..<n {
        let current = n-(i+1)
        while (!stack.isEmpty && stack.last! <= numArr[current]) {
            stack.removeLast()
        }
        if stack.isEmpty {
            answerArr[current] = -1
        } else {
            answerArr[current] = stack.last!
        }
        stack.append(numArr[current])
    }
    print(answerArr.map{String($0)}.joined(separator: " "))
}

solution()
