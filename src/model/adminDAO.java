package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class adminDAO {

   Connection conn;
   PreparedStatement st;
   ResultSet rs;
   int result;
   //전체검색
   String selectAll_sql = "select * from (Book inner join Library using(lib_ID)) left outer join Copy using(copy_ID) "
         + "order by book_ID, book_author";

   /*public List<adminDTO> selectAll() {
      List<adminDTO> booklist = new ArrayList<adminDTO>();
      conn = DBUtil.getConnect();
      try {
         st = conn.prepareStatement(selectAll_sql);
         rs = st.executeQuery();
         while (rs.next()) {
            adminDTO bk = makeBook(rs);
            booklist.add(bk);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         DBUtil.dbClose(conn, st, rs);
      }
      return booklist;
   }*/
   
   //관리자 검색
   String selectByTitle_sql = "select * from (Book inner join Library using (lib_ID)) left outer join Copy using (book_ID) "
         + "where lower(book_name) like ? and rownum<=15 order by book_ID, copy_ID";

   public List<adminDTO> selectByTitle(String book_name) {
      List<adminDTO> booklist = new ArrayList<adminDTO>();
      conn = DBUtil.getConnect();
      try {
         st = conn.prepareStatement(selectByTitle_sql);
         if(book_name == null){
            book_name = "%";
         }else{
            book_name = "%"+book_name.toLowerCase()+"%";
         }
         st.setString(1,book_name );
         rs = st.executeQuery();
         while (rs.next()) {
            adminDTO bk = makeBook(rs);
            booklist.add(bk);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         DBUtil.dbClose(conn, st, rs);
      }
      return booklist;
   }
   
   // update
   String book_update = "update book set book_ID = ?, book_name = ?, book_author = ?, book_cate = ?, book_year = ?, "
         + "book_page = ?, book_pub = ? where book_ID = ? ";
   public int bookUpdate(adminDTO book) {
      int result = 0;
      conn = DBUtil.getConnect();
      try {
         st = conn.prepareStatement(book_update);
         st.setString(1, book.getBook_ID());
         st.setString(2, book.getBook_name());
         st.setString(3, book.getBook_author());
         st.setString(4, book.getBook_cate());
         st.setDate(5, book.getBook_year());
         st.setInt(6, book.getBook_page());
         st.setString(7, book.getBook_pub());
         st.setString(8, book.getBook_ID());

         result = st.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBUtil.dbClose(conn, st, rs);
      }
      return result;
   }

   // book insert
   String book_insert = "insert into book values(?,?,?,?,?,?,?,?)";
   public int bookInsert(BookCopyDTO book) {
      int result = 0;
      conn = DBUtil.getConnect();
      try {
         st = conn.prepareStatement(book_insert);
         st.setString(1, book.getBook_ID());
         st.setString(2, book.getBook_name());
         st.setString(3, book.getBook_author());
         st.setString(4, book.getBook_cate());
         st.setDate(5, book.getBook_year());
         st.setInt(6, book.getBook_page());
         st.setString(7, book.getBook_pub());
         st.setString(8, book.getLib_name());
         result = st.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBUtil.dbClose(conn, st, rs);
      }
      
      return result;
   }
   // copy insert
      String copy_insert = "insert into copy values(?,?,?)";
      public int copyInsert(BookCopyDTO book) {
         int result = 0;
         conn = DBUtil.getConnect();
         try {
            
            st = conn.prepareStatement(copy_insert);
            st.setString(1, book.getBook_ID());
            st.setString(2, book.getCopy_ID());
            st.setDate(3, book.getBuy_date());

            result = st.executeUpdate();
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBUtil.dbClose(conn, st, rs);
         }
         return result;
      }

   // delete
   String book_delete = "delete from Copy where book_ID = ? and copy_ID = ? ";

   public int bookDelete(String book_ID, String copy_ID) {
      int result = 0;
      conn = DBUtil.getConnect();
      try {
         st = conn.prepareStatement(book_delete);
         st.setString(1, book_ID);
         st.setString(2, copy_ID);
         result = st.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBUtil.dbClose(conn, st, rs);
      }
      return result;
   }

   // detail
   String bookAll_sql = "select * from (Book inner join Library using (lib_ID)) left outer join Copy using (book_ID) "
         + "where book_ID like ? order by copy_ID";

   public List<adminDTO> selectAllBook(String book_ID) {
      List<adminDTO> booklist = new ArrayList<adminDTO>();
      conn = DBUtil.getConnect();
      try {
         st = conn.prepareStatement(bookAll_sql);
         st.setString(1, book_ID);
         rs = st.executeQuery();
         while (rs.next()) {
            adminDTO book = makeBook(rs);
            booklist.add(book);
         }

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         DBUtil.dbClose(conn, st, rs);
      }
      return booklist;
   }
   
   String bookExact_sql = "select * from (Book inner join Library using (lib_ID)) left outer join Copy using (book_ID) "
         + "where book_ID like ? and copy_ID like ?";

   public adminDTO selectExactBook(String book_ID, String copy_ID) {
      adminDTO booklist = null;
      conn = DBUtil.getConnect();
      try {
         st = conn.prepareStatement(bookExact_sql);
         st.setString(1, book_ID);
         st.setString(2, copy_ID);
         rs = st.executeQuery();
         while (rs.next()) {
            booklist = makeBook(rs);
         }

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         DBUtil.dbClose(conn, st, rs);
      }
      return booklist;
   }

   private adminDTO makeBook(ResultSet rs) throws SQLException {
      String book_ID = rs.getString("book_ID");
      String book_name = rs.getString("book_name");
      String book_author = rs.getString("book_author");
      String book_cate = rs.getString("book_cate");
      Date book_year = rs.getDate("book_year");
      int book_page = rs.getInt("book_page");
      String book_pub = rs.getString("book_pub");
      String lib_ID = rs.getString("lib_ID");
      String lib_name = rs.getString("lib_name");
      String copy_ID = rs.getString("copy_ID");
      adminDTO book = new adminDTO(book_ID, book_name, book_author, book_cate, book_year, book_page, book_pub, lib_ID, lib_name, copy_ID);
      return book;
   }

}