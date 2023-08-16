func mergeIntervals02(intervals: [(Int, Int)], newInterval: (Int, Int)) -> [(Int, Int)] {
    if intervals.count == 0 {
        return [newInterval]
    }
    
    var indexStart = intervals.lastIndex(where: {return newInterval.0 > $0.0}) ?? -1
    var indexEnd = intervals.lastIndex(where: {return newInterval.1 > $0.0}) ?? -1
    var newIntervals: [(Int, Int)] = []
    
    if indexStart >= 0 {
        newIntervals.append(contentsOf: intervals[0..<indexStart])
        let value0 = intervals[indexStart].0 < newInterval.0 ? intervals[indexStart].0 : newInterval.0
        let value1 = intervals[indexEnd].1 > newInterval.1 ? intervals[indexEnd].1 : newInterval.1
        newIntervals.append((value0, value1))
    } else {
        newIntervals.append(newInterval)
    }
    
    let index =  indexEnd + 1
    let count = intervals.count - 1

    if index < count {
        newIntervals.append(contentsOf: intervals[index...count])
    } else if index == count {
        newIntervals.append(intervals[index])
    }
    
    
    return newIntervals
}


let newIntervals01 = mergeIntervals02(intervals: [(1,3), (6,9)], newInterval: (2,8))
let newIntervals02 = mergeIntervals02(intervals: [], newInterval: (2,8))
let newIntervals03 = mergeIntervals02(intervals: [(1,3), (6,9)], newInterval: (2,5))
let newIntervals04 = mergeIntervals02(intervals: [(1,2), (3,5), (6,7), (8,10), (12, 16)], newInterval: (4,9))
let newIntervals05 = mergeIntervals02(intervals: [(1,3), (6,9), (12,16)], newInterval: (2,5))
let newIntervals06 = mergeIntervals02(intervals: [(6,9), (12,16)], newInterval: (1,3))
