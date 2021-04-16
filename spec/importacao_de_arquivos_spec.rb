describe 'Importando Arquivos', :importar do
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        visit '/Dimep/Importacao'
        sleep 5
        # Fechar Popup chato
        # find('div[class="close-button-modular"]').click

        @arquivo_pessoas_inclusao = Dir.pwd + '/spec/fixtures/importacoes/pessoas/inclusao-pessoas/inclusao-pessoas.txt'
        @arquivo_pessoas_desligamento = Dir.pwd + '/spec/fixtures/importacoes/pessoas/desligamento-pessoas/desligamento-pessoas.txt'
        @arquivo_pessoas_ferias = Dir.pwd + '/spec/fixtures/importacoes/pessoas/ferias/ferias.txt'
        @arquivo_pessoas_afastamento = Dir.pwd + '/spec/fixtures/importacoes/pessoas/afastamentos/afastamentos.txt'
        @arquivo_pessoas_marcacoes = Dir.pwd + '/spec/fixtures/importacoes/marcacoes/importando-marcacoes.txt'
        @arquivo_estruturas = Dir.pwd + '/spec/fixtures/importacoes/estruturas/estruturas.txt'
        @arquivo_cargos = Dir.pwd + '/spec/fixtures/importacoes/cargos/cargos.txt'
        @arquivo_folgas = Dir.pwd + '/spec/fixtures/importacoes/escalas/escalas-folgas/folgas.txt'
        @arquivo_horarios = Dir.pwd + '/spec/fixtures/importacoes/escalas/escalas-horario/horarios.txt'
        @arquivo_usuarios = Dir.pwd + '/spec/fixtures/importacoes/usuarios/usuarios.txt'
    end

    it 'inclusão/alteração de pessoas ', :importando_pessoas_inclusao_alteracao do
        find('span[id="TabImportacaoPessoa"]').click
        select('Inclusão/Alteração', from: 'select_funcionalidade')
        select('Teste - Formato Pessoa - Inclusão - Alteração', from: 'select_tipo')
        attach_file('ficheiro', @arquivo_pessoas_inclusao)
        div_arquivo = find('#lbl_escolha_2')
        expect(div_arquivo.text).to eql 'inclusao-pessoas.txt'
        find('input[id="bt_importar_pessoas"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end

    it 'Calculando pessoas inseridas ', :calculo_pessoas_inseridas do
        visit 'https://www.dimepkairos.com.br/Dimep/Calculo/Estrutura'
        find('i[class="jstree-icon jstree-checkbox"]', :visible=>false).set(true)
        find('input[id="btn_calc"]').click
        calculo_finalizado = find('div[id="calculosPendentes"]')
        expect(calculo_finalizado).to have_content 'Não existe cálculo pendente'
    end

    it 'Estruturas', :importando_estruturas do
        find('span[id="TabImportacaoEstrutura"]').click
        select('Teste - Formato Estruturas', from: 'EstTipoSeleccionado')
        attach_file('ficheiro', @arquivo_estruturas)
        div_arquivo = find('#lbl_escolha_3')
        expect(div_arquivo.text).to eql 'estruturas.txt'
        find('input[id="bt_importar"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end

    it 'Cargos', :importando_cargos do
        find('span[id="TabImportacaoCargo"]').click
        select('Teste - Formato Cargos', from: 'CargoTipoSeleccionado')
        attach_file('ficheiro', @arquivo_cargos)
        div_arquivo = find('#lbl_escolha_4')
        expect(div_arquivo.text).to eql 'cargos.txt'
        find('input[id="bt_importar"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end

    it 'usuarios', :importando_usuarios do
        find('span[id="TabImportacaoUsuario"]').click
        select('Teste - Formato Usuario', from: 'EstTipoSeleccionado')
        attach_file('ficheiro', @arquivo_usuarios)
        div_arquivo = find('#lbl_escolha_6')
        expect(div_arquivo.text).to eql 'usuarios.txt'
        find('input[id="bt_importar"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end

    it 'Férias de pessoas ', :importando_ferias_pessoas do
        find('span[id="TabImportacaoPessoa"]').click
        select('Férias', from: 'select_funcionalidade')
        select('Teste - Formato Pessoa - Ferias', from: 'select_tipo')
        attach_file('ficheiro', @arquivo_pessoas_ferias)
        div_arquivo = find('#lbl_escolha_2')
        expect(div_arquivo.text).to eql 'ferias.txt'
        find('input[id="bt_importar_pessoas"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end

    it 'Marcações de pessoas ', :importando_pessoas_marcacoes do
        find('span[id="TabImportarAFD"]').click
        select('Teste - Formato Coleta de Marcações', from: 'select_tipo')
        attach_file('ficheiro',  @arquivo_pessoas_marcacoes)
        div_arquivo = find('#lbl_escolha_1')
        expect(div_arquivo.text).to eql 'importando-marcacoes.txt'
        card = find('img[id="TogleIconSelectionType"]')
        card.hover
        find('div[id="checkAllPages"]').click
        find('input[id="bt_importar"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end

    it 'Escalas de Folgas', :importando_escalas_folgas do
        find('span[id="TabImportacaoEscala"]').click
        select('Folgas', from: 'select_funcionalidade_escalas')
        select('Teste - Formato Escalas - Folgas', from: 'select_tipo')
        attach_file('ficheiro', @arquivo_folgas)
        div_arquivo = find('#lbl_escolha_5')
        expect(div_arquivo.text).to eql 'folgas.txt'
        find('input[id="bt_importar_escalas"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end

    it 'Escalas de Horarios', :importando_escalas_horarios do
        find('span[id="TabImportacaoEscala"]').click
        select('Horários', from: 'select_funcionalidade_escalas')
        select('Teste - Formato Escalas - Horarios', from: 'select_tipo')
        attach_file('ficheiro', @arquivo_horarios)
        div_arquivo = find('#lbl_escolha_5')
        expect(div_arquivo.text).to eql 'horarios.txt'
        find('input[id="bt_importar_escalas"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end



    it 'Afastamentos de pessoas ', :importando_pessoas_afastamentos do
        find('span[id="TabImportacaoPessoa"]').click
        select('Afastamento', from: 'select_funcionalidade')
        select('Teste - Formato Pessoa - Afastamento', from: 'select_tipo')
        attach_file('ficheiro', @arquivo_pessoas_afastamento)
        div_arquivo = find('#lbl_escolha_2')
        expect(div_arquivo.text).to eql 'afastamentos.txt'
        find('input[id="bt_importar_pessoas"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end

    it 'desligamento de pessoas ', :importando_pessoas_desligamento do
        find('span[id="TabImportacaoPessoa"]').click
        select('Desligamentos', from: 'select_funcionalidade')
        select('Teste - Formato Pessoa - Desligamento', from: 'select_tipo')
        attach_file('ficheiro', @arquivo_pessoas_desligamento)
        div_arquivo = find('#lbl_escolha_2')
        expect(div_arquivo.text).to eql 'desligamento-pessoas.txt'
        find('input[id="bt_importar_pessoas"]').click
        resultado = find('div[id="bar_txt"]')
        expect(resultado).to have_content 'Não foram importados 0 registros'
    end
end