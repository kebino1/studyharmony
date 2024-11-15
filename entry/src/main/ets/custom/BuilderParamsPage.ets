import { JSON } from '@kit.ArkTS';

interface Person {
  name: string,
  car: Car
}
interface Car {
  name: string
}

//双向同步装饰器,@Observed只能在class使用，需要配合@ObjectLink使用
@Observed
class Fruit {
  name: string
  price: number

  constructor(name: string, price: number) {
    this.name = name;
    this.price = price;
  }
}

@Component
struct mySonComponent {
  @Consume parentCotnent: string

  build() {
    Column() {
      Row() {
        Text('这是孙子组件：')
        Text(this.parentCotnent)
          .fontColor(Color.Orange)
      }

      Button('修改孙子属性').onClick((event: ClickEvent) => {
        this.parentCotnent = '我是孙子'
      })
    }
  }
}

@Component
struct myComponent {
  //@Prop接收父组件传递的状态变量 父组件状态变量修改时 这里会跟着变化，子组件修改该状态变量时，父组件不会变化
  @Prop message: string = "儿子"
  @Prop num:number = 1
  //@Link 和父状态变量双向同步，只能和父共享， 不能赋初始值
  @Link content: string
  //双向同步装饰器，需要配合@ObjectLink使用，@ObjectLink只能在子组件使用，不能在entry的组件使用
  @ObjectLink fruit: Fruit
  //子组件提供一个箭头函数 供父类调用修改父类的状态变量
  onchange = (message: string) => {}

  //@BuilderParam 传递UI 提供给父组件用来传递组件到子组件
  @BuilderParam titleBuilder: ()=>void = this.defaultTitle
  @BuilderParam contentBuilder: ()=>void = this.defaultContent
  @Builder defaultTitle() {
    Text("标题")
  }

  @Builder defaultContent() {
    Row() {
      Text("父的共享变量:")
      Text(this.content)
        .fontColor('#990011')
      Text(",水果："+this.fruit.name)
        .onClick(() => {
          this.fruit.name = '西瓜'
        })
    }
  }

  build() {
    Column({space:20}) {
      Row() {
        this.titleBuilder()
      }

      Row() {
        this.contentBuilder()
      }

      Text(`通过父类获取状态变量:${this.message}`)
      Button("儿子中修改父亲的状态变量").onClick((event: ClickEvent) => {
        this.onchange("我是你儿子")
      })

      Button("修改父共享变量").onClick((event: ClickEvent) => {
        this.content = '我是儿子'
      })

      mySonComponent()

    }
    .alignItems(HorizontalAlign.Start)
    .width("100%")
    .height(400)
    .backgroundColor("#999999")
    .borderRadius(10)
    .padding(10)
  }
}

@Entry
@Component
struct BuilderParamsPage {
  @State message: string = 'Hello World';
  @State content: string = '父的共享变量'
  @State fruit: Fruit = new Fruit('榴莲', 100)

  //@Provide 需要和子孙组件配合使用，子孙组件需要有@Consume定义同名的属性
  @Provide parentCotnent: string = '和所有子孙组件同步'

  @State person: Person = {
    name: 'kebi',
    car: {
      name:'宝马'
    }
  }

  @Builder title() {
    Row() {
      Text("订单")
      Text("查看>")
    }
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column() {
      myComponent({
        message:this.message,
        content:this.content,
        fruit: this.fruit,
        onchange: (value: string) => {
          this.message = value
        },
        titleBuilder: this.title
      })

      Text('水果:'+this.fruit.name)
      Text('父的全局共享:'+this.parentCotnent)
      Row(){
        Text('父的共享变量:')
        Text(this.content)
          .fontColor('#990011')
      }

      Button('修改父共享变量').onClick((event: ClickEvent) => {
        this.content = '我是劳资'
      })
      Text(this.message)
      Button("修改message").onClick((event: ClickEvent) => {
        this.message = "我是你爹"
      })

      Text(JSON.stringify(this.person))

      Button("修改个人信息").onClick((event: ClickEvent) => {
        this.person.car = {name:"保时捷"}
      })

      Text("父亲状态变量:"+this.message)
      Button("修改父类状态变量").onClick((event: ClickEvent) => {
        this.message = "劳资买了一台保时捷"
      })
    }
    .height('100%')
    .width('100%')
  }
}