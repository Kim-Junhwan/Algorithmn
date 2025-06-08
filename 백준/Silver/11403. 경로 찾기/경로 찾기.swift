import Foundation

let MAXIMUM = 10000000

let n = Int(readLine()!)!
var relation: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
var answer: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
for i in 0..<n {
    let input = readLine()!.split(separator: " ").enumerated().filter{ Int($0.element)! != 0 }.map{ $0.offset }
    input.forEach {
        relation[i][$0] = true
        //relation[$0][i] = true
    }
}


func solution() {
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if relation[i][j] { continue }
                if (relation[i][k] && relation[k][j]){
                    relation[i][j] = true
                }
            }
        }
    }
    var str = ""
    for i in relation {
        for j in i {
            str += !j ? "0 " : "1 "
        }
        str += "\n"
    }
    print(str)
}

solution()
