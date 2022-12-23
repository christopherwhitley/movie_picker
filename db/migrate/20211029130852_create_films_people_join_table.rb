class CreateFilmsPeopleJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table(:films, :people) do |t|
      # t.index [:film_id, :person_id]
      # t.index [:person_id, :film_id]
    end
  end
end
