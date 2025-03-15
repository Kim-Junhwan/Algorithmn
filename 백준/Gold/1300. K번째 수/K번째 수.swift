

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

func solution() {
    var start = 1
    var end = k
    var answer = 0
    
    while start <= end {
        let middle = (start+end)/2
        var count = 0
        for i in 1...n {
            count += min(middle/i, n)
        }
        
        if count < k {
            start = middle + 1
        } else {
            answer = middle
            end = middle - 1
        }
    }
    print(answer)
}

solution()
