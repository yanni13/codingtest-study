import Foundation

let N = Int(readLine()!)! // 지하철 호선 수
var lineToStations = [[Int]]()         // 각 호선이 포함하는 역 목록
var stationToLines = [Int: [Int]]()    // 각 역이 포함된 노선 목록

// 입력 처리
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let stations = Array(input[1...]) // 첫 원소는 개수, 생략
    lineToStations.append(stations)
    for station in stations {
        stationToLines[station, default: []].append(lineToStations.count - 1)
    }
}

let targetStation = Int(readLine()!)!

// 전체 BFS 시도
var minTransfer = Int.max

for i in 0..<N {
    if lineToStations[i].contains(0) {
        let transferCount = bfs(startLine: i, targetStation: targetStation)
        if transferCount != -1 {
            minTransfer = min(minTransfer, transferCount)
        }
    }
}

print(minTransfer == Int.max ? -1 : minTransfer)


// MARK: - BFS 함수
func bfs(startLine: Int, targetStation: Int) -> Int {
    var queue = [(line: Int, transfer: Int)]()
    var visitedLines = Set<Int>()
    var visitedStations = Set<Int>()
    
    queue.append((startLine, 0))
    visitedLines.insert(startLine)
    
    while !queue.isEmpty {
        let (currentLine, transferCount) = queue.removeFirst()
        
        for station in lineToStations[currentLine] {
            // 목표 역에 도달한 경우
            if station == targetStation {
                return transferCount
            }
            
            // 아직 방문하지 않은 역이라면
            if !visitedStations.contains(station) {
                visitedStations.insert(station)
                for nextLine in stationToLines[station] ?? [] {
                    if !visitedLines.contains(nextLine) {
                        visitedLines.insert(nextLine)
                        queue.append((nextLine, transferCount + 1)) // 환승
                    }
                }
            }
        }
    }
    
    return -1 // 도달 불가능
}
