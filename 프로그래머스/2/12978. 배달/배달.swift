import Foundation


/// 필요한 변수
/// - road를 저장할 2차원 graph 배열
/// - 가능한 정점 집합을 모아놓는 1차원 배열(중복 필요없으니까 set)

// ✅ 다익스트라 플로우
// 1. 시작 노드를 기준으로 거리 배열 초기화
// 2. 최소 거리인 노드를 우선순위 큐에서 pop
// 3. 해당 노드의 인접 노드들을 보며, 현재 거리 + 이동 거리 < 기존 거리이면 갱신
// 4. 갱신된 노드를 다시 큐에 push
// 5. 큐가 빌 때까지 반복
// 6. 마지막에 거리 배열 중에서 거리 <= K인 노드 개수 반환

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    var graph = [Int:[(Int, Int)]]()
    
    for r in road {
        let (a, b, cost) = (r[0], r[1], r[2])
        graph[a, default: []].append((cost, b))
        graph[b, default: []].append((cost, a))
    }
    
    let distances = dijkstra(graph, 1)
    let reachable = distances.values.filter { $0 <= k }.count


    return reachable
}

// 다익스트라 함수
func dijkstra(_ graph: [Int: [(Int, Int)]], _ start: Int) -> [Int:Int] {
    var heap = Heap()
    heap.push((0, start))
    
    var distances: [Int: Int] = [:]
    distances[start] = 0
    
    while !heap.elements.isEmpty {
        let (cur_cost, cur_idx) = heap.pop()!
        
        guard let childs = graph[cur_idx] else { continue }
        for (child_cost, child_idx) in childs {
            var sum_cost = cur_cost + child_cost
            
            if distances[child_idx] == nil || distances[child_idx]! > sum_cost {
                heap.push((sum_cost, child_idx))
                distances[child_idx] = sum_cost
            }
        }
    }
    return distances
}

// MARK: Heap 구조체
struct Heap {
    var elements: [(Int, Int)] = []
    
    mutating func push(_ element: (Int, Int)) {
        elements.append(element)
        elements.sort { $0.0 < $1.0 } // 비용 기준 오름차순 정렬
    }
    
    mutating func pop() -> (Int, Int)? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
}
