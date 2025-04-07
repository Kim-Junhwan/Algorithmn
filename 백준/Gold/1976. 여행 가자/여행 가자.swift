import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

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

for a in 0..<n {
    let input = Array(readLine()!.split(separator: " ").map{Int($0)!})
    for i in 0..<n {
        if input[i] == 1 {
            union(x1: a, x2: i)
        }
    }
}

let plan = Array(readLine()!.split(separator: " ").map { Int($0)!-1 })
var plansSet: Set<Int> = []
plan.forEach { plansSet.insert(findParents(num: $0)) }

if (plansSet.count == 1) {
    print("YES")
} else {
    print("NO")
}
