//
//  baek2108.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/11/11.
//
import Foundation

var num = Int(readLine()!)!
var numList : [Int] = []
var numDictionary : [Int : Int] = [:]
var count = 0
var sum = 0

for _ in 0..<num{
    var input = Int(readLine()!)!
    sum += input
    numDictionary[input] = (numDictionary[input] != nil ? numDictionary[input]! : 0)+1
    count = count < numDictionary[input]! ? numDictionary[input]! : count
    numList.append(input)
}
numList = numList.sorted(by: <)
let filter = numDictionary.filter(){$0.value == count}
let countSorted = filter.sorted(){$0.key < $1.key}

print(Int(round(Double(sum) / Double(num))))
print(numList[num/2])
print(countSorted[countSorted.count > 1 ? 1 : 0].key)
print(numList.last! - numList.first!)
