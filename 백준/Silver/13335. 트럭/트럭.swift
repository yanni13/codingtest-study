import Foundation

let input = readLine()!.split(separator: " ").map {Int($0)!}

let N = input[0]
let W = input[1]
let L = input[2]

var weightArray = readLine()!.split(separator: " ").map {Int($0)!} // 트럭무게 배열

var queue: [Int] = []
var end: [Int] = []
var time = 0

while !weightArray.isEmpty {
    if queue.reduce(0, { $0 + $1 }) + weightArray[0] <= L && queue.count < W {
        queue.append(weightArray.removeFirst()) // 트럭 다리에 진입
        end.append(time + W) // 빠질 시간 등록
    }
    time += 1
    if end.first == time {
        queue.removeFirst()
        end.removeFirst()
    }
}

print(time + W)