import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

let people = readLine()!.split(separator: " ").map{Int($0)!-1}

var peopleArr = Array(0...n)
var partyArr: [Int] = []

func findParents(num: Int) -> Int {
    if peopleArr[num] == num {
        return num
    } else {
        let parent = findParents(num: peopleArr[num])
        peopleArr[num] = parent
        return parent
    }
}

func union(x1: Int, x2: Int) {
    let x1Parent = findParents(num: x1)
    let x2Parent = findParents(num: x2)
    
    if x1Parent > x2Parent {
        peopleArr[x1Parent] = x2Parent
        peopleArr[x1] = x2Parent
    } else {
        peopleArr[x2Parent] = x1Parent
        peopleArr[x2] = x1Parent
    }
}

for _ in 0..<m {
    let input = Array(readLine()!.split(separator: " ").map{Int($0)!-1})
    partyArr.append(input[1])
    if input.count == 2 {
        continue
    }
    for i in 1..<input[0]+1 {
        union(x1: input[i], x2: input[i+1])
    }
}
var answer = 0
if (people[0] == -1) {
    print(m)
} else {
    var trueSet: Set<Int> = []
    for i in 1...people[0]+1 {
        let trueFind = findParents(num: people[i])
        trueSet.insert(trueFind)
    }
    for i in 0..<m {
        if !trueSet.contains(findParents(num: partyArr[i])) {
            answer += 1
        }
    }
    print(answer)
}
