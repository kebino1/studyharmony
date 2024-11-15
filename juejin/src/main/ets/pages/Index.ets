import InfoTop from '../components/InfoTop'
import InfoItem from '../components/InfoItem'
import InfoBottom from '../components/InfoBottom'
import { CommentData, createData } from '../model/CommentData'
//导入字体库
import font from '@ohos.font'
import { router } from '@kit.ArkUI'
import { JSON } from '@kit.ArkTS'

const TAG = 'kebi'

interface ParamsObj {
  name: string
  uid: number
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State commentDatas: Array<CommentData> = createData()
  params: ParamsObj = {
    name: '',
    uid: 0
  }

  handleLike(index: number) {
    const data = this.commentDatas[index]
    if (data.isCollect) {
      data.collectCount -= 1
    } else {
      data.collectCount += 1
    }
    data.isCollect = !data.isCollect
    // this.commentDatas.splice(index, 1, data)
  }

  onChangeSort(type: number) {
    if (type === 0) {
      this.commentDatas.sort((a, b) => {
        return b.time - a.time
      })
    } else {
      this.commentDatas.sort((a, b) => {
        return b.collectCount - a.collectCount
      })
    }
  }

  //生命周期==加载组件时 首先加载该生命周期
  aboutToAppear(): void {
    //初始化字体注册
    font.registerFont({
      familyName: 'myfont', //给字体命名
      familySrc: '/font/iconfont.ttf' //字体资源
    })
    console.debug(TAG, `当前时间描述${this.commentDatas[0].timeDec}`)
    this.onChangeSort(0)

    //获取上一页传递的值
    this.params = router.getParams() as ParamsObj
    console.debug(TAG, JSON.stringify(this.params))
    console.debug(TAG, "用户名:"+this.params.name)

  }

  build() {
    Column() {
      Text(this.params.name)
      InfoTop({onChangeSort: (type: number) => {
        this.onChangeSort(type)
      }})

      List() {
        ForEach(this.commentDatas, (item: CommentData, index) => {
          ListItem() {
            InfoItem({
              commentData: item,
              onLikeClick: () => {
                this.handleLike(index)
              }
            })
          }
          .onClick(() => {
            router.pushUrl({url:"pages/MainPage"}, router.RouterMode.Standard)
          })
        })
      }
      .width('100%')
      .layoutWeight(1)
      .divider({
        strokeWidth: 0.1,
        color: Color.Gray,
        startMargin: 40,
        endMargin: 10
      })

      InfoBottom({
        onSubmit: (text: string) => {
          let newItem: CommentData = new CommentData('神王',
            'https://img0.baidu.com/it/u=136660018,3306953308&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1424', 2, text,
            false, 0, new Date().getTime())
          // this.commentDatas = [newItem, ...this.commentDatas]
          this.commentDatas.unshift(newItem)
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}