import InfoTop from '../components/InfoTop'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      InfoTop()

      List() {
        ForEach(Array.from({ length: 20 }), () => {
          ListItem() {
            Row()
              .width('100%')
              .height(80)
              .backgroundColor('#991111')
          }
          .padding(10)
        })
      }
      .listDirection(Axis.Vertical)
      //第一个参数 行数或列数 第二个参数 间隔
      .lanes(1, 10)
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#ffdb4329')
      //列对齐方式
      .alignListItem(ListItemAlign.Center)
      //分割线
      .divider({
        strokeWidth:1, //线宽
        color: Color.White, //颜色
        startMargin:5, //左间距
        endMargin:5 //右间距
      })
    }
    .height('100%')
    .width('100%')
  }
}