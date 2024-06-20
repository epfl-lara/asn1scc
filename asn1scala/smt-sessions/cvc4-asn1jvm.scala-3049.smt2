; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70690 () Bool)

(assert start!70690)

(declare-datatypes ((Unit!21936 0))(
  ( (Unit!21937) )
))
(declare-fun lt!443726 () Unit!21936)

(declare-datatypes ((array!20049 0))(
  ( (array!20050 (arr!9828 (Array (_ BitVec 32) (_ BitVec 8))) (size!8736 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20049)

(declare-fun lt!443725 () (_ BitVec 64))

(declare-fun rec!17 (array!20049 (_ BitVec 64)) Unit!21936)

(assert (=> start!70690 (= lt!443726 (rec!17 a!422 lt!443725))))

(assert (=> start!70690 (= lt!443725 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8736 a!422))))))

(declare-fun arrayBitRangesEq!0 (array!20049 array!20049 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!70690 (not (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443725))))

(declare-fun array_inv!8288 (array!20049) Bool)

(assert (=> start!70690 (array_inv!8288 a!422)))

(declare-fun bs!27490 () Bool)

(assert (= bs!27490 start!70690))

(declare-fun m!458327 () Bool)

(assert (=> bs!27490 m!458327))

(declare-fun m!458329 () Bool)

(assert (=> bs!27490 m!458329))

(declare-fun m!458331 () Bool)

(assert (=> bs!27490 m!458331))

(push 1)

(assert (not start!70690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104800 () Bool)

(declare-fun e!230049 () Bool)

(assert (=> d!104800 e!230049))

(declare-fun res!262776 () Bool)

(assert (=> d!104800 (=> (not res!262776) (not e!230049))))

(declare-fun lt!443741 () (_ BitVec 64))

(assert (=> d!104800 (= res!262776 (or (= lt!443741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!443741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!443741))))))

(assert (=> d!104800 (= lt!443741 ((_ sign_extend 32) (size!8736 a!422)))))

(declare-fun lt!443742 () Unit!21936)

(declare-fun e!230050 () Unit!21936)

(assert (=> d!104800 (= lt!443742 e!230050)))

(declare-fun c!15321 () Bool)

(assert (=> d!104800 (= c!15321 (= lt!443725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!443725) (bvsle lt!443725 (bvmul ((_ sign_extend 32) (size!8736 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!104800 (= (rec!17 a!422 lt!443725) lt!443742)))

(declare-fun b!319848 () Bool)

(declare-fun Unit!21939 () Unit!21936)

(assert (=> b!319848 (= e!230050 Unit!21939)))

(declare-fun b!319849 () Bool)

(assert (=> b!319849 (= e!230050 (rec!17 a!422 (bvsub lt!443725 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!319850 () Bool)

(assert (=> b!319850 (= e!230049 (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!8736 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!104800 c!15321) b!319848))

(assert (= (and d!104800 (not c!15321)) b!319849))

(assert (= (and d!104800 res!262776) b!319850))

(declare-fun m!458337 () Bool)

(assert (=> b!319849 m!458337))

(declare-fun m!458339 () Bool)

(assert (=> b!319850 m!458339))

(assert (=> start!70690 d!104800))

(declare-fun b!319896 () Bool)

(declare-fun e!230093 () Bool)

(declare-fun e!230094 () Bool)

(assert (=> b!319896 (= e!230093 e!230094)))

(declare-fun res!262811 () Bool)

(declare-datatypes ((tuple4!1322 0))(
  ( (tuple4!1323 (_1!13340 (_ BitVec 32)) (_2!13340 (_ BitVec 32)) (_3!1618 (_ BitVec 32)) (_4!661 (_ BitVec 32))) )
))
(declare-fun lt!443763 () tuple4!1322)

(declare-fun lt!443764 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319896 (= res!262811 (byteRangesEq!0 (select (arr!9828 a!422) (_3!1618 lt!443763)) (select (arr!9828 a!422) (_3!1618 lt!443763)) lt!443764 #b00000000000000000000000000001000))))

(assert (=> b!319896 (=> (not res!262811) (not e!230094))))

(declare-fun b!319897 () Bool)

(declare-fun e!230092 () Bool)

(declare-fun arrayRangesEq!1815 (array!20049 array!20049 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319897 (= e!230092 (arrayRangesEq!1815 a!422 a!422 (_1!13340 lt!443763) (_2!13340 lt!443763)))))

(declare-fun c!15329 () Bool)

(declare-fun bm!6027 () Bool)

(declare-fun lt!443765 () (_ BitVec 32))

(declare-fun call!6030 () Bool)

(assert (=> bm!6027 (= call!6030 (byteRangesEq!0 (ite c!15329 (select (arr!9828 a!422) (_3!1618 lt!443763)) (select (arr!9828 a!422) (_4!661 lt!443763))) (ite c!15329 (select (arr!9828 a!422) (_3!1618 lt!443763)) (select (arr!9828 a!422) (_4!661 lt!443763))) (ite c!15329 lt!443764 #b00000000000000000000000000000000) lt!443765))))

(declare-fun b!319898 () Bool)

(declare-fun e!230089 () Bool)

(assert (=> b!319898 (= e!230089 call!6030)))

(declare-fun b!319899 () Bool)

(assert (=> b!319899 (= e!230093 call!6030)))

(declare-fun b!319900 () Bool)

(declare-fun res!262808 () Bool)

(assert (=> b!319900 (= res!262808 (= lt!443765 #b00000000000000000000000000000000))))

(assert (=> b!319900 (=> res!262808 e!230089)))

(assert (=> b!319900 (= e!230094 e!230089)))

(declare-fun b!319901 () Bool)

(declare-fun e!230091 () Bool)

(assert (=> b!319901 (= e!230091 e!230093)))

(assert (=> b!319901 (= c!15329 (= (_3!1618 lt!443763) (_4!661 lt!443763)))))

(declare-fun b!319902 () Bool)

(declare-fun e!230090 () Bool)

(assert (=> b!319902 (= e!230090 e!230091)))

(declare-fun res!262810 () Bool)

(assert (=> b!319902 (=> (not res!262810) (not e!230091))))

(assert (=> b!319902 (= res!262810 e!230092)))

(declare-fun res!262812 () Bool)

(assert (=> b!319902 (=> res!262812 e!230092)))

(assert (=> b!319902 (= res!262812 (bvsge (_1!13340 lt!443763) (_2!13340 lt!443763)))))

(assert (=> b!319902 (= lt!443765 ((_ extract 31 0) (bvsrem lt!443725 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!319902 (= lt!443764 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1322)

(assert (=> b!319902 (= lt!443763 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443725))))

(declare-fun d!104806 () Bool)

(declare-fun res!262809 () Bool)

(assert (=> d!104806 (=> res!262809 e!230090)))

(assert (=> d!104806 (= res!262809 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!443725))))

(assert (=> d!104806 (= (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443725) e!230090)))

(assert (= (and d!104806 (not res!262809)) b!319902))

(assert (= (and b!319902 (not res!262812)) b!319897))

(assert (= (and b!319902 res!262810) b!319901))

(assert (= (and b!319901 c!15329) b!319899))

(assert (= (and b!319901 (not c!15329)) b!319896))

(assert (= (and b!319896 res!262811) b!319900))

(assert (= (and b!319900 (not res!262808)) b!319898))

(assert (= (or b!319899 b!319898) bm!6027))

(declare-fun m!458345 () Bool)

(assert (=> b!319896 m!458345))

(assert (=> b!319896 m!458345))

(assert (=> b!319896 m!458345))

(assert (=> b!319896 m!458345))

(declare-fun m!458347 () Bool)

(assert (=> b!319896 m!458347))

(declare-fun m!458351 () Bool)

(assert (=> b!319897 m!458351))

(assert (=> bm!6027 m!458345))

(declare-fun m!458359 () Bool)

(assert (=> bm!6027 m!458359))

(declare-fun m!458363 () Bool)

(assert (=> bm!6027 m!458363))

(assert (=> bm!6027 m!458345))

(assert (=> bm!6027 m!458363))

(declare-fun m!458367 () Bool)

(assert (=> b!319902 m!458367))

(assert (=> start!70690 d!104806))

(declare-fun d!104810 () Bool)

(assert (=> d!104810 (= (array_inv!8288 a!422) (bvsge (size!8736 a!422) #b00000000000000000000000000000000))))

(assert (=> start!70690 d!104810))

(push 1)

(assert (not bm!6027))

(assert (not b!319897))

(assert (not b!319850))

(assert (not b!319902))

(assert (not b!319849))

(assert (not b!319896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

