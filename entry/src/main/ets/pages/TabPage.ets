import { AxiosDemoPage } from './AxiosDemoPage';
import { Index } from './Index';
import { ListPage } from './ListPage';

@Entry
@Component
struct TabPage {
  @State message: string = 'Hello World';
  @State currentIndex: number = 0

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: Resource, nomalImg: Resource) {
    Column({ space: 5 }) {
      Image(this.currentIndex == targetIndex ? selectedImg : nomalImg)
        .size({ width: 25, height: 25 })
      Text(title).fontColor(this.currentIndex == targetIndex ? '#FF3663' : Color.Gray)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      //barPosition设置tabs上下布局
      // Tabs({barPosition:BarPosition.End}) {
      //   TabContent() {
      //     Text('主页内容')
      //   }
      //   //自定义选项view，定义一个tabBuilder函数设置
      //     .tabBar(this.tabBuilder('主页', 0, $r('app.media.tab_message_selected'), $r('app.media.tab_message_normal')))
      //
      //   TabContent() {
      //     AxiosDemoPage()
      //   }
      //   .tabBar(this.tabBuilder('通讯录', 1, $r('app.media.tab_message_selected'), $r('app.media.tab_message_normal')))
      //
      //   TabContent() {
      //     ListPage()
      //   }
      //   .tabBar(this.tabBuilder('朋友圈', 2, $r('app.media.tab_message_selected'), $r('app.media.tab_message_normal')))
      //
      //   TabContent() {
      //     // Text('我的内容')
      //     LoadingProgress()
      //       .size({width:50,height:50})
      //   }
      //   .tabBar(this.tabBuilder('我的', 3, $r('app.media.tab_message_selected'), $r('app.media.tab_message_normal')))
      //
      // }.onTabBarClick((index) => {
      //   this.currentIndex = index
      // })

      mainPage()
    }
    .height('100%')
    .width('100%')
  }
}

interface MainTab {
  title: string
  icon: string
  selectIcon: string
}

@Component
struct mainPage {
  @State tabs: MainTab[] = [
    { title: '消息', icon: 'app.media.tab_message_normal', selectIcon: 'app.media.tab_message_selected' },
    { title: '主页', icon: 'app.media.tab_home_normal', selectIcon: 'app.media.tab_home_selected' },
    { title: '服务台', icon: 'app.media.tab_workbench_normal', selectIcon: 'app.media.tab_workbench_selected' },
    { title: '人才网', icon: 'app.media.tab_bird_normal', selectIcon: 'app.media.tab_bird_selected' },
    { title: '通讯录', icon: 'app.media.tab_addressbook_normal', selectIcon: 'app.media.tab_addressbook_selected' }
  ]
  @State currentPostion: number = 0

  /**
   * 自定义TabBar
   */
  @Builder
  customTab(tab: MainTab, index: number) {
    Column({ space: 5 }) {
      Image($r(this.currentPostion == index ? tab.selectIcon : tab.icon))
        .width(25)
        .height(20)
      Text(tab.title)
        .fontSize(14)
        .fontColor(this.currentPostion == index ? '#ffef3c3c' : '#666666')
    }
    .padding({ left: 10, right: 10 })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  centerTab() {
    Image($r('app.media.splash_icon'))
      .width(35)
      .height(35)
  }

  build() {
    Tabs({barPosition:BarPosition.End}) {
      ForEach(this.tabs, (item: MainTab, index: number) => {
        if (item.title === '服务台') {
          TabContent() {
            //只能有一个子组件
            AxiosDemoPage()
          }
          .tabBar(this.centerTab())
        } else {
          TabContent() {
            //只能有一个子组件
            Text(item.title)
          }
          .tabBar(this.customTab(item, index))
        }
      })
    }
    .barMode(BarMode.Fixed)
    //滑动 点击
    .onChange((index) => {
      this.currentPostion = index
      console.debug('kebi', '点击了第' + index)
    })
    //关闭滑动动画
    .animationDuration(0)

    //仅点击事件触发
    // .onTabBarClick((index) => {
    //   this.currentPostion = index
    // })

    // .vertical(true) //垂直导航
    // .scrollable(false) //是否允许滑动
  }
}

