import { AxiosDemoPage } from './AxiosDemoPage';
import { ListPage } from './ListPage';

@Entry
@Component
struct TabPage {
  @State message: string = 'Hello World';
  @State currentIndex:number = 0


  @Builder tabBuilder(title: string, targetIndex: number, selectedImg: Resource, nomalImg: Resource) {
    Column({space:5}) {
      Image(this.currentIndex == targetIndex? selectedImg:nomalImg)
        .size({width:25, height:25})
      Text(title).fontColor(this.currentIndex == targetIndex? '#FF3663':Color.Gray)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column(){
      //barPosition设置tabs上下布局
      Tabs({barPosition:BarPosition.End}) {
        TabContent() {
          Text('主页内容')
        }
        //自定义选项view，定义一个tabBuilder函数设置
          .tabBar(this.tabBuilder('主页', 0, $r('app.media.tab_message_selected'), $r('app.media.tab_message_normal')))

        TabContent() {
          AxiosDemoPage()
        }
        .tabBar(this.tabBuilder('通讯录', 1, $r('app.media.tab_message_selected'), $r('app.media.tab_message_normal')))

        TabContent() {
          ListPage()
        }
        .tabBar(this.tabBuilder('朋友圈', 2, $r('app.media.tab_message_selected'), $r('app.media.tab_message_normal')))

        TabContent() {
          // Text('我的内容')
          LoadingProgress()
            .size({width:50,height:50})
        }
        .tabBar(this.tabBuilder('我的', 3, $r('app.media.tab_message_selected'), $r('app.media.tab_message_normal')))

      }.onTabBarClick((index) => {
        this.currentIndex = index
      })
    }
    .height('100%')
    .width('100%')
  }
}