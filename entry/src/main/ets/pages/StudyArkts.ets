/**
 * 学习ArkTS语法
 */
import HashMap from '@ohos.util.HashMap'
import { JSON } from '@kit.ArkTS'

//基本类型 string(字符串) number(数字) boolean(布尔值)
//变量 let
//let 变量名:类型 = 变量值
let title: string = 'hello world'
let islogin: boolean = true

//常量 const
//const 常量名:类型 = 常量值
const PI: number = 3.14

//数组
//let 数组名: 类型[] = [数据1， 数据2....]
//取值 数组名[索引]
let datas: string[] = ['1', 'xiaomi', 'huawei']
let phones: Array<string> = ['iphone', 'xiaomi', 'huawei']
//查
let data = datas[0]
//改
datas[1] = 'ff'
//增 .unshift：往开头加  push：往结尾加 2种添加方法会返回添加后数组长度
datas.unshift('往开头加')
datas.push('很好..')
//删  shift:从开头开始删  pop:从结尾开始删  2种删除方法返回删除项
//开头开始删
datas.shift()
//结尾开始删
datas.pop()

//任意位置删除/增加元素 splice(起始位置，删除个数，新增元素1,2,3...)
datas.splice(1,0, '新增的袁术')

// console.log('kebi',`数组长度`+datas.length)
console.log('kebi',`删除项`+datas.pop())
for (let i = 0;i < datas.length;i++) {
  console.log('kebi',`遍历数组：${datas[i]}`)
}

//函数
/**
 * function 函数名(参数名:类型): 返回值 {
 *    函数体
 * }
 */
function println(message: string): string {
  console.log('kebi', message)
  return message
}

function buy(price: number, num: number): number {
  let total = price * num
  return total
}

//箭头函数
/**
 * let 函数名 = (参数1:类型, 参数2:类型) => {
 *    函数体
 * }
 */
let request = (message: string) => {
  console.log('kebi', '调用箭头函数')
  return '1231'
}

//对象
//1、定义接口
export interface Person {
  name: string
  age: number
  sex?: boolean
  //对象方法
  eat: (name: string, goods: string) => void
}

//2、基于接口 定义对象
let girl: Person = {
  name: '杨幂', age: 1,
  eat: (name, goods) => {
    console.log('kebi', `${name}我喜欢吃${goods}`)
  }
}
//3、获取对象属性
girl.eat(girl.name, '水果')

//联合类型
//let 变量名: 类型1 | 类型2 |... = 变量值
let requestParma : string | HashMap<string, string> | number = '1'
//联合类型可以将变量值约定在一组数据范围内选择
//性别：男 女 保密
let gender: 'man'|'woman'|'secret' = 'man'

//枚举类型
enum ThemeColor {
  Red = '#ff0f29',
  Blue = '#ff0b87e5',
  Black = '#ff171818'
}
let currentColor = ThemeColor.Red

console.log('kebi', currentColor)

@Entry
@Component
struct study {
  //定义在组件内的变量和状态变量，不需要let修饰，
  @State message:string = 'hello world'
  build() {
    Text(this.message).onClick(() => {
      //访问组件内变量时，需要用this
      this.message = '你好 世界'
      console.log('kebi', this.message);
    }).fontWeight(FontWeight.Bold)
  }
}

/**
 * 字符串拼接
 * 使用+号拼接，只要有一个是字符串，那么+号就是拼接字符串
 */
let name = 'kebi'
let message = '最有价值球员'
console.log('kebi', name+message);

/**
 * 字符串模板
 * 使用反引号： ``
 */
let position = 2
console.log('kebi', `这是第${position}个`);

/**
 * 类型转换
 * 字符串转数字
 * Number(numStr):直接转数字，如果不是数字，返回NaN
 * parseInt():保留整数，去掉小数，开头如果不是数字，返回NaN
 * parseFloat():保留小数，开头如果不是数字，返回NaN
 */
let numStr = '2.5a'
let num = Number(numStr)
console.log('kebi', `字符串转数字:${num}}`);

/**
 * 类型转换
 * 数字转字符串
 * toString:直
 * toFixed(保留小数个数):保留小数个数，四舍五入
 */
let num1 = 2
let numStr1 = num1.toFixed(2)
console.log('kebi', `字符串转数字:${numStr1}`);

/**
 * 语句
 */
//if分支语句
let isStudent = false
if (isStudent) {
  console.log('kebi', `是学生`);
} else {
  console.log('kebi', `不是学生`);
}

//循环语句 while
// let firstNum = 1;
// let total = 0;
// while (firstNum < 101) {
//   total += firstNum
//   firstNum++
//   if (firstNum % 2 == 0) {
//     console.log('kebi', `1到100偶数：${firstNum}`);
//   }
// }
// console.log('kebi', `1到100累加和：${total}`);

//for 循环
/*
for(let i = 1; i < 100; i++) {

}*/


/*
let arra = [10,1,4,-5,-100,25]
let finalArray: number[] = []
for (let item of arra) {
    if (item > 0) {
      finalArray.push(item)
    }
}
console.log('kebi', `${finalArray}`);*/


//对象数组
//接口
interface Student{
  stuId: number,
  name: string
}

let students: Student[] = [
  {stuId:1, name :'kebi'},
  {stuId:2, name :'vip'},
  {stuId:3, name :'hello'}
]

//包括对象的复杂数据，要在日志中打印，需要调用JSON.stringify(复杂类型)，转成字符串
// console.log('kebi', JSON.stringify(students[1]));

//forEach 渲染控制
//forEach(数组, (item:数组的类型， index: number) => {
// })