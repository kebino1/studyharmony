import axios, { AxiosResponse } from '@ohos/axios'
import { JSON } from '@kit.ArkTS';

@Entry
@Component
export  struct AxiosDemoPage {
  @State message: string = 'Hello World';

  async request() {
    try {
      const response :AxiosResponse = await axios.get<string, AxiosResponse<string>, null>('https://im.dudugua.com/api/im/read')
      console.log('请求结果')
      console.log(JSON.stringify(response))
    } catch (error) {
      this.message = '请求结果==失败'
      console.error(JSON.stringify(error))
    }
  }

  build() {
    Column() {
      Button('发起请求').onClick((event: ClickEvent) => {
        this.request()
      })

      Text(this.message)
        .margin(15)
    }
    .height('100%')
    .width('100%')
  }
}