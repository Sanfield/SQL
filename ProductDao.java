package com.store.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.store.bean.ProType;
import com.store.bean.ProductInfo;
import com.store.comm.Constants;
import com.store.comm.DBUtil;
import com.sun.xml.internal.ws.org.objectweb.asm.Type;

public class ProductDao {

	
	public List<ProductInfo> getAllProduct() throws SQLException{
		List<ProductInfo> products = new ArrayList<ProductInfo>();
		Connection conn = DBUtil.getConnect();
		ResultSet rs= null;
		Statement st=null;
		String sql="select p.product_id,p.NAME prd_name,product_type_id,p.description,p.price,t.NAME type_name "+
		" from products p left join product_types t using(product_type_id)"+
				" where p.del_flag is null or p.del_flag=0";
		try {
			st= conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
				products.add(concertInfo(rs,true));
			}
		} 
		finally{
			DBUtil.close(rs, st);
		}
		
		return products;
	}

	private ProductInfo concertInfo(ResultSet rs,boolean detail) throws SQLException {
		ProductInfo info=new ProductInfo();
		info.setProduct_id(rs.getInt("product_id"));
		info.setName(rs.getString("prd_name"));
		if(rs.getObject("product_type_id")!=null){
			info.setProduct_type_id(rs.getInt("product_type_id"));
			if(detail){
				ProType protype =new ProType();
				protype.setProduct_type_id(rs.getInt("product_type_id"));
				protype.setName(rs.getString("type_name"));
				info.setProtype(protype);
			}
		}
		info.setPrice(rs.getFloat("price"));
		info.setDescription(rs.getString("description"));
		return info;
	}

	public ProductInfo getProductInfoById(int id) throws SQLException {
		ProductInfo info=new ProductInfo();
		Connection conn = DBUtil.getConnect();
		PreparedStatement st=null;
		ResultSet rs= null;
		String sql="select p.product_id,p.NAME prd_name,p.product_type_id, p.description,p.price "
				+ " from products p " + " where product_id=?";
		try {
			 st= conn.prepareStatement(sql);
			 
			st.setInt(1, id);
			rs=st.executeQuery();
			if(rs.next()){
				info=this.concertInfo(rs, false);
			}
			
		} finally{
			DBUtil.close(rs, st);
		}
		return info;
	}

	public int modifyInfo(ProductInfo info) throws SQLException {
		Connection conn = DBUtil.getConnect();
		PreparedStatement st= null;
		int count =0;
		try{
			st=conn.prepareStatement(
					"update products set name=?,product_type_id=?,description=?,price=? where product_id=?");
			st.setString(1, info.getName());
			if(info.getProduct_type_id()!=null){
				st.setInt(2, info.getProduct_type_id());
			}else{
				st.setNull(2, Types.INTEGER);
			}
			st.setString(3, info.getDescription());
			if(info.getPrice()!=null){
				st.setFloat(4, info.getPrice());
			}else{
				st.setNull(4, Types.FLOAT);
			}
			st.setInt(5, info.getProduct_id());
			
			count=st.executeUpdate();
					
		}finally{
			DBUtil.close(null, st);
		}
		return count;
	}
	public int deleteInfo(Integer prdID) throws SQLException{
		Connection conn = DBUtil.getConnect();
		PreparedStatement st= null;
		int count=0;
		try{
			st=conn.prepareStatement("update products set del_flag=1 where product_id=?");
			st.setInt(1, prdID);
			count=st.executeUpdate();
		}finally{
			DBUtil.close(null, st);
		}
		return count;
	}
	//返回商品总量
	public int getProductCount() throws SQLException {
		Connection conn=DBUtil.getConnect();
		PreparedStatement st=null;
		ResultSet rs= null;
		int count=0;
		try{
			st=conn.prepareStatement("select count(*) from products where del_flag is null or del_flag=0 ");
			rs=st.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		}finally{
			DBUtil.close(rs, st);
		}
		System.out.println("总量:"+count);
		return count;
		
	}
	//获取指定页的
	public List<ProductInfo> getProductsByPage(int page) throws SQLException{
		Connection conn=DBUtil.getConnect();
		PreparedStatement st=null;
		ResultSet rs= null;
		List<ProductInfo> list= new ArrayList<ProductInfo>();
		try{
			st=conn.prepareStatement("SELECT temp.* " + " FROM ( "
					+ " SELECT p.product_id,product_type_id,p.NAME prd_name,p.description,p.price,t.NAME type_name,ROWNUM rn "
					+ " FROM products p LEFT OUTER JOIN product_types t USING(product_type_id) "
					+ " WHERE (p.del_flag IS NULL OR p.del_flag=0) and ROWNUM<=?) temp " + " WHERE temp.rn>?");
			st.setInt(1, page*Constants.PAGE_SIZE);
			st.setInt(2, (page-1)*Constants.PAGE_SIZE);
			rs=st.executeQuery();
			while(rs.next()){
				list.add(this.concertInfo(rs, true));
			}
		}finally{
			DBUtil.close(rs, st);
		}
		return list;
	}
