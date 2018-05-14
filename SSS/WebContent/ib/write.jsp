<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page errorPage = "error_view.jsp" %>

<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.io.File" %>
<%@ page import = "org.apache.commons.fileupload.FileItem" %>

<%@ page import = "ib.ImageUtil" %>
<%@ page import = "ib.FileUploadRequestWrapper" %>

<%@ page import = "ib.Theme" %>
<%@ page import = "ib.ThemeManagerDao" %>
<%@ page import = "ib.ThemeManagerException" %>

<%
   FileUploadRequestWrapper requestWrap = new FileUploadRequestWrapper(
         request, -1, -1, "C:\\Users\\MOZZI\\eclipse-workspace\\SSS\\WebContent\\temp");
   HttpServletRequest tempRequest = request;
   request = requestWrap;
%>
<jsp:useBean id="theme" class="ib.Theme">
   <jsp:setProperty name="theme" property="*" />
</jsp:useBean>
<%
   FileItem imageFileItem = requestWrap.getFileItem("imageFile");
   String image="";
   if(imageFileItem.getSize() > 0){
      image = Long.toString(System.currentTimeMillis());
      
      // �̹����� ������ ��ο� ����
      File imageFile = new File("C:\\Users\\MOZZI\\eclipse-workspace\\SSS\\WebContent\\image", image);
      
      // ���� �̸��� �����̸� ó��
      if(imageFile.exists()){
         for(int i=0; true; i++){
            imageFile = new File("C:\\Users\\MOZZI\\eclipse-workspace\\SSS\\WebContent\\image", image+"_"+i);
            if(!imageFile.exists()){
               image = image + "_" + i;
               break;
            }
         }
      }
      imageFileItem.write(imageFile);
      
      //����� �̹��� ����
      File destFile = new File("C:\\Users\\MOZZI\\eclipse-workspace\\SSS\\WebContent\\image", image+".small.jpg");
      ImageUtil.resize(imageFile, destFile, 50, ImageUtil.RATIO);
   }
   
   theme.setRegister(new Timestamp(System.currentTimeMillis()));
   theme.setImage(image);
   
   ThemeManagerDao manager = ThemeManagerDao.getInstance();
   manager.insert(theme);
%>
<script>
alert("���ο� �̹����� ����߽��ϴ�.");
location.href="list.jsp";
</script>