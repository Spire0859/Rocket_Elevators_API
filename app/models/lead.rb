class Lead < ApplicationRecord
    mount_uploader :file, FileUploader
end
