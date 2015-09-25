# TextViewFirstCharacter

Sample project to reproduce UITextView firstCharacter issue on iOS9

```
@implementation NSString (Test)
- (char)firstCharacter {
    return 1;
}
@end
```

will not return 1 as expected after a new UITextView

To reproduce the issue open this project in Xcode and run included Unit Tests:
```
    XCTAssertEqual(1, [@"test" firstCharacter], @"should be 1");
```
Test will fail in Xcode7 on iOS9 simulator. Same test will pass in Xcode6.

See https://github.com/paulz/TextViewFirstCharacter/blob/041532e4f387da6b67002a054be1ed1f5659b167/TextViewFirstCharacterTests/TextViewFirstCharacterTests.m#L46
