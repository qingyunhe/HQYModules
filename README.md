# HQYModules
集成iOS开发中常用功能模块.

GitHub：[何青云](https://github.com/qingyunhe) ｜ Blog：[江城程序猿](http://www.heqingyun.com) ｜ Contact me：<developerqingyun@gmail.com>

---   
##目录
* [UICollection重排](#UICollection重排)
* [级联菜单](#级联菜单)

    
   备注:网页浏览时,gif图偶尔会有非代码原因的卡顿.

---           
    
###UICollection重排

![Mou icon](https://github.com/qingyunhe/HQYModules/blob/master/UICollectionView重排%20.gif)

---    
###级联菜单
![Mou icon](https://github.com/qingyunhe/HQYModules/blob/master/级联菜单.gif)

#####实现思路:

1 分别使用两个继承于UITableViewController的控制器管理左右两侧菜单,分别命名为HQYMainCategoryController(左菜单控制器)和HQYSubCategoryController(右菜单控制器).

2 使用导航控制器push出来的控制器(命名为HQYCascadingMenuController)来管理HQYMainCategoryController和HQYSubCategoryController,将HQYMainCategoryController和HQYSubCategoryController添加为HQYCascadingMenuController的子控制器,并将子控制器的view作为子控件添加到HQYCascadingMenuController的view中.

3 使用代理传值,将HQYMainCategoryController中的数据传递给HQYSubCategoryController.

#####注意事项:
1 默认HQYMainCategoryController的view第0行cell应该处于选中状态,该业务逻辑应该在viewWillAppear方法中实现,而非在viewDidLoad方法中实现.

```objc
- (void)viewWillAppear:(BOOL)animated{
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:(UITableViewScrollPositionTop)];
    
    [self showSubCategoriesDataOfArrowZero];
}

```

2 默认HQYSubCategoryController的view展示HQYMainCategoryController的view第0行cell对应的数据.

```objc
- (void)showSubCategoriesDataOfArrowZero{

    if ([self.delegate respondsToSelector:@selector(categoryViewController:didSelectSubCategories:)]) {
        
        NSDictionary *dict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"health.plist" ofType:nil]][0];
        HYQHealthItem *item = [HYQHealthItem categoryWithDict:dict];
        [self.delegate categoryViewController:self didSelectSubCategories:item.subcategories];
    }
}

---    

待续 😄
