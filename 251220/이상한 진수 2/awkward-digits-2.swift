import Foundation

var binary = Array(readLine()!)

func pow(_ x: Int, _ y: Int) -> Int {
    var sum = 1
    for i in 0..<y {
        sum *= x
    }
    return sum
}

func solution() {
for i in 0..<binary.count {
    if binary[i] == "0" {
        var cpBn = binary
        cpBn[i] = "1"
        var sum = 0


        for j in 0..<binary.count {
            if cpBn[j] == "1" {
            sum += pow(2, binary.count-1-j)
            }
        }
        print(sum)
        return
    }
}
}

solution()