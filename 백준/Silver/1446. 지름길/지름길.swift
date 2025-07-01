import Foundation

let input = readLine()!.split(separator: " ").map {Int($0)!}
let N = input[0] // 지름길 갯수
let D = input[1] // 고속도로의 길이

var shortcuts = [(start: Int, end: Int, dist: Int)]()
var distance = Array(repeating: Int.max, count: D+1)
for _ in 0..<N {
    let info = readLine()!.split(separator: " ").map {Int($0)!}
    let start = info[0]
    let end = info[1]
    let distance = info[2]
    
    if end <= D, distance < (end-start) {
        shortcuts.append((start, end, distance))
    }
}

distance[0] = 0

for i in 0...D { // D까지의 경우
    if i > 0 {
        distance[i] = min(distance[i], distance[i - 1] + 1) // distance의 값을 채우기 위해
    }
    for shortcut in shortcuts {
        if shortcut.start == i {
            if shortcut.end <= D {
                distance[shortcut.end] = min(distance[shortcut.end], distance[i] + shortcut.dist)
            }
        }
    }
}

print(distance[D])
