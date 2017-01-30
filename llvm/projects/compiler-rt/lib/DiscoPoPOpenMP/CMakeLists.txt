include_directories(..)

# Runtime library sources and build flags.
set(DiscoPoPOpenMP_SOURCES
  iFunctions.cpp
  )
  
set(DiscoPoPOpenMP_CFLAGS
  -O2
  -std=c++11
  -pthread
  -fno-rtti
  -fPIE
  # Prevent clang from generating libc calls.
  -ffreestanding)

filter_available_targets(DiscoPoPOpenMP_SUPPORTED_ARCH x86_64 i386)

add_custom_target(DiscoPoPOpenMP)

if(APPLE)
  add_compiler_rt_runtime(clang_rt.DiscoPoPOpenMP
    STATIC
    OS ${DiscoPoPOpenMP_SUPPORTED_ARCH}
    ARCHS ${DiscoPoPOpenMP_SUPPORTED_ARCH}
    CFLAGS ${DiscoPoPOpenMP_CFLAGS}
    SOURCES ${DiscoPoPOpenMP_SOURCES}
    PARENT_TARGET DiscoPoPOpenMP)
else()
  foreach(arch ${DiscoPoPOpenMP_SUPPORTED_ARCH})
    add_compiler_rt_runtime(clang_rt.DiscoPoPOpenMP
      STATIC
      ARCHS ${DiscoPoPOpenMP_SUPPORTED_ARCH}
      CFLAGS ${DiscoPoPOpenMP_CFLAGS}
      SOURCES ${DiscoPoPOpenMP_SOURCES}
      PARENT_TARGET DiscoPoPOpenMP)
  endforeach()
endif()

add_dependencies(compiler-rt DiscoPoPOpenMP)
