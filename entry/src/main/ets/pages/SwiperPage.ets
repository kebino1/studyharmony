@Entry
@Component
struct SwiperPage {
  @State message: string = '轮播图';

  swipCtl1: SwiperController = new SwiperController()
  swipCtl2: SwiperController = new SwiperController()

  build() {
    Column() {
      Text(this.message).fontSize(40).width('100%').fontWeight(100)

      Stack() {
        Swiper(this.swipCtl1) {
          Text('淘宝').fontSize(30).fontColor(Color.White).backgroundColor(Color.Green)
          Text('京东').fontSize(30).fontColor(Color.White).backgroundColor(Color.Blue)
          Text('拼多多').fontSize(30).fontColor(Color.White).backgroundColor(Color.Pink)
        }.onChange((index: number) => {

        })
        .autoPlay(true)
        .interval(1500)
        .loop(false)
        .width('95%')
        .height(200)

        Row(){
          Button('<').fontSize(22).onClick((event: ClickEvent) => {
            this.swipCtl1.showPrevious()
          }).backgroundColor('#55aca9a9')

          Button('>').fontSize(22).onClick((event: ClickEvent) => {
            this.swipCtl1.showNext()
          }).backgroundColor('#55aca9a9')
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('90%')

      }

      Divider().height(20)

      Stack(){
        Swiper(this.swipCtl2) {
          Image($r('app.media.ban1')).scale({centerX: 150, centerY: 250})
          Image($r('app.media.ban2'))
          Image($r('app.media.ban3'))
        }.onChange((index: number) => {

        })
        .autoPlay(false)
        .width('95%')
        .height(200)

        Row() {
          Button('<').onClick((event: ClickEvent) => {
            this.swipCtl2.showPrevious()
          })
            .backgroundColor('#55aca9a9')

          Button('>').onClick((event: ClickEvent) => {
            this.swipCtl2.showNext()
          })
            .backgroundColor('#55aca9a9')
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('90%')
      }

    }
    .height('100%')
    .width('100%')
  }
}