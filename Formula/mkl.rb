class Cmake < Formula
  desc "intel mkl-dnn"
  homepage "https://software.intel.com/en-us/mkl/"
  url "https://github.com/intel/mkl-dnn/releases/download/v0.17.4/mklml_mac_2019.0.1.20180928.tgz"
  sha256 "83f02938a0c095274db7b8b7b694157abafa3837c5cbaef740440d466c86a477"
  head "https://github.com/intel/mkl-dnn.git"

  bottle do
    cellar :any
    sha256 "83f02938a0c095274db7b8b7b694157abafa3837c5cbaef740440d466c86a477" => :sierra
  end

#option "with-foo", "Compile with foo bindings" # This overrides the generated description if you want to
#   depends_on "foo" => :optional # Generated description would otherwise be "Build with foo support"

#  depends_on "sphinx-doc" => :build
  depends_on "cmake" => :build
  depends_on "doxygen" => :build

  # The completions were removed because of problems with system bash

  # The `with-qt` GUI option was removed due to circular dependencies if
  # CMake is built with Qt support and Qt is built with MySQL support as MySQL uses CMake.
  # For the GUI application please instead use `brew cask install cmake`.


  def install
    # There is an existing issue around macOS & Python locale setting
    # See https://bugs.python.org/issue18378#msg215215 for explanation
    ENV["LC_ALL"] = "en_US.UTF-8"

    system "cmake", ".", *std_cmake_args
#    system "make"
    system "make", "install"

#    elisp.install "Auxiliary/cmake-mode.el"
  end

#  test do
#    (testpath/"CMakeLists.txt").write("find_package(Ruby)")
#    system bin/"cmake", "."
#  end
end
