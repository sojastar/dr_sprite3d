require 'minitest/autorun'
require_relative 'test_helper.rb'

describe Engine3D::Matrix do
  it 'initializes' do
    matrix = Engine3D::Matrix.new([[ 1,  2,  3,  4],
                                   [ 5,  6,  7,  8],
                                   [ 9, 10, 11, 12],
                                   [13, 14, 15, 16]])

    assert_equal   1, matrix[0,0]
    assert_equal   2, matrix[0,1]
    assert_equal   3, matrix[0,2]
    assert_equal   4, matrix[0,3]
    assert_equal   5, matrix[1,0]
    assert_equal   6, matrix[1,1]
    assert_equal   7, matrix[1,2]
    assert_equal   8, matrix[1,3]
    assert_equal   9, matrix[2,0]
    assert_equal  10, matrix[2,1]
    assert_equal  11, matrix[2,2]
    assert_equal  12, matrix[2,3]
    assert_equal  13, matrix[3,0]
    assert_equal  14, matrix[3,1]
    assert_equal  15, matrix[3,2]
    assert_equal  16, matrix[3,3]
  end

  it 'can return an identity matrix' do
    matrix = Engine3D::Matrix.identity()

    assert_equal  1.0, matrix[0,0]
    assert_equal  0.0, matrix[0,1]
    assert_equal  0.0, matrix[0,2]
    assert_equal  0.0, matrix[0,3]
    assert_equal  0.0, matrix[1,0]
    assert_equal  1.0, matrix[1,1]
    assert_equal  0.0, matrix[1,2]
    assert_equal  0.0, matrix[1,3]
    assert_equal  0.0, matrix[2,0]
    assert_equal  0.0, matrix[2,1]
    assert_equal  1.0, matrix[2,2]
    assert_equal  0.0, matrix[2,3]
    assert_equal  0.0, matrix[3,0]
    assert_equal  0.0, matrix[3,1]
    assert_equal  0.0, matrix[3,2]
    assert_equal  1.0, matrix[3,3]
  end

  it 'can set a single component' do
    matrix = Engine3D::Matrix.new([[ 1,  2,  3,  4],
                                   [ 5,  6,  7,  8],
                                   [ 9, 10, 11, 12],
                                   [13, 14, 15, 16]])
    matrix[0,0] = 16
    matrix[0,1] = 15
    matrix[0,2] = 14
    matrix[0,3] = 13
    matrix[1,0] = 12
    matrix[1,1] = 11
    matrix[1,2] = 10
    matrix[1,3] = 9
    matrix[2,0] = 8
    matrix[2,1] = 7
    matrix[2,2] = 6
    matrix[2,3] = 5
    matrix[3,0] = 4
    matrix[3,1] = 3
    matrix[3,2] = 2
    matrix[3,3] = 1

    assert_equal  16, matrix[0,0]
    assert_equal  15, matrix[0,1]
    assert_equal  14, matrix[0,2]
    assert_equal  13, matrix[0,3]
    assert_equal  12, matrix[1,0]
    assert_equal  11, matrix[1,1]
    assert_equal  10, matrix[1,2]
    assert_equal   9, matrix[1,3]
    assert_equal   8, matrix[2,0]
    assert_equal   7, matrix[2,1]
    assert_equal   6, matrix[2,2]
    assert_equal   5, matrix[2,3]
    assert_equal   4, matrix[3,0]
    assert_equal   3, matrix[3,1]
    assert_equal   2, matrix[3,2]
    assert_equal   1, matrix[3,3]
  end

  it 'can add to a single coefficient' do
    matrix = Engine3D::Matrix.new([[ 1,  2,  3,  4],
                                   [ 5,  6,  7,  8],
                                   [ 9, 10, 11, 12],
                                   [13, 14, 15, 16]])
    matrix[0,0] += 1

    assert_equal 2, matrix[0,0]
  end

  it 'can add with another matrix' do
    matrix1 = Engine3D::Matrix.new([[ 1,  2,  3,  4],
                                    [ 5,  6,  7,  8],
                                    [ 9, 10, 11, 12],
                                    [13, 14, 15, 16]])
    matrix2 = Engine3D::Matrix.new([[ 1,  2,  1,  2],
                                    [ 2,  1,  2,  1],
                                    [ 1,  2,  1,  2],
                                    [ 2,  1,  2,  1]])

    matrix3 = matrix1 + matrix2

    assert_equal   2, matrix3[0,0]
    assert_equal   4, matrix3[0,1]
    assert_equal   4, matrix3[0,2]
    assert_equal   6, matrix3[0,3]
    assert_equal   7, matrix3[1,0]
    assert_equal   7, matrix3[1,1]
    assert_equal   9, matrix3[1,2]
    assert_equal   9, matrix3[1,3]
    assert_equal  10, matrix3[2,0]
    assert_equal  12, matrix3[2,1]
    assert_equal  12, matrix3[2,2]
    assert_equal  14, matrix3[2,3]
    assert_equal  15, matrix3[3,0]
    assert_equal  15, matrix3[3,1]
    assert_equal  17, matrix3[3,2]
    assert_equal  17, matrix3[3,3]
  end

  it 'can multiply with another matrix' do
    matrix1 = Engine3D::Matrix.new([[ 1,  2,  3,  4],
                                    [ 5,  6,  7,  8],
                                    [ 9, 10, 11, 12],
                                    [13, 14, 15, 16]])
    matrix2 = Engine3D::Matrix.new([[ 1,  2,  1,  2],
                                    [ 2,  1,  2,  1],
                                    [ 1,  2,  1,  2],
                                    [ 2,  1,  2,  1]])
    matrix3 = matrix1 * matrix2

    assert_equal  16, matrix3[0,0]
    assert_equal  14, matrix3[0,1]
    assert_equal  16, matrix3[0,2]
    assert_equal  14, matrix3[0,3]
    assert_equal  40, matrix3[1,0]
    assert_equal  38, matrix3[1,1]
    assert_equal  40, matrix3[1,2]
    assert_equal  38, matrix3[1,3]
    assert_equal  64, matrix3[2,0]
    assert_equal  62, matrix3[2,1]
    assert_equal  64, matrix3[2,2]
    assert_equal  62, matrix3[2,3]
    assert_equal  88, matrix3[3,0]
    assert_equal  86, matrix3[3,1]
    assert_equal  88, matrix3[3,2]
    assert_equal  86, matrix3[3,3]
  end

  it 'can multiply with a vector' do
    matrix1 = Engine3D::Matrix.new([[ 1,  2,  3,  4],
                                    [ 5,  6,  7,  8],
                                    [ 9, 10, 11, 12],
                                    [13, 14, 15, 16]])
    vector1 = Engine3D::Vector.new(1,2,3,4)
    vector2 = matrix1 * vector1

    assert_equal   30, vector2.x
    assert_equal   70, vector2.y
    assert_equal  110, vector2.z
    assert_equal  150, vector2.w
  end

  it 'can multiply with a 3d vector' do
    matrix1 = Engine3D::Matrix.new([[ 1.0,  2.0,  3.0,  4.0],
                                    [ 5.0,  6.0,  7.0,  8.0],
                                    [ 9.0, 10.0, 11.0, 12.0],
                                    [ 0.0,  0.0,  0.0,  1.0]])
    vector1 = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    vector2 = matrix1.mul_vect_3d(vector1)

    assert_equal 18.0, vector2.x
    assert_equal 46.0, vector2.y
    assert_equal 74.0, vector2.z
    assert_equal  1.0, vector2.w
  end

  it 'can check for equality' do
    matrix          = Engine3D::Matrix.new([[ 1.0,  2.0,  3.0,  4.0],
                                            [ 5.0,  6.0,  7.0,  8.0],
                                            [ 9.0, 10.0, 11.0, 12.0],
                                            [13.0, 14.0, 15.0, 16.0]])
    matrix_eq1      = Engine3D::Matrix.new([[ 1.0,  2.0,  3.0,  4.0],
                                            [ 5.0,  6.0,  7.0,  8.0],
                                            [ 9.0, 10.0, 11.0, 12.0],
                                            [13.0, 14.0, 15.0, 16.0]])
    matrix_eq2      = Engine3D::Matrix.new([[ 1.0,  2.0,  3.0,  4.0],
                                            [ 5.0,  6.0,  7.0,  8.0],
                                            [ 9.0, 10.0, 11.0, 12.0],
                                            [13.0, 14.0, 15.0, 16.0000005]])
    matrix_not_eq1  = Engine3D::Matrix.new([[ 1.0,  2.0,  3.0,  4.0],
                                            [ 5.0,  6.0,  7.0,  8.0],
                                            [ 9.0, 10.0, 11.0, 12.0],
                                            [13.0, 14.0, 15.0, 16.000002]])
    matrix_not_eq2  = Engine3D::Matrix.new([[ 1.0,  2.0,  3.0,  4.0],
                                            [ 5.0,  6.0,  7.0,  8.0],
                                            [ 9.0, 10.0, 11.0, 12.0],
                                            [13.0, 14.0, 15.0, 17.0]])

    assert  matrix == matrix_eq1
    assert  matrix == matrix_eq2
    assert  matrix != matrix_not_eq1
    assert  matrix != matrix_not_eq2
  end

end
