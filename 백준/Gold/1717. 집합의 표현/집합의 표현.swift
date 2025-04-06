import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}

let n = nm[0]
let m = nm[1]

var numArr = Array(0...n)

func findParents(num: Int) -> Int {
    if numArr[num] == num {
        return num
    } else {
        let parent = findParents(num: numArr[num])
        numArr[num] = parent
        return parent
    }
}

func union(x1: Int, x2: Int) {
    let x1Parent = findParents(num: x1)
    let x2Parent = findParents(num: x2)
    
    if x1Parent > x2Parent {
        numArr[x1Parent] = x2Parent
        numArr[x1] = x2Parent
    } else {
        numArr[x2Parent] = x1Parent
        numArr[x2] = x1Parent
    }
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    if input[0] == 0 {
        union(x1: input[1], x2: input[2])
    } else {
        let x1Parent = findParents(num: input[1])
        let x2Parent = findParents(num: input[2])
        print(x1Parent == x2Parent ? "YES" : "NO")
    }
}
