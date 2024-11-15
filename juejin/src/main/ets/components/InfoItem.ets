import { CommentData } from '../model/CommentData'

@Component
struct InfoItem {
  @ObjectLink commentData: CommentData
  onLikeClick = () => {}

  build() {
    Column() {
      Row({space:8}) {
        Image(this.commentData.iconUrl)
          .width(30)
          .aspectRatio(1)
          .borderRadius(10)

        Text(this.commentData.name)
          .fontSize(14)
          .fontColor(Color.Gray)

        Image($r(this.commentData.userLv))
          .width(18)
          .aspectRatio(1)
      }
      Text(this.commentData.commentContent)
        .fontSize(16)
        .fontColor(Color.Gray)
        .padding({left:40, top:10})

      Row() {
        Text(this.commentData.timeDec)
          .fontSize(12)
          .fontColor(Color.Gray)

        Row({space:5}){
          Image($r('app.media.ic_like'))
            .width(20)
            .aspectRatio(1)
            .fillColor(this.commentData.isCollect ? '#ffe91212' : '#666666')

          Text(this.commentData.collectCount.toString())
            .fontSize(12)
            .fontColor(this.commentData.isCollect ? '#ffe91212' : '#666666')
        }.margin({right:5})
        .onClick(() => {
          this.onLikeClick()
        })
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