import { router } from '@kit.ArkUI';

@Entry
@Component
struct MainPage {
  @State message: string = '我是主页';

  build() {
    Column() {
      Text(this.message)
      Button("页面栈数量").onClick((event: ClickEvent) => {
        AlertDialog.show({message: router.getLength()})
      })

      Button("清空页面栈").onClick((event: ClickEvent) => {
        router.clear()
      })
    }
    .height('100%')
    .width('100%')
  }
}