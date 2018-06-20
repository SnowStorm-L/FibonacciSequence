//
//  ViewController.m
//  FibonacciSequence
//
//  Created by L on 2018/4/10.
//  Copyright © 2018年 L. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 斐波那契数列的 迭代(Iteration)和递归(Recursion)实现方式
    // F(0)=1，F(1)=1, F(n)=F(n-1)+F(n-2)（n>=2，n∈N*）
    // 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233，377，610，987，1597，2584，4181，6765，10946，17711，28657，46368
    
    int input = 4;

    NSLog(@"%d", [self FibonacciSequenceIteration:input]);
    NSLog(@"%d", [self FibonacciSequenceRecursion:input]);
    
    // Swift 实现
    // sequence(state: (0, 1)) { (state: inout (Int64, Int64)) -> Int64?  in defer {state = (state.1, state.0 + state.1)};return state.0 }.prefix(10).map { $0 }
}

- (int)FibonacciSequenceIteration:(int)input {
    if (input < 3) return 1;
    int first = 1, second = 1, temp = 0;
    for (int i = 0; i < input-2; i++) {
        temp = first + second;
        first = second;
        second = temp;
    }
    return temp;
}

- (int)FibonacciSequenceRecursion:(int)input {
    if (input <= 2) return 1;
    return [self FibonacciSequenceRecursion:input-1] + [self FibonacciSequenceRecursion:input-2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
