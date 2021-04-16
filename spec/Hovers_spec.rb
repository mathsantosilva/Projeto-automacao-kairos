describe 'Mouse Hover', :hovers do
    
    before(:each) do
        visit 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
        fill_in 'LogOnModel_UserName', with: 'mat_santos21@hotmail.com'
        fill_in 'LogOnModel_Password', with: 'teste'
        click_button 'btnFormLogin'
        visit 'https://www.dimepkairos.com.br/Dimep/Dashboard'
    end



    after(:each) do
        sleep 2
    end
end