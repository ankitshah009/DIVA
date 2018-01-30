# kwant External Project

message(STATUS "I am pulling and building kwant!")

list(APPEND DIVA_DEPENDENCIES kwant)


ExternalProject_Add(kwant
  DEPENDS ${KWANT_DEPENDENCIES}
  PREFIX ${DIVA_BINARY_DIR}
  GIT_REPOSITORY "git://github.com/Kitware/kwant.git"
  GIT_TAG 48555efdda860e81b44a1f7a07bcdbbfb6ef244f
  SOURCE_DIR kwant
  BINARY_DIR kwant-build
  STAMP_DIR ${DIVA_STAMP_DIR}
  CMAKE_CACHE_ARGS
    -DBUILD_SHARED_LIBS:BOOL=ON
    -Dkwiver_DIR:PATH=${kwiver_DIR}
    -Dfletch_DIR:PATH=${fletch_DIR}
    -DCMAKE_PREFIX_PATH:STRING=${CMAKE_PREFIX_PATH}
    -DCMAKE_INSTALL_PREFIX:STRING=${CMAKE_INSTALL_PREFIX_PATH}
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
    -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
    -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
    -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
    -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
    ${CMAKE_CXX_COMPILER_LAUNCHER_FLAG}
    ${CMAKE_C_COMPILER_LAUNCHER_FLAG}
    -DCMAKE_EXE_LINKER_FLAGS:STRING=${CMAKE_EXE_LINKER_FLAGS}
    -DCMAKE_SHARED_LINKER_FLAGS:STRING=${CMAKE_SHARED_LINKER_FLAGS}
    -DADDITIONAL_C_FLAGS:STRING=${ADDITIONAL_C_FLAGS}
    -DADDITIONAL_CXX_FLAGS:STRING=${ADDITIONAL_CXX_FLAGS}
  INSTALL_COMMAND cmake -E echo "Skipping install step."
  )


set(kwant_DIR "${DIVA_BINARY_DIR}/kwant-build")
