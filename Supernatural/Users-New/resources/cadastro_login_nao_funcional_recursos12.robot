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
    Element Should Be Visible    ${EMAIL}
    Input Text       ${EMAIL}       sysadmin@qacoders.com
    
    Element Should Be Visible    ${SENHA}
    Input Text       ${SENHA}        1234@Test

    Element Should Be Visible    ${ENTRAR}
    Click Button    ${ENTRAR}


Clicar no menu Cadastros
       Wait Until Element Is Visible    ${SELETOR_MENUS_CADASTROS} 
       Click Element                    ${SELETOR_MENUS_CADASTROS} 
       sleep  3s        

Clicar no menu Usuários
      Element Should Be Visible      ${MENU_USUARIOS}    
      Click Element                  ${MENU_USUARIOS}
      sleep  2s


Clicar no botão NOVO CADASTRO
     Wait Until Element Is Visible  ${BOTAO_NOVO_CADASTRO}  
     Click Button    ${BOTAO_NOVO_CADASTRO}
     sleep  2s
     
    
Preencher os dados no formulário inserindo 7 caracteres válidos no campo senha
    Wait Until Element Is Visible    ${NOME_COMPLETO}     
    ${PrimeiroNome}    FakerLibrary.First Name
    ${SegundoNome}     FakerLibrary.Last Name
    Input Text   ${NOME_COMPLETO}    ${PrimeiroNome} ${SegundoNome} 


    ${NovoCadastroEmail}  FakerLibrary.Email
    Input Text    ${EMAIL_NOVO_CADASTRO}     ${NovoCadastroEmail}


    Input Text    ${PERFIL_ACESSO}       ADMIN
    

    ${GeraCPF}     Random Number    digits=11
    Input Text     ${CPF}       ${GeraCPF}  
   
    Input Text    ${SENHA_NOVO_CADASTRO}    Aaman1@
    
    Input Text    ${CONFIRME_SENHA}       Aaman1@
    


Verificar se o botão está habilitado
    Element Should Be Enabled      ${SALVAR} 
Clicar no botão Salvar Novo
    Wait Until Element Is Visible    ${SALVAR} 
    Element Should Be Enabled      ${SALVAR} 
    Click Element    ${SALVAR}
    sleep  2s
    

Verificar se será apresentada a mensagem referente a inconsistência
    Page Should Contain    Senha precisa ter: uma letra maiúscula, uma letra minúscula, um número, um caractere especial(@#$%) e tamanho entre 8-12.
    Capture Element Screenshot   //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'Senha precisa ter: uma letra maiúscula, uma letra minúscula, um número, um caractere especial(@#$%) e tamanho entre 8-12.')]

   

    



    







