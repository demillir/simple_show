require 'action_view'
require 'simple_show/base'

if defined?(::Rails::Railtie)
  require 'simple_show/railtie'
end

module SimpleShow

  mattr_accessor :show_class
  @@show_class = :simple_show

  mattr_accessor :wrapper_tag
  @@wrapper_tag = :div

  mattr_accessor :wrapper_class
  @@wrapper_class = :show

  mattr_accessor :label_tag
  @@label_tag = :label

  mattr_accessor :label_class
  @@label_class = nil

  mattr_accessor :label_prefix
  @@label_prefix = nil

  mattr_accessor :label_suffix
  @@label_suffix = ':'

  mattr_accessor :value_tag
  @@value_tag = :span

  mattr_accessor :value_class
  @@value_class = :value

  mattr_accessor :value_prefix
  @@value_prefix = nil

  mattr_accessor :value_suffix
  @@value_suffix = nil

  mattr_accessor :clear_on_close
  @@clear_on_close = true

  mattr_accessor :helpers
  @@helpers = {
    :to_currency => :number_to_currency,
    :to_human => :number_to_human,
    :to_human_size => :number_to_human_size,
    :to_percentage => :number_to_percentage,
    :to_phone => :number_to_phone,
    :with_delimiter => :number_with_delimiter,
    :with_precision => :number_with_precision
  }

  # Default way to setup SimpleShow. Run rails generate simple_show:install
  # to create a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

end
