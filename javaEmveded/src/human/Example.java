package human;

import java.util.Scanner;

import iot.Aircondition;
import iot.Elevator;
import iot.Light;
import iot.Remotecontrol;
import iot.Security;
import iot.Television;

public class Example {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		Remotecontrol remocon;
		
		String[] list = new String[5];
		
		System.out.print("AptId: ");
		String aptId = sc.next();
		list[0]=aptId;
		
		int nowfloor =4;
		while(true) { //어플리케이션 메뉴
			System.out.print("메뉴를 선택하세요. (1.Elevator 2.Security 3.Light 4.Aircondition 5.Television 0.'exit') :");
			int menu_button = sc.nextInt();
			
			if(menu_button==1) {//선택된 기능{
				while(true) {
					System.out.println("Elevator [1:ON / 2:OFF]");
					int button = sc.nextInt();
						
					Elevator elevator = new Elevator(aptId);
					
					if(button == 1) {
						System.out.print("타는층:");
						int startfloor = sc.nextInt();
						System.out.print("이동할 층:");
						int stopfloor = sc.nextInt();
						
						if(nowfloor<stopfloor) {
							elevator.goingUp(startfloor,nowfloor,stopfloor);
						}else if(nowfloor>stopfloor) {
							elevator.goingDown(startfloor,nowfloor,stopfloor);
						}else if(nowfloor == stopfloor) {
							elevator.goingNone(startfloor,stopfloor);
						}
						nowfloor = stopfloor;
					}else if(button == 2 ) {
						break;
					}
				}
				
				
			}else if(menu_button == 2) {
				while(true) {
					System.out.println("Security [1:on / 2:oFF / 3:back]");
					int button = sc.nextInt();
					
					remocon = new Security(aptId);
					
					if(button == 1) {
						remocon.on();  list[1] ="Security ON";
					}else if(button == 2) {
						remocon.off();  list[1] ="Security OFF";
					}else if(button == 3) {
						break;
					}
				}	
				
			}else if(menu_button == 3) {
				while(true){
					System.out.println("Light [1: ON / 2:OFF / 3:back]");
					int button = sc.nextInt();
					
					remocon = new Light(aptId);
					
					if(button ==1) {
						remocon.on();	list[2]="Light ON";
					}else if(button == 2) {
						remocon.off();	list[2]="Light OFF";
					}else if(button == 3) {
						break;
					}
				}
			}else if(menu_button == 4) {
				while(true) {
				System.out.println("Aircondition [1:on / 2:off / 3:back]");
				int button = sc.nextInt();
				
				remocon = new Aircondition(aptId);
				
					if(button == 1) {
						remocon.on();	list[3] ="Aircondition ON : 23'C";
					}else if(button == 2) {
						remocon.off();	list[3] ="Aircondition OFF";
					}else if(button == 3) {
						break;
					}
				}
			}else if(menu_button == 5) {
				while(true) {
				System.out.println("Television [1:on / 2:off / 3:back]");
				int button = sc.nextInt();
				
				remocon = new Television(aptId);
				
					if(button == 1) {
						remocon.on();	list[4]= "TV ON";
					}else if(button == 2) {
						remocon.off();	list[4]= "TV OFF";
					}else if(button == 3) {
						break;
					}
				}
			}else if(menu_button == 0) {
				break;
			}
		}//어플리케이션 메뉴 }
		String state = "["+list[0]+", "+list[1]+", "+list[2]+", "+list[3]+", "+list[4]+"]";
		
		System.out.println(state);
		
		
	}
}
