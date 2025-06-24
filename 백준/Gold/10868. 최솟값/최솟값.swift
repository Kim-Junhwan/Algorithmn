//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 6/17/25.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var treeHeight = 0
var length = n

while length != 0 {
    length /= 2
    treeHeight += 1
}

var treeSize = Int(pow(2, Double(treeHeight+1)))
var leftNodeStartIndex = treeSize/2 - 1

var tree: [Int64] = Array(repeating: Int64.max, count: treeSize+1)

func setTree(index: Int) {
    var currentI = index
    while currentI != 1 {
        if tree[currentI/2] > tree[currentI] {
            tree[currentI/2] = tree[currentI]
        }
        currentI -= 1
    }
}

func getMin(start: Int, end: Int) -> Int64 {
    var answer = Int64.max
    var currentStart = start
    var currentEnd = end
    while currentStart <= currentEnd {
        if currentStart%2 == 1 {
            answer = min(answer, tree[currentStart])
            currentStart += 1
        }
        currentStart /= 2
        if currentEnd%2 == 0 {
            answer = min(answer, tree[currentEnd])
            currentEnd -= 1
        }
        currentEnd /= 2
    }
    return answer
}

for i in leftNodeStartIndex+1...leftNodeStartIndex+n {
    let num = Int64(readLine()!)!
    tree[i] = num
}

setTree(index: treeSize-1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map{Int($0)!}
    var start = ab[0]
    var end = ab[1]
    
    start += leftNodeStartIndex
    end += leftNodeStartIndex
    print(getMin(start: start, end: end))
}
