class Region < ActiveRecord::Base

  belongs_to :parent, class_name: 'Region'

  CITY, ADM_REGION, MUN_REGION = 1, 2, 3

  scope :cities, -> { where(kind: CITY).order :name }
  scope :adm_regions, -> { where(kind: ADM_REGION).order :name }
  scope :mun_regions, -> { where(kind: MUN_REGION).order :name }

  has_many :regions, -> { order :name }, foreign_key: "parent_id"

end