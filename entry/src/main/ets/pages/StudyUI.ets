

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
      // borderItem()
      // borderRadiusItem()
      // circleItem()
      // backgroundItem()
      // linearlayouItem()
      // titleBar()
      // dewuAppItem()
      // weightItem()
      cardItem()
    }

    .backgroundColor('#ffdbd9d7')
    // .borderRadius(5)
    .padding(5)
    .width('100%')
    .height('100%')

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

/**
 * 设置组件圆角 borderRadius
 */
@Builder
function borderRadiusItem() {
  Column() {
    Text('边框圆角')
      .padding(10)
      .backgroundColor(Color.Orange)
      .fontColor(Color.Yellow)
      .border({
        width:2,
        color:'#ff99ee11'
      })
      .borderRadius({
        topLeft:20
      })
  }
}

/**
 * 设置正圆
 * 组件宽高要相等（正方形），borderRadius设置圆角大小为宽或高度的一半
 *
 * 设置胶囊按钮
 * 一般宽度比高度大，borderRadius设置圆角大小为宽高中最小那个的一半
 */
@Builder
function circleItem() {
  Column() {
    Text('正圆')
      .padding(10)
      .textAlign(TextAlign.Center)
      .backgroundColor(Color.Orange)
      .fontColor(Color.Gray)
      .border({
        width:2,
        color:'#ff99ee11'
      })
      // .borderRadius(50) //正圆 大小为宽高一半
      // .width(100)
      // .height(100)

      .borderRadius(25) //胶囊 这里是高度的一半
      .width(100)
      .height(50)
  }
}

/**
 * 设置背景 backgroundImage
 * 组件中的宽高单位是vp vp是虚拟单位，基于设置自动转换，保证视觉效果一致 px是像素单位，不设置时默认单位是vp
 * vp转px：vp2px(数值)
 */
@Builder
function backgroundItem() {
  Column() {

  }
  //第二个参数可选，是设置图片平铺方式 x 水平平铺 y垂直平铺 xy水平垂直平铺
  // .backgroundImage($r('app.media.app_icon'), ImageRepeat.XY)
  .backgroundImage($r('app.media.ban3'))
  //设置背景图片位置
  .backgroundImagePosition(Alignment.Center)
  //设置背景图片缩放方式
  .backgroundImageSize(ImageSize.Cover)
  .backgroundColor(Color.Orange)
  .width('100%')
  .height('40%')
}

/**
 * 线性布局
 * column 列
 * row 行
 * justifyContent: 主轴排列方式 column布局就是y轴 row布局就是x轴
 * alignItems:交叉轴对齐方式
 */
@Builder
function linearlayouItem() {
  Column({space: 50}) {
    Text('项目1')
      .backgroundColor(Color.Yellow)
    Text('项目2')
      .backgroundColor(Color.Yellow)
    Text('项目3')
      .backgroundColor(Color.Yellow)
    Text('项目4')
      .backgroundColor(Color.Yellow)
  }
  .justifyContent(FlexAlign.Start)
  .height('100%')
}

/**
 *  自定义伸缩
 * 类似Android linearlayout的权重
 * 给组件设置.layoutWeight(数值)，其中数值指占的比重
 */
@Builder
function weightItem() {
  Row() {
    Text('项目1')
      .layoutWeight(1)
      .backgroundColor(Color.Yellow)
    Text('项目2')
      .layoutWeight(2)
      .backgroundColor(Color.Blue)
    Text('项目3')
      .backgroundColor(Color.Pink)
    Text('项目4')
      .backgroundColor(Color.Yellow)
  }
  .justifyContent(FlexAlign.Start)
  .width('100%')
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

/**
 * dmeo:标题栏
 */
@Builder
function titleBar() {
  Row() {
    Image($r('app.media.ic_public_arrow_left'))
      .width(24)
      .fillColor(Color.White)

    Text('个人中心')
      .fontColor(Color.White)

    Image($r('app.media.ic_gallery_collage'))
      .width(24)
      .fillColor(Color.White)
  }
  .backgroundColor('#445566')
  .padding(5)
  .height(48)
  .width('100%')
  .justifyContent(FlexAlign.SpaceBetween)
}

/**
 * dmeo:得物app列表
 */
@Builder
function dewuAppItem() {
  Row() {
    Column({space:10}) {
      Text('玩一玩')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Row() {
        Text('签到兑礼')
          .fontColor(Color.Gray)
        Text(' | ')
          .fontColor(Color.Gray)
        Text('超多大奖 超好玩')
          .fontColor(Color.Gray)
      }
    }
    .alignItems(HorizontalAlign.Start)

    Row(){
      Image($r('app.media.maozhuxi'))
        .height(40)

      Image($r('app.media.ic_public_arrow_left'))
        .width(24)
        .rotate({angle:180})
    }


  }
  .backgroundColor(Color.White)
  .padding({
    left:10,
    top:20,
    right:10,
    bottom:20
  })
  .borderRadius(5)
  .width('100%')
  .justifyContent(FlexAlign.SpaceBetween)
}

/**
 * dmeo:卡片效果
 */
@Builder
function cardItem() {
  Column({space:10}) {
    Image($r('app.media.freedom'))
      .borderRadius({
        topLeft: 10,
        topRight: 10
      })
      .padding(5)
      .width('100%')

    Text('草天草地草空气，“史上最强？”帅掉渣的强袭自由')
      .align(Alignment.Start)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .fontColor('#333')
      .lineHeight(35)
      .padding({left:2, right:2})

    Row() {
      Row({space:5}) {
        Image($r('app.media.maozhuxi'))
          .width(40)
          .height(40)
          .borderRadius(20)

        Text('橡胶佬集中地')
          .fontColor('#999')
      }
      .layoutWeight(1)

      Row({space:5}) {
        Image($r('app.media.ic_gallery_collage'))
          .width(20)
          .fillColor('#999')

        Text('1000')
          .fontSize(12)
          .fontColor('#999')
      }
    }
    .padding(10)
  }
  .borderRadius(5)
  .backgroundColor(Color.White)
  .width(300)
}