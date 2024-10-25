import { router } from '@kit.ArkUI';

@Entry
@Component
struct WelcomePage {
  @State message: string = 'Hello World';

  @State time: number = 5

  timer: number = -1

  //在页面显示前执行
  aboutToAppear(): void {
    this.timer = setInterval(()=>{
      this.time--
      if (this.time <= 0) {
        //清除定时器
        clearInterval(this.timer)
        //跳转页面
        router.replaceUrl({url:'pages/LoginPage'})
      }
    }, 1000)
  }

  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    Stack({alignContent: Alignment.TopEnd}) {
      Image($r('app.media.splash_main'))

      Button(`跳过${this.time}`).onClick((event: ClickEvent) => {
        router.replaceUrl({url:'pages/LoginPage'})
      })
        .backgroundColor(Color.Gray)
        .margin(10)
    }
    .height('100%')
    .width('100%')
  }
}