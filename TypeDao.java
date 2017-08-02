package com.store.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.store.bean.ProType;
import com.store.comm.DBUtil;

public class TypeDao {
	
	public List<ProType> getAllTypes(){
		List<ProType> pts= new ArrayList<ProType>();
		Connection conn =DBUtil.getConnect();
		Statement st=null;
		ResultSet rs=null;
		String sql="select * from product_types";
		try {
			 st= conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
				pts.add(gettype(rs));
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return pts;
	}
	private static ProType gettype(ResultSet rs) throws SQLException{
		ProType type= new ProType();
		type.setProduct_type_id(rs.getInt("product_type_id"));
		type.setName(rs.getString("name"));
		return type;
	}
}
