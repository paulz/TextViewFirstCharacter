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
