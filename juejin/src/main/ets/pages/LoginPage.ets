import { router } from '@kit.ArkUI'

@Entry
@Component
struct LoginPage {
  @State name: string = ""

  build() {
    Column({ space: 10 }) {
      Text('登录页')
      TextInput({
        placeholder: "请输入用户名",
        text: $$this.name
      })

      Button("跳转主页").onClick((event: ClickEvent) => {
        router.pushUrl({
          url: "pages/Index", params: {
            name: this.name,
            uid: 123
          }
        })
      })
    }
  }
}