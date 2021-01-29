package employees;

public class Test {
	public static void main(String[] args) {
		int a[] = new int[100];
		int sw = 1;
		for(int i=0; i<a.length; i++) {
			if(sw==1) {
				a[i] = 100;
			}else if(sw==2) {
				a[i] = 200;
			}else {
				a[i] = 300;
			}
		}
	}
	
}
