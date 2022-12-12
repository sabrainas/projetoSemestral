<%@page language="java" import="java.sql.*" %>

<%
    //armazenar as informações digitadas pelo usuário
    String  vnomeCliente=request.getParameter("firstname");
    String  vsobrenomeCliente=request.getParameter("lastname");
    String  vemail=request.getParameter("email");
    String  vsenhaCliente=request.getParameter("password");
    int     vtelefone=Integer.parseInt(request.getParameter("number"));

    // variaveis para o banco de dados
    String banco    = "cadastro";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root" ;
    String senha    = "" ;
    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver );

    //cria a variavel para conectar com o banco
    Connection conexao ;
    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    String sql="INSERT INTO cadastrousuario (nomeCliente,sobrenomeCliente,email,senhaCliente,vtelefone) values(?,?,?,?,?)";

    PreparedStatement stm=conexao.prepareStatement(sql);
    stm.setString(1, vnomeCliente);
    stm.setString(2, vsobrenomeCliente);
    stm.setString(3, vemail);
    stm.setString(4, vsenhaCliente);
    stm.setInt(5, vtelefone);

    stm.execute();
    stm.close() ;

    out.print("Cadastro efetuado com sucesso!");
    out.print("<br><br>");
    out.print("<a href='index.html'>Pagina inicial</a>");
%>
