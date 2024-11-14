import InfoTop from '../components/InfoTop'
import InfoItem from '../components/InfoItem'
import InfoBottom from '../components/InfoBottom'
//导入字体库
import font from '@ohos.font'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  //生命周期==加载组件时 首先加载该生命周期
  aboutToAppear(): void {
    //初始化字体注册
    font.registerFont({
      familyName: 'myfont', //给字体命名
      familySrc:'/font/iconfont.ttf' //字体资源
    })
  }

  build() {
    Column() {
      InfoTop()

      List() {
        ForEach(Array.from({length:20}), () => {
          ListItem() {
            InfoItem()
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
      .divider({
        strokeWidth: 0.1,
        color:Color.Gray,
        startMargin: 40,
        endMargin:10
      })

      InfoBottom()
    }
    .height('100%')
    .width('100%')
  }
}