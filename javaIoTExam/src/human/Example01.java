package human;

//010-6717-0339


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

import db.Dbmethod;
import db.HumanDTO;
import iot.Aircondiition;
import iot.Cucu;
import iot.Elevator;
import iot.Light;
import iot.RemoteControl;
import iot.Security;
import iot.TV;

public class Example01 {
	public static void main(String[] args) {
		
		
//		Elevator elevator = new Elevator(aptId);
//		elevator.goingUp(1, 5);
//		elevator.goingNone(5,5);
//		elevator.goingDown(9,5);
		
		
//		RemoteControl remocon = new Aircondiition(aptId);
//		remocon.on();
//		remocon.off();
//		System.out.println("");
//		
//		remocon = new Cucu(aptId);
//		remocon.on();
//		remocon.off();
//		System.out.println("");
//		
//		remocon = new Light(aptId);
//		remocon.on();
//		remocon.off();
//		System.out.println("");
//		
//		
//		remocon = new Security(aptId);
//		remocon.on();
//		remocon.off();
//		System.out.println("");
//		
//		remocon = new Light(aptId);
//		remocon.on();
//		remocon.off();
//		System.out.println("");
		Scanner sc = new Scanner(System.in);
		int nowfloor=1;
//		ArrayList<String> list = new ArrayList<>(Arrays.asList("XII/101/101","Security off","Aircondition off","Light off","TV off","Cucu off"));
		String[] list = new String[6];
		System.out.println("aptId를 입력하세요.");
		String aptId = sc.next();
		list[0] = aptId;
		while(true) {
			
			
			System.out.print("사용할 IoT를 선택 해주세요(1:Elevator 2:Security 3:Aircondition 4:Light 5:TV 6:Cucu 7:종료):");
			int button = sc.nextInt();
			
			RemoteControl remocon;
			if(button== 1) {
				while(true) {
					System.out.println("Elevator [1:on /2:off]");
					int elevator_button = sc.nextInt();
					
					Elevator elevator = new Elevator(aptId);
					
					if(elevator_button ==1) {
						System.out.print("타는층:");
						int startfloor = sc.nextInt();
						System.out.print("몇층:");
						int stopfloor = sc.nextInt();
						
						if(nowfloor<stopfloor) {
							elevator.goingUp(startfloor,nowfloor,stopfloor);
						}else if(nowfloor>stopfloor) {
							elevator.goingDown(startfloor,nowfloor,stopfloor);
						}else if(nowfloor == stopfloor) {
							elevator.goingNone(startfloor,stopfloor);
						}
						
						nowfloor = stopfloor;
					}else if(elevator_button ==2) {
						break;
					}
				}
			}else if(button== 2) {
				while(true) {
				System.out.println("Security [1:on / 2:off / 3:back]");
				int Security_button = sc.nextInt();
				
				remocon = new Security(aptId);
				
					if(Security_button == 1) {
						remocon.on();  list[1] ="Security ON";
					}else if(Security_button == 2) {
						remocon.off();  list[1] ="Security OFF";
					}else if(Security_button == 3) {
						break;
					}
					
				}
				
			}else if(button== 3) {
				while(true) {
				System.out.println("Aircondition [1:on / 2:off / 3:back]");
				int Aircondition_button = sc.nextInt();
				
				remocon = new Security(aptId);
				
					if(Aircondition_button == 1) {
						remocon.on();	list[2] ="Aircondition ON";
					}else if(Aircondition_button == 2) {
						remocon.off();	list[2] ="Aircondition OFF";
					}else if(Aircondition_button == 3) {
						break;
					}
				}
			}else if(button== 4) {
				while(true) {
				System.out.println("Light [1:on / 2:off / 3:back]");
				int Light_button = sc.nextInt();
				
				remocon = new Security(aptId);
				
					if(Light_button == 1) {
						remocon.on();	list[3]="Light ON";
					}else if(Light_button == 2) {
						remocon.off();	list[3]="Light OFF";
					}else if(Light_button == 3) {
						break;
					}
				}
			}else if(button== 5) {
				while(true) {
				System.out.println("Tv [1:on / 2:off / 3:back]");
				int TV_button = sc.nextInt();
				
				remocon = new Security(aptId);
				
					if(TV_button == 1) {
						remocon.on();	list[4]= "TV ON";
					}else if(TV_button == 2) {
						remocon.off();	list[4]= "TV OFF";
					}else if(TV_button == 3) {
						break;
					}
				}
			}else if(button== 6) {
				while(true) {
				System.out.println("Cucu [1:on / 2:off / 3:back]");
				int Cucu_button = sc.nextInt();
				
				remocon = new Security(aptId);
				
					if(Cucu_button == 1) {
						remocon.on();	list[5]="Cucu ON";
					}else if(Cucu_button == 2) {
						remocon.off();	list[5]="Cucu OFF";
					}else if(Cucu_button == 3) {
						break;
					}
				}
			}else if(button== 7) {
				break;
			}//button if }
		
	
		}//while }
		System.out.println("--종료--");
		System.out.println(list[3]);
		
		HumanDTO dto = new HumanDTO(list[0],list[1],list[2],list[3],list[4],list[5]);
		Dbmethod db = new Dbmethod();
		db.setInsert(dto);
	
	}	
	
}
