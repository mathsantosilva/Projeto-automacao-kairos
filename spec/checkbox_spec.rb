describe 'Selecionando usuarios', :checkbox do
    before(:each)do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        visit '/Dimep/Usuarios'
    end

    it 'marcando o mat_santos', :usuario1 do
        find('label[for="2"]', :visible=>false).set(true)
        email = find('table[id="Grid2"]')
        expect(email).to have_content 'mat_santos21@hotmail.com'
        find('input[id="AlterarGrupo"]').click
        select('TI', from: 'select-grupo')
        find('span[id="SaveVincularGrupo"]').click

    end

    it 'marcando o junior.cesar', :usuario2 do
        find('label[for="5"]', :visible=>false).set(true)
        email = find('table[id="Grid2"]')
        expect(email).to have_content 'junior.cesar@swlmaq.com.br'
        find('input[id="AlterarGrupo"]').click
        select('Funcionarios', from: 'select-grupo')
        find('span[id="SaveVincularGrupo"]').click

    end

    it 'marcando o gaucho', :usuario3 do
        find('label[for="6"]', :visible=>false).set(true)
        email = find('table[id="Grid2"]')
        expect(email).to have_content 'gaucho@dimep.com.br'
        find('input[id="AlterarGrupo"]').click
        select('Gestores', from: 'select-grupo')
        find('span[id="SaveVincularGrupo"]').click

    end

    after(:each) do
        mensagem = find('div[class="validation-summary-ok"]')
        expect(mensagem).to have_content 'Vinculação de grupo alterada com sucesso.'
        sleep 3
    end
end