

describe 'Caixa de seleção', :dropdown do
    it 'Selecionando campo de ramo de atividade' do
        visit 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
        fill_in 'LogOnModel_UserName', with: 'mat_santos21@hotmail.com'
        fill_in 'LogOnModel_Password', with: 'teste'
        click_button 'btnFormLogin'
        visit 'https://www.dimepkairos.com.br/Dimep/Empresas/Edit/497121'
        select('EDUCAÇÃO', from: 'Empresa_RamoAtividade_Id')
        sleep 3
    
    end

    it 'item especifico com o find' do
        visit 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
        fill_in 'LogOnModel_UserName', with: 'mat_santos21@hotmail.com'
        fill_in 'LogOnModel_Password', with: 'teste'
        click_button 'btnFormLogin'
        visit 'https://www.dimepkairos.com.br/Dimep/Empresas/Edit/497121'
        drop = find('#Empresa_RamoAtividade_Id')
        drop.find('option', text: 'OUTROS').select_option
        sleep 3

    end

    it 'qualquer item' do
        visit 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
        fill_in 'LogOnModel_UserName', with: 'mat_santos21@hotmail.com'
        fill_in 'LogOnModel_Password', with: 'teste'
        click_button 'btnFormLogin'
        visit 'https://www.dimepkairos.com.br/Dimep/Empresas/Edit/497121'
        drop = find('#Empresa_RamoAtividade_Id')
        drop.all('option').sample.select_option
        sleep 3
    end
end