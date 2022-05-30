import Foundation

var input = readLine()!.split(separator: " ").map{Int($0)!}

for _ in 0..<input[0]{
    var length = Int(readLine()!)!
    if length <= input[1] || length <= input[2] || Double(length) <= sqrt(pow(Double(input[1]), 2)+pow(Double(input[2]), 2)) {
        print("DA")
    }else{
        print("NE")
    }
}
