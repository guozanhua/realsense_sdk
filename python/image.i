// License: Apache 2.0. See LICENSE file in root directory.
// Copyright(c) 2016 Intel Corporation. All Rights Reserved.

%module image
%include "carrays.i"
%include "cdata.i"
%include "stdint.i"
%include "exception.i"

%{
#include <librealsense/rs.hpp>
#include "rs/utils/librealsense_conversion_utils.h"
#include "rs_sdk.h"

using namespace rs::core;
%}

%exception {
  try {
    $action
  } catch(rs::error &e) {
    std::string s("myModule error: "), s2(e.what());
    s = s + s2;
    SWIG_exception(SWIG_RuntimeError, s.c_str());
  } catch(...) {
    SWIG_exception(SWIG_RuntimeError,"Unknown exception");
  }
}

%ignore __inline;
%ignore CONSTRUCT_UID;
%ignore create_instance_from_librealsense_frame;

%include "rs/core/types.h"
%array_functions(pointF32, pointF32Array);

%include "rs/core/image_interface.h"
