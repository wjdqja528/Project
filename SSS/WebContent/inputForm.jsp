<%@ page contentType="text/html; charset=EUC-KR"%>    
<%@ include file="/jj/color.jsp" %>
<html>
<head>
<title>ȸ������</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">

	function checkIt(){
		var userinput = eval("document.userinput");
		if(!userinput.id.value){
				alert("ID�� �Է��ϼ���");
				return false;
		}
		
		if(!uerinput.passwd.value){
			alert("��й�ȣ�� �Է��ϼ���");
			return false;
		}
		if(userinput.passwd.value != userinput.passwd2.value)
			{
				alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
				return false;
			}
		if(!userinput.username.value){
				alert("����� �̸��� �Է��ϼ���");
				return false;
		}
		if(!useriput.jumin1.value || !userinput.jumin2.value)
		{
				alret("�ֹε�Ϲ�ȣ�� �Է��ϼ���");
				return false;
		}
	}
	
	function openConfirmid(userinput){
			if(userinput.id.value == ""){
				alert("���̵� �Է��ϼ���");
				return;
			}
			url = "confirmId.jsp?id=" + userinput.id.value;
			
			open(url, "confirm",
			"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}
	
	function zipCheck(){
url="ZipCheck.jsp?check=y";
window.open(url,"post","toolbar=no , width=500,height=300, directories=no, status=yes, scrollbars=yes, menubar=no");
	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����
                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }
                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                   // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                document.getElementById('sample_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('sample_address').value = fullAddr;
                document.getElementById('sample_address2').focus();
            }
        }).open();
    }
</script>
	<body bgcolor="<%=bodyback_c%>">

	<form method="post" action="inputPro.jsp" name="userinput" onSubmit="return checkIt()">
	  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
	    <tr>
	    <td colspan="2" height="39" align="center" bgcolor="<%=value_c%>" >
	       <font size="+1" ><b>ȸ������</b></font></td>
	    </tr>
	    <tr>
	      <td width="200" bgcolor="<%=value_c%>"><b>���̵� �Է�</b></td>
	      <td width="400" bgcolor="<%=value_c%>">&nbsp; </td>
	    </tr> 

	    <tr>
	      <td width="200"> ����� ID</td>
	      <td width="400">
	        <input type="text" name="id" size="10" maxlength="12">
	        <input type="button" name="confirm_id" value="ID�ߺ�Ȯ��" OnClick="openConfirmid(this.form)">
	      </td>
	    </tr>
	    <tr>
	      <td width="200"> ��й�ȣ</td>
	      <td width="400" >
	        <input type="password" name="passwd" size="15" maxlength="12">
	      </td>
	    <tr> 
	      <td width="200">��й�ȣ Ȯ��</td>
	      <td width="400">
	        <input type="password" name="passwd2" size="15" maxlength="12">
	      </td>
	    </tr>
	   
	    <tr>
	      <td width="200" bgcolor="<%=value_c%>"><b>�������� �Է�</b></td>
	      <td width="400" bgcolor="<%=value_c%>"> </td>
	    <tr> 
	    <tr>
	      <td width="200">����� �̸�</td>
	      <td width="400">
	        <input type="text" name="name" size="15" maxlength="10">
	      </td>
	    </tr>
	    <tr>
	      <td width="200">�ֹε�Ϲ�ȣ</td>
	      <td width="400">
	        <input type="text" name="jumin1" size="7" maxlength="6">
	        -<input type="text" name="jumin2" size="7" maxlength="7">
	      </td>
	    </tr>
	    <tr>
	      <td width="200">E-Mail</td>
	      <td width="400">
	        <input type="text" name="email" size="40" maxlength="30">
	      </td>
	    </tr>
	    <tr>
	      <td width="200"> Blog</td>
	      <td width="400">
	        <input type="text" name="blog" size="60" maxlength="50">
	      </td>
	    </tr>
		  
	    <tr> 
	       <td width="200">�����ȣ</td>
	       <td> <input type="text" id="sample_postcode" placeholder="�����ȣ" name="zipcode" size="7">
	            <input type="button" value="�����ȣ ã��&nbsp;" onClick="DaumPostcode()">
	               �����ȣ�� �˻� �ϼ���.</td>
	    </tr>
	    
	    <tr> 
	       <td>�ּ�</td>
	       <td><input type="text" id="sample_address" placeholder="���θ��ּ�" name="address" size="70"></td>
	    </tr>
	    
	    <tr> 
	       <td>&nbsp;</td>
	       <td><input type="text" id="sample_address2" placeholder="���ּ�" name="address2" size="70"></td>
	    </tr>
		  
	    <tr>
	      <td colspan="2" align="center" bgcolor="<%=value_c%>">
	          <input type="submit" name="confirm" value="��   ��" >
	          <input type="reset" name="reset" value="�ٽ��Է�">
	          <input type="button" value="���Ծ���" onclick="javascript:window.location='main.jsp'">
	      </td>
	    </tr>
	  </table>
	</form>
	</body>
	</html>
