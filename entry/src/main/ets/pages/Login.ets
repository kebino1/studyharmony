import { router } from '@kit.ArkUI'
import { Index } from './Index'

@Entry
@Component
struct Login {
  build() {
    Row() {
      Button("返回").onClick((event: ClickEvent) => {
        router.back()
      })
      Column() {
        Text("登录页")
          .fontSize(24)
      }
    }
  }
}

function test() {
  let name = Index().message
  console.debug(`我是${name}`)
}
