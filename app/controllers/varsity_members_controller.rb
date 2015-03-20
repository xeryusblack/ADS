class VarsityMembersController < ApplicationController
   load_and_authorize_resource
  def index
    @varsity_members = VarsityMember.all 

    render(:template => "varsity_members/index")
  end

  def email_report
    @varsity_members = VarsityMember.all
    @role = Role.find_by(name: "Administrator")
    @admin = OfficerInCharge.find_by(@role.id)
    @pdf
    respond_to do |format|
      format.html
      format.pdf do
        @pdf = render_to_string :pdf => 'MyPDF', 
        :template   => 'varsity_members/email_report.pdf.erb'  # Excluding ".pdf" extension.
    end
  end

    UserMailer.report_email(@admin, @pdf).deliver!
    render(:template => "varsity_members/index")
    flash[:notice] = 'Email has been sent!'
  end

  def report
    @varsity_members = VarsityMember.all 

     respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "report_varsity_members_path"   # Excluding ".pdf" extension.
      end
    end
  end

  def show
    @varsity_member = VarsityMember.find(params[:id])
  end

  def new
    @varsity_member = VarsityMember.new

    render(:template => "varsity_members/new")
  end

  def create
    @varsity_member = VarsityMember.new(varsity_member_params)

    if @varsity_member.save
      redirect_to varsity_member_path(@varsity_member.id)
    else
      render(:template => "varsity_members/new")
    end
  end

  def edit
    @varsity_member = VarsityMember.find(params[:id])

    render(:templace => "varsity_members/edit")
  end

  def update
    @varsity_member = VarsityMember.find(params[:id])

    if @varsity_member.update(varsity_member_params)
      redirect_to varsity_member_path(@varsity_member)
    else
      render(:template => "varsity_members/edit")
    end
  end

  def destroy
    @varsity_member = VarsityMember.find(params[:id])
    @varsity_member.destroy!
    redirect_to varsity_members_path
  end

  def varsity_member_params
    params.require(:varsity_member).permit!
  end

end