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
var sequence: [Int] = []
var stack: [Int] = []
var answerArr: [Int] = []
var answer = ""
for _ in 0..<n {
    sequence.append(fileIO.readInt())
}

func solution() -> String{
    var target = 0
    var item = 1
    while true {
        if sequence[target] >= item {
            for _ in 0...(sequence[target]-item) {
                stack.append(item)
                answer.append("+\n")
                item += 1
            }
        } else {
            let popNum = stack.removeLast()
            if popNum == sequence[target] {
                answerArr.append(popNum)
                answer.append("-\n")
                target += 1
            } else {
                return "NO"
            }
        }
        if answerArr.count == sequence.count {
            return answer
        }
    }
}

print(solution())
