import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]

struct Bus {
    let start: Int
    let end: Int
    let time: Int
}

var busArr: [Bus] = []

for _ in 0..<m {
    let bus = readLine()!.split(separator: " ").map{ Int($0)! }
    busArr.append(Bus(start: bus[0], end: bus[1], time: bus[2]))
}

func solution() {
    var minDistanceArr: [Int] = Array(repeating: 100000000, count: n + 1)
    minDistanceArr[1] = 0
    for i in 1..<n {
        for bus in busArr {
            if minDistanceArr[bus.start] >= 100000000 { continue }
            if minDistanceArr[bus.end] > minDistanceArr[bus.start] + bus.time {
                minDistanceArr[bus.end] = minDistanceArr[bus.start] + bus.time
            }
        }
    }
    var hasMinusCycle = false
    
    for i in 0..<m {
        let bus = busArr[i]
        if (minDistanceArr[bus.start] >= 100000000 ) { continue }
        if minDistanceArr[bus.end] > minDistanceArr[bus.start] + bus.time {
            hasMinusCycle = true
            break
        }
    }
    
    if hasMinusCycle {
        print("-1")
    } else {
        for i in 2...n {
            if minDistanceArr[i] >= 100000000 {
                print("-1")
            } else {
                print(minDistanceArr[i])
            }
        }
    }
}

solution()
