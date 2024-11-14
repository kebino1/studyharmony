@Component
struct InfoItem {
  build() {
    Column() {
      Row({space:8}) {
        Image($r('app.media.app_icon'))
          .width(30)
          .aspectRatio(1)
          .borderRadius(10)

        Text('昵称')
          .fontSize(14)
          .fontColor(Color.Gray)

        Image($r('app.media.ic_vip_card'))
          .width(18)
          .aspectRatio(1)
      }
      Text('天子守国门，君王死社稷')
        .fontSize(16)
        .fontColor(Color.Gray)
        .padding({left:40, top:10})

      Row() {
        Text('7天前')
          .fontSize(12)
          .fontColor(Color.Gray)

        Row({space:5}){
          Image($r('app.media.ic_like'))
            .width(20)
            .aspectRatio(1)

          Text('99')
            .fontSize(12)
            .fontColor(Color.Gray)
        }.margin({right:5})
      }
      .width('100%')
      .padding({left:40, top:5})
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .alignItems(HorizontalAlign.Start)
    .padding(10)
  }
}

export default InfoItem