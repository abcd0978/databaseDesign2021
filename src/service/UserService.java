package service;

import java.sql.SQLException;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import dao.userDAO;
import dto.userDTO;

public class UserService {
	private static final userDAO dao = new userDAO();
	
	public UserService() {}
	
	public String checkLogin(String email, String pw) {
		return dao.selectUid(email, pw);
	}
	public boolean insertUser(userDTO dto) {
		try {
			return dao.insert(dto);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateUser(userDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}
}
