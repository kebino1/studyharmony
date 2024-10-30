interface CardItem {
  imageUrL: string
  count: number
}

@Entry
@Component
struct CollectCardPage {
  @State message: string = 'Hello World';
  @State maskOpacity: number = 0
  @State maskZIndex: number = -1
  @State mScaleX: number = 0
  @State mScaleY: number = 0
  @State currentCard: string = 'app.media.ban1'
  //Math.random()去随机数 值为0-1，包括小数, Math.floor()向下取整
  //取0到4的随机整数
  @State currentPosition: number = 0
  @State cards: CardItem[] = [
    { imageUrL: 'app.media.ban1', count: 0 },
    { imageUrL: 'app.media.ban1', count: 0 },
    { imageUrL: 'app.media.ban1', count: 0 },
    { imageUrL: 'app.media.ban1', count: 0 },
    { imageUrL: 'app.media.ban1', count: 0 },
    { imageUrL: 'app.media.ban1', count: 0 },
  ]
  allCards: string[] = [
    'app.media.ban1',
    'app.media.ban2',
    'app.media.ban3',
    'app.media.splash_main',
    'app.media.ban2',
    'app.media.ban3'
  ]

  build() {
    Stack() {
      Column() {
        Grid() {
          ForEach(this.cards, (item: CardItem, index) => {
            GridItem() {
              Badge({
                count: item.count,
                style: {
                  badgeColor: Color.Red
                }
              }) {
                Image($r(item.imageUrL))
                  .height(150)
              }
            }.margin({ top: 5 })
          })
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(10)
        .width('100%')
        .height(400)

        Button('立即抽卡').onClick((event: ClickEvent) => {
          this.maskOpacity = 1
          this.maskZIndex = 99
          //点击时 图片需要缩放
          this.mScaleX = 1
          this.mScaleY = 1
          this.currentPosition = Math.floor(Math.random() * 6)
          this.currentCard = this.allCards[this.currentPosition]
        })
      }
      .height('100%')
      .width('100%')
      .backgroundColor(Color.Pink)

      //遮罩层 通过透明度opacity和层级zIndex设置遮罩层显示隐藏
      Column({ space: 40 }) {

        Text('获得卡片')
          .fontColor(Color.White)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Image($r(this.currentCard))
          .height(300)//控制元素的缩放
          .scale({
            x: this.mScaleX,
            y: this.mScaleY
          })
          .animation({ duration: 500 })

        Button('开心收下').onClick((event: ClickEvent) => {
          this.maskOpacity = 0
          this.maskZIndex = -1
          //点击时 恢复图片缩放
          this.mScaleX = 0
          this.mScaleY = 0
          //改变对应卡片数量
          let crad = this.cards[this.currentPosition]
          crad.imageUrL = this.allCards[this.currentPosition]
          crad.count++
          this.cards[this.currentPosition] = {imageUrL: crad.imageUrL, count: crad.count}
        })
          .border({
            width: 2,
            color: Color.White
          })
          .backgroundColor(Color.Transparent)
          .width(200)

      }
      .height('100%')
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#d9000000')
      //透明度
      .opacity(this.maskOpacity)
      //设置层级
      .zIndex(this.maskZIndex)
      .animation({ duration: 200 })
    }
    .height('100%')
    .width('100%')
  }
}