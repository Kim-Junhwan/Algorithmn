import Foundation

var binary = Array(readLine()!)

func pow(_ x: Int, _ y: Int) -> Int {
    var sum = 1
    for i in 0..<y {
        sum *= x
    }
    return sum
}

func twoToTen(_ two: [Character]) -> Int {
    var sum = 0
    for j in 0..<two.count {
            if two[j] == "1" {
            sum += pow(2, two.count-1-j)
            }
        }
    return sum
}

func solution() {
for i in 0..<binary.count {
    if binary[i] == "0" {
        var cpBn = binary
        cpBn[i] = "1"
        print(twoToTen(cpBn))
        return
    }
}
 print(twoToTen(binary))
}



solution()