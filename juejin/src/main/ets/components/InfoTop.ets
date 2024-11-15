import { router } from '@kit.ArkUI'

@Extend(Button)
function customBtnStyle(isOn: boolean) {
  .fontSize(12)
  .fontColor(isOn ? '#000' : '#ffc1b9b9')
  .width(46)
  .height(32)
  .padding(5)
  .border({width:1, color: isOn ? '#ffb5b1b1' : '#fff'})
  .backgroundColor(Color.White)
}


@Preview
@Component
struct InfoTop {
  @State isOn: boolean = true
  onChangeSort = (type: number) => {}

  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .width(30)
        .aspectRatio(1)
        .margin({right:10})
        .onClick(() => {
          router.back()
        })

      Text('全部评论')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor('#666')
        .layoutWeight(1)
        
      Row() {
        //stateEffect 关闭按钮点击效果
        Button('最新', {stateEffect: false})
          .customBtnStyle(this.isOn)
          .onClick(() => {
            this.isOn = true
            this.onChangeSort(0)
          })

        Button('最热', {stateEffect: false})
          .customBtnStyle(!this.isOn)
          .onClick(() => {
            this.isOn = false
            this.onChangeSort(1)
          })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
  }
}

export default InfoTop