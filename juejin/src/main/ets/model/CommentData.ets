@Observed
export class CommentData {
  name: string
  iconUrl: string
  userLv: string
  commentContent: string
  isCollect: boolean
  collectCount: number
  time: number
  timeDec: string

  constructor(name: string, iconUrl: string, userLv: number, commentContent: string, isCollect: boolean,
    collectCount: number, time: number) {
    this.name = name
    this.iconUrl = iconUrl
    this.userLv = this.converUerLv(userLv)
    this.commentContent = commentContent
    this.isCollect = isCollect
    this.collectCount = collectCount
    this.time = time
    this.timeDec = this.converTime(this.time)
  }

  converTime(time: number): string {
    const currentTimestamp = new Date().getTime()
    //当前时间 - 发布时间 ，转换成秒
    const timeDifference = (currentTimestamp - time) / 1000
    console.debug('kebi', `时间戳（秒）：${timeDifference}`)

    if (timeDifference <= 0) {
      return '刚刚'
    } else if (timeDifference < 60) {
      return `${Math.floor(timeDifference)}秒前`
    }  else if (timeDifference < 3600) {
      return `${Math.floor(timeDifference/60)}分钟前`
    } else if(timeDifference < 86400) {
      return `${Math.floor(timeDifference / 3600)}小时前`
    } else if(timeDifference < 604800) {
      return `${Math.floor(timeDifference / 86400)}天前`
    } else if(timeDifference < 2592000) {
      return `${Math.floor(timeDifference / 604800)}周前`
    } else if(timeDifference < 31536000) {
      return `${Math.floor(timeDifference / 2592000)}个月前`
    } else {
      return `${Math.floor(timeDifference / 31536000)}年前`
    }
  }

  converUerLv(userLv: number): string {
    return 'app.media.ic_lv'+userLv
  }

}

export function createData(): Array<CommentData> {
  return [
    new CommentData('kebi', 'https://www.baidu.com/img/flexible/logo/pc/result.png', Math.floor(Math.random()*5), "我是你爸爸", false, 0, 1731206238000),
    new CommentData('悟饭', 'https://img0.baidu.com/it/u=4150086214,1989269542&fm=253&fmt=auto&app=120&f=JPEG?w=668&h=500', Math.floor(Math.random()*5), "该方法将一个ArkTS对象或数组转换为JSON字符串，对于容器支持线性容器转换，非线性的容器不支持。", false, 0, 1731306238000),
    new CommentData('沙鲁', 'https://img2.baidu.com/it/u=4292853944,2447852985&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=1035', Math.floor(Math.random()*5), "马斯克与伊朗驻联合国大使会面", false, 10, 1700006238000),
    new CommentData('悟空', 'https://img0.baidu.com/it/u=136660018,3306953308&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1424', Math.floor(Math.random()*5), "紫金矿业称盗采确实存在但影响较小", false, 5, 1731111118000),
    new CommentData('特南克斯', 'https://img2.baidu.com/it/u=2143672212,4129514080&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500', Math.floor(Math.random()*5), "通过排查发现,是git默认使用的通信协议出现了问题,...", false, 66, 1731206200000),
    new CommentData('贝吉塔', 'https://img2.baidu.com/it/u=2450267678,3038412754&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=854', Math.floor(Math.random()*5), "在使用 git 向github上传文件时,在git push origin master这一步报告以下错误: fatal: unabletoaccess'https://github.com/xxxxx.git/': HTTP/2stream1wasno", false, 0, 1731206238000),
    new CommentData('布欧', 'https://img1.baidu.com/it/u=200366988,719103644&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=1083', Math.floor(Math.random()*5), "1岁男孩爬上火车头遭电击", false, 0, 1731206299000),
    new CommentData('18号', 'https://img0.baidu.com/it/u=2012398945,1590008753&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=707', Math.floor(Math.random()*5), "马丽回应提名金鸡奖最佳女主角", false, 23, 1731206778000),
    new CommentData('天津饭', 'https://img2.baidu.com/it/u=494247843,32398743&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=1083', Math.floor(Math.random()*5), "传文件时,在git push origin master这一步报告以下错误: fatal: unabletoaccess'https://github.com/xxxxx.git/': HTTP/2stream1wasnotcl...", false, 0, 1731206238000),
    new CommentData('克林', 'https://img1.baidu.com/it/u=546751753,4199335409&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', Math.floor(Math.random()*5), "g --global http.versioin HTTP/1.1 重新git clone 就可以了...", false, 4, 1731201118000),
    new CommentData('龟仙人', 'https://img2.baidu.com/it/u=1109124309,2036935387&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=892', Math.floor(Math.random()*5), "我是你爸爸", false, 0, 1731206238000),
  ]
}
