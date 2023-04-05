---
title: Chapter 6 C控制语句:循环
date: 2023/4/5 23:17:25  # 文章发表时间
tags:
- C_learning
categories: C
#thumbnail: https://xxxxxxxxxx.png # 略缩图
---
`==`用来判断左右两值是否相等，若相等，则该表达式返回值为1

```c
while (expression)
{
  	statement;
}
```

expression非零为真，可以是关系表达式

一次循环被称为一次迭代

构建循环时，先判断表达式的值是否最终会为假，

判断是否会满足条件进入循环

## 关系运算符

```c
<
<=
==
>=
>
!=
```

### fabs()

fabs()是取绝对值的函数，封装在math.h中

C语言中，非零值为真，只有等于0时才是假

> 在判断表达式时，可以把常量放在左侧
>
> `5 ==canose`

### 6.3.4 新的_Bool类型

`_Bool how_to;`

用来声明布尔值

### 优先级

关系运算符的优先级比算数运算符要低

比赋值运算符要高

**关系运算符之间有两种优先级**

* 高优先级:`< <= > >=`
* 低优先级:`== !=`

| 优先级 | 运算符                                                       | 结合律   |
| ------ | ------------------------------------------------------------ | -------- |
| 1      | 后缀运算符：[]   ()   ·   ->   ++   --(类型名称){列表}       | 从左到右 |
| 2      | 一元运算符：++   --   !   ~   +   -   *   &   sizeof_Alignof | 从右到左 |
| 3      | 类型转换运算符：(类型名称)                                   | 从右到左 |
| 4      | 乘除法运算符：*   /   %                                      | 从左到右 |
| 5      | 加减法运算符：+   -                                          | 从左到右 |
| 6      | 移位运算符：<<   >>                                          | 从左到右 |
| 7      | 关系运算符：<<=   >>=                                        | 从左到右 |
| 8      | 相等运算符：==   !=                                          | 从左到右 |
| 9      | 位运算符 AND：&                                              | 从左到右 |
| 10     | 位运算符 XOR：^                                              | 从左到右 |
| 11     | 位运算符 OR：\|                                              | 从左到右 |
| 12     | 逻辑运算符 AND：&&                                           | 从左到右 |
| 13     | 逻辑运算符 OR：\|\|                                          | 从左到右 |
| 14     | 条件运算符：?:                                               | 从右到左 |
| 15     | 赋值运算符：    =     +=     -=    *=    /=    %=    &=    ^=    \|=     <<=    >>= | 从右到左 |
| 16     | 逗号运算符：，                                               | 从左到右 |

​			

## 6.4 不确定循环和计数循环

```c
#include<stdio.h>
int main(void)
{
    const int NUMBER = 22;
    int count = 1;
    while (count <= NUMBER)
    {
        printf("Be my Valentine!%d\n",count);
        count++;
    }
    printf("%d",count);
    return 0;
}
```

计数循环^^

在一个计数循环中涉及三个行为:

1. 必须初始化计数器；
2. 计数器与有限值做比较
3. 每次循环递增计数器

`while(count++ <=NUMBER)`可读性差

## 6.5 for循环

将以上程序改为for循环:

```c
for(count=1;count <= NUMBER;count++)
    {
        printf("Be my Valentine!%d\n",count);
        
    }
```



for循环将**初始化**，**测试**，**递增**三个步骤集成在for循环头中

for循环有三个表达式，

第一个是初始化，只会执行一次，

第二个判断条件，如果为真进入循环体

第三个是递增条件，在执行完循环体语句块时再进行递增

for循环里面的(;;)

分号不能省略

### 6.5.1 for循环的灵活性

* 可以递减for(secs=5,sec>0;sec--)
* 可以让计数器递增2，10,for(sec = 0;sec<60;sec = sec +4)
* 可以用字符代替数字计数for(ch = 'a';ch<'z';ch++)
* 可以测试其他条件for(num=0;num*num*num<1000;num++)
* 可以让递增的量几何增长for(debt = 0;debt<150.0;debt = debt *1.10)
* 可以使用任何合法的表达式，for(x=1;y<=75;y =(++x *5)+50)
* 可以省略一个或者多个表达式

```c
int main(void)
{
  int ans = 2;
  int n;
  
  for(n=3;ans <=25;)
  {
    ans = ans *n;
  }
  printf("%d %d",ans,n);
  
  return 0;
}
```

* 第一个表达式不一定是赋初值，也可以是任何想要只执行一次的表达式,for(printf("Keep entering\n");num!=6;)

## 6.6 其他赋值运算符

```c
scores +=20; //scores = scores +20
dimes -=2;//dimes = dimes -2
bunnies*=2; //bunnies = bunnies *2
time /= 2.73; // time = time /=2.73
reduce %= 3; //reduce = reduce % 3
```

## 6.7 逗号运算符

```c
for(ounces = 1,cost = FIRST_OZ;ounces<=16;ounces++,cost += NEXT_OZ)
```

整个逗号运算符的表达式的值是右侧项的值

计算顺序从左至右

### 6.7.1 zeno遇到for循环

## 6.9 如何选择循环

for(;test==3;)

等价于while(test==3)

一般而言，涉及初始化和更新变量时，涉及索引计数的循环时，用for循环更合适

而涉及到`while(scanf("%d",&test))`，即判断输入是否符合数据类型时可使用while

do while循环适合至少循环一次的情况，而for和while循环都是执行之前测试执行条件。

## 6.10 嵌套循环

嵌套循环一般不要超过三层

```c
int row; 
char ch;
for (row = 0; row<ROWS;row++)
{
    for (ch = 'A'+ROWS;ch<('A'+CAHRS);ch++)
    {
        printf("%c",ch);
    }
    printf("\n");
}
```



## 6.11 数组简介

`scanf("%d,&string[4]");`

把一个值输入到数组的第5位

陷阱：编译器不会检查数组的下标是否正确

`string[50]=24.1;`当string被声明为20个数组元素的数组时，左侧描述不会报错

字符数组的末尾如果有一个**空字符\0**,则也是字符串

数组的元素在内存中也是相邻存储的



调用函数前必须前置声明

现代编程习惯把函数的程序要素分为接口部分和实现部分
