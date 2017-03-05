//
//  Object.m
//  11_lecture_Selectors
//
//  Created by Slava on 05.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "Object.h"

@implementation Object

- (void) testMethod {
    NSLog(@"Object тест тест тест ");
}

// метод скрытый инкапсуляцией
- (NSString *) secretMethod {
    return (@"i spy");
}

@end
