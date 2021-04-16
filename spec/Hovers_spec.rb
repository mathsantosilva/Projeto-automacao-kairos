describe 'Mouse Hover', :hovers do
    
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: @login
        fill_in 'LogOnModel_Password', with: @senha
        click_button 'btnFormLogin'
        visit '/Dimep/Dashboard'
    end



    after(:each) do
        sleep 2
    end
end