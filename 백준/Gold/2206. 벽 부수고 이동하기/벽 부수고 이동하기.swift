//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 1/12/25.
//

import Foundation

struct Horse {
    let canBreakWall: Bool
    let x: Int
    let y: Int
    let count: Int
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var map: [[Bool]] = []
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: 2)
let dx = [1,0,-1,0]
let dy = [0,-1,0,1]

for _ in 0..<n {
    let input = Array(readLine()!).map { $0 == "0" ? true : false }
    map.append(input)
}

func solution() {
    var queue: [Horse] = [Horse(canBreakWall: true, x: 0, y: 0, count: 1)]
    visited[0][0][0] = true
    visited[1][0][0] = true
    var idx = 0
    while queue.count > idx {
        let horse = queue[idx]
        idx += 1
        if horse.x == m-1 && horse.y == n-1 {
            print(horse.count)
            return
        }
        for i in 0..<4 {
            let nextX = horse.x + dx[i]
            let nextY = horse.y + dy[i]
            if nextX < 0 || nextY < 0 || nextX >= m || nextY >= n || visited[horse.canBreakWall ? 0 : 1][nextY][nextX] {
                continue
            }
            //벽을 만난 경우
            if !map[nextY][nextX] {
                //벽 부술수 있는 경우 append
                if horse.canBreakWall {
                    queue.append(Horse(canBreakWall: false, x: nextX, y: nextY, count: horse.count+1))
                    visited[0][nextY][nextX] = true
                    if nextX == m-1 && nextY == n-1 {
                        print(horse.count+1)
                        return
                    }
                }
            } else {
                
                if !visited[horse.canBreakWall ? 0 : 1][nextY][nextX] {
                    queue.append(Horse(canBreakWall: horse.canBreakWall, x: nextX, y: nextY, count: horse.count+1))
                    visited[horse.canBreakWall ? 0 : 1][nextY][nextX] = true
                    if nextX == m-1 && nextY == n-1 {
                        print(horse.count+1)
                        return
                    }
                }
            }
            
        }
    }
    print("-1")
}

solution()
