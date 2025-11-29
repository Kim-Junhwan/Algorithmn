import Foundation

let n = Int(readLine()!)!
var commands = [(x: Int, direction: String)]()

for _ in 0..<n {
    let parts = readLine()!.split(separator: " ")
    let x = Int(parts[0])!
    let direction = String(parts[1])
    commands.append((x: x, direction: direction))
}

enum TileColor {
    case white
    case black 
    case gray
}

struct Tile {
    var currentColor: TileColor?
    var whiteCount: Int
    var blackCount: Int
}

var arr: [Tile] = Array(repeating: Tile(currentColor: nil, whiteCount: 0, blackCount: 0) ,count: 200001)
var current = 100000
for command in commands {
    let direction = command.1
    let distance = command.0
    let start = direction == "L" ? (current - distance + 1) : current
    let end = direction == "L" ? current : (current + distance - 1)
    for i in start ... end {
        if arr[i].currentColor == .gray { continue }
        let drawColor: TileColor = direction == "L" ? .white : .black
        arr[i].currentColor = drawColor
        
        if drawColor == .white {
            arr[i].whiteCount += 1
        } else if drawColor == .black {
            arr[i].blackCount += 1
        }

        if arr[i].blackCount >= 2 && arr[i].whiteCount >= 2 {
            arr[i].currentColor = .gray
        }
    }
    current = direction == "L" ? start : end
}

let whiteTileCount = arr.filter { $0.currentColor == .white }.count
let blackTileCount = arr.filter { $0.currentColor == .black }.count
let grayTileCount = arr.filter { $0.currentColor == .gray }.count

print("\(whiteTileCount) \(blackTileCount) \(grayTileCount)")