describe "Meu primeiro Script", :hello do
    before(:each) do
        visit '/'
    end
        it "visitar a pagina" do
        puts "Abrindo o Navegador e acessando a Pagina..."
        titulo = (page.title)
        sleep = 5
        expect(titulo).to eql "kairos"
        puts titulo
    end
end