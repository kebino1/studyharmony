@Entry
@Component
struct RegisterPage {
  @State message: string = '用户注册';
  options: SelectOption[] = [{value:"广州"}, {value:"北京"}, {value:"上海"}]

  build() {
    Column({space: 15}) {
      Text(this.message).fontSize(30).fontWeight(FontWeight.Bold)

      Divider().width('100%').height(5).color(Color.Green)

      Row({space:20}){
        Text('性别:')
        Radio({value:'male', group:'setGroup'}).checked(true).width(20).height(20)
        Text('男')

        Radio({value:'female', group:'setGroup'}).width(20).height(20)
        Text('女')
      }
      .width('100%')

      Row({space:20}) {
        Text('地址:')
        Select(this.options)
          .width('70%')
          .value('请选择地址')
          .selected(1)
          .onSelect((index, value) => {
            console.log('kebi', index, value)
          })
      }
      .width('100%')

      Row({space:20}) {
        Text('爱好:')
        Checkbox({name:'game', group:'hobby'})
          .onChange((value)=> {
            value ? console.log('选中了游戏') : console.log('未选中游戏')
          })
        Text('游戏').fontSize(14).fontWeight(10)

        Checkbox({name:'sport', group:'hobby'})
          .onChange((value)=> {
            value ? console.log('选中了运动') : console.log('未选中运动')
          })
        Text('运动').fontSize(14).fontWeight(10)

        Checkbox({name:'music', group:'hobby'})
          .onChange((value)=> {
            value ? console.log('选中了音乐') : console.log('未选中音乐')
          })
        Text('音乐').fontSize(14).fontWeight(10)
      }

      Row() {
        Text('生日:')
        DatePicker({start: new Date()})
          .height(150)
          .width('70%')
          .onDateChange((value) => {
            console.log('生日', value)
          })
      }

      Row({space:20}) {
        Checkbox({name:'saveinfo'})
          .onChange((value) => {
            value?console.log('记住') : console.log('不记住')
          })
        Text('记住我')
      }.margin({top:5, bottom:5})

      Button('注册').onClick((event: ClickEvent) => {

      })
        .width('100%')
    }
    .alignItems(HorizontalAlign.Start)
    .height('100%')
    .width('100%')
    .padding(10)
  }
}