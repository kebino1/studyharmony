@Entry
@Component
struct SignPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Button('运算符').onClick((event: ClickEvent) => {
        //逻辑运算符 && || !
        //闰年 能被4整除但不能被100整除 或能被400整除
        let year = 2001
        if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
          console.debug('kebi', '闰年')
        } else {
          console.debug('kebi', '非闰年')
        }

      })

      Button('选择食物').onClick((event: ClickEvent) => {
        let foodList: string[] = ['白切鸡', '椰子鸡', '红烧肉', '清蒸鱼']
        let food = ""
        let position = 3
        switch (position) {
          case 1:
            food = foodList[0]
            break

          case 2:
            food = foodList[1]
            break

          case 3:
            food = foodList[2]
            break

          default :
            food = foodList[3]
            break
        }
        // AlertDialog.show({message:`今天吃${food}`})

        let index = 0
        while (true) {
          if (index >= foodList.length) {
            break;
          }
          console.debug('kebi', foodList[index])
          index++
        }
      })

      Button('调用函数').onClick((event: ClickEvent) => {
        AlertDialog.show({message: `计算面积:${getArea(9)}`})
      })

      Button('函数类型').onClick((event: ClickEvent) => {
        let fn: myFunType = request
        fn()

        let test: myFun2 = dosomething
        test('牛逼')
      })

      Button('使用函数类型测试按钮回调').onClick(onClick)
    }
    .height('100%')
    .width('100%')
  }
}

//函数类型
//使用关键字type，自定义一个函数类型
type myFunType = ()=>void
type myFun2 = (n: string)=>string

let click = () => {
  console.debug('点击了按钮')
}
// let onClick: myFunType = click
let onClick: myFunType = click

function request() {
  console.debug('kebi', '打印请求')
}

let fn = () => {
  console.debug('kebi', "匿名函数")
}

let fn2 = (n: number): number => {
  return 0
}

function dosomething(param: string): string {
  return ""
}

function getArea(width: number, height?: number): number {
  if (height == undefined) {
    height = 10
  }
  let area = width * height
  return area
}