/**
 * 保存存储过程
 * @param info
 * @throws SQLException
 */
	public void saveInfo(ProductInfo info) throws SQLException {
		Connection conn= DBUtil.getConnect();
		CallableStatement stmt=null;
		try{
			stmt= conn.prepareCall("call pr_save_prd(?,?,?,?,?)");
			stmt.registerOutParameter(1, Types.INTEGER);
			stmt.setString(2, info.getName());
			if(info.getProduct_type_id()!=null&&info.getProduct_type_id()>0){
				stmt.setInt(3, info.getProduct_type_id());
				
			}else{
				stmt.setNull(3, Types.INTEGER);
			}
			stmt.setString(4, info.getDescription());
			if(info.getPrice()!=null){
				stmt.setFloat(5, info.getPrice());
			}else{
				stmt.setNull(5, Type.FLOAT);
			}
			stmt.execute();
			info.setProduct_id(stmt.getInt(1));
		}finally{
			DBUtil.close(null, stmt);
		}
	
		
	}

public List<ProductInfo> search(Map<String, Object> condiction) throws SQLException{
	List<ProductInfo> list= new ArrayList<ProductInfo>();;
	Connection conn= DBUtil.getConnect();
	Statement stmt = null;
	ResultSet rs=null;
	StringBuffer  sb= new StringBuffer();
	sb.append("SELECT p.product_id,p.NAME prd_name,product_type_id,t.NAME type_name,p.description,p.price");
	sb.append(" FROM products p LEFT OUTER JOIN product_types t USING(product_type_id)");
	sb.append(" WHERE (p.del_flag IS NULL OR p.del_flag=0)");
	if (condiction.containsKey("prdName")) {
		sb.append(" and p.NAME LIKE '%").append(condiction.get("prdName")).append("%' ");
	}
	if (condiction.containsKey("typeId")) {
		sb.append(" and product_type_id=").append(condiction.get("typeId"));
	}
	if (condiction.containsKey("lowPrice")) {
		sb.append(" and p.price>=").append(condiction.get("lowPrice"));
	}
	if (condiction.containsKey("highPrice")) {
		sb.append(" and p.price<=").append(condiction.get("upPrice"));
	}
	
	try{
		stmt= conn.createStatement();
		rs=stmt.executeQuery(sb.toString());
		while(rs.next()){
			list.add(this.concertInfo(rs, true));
		}
	}finally{
		DBUtil.close(rs, stmt);
	}
	return list;
	
}

public int batchDelete(int[] prdArray) throws SQLException {
	Connection conn= DBUtil.getConnect();
	PreparedStatement stmt = null;
	ResultSet rs=null;	
	int count=0;
	try{
	String sql="UPDATE products SET del_flag=1 WHERE product_id=?";
	stmt=conn.prepareStatement(sql);
	for(int id:prdArray){	
	stmt.setInt(1, id);
	stmt.addBatch(); //追加批
	}
	int[] array=stmt.executeBatch(); //批量执行
	for(int value:array){
		if(value== -2){
			count++;
		}
	}
	}finally{
		DBUtil.close(rs, stmt);
	}
	return count;
}
	
}
