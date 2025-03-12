//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2/22/25.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let numArr = readLine()!.split(separator: " ").map{Int($0)!}
var sum = 0
var sumArr: [Int] = []

func solution() {
    var start = numArr.max()!
    var end = numArr.reduce(0) { $0 + $1 }
    var answer = Int.max
    
    while start <= end {
        let pivot = (end+start)/2
        var sum = 0
        var count = 0
        for i in 0..<nm[0] {
            if (sum + numArr[i] > pivot) {
                count += 1
                sum = 0
            }
            sum += numArr[i]
        }
        if (sum != 0) {
            count += 1
        }
        if count <= nm[1] {
            end = pivot-1
            answer = min(answer, pivot)
        } else {
            start = pivot+1
        }
    }
    print(answer)
}

solution()
