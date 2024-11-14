class CommentData {
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
    this.userLv = converUerLv(userLv)
    this.commentContent = commentContent
    this.isCollect = isCollect
    this.collectCount = collectCount
    this.time = time
    this.timeDec = converTime(this.time)
  }

}


function converUerLv(userLv: number): string {
  throw new Error('Function not implemented.')
}

function converTime(time: number): string {
  throw new Error('Function not implemented.')
}
