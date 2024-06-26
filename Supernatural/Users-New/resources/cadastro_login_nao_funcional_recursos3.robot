*** Settings ***
Library   SeleniumLibrary
Library   FakerLibrary    locale=pt_BR
Library    String

    


*** Variables ***

${BROWSER}                Chrome
${URL}                    https://automacao.qacoders-academy.com.br/login   
${EMAIL}                    id=email
${SENHA}                    id=password
${ENTRAR}                   id=login
${SELETOR_MENUS_CADASTROS}  id=Cadastros
${MENU_USUARIOS}            id=Usuários
${BOTAO_NOVO_CADASTRO}      id=Novo Cadastro
${NOME_COMPLETO}           id=fullName
${EMAIL_NOVO_CADASTRO}     id=mail
${PERFIL_ACESSO}           id=accessProfile
${CPF}                    id=cpf
${SENHA_NOVO_CADASTRO}     //input[contains(@type,'password')]
${CONFIRME_SENHA}         id:confirmPassword
${SALVAR}                 id=save



*** Keywords ***
Abrir o navegador
    Open Browser      ${URL}  ${BROWSER}  
    Maximize Browser Window

Fechar o navegador
    Close Browser

Realizar login com usuário administrador
    Wait Until Element Is Visible   ${EMAIL}
    Input Text       ${EMAIL}       sysadmin@qacoders.com
    
    Wait Until Element Is Visible    ${SENHA}
    Input Text       ${SENHA}        1234@Test

    Wait Until Element Is Visible  ${ENTRAR}
    Click Button    ${ENTRAR}


Clicar no menu Cadastros
       Wait Until Element Is Visible    ${SELETOR_MENUS_CADASTROS} 
       Click Element                    ${SELETOR_MENUS_CADASTROS}
       sleep  2s
            
Clicar no menu Usuários
      Element Should Be Visible      ${MENU_USUARIOS}    
      Click Element                  ${MENU_USUARIOS}
        sleep  1s

Clicar no botão NOVO CADASTRO
     Wait Until Element Is Visible  ${BOTAO_NOVO_CADASTRO}  
     Click Button    ${BOTAO_NOVO_CADASTRO}
      sleep  2s
     
    
Preencher todos os campos do formulário e inserir no campo Nome Completo somente o primeiro nome
    Wait Until Element Is Visible    ${NOME_COMPLETO}  
    Input Text   ${NOME_COMPLETO}  Paulo  

    ${NovoCadastroEmail}  FakerLibrary.Email
    Input Text    ${EMAIL_NOVO_CADASTRO}     ${NovoCadastroEmail}
 
    Input Text    ${PERFIL_ACESSO}       ADMIN
    
    ${GeraCPF}     Random Number    digits=11
    Input Text     ${CPF}       ${GeraCPF}  
  

    ${NovaSenha}   Generate Random String  length=6
    Input Text    ${SENHA_NOVO_CADASTRO}     ${NovaSenha}@1Est
    Log    Senha Gerada: ${NovaSenha}
    

    Input Text    ${CONFIRME_SENHA}       ${NovaSenha}@1Est
 


Verificar se o botão está habilitado
    Element Should Be Enabled      ${SALVAR} 
Clicar no botão Salvar Novo
    Wait Until Element Is Visible    ${SALVAR} 
    Click Element    ${SALVAR}
    sleep  2s
    
Verificar se será apresentada a mensagem informando que é necessário inserir o sobrenome  
    Page Should Contain    Informe o nome e sobrenome com as iniciais em letra maiúscula e sem caracteres especiais.
    Capture Element Screenshot    //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'Informe o nome e sobrenome com as iniciais em letra maiúscula e sem caracteres especiais.')]
    
        
     
   

    

    







