

describe 'Caixa de seleção', :dropdown do
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        # Navegar até a tela de Definições - Empresas
        selecionar = find('div[id="toggleUserDefinitions"]')
        selecionar.hover
        find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
        find('div[id="MenuEmpresas"]').click
        selecionar = find('table tbody tr', text: 'Web Café - Alterar a Razão Social - Alteração de nome')
        scroll_to(selecionar)
        selecionar.hover
        find('span[class="spanButtonText"]').click
    end

    it 'Selecionando campo de ramo de atividade' do
        select('EDUCAÇÃO', from: 'Empresa_RamoAtividade_Id')
        sleep 3
    
    end

    it 'item especifico com o find' do
        drop = find('#Empresa_RamoAtividade_Id')
        drop.find('option', text: 'OUTROS').select_option
        sleep 3

    end

    it 'qualquer item' do
        drop = find('#Empresa_RamoAtividade_Id')
        drop.all('option').sample.select_option
        sleep 3
    end
end