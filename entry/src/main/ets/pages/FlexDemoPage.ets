@Entry
@Component
struct FlexDemoPage {
  @State message: string = 'Hello World';

  build() {
    //弹性布局
    Flex({
      wrap: FlexWrap.Wrap
    }) {

      Text('java').backgroundColor(Color.Blue).fontColor(Color.White).margin(10).padding(10)
      Text('c++').backgroundColor(Color.Blue).fontColor(Color.White).margin(10).padding(10)
      Text('javaScript').backgroundColor(Color.Blue).fontColor(Color.White).margin(10).padding(10)
      Text('php').backgroundColor(Color.Blue).fontColor(Color.White).margin(10).padding(10)
      Text('kotlin').backgroundColor(Color.Blue).fontColor(Color.White).margin(10).padding(10)
      Text('swift').backgroundColor(Color.Blue).fontColor(Color.White).margin(10).padding(10)
    }
    .height('100%')
    .width('100%')
  }
}