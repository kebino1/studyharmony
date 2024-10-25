import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct LoginPage {
  @State message: string = 'Hello World';

  build() {
    Column({space: 30}) {
      Image($r('app.media.app_logo'))
        .width(120)

      TextInput({placeholder: '请输入账号'})
      TextInput({placeholder: '请输入密码'})
        .type(InputType.Password)

      Button('登录').onClick((event: ClickEvent) => {
        let user = new UserInfo('admin', '123')
        AlertDialog.show({message: JSON.stringify(user)})
      })
        .width('100%')

      Row(){
        Text('忘记密码')
        // Image($r('app.media.ic_public_close_filled'))
        //   .width(20)
        //   .fillColor('#ff1362b0')
        Text('重置')
      }
      .justifyContent(FlexAlign.SpaceAround)
      .width('100%')
    }
    .justifyContent(FlexAlign.Start)
    .padding(30)
    .height('100%')
    .width('100%')
  }
}

class UserInfo{
  name: string
  password: string

  constructor(name: string, password: string) {
    this.name = name;
    this.password = password;
  }
}