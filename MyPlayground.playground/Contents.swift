func mergeIntervals(intervals: [(Int, Int)], newInterval: (Int, Int)) -> [(Int, Int)] {
    
    var hasFinished = false
    var indexStart = 0

    
    var newIntervals: [(Int, Int)] = []
    
    var auxIntervals: [(Int, Int)] = []
    auxIntervals.append(contentsOf: intervals)
    auxIntervals.append(newInterval)
    auxIntervals = auxIntervals.sorted{ $0.0 < $1.0 }
    
    if auxIntervals.count == 1 {
        return auxIntervals
    }
    
    let count = auxIntervals.count - 1
    var startPoint: (Int, Int) = auxIntervals[indexStart]
    var endPoint: (Int, Int) = auxIntervals[indexStart + 1]
    
    
    
    while !hasFinished {
        
        if isOverlaping(intervalA: startPoint, intervalB: endPoint) {
            indexStart += 1
            let value0 = startPoint.0 < endPoint.0 ? startPoint.0 : endPoint.0
            let value1 = startPoint.1 > endPoint.1 ? startPoint.1 : endPoint.1
            startPoint = (value0, value1)
            if indexStart + 1 > count {
                newIntervals.append(startPoint)
                hasFinished = true
            } else {
                endPoint = auxIntervals[indexStart+1]
            }
        } else {
            newIntervals.append(startPoint)
            indexStart += 1
            if indexStart >=  count {
                newIntervals.append(endPoint)
                hasFinished = true
            } else {
                startPoint = auxIntervals[indexStart]
                endPoint = auxIntervals[indexStart + 1]
            }
        }
    }
    
    return newIntervals
}

func isOverlaping(intervalA: (Int, Int), intervalB: (Int, Int)) -> Bool {
    return  intervalA.1 > intervalB.0 || intervalA.1 > intervalB.1
}


let newIntervals01 = mergeIntervals(intervals: [(1,3), (6,9)], newInterval: (2,8))
let newIntervals02 = mergeIntervals(intervals: [], newInterval: (2,8))
let newIntervals03 = mergeIntervals(intervals: [(1,3), (6,9)], newInterval: (2,5))
let newIntervals04 = mergeIntervals(intervals: [(1,2), (3,5), (6,7), (8,10), (12, 16)], newInterval: (4,9))

let newIntervals05 = mergeIntervals(intervals: [(1,3), (6,9), (12,16)], newInterval: (2,5))


let newIntervals06 = mergeIntervals(intervals: [(6,9), (12,16)], newInterval: (1,3))

let newIntervals07 = mergeIntervals(intervals: [(3,4), (5,7)], newInterval: (2,3))
let newIntervals08 = mergeIntervals(intervals: [(1,3), (7,8), (9,12)], newInterval: (4,5))
let newIntervals09 = mergeIntervals(intervals: [(1,3), (7,8), (11,12)], newInterval: (9,10))
