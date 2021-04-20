describe 'upload de arquivos', :upload do

    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/imagem.jpg'
        @atestado = Dir.pwd + '/spec/fixtures/atestado.jpg'
        @logotipo = Dir.pwd + '/spec/fixtures/logotipo.png'
    end

    it 'foto do funcionario', :upload_foto_funcionario do
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="pessoasIcon icons"]').click
        find('input[id="userAutocomplete"]').set 'Pessoa02'
        find('a[id="ui-id-4"]').click
        find('div[class="funcionarioName pointer"]').click
        find('input[id="editPessoa"][value="Alterar"]').click
        alterar_foto = find('span[class="buttonFile"]')
        expect(alterar_foto).to have_content 'Alterar Foto'
        attach_file('image', @imagem)
        drop = find("input[type='submit'][value='Salvar']", match: :first)
        drop.click
        resultado = find('div[class="validation-summary-ok"]')
        expect(resultado).to have_content 'Pessoa editada com sucesso'
    end

    it 'documento de atestado', :upload_documento_atestado do
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="pessoasIcon icons"]').click
        find('input[id="userAutocomplete"]').set 'Pessoa02'
        find('a[id="ui-id-4"]').click
        find('div[class="funcionarioName pointer"]').click
        find('div[id="UserProfilePedidosJustificativas"]').click
        find('span[id="TabPedidoHeader2"]').click

        within('table tbody tr', text: "04/01/2021") do
            find('label[for="301566"]').click
            select('Atestado Médico', from: 'ddl_justificativa_301566')
            find('input[id="tbmotivo_301566"]').set 'Teste automatização'
            find('label[for="cbPossuiDocumento_301566"]').click
            attach_file('Documentos', @atestado, :visible=>false)
        end
        # comentado a parte de salvar o pedido para não perder o pedido e trocar os Ids
        # find('input[id="btnJustificar"]').click
        # resultado = find('div[class="validation-summary-ok"]')
        # expect(resultado).to have_content 'Pedido de justificativa inserido com sucesso.'
    end

    it 'Logotipo relatorio', :upload_logotipo_relatorio do
        card = find('div[id="toggleUserDefinitions"]')
        card.hover
        find('div[class="pointer DropDownHeaderElement"]', text: "Empresa").click
        find('div[id="MenuEmpresas"]').click
        within('table tbody tr', text: "497121") do
            card = find('td', text: "Web Café - Alterar a Razão Social - Alteração de nome")
            card.hover
            find('span[class="pointer spanButton"]').click
        end
        find('label[for="LogotipoPersonalizado"]').click
        attach_file('fileupload', @logotipo, :visible=>false)
        sleep 2
        porcentagem = find('span[id="percent"]')
        expect(porcentagem).to have_content '100'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        resultado = find('div[class="validation-summary-ok"]')
        expect(resultado).to have_content 'Empresa editada com sucesso'
    end

    it 'Logotipo empresa', :upload_logotipo_empresa do
        card = find('div[id="toggleUserDefinitions"]')
        card.hover
        find('div[class="pointer DropDownHeaderElement"]', text: "Sistema").click
        find('div[id="MenuPreferencias"]').click
        find('span[id="TabTema"]').click
        find('label[for="EmpresaPreferenciaTema_LogotipoPersonalizado"]').click
        attach_file('fileupload', @logotipo, :visible=>false)
        sleep 2
        porcentagem = find('span[id="percent"]')
        expect(porcentagem).to have_content '100'
        find('input[class="guardar"][value="Salvar"]').click
        find('span[class="PlusButton pointer"]').click
        resultado = find('div[class="validation-summary-ok"]')
        expect(resultado).to have_content 'Preferências editadas com sucesso'
    end

    after(:each) do
        sleep 3
    end
end