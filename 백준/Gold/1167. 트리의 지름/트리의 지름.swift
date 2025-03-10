//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 2/22/25.
//

import Foundation

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.weight < rhs.weight
    }
    
    let num: Int
    let weight: Int
}

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}


let file = FileIO()

let v = file.readInt()
var relation: [[Node]] = Array(repeating: [], count: v)

for _ in 0..<v {
    var input: [Int] = []
    while true {
        let read = file.readInt()
        input.append(read)
        if (read == -1) {
            break
        }
    }
    for j in stride(from: 1, to: input.count-1, by: 2) {
        relation[input[0] - 1].append(Node(num: input[j]-1, weight: input[j+1]))
    }
}

func solution() {
    
    let last = dfs(depth: 1, num: 0, score: 0)
    print(dfs(depth: 1, num: last.num, score: 0).weight)
    func dfs(depth: Int, num: Int, score: Int) -> Node {
        var dfsVisited: [Bool] = Array(repeating: false, count: v)
        dfsVisited[num] = true
        var weightestNode = Node(num: num, weight: 0)
        func dfsImpl(depth: Int, num: Int, score: Int) {
            if weightestNode < Node(num: num, weight: score) {
                weightestNode = Node(num: num, weight: score)
            }
            
            for node in relation[num] {
                if dfsVisited[node.num] {
                    continue
                }
                dfsVisited[node.num] = true
                dfsImpl(depth: depth+1, num: node.num, score: node.weight+score)
            }
        }
        dfsImpl(depth: depth, num: num, score: score)
        return weightestNode
    }
}

solution()
