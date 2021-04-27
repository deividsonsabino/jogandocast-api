module FileUploader
  extend ActiveSupport::Concern

  included do
    has_one :image, as: :imageable, dependent: :destroy

    validates :file, presence: true

    attr_accessor :file

    before_validation do
      return unless file.present?

      file_encoded = Base64.encode64(file.tempfile.read)
      return if file_encoded == self.image.try(:content)

      if self.image.present?
        self.image.content = f
        self.image.name = photo.original_filename
        self.content_type = photo.content_type
      else
        self.image = Image.new(content: file_encoded, name: file.original_filename)
      end
    end

    def image_base64
      return unless image.present?

      "data:image/#{image.content_type};base64,#{image.content}"
    end
  end
end