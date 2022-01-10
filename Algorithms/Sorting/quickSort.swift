import Foundation

func swap(arr: inout [Int],_ a: Int,_ b: Int) {
    let temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
}



func partition(arr: inout [Int], l: Int, r: Int) -> Int {

    var i = l - 1
    var j = l
    let piv = r
    while(j <= r - 1) {
        if (arr[j] < arr[piv]) {
            i += 1
            swap(arr: &arr,i, j)
        }

        j += 1
    }
    
    swap(arr: &arr,i+1, piv)
    return i+1

}

func quickSort(arr: inout [Int], l: Int, r: Int) {
    if (l > r) {
        return
    }
    
    let piv = partition(arr: &arr, l: l, r: r)

    quickSort(arr: &arr, l: l, r: piv - 1)
    quickSort(arr: &arr, l: piv + 1, r: r)
}

func main() {
    var arr = [64, 34, 25, 12, 100, 22, 11, 90]
    quickSort(arr: &arr, l: 0, r: arr.count - 1)
    print(arr)
    print("==================================")
    var arr1 = [11, 12, 22, 25, 34, 64, 90]
    quickSort(arr: &arr1, l: 0, r: arr1.count - 1)
    print(arr1)
    print("==================================")
    var arr2 = [90, 64,34,25,22,12,11]
    quickSort(arr: &arr2, l: 0, r: arr2.count - 1)
    print(arr2)


}
main()