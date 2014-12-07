class AddStudentIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :student_id, :integer

  end
end
