
struct Room {
    let roomInsideStatus: String
    let money: Int
    let moveRoomNum: [Int]
}
var answer = 0
func dfs(currentMoney: Int, roomNum: Int, visited: [Bool], destination: Int) {
    var myMoney = currentMoney
    var visitedArr = visited
    visitedArr[roomNum-1] = true
     
    if roomArr[roomNum-1].roomInsideStatus == "L" {
        if roomArr[roomNum-1].money > currentMoney {
            myMoney = roomArr[roomNum-1].money
        }
    } else if roomArr[roomNum-1].roomInsideStatus == "T" {
        if roomArr[roomNum-1].money > currentMoney {
            return
        } else {
            myMoney -= roomArr[roomNum-1].money
        }
    }
    
    if roomNum == destination {
        answer = 1
        return
    }
    
    for room in roomArr[roomNum-1].moveRoomNum {
        if !visitedArr[room-1] {
            dfs(currentMoney: myMoney, roomNum: room, visited: visitedArr, destination: destination)
        }
    }
}

var roomArr: [Room] = []
while true {
    let roomCount = Int(readLine()!)!
    var visited: [Bool] = Array(repeating: false, count: roomCount)
    if roomCount == 0 {
        break
    }
    for _ in 0..<roomCount {
        let roomInfo = readLine()!.split(separator: " ").map {String($0)}
        var moveRoom: [Int] = []
        for item in 2..<(roomInfo.count-1) {
            moveRoom.append(Int(roomInfo[item])!)
        }
        roomArr.append(Room(roomInsideStatus: roomInfo[0], money: Int(roomInfo[1])!, moveRoomNum: moveRoom))
    }
    dfs(currentMoney: 0, roomNum: 1, visited: visited, destination: roomCount)
    if answer == 0 {
        print("No")
    } else {
        print("Yes")
    }
    answer = 0
    visited.removeAll()
    roomArr.removeAll()
}


