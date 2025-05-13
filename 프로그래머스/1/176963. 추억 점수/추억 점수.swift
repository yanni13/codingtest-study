import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    //name이랑 yearning을 딕셔너리로 맵핑해야 함
    
    let wordToValue = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    var temp: Int = 0
    var result: [Int] = []

    for i in photo {
        for j in i {
            // 만약 j가 딕셔너리에 존재한다면 -> keys로 바꿈
            if wordToValue.keys.contains(j) {
                if let value = wordToValue[j] {
                    temp += value
                }
            }
        }
        result.append(temp)
        temp = 0
    }
    return result
}