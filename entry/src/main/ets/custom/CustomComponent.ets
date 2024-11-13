
@Component
struct customComponent{
  build() {
    Column() {
      Text("我是自定义组件")
    }
  }
}


@Entry
@Component
struct Index{
  build() {
    Column() {
      customComponent()
    }
  }
}