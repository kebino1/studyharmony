@Component
struct InfoBottom {
  @State txt: string = '123'
  onSubmit = (text: string) => {}

  build() {
    Row() {
      Row() {
        Text('\ue605')
          .fontFamily('myfont')
          .fontSize(18)

        TextInput({
          placeholder: '写评论...',
          text: $$this.txt //$$ 表示数据和inputtext输入双向绑定
        })
          .onSubmit(() => {
            this.onSubmit(this.txt)
          })
          .backgroundColor(Color.Transparent)
      }
      .backgroundColor('#fff3f0f0')
      .borderRadius(20)
      .padding({ left: 10 })
      .layoutWeight(1)

      Text('\ue621')
        .fontFamily('myfont')
        .fontSize(24)
        .padding({ left: 5, right: 5 })

      Text('\ue600')
        .fontFamily('myfont')
        .fontSize(24)
        .padding({ left: 5, right: 5 })
    }
    .padding({ left: 20, right: 10, top: 10 })
    .width('100%')
    .height(60)
  }
}

export default InfoBottom