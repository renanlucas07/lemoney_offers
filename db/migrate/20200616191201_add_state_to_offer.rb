class AddStateToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :state, :string, default: State::DISABLED
  end
end
