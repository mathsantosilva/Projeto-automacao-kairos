describe 'Acessando o Kairos', :Teste1 do
    it 'realizando login na pagina' do
        visit 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'

        fill_in 'LogOnModel_UserName', with: 'mat_santos21@hotmail.com'
        fill_in 'LogOnModel_Password', with: '1'
        click_button 'btnFormLogin'
        expect(find("div[class='TabMenuNomeEmpresa shortText']")).to have_content 'Web Café - Alterar a Razão Social - Alteração de nome'
        sleep 3
    end
end