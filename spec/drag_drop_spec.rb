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

    it '4 posições', :drop_relogio do
        #Primeira posição
        coluna =  find('div[id="column_0"]')
        relogio = find('div[id="widget_1"]')
        relogio.drag_to coluna

        #Segunda posição
        coluna =  find('div[id="column_1"]')
        relogio = find('div[id="widget_1"]')
        relogio.drag_to coluna

        #Terceira Posição
        coluna =  find('div[id="column_2"]')
        relogio = find('div[id="widget_1"]')
        relogio.drag_to coluna

        #Quarta posição
        coluna =  find('div[id="column_3"]')
        relogio = find('div[id="widget_1"]')
        relogio.drag_to coluna
        
    end

    after(:each) do
        sleep 5
    end


end