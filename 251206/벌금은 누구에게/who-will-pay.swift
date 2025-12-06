import Foundation

let firstLine = readLine()!
let tokens = firstLine.split(separator: " ").map { Int($0)! }
let n = tokens[0]
let m = tokens[1]
let k = tokens[2]

var penalizedPerson = [Int]()
for _ in 0..<m {
    penalizedPerson.append(Int(readLine()!)!)
}

var students: [Int] = Array(repeating: 0, count: n)

for i in penalizedPerson {
    students[i-1] += 1

    if students[i-1] >= k {
        print(i)
        break
    } 
}
