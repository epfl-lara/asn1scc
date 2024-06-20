; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70688 () Bool)

(assert start!70688)

(declare-datatypes ((Unit!21934 0))(
  ( (Unit!21935) )
))
(declare-fun lt!443720 () Unit!21934)

(declare-datatypes ((array!20047 0))(
  ( (array!20048 (arr!9827 (Array (_ BitVec 32) (_ BitVec 8))) (size!8735 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20047)

(declare-fun lt!443719 () (_ BitVec 64))

(declare-fun rec!17 (array!20047 (_ BitVec 64)) Unit!21934)

(assert (=> start!70688 (= lt!443720 (rec!17 a!422 lt!443719))))

(assert (=> start!70688 (= lt!443719 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8735 a!422))))))

(declare-fun arrayBitRangesEq!0 (array!20047 array!20047 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!70688 (not (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443719))))

(declare-fun array_inv!8287 (array!20047) Bool)

(assert (=> start!70688 (array_inv!8287 a!422)))

(declare-fun bs!27489 () Bool)

(assert (= bs!27489 start!70688))

(declare-fun m!458321 () Bool)

(assert (=> bs!27489 m!458321))

(declare-fun m!458323 () Bool)

(assert (=> bs!27489 m!458323))

(declare-fun m!458325 () Bool)

(assert (=> bs!27489 m!458325))

(check-sat (not start!70688))
(check-sat)
(get-model)

(declare-fun d!104802 () Bool)

(declare-fun e!230051 () Bool)

(assert (=> d!104802 e!230051))

(declare-fun res!262777 () Bool)

(assert (=> d!104802 (=> (not res!262777) (not e!230051))))

(declare-fun lt!443744 () (_ BitVec 64))

(assert (=> d!104802 (= res!262777 (or (= lt!443744 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!443744 #b0000000000000000000000000000000000000000000000000000000000001000) lt!443744))))))

(assert (=> d!104802 (= lt!443744 ((_ sign_extend 32) (size!8735 a!422)))))

(declare-fun lt!443743 () Unit!21934)

(declare-fun e!230052 () Unit!21934)

(assert (=> d!104802 (= lt!443743 e!230052)))

(declare-fun c!15322 () Bool)

(assert (=> d!104802 (= c!15322 (= lt!443719 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104802 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!443719) (bvsle lt!443719 (bvmul ((_ sign_extend 32) (size!8735 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!104802 (= (rec!17 a!422 lt!443719) lt!443743)))

(declare-fun b!319851 () Bool)

(declare-fun Unit!21938 () Unit!21934)

(assert (=> b!319851 (= e!230052 Unit!21938)))

(declare-fun b!319852 () Bool)

(assert (=> b!319852 (= e!230052 (rec!17 a!422 (bvsub lt!443719 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!319853 () Bool)

(assert (=> b!319853 (= e!230051 (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!8735 a!422)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!104802 c!15322) b!319851))

(assert (= (and d!104802 (not c!15322)) b!319852))

(assert (= (and d!104802 res!262777) b!319853))

(declare-fun m!458341 () Bool)

(assert (=> b!319852 m!458341))

(declare-fun m!458343 () Bool)

(assert (=> b!319853 m!458343))

(assert (=> start!70688 d!104802))

(declare-fun call!6032 () Bool)

(declare-datatypes ((tuple4!1320 0))(
  ( (tuple4!1321 (_1!13339 (_ BitVec 32)) (_2!13339 (_ BitVec 32)) (_3!1617 (_ BitVec 32)) (_4!660 (_ BitVec 32))) )
))
(declare-fun lt!443770 () tuple4!1320)

(declare-fun lt!443771 () (_ BitVec 32))

(declare-fun lt!443769 () (_ BitVec 32))

(declare-fun bm!6029 () Bool)

(declare-fun c!15331 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6029 (= call!6032 (byteRangesEq!0 (ite c!15331 (select (arr!9827 a!422) (_3!1617 lt!443770)) (select (arr!9827 a!422) (_4!660 lt!443770))) (ite c!15331 (select (arr!9827 a!422) (_3!1617 lt!443770)) (select (arr!9827 a!422) (_4!660 lt!443770))) (ite c!15331 lt!443771 #b00000000000000000000000000000000) lt!443769))))

(declare-fun b!319910 () Bool)

(declare-fun e!230101 () Bool)

(declare-fun e!230106 () Bool)

(assert (=> b!319910 (= e!230101 e!230106)))

(declare-fun res!262819 () Bool)

(assert (=> b!319910 (=> (not res!262819) (not e!230106))))

(declare-fun e!230105 () Bool)

(assert (=> b!319910 (= res!262819 e!230105)))

(declare-fun res!262820 () Bool)

(assert (=> b!319910 (=> res!262820 e!230105)))

(assert (=> b!319910 (= res!262820 (bvsge (_1!13339 lt!443770) (_2!13339 lt!443770)))))

(assert (=> b!319910 (= lt!443769 ((_ extract 31 0) (bvsrem lt!443719 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!319910 (= lt!443771 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1320)

(assert (=> b!319910 (= lt!443770 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443719))))

(declare-fun b!319911 () Bool)

(declare-fun e!230102 () Bool)

(declare-fun e!230103 () Bool)

(assert (=> b!319911 (= e!230102 e!230103)))

(declare-fun res!262821 () Bool)

(assert (=> b!319911 (= res!262821 (byteRangesEq!0 (select (arr!9827 a!422) (_3!1617 lt!443770)) (select (arr!9827 a!422) (_3!1617 lt!443770)) lt!443771 #b00000000000000000000000000001000))))

(assert (=> b!319911 (=> (not res!262821) (not e!230103))))

(declare-fun b!319912 () Bool)

(assert (=> b!319912 (= e!230102 call!6032)))

(declare-fun b!319913 () Bool)

(declare-fun res!262818 () Bool)

(assert (=> b!319913 (= res!262818 (= lt!443769 #b00000000000000000000000000000000))))

(declare-fun e!230104 () Bool)

(assert (=> b!319913 (=> res!262818 e!230104)))

(assert (=> b!319913 (= e!230103 e!230104)))

(declare-fun b!319914 () Bool)

(declare-fun arrayRangesEq!1816 (array!20047 array!20047 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319914 (= e!230105 (arrayRangesEq!1816 a!422 a!422 (_1!13339 lt!443770) (_2!13339 lt!443770)))))

(declare-fun b!319915 () Bool)

(assert (=> b!319915 (= e!230106 e!230102)))

(assert (=> b!319915 (= c!15331 (= (_3!1617 lt!443770) (_4!660 lt!443770)))))

(declare-fun b!319916 () Bool)

(assert (=> b!319916 (= e!230104 call!6032)))

(declare-fun d!104808 () Bool)

(declare-fun res!262822 () Bool)

(assert (=> d!104808 (=> res!262822 e!230101)))

(assert (=> d!104808 (= res!262822 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!443719))))

(assert (=> d!104808 (= (arrayBitRangesEq!0 a!422 a!422 #b0000000000000000000000000000000000000000000000000000000000000000 lt!443719) e!230101)))

(assert (= (and d!104808 (not res!262822)) b!319910))

(assert (= (and b!319910 (not res!262820)) b!319914))

(assert (= (and b!319910 res!262819) b!319915))

(assert (= (and b!319915 c!15331) b!319912))

(assert (= (and b!319915 (not c!15331)) b!319911))

(assert (= (and b!319911 res!262821) b!319913))

(assert (= (and b!319913 (not res!262818)) b!319916))

(assert (= (or b!319912 b!319916) bm!6029))

(declare-fun m!458349 () Bool)

(assert (=> bm!6029 m!458349))

(declare-fun m!458355 () Bool)

(assert (=> bm!6029 m!458355))

(assert (=> bm!6029 m!458349))

(declare-fun m!458361 () Bool)

(assert (=> bm!6029 m!458361))

(assert (=> bm!6029 m!458361))

(declare-fun m!458365 () Bool)

(assert (=> b!319910 m!458365))

(assert (=> b!319911 m!458349))

(assert (=> b!319911 m!458349))

(assert (=> b!319911 m!458349))

(assert (=> b!319911 m!458349))

(declare-fun m!458373 () Bool)

(assert (=> b!319911 m!458373))

(declare-fun m!458377 () Bool)

(assert (=> b!319914 m!458377))

(assert (=> start!70688 d!104808))

(declare-fun d!104812 () Bool)

(assert (=> d!104812 (= (array_inv!8287 a!422) (bvsge (size!8735 a!422) #b00000000000000000000000000000000))))

(assert (=> start!70688 d!104812))

(check-sat (not bm!6029) (not b!319910) (not b!319914) (not b!319852) (not b!319911) (not b!319853))
