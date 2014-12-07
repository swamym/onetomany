class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @school = School.find(params[:school_id])
    @students = @school.students.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
     @school = School.find(params[:school_id])
    @student = @school.students.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new

    @school = School.find(params[:school_id])
    @student = @school.students.build
    @photo = @student.build_photo
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
     @school = School.find(params[:school_id])
     @student = @school.students.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create

    @school = School.find(params[:school_id])
    @student = @school.students.build(params[:student])
    respond_to do |format|
      if @student.save
        format.html { redirect_to ([@school, @student]), notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @school = School.find(params[:school_id])
    @student = @school.students.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to ([@school, @student]), notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
