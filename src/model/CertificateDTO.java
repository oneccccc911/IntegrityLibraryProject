package model;

public class CertificateDTO {
   private String univ_num;
   private String univ_name;
   private String grade;
   
   public CertificateDTO() {
   }
   
   public CertificateDTO(String univ_num, String univ_name, String grade) {
      super();
      this.univ_num = univ_num;
      this.univ_name = univ_name;
      this.grade = grade;
   }
   public String getUniv_num() {
      return univ_num;
   }
   public void setUniv_num(String univ_num) {
      this.univ_num = univ_num;
   }
   public String getUniv_name() {
      return univ_name;
   }
   public void setUniv_name(String univ_name) {
      this.univ_name = univ_name;
   }
   public String getGrade() {
      return grade;
   }
   public void setGrade(String grade) {
      this.grade = grade;
   }
   
   
   
}