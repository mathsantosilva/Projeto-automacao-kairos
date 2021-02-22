describe 'Acessando o training' do
    it 'Realizando login com sucesso' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'
        expect(find('#flash').visible?).to be true
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
        sleep 3
    end
    it 'Realizando login com senha errada' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'Ultron'
        click_button 'Login'
        expect(find('#flash').visible?).to be true
        expect(find('#flash')).to have_content 'Senha é invalida!'
        sleep 3
    end
    it 'Realizando login com o usuario incorreto' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'
        fill_in 'username', with: 'Thor'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'
        expect(find('#flash').visible?).to be true
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
        sleep 3 
    end
end