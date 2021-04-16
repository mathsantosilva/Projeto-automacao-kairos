describe 'mouse hover', :hovers do
    
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        visit '/Dimep'
    end

    it 'acessando Dashboard', :dashboard do
        modulo_default = find('label[id="Modulo"]')
        expect(modulo_default).to have_content 'Pessoas'
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="dashboardIcon icons"]').click
        modulo_acessado = find('label[id="Modulo"]')
        expect(modulo_acessado).to have_content 'Dashboard'
    end

    it 'acessando Obras', :obras do
        modulo_default = find('label[id="Modulo"]')
        expect(modulo_default).to have_content 'Pessoas'
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="obrasIcon icons"]').click
        modulo_acessado = find('label[id="Modulo"]')
        expect(modulo_acessado).to have_content 'Obras'
    end

    it 'acessando Controle de Força de Trabalho', :controle_de_forca_de_trabalho do
        modulo_default = find('label[id="Modulo"]')
        expect(modulo_default).to have_content 'Pessoas'
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="forcaTrabalhoIcon icons"]').click
        modulo_acessado = find('label[id="Modulo"]')
        expect(modulo_acessado).to have_content 'Controle de Força de Trabalho'
    end

    it 'acessando Escalas', :escalas do
        modulo_default = find('label[id="Modulo"]')
        expect(modulo_default).to have_content 'Pessoas'
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="escalasIcon icons"]').click
        modulo_acessado = find('label[id="Modulo"]')
        expect(modulo_acessado).to have_content 'Escalas'
    end

    it 'acessando Compliance', :compliance do
        modulo_default = find('label[id="Modulo"]')
        expect(modulo_default).to have_content 'Pessoas'
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="complianceIcon icons"]').click
        modulo_acessado = find('label[id="Modulo"]')
        expect(modulo_acessado).to have_content 'Compliance'
    end

    it 'acessando Monitoração de Equipamentos', :monitoracao_de_equipamentos do
        modulo_default = find('label[id="Modulo"]')
        expect(modulo_default).to have_content 'Pessoas'
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="monitoracaoEquipamentosIcon icons"]').click
        modulo_acessado = find('label[id="Modulo"]')
        expect(modulo_acessado).to have_content 'Monitoração de Equipamentos'
    end

    after(:each) do
        sleep 5
    end

end