//
//  NSStringTests.m
//  SampleProject
//
//  Created by Neil on 05/12/2012.
//  Copyright (c) 2012 @supermarin | supermar.in. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <ObjectiveSugar/ObjectiveSugar.h>

SPEC_BEGIN(StringAdditions)

describe(@"Foundation-style functions", ^{

    it(@"NSStringWithFormat makes NSString -stringWithFormat", ^{

        [[NSStringWithFormat(@"This is %@", @1) should] equal:@"This is 1"];
    });

});

describe(@"Additions", ^{

    NSString *sentence = @"Jane Doe's going    in a shop,and,yeah;";

    it(@"-split splits by whitespace", ^{
        [[[@" the\r\nquick brown\t \tfox\n" split] should] equal:@[@"the", @"quick", @"brown", @"fox"]];
    });

    it(@"-split: splits with given delimiter", ^{
        [[[sentence split:@","] should] equal:@[@"Jane Doe's going    in a shop", @"and", @"yeah;"]];
    });

    it(@"-split: splits with delimiter string, not just a char", ^{
        [[[@"one / two / three" split:@" / "] should] equal:@[@"one", @"two", @"three"]];
    });

    it(@"contains string", ^{
        [[@([sentence containsString:@"jane doe"]) should] beTrue];
    });

    context(@"CamelCase and snake_case", ^{

        it(@"converts snake_cased to CamelCased", ^{
            [[[@"snake_case" camelCase] should] equal:@"SnakeCase"];
        });

        it(@"handles correctly snake case on beginning and at the end", ^{
            [[[@"_snake_case" camelCase] should] equal:@"SnakeCase"];
            [[[@"snake_case_" camelCase] should] equal:@"SnakeCase"];
        });

    });

    context(@"lowerCamelCase", ^{
        it(@"converts snake_case to snakeCase", ^{
            [[[@"snake_case" lowerCamelCase] should] equal:@"snakeCase"];
        });

        it(@"handles extraneous underscores", ^{
            [[[@"_snake_case" lowerCamelCase] should] equal:@"snakeCase"];
            [[[@"snake_case_" lowerCamelCase] should] equal:@"snakeCase"];
        });

    });

    it(@"-strip strips whitespaces and newlines from both ends", ^{
        [[[@"\n  Look mo, no empties!\n \n\n  " strip] should] equal:@"Look mo, no empties!"];
    });

});



SPEC_END
