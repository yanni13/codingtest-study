import Foundation

// 1. 같은 차량번호를 가진 변수가 (입차,출차)내역을 가진게 있는지 확인
// 1-1. (입차, 출차)쌍으로 이루어진거만 존재할 경우
// 1-1-1. (출차-입차)의 값을 분단위로 환산
// 1-2. 입차만 존재할 경우
// 1-2-1. 출차된 내역이 없다면 23:59분에 출차된 것으로 간주하기 때문에 (23:59-입차)를 분단위로 환산
// 1-3. 환산한 분단위의 시간이 180분 이하라면 5000원만 청구
// 1-4. 180분 이상일 경우 [(환산한 분 단위 - 기본 시간) % 단위 시간] * 단위요금
//1.5 올림이 적용되야 되기 때문에 올림으로 나눈 몫을 사용해야 함
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var carRecords: [String: [(String, String)]] = [:]

    for record in records {
        let components = record.split(separator: " ")
        guard components.count == 3 else { continue }
        
        let time = String(components[0])
        let carNumber = String(components[1])
        let status = String(components[2])
        
        carRecords[carNumber, default: []].append((time, status))

    }
    
    // 시간 -> 분 변환 함수
    func toMinutes(_ time: String) -> Int {
        let parts = time.split(separator: ":").map { Int($0)! }
        return parts[0] * 60 + parts[1]
    }
     
    // 차량별 주차 시간 계산
    var totalTimePerCar: [String: Int] = [:]
    
    for (carNumber, records) in carRecords {
        var stack: [Int] = []
        var totalMinutes = 0
        
        for (timeStr, status) in records {
            let minutes = toMinutes(timeStr)
            if status == "IN" {
                stack.append(minutes)
            } else if status == "OUT", let inTime = stack.popLast() {
                totalMinutes += minutes - inTime
            }
        }
        
        if let lastIn = stack.last {
            totalMinutes += toMinutes("23:59") - lastIn
        }
        
        totalTimePerCar[carNumber] = totalMinutes
    }
    
    func calculateFee(_ time: Int) -> Int {
        let baseTime = fees[0]
        let baseFee = fees[1]
        let unitTime = fees[2]
        let unitFee = fees[3]
        

        if time <= baseTime {
            return baseFee
        } else {
            let extra = Double(time - baseTime) / Double(unitTime)
            return baseFee + Int(ceil(extra)) * unitFee
        }
    }
    
    let result = totalTimePerCar
        .sorted(by: { $0.key < $1.key })
        .map { calculateFee($0.value) }
    
    return result
}