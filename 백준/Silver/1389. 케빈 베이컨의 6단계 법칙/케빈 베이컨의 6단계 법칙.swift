import Foundation

let input = readLine()!.split(separator: " ").map {Int($0)!}
let n = input[0]
let m = input[1]

var graph = Array(repeating: [Int](), count: n+1)
var result: [Int] = []
for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

func bfs(start: Int) -> Int {
    var queue: [Int] = [start]
    var distance = Array(repeating: 0, count: n+1)
    var visited = Array(repeating: false, count: n+1)
    visited[start] = true
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        for next in graph[current] {
            if !visited[next] {
                queue.append(next)
                visited[next] = true
                distance[next] = distance[current] + 1
            }
        }
    }
    return distance.reduce(0, +)
}

for i in 1...n {
    result.append(bfs(start: i))
}

// 가장 작은 케빈 베이컨의 수를 구함
// 그 값을 가진 첫번째 사람의 인덱스를 반환

let minValue = result.firstIndex(of: result.min()!)!
print(minValue+1)
