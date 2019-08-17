class StaticPagesController < ApplicationController
    def index
       render html: "こんにちは" 
    end
end
