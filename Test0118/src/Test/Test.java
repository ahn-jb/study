package Test;

public class Test {
	public static void main(String[] args) {//메인
		
		Test test = new Test();
		
		int a[] = new int[100];
		int sw = 1;
		if(sw==1) {
			test.sw1(a);
		}else if(sw==2) {
			test.sw2(a);
		}else {
			test.sw3(a);
		}
	}
	public void sw1(int a[]) {
		for(int i=0; i<a.length; i++) {
			a[i] = 100;
			System.out.println(a[i]);
		}
	}
	public void sw2(int a[]) {
			for(int i=0; i<a.length; i++) {
				a[i] = 200;
				System.out.println(a[i]);
			}	
	}
	public void sw3(int a[]) {
			for(int i=0; i<a.length; i++) {
				a[i] = 300;
				System.out.println(a[i]);
			}	
	}
}

	