<%-- <body bgcolor="<%=bodyback_c%>">

<form method="post" action="inputPro.jsp" name="userinput" onSubmit="return checkIt()">
	<table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
		<tr>
		<td colspan="2" height="39" align="center" bgcolor="<%=value_c%>">
			<font size="+1" ><b>ȸ������</b></font></td>
		</tr>
		<tr>
			<td width="200" bgcolor="<%=value_c%>"><b>���̵� �Է�</b></td>
			<td width="400" bgcolor="<%=value_c%>"></td>
		</tr>
		
		<tr>
			<td width="200"> ����� ID </td>
			<td width="400">
				<input type="text" name="id" size="10" maxlength="12">
				<input type="button" name="confirm_id" value="ID�ߺ�Ȯ��" OnClick="openConfirmid(this.form)">
			</td>
		</tr>
		<tr>
			<td width="200"> ��й�ȣ</td>
			<td width="400">
				<input type="password" name="passwd" size="15" maxlength="12">
			</td>
		<tr>
			<td width="200">��й�ȣ Ȯ��</td>
			<td width="400">
				<input type="password" name="passwd2" size="15" maxlength="12">
			</td>
		</tr>
		
		<tr>
			<td width="200" bgcolor="<%=value_c%>"><b>�������� �Է�</b></td>
			<td width="400" bgcolor="<%=value_c%>"></td>
		</tr>
		<tr>
			<td width="200">����� �̸�</td>
			<td width="400">
				<input type="text" name="name" size="15" maxlength="10">
			</td>
		</tr>
		<tr>
			<td width="200">�ֹε�Ϲ�ȣ</td>
			<td width="400">
				<input type="text" name="jumin1" size="7" maxlength="6">
				<input type="text" name="jumin2" size="7" maxlength="7">
			</td>
		</tr>
		<tr>
			<td width="200">E-Mail</td>
			<td width="400">
				<input type="text" name="email" size="40" maxlength="30">
			</td>
		</tr>
		<tr>
			<td width="200">Blog</td>
			<td width="400">
				<input type="text" name="blog" size="60" maxlength="50">
			</td>
		</tr>
		<tr>
			<td width="200">�����ȣ</td>
			<td><input type="text" name="zipcode" size="7">
				<input type="button" value="�����ȣã��" onClick="zipCheck()">
				�����ȣ�� �˻� �ϼ���.</td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td><input type="text" name="address" size="70">
			�ּҸ� ���� �ּ���.</td>
		</tr>
		<tr>
			<td colspan="2" align="center" bgcolor="<%=value_c%>">
				<input type="submit" name="confirm" value="��	��">
				<input type="reset" name="rest" value="�ٽ��Է�">
				<input type="button" value="���Ծ���" onclick="javascript:window.location='main.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html> --%>