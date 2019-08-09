//
//  WFAlgorithmClass.h
//  WFProject
//
//  Created by waddy on 2019/8/8.
//  Copyright © 2019 waddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFAlgorithmClass : NSObject

/**
 字符串反转算法
 思路：1.逐步交换begin指针和end指针的值
      2.begin指针往后移，end指针往前移
      3.退出条件是当begin指针>end指针
  @param cha  要反转的字符串
  @return     返回已经反转好的字符串
 */
+ (char *)reverseWithString:(char *)cha;


/**
 有序数组合并 合并后仍是有序的
 思路：1.指针p指向数组A的第一个元素
      2.指针q指向数组B的第一个元素
      3.如果p<q向数组C中加入p的值，且p往后移，p>q向数组C中加入q的值，q往后移
      4.退出条件当p,q中一个遍历完成，向数组C加入剩余的值
 @param arrA  数组A
 @param arrB  数组B
 @return      返回有序合并后的数组
 */
+ (NSMutableArray *)orderedArrayMergingWithArrayA:(NSArray *)arrA arrayB:(NSArray *)arrB;

/**
 在字符串中找到第一个只出现一次的字符
 哈希算法：存储和查找都用同一个函数，提高查找效率
 思路：1.字母表大小写有256个，通过a-->97，通过97-->a
      2.创建一个长度为256的数组
      3.用出现的字母作为下标的值做+1操作
      4.根据字符串的字母遍历数据第一个值为1的字母
 @param cha  字符串
 @return      返回第一个第一次出现的字符
 */
+ (char)firstAppearOnce:(char *)cha;

/**
 查找两个视图的共同父视图
 思路：1.找出视图A，B的所有父视图B
      2.在两个父视图数组中倒序查找共同父视图放入数组
      3.退出条件为两个父视图的共同父视图不一样
 
 */


/**
 无序数组查找中位数 当个数为q奇数的时中位数为：(n+1)/2;当为偶数时为中间两位相加/2 (n/2+(n/2+1))/2
 快排思想：选取关键字，高低交替扫描
         1.low指向数组第一位，high指向数组最后一位，选取关键字如选第一位为关键字
         2.low与关键字比较找到第一个比关键字大，high与关键字比较找出比关键字小的
         3.如果轮完一圈，关键字左侧都比关键字小，右侧都比关键字大
         4.如果左侧小于(n-1)/2 说明中位数在右侧，继续右侧的快排，寻找中位数
         5.如果右侧小于(n-1)/2 说明中位数在左侧，继续左侧的快排，寻找中位数
 */
@end

NS_ASSUME_NONNULL_END
