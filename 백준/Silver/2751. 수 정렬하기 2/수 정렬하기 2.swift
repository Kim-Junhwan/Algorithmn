import Foundation

var num = Int(readLine()!)!
var list : [Int] = []
for _ in 0..<num{
    list.append(Int(readLine()!)!)
}
var sortedList = list.sorted()
for item in sortedList{
    print(item)
}
