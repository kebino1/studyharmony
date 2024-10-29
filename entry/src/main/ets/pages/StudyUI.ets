import { Person } from './StudyArkts'

@Entry
@Component
struct StudyUI {
  @State message: string = 'hello world'
  @State numStr: number = 999
  @State colorState: string = '#999999'
  isSelect: boolean = false
  titles: string[] = ['鞋子', '衣服', '裤子', '帽子', '裙子']
  persons: Person[] = [
    {name: '葫芦娃', age: 8, eat:() => {}},
    {name: '火影', age: 8, eat:() => {}},
    {name: '孙悟空', age: 8, eat:() => {}},
    {name: '死神', age: 8, eat:() => {}}
  ]

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
      // cardItem()
      // flexItem()
      // positionItem()
      // hotCardDemo()
      // stackItem()
      // videoDemo()
      // alipayDemo()
      // stateDemo(this.numStr)
      // changeTextDemo()
      // visiableShopCarDemo(0)
      // ForEachItem(this.persons)
      BadgeItem()
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
 * 行高：lineHeight
 * 跑马灯：
 *     .textOverflow({overflow: TextOverflow.Ellipsis}) //TextOverflow.MARQUEE 为跑马灯效果，maxLines属性就无效了
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

/**
 * 弹性布局 Flex
 */
@Builder
function flexItem() {
  //默认布局和row相同 水平排列,可以通过direction设置水平还是垂直排列
  //wrap：Wrap多行布局  NoWrap单行布局
  Flex({wrap:FlexWrap.Wrap,
  }) {
    Text('第一项')
      .padding(5)
      .margin(5)
      .backgroundColor('#558877')
      .borderWidth(1)
    Text('第二项')
      .padding(5)
      .margin(5)
      .backgroundColor('#558877')
      .borderWidth(1)
    Text('冯')
      .padding(5)
      .margin(5)
      .backgroundColor('#558877')
      .borderWidth(1)
    Text('第四项')
      .padding(5)
      .margin(5)
      .backgroundColor('#558877')
      .borderWidth(1)
    Text('这个是什么')
      .padding(5)
      .margin(5)
      .backgroundColor('#558877')
      .borderWidth(1)
    Text('我是东方红啊')
      .padding(5)
      .margin(5)
      .backgroundColor('#558877')
      .borderWidth(1)
  }
}

/**
 * 绝对定位：position
 *  .position({x:0, y:0}) xy是相对于父控件左顶点的坐标
 * 绝对定位后，不再占用自身原有位置
 */
@Builder
function positionItem() {
  Column() {
    Text('第一项')
      .padding(5)
      .margin(5)
      .backgroundColor('#558877')
      .borderWidth(1)
    Text('第二项')
      .padding(5)
      .margin(5)
      .backgroundColor('#558877')
      .borderWidth(1)
    //后面的组件层级更高，会盖住前面的组件
    //需求：在不改动原有结果下，调整组件层级 .zIndex(数字)
    Image($r('app.media.app_icon'))
      .width(33)
      .position({x:10, y:70})
      .zIndex(-1)
    Text('第23项')
      .padding(5)
      .margin(5)
      .backgroundColor('#558877')
      .borderWidth(1)
  }
}

/**
 * 层叠布局
 */
@Builder
function stackItem() {
  //alignContent:设置层叠位置
  Stack({alignContent: Alignment.TopStart}) {
    Text('爷爷')
      .width(300)
      .height(300)
      .backgroundColor(Color.Yellow)

    Text('爸爸')
      .width(150)
      .height(150)
      .backgroundColor(Color.Blue)

    Text('儿子')
      .width(100)
      .height(100)
      .backgroundColor(Color.Green)
  }
  .backgroundColor(Color.Pink)
  .width('100%')
  .height('100%')
}

/**
 * 渲染控制=foreach
 * @param titles
 */
@Builder
function ForEachItem(titles: Person[]) {
  Scroll() {
    Column() {
      ForEach(titles, (item:Person, index) => {
        Column({space:15}) {
          Text(`这是获取了第${index+1}个选项，项目是：${item.name}`)
          Text('2024年10月29日15:49:05')
            .fontSize(14)
            .fontColor(Color.Gray)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding(10)
      })
    }
  }
}

/**
 * 角标=Badge
 */
@Builder
function BadgeItem() {
  Column() {
    Grid() {
      ForEach(['app.media.ban1','app.media.ban2','app.media.ban3','app.media.ban1','app.media.ban3','app.media.ban1'], (item:string, index)=> {
        GridItem() {
          Badge({
            count:1,
            maxCount:99,
            //角标位置
            position: BadgePosition.RightTop,
            style: {
              //角标文字大小
              fontSize:12,
              //圆形大小
              badgeSize:16,
              //背景颜色
              badgeColor:Color.Red
            }
          }) {
            Image($r(item))
              .width(100)
              .margin(8)
          }
        }
      })


    }.width('100%')
    .height(500)
    .columnsTemplate('1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr')

    Button('立即抽卡').onClick((event: ClickEvent) => {

    })


    // Badge({
    //   count:1,
    //   maxCount:99,
    //   //角标位置
    //   position: BadgePosition.RightTop,
    //   style: {
    //     //角标文字大小
    //     fontSize:12,
    //     //圆形大小
    //     badgeSize:16,
    //     //背景颜色
    //     badgeColor:Color.Red
    //   }
    // }) {
    //   Image($r('app.media.ban1'))
    //     .width(100)
    //     .margin(10)
    // }
    //
    // Badge({
    //   count:1,
    //   maxCount:99,
    //   //角标位置
    //   position: BadgePosition.RightTop,
    //   style: {
    //     //角标文字大小
    //     fontSize:12,
    //     //圆形大小
    //     badgeSize:16,
    //     //背景颜色
    //     badgeColor:Color.Red
    //   }
    // }) {
    //   Image($r('app.media.ban2'))
    //     .width(100)
    // }
  }
}

//==================================  demo  ==================================

@Builder
function visiableShopCarDemo(count: number) {
  Row() {
    Column() {
      Image($r('app.media.ic_gallery_collage'))
        .width(25)

      Text('店铺')
    }

    Column() {
      Image($r('app.media.ic_gallery_collage'))
        .width(25)

      Text('客服')
    }

    Column() {
      Image($r('app.media.ic_gallery_collage'))
        .width(25)

      Text('购物车')
    }

    if (count > 0) {
      Button('加入购物车').onClick((event: ClickEvent) => {

      })
        .fontColor(Color.White)
        .backgroundColor('#ffeacb08')
      Button('立即购买').onClick((event: ClickEvent) => {

      })
        .fontColor(Color.White)
        .backgroundColor(Color.Red)
    } else {
      Button('查看类似商品').onClick((event: ClickEvent) => {

      })
        .fontColor(Color.White)
        .backgroundColor('#ffeacb08')
    }

  }
  .padding(10)
  .width('100%')
  .alignItems(VerticalAlign.Bottom)
  .justifyContent(FlexAlign.SpaceBetween)
}

@Builder
function demo12(colorState: string, isSelect: boolean, numStr: number) {
  Column() {
    Image($r('app.media.splash_main'))
      .height(200)
      .width(200)
      .borderRadius({topLeft:10, topRight:10})

    Text('美业新体验，智慧新美业，给美业赋能AI')
      .width(200)
      .padding(8)

    Row() {
      Row({space:5}) {
        Image($r('app.media.app_icon'))
          .width(20)

        Text('嘟聊')
          .fontColor('#999999')
      }

      Row({space:5}) {
        Image($r('app.media.ic_public_favor'))
          .width(20)
          .fillColor(colorState)

        Text(numStr.toString())
          .fontColor(colorState)
      }.onClick(() => {
        isSelect = !isSelect
        if (!isSelect) {
          numStr--
          colorState = '#999999'
        } else {
          numStr++
          colorState = '#ff1100'
        }
      })
    }
    .padding(8)
    .width(200)
    .justifyContent(FlexAlign.SpaceBetween)
  }
  .backgroundColor(Color.White)
}

/**
 * 动态修改文字和颜色
 * @param numStr
 */
@Builder
function changeTextDemo() {
  Column() {
    Image($r('app.media.splash_main'))
      .height(200)
      .width(200)
      .borderRadius({topLeft:10, topRight:10})

    Text('美业新体验，智慧新美业，给美业赋能AI')
      .width(200)
      .padding(8)

    Row() {
      Row({space:5}) {
        Image($r('app.media.app_icon'))
          .width(20)

        Text('嘟聊')
          .fontColor('#999999')
      }

      Row({space:5}) {
        Image($r('app.media.ic_public_favor'))
          .width(20)

        Text('100')
          .fontColor('#999999')
      }
    }
    .padding(8)
    .width(200)
    .justifyContent(FlexAlign.SpaceBetween)
  }
  .backgroundColor(Color.White)
}

@Builder
function stateDemo(numStr: number) {
  Row() {
    Button('-').onClick((event: ClickEvent) => {
      numStr--
    })
      .width(80)
      .height(80)
      .fontSize(34)

    Text(numStr.toString())
      .width(80)
      .height(80)
      .textAlign(TextAlign.Center)
      .fontSize(34)

    Button('+').onClick((event: ClickEvent) => {
      numStr++
    })
      .width(80)
      .height(80)
      .fontSize(34)
  }
}

@Builder
function alipayDemo() {
  Stack({alignContent: Alignment.Bottom}) {
    Stack({alignContent: Alignment.Top}) {
      Row() {
        Text('这是标题')
          .fontColor(Color.White)
      }
      .width('100%')
      .height(60)
      .backgroundColor(Color.Blue)
      .zIndex(1)

      Scroll() {
        Column({space:3}) {
          Text('项目1')
            .fontSize(18)
            .borderWidth(5)
            .height(150)

          Text('项目1')
            .fontSize(18)
            .borderWidth(5)
            .height(150)

          Text('项目1')
            .fontSize(18)
            .borderWidth(5)
            .height(150)

          Text('项目1')
            .fontSize(18)
            .borderWidth(5)
            .height(150)

          Text('项目1')
            .fontSize(18)
            .borderWidth(5)
            .height(150)

          Text('项目1')
            .fontSize(18)
            .borderWidth(5)
            .height(150)

          Text('项目1')
            .fontSize(18)
            .borderWidth(5)
            .height(150)
        }
        .width('100%')
        .margin({top:60, bottom:50})
      }
    }
    .width('100%')
    .height('100%')

    Row() {
      Column() {
        Image($r('app.media.tab_message_selected'))
          .width(30)
      }

      Column() {
        Image($r('app.media.tab_home_normal'))
          .width(25)
        Text('主页')
          .fontSize(10)
          .fontColor('#666')
      }

      Column() {
        Image($r('app.media.tab_workbench_normal'))
          .width(25)
        Text('服务台')
          .fontSize(10)
          .fontColor('#666')
      }

      Column() {
        Image($r('app.media.tab_bird_normal'))
          .width(25)
        Text('人才网')
          .fontSize(10)
          .fontColor('#666')
      }

      Column() {
        Image($r('app.media.tab_addressbook_normal'))
          .width(25)
        Text('通讯录')
          .fontSize(10)
          .fontColor('#666')
      }
    }
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor(Color.White)
    .width('100%')
    .height(50)
  }
  .width('100%')
  .height('100%')
  .backgroundColor(Color.Pink)
}

@Builder
function videoDemo() {
  Column() {
    Stack({alignContent: Alignment.Bottom}) {
      Image($r('app.media.splash_main'))
        .height(125)
        .width('100%')
        .borderRadius({topLeft:10, topRight:10})

      Row() {
        Row() {
          Image($r('app.media.ic_common'))
            .width(13)
            .fillColor(Color.White)

          Text('1000万')
            .fontSize(12)
            .fontColor(Color.White)
        }

        Row() {
          Image($r('app.media.ic_common'))
            .width(13)
            .fillColor(Color.White)

          Text('1000')
            .fontSize(12)
            .fontColor(Color.White)
        }.padding({left:5, right:5})

        Blank()

        Text('11:00')
          .fontSize(12)
          .fontColor(Color.White)
      }
      .width('100%')
      .padding(8)
    }

    Text('【嘟聊开发】一个应用通常会包含多种功能，将不同的功能特性按模块来划分和管理是一种良好的设计方式。在开发过程中，我们可以将每个功能模块作为一个独立的Module进行开发，Module中可以包含源代码、资源文件、第三方库、配置文件等，每一个Module可以独立编译，实现特定的功能')
      .textOverflow({overflow: TextOverflow.Ellipsis})
      .maxLines(2)
      .margin(5)
      .fontSize(14)
      .layoutWeight(1)

    Row() {
      Text('100万点赞')
        //添加上中下划线
        .decoration({type: TextDecorationType.Underline})
        .fontSize(12)
        .fontColor('#ffefaa20')

      Image($r('app.media.ic_gallery_collage'))
        .width(15)
        .fillColor('#666')
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({left:10, right:10, bottom:10})

  }
  .backgroundColor(Color.White)
  .borderRadius(10)
  .margin({top:10})
  .width(200)
  .height(200)
}

@Builder
function hotCardDemo() {
  Column(){
    Text('VIP')
      .position({x:0,y:0})
      .zIndex(666)
      .backgroundColor('#fff18423')
      .width(40)
      .height(20)
      .border({width:2, color:Color.White})
      .borderRadius({topLeft:10, bottomRight:10})
      .fontColor(Color.White)
      .fontSize(12)
      .fontWeight(700)
      .fontStyle(FontStyle.Italic)
      .textAlign(TextAlign.Center)

    Image($r('app.media.ban1'))
      .width('100%').height(210)
      .borderRadius(10)

    Row() {
      Image($r('app.media.app_icon'))
        .width(20)
        .margin({right:5})

      Text('嘟聊提供')
        .fontSize(14)
    }
    .padding({left:8})
    .width('100%')
    .height(30)

  }
  .borderRadius(10)
  .backgroundColor(Color.White)
  .width(160)
  .height(240)
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