@Entry
@Component
struct DuliaoLoginPage {
  @State message: string = 'Hello World';

  build() {
    Column() {

      Image($r('app.media.ic_public_cancel'))
        .width(25)
        .alignSelf(ItemAlign.Start)
        .margin({top:20, left:15})
        .fillColor(Color.White)

      Image($r('app.media.splash_icon'))
        .margin({top:150})
        .width(90)

      Text('你好，欢迎来到嘟聊')
        .fontSize(14)
        .fontColor($r('app.color.main_color'))
        .margin({top:5})

      Button('一键微信登录').onClick((event: ClickEvent) => {

      })
        .backgroundColor('#FF2859')
        .margin({top: 30})
        .width('80%')

      Button('短信验证登录').onClick((event: ClickEvent) => {

      })
        .fontColor('#FF3A67')
        .backgroundColor('#FFDDE5')
        .margin({top: 20})
        .width('80%')

      Row() {
        Checkbox().onChange((value: boolean) => {

        })
          .width(10)
          .margin({top:3})

        Text(){
          Span('我已阅读并同意')
          Span('《隐私政策》').fontColor('#3896FB')
          Span('《用户协议》').fontColor('#3896FB')
          Span('和')
          Span('《SDK获取个人信息条款》').fontColor('#3896FB')
          Span('并授权嘟聊使用该嘟聊账号信息进行统一管理')
        }
        .fontSize(12)
        .fontColor('#999')
        .lineHeight(16)
        .margin({right:20})
      }
      .alignItems(VerticalAlign.Top)
      .margin({top:30})
      .padding({left:20, right:15})

      //填充组件：作用：填充空白区域(像弹簧)
      Blank()

      Column() {
        Image($r('app.media.ic_wechat'))
          .width(40)
        Text('微信登录')
          .fontSize(12)
          .fontColor('#666')
          .margin({top:8})
      }.margin({bottom:10})
    }
    .backgroundImage($r('app.media.login_bg'))
    .backgroundImageSize(ImageSize.Contain)
    .height('100%')
    .width('100%')
  }
}