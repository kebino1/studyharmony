import { text } from '@kit.ArkGraphics2D'

@Preview
@Component
struct customComponent{
  build() {
    Column() {
      Text("我是自定义组件")
    }
  }
}

@Component
struct topTitle {
  build() {
    Row() {
      Text("标题")
        .textAlign(TextAlign.Center)
        .align(Alignment.Center)
    }
    .height(50)
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct main {
  build() {
    Text("这是主页内容")
      .fontColor(Color.White)
  }
}

@Component
struct bottom {
  build() {
    Button("支付").onClick((event: ClickEvent) => {

    })
      .height(50)
      .width('100%')
      .backgroundColor("#ff1122")
  }
}

@Component
struct MyPanel {
  @State count: number = 1
  title: string = ""
  secondTitle: string = ""
  //传递ui
  @BuilderParam customBuilder: () => void = this.defaultBuilder
  @Builder defaultBuilder() {
    Text("默认的UI实现")
  }
  @BuilderParam bottomBuilder: () => void = this.bottomBuilder1
  @Builder bottomBuilder1() {
    Text("底部默认的UI实现")
  }

  onclick = () => {}

  sayHi() {
    console.debug('日常提交')
  }

  build() {
    Column() {
      Row() {
        Text(this.title)
        Text(this.secondTitle)
          .onClick(this.onclick)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(10)

      this.customBuilder()
      this.bottomBuilder()
    }
    .backgroundColor("#ffffff")
    .width('100%')
    .height(200)
    .borderRadius(10)
    .margin({bottom:10})
  }
}

@Entry
@Component
struct Index{
  @Builder customImpl() {
    Column() {
      Text("我升天了")
    }
  }

  @Builder bottomImpl() {
    Column() {
      Image($r('app.media.app_icon'))
        .width(50)
    }
  }

  build() {
    Column() {
      // topTitle()
      // main()
      //   .backgroundColor("#ffe26c1d")
      //   .width('100%')
      //   .layoutWeight(1)
      // bottom()

      MyPanel({
        title:"我的订单",
        secondTitle:"全部订单",
        onclick: () =>{
          AlertDialog.show({message: "进入更多订单"})
        },
        customBuilder: this.customImpl,
        bottomBuilder: this.bottomImpl
      })

      MyPanel({
        title:"小米优品众筹",
        secondTitle:"7人众筹中",
        onclick: () =>{
          AlertDialog.show({message: "7人众筹中"})
        },
      })
    }
    .padding(10)
    .backgroundColor("#999999")
    .width('100%')
    .height("100%")
  }
}

function test() {
  throw new Error('Function not implemented.')
}
