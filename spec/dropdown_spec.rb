

describe 'Caixa de seleção', :dropdown do
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        visit '/Dimep/Empresas/Edit/497121'
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