describe 'upload de arquivos', :upload do

    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/imagem.jpg'
        @atestado = Dir.pwd + '/spec/fixtures/atestado.jpg'
        visit '/Dimep/Pessoas/UserProfilePessoas/2133'
    end

    it 'foto do funcionario', :foto_funcionario do
        find('input[id="editPessoa"][value="Alterar"]').click
        alterar_foto = find('span[class="buttonFile"]')
        expect(alterar_foto).to have_content 'Alterar Foto'
        attach_file('image', @imagem)
        drop = find("input[type='submit'][value='Salvar']", match: :first)
        drop.click
        resultado = find('div[class="validation-summary-ok"]')
        expect(resultado).to have_content 'Pessoa editada com sucesso'
    end

    it 'documento de atestado', :documento_atestado do
        find('div[id="UserProfilePedidosJustificativas"]').click
        find('span[id="TabPedidoHeader2"]').click

        prat = find('table tbody tr', text: '04/01/2021')
        puts prat.text
        prat.find('input[id="JustificativasPorPedir_0__Ocorrencia_Id"]').click


        find('input[id="btnJustificar"]').click
    end

    after(:each) do
        sleep 3
    end
end