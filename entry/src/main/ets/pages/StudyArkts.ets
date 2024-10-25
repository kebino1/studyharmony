/**
 * 学习ArkTS语法
 */
import HashMap from '@ohos.util.HashMap'

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
datas[0]

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
interface Person {
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
  build() {
    Text('学习ArkTS语法').onClick(() => {
      println('ceshi')
    }).fontWeight(FontWeight.Bold)
  }
}