import Foundation

let areaSize = readLine()!.split(separator: " ").map { Int($0)! }

var sharkArea: [[Int]] = []
var sharkQueue: [(Int,Int)] = []
for i in 0..<areaSize[0] {
    var j = 0
    var input = readLine()!.split(separator: " ").map { str -> Int in
        let strToInt = Int(str)!
        if strToInt == 1 {
            sharkQueue.append((i,j))
        }
        j += 1
        return strToInt
    }
    sharkArea.append(input)
}

var isFirst = true
for _ in 0..<sharkQueue.count{
    let shark = sharkQueue.removeFirst()
    for i in 0..<areaSize[0] {
        for j in 0..<areaSize[1] {
            if sharkArea[i][j] == 1 {
                continue
            }
            if isFirst {
                sharkArea[i][j] = max(abs(shark.0-i) , abs(shark.1-j))+1
            } else {
                sharkArea[i][j] = min(sharkArea[i][j], max(abs(shark.0-i) , abs(shark.1-j))+1)
            }
        }
    }
    isFirst = false
}

var answer = 0
for item in sharkArea {
    answer = max(answer ,item.max()!)
}
print(answer-1)