describe 'Movendo relogio monitorado', :drop do
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        sleep 3
        visit '/Dimep/MonitoracaoEquipamentos'
        sleep 3
        
end

it 'Relogio', :drop_relogio do

    coluna =  find('div[id="column_3"]')
    relogio = find('div[id="widget_1"]')
    relogio.drag_to coluna
     
 end


end