//
//  TextViewFirstCharacterTests.m
//  TextViewFirstCharacterTests
//
//  Created by Paul Zabelin on 9/25/15.
//  Copyright © 2015 Paul Zabelin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>

@interface NSString (Test)
- (char)firstCharacter;
@end

@implementation NSString (Test)
- (char)firstCharacter {
    return 1;
}
@end

@interface TextViewFirstCharacterTests : XCTestCase
@end

@implementation TextViewFirstCharacterTests

- (void)test1FirstCharacter {
    XCTAssertEqual(1, [@"test" firstCharacter], @"should be 1");
}

- (void)test2NonSelectableTextView {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSArray *nibObjects = [bundle loadNibNamed:@"UnselectableTextView" owner:nil options:nil];
    XCTAssertNotNil(nibObjects);
    XCTAssertEqual(1, [nibObjects count], @"should have only 1 object");
    UITextView *textView = [nibObjects firstObject];
    XCTAssertTrue([textView isKindOfClass:[UITextView class]], @"should be a text view");
    XCTAssertFalse(textView.selectable, @"should not be selectable");
    XCTAssertEqual(1, [@"test" firstCharacter], @"should be 1");
}

- (void)test3FirstCharacterAfterTextViewLoadsIsNot1_FAILS_ON_iOS9 {
    UITextView *textView = [[UITextView alloc] init];
    XCTAssertNotNil(textView, @"valid text view");
    XCTAssertTrue(textView.selectable, @"only selectable text view cause this problem");
    XCTAssertEqual(1, [@"test" firstCharacter], @"should be 1 but in fact is A on iOS9");
}


@end
