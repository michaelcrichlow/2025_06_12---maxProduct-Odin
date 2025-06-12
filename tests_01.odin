package test

import "core:fmt"
print :: fmt.println

main :: proc() {
    print(maxProduct([]int{2, 3, 5, 7}))
    // OUTPUT: 
    // 35
}

maxProduct_00 :: proc(l: []int) -> int {
    max_value := INT_MIN
    for i in 0 ..< len(l) {
        for j in 0 ..< len(l) {
            if i != j {  
                temp_val := l[i] * l[j]
                max_value = max(max_value, temp_val) 
            }
        }
    }
    return max_value
}

maxProduct :: proc(l: []int) -> int {
    max1, max2 := INT_MIN, INT_MIN
    min1, min2 := INT_MAX, INT_MAX

    for val in l {
        if val > max1 {
            max2 = max1
            max1 = val
        } else if val > max2 {
            max2 = val
        }

        if val < min1 {
            min2 = min1
            min1 = val
        } else if val < min2 {
            min2 = val
        }
    }

    return max(max1 * max2, min1 * min2)
}
