import { JSON } from '@kit.ArkTS';

@Entry
@Component
export struct ListPage {
  @State message: string = 'Hello World';
  count: Array<string> = ['苹果', "香蕉", "葡萄", "橘子", "火龙果", "榴莲", "西瓜"
    , "香蕉", "葡萄", "橘子", "火龙果", "榴莲", "西瓜"
    , "香蕉", "葡萄", "橘子", "火龙果", "榴莲", "西瓜"
    , "香蕉", "葡萄", "橘子", "火龙果", "榴莲", "西瓜"
    , "香蕉", "葡萄", "橘子", "火龙果", "榴莲", "西瓜"
    , "香蕉", "葡萄", "橘子", "火龙果", "榴莲", "西瓜"]
  private listScroll = new Scroller()

  @Builder
  itemEnd(index: number) {
    Button() {
      Image($r('app.media.app_icon'))
        .width(20)
        .height(20)
    }.onClick(() => {

    })
  }

  build() {

    Stack() {

      Refresh({refreshing:false}) {
        //列表布局
        List({ space: 10, scroller: this.listScroll }) {
          ForEach(this.count, (item: string, index: number) => {
            //列表单项item
            ListItem() {
              Row() {
                Image($r('app.media.startIcon'))
                  .width(30)
                  .height(30)
                  .margin(10)
                Text(`${item}`)
              }.width('100%')
            }.swipeAction({
              end: {
                builder: () => {
                  this.itemEnd(index)
                },
              }
            })
          })

          //列表分组 头部
          ListItemGroup({ header: this.itemHead('汽车') }) {
            ListItem() {
              Text('小米su7')
            }
          }
        }
        .divider({
          strokeWidth: 0.2,
          color: Color.Gray,
          startMargin: 10,
          endMargin: 10
        })
        //滚动条
        .scrollBar(BarState.Auto)
        //分割线
        .listDirection(Axis.Vertical)
        //行数或列数
        .lanes(1)
        .height('100%')
        .width('100%')
      }.onStateChange(() => {

      })


        Button('^').onClick((event: ClickEvent) => {
          this.listScroll.scrollToIndex(0)
        }).margin(10)
      }
      .alignContent(Alignment.BottomEnd)
  }

  @Builder
  itemHead(text: string) {

    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }
}