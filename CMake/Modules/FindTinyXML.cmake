# Sourced from:
# https://raw.githubusercontent.com/ros/cmake_modules/0.4-devel/cmake/Modules/FindTinyXML.cmake
# under the following license: https://github.com/ros/cmake_modules/blob/0.4-devel/LICENSE,
# reproduced here:

# Copyright (c) 2013, Open Source Robotics Foundation
# All rights reserved.

# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:

#  Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.

#   Redistributions in binary form must reproduce the above copyright notice, this
#   list of conditions and the following disclaimer in the documentation and/or
#   other materials provided with the distribution.

#   Neither the name of the {organization} nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

##################################################################################################
# 
# CMake script for finding TinyXML.
# 
# Input variables:
# 
# - TinyXML_ROOT_DIR (optional): When specified, header files and libraries will be searched for in
#     ${TinyXML_ROOT_DIR}/include
#     ${TinyXML_ROOT_DIR}/libs
#   respectively, and the default CMake search order will be ignored. When unspecified, the default
#   CMake search order is used.
#   This variable can be specified either as a CMake or environment variable. If both are set,
#   preference is given to the CMake variable.
#   Use this variable for finding packages installed in a nonstandard location, or for enforcing
#   that one of multiple package installations is picked up.
# 
# 
# Cache variables (not intended to be used in CMakeLists.txt files)
# 
# - TinyXML_INCLUDE_DIR: Absolute path to package headers.
# - TinyXML_LIBRARY: Absolute path to library.
# 
# 
# Output variables:
# 
# - TinyXML_FOUND: Boolean that indicates if the package was found
# - TinyXML_INCLUDE_DIRS: Paths to the necessary header files
# - TinyXML_LIBRARIES: Package libraries
# 
# 
# Example usage:
# 
#  find_package(TinyXML)
#  if(NOT TinyXML_FOUND)
#    # Error handling
#  endif()
#  ...
#  include_directories(${TinyXML_INCLUDE_DIRS} ...)
#  ...
#  target_link_libraries(my_target ${TinyXML_LIBRARIES})
# 
##################################################################################################

# Get package location hint from environment variable (if any)
if(NOT TinyXML_ROOT_DIR AND DEFINED ENV{TinyXML_ROOT_DIR})
  set(TinyXML_ROOT_DIR "$ENV{TinyXML_ROOT_DIR}" CACHE PATH
      "TinyXML base directory location (optional, used for nonstandard installation paths)")
endif()

# Search path for nonstandard package locations
if(TinyXML_ROOT_DIR)
  set(TinyXML_INCLUDE_PATH PATHS "${TinyXML_ROOT_DIR}/include" NO_DEFAULT_PATH)
  set(TinyXML_LIBRARY_PATH PATHS "${TinyXML_ROOT_DIR}/lib"     NO_DEFAULT_PATH)
endif()

# Find headers and libraries
find_path(TinyXML_INCLUDE_DIR NAMES tinyxml.h PATH_SUFFIXES "tinyxml" ${TinyXML_INCLUDE_PATH})
find_library(TinyXML_LIBRARY  NAMES tinyxml   PATH_SUFFIXES "tinyxml" ${TinyXML_LIBRARY_PATH})

mark_as_advanced(TinyXML_INCLUDE_DIR
                 TinyXML_LIBRARY)

# Output variables generation
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(TinyXML DEFAULT_MSG TinyXML_LIBRARY
                                                      TinyXML_INCLUDE_DIR)

set(TinyXML_FOUND ${TINYXML_FOUND}) # Enforce case-correctness: Set appropriately cased variable...
unset(TINYXML_FOUND) # ...and unset uppercase variable generated by find_package_handle_standard_args

if(TinyXML_FOUND)
  set(TinyXML_INCLUDE_DIRS ${TinyXML_INCLUDE_DIR})
  set(TinyXML_LIBRARIES ${TinyXML_LIBRARY})
endif()
