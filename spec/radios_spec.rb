describe 'Botões de radio', :radio do
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        sleep 10
        visit '/Dimep/ConfiguracaoRelogio/Create'
    end

    it 'Cadastro relogio MiniPrint', :cadastro_miniprint do
        tecla = %i[enter]
        find('label[for="radioModelo11"]').click
        find('input[id="Codigo"]').set '111'
        find('input[id="Descricao"]').set 'MiniPrint'
        find('input[id="DadosEmpregador_CampoLinha1"]').set 'Razão Social Teste'
        find('input[id="DadosEmpregador_CampoLinha1Endereco"]').set 'Endereço de teste'
        drop = find('input[type="submit"][value="Salvar"]', match: :first)
        drop.click
        # salvar a configuração apertando enter 
        # tecla.each do |t|
        # find('input[id="DadosEmpregador_CampoLinha1"]').send_keys t
    end
    
    it 'Cadastro relogio Smart' do
        tecla = %i[enter]
        find('label[for="radioModelo22"]').click
        find('input[id="Codigo"]').set '112'
        find('input[id="Descricao"]').set 'Smart'
        find('input[id="DadosEmpregador_CampoLinha1"]').set 'Razão Social Teste'
        find('input[id="DadosEmpregador_CampoLinha1Endereco"]').set 'Endereço de teste'
        tecla.each do |t|
        find('input[id="DadosEmpregador_CampoLinha1"]').send_keys t
        end
    end

    after(:each) do
        sleep 3
    end
end