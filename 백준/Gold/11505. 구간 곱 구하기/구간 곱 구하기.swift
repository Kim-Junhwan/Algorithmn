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
let k = nm[2]

var treeHeight = 0
var length = n

while length != 0 {
    length /= 2
    treeHeight += 1
}


var treeSize = Int(pow(2, Double(treeHeight+1)))
var leftNodeStartIndex = treeSize/2 - 1

var tree: [Int64] = Array(repeating: 1, count: treeSize+1)

func setTree(index: Int) {
    var currentI = index
    while currentI != 1 {
        if currentI % 2 == 0 {
                    tree[currentI/2] = tree[currentI] % 1000000007 * tree[currentI+1] % 1000000007
                } else {
                    tree[currentI/2] = tree[currentI] % 1000000007 * tree[currentI-1] % 1000000007
                }
        currentI -= 1
    }
}

func getMulti(start: Int, end: Int) -> Int {
    var partMulti: Int64 = 1
    var currentStart = start
    var currentEnd = end
    
    while currentStart <= currentEnd {
        if currentStart%2 == 1 {
            partMulti = partMulti * tree[currentStart] % 1000000007
            currentStart += 1
        }
        if currentEnd%2 == 0 {
            partMulti = partMulti * tree[currentEnd] % 1000000007
            currentEnd -= 1
        }
        currentStart /= 2
        currentEnd /= 2
    }
    return Int(partMulti)
}

func updateTree(index: Int, num: Int) {
    var currentIndex = leftNodeStartIndex+index
    tree[currentIndex] = Int64(num)
    
    while currentIndex > 1 {
        let parent = currentIndex/2
        tree[parent] = tree[parent*2] % 1000000007 * tree[parent*2+1] % 1000000007
        currentIndex /= 2
    }
}

for i in leftNodeStartIndex+1...leftNodeStartIndex+n {
    let num = Int64(readLine()!)!
    tree[i] = num
}

setTree(index: treeSize-1)

for _ in 0..<m+k {
    let abc = readLine()!.split(separator: " ").map{Int($0)!}
    let a = abc[0]
    let b = abc[1]
    let c = abc[2]
    
    if a == 1 {
        updateTree(index: b, num: c)
    } else {
        print(getMulti(start: b+leftNodeStartIndex, end: c+leftNodeStartIndex))
    }
}
