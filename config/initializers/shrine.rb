# frozen_string_literal: true
require 'shrine'
require 'shrine/storage/file_system'

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads'), # permanent
}
Shrine.plugin :derivation_endpoint, secret_key: '52750b30ffbc7de3b362'
Shrine.plugin :activerecord # or :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data
Shrine.plugin :validation
Shrine.plugin :validation_helpers
