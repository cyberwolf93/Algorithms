import Foundation

func binarySearch(arr: inout [Int], l: Int, r: Int, target: Int) -> Int { // O(Logn)
    if (l > r) {
        
        return -1
    }
    
    let mid = (l + r) / 2
    if (arr[mid] == target) {
        return mid
    }

    if (arr[mid] < target) {
        return binarySearch(arr: &arr, l: mid+1, r: r, target: target)
    }

    return binarySearch(arr: &arr, l: l, r: mid-1, target: target)
}


func exponentialSearch(arr:  inout [Int], target: Int) -> Int { // O(Log(n))
    if (arr[0] == target) {
        return 0
    }
    var i = 1
    while(i < arr.count && arr[i] < target) {
        i *= 2
    }

    return binarySearch(arr: &arr, l: i/2, r: min(i, arr.count-1), target: target)
}

func main() {
    var arr = [1, 2, 3,4 ,5 ,6 ,7 ,8,9, 10]
    print( "10 is: \(exponentialSearch(arr: &arr,  target: 10))")
    print("====================================")
    print( "1 is: \(exponentialSearch(arr: &arr,  target: 1))")
    print("====================================")
    print( "4 is: \(exponentialSearch(arr: &arr,  target: 4))")
    print("====================================")
    print( "11 is: \(exponentialSearch(arr: &arr,  target: 11))")
    print("====================================")
    print( "-1 is: \(exponentialSearch(arr: &arr,  target: -1))")
    
}


main()