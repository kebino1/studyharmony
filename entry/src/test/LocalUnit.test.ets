import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Type } from '@ohos.arkui.StateManagement';

export default function localUnitTest() {
  describe('localUnitTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      let arr = Array(1,2,3)
      for (let a of arr) {
        console.debug(`打印结果${a.toString()}`)
      }

    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    it('assertContain', 0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let a = 'abc';
      let b = 'b';
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    });
  });
}

function factorial(n: number): number {
  hello()
  if (n <= 1) {
    return 1;
  }

  return factorial(n-1) * n
}


function hello(param?: string, value: string = "你好") {

}

enum Sex {MAN,FALMAN}

class Person{
  sex: Sex = Sex.MAN

  eat() {
    this.sex == Sex.MAN? console.debug("男吃") : console.debug("女吃")
  }
}

class Student extends Person{
  eat(): void {
    let data = new CustomData<string>()
    data.push("kebi")

    let data2 = new CustomData<number>()
    data2.push(1)


  }

}

class CustomData<T> {
  push(e: T) {

  }

  delete<M>(person: M): M {
    return person
  }
}



