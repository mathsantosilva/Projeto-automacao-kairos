describe 'acessando empresas', :Acessando do
    
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="pessoasIcon icons"]').click
    end

    it 'acessando a sub empresa ', :sub_empresa do
        nome_principal = find('a[class="chznEmp-single"]')
        expect(nome_principal).to have_content 'Web Café - Alterar a Razão Social - Alteração de nome'
        find('a[class="chznEmp-single"]').click
        find('li[id="SelecEmpresas_chznEmp_o_1"]').click
        nome_empresa_acessada = find('a[class="chznEmp-single"]')
        expect(nome_empresa_acessada).to have_content 'Sub Empresa - 01/01/2020'
    end

    it 'acessando a Web Cafe Diadema', :sub_diadema do
        nome_principal = find('a[class="chznEmp-single"]')
        expect(nome_principal).to have_content 'Web Café - Alterar a Razão Social - Alteração de nome'
        find('a[class="chznEmp-single"]').click
        find('li[id="SelecEmpresas_chznEmp_o_3"]').click
        nome_empresa_acessada = find('a[class="chznEmp-single"]')
        expect(nome_empresa_acessada).to have_content 'Web Cafe Diadema'
    end

    it 'acessando a Empresa sem portaria', :sub_sem_portaria do
        nome_principal = find('a[class="chznEmp-single"]')
        expect(nome_principal).to have_content 'Web Café - Alterar a Razão Social - Alteração de nome'
        find('a[class="chznEmp-single"]').click
        find('li[id="SelecEmpresas_chznEmp_o_0"]').click
        nome_empresa_acessada = find('a[class="chznEmp-single"]')
        expect(nome_empresa_acessada).to have_content 'Empresa sem portaria 1510'
    end

    it 'Acessando a empresa sub empresa e voltando para principal', :voltando_principal do
        nome_principal = find('a[class="chznEmp-single"]')
        expect(nome_principal).to have_content 'Web Café - Alterar a Razão Social - Alteração de nome'
        find('a[class="chznEmp-single"]').click
        find('li[id="SelecEmpresas_chznEmp_o_1"]').click
        nome_empresa_acessada = find('a[class="chznEmp-single"]')
        expect(nome_empresa_acessada).to have_content 'Sub Empresa - 01/01/2020'
        find('a[class="chznEmp-single"]').click
        find('li[id="SelecEmpresas_chznEmp_o_2"]').click
        nome_empresa_acessada = find('a[class="chznEmp-single"]')
        expect(nome_empresa_acessada).to have_content 'Web Café - Alterar a Razão Social - Alteração de nome'
    end

    after(:each) do
        sleep 2
    end
end