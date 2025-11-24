import Foundation

let binary = Array(readLine()!)
var answer = 0

for i in  0..<binary.count {
    if binary[i] == "1" {
        answer += NSDecimalNumber(decimal: pow(2,binary.count-1-i)).intValue
    }
}
print(answer)