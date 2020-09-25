package company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.ConnectionManager;
import vo.Books;
import vo.Company;

public class CompanyDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	static CompanyDAO instance;
	public static CompanyDAO getInstance() {
		if(instance==null)
			instance=new CompanyDAO();
		return instance;
	}
	
	public Company insert (Company company) {
		Company resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			String seqSql = "select no from seq where tablename = 'company'";
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(seqSql);
			rs.next();
			int no = rs.getInt(1);
			company.setCompany_code(Integer.toString(no));
			
			seqSql = "update seq set no = no + 1 where tablename = 'company'";
			stmt = conn.createStatement();
			stmt.executeUpdate(seqSql);
			
			String sql = "insert into company (company_code, company_name, company_addr, company_mgr, company_tel, "
					+ "company_mgr_tel, company_account)"
					+ " values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, company.getCompany_code());
			pstmt.setString(2, company.getCompany_name());
			pstmt.setString(3, company.getCompany_addr());
			pstmt.setString(4, company.getCompany_mgr());
			pstmt.setString(5, company.getCompany_tel());
			pstmt.setString(6, company.getCompany_mgr_tel());
			pstmt.setString(7, company.getCompany_account());
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
	
	public int delete(Company company) {
		   int r = 0;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "DELETE COMPANY WHERE COMPANY_CODE = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, company.getCompany_code());
	         r = pstmt.executeUpdate();
	         System.out.println(r+"건 삭제됨");
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(null, pstmt, conn);
	      }
	      return r;
	   }
	
	public Company selectOne(Company company) {
	      Company companyvo = null;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "SELECT *"
	                  + " WHERE COMPANY_CODE = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, company.getCompany_code());
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 companyvo = new Company();
	        	 companyvo.setCompany_code(rs.getString(1));
	        	 companyvo.setCompany_name(rs.getString(2));
	        	 companyvo.setCompany_addr(rs.getString(3));
	        	 companyvo.setCompany_mgr(rs.getString(4));
	        	 companyvo.setCompany_tel(rs.getString(5));
	        	 companyvo.setCompany_mgr_tel(rs.getString(6));
	        	 companyvo.setCompany_account(rs.getString(7));
	         } else {
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(rs, pstmt, conn);
	      }
	      return companyvo;
	   }
	
	
	public ArrayList<Company> selectAll() {
	      ArrayList<Company> list = new ArrayList<Company>();
	      Company company = null;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "SELECT * "
	               + "FROM COMPANY ORDER BY 1";         
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	        	 company = new Company();
	        	 company.setCompany_code(rs.getString(1));
	        	 company.setCompany_name(rs.getString(2));
	        	 company.setCompany_addr(rs.getString(3));
	        	 company.setCompany_mgr(rs.getString(4));
	        	 company.setCompany_tel(rs.getString(5));
	        	 company.setCompany_mgr_tel(rs.getString(6));
	        	 company.setCompany_account(rs.getString(7));

	            list.add(company);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(rs, pstmt, conn);
	      }
	      return list;
	   }
	
	
	 public Company update(Company company) {
		 Company companyvo = null;
	      try {
	         conn = ConnectionManager.getConnnect();
	         String sql = "UPDATE COMPANY SET COMPANY_NAME=?, COMPANY_ADDR=?, COMPANY_MGR=?, COMPANY_TEL=?, "
	         			+ "COMPANY_TEL=?, COMPANY_MGR_TEL=?, COMPANY_ACCOUNT=?"
	         			+ " WHERE COMPANY_CODE = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, companyvo.getCompany_name());
	         pstmt.setString(2, companyvo.getCompany_addr());
	         pstmt.setString(3, companyvo.getCompany_mgr());
	         pstmt.setString(4, companyvo.getCompany_tel());
	         pstmt.setString(5, companyvo.getCompany_mgr_tel());
	         pstmt.setString(6, companyvo.getCompany_account());
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnectionManager.close(null, pstmt, conn);
	      }
	      return companyvo;
	   }
}
