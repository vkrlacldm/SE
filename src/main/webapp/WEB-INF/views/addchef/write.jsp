<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Spartan&display=swap");
* {
  margin: 0;
  padding: 0;
}

body {
  width: 100vw;
  height: 100vh;
  display: grid;
  align-items: center;
  justify-items: center;
  font-size: 12pt;
  font-family: "Spartan";
  color: #2A293E;
}

.contact-us {
  background: #f8f4e5;
  padding: 50px 100px;
  border-top: 10px solid #f45702;
}

label, input, textarea {
  display: block;
  width: 100%;
  font-size: 12pt;
  line-height: 24pt;
  font-family: "Spartan";
}

input {
  margin-bottom: 24pt;
}

h3 {
  font-weight: normal;
  font-size: 10pt;
  line-height: 24pt;
  font-style: italic;
  margin: 0 0 0.5em 0;
}

span {
  font-size: 8pt;
}

em {
  color: #f45702;
  font-weight: bold;
}

input, textarea {
  border: none;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 2px;
  background: #f8f4e5;
  padding-left: 5px;
  outline: none;
}

input:focus, textarea:focus {
  border: 1px solid #6bd4b1;
}

textarea {
  resize: none;
}

button {
  display: block;
  float: right;
  line-height: 24pt;
  padding: 0 20px;
  border: none;
  background: #f45702;
  color: white;
  letter-spacing: 2px;
  transition: 0.2s all ease-in-out;
  border-bottom: 2px solid transparent;
  outline: none;
}
button:hover {
  background: inherit;
  color: #f45702;
  border-bottom: 2px solid #f45702;
}

::selection {
  background: #ffc7b8;
}

input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
textarea:-webkit-autofill,
textarea:-webkit-autofill:hover,
textarea:-webkit-autofill:focus {
  border: 1px solid #6bd4b1;
  -webkit-text-fill-color: #2A293E;
  -webkit-box-shadow: 0 0 0px 1000px #f8f4e5 inset;
  transition: background-color 5000s ease-in-out 0s;
}
</style>

<div class="contact-us">
  <!-- <form action="/admin/chefManage/addChef"> -->
  <form action="addchef">
    <label for="userId">유저아이디 <em>&#x2a;</em></label>
    <input id="userId" name="userId" required  type="text" value="${id}" readonly />
    <label for="nickName">닉네임 <em>&#x2a;</em></label>
    <input id="nickName" name="nickName" required  value="${nickname}" readonly /><!-- type="email" -->
    <label for="userName">이름</label> 
    <input id="userName" name="userName"  type="text" value="${username}" readonly/><!-- pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" -->
    <!--  
    <label for="nickName">NICKNAME</label>
    <input id="nickName" name="nickName" type="text"  value="${id }" readonly  />
    -->
    
    <label for="intro">자기소개 <em>&#x2a;</em></label>
    <textarea id="intro" name="intro" required rows="4"></textarea>
  
    <h3>
      Please provide all the information about your issue you can.
    </h3>
    <input type="submit" value="SUBMIT"/>
  </form>
</div>