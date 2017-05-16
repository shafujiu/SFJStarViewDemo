# SFJStarViewDemo
rating star  星星评分

评分的星星视图的封装，可以通过点击或者拖动，进行评分。
### 面向用户的接口
```Objective-c
/** 范围是 0 - 1 默认为 0 */
@property (nonatomic, assign) IBInspectable CGFloat rating;
/** 最大星星个数，满分多少星 */
@property (nonatomic, assign) IBInspectable NSInteger maxStarNum;

- (instancetype)initWithFrame:(CGRect)frame maxStarNum:(NSInteger)maxStarNum;
```
### 使用

#### InterfaceBuild
1. 直接将SFJStarView文件夹拖入项目中

<img src="http://on5ajnh9a.bkt.clouddn.com/1494927325.png" width="902" height="530" />

2. 可直接在属性检查器中设置评分属性，以及最大星星数

<img src="http://on5ajnh9a.bkt.clouddn.com/1494927378.png" width="251" height="465" />

#### 代码创建

```Objective-c
    _star = [[SFJStarView alloc] initWithFrame:CGRectMake(10, 40, 100, 20)];
    _star.maxStarNum = 8;
    _star.rating = .5;
    [self.view addSubview:_star];
    
    
    SFJStarView *star = [[SFJStarView alloc] initWithFrame:CGRectMake(10, 100, 100, 20) maxStarNum:10];
    [self.view addSubview:star];
```

### 关于图片资源

图片文件位于`SFJStarView.bundle`资源包中。用户也可以直接跟换内部图片，建议不要改文件名，否者得修改对应代码里面的文件名

>补充： bundle文件的创建，为大家提供一种极简的创建bundle文件的方式

1. 创建图片文件夹，建议名字与你的库名字相同。
2. 将图片文件放入文件夹。
3. 为文件夹增加.bundle后缀名（直接修改文件夹名）。

> bundle 资源的引用，budle里面的图片文件通过文件名已经不能直接访问了，需要完整的路径才行。示例：
```Objective-c
// 加bundle前
[UIImage imageNamed:@"gray"]
// 加bundle后
[UIImage imageNamed:@"SFJStarView.bundle/gray"]
```
