import Foundation

final class FileIO {
  private var buffer:[UInt8]
  private var index: Int
  
  init(fileHandle: FileHandle = FileHandle.standardInput) {
    buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    index = 0
  }
  
  @inline(__always) private func read() -> UInt8 {
    defer { index += 1 }
    
    return buffer.withUnsafeBufferPointer { $0[index] }
  }
  
  @inline(__always) func readInt() -> Int {
    var sum = 0
    var now = read()
    var isPositive = true
    
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
    while now >= 48, now <= 57 {
      sum = sum * 10 + Int(now-48)
      now = read()
    }
    
    return sum * (isPositive ? 1:-1)
  }
  
  @inline(__always) func readString() -> String {
    var str = ""
    var now = read()
    
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    while now != 10
            && now != 32 && now != 0 {
      str += String(bytes: [now], encoding: .ascii)!
      now = read()
    }
    
    return str
  }
}

let io = FileIO()
let n = io.readInt(), d = io.readInt(), k = io.readInt(), c = io.readInt()
var sushi = [Int]()

for _ in 0 ..< n {
  sushi.append(io.readInt())
}

var used = [Int](repeating: 0, count: d + 1)
var cnt = 0
for i in 0 ..< k {
  if used[sushi[i]] == 0 {
    cnt += 1
  }
  used[sushi[i]] += 1
}

var l = 0, r = k % n, answer = used[c] == 0 ? cnt + 1 : cnt

while l < n {
  used[sushi[l]] -= 1
  if used[sushi[l]] == 0 {
    cnt -= 1
  }
  l += 1
  
  if used[sushi[r]] == 0 {
    cnt += 1
  }
  used[sushi[r]] += 1
  r = (r + 1) % n
  
  answer = max(answer, cnt)
  
  if used[c] == 0 {
    answer = max(answer, cnt + 1)
  }
}

print(answer)