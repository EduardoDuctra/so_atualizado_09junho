<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>

<body>
<div class="container">
    <img
            class="background-image"
            src="${pageContext.request.contextPath}/assets/Mobile login-amico.svg"
            alt="Imagem de fundo"
    />

    <div class="title_page">
        <h2>Login</h2>
    </div>

    <div class="login_form">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form_input">
                <label for="email"><b>Email</b></label>
                <input id="email" type="email" placeholder="email" name="email" />
            </div>

            <div class="form_input">
                <label for="password"><b>Senha</b></label>
                <input
                        id="password"
                        type="password"
                        placeholder="password"
                        name="password"
                />
            </div>

            <div class="button_group">
                <button type="submit" name="action" value="logar">Logar</button>
                <button type="submit" name="action" value="cadastrar">Cadastrar Usuário</button>
            </div>
        </form>
    </div>

    <c:if test="${not empty msg}">
        <h2>${msg}</h2>
    </c:if>
</div>
</body>
</html>
