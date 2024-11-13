
interface Person {
  name: string
  age: number
}


let num = 0
//按需导出
export let uid = 1
export let nickName = "kebi"

let person: Person = {
  name: "kebi",
  age: 1
}

//默认导出 只能导一个值
export default person

let count = 0
let imageUrl = "www.baidu.com"

//一次性将多个特性导出
export {count, imageUrl}