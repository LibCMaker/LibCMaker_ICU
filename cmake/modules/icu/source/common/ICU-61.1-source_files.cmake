# Copyright (c) 2018, NikitaFeodonit. All rights reserved.
#
## ICU build file for CMake build tools

target_sources(${lib_NAME}
  PRIVATE
    ${private_src_DIR}/appendable.cpp
    ${private_src_DIR}/bmpset.cpp
    ${private_src_DIR}/brkeng.cpp
    ${private_src_DIR}/brkiter.cpp
    ${private_src_DIR}/bytesinkutil.cpp
    ${private_src_DIR}/bytestream.cpp
    ${private_src_DIR}/bytestrie.cpp
    ${private_src_DIR}/bytestriebuilder.cpp
    ${private_src_DIR}/bytestrieiterator.cpp
    ${private_src_DIR}/caniter.cpp
    ${private_src_DIR}/chariter.cpp
    ${private_src_DIR}/charstr.cpp
    ${private_src_DIR}/cmemory.cpp
    ${private_src_DIR}/cstr.cpp
    ${private_src_DIR}/cstring.cpp
    ${private_src_DIR}/cwchar.cpp
    ${private_src_DIR}/dictbe.cpp
    ${private_src_DIR}/dictionarydata.cpp
    ${private_src_DIR}/dtintrv.cpp
    ${private_src_DIR}/edits.cpp
    ${private_src_DIR}/errorcode.cpp
    ${private_src_DIR}/filteredbrk.cpp
    ${private_src_DIR}/filterednormalizer2.cpp
    ${private_src_DIR}/icudataver.cpp
    ${private_src_DIR}/icuplug.cpp
    ${private_src_DIR}/listformatter.cpp
    ${private_src_DIR}/loadednormalizer2impl.cpp
    ${private_src_DIR}/locavailable.cpp
    ${private_src_DIR}/locbased.cpp
    ${private_src_DIR}/locdispnames.cpp
    ${private_src_DIR}/locdspnm.cpp
    ${private_src_DIR}/locid.cpp
    ${private_src_DIR}/loclikely.cpp
    ${private_src_DIR}/locmap.cpp
    ${private_src_DIR}/locresdata.cpp
    ${private_src_DIR}/locutil.cpp
    ${private_src_DIR}/messagepattern.cpp
    ${private_src_DIR}/normalizer2.cpp
    ${private_src_DIR}/normalizer2impl.cpp
    ${private_src_DIR}/normlzr.cpp
    ${private_src_DIR}/parsepos.cpp
    ${private_src_DIR}/patternprops.cpp
    ${private_src_DIR}/pluralmap.cpp
    ${private_src_DIR}/propname.cpp
    ${private_src_DIR}/propsvec.cpp
    ${private_src_DIR}/punycode.cpp
    ${private_src_DIR}/putil.cpp
    ${private_src_DIR}/rbbi_cache.cpp
    ${private_src_DIR}/rbbi.cpp
    ${private_src_DIR}/rbbidata.cpp
    ${private_src_DIR}/rbbinode.cpp
    ${private_src_DIR}/rbbirb.cpp
    ${private_src_DIR}/rbbiscan.cpp
    ${private_src_DIR}/rbbisetb.cpp
    ${private_src_DIR}/rbbistbl.cpp
    ${private_src_DIR}/rbbitblb.cpp
    ${private_src_DIR}/resbund_cnv.cpp
    ${private_src_DIR}/resbund.cpp
    ${private_src_DIR}/resource.cpp
    ${private_src_DIR}/ruleiter.cpp
    ${private_src_DIR}/schriter.cpp
    ${private_src_DIR}/serv.cpp
    ${private_src_DIR}/servlk.cpp
    ${private_src_DIR}/servlkf.cpp
    ${private_src_DIR}/servls.cpp
    ${private_src_DIR}/servnotf.cpp
    ${private_src_DIR}/servrbf.cpp
    ${private_src_DIR}/servslkf.cpp
    ${private_src_DIR}/sharedobject.cpp
    ${private_src_DIR}/simpleformatter.cpp
    ${private_src_DIR}/stringpiece.cpp
    ${private_src_DIR}/stringtriebuilder.cpp
    ${private_src_DIR}/uarrsort.cpp
    ${private_src_DIR}/ubidi_props.cpp
    ${private_src_DIR}/ubidi.cpp
    ${private_src_DIR}/ubidiln.cpp
    ${private_src_DIR}/ubiditransform.cpp
    ${private_src_DIR}/ubidiwrt.cpp
    ${private_src_DIR}/ubrk.cpp
    ${private_src_DIR}/ucase.cpp
    ${private_src_DIR}/ucasemap_titlecase_brkiter.cpp
    ${private_src_DIR}/ucasemap.cpp
    ${private_src_DIR}/ucat.cpp
    ${private_src_DIR}/uchar.cpp
    ${private_src_DIR}/ucharstrie.cpp
    ${private_src_DIR}/ucharstriebuilder.cpp
    ${private_src_DIR}/ucharstrieiterator.cpp
    ${private_src_DIR}/uchriter.cpp
    ${private_src_DIR}/ucln_cmn.cpp
    ${private_src_DIR}/ucmndata.cpp
    ${private_src_DIR}/ucnv_bld.cpp
    ${private_src_DIR}/ucnv_cb.cpp
    ${private_src_DIR}/ucnv_cnv.cpp
    ${private_src_DIR}/ucnv_ct.cpp
    ${private_src_DIR}/ucnv_err.cpp
    ${private_src_DIR}/ucnv_ext.cpp
    ${private_src_DIR}/ucnv_io.cpp
    ${private_src_DIR}/ucnv_lmb.cpp
    ${private_src_DIR}/ucnv_set.cpp
    ${private_src_DIR}/ucnv_u16.cpp
    ${private_src_DIR}/ucnv_u32.cpp
    ${private_src_DIR}/ucnv_u7.cpp
    ${private_src_DIR}/ucnv_u8.cpp
    ${private_src_DIR}/ucnv.cpp
    ${private_src_DIR}/ucnv2022.cpp
    ${private_src_DIR}/ucnvbocu.cpp
    ${private_src_DIR}/ucnvdisp.cpp
    ${private_src_DIR}/ucnvhz.cpp
    ${private_src_DIR}/ucnvisci.cpp
    ${private_src_DIR}/ucnvlat1.cpp
    ${private_src_DIR}/ucnvmbcs.cpp
    ${private_src_DIR}/ucnvscsu.cpp
    ${private_src_DIR}/ucnvsel.cpp
    ${private_src_DIR}/ucol_swp.cpp
    ${private_src_DIR}/ucurr.cpp
    ${private_src_DIR}/udata.cpp
    ${private_src_DIR}/udatamem.cpp
    ${private_src_DIR}/udataswp.cpp
    ${private_src_DIR}/uenum.cpp
    ${private_src_DIR}/uhash_us.cpp
    ${private_src_DIR}/uhash.cpp
    ${private_src_DIR}/uidna.cpp
    ${private_src_DIR}/uinit.cpp
    ${private_src_DIR}/uinvchar.cpp
    ${private_src_DIR}/uiter.cpp
    ${private_src_DIR}/ulist.cpp
    ${private_src_DIR}/ulistformatter.cpp
    ${private_src_DIR}/uloc_keytype.cpp
    ${private_src_DIR}/uloc_tag.cpp
    ${private_src_DIR}/uloc.cpp
    ${private_src_DIR}/umapfile.cpp
    ${private_src_DIR}/umath.cpp
    ${private_src_DIR}/umutex.cpp
    ${private_src_DIR}/unames.cpp
    ${private_src_DIR}/unifiedcache.cpp
    ${private_src_DIR}/unifilt.cpp
    ${private_src_DIR}/unifunct.cpp
    ${private_src_DIR}/uniset_closure.cpp
    ${private_src_DIR}/uniset_props.cpp
    ${private_src_DIR}/uniset.cpp
    ${private_src_DIR}/unisetspan.cpp
    ${private_src_DIR}/unistr_case_locale.cpp
    ${private_src_DIR}/unistr_case.cpp
    ${private_src_DIR}/unistr_cnv.cpp
    ${private_src_DIR}/unistr_props.cpp
    ${private_src_DIR}/unistr_titlecase_brkiter.cpp
    ${private_src_DIR}/unistr.cpp
    ${private_src_DIR}/unorm.cpp
    ${private_src_DIR}/unormcmp.cpp
    ${private_src_DIR}/uobject.cpp
    ${private_src_DIR}/uprops.cpp
    ${private_src_DIR}/ures_cnv.cpp
    ${private_src_DIR}/uresbund.cpp
    ${private_src_DIR}/uresdata.cpp
    ${private_src_DIR}/usc_impl.cpp
    ${private_src_DIR}/uscript_props.cpp
    ${private_src_DIR}/uscript.cpp
    ${private_src_DIR}/uset_props.cpp
    ${private_src_DIR}/uset.cpp
    ${private_src_DIR}/usetiter.cpp
    ${private_src_DIR}/ushape.cpp
    ${private_src_DIR}/usprep.cpp
    ${private_src_DIR}/ustack.cpp
    ${private_src_DIR}/ustr_cnv.cpp
    ${private_src_DIR}/ustr_titlecase_brkiter.cpp
    ${private_src_DIR}/ustr_wcs.cpp
    ${private_src_DIR}/ustrcase_locale.cpp
    ${private_src_DIR}/ustrcase.cpp
    ${private_src_DIR}/ustrenum.cpp
    ${private_src_DIR}/ustrfmt.cpp
    ${private_src_DIR}/ustring.cpp
    ${private_src_DIR}/ustrtrns.cpp
    ${private_src_DIR}/utext.cpp
    ${private_src_DIR}/utf_impl.cpp
    ${private_src_DIR}/util_props.cpp
    ${private_src_DIR}/util.cpp
    ${private_src_DIR}/utrace.cpp
    ${private_src_DIR}/utrie.cpp
    ${private_src_DIR}/utrie2_builder.cpp
    ${private_src_DIR}/utrie2.cpp
    ${private_src_DIR}/uts46.cpp
    ${private_src_DIR}/utypes.cpp
    ${private_src_DIR}/uvector.cpp
    ${private_src_DIR}/uvectr32.cpp
    ${private_src_DIR}/uvectr64.cpp
    ${private_src_DIR}/wintz.cpp

  PRIVATE
    ${private_src_DIR}/bmpset.h
    ${private_src_DIR}/brkeng.h
    ${private_src_DIR}/bytesinkutil.h
    ${private_src_DIR}/charstr.h
    ${private_src_DIR}/cmemory.h
    ${private_src_DIR}/cpputils.h
    ${private_src_DIR}/cstr.h
    ${private_src_DIR}/cstring.h
    ${private_src_DIR}/cwchar.h
    ${private_src_DIR}/dictbe.h
    ${private_src_DIR}/dictionarydata.h
    ${private_src_DIR}/hash.h
    ${private_src_DIR}/icuplugimp.h
    ${private_src_DIR}/localsvc.h
    ${private_src_DIR}/locbased.h
    ${private_src_DIR}/locmap.h
    ${private_src_DIR}/locutil.h
    ${private_src_DIR}/messageimpl.h
    ${private_src_DIR}/msvcres.h
    ${private_src_DIR}/mutex.h
    ${private_src_DIR}/norm2allmodes.h
    ${private_src_DIR}/norm2_nfc_data.h
    ${private_src_DIR}/normalizer2impl.h
    ${private_src_DIR}/patternprops.h
    ${private_src_DIR}/pluralmap.h
    ${private_src_DIR}/propname_data.h
    ${private_src_DIR}/propname.h
    ${private_src_DIR}/propsvec.h
    ${private_src_DIR}/punycode.h
    ${private_src_DIR}/putilimp.h
    ${private_src_DIR}/rbbi_cache.h
    ${private_src_DIR}/rbbidata.h
    ${private_src_DIR}/rbbinode.h
    ${private_src_DIR}/rbbirb.h
    ${private_src_DIR}/rbbirpt.h
    ${private_src_DIR}/rbbiscan.h
    ${private_src_DIR}/rbbisetb.h
    ${private_src_DIR}/rbbitblb.h
    ${private_src_DIR}/resource.h
    ${private_src_DIR}/ruleiter.h
    ${private_src_DIR}/serv.h
    ${private_src_DIR}/servloc.h
    ${private_src_DIR}/servnotf.h
    ${private_src_DIR}/sharedobject.h
    ${private_src_DIR}/sprpimpl.h
    ${private_src_DIR}/uarrsort.h
    ${private_src_DIR}/uassert.h
    ${private_src_DIR}/ubidiimp.h
    ${private_src_DIR}/ubidi_props_data.h
    ${private_src_DIR}/ubidi_props.h
    ${private_src_DIR}/ubrkimpl.h
    ${private_src_DIR}/ucase.h
    ${private_src_DIR}/ucasemap_imp.h
    ${private_src_DIR}/ucase_props_data.h
    ${private_src_DIR}/uchar_props_data.h
    ${private_src_DIR}/ucln_cmn.h
    ${private_src_DIR}/ucln.h
    ${private_src_DIR}/ucln_imp.h
    ${private_src_DIR}/ucmndata.h
    ${private_src_DIR}/ucnv_bld.h
    ${private_src_DIR}/ucnv_cnv.h
    ${private_src_DIR}/ucnv_ext.h
    ${private_src_DIR}/ucnv_imp.h
    ${private_src_DIR}/ucnv_io.h
    ${private_src_DIR}/ucnvmbcs.h
    ${private_src_DIR}/ucol_data.h
    ${private_src_DIR}/ucol_swp.h
    ${private_src_DIR}/ucurrimp.h
    ${private_src_DIR}/udatamem.h
    ${private_src_DIR}/udataswp.h
    ${private_src_DIR}/uelement.h
    ${private_src_DIR}/uenumimp.h
    ${private_src_DIR}/uhash.h
    ${private_src_DIR}/uinvchar.h
    ${private_src_DIR}/ulist.h
    ${private_src_DIR}/ulocimp.h
    ${private_src_DIR}/umapfile.h
    ${private_src_DIR}/umutex.h
    ${private_src_DIR}/unifiedcache.h
    ${private_src_DIR}/unisetspan.h
    ${private_src_DIR}/unistrappender.h
    ${private_src_DIR}/unormimp.h
    ${private_src_DIR}/uposixdefs.h
    ${private_src_DIR}/uprops.h
    ${private_src_DIR}/uresdata.h
    ${private_src_DIR}/uresimp.h
    ${private_src_DIR}/ureslocs.h
    ${private_src_DIR}/usc_impl.h
    ${private_src_DIR}/uset_imp.h
    ${private_src_DIR}/ustr_cnv.h
    ${private_src_DIR}/ustrenum.h
    ${private_src_DIR}/ustrfmt.h
    ${private_src_DIR}/ustr_imp.h
    ${private_src_DIR}/util.h
    ${private_src_DIR}/utracimp.h
    ${private_src_DIR}/utrie2.h
    ${private_src_DIR}/utrie2_impl.h
    ${private_src_DIR}/utrie.h
    ${private_src_DIR}/utypeinfo.h
    ${private_src_DIR}/uvector.h
    ${private_src_DIR}/uvectr32.h
    ${private_src_DIR}/uvectr64.h
    ${private_src_DIR}/wintz.h

  PUBLIC
    ${public_src_DIR}/unicode/appendable.h
    ${public_src_DIR}/unicode/brkiter.h
    ${public_src_DIR}/unicode/bytestream.h
    ${public_src_DIR}/unicode/bytestriebuilder.h
    ${public_src_DIR}/unicode/bytestrie.h
    ${public_src_DIR}/unicode/caniter.h
    ${public_src_DIR}/unicode/casemap.h
    ${public_src_DIR}/unicode/char16ptr.h
    ${public_src_DIR}/unicode/chariter.h
    ${public_src_DIR}/unicode/dbbi.h
    ${public_src_DIR}/unicode/docmain.h
    ${public_src_DIR}/unicode/dtintrv.h
    ${public_src_DIR}/unicode/edits.h
    ${public_src_DIR}/unicode/enumset.h
    ${public_src_DIR}/unicode/errorcode.h
    ${public_src_DIR}/unicode/filteredbrk.h
    ${public_src_DIR}/unicode/icudataver.h
    ${public_src_DIR}/unicode/icuplug.h
    ${public_src_DIR}/unicode/idna.h
    ${public_src_DIR}/unicode/listformatter.h
    ${public_src_DIR}/unicode/localpointer.h
    ${public_src_DIR}/unicode/locdspnm.h
    ${public_src_DIR}/unicode/locid.h
    ${public_src_DIR}/unicode/messagepattern.h
    ${public_src_DIR}/unicode/normalizer2.h
    ${public_src_DIR}/unicode/normlzr.h
    ${public_src_DIR}/unicode/parseerr.h
    ${public_src_DIR}/unicode/parsepos.h
    ${public_src_DIR}/unicode/platform.h
    ${public_src_DIR}/unicode/ptypes.h
    ${public_src_DIR}/unicode/putil.h
    ${public_src_DIR}/unicode/rbbi.h
    ${public_src_DIR}/unicode/rep.h
    ${public_src_DIR}/unicode/resbund.h
    ${public_src_DIR}/unicode/schriter.h
    ${public_src_DIR}/unicode/simpleformatter.h
    ${public_src_DIR}/unicode/std_string.h
    ${public_src_DIR}/unicode/strenum.h
    ${public_src_DIR}/unicode/stringoptions.h
    ${public_src_DIR}/unicode/stringpiece.h
    ${public_src_DIR}/unicode/stringtriebuilder.h
    ${public_src_DIR}/unicode/symtable.h
    ${public_src_DIR}/unicode/ubidi.h
    ${public_src_DIR}/unicode/ubiditransform.h
    ${public_src_DIR}/unicode/ubrk.h
    ${public_src_DIR}/unicode/ucasemap.h
    ${public_src_DIR}/unicode/ucat.h
    ${public_src_DIR}/unicode/uchar.h
    ${public_src_DIR}/unicode/ucharstriebuilder.h
    ${public_src_DIR}/unicode/ucharstrie.h
    ${public_src_DIR}/unicode/uchriter.h
    ${public_src_DIR}/unicode/uclean.h
    ${public_src_DIR}/unicode/ucnv_cb.h
    ${public_src_DIR}/unicode/ucnv_err.h
    ${public_src_DIR}/unicode/ucnv.h
    ${public_src_DIR}/unicode/ucnvsel.h
    ${public_src_DIR}/unicode/uconfig.h
    ${public_src_DIR}/unicode/ucurr.h
    ${public_src_DIR}/unicode/udata.h
    ${public_src_DIR}/unicode/udisplaycontext.h
    ${public_src_DIR}/unicode/uenum.h
    ${public_src_DIR}/unicode/uidna.h
    ${public_src_DIR}/unicode/uiter.h
    ${public_src_DIR}/unicode/uldnames.h
    ${public_src_DIR}/unicode/ulistformatter.h
    ${public_src_DIR}/unicode/uloc.h
    ${public_src_DIR}/unicode/umachine.h
    ${public_src_DIR}/unicode/umisc.h
    ${public_src_DIR}/unicode/unifilt.h
    ${public_src_DIR}/unicode/unifunct.h
    ${public_src_DIR}/unicode/unimatch.h
    ${public_src_DIR}/unicode/uniset.h
    ${public_src_DIR}/unicode/unistr.h
    ${public_src_DIR}/unicode/unorm2.h
    ${public_src_DIR}/unicode/unorm.h
    ${public_src_DIR}/unicode/uobject.h
    ${public_src_DIR}/unicode/urename.h
    ${public_src_DIR}/unicode/urep.h
    ${public_src_DIR}/unicode/ures.h
    ${public_src_DIR}/unicode/uscript.h
    ${public_src_DIR}/unicode/uset.h
    ${public_src_DIR}/unicode/usetiter.h
    ${public_src_DIR}/unicode/ushape.h
    ${public_src_DIR}/unicode/usprep.h
    ${public_src_DIR}/unicode/ustring.h
    ${public_src_DIR}/unicode/ustringtrie.h
    ${public_src_DIR}/unicode/utext.h
    ${public_src_DIR}/unicode/utf16.h
    ${public_src_DIR}/unicode/utf32.h
    ${public_src_DIR}/unicode/utf8.h
    ${public_src_DIR}/unicode/utf.h
    ${public_src_DIR}/unicode/utf_old.h
    ${public_src_DIR}/unicode/utrace.h
    ${public_src_DIR}/unicode/utypes.h
    ${public_src_DIR}/unicode/uvernum.h
    ${public_src_DIR}/unicode/uversion.h
)

if(WINDOWS_STORE)
  set_source_files_properties(
    ${private_src_DIR}/wintz.cpp
    PROPERTIES
      HEADER_FILE_ONLY ON
  )
endif()
