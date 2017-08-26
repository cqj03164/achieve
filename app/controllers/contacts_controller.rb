class ContactsController < ApplicationController

 
#  def index
 #   @contacts = Contact.all
 # end 
  
def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end



  def create
      Contact.create(contacts_params)
      @contact = Contact.new(contacts_params)
      if @contact.save
    #  <%= form_for(@contact, url: confirm_contacts_path) do |f| %>
      redirect_to root_path, notice: "お問い合わせありがとうございました！"
    #   redirect_to confirm_contacts_path
    else
      render 'new'
     end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
  
  
   private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end

  
end
