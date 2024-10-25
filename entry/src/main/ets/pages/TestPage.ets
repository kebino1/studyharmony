import { media } from '@kit.MediaKit';

@Entry
@Component
struct TestPage {
  @State message: string = 'hello world'

  build() {
    Column(){

      Button('数字类型').onClick((event: ClickEvent) => {
        let n1: number = 10;
        let n2: number = 3.14;
        let n3 = n1 + n2
        console.debug(n3.toString(), n1, n2)
      })
        .width(100)
        .margin(5)

      Button('枚举类型').onClick((event: ClickEvent) => {
        let man = Man.GoodMan
      })
        .margin(5)

      Button('联合类型').onClick((event: ClickEvent) => {
        let avPlayer: media.AVPlayer | null = null

      })

      Button('数组类型').onClick((event: ClickEvent) => {
        let arr: string[] = ['1', 'shijia', '你好', '好的', '科比']
        let arr1: number[] = new Array(10)

        console.debug('kebi', arr[3], arr1[4])
      })
    }
  }
}

enum Man {
  GoodMan, BadMan, SexMan
}