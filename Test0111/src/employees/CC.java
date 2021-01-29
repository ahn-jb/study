package employees;

import java.util.ArrayList;

public class CC {
	public static void main(String[] args) {
		
		EmployeesDAO dao = new EmployeesDAO();
		ArrayList<EmployeesDTO> list = dao.getSelectAll();
		
		for(int i=0; i<list.size(); i++) {
			EmployeesDTO dto = list.get(i);
			
			System.out.println(dto.getEmployee_id());
			System.out.println(dto.getFirst_name());
			System.out.println(dto.getLast_name());
			System.out.println(dto.getEmail());
			System.out.println(dto.getPhone_number());
			System.out.println(dto.getHire_date());
			System.out.println(dto.getJob_id());
			System.out.println(dto.getSalary());
			System.out.println(dto.getCommitssion_pct());
			System.out.println(dto.getManager_id());
			System.out.println(dto.getDepartment_id());
			
		}
		
	}
}
