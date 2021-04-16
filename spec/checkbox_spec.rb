describe 'Selecionando usuarios', :checkbox do
    before(:each)do
    visit '/'
        fill_in 'LogOnModel_UserName', with: login
        fill_in 'LogOnModel_Password', with: senha
        click_button 'btnFormLogin'
    end

    it 'marcando o mat_santos' do
        visit '/Dimep/Usuarios'
        find('label[for="2"]', :visible=>false).set(true)
        email = find('table[id="Grid2"]')
        expect(email).to have_content 'mat_santos21@hotmail.com'
    end

    it 'marcando o junior.cesar' do
        visit '/Dimep/Usuarios'
        find('label[for="5"]', :visible=>false).set(true)
        email = find('table[id="Grid2"]')
        expect(email).to have_content 'junior.cesar@swlmaq.com.br'
    end

    it 'marcando o gaucho' do
        visit '/Dimep/Usuarios'
        find('label[for="6"]', :visible=>false).set(true)
        email = find('table[id="Grid2"]')
        expect(email).to have_content 'gaucho@dimep.com.br'
    end

    after(:each) do
        sleep 3
    end
end