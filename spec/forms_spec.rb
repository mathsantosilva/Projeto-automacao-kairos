describe 'Acessando o Kairos', :forms do
    it 'realizando login com sucesso' do
        visit 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
        fill_in 'LogOnModel_UserName', with: 'mat_santos21@hotmail.com'
        fill_in 'LogOnModel_Password', with: 'teste'
        click_button 'btnFormLogin'

        expect(find('div.TabMenuWrapper').visible?).to be true
        expect(find('div.TabMenuWrapper')).to have_content "Web Café - Alterar a Razão Social - Alteração de nome"
        sleep 3
        
    end
    it 'Realizando login com falha' do
        visit 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
        fill_in 'LogOnModel_UserName', with: 'mat_santos21@hotmail.com'
        fill_in 'LogOnModel_Password', with: '123'
        click_button 'btnFormLogin'

        expect(find("div[class='field-validation-error']").visible?).to be true
        expect(find("div[class='field-validation-error']")).to have_content 'Usuário e/ou senha estão incorretos.'
        sleep 3
    end

end