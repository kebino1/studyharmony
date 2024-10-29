
interface CardItem {
  imageUrL: string
  count: number
}

@Entry
@Component
struct CollectCardPage {
  @State message: string = 'Hello World';
  cards:CardItem[] = [
    {imageUrL:'app.media.ban1', count:0},
    {imageUrL:'app.media.ban1', count:1},
    {imageUrL:'app.media.ban1', count:0},
    {imageUrL:'app.media.ban1', count:44},
    {imageUrL:'app.media.ban1', count:3},
    {imageUrL:'app.media.ban1', count:0},
  ]

  build() {
    Stack() {
      Column() {
        Grid() {
          ForEach(this.cards, (item: CardItem, index)=> {
            GridItem() {
              Badge({
                count:item.count,
                style: {
                  badgeColor:Color.Red
                }
              }) {
                Image($r(item.imageUrL))
                  .height(150)
              }
            }.margin({top:5})
          })
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(10)
        .width('100%')
        .height(400)

        Button('立即抽卡').onClick((event: ClickEvent) => {

        })
      }
      .height('100%')
      .width('100%')
      .backgroundColor(Color.Pink)

      Column({space:40}) {

        Text('获得卡片')
          .fontColor(Color.White)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Image($r('app.media.ban3'))
          .height(300)

        Button('开心收下').onClick((event: ClickEvent) => {

        })
          .border({
            width:2,
            color:Color.White
          })
          .backgroundColor(Color.Transparent)
          .width(200)

      }
      .height('100%')
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#cc000000')
    }
    .height('100%')
    .width('100%')
  }
}