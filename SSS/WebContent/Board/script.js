function writeSave(){
	if(document.writeform.writer.value==""){
		alert("�ۼ��ڸ� �Է��Ͻÿ�.");
		document.writeform.writer.focus();
		return false;
	}
	if(document.writeform.subject.value==""){
		alert("������ �Է��ϼ���.");
		document.writeform.subject.focus();
		return false;
	}
	if(document.writeform.content.value==""){
		alert("������ �Է��ϼ���.");
		document.writeform.content.focus();
		return false;
	}
	if(document.writeform.passwd.value==""){
		alert("��й�ȣ�� �Է��ϼ���.");
		document.writeform.passwd.focus();
		return false;
	}
}