@Entry
@Component
struct GoodsItemPage {
  @State message: string = 'Hello World';

  build() {
    Row({space:20}) {
      Column({space:5}){
        Text('技嘉4090rtx')
        Text('当前最好的显卡')
      }.alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)

      Row(){
        Image($r('app.media.ic_xianka'))
          .width(40)
        Image($r('app.media.ic_public_arrow_right'))
          .width(20)
      }
    }
    .borderRadius(10)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(10)
    .border({width: 1, color: '#ff10bcde' })
    .backgroundColor('#cccccc')
    .height('60')
    .width('100%')
  }
}