//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2/22/25.
//

import Foundation

let n = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map{Int($0)!}

func solution(numArr: [Int]) {
    var answer = 0
    
    func mergeSort(num: [Int]) -> [Int] {
        if num.count <= 1 {
            return num
        }
        let mid = num.count/2
        let beforeArr = Array(num[0..<mid])
        let afterArr = Array(num[mid..<num.count])
        var resultArr: [Int] = []
        let sortBeforeArr = mergeSort(num: beforeArr)
        let sortAfterArr = mergeSort(num: afterArr)
        
        var startIndexBefore = 0
        var startIndexAfter = 0
        
        while startIndexBefore < sortBeforeArr.count && startIndexAfter < sortAfterArr.count {
            if sortBeforeArr[startIndexBefore] <= sortAfterArr[startIndexAfter] {
                resultArr.append(sortBeforeArr[startIndexBefore])
                startIndexBefore += 1
            } else {
                resultArr.append(sortAfterArr[startIndexAfter])
                answer += sortBeforeArr.count - startIndexBefore
                startIndexAfter += 1
            }
        }
        
        if startIndexBefore > sortBeforeArr.count - 1 {
            resultArr.append(contentsOf: sortAfterArr[startIndexAfter..<sortAfterArr.count])
        } else {
            resultArr.append(contentsOf: sortBeforeArr[startIndexBefore..<sortBeforeArr.count])
        }
        
        return resultArr
    }
    let _ = mergeSort(num: numArr)
    print(answer)
}

solution(numArr: numArr)
