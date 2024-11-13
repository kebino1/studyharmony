import { JSON } from '@kit.ArkTS';

interface Person {
  name: string,
  car: Car
}
interface Car {
  name: string
}

@Component
struct myComponent {
  @Prop message: string = "儿子"
  @Prop num:number = 1
  //子组件提供一个箭头函数 供父类调用修改父类的状态变量
  onchange = (message: string) => {}

  @BuilderParam titleBuilder: ()=>void = this.defaultTitle
  @BuilderParam contentBuilder: ()=>void = this.defaultContent
  @Builder defaultTitle() {
    Text("标题")
  }

  @Builder defaultContent() {
    Text("内容")
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
    }
    .alignItems(HorizontalAlign.Start)
    .width("100%")
    .height(200)
    .backgroundColor("#999999")
    .borderRadius(10)
    .padding(10)
  }
}

@Entry
@Component
struct BuilderParamsPage {
  @State message: string = 'Hello World';
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
        onchange: (value: string) => {
          this.message = value
        },
        titleBuilder: this.title
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