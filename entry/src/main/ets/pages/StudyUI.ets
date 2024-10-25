

@Entry
@Component
struct StudyUI {
  @State message: string = 'hello world'

  build() {
    // Column({space: 10}) {
    //   Text('小说简介')
    //     .fontSize(24)
    //     .fontWeight(600) //100-900 粗细 默认400，或者用枚举FontWeight.Bold等
    //     .width('100%')
    //
    //   Row({space:10}) {
    //     Text('都市')
    //       .padding(10)
    //       .fontSize(18)
    //       .fontColor('#ffffff')
    //       .backgroundColor('#ffbfbfbf')
    //       .borderRadius(5)
    //     Text('生活')
    //       .padding(10)
    //       .fontSize(18)
    //       .fontColor('#ffffff')
    //       .backgroundColor('#ffbfbfbf')
    //       .borderRadius(5)
    //     Text('感情')
    //       .padding(10)
    //       .fontSize(18)
    //       .fontColor('#ffffff')
    //       .backgroundColor('#ffbfbfbf')
    //       .borderRadius(5)
    //     Text('悬疑')
    //       .padding(10)
    //       .fontSize(18)
    //       .fontColor('#ffffff')
    //       .backgroundColor('#ffbfbfbf')
    //       .borderRadius(5)
    //   }.width('100%')
    //
    // }
    // .backgroundColor(Color.Grey)
    // .size({width:'100%', height:'100%'})
    // .padding(5)
    // .justifyContent(FlexAlign.Start)
    // // .alignItems(HorizontalAlign.Start)

    Column() {
      // textItem()
      // imageItem()
      // textInputItem()
      // svgItem()
      // demo1()
      borderItem()
    }
    // .backgroundColor('#ffdbd9d7')
    // .borderRadius(5)
    .padding(10)
    .width('100%')

  }
}

/**
 * 学习text相关内容
 * 文本溢出行数省略号
 * 行高
 * 跑马灯
 */
@Builder
function textItem() {
  Text('OpenHarmony是由开放原子开源基金会(OpenAtom Foundation)孵化及运营的开源项目, 目标是面向全场景、全连接、全智能时代、基于开源的方式,搭建一个智能终端设备操作系统的框架和平台,促进万物互联')
    .fontSize(18)
    .fontWeight(FontWeight.Bold)
    //文本溢出行数省略号 需要配合maxLines（行数）使用
    .textOverflow({overflow: TextOverflow.Ellipsis}) //TextOverflow.MARQUEE 为跑马灯效果，maxLines属性就无效了
    .maxLines(3)
    //行高
    .lineHeight(25)
    .padding(10)
  Row({space:10}) {
    Text('置顶')
      .fontSize(16)
      .fontColor(Color.Red)
    Text('新华社')
      .fontSize(16)
    Text('400评论')
      .fontSize(16)
  }
  .padding(10)
}

/**
 * 学习image图片组件
 */
@Builder
function imageItem() {
  Image('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
  // Image($r('app.media.ban3'))
    //单独设置宽或高，宽高会自动适配
    .width(200)
}

/**
 * 学习textinput输入框组件
 */
@Builder
function textInputItem() {
  //输入提示placeholder
  TextInput({placeholder: '请输入账号'})
    //输入类型
    .type(InputType.PhoneNumber)
}

/**
 * 学习svg图片
 * svg图片特点 任意放大缩小不失真，可以填充颜色
 */
@Builder
function svgItem() {
  Column() {
    Image($r('app.media.ic_public_close_filled'))
      .width(50)
      .fillColor(Color.Orange)
  }
}

/**
 * 组件边框border
 */
@Builder
function borderItem() {
  Column() {
    Text('测试边框')
      .padding(5)
      .fontSize(18)
      .border({
        //width:1 四条边都设置宽度，width:{left:1, right:5}单独给左右两边设置
        width:{left:1, right:5},
        color: {left:Color.Brown, right:Color.Orange},
        style:BorderStyle.Dotted
      })
  }
}

@Builder
function demo1() {
  Column() {
    Image($r('app.media.app_icon'))
      .width(50)
      .margin({
        bottom:20
      })

    Text('我是一把火')
      .margin({
        bottom:50
      })

    Button('QQ登录').onClick((event: ClickEvent) => {

    })
      .width('100%')
      .fontSize(18)
      .margin({
        bottom: 20
      })

    Button('微信登录').onClick((event: ClickEvent) => {

    })
      .width('100%')
      .fontSize(18)
      .backgroundColor('#a1a1a1')
  }
}
