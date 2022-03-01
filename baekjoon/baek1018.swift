//
//  baek1018.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2021/10/29.
//

import Foundation

var boardSize = readLine()!.split(separator: " ").map(){Int($0)!}
var answer = 999

var board : [[Bool]] = []

for i in 0..<boardSize[0]{
    var boardLine = readLine()!.map{$0 == "B" ? true : false}
    board.append(boardLine)
}

for i in 0..<boardSize[0]-7{
    for j in 0..<boardSize[1]-7{
        findBoardChangeNumber(startX: i, startY: j)
    }
}

print(answer)

func findBoardChangeNumber(startX : Int, startY : Int){
    var count = 0
    var startColor = board[startX][startY]
    
    for i in startX..<startX+8{
        for j in startY..<startY+8{
            if board[i][j] != startColor{
                count += 1
            }
            startColor = !startColor
        }
        startColor = !startColor
    }
    answer = min(answer,min(count, 64-count))
}
