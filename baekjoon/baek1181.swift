//
//  baek1181.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/11/17.
//

import Foundation

let num = Int(readLine()!)!
var wordList : [String] = []
var answer = ""
for _ in 0..<num{
    var input = readLine()!
        wordList.append(input)
}

wordList = Array(Set(wordList))

var sortedWordList = wordList.sorted{
    if $0.count == $1.count{
        return $0 < $1
    }else{
        return $0.count < $1.count
    }
}
for i in 0..<sortedWordList.count{
    answer += "\(sortedWordList[i])\n"
}
print(answer)
