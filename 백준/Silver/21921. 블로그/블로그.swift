import Foundation


final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fileIO = FileIO()

let n = fileIO.readInt()
let x = fileIO.readInt()
var viewCountArr: [Int] = Array(repeating: 0, count: n)

for item in 0..<viewCountArr.count {
    viewCountArr[item] = fileIO.readInt()
}

func solution(n: Int, x: Int, arr: [Int]) {
    var start = 0
    var end = start + x - 1
    var maxVisitor = 0
    var maxDayCount = 0
    var slideMaxVisitor = viewCountArr[start...end-1].reduce(0) {$0 + $1}
    
    for item in end..<n {
        slideMaxVisitor += arr[item]
        if maxVisitor == slideMaxVisitor {
            maxDayCount += 1
        } else if slideMaxVisitor > maxVisitor {
            maxVisitor = slideMaxVisitor
            maxDayCount = 1
        }
        slideMaxVisitor -= arr[start]
        start += 1
    }
    if maxVisitor == 0 {
        print("SAD")
    } else {
        print(maxVisitor)
        print(maxDayCount)
    }
}

solution(n: n, x: x, arr: viewCountArr)
