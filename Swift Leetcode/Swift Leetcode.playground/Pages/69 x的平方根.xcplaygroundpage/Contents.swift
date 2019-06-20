//: [Previous](@previous)

import Foundation

/*:
 ### x 的平方根
 
 实现 int sqrt(int x) 函数。
 
 计算并返回 x 的平方根，其中 x 是非负整数。
 
 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
 
 示例 1:
 输入: 4
 输出: 2
 
 示例 2:
 输入: 8
 输出: 2

 说明: 8 的平方根是 2.82842...,由于返回类型是整数，小数部分将被舍去。
 */


/*:###
 方法一
 
 二分法
 */

func mySqrt(_ x: Int) -> Int {
    if x <= 1 {
        return x
    }
    var left = 1
    var right = x

    while left < right {
        var mid = left + (right - left) / 2
        
        if( mid*mid > x ){
            right = mid;
        }else{
            left = mid+1;
        }
    }
    return right-1;
}

/*:###
 方法二 牛顿迭代法
 首先随便猜一个近似值x，然后不断令x等于x和a/x的平均数，迭代个六七次后x的值就已经相当精确了
 
 我想求根号2等于多少。假如我猜测的结果为4，虽然错的离谱，但你可以看到使用牛顿迭代法后这个值很快就趋近于根号2了：
 
 (       4  + 2/   4     ) / 2 = 2.25
 (    2.25  + 2/   2.25  ) / 2 = 1.56944..
 ( 1.56944..+ 2/1.56944..) / 2 = 1.42189..
 ( 1.42189..+ 2/1.42189..) / 2 = 1.41423..
 
 这种算法的原理很简单，我们仅仅是不断用(x,f(x))的切线来逼近方程x^2-a=0的根。根号a实际上就是x^2-a=0的一个正实根，这个函数的导数是2x。也就是说，函数上任一点(x,f(x))处的切线斜率是2x。那么，x-f(x)/(2x)就是一个比x更接近的近似值。代入f(x)=x^2-a得到x-(x^2-a)/(2x)，也就是(x+a/x)/2。
 同样的方法可以用在其它的近似值计算中
 */
func mySqrt_1(_ x: Int) -> Int {
    var res = x
    while res * res > x {
        res = (res + x / res) / 2
    }
    return res
}

let result = mySqrt(22)
