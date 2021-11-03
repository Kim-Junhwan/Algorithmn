//
//  baek10989.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/11/03.
//

import Foundation



var num = Int(readLine()!)!
var countList : [Int] = Array(repeating: 0, count: 10001)
var numList : [Int] = []
var sortedList : [Int] = Array(repeating: 0, count: num)

for _ in 0..<num{
    var inputNum = Int(readLine()!)!
    numList.append(inputNum)
    countList[inputNum] += 1
}

for item in 1..<countList.count{
    countList[item] += countList[item-1]
}
for item in numList.reversed(){
    countList[item] -= 1
    sortedList[countList[item]] = item
}

print(sortedList)
