; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70686 () Bool)

(assert start!70686)

(declare-datatypes ((Unit!21932 0))(
  ( (Unit!21933) )
))
(declare-fun lt!443714 () Unit!21932)

(declare-datatypes ((array!20045 0))(
  ( (array!20046 (arr!9826 (Array (_ BitVec 32) (_ BitVec 8))) (size!8734 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20045)

(declare-fun lt!443713 () (_ BitVec 64))

(declare-fun rec!17 (array!20045 (_ BitVec 64)) Unit!21932)

(assert (=> start!70686 (= lt!443714 (rec!17 a!422 lt!443713))))

(assert (=> start!70686 (= lt!443713 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8734 a!422))))))

(declare-fun arrayBitRangesEq!0 (array!20045 array!20045 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!70686 (not (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443713))))

(declare-fun array_inv!8286 (array!20045) Bool)

(assert (=> start!70686 (array_inv!8286 a!422)))

(declare-fun bs!27488 () Bool)

(assert (= bs!27488 start!70686))

(declare-fun m!458315 () Bool)

(assert (=> bs!27488 m!458315))

(declare-fun m!458317 () Bool)

(assert (=> bs!27488 m!458317))

(declare-fun m!458319 () Bool)

(assert (=> bs!27488 m!458319))

(push 1)

(assert (not start!70686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104798 () Bool)

(declare-fun e!230039 () Bool)

(assert (=> d!104798 e!230039))

(declare-fun res!262771 () Bool)

(assert (=> d!104798 (=> (not res!262771) (not e!230039))))

(declare-fun lt!443731 () (_ BitVec 64))

(assert (=> d!104798 (= res!262771 (or (= lt!443731 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!443731 #b0000000000000000000000000000000000000000000000000000000000001000) lt!443731))))))

(assert (=> d!104798 (= lt!443731 ((_ sign_extend 32) (size!8734 a!422)))))

(declare-fun lt!443732 () Unit!21932)

(declare-fun e!230040 () Unit!21932)

(assert (=> d!104798 (= lt!443732 e!230040)))

(declare-fun c!15316 () Bool)

(assert (=> d!104798 (= c!15316 (= lt!443713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104798 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!443713) (bvsle lt!443713 (bvmul ((_ sign_extend 32) (size!8734 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!104798 (= (rec!17 a!422 lt!443713) lt!443732)))

(declare-fun b!319833 () Bool)

(declare-fun Unit!21940 () Unit!21932)

(assert (=> b!319833 (= e!230040 Unit!21940)))

(declare-fun b!319834 () Bool)

(assert (=> b!319834 (= e!230040 (rec!17 a!422 (bvsub lt!443713 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!319835 () Bool)

(assert (=> b!319835 (= e!230039 (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!8734 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!104798 c!15316) b!319833))

(assert (= (and d!104798 (not c!15316)) b!319834))

(assert (= (and d!104798 res!262771) b!319835))

(declare-fun m!458333 () Bool)

(assert (=> b!319834 m!458333))

(declare-fun m!458335 () Bool)

(assert (=> b!319835 m!458335))

(assert (=> start!70686 d!104798))

(declare-fun b!319903 () Bool)

(declare-fun e!230100 () Bool)

(declare-fun call!6031 () Bool)

(assert (=> b!319903 (= e!230100 call!6031)))

(declare-fun b!319904 () Bool)

(declare-fun e!230096 () Bool)

(assert (=> b!319904 (= e!230100 e!230096)))

(declare-fun res!262814 () Bool)

(assert (=> b!319904 (= res!262814 call!6031)))

(assert (=> b!319904 (=> (not res!262814) (not e!230096))))

(declare-fun b!319905 () Bool)

(declare-fun e!230099 () Bool)

(declare-datatypes ((tuple4!1324 0))(
  ( (tuple4!1325 (_1!13341 (_ BitVec 32)) (_2!13341 (_ BitVec 32)) (_3!1619 (_ BitVec 32)) (_4!662 (_ BitVec 32))) )
))
(declare-fun lt!443767 () tuple4!1324)

(declare-fun arrayRangesEq!1814 (array!20045 array!20045 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319905 (= e!230099 (arrayRangesEq!1814 a!422 a!422 (_1!13341 lt!443767) (_2!13341 lt!443767)))))

(declare-fun lt!443768 () (_ BitVec 32))

(declare-fun c!15330 () Bool)

(declare-fun bm!6028 () Bool)

(declare-fun lt!443766 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6028 (= call!6031 (byteRangesEq!0 (select (arr!9826 a!422) (_3!1619 lt!443767)) (select (arr!9826 a!422) (_3!1619 lt!443767)) lt!443768 (ite c!15330 lt!443766 #b00000000000000000000000000001000)))))

(declare-fun b!319907 () Bool)

(declare-fun res!262813 () Bool)

(assert (=> b!319907 (= res!262813 (= lt!443766 #b00000000000000000000000000000000))))

(declare-fun e!230097 () Bool)

(assert (=> b!319907 (=> res!262813 e!230097)))

(assert (=> b!319907 (= e!230096 e!230097)))

(declare-fun b!319908 () Bool)

(declare-fun e!230095 () Bool)

(declare-fun e!230098 () Bool)

(assert (=> b!319908 (= e!230095 e!230098)))

(declare-fun res!262816 () Bool)

(assert (=> b!319908 (=> (not res!262816) (not e!230098))))

(assert (=> b!319908 (= res!262816 e!230099)))

(declare-fun res!262817 () Bool)

(assert (=> b!319908 (=> res!262817 e!230099)))

(assert (=> b!319908 (= res!262817 (bvsge (_1!13341 lt!443767) (_2!13341 lt!443767)))))

(assert (=> b!319908 (= lt!443766 ((_ extract 31 0) (bvsrem lt!443713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!319908 (= lt!443768 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1324)

(assert (=> b!319908 (= lt!443767 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443713))))

(declare-fun b!319909 () Bool)

(assert (=> b!319909 (= e!230097 (byteRangesEq!0 (select (arr!9826 a!422) (_4!662 lt!443767)) (select (arr!9826 a!422) (_4!662 lt!443767)) #b00000000000000000000000000000000 lt!443766))))

(declare-fun b!319906 () Bool)

(assert (=> b!319906 (= e!230098 e!230100)))

(assert (=> b!319906 (= c!15330 (= (_3!1619 lt!443767) (_4!662 lt!443767)))))

(declare-fun d!104804 () Bool)

(declare-fun res!262815 () Bool)

(assert (=> d!104804 (=> res!262815 e!230095)))

(assert (=> d!104804 (= res!262815 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!443713))))

(assert (=> d!104804 (= (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443713) e!230095)))

(assert (= (and d!104804 (not res!262815)) b!319908))

(assert (= (and b!319908 (not res!262817)) b!319905))

(assert (= (and b!319908 res!262816) b!319906))

(assert (= (and b!319906 c!15330) b!319903))

(assert (= (and b!319906 (not c!15330)) b!319904))

(assert (= (and b!319904 res!262814) b!319907))

(assert (= (and b!319907 (not res!262813)) b!319909))

(assert (= (or b!319903 b!319904) bm!6028))

(declare-fun m!458353 () Bool)

(assert (=> b!319905 m!458353))

(declare-fun m!458357 () Bool)

(assert (=> bm!6028 m!458357))

(assert (=> bm!6028 m!458357))

(assert (=> bm!6028 m!458357))

(assert (=> bm!6028 m!458357))

(declare-fun m!458369 () Bool)

(assert (=> bm!6028 m!458369))

(declare-fun m!458371 () Bool)

(assert (=> b!319908 m!458371))

(declare-fun m!458375 () Bool)

(assert (=> b!319909 m!458375))

(assert (=> b!319909 m!458375))

(assert (=> b!319909 m!458375))

(assert (=> b!319909 m!458375))

(declare-fun m!458379 () Bool)

(assert (=> b!319909 m!458379))

(assert (=> start!70686 d!104804))

(declare-fun d!104814 () Bool)

(assert (=> d!104814 (= (array_inv!8286 a!422) (bvsge (size!8734 a!422) #b00000000000000000000000000000000))))

(assert (=> start!70686 d!104814))

(push 1)

(assert (not b!319905))

(assert (not b!319908))

(assert (not b!319909))

(assert (not b!319835))

(assert (not b!319834))

(assert (not bm!6028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

