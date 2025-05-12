import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    // 한 상자에 담긴 사과 개수 (score.count / m) == 0
    // score에서 큰 수 부터 집어넣음 -> 내림차순으로
    // 1. score 정렬을 내림차순으로 정렬
    // 2. 최대 몇상자가 나오는지 구하고 배열로 선언
    // 3. 정렬된 score 배열 앞에서부터 상자 배열로 이동
    // 4. 각 상자에서 최댓값 구함 * 상자 전체 개수 count
    // 5. count 합계 리턴
    var temp = score.sorted(by:>)
    let max_box = (score.count) / m
    var real_box: [[Int]] = []
    var min_num: Int = 0
    var result: Int = 0
    
    // 4개의 배열을 만들고 집어넣음
    for i in 0..<max_box {
        let start = i * m
        let end = min(start+m, temp.count)
        
        if start < end {
            let slice = Array(temp[start..<end])
            real_box.append(slice)
        }
    }
    
    for i in real_box {
        // 각 배열의 최솟값
        min_num = i.min()!
        result += min_num * i.count
    }
    // print(real_box)
    return result
}