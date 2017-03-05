//
//  AppDelegate.m
//  11_lecture_Selectors
//
//  Created by Slava on 05.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "AppDelegate.h"
#import "Object.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // метод 1
//    SEL selectorOne = @selector(testMethod);
    [self performSelector:@selector(testMethod)];     // вызов селектора в одну строку
//    [self performSelector:selectorOne]; // вызов селектора
    
    // метод 2
//    SEL selectorTwo = @selector(testMethodWhithParametr:);
//    [self performSelector:selectorTwo withObject:@"test string"];
    [self performSelector:@selector(testMethodWhithParametr:) withObject:@"test string"];
    
    // метод 3
//    SEL selectThree = @selector(testMethodWhithTwoParametr:parametrTwo:);
//    [self performSelector:selectThree withObject:@"parametr One" withObject:@"parametr Two"];
    [self performSelector:@selector(testMethodWhithTwoParametr:parametrTwo:) withObject:@"parametr One" withObject:@"parametr Two"];
    
    // c задержкой в 5 секунд
    [self performSelector:@selector(testMethod) withObject:nil afterDelay: 5.f]; // появелнеие с задержкой в 5 секуед
    
    Object *obj = [Object new];
    [self performSelector:@selector(testMethod)];
    [obj performSelector:@selector(testMethod)];
    
#pragma mark - Incapsulation secretMethod
    // метод скрытый инкапсуляцией
    NSString *secretText =  [obj performSelector:@selector(secretMethod)];
    NSLog(@"secret Method - %@", secretText);
    
#pragma mark - NSinteger
    // метод передающий NSinteger (примитивные типы)
    [self performSelector:@selector(testMethodWhithInt:) withObject:[NSNumber numberWithInt:2]];
    
    
    // вывод селектора из
    NSString *callFromSelector = NSStringFromSelector(@selector(testMethod));   // из селектора делаем строку
    SEL callSelectorFromString = NSSelectorFromString(callFromSelector);        // из строки делаем селетктор
    
    
    
    
    // метод который принимает более 3 параметров (Примитивных и Строковых типов данных)
    NSString *string = [self testMethodAllTyps:@"строка" par2:2 par3:2.2323f par4:1];
    NSLog(@"string = %@", string);
    return YES;
}

- (void) testMethod {
    NSLog(@"тест тест тест ");
}
// метод с параметром
- (void) testMethodWhithParametr: (NSString *) string {
    NSLog(@"test Method Whith Parametr - %@", string);
}

// мктод с двумя параметрами
- (void) testMethodWhithTwoParametr: (NSString *) stringOne parametrTwo: (NSString *)stringTwo {
    NSLog(@"parametr one - %@, parametr two - %@", stringOne, stringTwo);
}

// метод передающий NSinteger (примитивные типы)
- (void) testMethodWhithInt: (NSInteger) intValue {
    NSLog(@"test Method Whith Int = %d", intValue); // печатает рандомное число test Method Whith Int = 2070407952
}

// метод который принимает более 3 параметров (Примитивных и Строковых типов данных)
- (NSString *) testMethodAllTyps: (NSString *) string par2: (NSInteger) intValue par3: (CGFloat) floatValue par4: (BOOL) boolValue {
    return [NSString stringWithFormat:@"string - %@, par2 - %d, par3 - %.2f, par4 - %hhd", string, intValue, floatValue, boolValue];
}








- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
