class User < ApplicationRecord

	has_many :articles
	has_many :comments, :through => :articles
	validates_uniqueness_of :username

	enum role: { standard: 0, admin: 1 }

	after_initialize :set_standard_role, :if => :new_record?

	def set_standard_role
		self['role'] ||= :standard
	end

	def standard?
		self['role'] == :standard
	end

	def admin?
		self['role'] == :admin
	end

end
