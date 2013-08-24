class DecksController < ApplicationController

  def show
    @deck = Deck.find(params[:id])
    
    description_file = Rails.root.join("public/assets/decks/descriptions/#{@deck.slug}.md")
    if File.exist?(description_file)
      @deck_description = BlueCloth.new(File.read(description_file)).to_html.html_safe
    else
      @deck_description = "Description unavailable."
    end
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    d = Deck.find(params[:id])
    d.title = params[:deck][:title]
    d.slug = params[:deck][:slug]
    d.category = params[:deck][:category]

    if d.save
      redirect_to deck_path(d), notice: "Deck saved successfully"
    else
      render :edit
    end

  end

end
