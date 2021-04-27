module FileUploader
  extend ActiveSupport::Concern

  included do
    has_one :image, as: :imageable, dependent: :destroy

    validates :file, presence: true, unless: -> { self.image.present? }

    attr_accessor :file

    before_validation :set_upload

    def set_upload
      return unless file.present?

      file_encoded = Base64.encode64(file.tempfile.read)
      return if file_encoded == self.image.try(:content)

      self.image = Image.new(
        content: file_encoded,
        name: file.original_filename,
        content_type: file.content_type
      )
    end

    def image_base64
      return unless image.present?

      "data:#{image.content_type};base64,#{image.content}"
    end
  end
end