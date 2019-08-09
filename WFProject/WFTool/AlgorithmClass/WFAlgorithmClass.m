//
//  WFAlgorithmClass.m
//  WFProject
//
//  Created by waddy on 2019/8/8.
//  Copyright © 2019 waddy. All rights reserved.
//

#import "WFAlgorithmClass.h"

@implementation WFAlgorithmClass
+ (char *)reverseWithString:(char *)cha {
    char *begin = cha;
    char *end = cha + (strlen(cha) - 1);
    while (begin < end) { //退出条件为begin>=end
        char tmp = *begin;
        *begin = *end;
        begin++;
        *end = tmp;
        end--;
        
    }
    return cha;
}

+ (NSMutableArray *)orderedArrayMergingWithArrayA:(NSArray *)arrA arrayB:(NSArray *)arrB{
    int p = 0;
    int q = 0;
    int i = 0;
    NSMutableArray *results = [NSMutableArray array];
    while (p < arrA.count && q < arrB.count) {
        NSInteger a = [arrA[p] integerValue];
        NSInteger b = [arrB[q] integerValue];
        if (a <= b) {
            [results addObject:arrA[p]];
            p++;
        } else {
            [results addObject:arrB[q]];
            q++;
        }
        i++;
    }
    while (p != arrA.count) {
        [results addObject:arrA[p]];
        p++;
    }
    
    while (q != arrB.count) {
        [results addObject:arrB[q]];
        q++;
    }
    
    
    return results;
    
}


+ (char)firstAppearOnce:(char *)cha {
    char *p = cha;
    char result[] = "";
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < 256; i++) {
        [arr addObject:@(0)];
    }
    
    while (*p != '\0') {
        int a = [arr[*p] integerValue];
        a++;
        arr[*p] = @(a);
        p++;
    }
    
    p = cha;
    while (*p != '\0') {
        if([arr[*p] integerValue] == 1){
            *result = *p;
            break;
        }
        p++;
    }

    return *result;
    
}
@end
