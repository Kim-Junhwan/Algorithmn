import Foundation

var input = Int(readLine()!)!
var ring = readLine()!.split(separator: " ").map { Int($0)! }
for item in 1..<ring.count{
    var denominator = ring[0]
    var numerator = ring[item]
    for i in stride(from: numerator, to: 1, by: -1){
        if denominator % i == 0 && numerator % i == 0{
            denominator = denominator / i
            numerator = numerator / i
        }
    }
    print("\(denominator)/\(numerator)")
}
