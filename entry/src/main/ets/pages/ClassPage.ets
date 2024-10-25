import { Fruit, Goods, Supplier, Round, DBHelper, MobliePhone} from '../common/Gods'

@Entry
@Component
struct ClassPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Button('创建类').onClick((event: ClickEvent) => {
        let gods = new Goods("茅台", 99, "20241010", 20, "贵州茅台镇")
        gods.toString()
        gods.totalPrice()

        let supplier: Supplier = {name: '嘟聊', phone: 124578}
        console.debug(`公司名:${supplier.name},电话:${supplier.phone}`)

        let fruit = new Fruit("苹果", 2.5, 3)
        fruit.totalPrice()

        //计算圆面积
        let r = 3
        let area = Round.getArea(r).toString()
        console.debug(`计算半径为:${r} 圆的面积：${area}`)

        testPrint(new MobliePhone('小米', 1000))

        //非空断言 a! 如果a为空 就不参与运算 结果就是1
        let a: number | null = null
        let b: number
        b = a! + 1
        // b = a ?? 2 + 1
        console.debug('非空计算'+b.toString())

      })
    }
    .height('100%')
    .width('100%')
  }
}

function testPrint<T extends Goods>(n: T) {
  console.debug(`这是${n.name}`)
}