describe 'Deletando pessoas', :deletar do
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        card = find('span[id="toogleModulos"]')
        card.hover
        find('img[class="pessoasIcon icons"]').click
        sleep 5
        # Fechar Popup chato
        # find('div[class="close-button-modular"]').click
    end

    it 'Todos', :deletar_todos do
        find('input[id="SearchButtonPessoa"]').click
        card = find('img[id="TogleIconSelectionType"]')
        card.hover
        find('div[id="checkAllPages"]').click
        find('input[id="MaisPessoas"]').click
        find('div[id="RemoverPessoas"]').click
        find('span[id="bRemoverPessoas"]').click
        mensagem = find('div[class="validation-summary-ok"]')
        expect(mensagem).to have_content 'Pessoas excluídas com sucesso.'
    end

    it 'Primeira pagina', :deletar_primeira_pagina do
        find('input[id="SearchButtonPessoa"]').click
        card = find('img[id="TogleIconSelectionType"]')
        card.hover
        find('div[id="checkPage"]').click
        find('input[id="MaisPessoas"]').click
        find('div[id="RemoverPessoas"]').click
        find('span[id="bRemoverPessoas"]').click
        mensagem = find('div[class="validation-summary-ok"]')
        expect(mensagem).to have_content 'Pessoas excluídas com sucesso.'
    end

end