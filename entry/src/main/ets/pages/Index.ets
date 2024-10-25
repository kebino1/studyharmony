import { router } from '@kit.ArkUI';
//导入整个文件，需要使用as设置别名，使用时需要用 别名. 方式调用文件中的类，参数或函数
//如: new go.Goods()
import * as go from '../common/Gods'

let title = 'hello world'
title = 'hel'
console.log(title);

const PI: number = 3.14
console.log('kebi', PI);

@Entry
@Component
export struct Index {
  @State message: string = '嘟聊鸿蒙版2';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Button("登录").onClick((event: ClickEvent) => {
        //使用路由跳转其他页面
        console.debug("点击了按钮", "测试")
        router.pushUrl({url:'pages/Login'})
      })
        .borderStyle(BorderStyle.Dashed)
        .backgroundColor('#ffef1472')
    }
    .height('100%')
    .width('100%')
  }
}

let lambda = () => console.debug('ceshi')

class Person{
  private _name: string = "科比";

  constructor(name: string) {
    this._name = name
  }

  public set name(value: string) {
    this._name = value;
  }

  public get name(): string {
    return this._name;
  }

  private _age: number = 1;

  public set age(value: number) {
    this._age = value;
  }

  public get age(): number {
    return this._age;
  }

  println() {
    console.debug("我是"+this._name)
  }


}

class Student extends Person {
  constructor(age: number) {
    super("悟空");
  }
}

interface Callback {
  result: string

  onCallback(): number
}

function test1(params: String) {
  const person = new Person("kebi")
  person.println()
  const student = new Student(11)
  student.name
  if (params.startsWith("k")) {
    console.error('kebi')
  } else {
    console.error('叼毛')
  }
}