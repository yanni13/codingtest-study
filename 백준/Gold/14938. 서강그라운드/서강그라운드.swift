
let input = readLine()!.split(separator: " ").map {Int($0)!}
let n = input[0]
let m = input[1]
let r = input[2]

var scores: [Int] = [] // 아이템을 담을 배열
let scoreInput = readLine()!.split(separator: " ").map {Int($0)!}
scores.append(contentsOf: scoreInput)

var tupple = [(a: Int, b: Int, dist: Int)]()
for _ in 0..<r {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    let a = input[0]
    let b = input[1]
    let dist = input[2]
    
    tupple.append((a,b,dist))
}

var graph = Array(repeating: [(node: Int, cost: Int)](), count: n+1)
for edge in tupple {
    // 양방향이여서 둘다 고려
    graph[edge.a].append((node: edge.b, cost: edge.dist))
    graph[edge.b].append((node: edge.a, cost: edge.dist))
}

func dijkstra(start: Int) -> [Int] {
    var dist = Array(repeating: Int.max, count: n+1)
    var visited: Set<Int> = []
    dist[start] = 0
    
    var pq = [(node: Int, cost: Int)]()
    pq.append((start, 0))
    
    while !pq.isEmpty {
        pq.sort { $0.cost < $1.cost }
        let current = pq.removeFirst()
        
        if current.cost > dist[current.node] {
            continue
        }
        
        for neighbor in graph[current.node] {
            let newDist = current.cost + neighbor.cost
            if newDist < dist[neighbor.node] {
                dist[neighbor.node] = newDist
                pq.append((node: neighbor.node, cost: newDist))
            }
        }
    }
    
    return dist
}

var maxItem = 0
for i in 1...n {
    let dist = dijkstra(start: i)
    var itemSum = 0
    
    for j in 1...n {
        if dist[j] <= m {
            itemSum += scores[j-1]
        }
    }
    
    maxItem = max(maxItem, itemSum)
}

print(maxItem)
