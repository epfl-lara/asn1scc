; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70922 () Bool)

(assert start!70922)

(declare-fun res!263377 () Bool)

(declare-fun e!230732 () Bool)

(assert (=> start!70922 (=> (not res!263377) (not e!230732))))

(declare-fun lt!444035 () (_ BitVec 64))

(assert (=> start!70922 (= res!263377 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444035))))

(declare-datatypes ((array!20202 0))(
  ( (array!20203 (arr!9898 (Array (_ BitVec 32) (_ BitVec 8))) (size!8806 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20202)

(assert (=> start!70922 (= lt!444035 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8806 a!440))))))

(assert (=> start!70922 e!230732))

(declare-fun array_inv!8358 (array!20202) Bool)

(assert (=> start!70922 (array_inv!8358 a!440)))

(declare-fun b!320593 () Bool)

(declare-fun arrayBitRangesEq!0 (array!20202 array!20202 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320593 (= e!230732 (not (arrayBitRangesEq!0 a!440 a!440 lt!444035 lt!444035)))))

(assert (= (and start!70922 res!263377) b!320593))

(declare-fun m!458965 () Bool)

(assert (=> start!70922 m!458965))

(declare-fun m!458967 () Bool)

(assert (=> b!320593 m!458967))

(push 1)

(assert (not b!320593))

(assert (not start!70922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!444061 () (_ BitVec 32))

(declare-fun call!6063 () Bool)

(declare-fun c!15371 () Bool)

(declare-fun lt!444060 () (_ BitVec 32))

(declare-fun bm!6060 () Bool)

(declare-datatypes ((tuple4!1338 0))(
  ( (tuple4!1339 (_1!13348 (_ BitVec 32)) (_2!13348 (_ BitVec 32)) (_3!1626 (_ BitVec 32)) (_4!669 (_ BitVec 32))) )
))
(declare-fun lt!444062 () tuple4!1338)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6060 (= call!6063 (byteRangesEq!0 (select (arr!9898 a!440) (_3!1626 lt!444062)) (select (arr!9898 a!440) (_3!1626 lt!444062)) lt!444061 (ite c!15371 lt!444060 #b00000000000000000000000000001000)))))

(declare-fun b!320642 () Bool)

(declare-fun e!230787 () Bool)

(declare-fun e!230789 () Bool)

(assert (=> b!320642 (= e!230787 e!230789)))

(declare-fun res!263414 () Bool)

(assert (=> b!320642 (= res!263414 call!6063)))

(assert (=> b!320642 (=> (not res!263414) (not e!230789))))

(declare-fun b!320643 () Bool)

(declare-fun e!230788 () Bool)

(declare-fun arrayRangesEq!1823 (array!20202 array!20202 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320643 (= e!230788 (arrayRangesEq!1823 a!440 a!440 (_1!13348 lt!444062) (_2!13348 lt!444062)))))

(declare-fun b!320644 () Bool)

(declare-fun res!263418 () Bool)

(assert (=> b!320644 (= res!263418 (= lt!444060 #b00000000000000000000000000000000))))

(declare-fun e!230784 () Bool)

(assert (=> b!320644 (=> res!263418 e!230784)))

(assert (=> b!320644 (= e!230789 e!230784)))

(declare-fun b!320646 () Bool)

(assert (=> b!320646 (= e!230784 (byteRangesEq!0 (select (arr!9898 a!440) (_4!669 lt!444062)) (select (arr!9898 a!440) (_4!669 lt!444062)) #b00000000000000000000000000000000 lt!444060))))

(declare-fun b!320649 () Bool)

(assert (=> b!320649 (= e!230787 call!6063)))

(declare-fun b!320651 () Bool)

(declare-fun e!230783 () Bool)

(declare-fun e!230782 () Bool)

(assert (=> b!320651 (= e!230783 e!230782)))

(declare-fun res!263421 () Bool)

(assert (=> b!320651 (=> (not res!263421) (not e!230782))))

(assert (=> b!320651 (= res!263421 e!230788)))

(declare-fun res!263420 () Bool)

(assert (=> b!320651 (=> res!263420 e!230788)))

(assert (=> b!320651 (= res!263420 (bvsge (_1!13348 lt!444062) (_2!13348 lt!444062)))))

(assert (=> b!320651 (= lt!444060 ((_ extract 31 0) (bvsrem lt!444035 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320651 (= lt!444061 ((_ extract 31 0) (bvsrem lt!444035 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1338)

(assert (=> b!320651 (= lt!444062 (arrayBitIndices!0 lt!444035 lt!444035))))

(declare-fun b!320647 () Bool)

(assert (=> b!320647 (= e!230782 e!230787)))

(assert (=> b!320647 (= c!15371 (= (_3!1626 lt!444062) (_4!669 lt!444062)))))

(declare-fun d!104980 () Bool)

(declare-fun res!263423 () Bool)

(assert (=> d!104980 (=> res!263423 e!230783)))

(assert (=> d!104980 (= res!263423 (bvsge lt!444035 lt!444035))))

(assert (=> d!104980 (= (arrayBitRangesEq!0 a!440 a!440 lt!444035 lt!444035) e!230783)))

(assert (= (and d!104980 (not res!263423)) b!320651))

(assert (= (and b!320651 (not res!263420)) b!320643))

(assert (= (and b!320651 res!263421) b!320647))

(assert (= (and b!320647 c!15371) b!320649))

(assert (= (and b!320647 (not c!15371)) b!320642))

(assert (= (and b!320642 res!263414) b!320644))

(assert (= (and b!320644 (not res!263418)) b!320646))

(assert (= (or b!320649 b!320642) bm!6060))

(declare-fun m!458977 () Bool)

(assert (=> bm!6060 m!458977))

(assert (=> bm!6060 m!458977))

(assert (=> bm!6060 m!458977))

(assert (=> bm!6060 m!458977))

(declare-fun m!458983 () Bool)

(assert (=> bm!6060 m!458983))

(declare-fun m!458987 () Bool)

(assert (=> b!320643 m!458987))

(declare-fun m!458991 () Bool)

(assert (=> b!320646 m!458991))

(assert (=> b!320646 m!458991))

(assert (=> b!320646 m!458991))

(assert (=> b!320646 m!458991))

(declare-fun m!458995 () Bool)

(assert (=> b!320646 m!458995))

(declare-fun m!458999 () Bool)

(assert (=> b!320651 m!458999))

(assert (=> b!320593 d!104980))

(declare-fun d!104988 () Bool)

(assert (=> d!104988 (= (array_inv!8358 a!440) (bvsge (size!8806 a!440) #b00000000000000000000000000000000))))

(assert (=> start!70922 d!104988))

(push 1)

