@Entry
@Component
struct LayoutPage{

  build() {
    // newGlobalBuilder()

    Stack({alignContent: Alignment.Center}){
      Text('这是第一')
        .width(500)
        .height(500)
        .backgroundColor(Color.Pink)
        .fontColor(Color.White)
        //在层叠布局中（stack布局），z轴越大，view就越往上
        .zIndex(1)

      Text('这是第二')
        .width(300)
        .height(300)
        .backgroundColor(Color.Brown)
        .zIndex(2)

      Text('这是第三')
        .width(200)
        .height(200)
        .backgroundColor(Color.Orange)
        .zIndex(3)
    }
    .height('100%')
  }
}


// @Builder
// function newGlobalBuilder() {
//   Column({ space: 5 }) {
//     Text('你好！鸿蒙next')
//       .width(200)
//       .height(50)
//       .fontColor('blue')
//       .border({
//         width: 2,
//         color: Color.Red
//       });
//
//     Text('你好！鸿蒙next')
//       .width(200)
//       .height(50)
//       .fontColor('blue')
//       .border({
//         width: 2,
//         color: Color.Red
//       });
//
//     Text('你好！鸿蒙next')
//       .width(200)
//       .height(50)
//       .fontColor('blue')
//       .border({
//         width: 2,
//         color: Color.Red
//       });
//   }
//   .width(300)
//   .height(200)
//   //边框
//   .border({ color: Color.Green, width: 3 })
//   //交叉轴（布局为Column时 就是x轴水平方向，布局为Row时 就是y轴垂直方向）对齐方式
//   .alignItems(HorizontalAlign.Start)
//   //主轴（布局为Column时 就是y轴垂直方向，布局为Row时 就是x轴水平方向）对齐方式
//   .justifyContent(FlexAlign.Center)
// }
