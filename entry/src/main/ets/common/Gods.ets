export class Goods {

  name: string
  price: number
  date: string
  size: number
  address: string
  food?: string

  //构造函数只能有一个
  constructor(name: string, price: number, date: string, size: number, address: string) {
    this.name = name
    this.price = price
    this.date = date
    this.size = size
    this.address = address
  }

  toString() {
    console.debug(`name:${this.name},price:${this.price},date:${this.date},size:${this.size},address:${this.address}`)
  }

  totalPrice() {
    let total = this.price * this.size
    console.debug(`商品总价${total}`)
  }
}

export class Fruit extends Goods {
  country: string = ''
  weight: number

  constructor(name: string, price: number, weight: number) {
    super(name, price, '', 0, '')
    this.weight = weight
  }

  totalPrice(): void {
    let totalPrice = this.price * this.weight
    console.debug(`${this.name}总价:${totalPrice}元`)
  }
}

export class MobliePhone extends Goods {
  country: string = ''

  constructor(name: string, price: number, country: string = "ch") {
    super(name, price, '', 0, '')
    this.country = country
  }

}

export class Supplier {
  name: string = ""
  phone: number = 123456
}

export class Round {
  static pi = 3.14

  static getArea(radius: number): number {
    return Round.pi * radius * radius
  }

  static {
    console.debug('加载静态代码11')
  }
}

/**
 * 单例模式 使用静态方法实现单例
 */
export class DBHelper {
  private static instance: DBHelper = new DBHelper()

  intent: string = "intent_key"

  private constructor() {
  }

  static getInstance(): DBHelper {
    return DBHelper.instance
  }
}

interface AnimationImpl {
  name: string
  duration: number
  walk: () => void
}

class Animation{
  name: string
  duration: number
  //仅可读，不能修改
  readonly dec : string = "f"

  //构造函数通过接口获取参数，在new对象时就不用按照固定顺序传参
  constructor(params: AnimationImpl) {
    this.name = params.name
    this.duration = params.duration
  }
}

let animation = new Animation({duration:1, name:"旋转", walk: ()=> {}})
console.debug('kebi', animation.dec)