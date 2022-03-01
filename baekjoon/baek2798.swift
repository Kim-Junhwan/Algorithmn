//
//  baek2798.swift
//  algorithmn
//
//  Created by JunHwan Kim on 2021/10/26.
//

import Foundation

var card = readLine()!.split(separator: " ").map{Int($0)!}

var cardNum = readLine()!.split(separator: " ").map{Int($0)!}

func solution(card : [Int], cardNum : [Int])->Int{
    var answer = 0
for x in 0..<cardNum.count-2{
    for y in x+1..<cardNum.count-1{
        for z in y+1..<cardNum.count{
            var sum = cardNum[x] + cardNum[y] + cardNum[z]
            if sum == card[1]{
                return sum
            }
            if (sum < card[1]) && (sum > answer){
                answer = sum
            }
        }
    }
}
    return answer
}

print(solution(card: card, cardNum: cardNum))
