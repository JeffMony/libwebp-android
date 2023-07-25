project(my_project)
cmake_minimum_required(VERSION 3.4.1)
enable_language(ASM)

set(-DCMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -Wall -s -Wdeprecated-declarations")
set(-DCMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -Wall -s -Wdeprecated-declarations")

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--exclude-libs,ALL -O3 -flto -Wl,--gc-sections")

add_definitions("
-D__ANDROID__
-DWEBP_USE_THREAD
-DHAVE_CPU_FEATURES_H
")

set(THIRD_PARTY_DIR ${CMAKE_CURRENT_LIST_DIR}/../third_party)

set(LIBWEBP_DIR ${THIRD_PARTY_DIR}/libwebp)

include_directories(${LIBWEBP_DIR})

include_directories(${LIBWEBP_DIR}/src)

include_directories(${ANDROID_NDK}/sources/android/cpufeatures)

add_library(
        cpufeatures
        STATIC
        ${ANDROID_NDK}/sources/android/cpufeatures/cpu-features.c
)

file(
        GLOB
        webp_source

        ${LIBWEBP_DIR}/src/dec/alpha_dec.c
        ${LIBWEBP_DIR}/src/dec/buffer_dec.c
        ${LIBWEBP_DIR}/src/dec/frame_dec.c
        ${LIBWEBP_DIR}/src/dec/idec_dec.c
        ${LIBWEBP_DIR}/src/dec/io_dec.c
        ${LIBWEBP_DIR}/src/dec/quant_dec.c
        ${LIBWEBP_DIR}/src/dec/tree_dec.c
        ${LIBWEBP_DIR}/src/dec/vp8_dec.c
        ${LIBWEBP_DIR}/src/dec/vp8l_dec.c
        ${LIBWEBP_DIR}/src/dec/webp_dec.c
        ${LIBWEBP_DIR}/src/demux/anim_decode.c
        ${LIBWEBP_DIR}/src/demux/demux.c

        ${LIBWEBP_DIR}/src/dsp/alpha_processing.c
        ${LIBWEBP_DIR}/src/dsp/alpha_processing_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/alpha_processing_neon.c
        ${LIBWEBP_DIR}/src/dsp/alpha_processing_sse2.c
        ${LIBWEBP_DIR}/src/dsp/alpha_processing_sse41.c
        ${LIBWEBP_DIR}/src/dsp/alpha_processing_sse41.c
        ${LIBWEBP_DIR}/src/dsp/cost.c
        ${LIBWEBP_DIR}/src/dsp/cost_mips32.c
        ${LIBWEBP_DIR}/src/dsp/cost_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/cost_neon.c
        ${LIBWEBP_DIR}/src/dsp/cost_sse2.c
        ${LIBWEBP_DIR}/src/dsp/cpu.c
        ${LIBWEBP_DIR}/src/dsp/dec.c
        ${LIBWEBP_DIR}/src/dsp/dec_clip_tables.c
        ${LIBWEBP_DIR}/src/dsp/dec_mips32.c
        ${LIBWEBP_DIR}/src/dsp/dec_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/dec_msa.c
        ${LIBWEBP_DIR}/src/dsp/dec_neon.c
        ${LIBWEBP_DIR}/src/dsp/dec_sse2.c
        ${LIBWEBP_DIR}/src/dsp/dec_sse41.c
        ${LIBWEBP_DIR}/src/dsp/enc.c
        ${LIBWEBP_DIR}/src/dsp/enc_mips32.c
        ${LIBWEBP_DIR}/src/dsp/enc_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/enc_msa.c
        ${LIBWEBP_DIR}/src/dsp/enc_neon.c
        ${LIBWEBP_DIR}/src/dsp/enc_sse2.c
        ${LIBWEBP_DIR}/src/dsp/enc_sse41.c
        ${LIBWEBP_DIR}/src/dsp/filters.c
        ${LIBWEBP_DIR}/src/dsp/filters_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/filters_msa.c
        ${LIBWEBP_DIR}/src/dsp/filters_neon.c
        ${LIBWEBP_DIR}/src/dsp/filters_sse2.c
        ${LIBWEBP_DIR}/src/dsp/lossless.c
        ${LIBWEBP_DIR}/src/dsp/lossless_enc.c
        ${LIBWEBP_DIR}/src/dsp/lossless_enc_mips32.c
        ${LIBWEBP_DIR}/src/dsp/lossless_enc_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/lossless_enc_msa.c
        ${LIBWEBP_DIR}/src/dsp/lossless_enc_neon.c
        ${LIBWEBP_DIR}/src/dsp/lossless_enc_sse2.c
        ${LIBWEBP_DIR}/src/dsp/lossless_enc_sse41.c
        ${LIBWEBP_DIR}/src/dsp/lossless_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/lossless_msa.c
        ${LIBWEBP_DIR}/src/dsp/lossless_neon.c
        ${LIBWEBP_DIR}/src/dsp/lossless_sse2.c
        ${LIBWEBP_DIR}/src/dsp/lossless_sse41.c
        ${LIBWEBP_DIR}/src/dsp/rescaler.c
        ${LIBWEBP_DIR}/src/dsp/rescaler_mips32.c
        ${LIBWEBP_DIR}/src/dsp/rescaler_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/rescaler_msa.c
        ${LIBWEBP_DIR}/src/dsp/rescaler_neon.c
        ${LIBWEBP_DIR}/src/dsp/rescaler_sse2.c
        ${LIBWEBP_DIR}/src/dsp/ssim.c
        ${LIBWEBP_DIR}/src/dsp/ssim_sse2.c
        ${LIBWEBP_DIR}/src/dsp/upsampling.c
        ${LIBWEBP_DIR}/src/dsp/upsampling_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/upsampling_msa.c
        ${LIBWEBP_DIR}/src/dsp/upsampling_neon.c
        ${LIBWEBP_DIR}/src/dsp/upsampling_sse2.c
        ${LIBWEBP_DIR}/src/dsp/upsampling_sse41.c
        ${LIBWEBP_DIR}/src/dsp/yuv.c
        ${LIBWEBP_DIR}/src/dsp/yuv_mips32.c
        ${LIBWEBP_DIR}/src/dsp/yuv_mips_dsp_r2.c
        ${LIBWEBP_DIR}/src/dsp/yuv_neon.c
        ${LIBWEBP_DIR}/src/dsp/yuv_sse2.c
        ${LIBWEBP_DIR}/src/dsp/yuv_sse41.c

        ${LIBWEBP_DIR}/src/enc/alpha_enc.c
        ${LIBWEBP_DIR}/src/enc/analysis_enc.c
        ${LIBWEBP_DIR}/src/enc/backward_references_cost_enc.c
        ${LIBWEBP_DIR}/src/enc/backward_references_enc.c
        ${LIBWEBP_DIR}/src/enc/config_enc.c
        ${LIBWEBP_DIR}/src/enc/cost_enc.c
        ${LIBWEBP_DIR}/src/enc/filter_enc.c
        ${LIBWEBP_DIR}/src/enc/frame_enc.c
        ${LIBWEBP_DIR}/src/enc/histogram_enc.c
        ${LIBWEBP_DIR}/src/enc/iterator_enc.c
        ${LIBWEBP_DIR}/src/enc/near_lossless_enc.c
        ${LIBWEBP_DIR}/src/enc/picture_csp_enc.c
        ${LIBWEBP_DIR}/src/enc/picture_enc.c
        ${LIBWEBP_DIR}/src/enc/picture_psnr_enc.c
        ${LIBWEBP_DIR}/src/enc/picture_rescale_enc.c
        ${LIBWEBP_DIR}/src/enc/picture_tools_enc.c
        ${LIBWEBP_DIR}/src/enc/predictor_enc.c
        ${LIBWEBP_DIR}/src/enc/quant_enc.c
        ${LIBWEBP_DIR}/src/enc/syntax_enc.c
        ${LIBWEBP_DIR}/src/enc/token_enc.c
        ${LIBWEBP_DIR}/src/enc/tree_enc.c
        ${LIBWEBP_DIR}/src/enc/vp8l_enc.c
        ${LIBWEBP_DIR}/src/enc/webp_enc.c

        ${LIBWEBP_DIR}/src/mux/anim_encode.c
        ${LIBWEBP_DIR}/src/mux/muxedit.c
        ${LIBWEBP_DIR}/src/mux/muxinternal.c
        ${LIBWEBP_DIR}/src/mux/muxread.c

        ${LIBWEBP_DIR}/src/utils/bit_reader_utils.c
        ${LIBWEBP_DIR}/src/utils/bit_writer_utils.c
        ${LIBWEBP_DIR}/src/utils/color_cache_utils.c
        ${LIBWEBP_DIR}/src/utils/filters_utils.c
        ${LIBWEBP_DIR}/src/utils/huffman_encode_utils.c
        ${LIBWEBP_DIR}/src/utils/huffman_utils.c
        ${LIBWEBP_DIR}/src/utils/quant_levels_dec_utils.c
        ${LIBWEBP_DIR}/src/utils/quant_levels_utils.c
        ${LIBWEBP_DIR}/src/utils/random_utils.c
        ${LIBWEBP_DIR}/src/utils/rescaler_utils.c
        ${LIBWEBP_DIR}/src/utils/thread_utils.c
        ${LIBWEBP_DIR}/src/utils/utils.c

        ${LIBWEBP_DIR}/sharpyuv/sharpyuv.c
        ${LIBWEBP_DIR}/sharpyuv/sharpyuv_cpu.c
        ${LIBWEBP_DIR}/sharpyuv/sharpyuv_csp.c
        ${LIBWEBP_DIR}/sharpyuv/sharpyuv_dsp.c
        ${LIBWEBP_DIR}/sharpyuv/sharpyuv_gamma.c
        ${LIBWEBP_DIR}/sharpyuv/sharpyuv_neon.c
        ${LIBWEBP_DIR}/sharpyuv/sharpyuv_sse2.c
)

add_library(
        webp-shared
        SHARED
        ${webp_source}
)

target_link_libraries(
        webp-shared
        android
        cpufeatures
)
