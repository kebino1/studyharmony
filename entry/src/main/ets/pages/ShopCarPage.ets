@Entry
@Component
struct ShopCarPage {
  @State message: string = 'Hello World';
  @State count: number = 1
  @State price: number = 199
  @State oldPrice: number = 299

  build() {
    Column() {
      Row() {
        Image($r('app.media.freedom'))
          .width('100')
          .margin({ right: 10 })
          .borderRadius(8)

        Column() {
          Text('万代hg强袭自由高达')
            .fontSize(16)
            .textOverflow({overflow: TextOverflow.Ellipsis})
            .maxLines(2)

          Text('万代南梦宫')
            .fontSize(14)
            .fontColor(Color.Gray)

          Row() {
            Row() {
              Text(`￥${this.price}`)
                .fontColor(Color.Red)
              Text(`￥${this.oldPrice}`)
                .lineBreakStrategy(LineBreakStrategy.HIGH_QUALITY)
                .fontSize(12)
                .fontColor(Color.Gray)
                //装饰 添加中划线
                .decoration({type:TextDecorationType.LineThrough})
            }

            Row() {
              Text('-')
                .width(20)
                .textAlign(TextAlign.Center)
                .border({ width: { right: 1 }, color: Color.Gray })
                .onClick(() => {
                  if (this.count <= 0) {
                    return
                  }
                  this.count--
                })
              Text(this.count.toString())
                .width(30)
                .textAlign(TextAlign.Center)
                .border({ width: { right: 1 }, color: Color.Gray })
              Text('+')
                .width(20)
                .textAlign(TextAlign.Center)
                .onClick(() => {
                  this.count++
                })
            }
            .border({ width: 1, color: Color.Gray , radius:5})
          }.width('90%').justifyContent(FlexAlign.SpaceBetween)

        }
        .width('70%')
        .height(70)
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .backgroundColor(Color.White)
      .borderRadius(5)
      .margin(5)
      .width('100%')
      .padding(10)

      Blank()

      Row() {
        Column() {
          Text() {
            Span(`已选${this.count}件,`)
            Span('合计:')
              .fontWeight(FontWeight.Bold)
            Span(`￥${(this.count * this.price).toFixed(2)}`)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.Red)
              .fontSize(20)
          }

          Text(`共减￥${((this.oldPrice - this.price) * this.count).toFixed(2)}`)
            .fontColor(Color.Red)
            .fontSize(16)
        }.alignItems(HorizontalAlign.End)

        Button('结算支付').onClick((event: ClickEvent) => {
        })
          .margin(10)
          .backgroundColor('#ffe5ba1f')
          .fontColor(Color.Black)

      }
      .justifyContent(FlexAlign.End)
      .padding(10)
      .backgroundColor(Color.White)
      .width('100%')
    }
    .backgroundColor('#fff1eeed')
    .height('100%')
    .width('100%')
  }
}