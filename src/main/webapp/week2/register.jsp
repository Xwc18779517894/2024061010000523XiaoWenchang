<%--
  Created by IntelliJ IDEA.
  User: xwc18
  Date: 2026/3/10
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New User Registration</title>
    <style>
        body {
            font-family: "Microsoft Yahei", Arial;
            background: #f8f8f8;
            margin: 0;
            padding: 30px;
        }
        .reg-box {
            width: 400px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border: 1px solid #eee;
            border-radius: 6px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-top: 0;
        }
        .item {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .sex {
            margin: 5px 0;
        }
        .sex input {
            margin-right: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #218838;
        }
        .tip {
            color: red;
            font-size: 12px;
            margin-top: 3px;
            display: none;
        }
    </style>
</head>
<body>
<div class="reg-box">
    <h2>New User Registration</h2>
    <form id="regForm" method="post" action="#" onsubmit="return checkForm()">
        <div class="item">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="请输入用户名">
            <div class="tip" id="userTip">用户名不能为空！</div>
        </div>

        <div class="item">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="密码至少8位">
            <div class="tip" id="pwdTip">密码不能为空且至少8位！</div>
        </div>

        <div class="item">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="请输入邮箱">
            <div class="tip" id="emailTip">邮箱格式不正确！</div>
        </div>

        <div class="item sex">
            <label>Gender</label>
            <input type="radio" name="gender" value="male" checked> Male
            <input type="radio" name="gender" value="female"> Female
        </div>

        <div class="item">
            <label for="birthdate">Date of birth (yyyy-mm-dd)</label>
            <input type="text" id="birthdate" name="birthdate" placeholder="例如：1999-01-01">
            <div class="tip" id="dateTip">日期格式错误！请按yyyy-mm-dd填写</div>
        </div>

        <input type="submit" value="Register">
    </form>
</div>
<script>
    function checkForm() {
        var flag = true;
        var username = document.getElementById("username").value.trim();
        var password = document.getElementById("password").value.trim();
        var email = document.getElementById("email").value.trim();
        var birthdate = document.getElementById("birthdate").value.trim();

        document.querySelectorAll(".tip").forEach(function(el) {
            el.style.display = "none";
        });

        if (username == "") {
            document.getElementById("userTip").style.display = "block";
            flag = false;
        }

        if (password == "" || password.length < 8) {
            document.getElementById("pwdTip").style.display = "block";
            flag = false;
        }

        var emailReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
        if (email == "" || !emailReg.test(email)) {
            document.getElementById("emailTip").style.display = "block";
            flag = false;
        }

        var dateReg = /^\d{4}-\d{2}-\d{2}$/;
        if (birthdate == "" || !dateReg.test(birthdate)) {
            document.getElementById("dateTip").style.display = "block";
            flag = false;
        }

        return flag;
    }
</script>
</body>
</html>