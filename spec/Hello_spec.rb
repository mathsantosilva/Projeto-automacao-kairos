describe "Meu primeiro Script" do
        it "visitar a pagina" do
        puts "Abrindo o Navegador e acessando a Pagina..."
        visit "https://www.dimepkairos.com.br/"
        titulo = (page.titulo)
        sleep = 5
        expect(titulo).to eql "kairos"
    end
end