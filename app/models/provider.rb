class Provider < ApplicationRecord
	#uses simple_enu gemm
  as_enum :gender, :Female => 1, :Male => 0
end
