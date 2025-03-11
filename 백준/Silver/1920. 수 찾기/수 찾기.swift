import Foundation

let n = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map{Int($0)!}

let m = Int(readLine()!)!
let findArr = readLine()!.split(separator: " ").map{Int($0)!}

func solution() {
    let sortNumArr = numArr.sorted()
    
    for findNum in findArr {
        print(binarySearch(num: findNum) ? "1" : "0")
    }
    // 1 2 3 4 5
    func binarySearch(num: Int) -> Bool {
        var start = 0
        var end = sortNumArr.count-1
        while true {
            if end < start {
                return false
            }
            if end == start {
                return sortNumArr[start] == num
            }
            var pivot = ((end-start)/2+start)
            if sortNumArr[pivot] == num {
                return true
            } else if sortNumArr[pivot] > num {
                end = pivot-1
            } else {
                start = pivot+1
            }
        }
    }
}

solution()
