//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2/22/25.
//

import Foundation

let n = Int(readLine()!)!
var plusArr: [Int] = []
var minusArr: [Int] = []
var oneCount = 0
var zeroCount = 0
for _ in 0..<n {
    let num = Int(readLine()!)!
    if num == 1 {
        oneCount += 1
    } else if num == 0 {
        zeroCount += 1
    } else if num > 0 {
        plusArr.append(num)
    } else {
        minusArr.append(num)
    }
}

func solution() {
    
    func plusArrAnswer() -> Int {
        let sortPlusArr = plusArr.sorted { $0 > $1 }
        var sumArr: [Int] = []
        var count = 0
        while true {
            if count >= plusArr.count-1 {
                break
            }
            let first = count
            let second = count + 1
            sumArr.append(sortPlusArr[first] * sortPlusArr[second])
            count += 2
        }
        if (count == plusArr.count-1) {
            sumArr.append(sortPlusArr[count])
        }
        return sumArr.reduce(0) { $0 + $1}
    }
    
    func minusArrAnswer() -> Int {
        let sortMinusArr = minusArr.sorted()
        var sumArr: [Int] = []
        var count = 0
        while true {
            if count >= minusArr.count-1 {
                break
            }
            let first = count
            let second = count + 1
            sumArr.append(sortMinusArr[first] * sortMinusArr[second])
            count += 2
        }
        if (count == minusArr.count-1) {
            if zeroCount == 0 {
                sumArr.append(sortMinusArr[count])
            }
        }
        return sumArr.reduce(0) { $0 + $1}
    }
    
    let plusAnswer = plusArrAnswer()
    let minusAnswer = minusArrAnswer()
    print(plusAnswer+minusAnswer+oneCount)
}

solution()
