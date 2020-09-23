package empManage;

import java.awt.Cursor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionManager;
import vo.Books;
import vo.Employees;

public class EmpDAO {
	// 전역변수. 모든 메서드에 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt; // PreparedStatement는 Statement와 같은 기능을 수행하지만 가독성이 좋고 더 빠르다. ?기호 사용가능
	ResultSet rs = null; // ResultSet은 결과의 집합이라 select할때 사용하기. 초기값 필요하다

	// 싱글톤
	static EmpDAO instance;

	public static EmpDAO getInstance() {
		if (instance == null)
			instance = new EmpDAO();
		return instance;
	}

	// 사원 한 건 조회
	public Employees selectOne(Employees Employees) { // 어떤 컬럼으로 검색할지에 대한 조건
		Employees resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from employees where emp_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Employees.getEmp_id());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				resultVO = new Employees();

				Employees = new Employees();
				resultVO.setEmp_no(rs.getString("emp_no"));
				resultVO.setEmp_id(rs.getString("emp_id"));
				resultVO.setEmp_pw(rs.getString("emp_pw"));
				resultVO.setEmp_name(rs.getString("emp_name"));
				resultVO.setEmp_birth(rs.getString("emp_birth"));
				resultVO.setEntered_date(rs.getString("entered_date"));
				resultVO.setDept_code(rs.getString("dept_code"));
				resultVO.setEmp_address(rs.getString("emp_address"));
				resultVO.setRank_code(rs.getString("rank_code"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);

		}

		return resultVO;

	}

	// 전체 조회
	public List<Employees> selectAll(String search_text, String search_type) {
		List<Employees> list = new ArrayList<Employees>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * FROM EMPLOYEES";
			System.out.println("search_text = " + search_text + ", search_type =" + search_type);

			if (search_text != null && !search_text.equals("")) {
				sql += " WHERE " + search_type + " Like '%" + search_text + "%'";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Employees employees = new Employees();
				employees.setEmp_no(rs.getString(1));
				employees.setEmp_id(rs.getString("emp_id"));
				employees.setEmp_pw(rs.getString("emp_pw"));
				employees.setEmp_name(rs.getString("emp_name"));
				employees.setEmp_birth(rs.getString("emp_birth"));
				employees.setEntered_date(rs.getString("entered_date"));
				employees.setDept_code(rs.getString("dept_code"));
				employees.setEmp_address(rs.getString("emp_address"));
				employees.setRank_code(rs.getString("rank_code"));

				list.add(employees);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 등록
	public Employees Insert(Employees employees) {
		/*
		 * SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG FROM
		 * USER_SEQUENCES; insert into employees values ((시퀀스명).nextval ,EMP_ID EMP_NAME
		 * EMP_BIRTH ENTERED_DATE DEPT_CODE EMP_ADDRESS RANK_CODE
		 */
		Employees resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);

			String seqSql = "select no from seq where tablename = 'employees'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			int no = rs.getInt(1);
			employees.setEmp_no(Integer.toString(no));

			seqSql = "update seq set no = no + 1 where tablename = 'employees'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);
			String sql = "INSERT INTO EMPLOYEES (EMP_NO, EMP_ID, EMP_PW, EMP_NAME, "
					+ " EMP_BIRTH, ENTERED_DATE, DEPT_CODE, EMP_ADDRESS, RANK_CODE " + " values(?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, employees.getEmp_no());
			pstmt.setString(2, employees.getEmp_id());
			pstmt.setString(3, employees.getEmp_pw());
			pstmt.setString(4, employees.getEmp_name());
			pstmt.setString(5, employees.getEmp_birth());
			pstmt.setString(6, employees.getEntered_date());
			pstmt.setString(7, employees.getDept_code());
			pstmt.setString(8, employees.getEmp_address());
			pstmt.setString(9, employees.getRank_code());
			pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			ConnectionManager.close(conn);
		}
		return resultVO;
	}


	// 수정
	public int Update(Employees emp) {
		int r = 0;
		/*
		 * try { conn = ConnectionManager.getConnnect(); String sql =
		 * "update employees set  email=?, phone_number=?, job_id=?, salary=?, " +
		 * " hire_date=? where employee_id = ?"; pstmt = conn.prepareStatement(sql); //
		 * 3. 실행 pstmt.setString(1, emp.getEmail()); pstmt.setString(2,
		 * emp.getPhone_number()); pstmt.setString(3, emp.getJob_id());
		 * pstmt.setString(4, emp.getSalary()); pstmt.setString(5, emp.getHire_date());
		 * r = pstmt.executeUpdate(); // 4. 결과처리 } catch (Exception e) {
		 * e.printStackTrace(); } finally { ConnectionManager.close(conn);
		 * 
		 * }
		 */
		return r;
	}

	// 삭제
	public int Delete(Employees emp) {
		int r = 0;
		/*
		 * try { conn = ConnectionManager.getConnnect(); String sql =
		 * "delete employees where employee_id = ?"; pstmt = conn.prepareStatement(sql);
		 * 
		 * } catch(Exception e) { e.printStackTrace(); }finally{
		 * ConnectionManager.close(conn); }
		 */
		return r;

	}

	// 로그인 체크 <- 검색 해보고 다시 해보기...
	public Employees loginCk(Employees Employees) {
		Employees resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from employees where emp_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Employees.getEmp_id());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				resultVO = new Employees();

				Employees = new Employees();
				resultVO.setEmp_id(rs.getString("emp_id"));
				resultVO.setEmp_pw(rs.getString("emp_pw"));
				resultVO.setEmp_name(rs.getString("emp_name"));
				resultVO.setEmp_birth(rs.getString("emp_birth"));
				resultVO.setEntered_date(rs.getString("entered_date"));
				resultVO.setDept_code(rs.getString("dept_code"));
				resultVO.setEmp_address(rs.getString("emp_address"));
				resultVO.setRank_code(rs.getString("rank_code"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);

		}

		return resultVO;
	}
}
