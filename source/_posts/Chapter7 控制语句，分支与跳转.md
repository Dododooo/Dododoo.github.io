

# Chapter7 控制语句，分支与跳转

## 7.1 if语句

条件判断，如果条件成立，则执行if中的代码

## 7.2 if  else

```c
		if(all_days!=0)
    {
        printf("%d days total:%.lf%% were below freezing.\n",all_days,100.0*(float)cold_days/all_days);

    }
    //if(all_days==0)
		else
    {
        printf("no data entered");

    }
```

### 7.2.1 介绍getchar()和putchar()

getchar()不带任何参数

它的返回值是输入队列的字符

```c
ch=getchar();

//等价于

scanf("%c",ch);


```

putchar()有参数

```c
putchar(ch);
//等价于
printf("%c",ch);
 
```

由于只处理字符，因此处理速度更快

这两个函数定义在<stdio.h>中



###  7.2.2 ctype.h的字符函数

ctype包含了一系列处理字符的函数

这些字符接受一个字符作为输入，如果该字符属于某特殊类别，则返回一个非零值，否则返回假

用来判断字符是否为某种类型:

- `isalnum()`：是否为字母数字
- `isalpha()`：是否为字母
- `isdigit()`：是否为数字
- `isxdigit()`：是否为十六进制数字符
- `islower()`：是否为小写字母
- `isupper()`：是否为大写字母
- `isblank()`：是否为标准的空白字符（包含空格、水平制表符或换行符）
- `isspace()`：是否为空白字符（空格、换行符、换页符、回车符、垂直制表符、水平制表符等）
- `iscntrl()`：是否为控制字符，比如 Ctrl + B
- `isprint()`：是否为可打印字符
- `isgraph()`：是否为空格以外的任意可打印字符
- `ispunct()`：是否为标点符号（除了空格、字母、数字以外的可打印字符）
- tolower()如果参数是大写字符，该函数返回小写字符;否则返回空值
- tohight()如果参数是小写字符,该函数返回大写字符；否则返回空值

### 7.2.3 多重选择

`else if`语句

```c
if(kwh<BREAK1)
    {
        bill=RATE1*kwh;
    }else if(kwh<=BREAK2)
    {
        bill=BASE1+RATE2*(kwh-BREAK1);
    }else if(kwh<=BREAK3)
    {
        bill=BASE2+RATE3*(kwh-BREAK2);
    }else
    {
        bill=BASE3+RATE3*(kwh-BREAK3);
    }
```



else 和与其**最近**的if相匹配

else if语句实际上还是 if else 语句，只不过是嵌套的if else



## 7.3 逻辑运算符

```c
&&		//与 只有都为1才为1
||		//或 有一个为1就是1
!			//非
  
```

> 驼峰命名:
>
> charCount
>
> bigCharCount



!的优先级很高，&&比||优先级高，&&和||都比关系运算符低

逻辑运算符从左至右进行，一旦发现有使整个表达式为假的因素，则不会进行后面的运算

### 范围

```c
if(range >=90 && range <=100)
```

## 7.5 条件运算符

条件运算符是c中唯一的三元运算符

```c
x= (y<0)?-y:y;
```

如果?前面的条件成立，则取:左侧的值返回，反之

以上语句获得y的绝对值赋值给x

## 7.6 continue和break

if语句的条件取反即可避免使用continue

## 7.7switch和break

```c
switch(ch)
{
    case 'a':
        printf("aa")；
        break;
  	case 'C':
    case 'c':
        printf('bb');
        break;
    case 'd'
        printf("dd");
        break;
  	default:
    		printf("skajdlkjw");
    		break;
}
```



在switch语句中，break会跳出switch,作用域只在switch中

switch从上而下执行

## 7.8 避免使用goto语句

goto易被滥用

```c
if(size>12)
  goto a;
	goto b;
a:cost = cost*1.05;
flag=2;
b:bill = cost *flag;
```









