; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67926 () Bool)

(assert start!67926)

(declare-fun b!304843 () Bool)

(declare-fun res!250699 () Bool)

(declare-fun lt!438592 () (_ BitVec 32))

(assert (=> b!304843 (= res!250699 (= lt!438592 #b00000000000000000000000000000000))))

(declare-fun e!219501 () Bool)

(assert (=> b!304843 (=> res!250699 e!219501)))

(declare-fun e!219502 () Bool)

(assert (=> b!304843 (= e!219502 e!219501)))

(declare-fun b!304844 () Bool)

(declare-fun e!219503 () Bool)

(assert (=> b!304844 (= e!219503 e!219502)))

(declare-fun lt!438594 () (_ BitVec 32))

(declare-datatypes ((array!18515 0))(
  ( (array!18516 (arr!9112 (Array (_ BitVec 32) (_ BitVec 8))) (size!8029 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18515)

(declare-datatypes ((tuple4!1200 0))(
  ( (tuple4!1201 (_1!13255 (_ BitVec 32)) (_2!13255 (_ BitVec 32)) (_3!1557 (_ BitVec 32)) (_4!600 (_ BitVec 32))) )
))
(declare-fun lt!438590 () tuple4!1200)

(declare-fun a2!948 () array!18515)

(declare-fun res!250701 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304844 (= res!250701 (byteRangesEq!0 (select (arr!9112 a1!948) (_3!1557 lt!438590)) (select (arr!9112 a2!948) (_3!1557 lt!438590)) lt!438594 #b00000000000000000000000000000111))))

(assert (=> b!304844 (=> (not res!250701) (not e!219502))))

(declare-fun b!304845 () Bool)

(declare-datatypes ((Unit!21271 0))(
  ( (Unit!21272) )
))
(declare-fun e!219504 () Unit!21271)

(declare-fun Unit!21273 () Unit!21271)

(assert (=> b!304845 (= e!219504 Unit!21273)))

(declare-fun b!304846 () Bool)

(declare-fun lt!438589 () Unit!21271)

(assert (=> b!304846 (= e!219504 lt!438589)))

(declare-fun lt!438591 () tuple4!1200)

(declare-fun arrayRangesEqSlicedLemma!253 (array!18515 array!18515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21271)

(assert (=> b!304846 (= lt!438589 (arrayRangesEqSlicedLemma!253 a1!948 a2!948 (_1!13255 lt!438590) (_2!13255 lt!438590) (_1!13255 lt!438591) (_2!13255 lt!438591)))))

(declare-fun arrayRangesEq!1658 (array!18515 array!18515 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304846 (arrayRangesEq!1658 a1!948 a2!948 (_1!13255 lt!438591) (_2!13255 lt!438591))))

(declare-fun b!304847 () Bool)

(declare-fun e!219500 () Bool)

(assert (=> b!304847 (= e!219500 false)))

(declare-fun lt!438596 () Unit!21271)

(declare-fun e!219499 () Unit!21271)

(assert (=> b!304847 (= lt!438596 e!219499)))

(declare-fun c!14657 () Bool)

(assert (=> b!304847 (= c!14657 (and (bvslt (_3!1557 lt!438590) (_3!1557 lt!438591)) (bvslt (_3!1557 lt!438591) (_4!600 lt!438590))))))

(declare-fun b!304848 () Bool)

(declare-fun call!5705 () Bool)

(assert (=> b!304848 (= e!219503 call!5705)))

(declare-fun b!304849 () Bool)

(declare-fun Unit!21274 () Unit!21271)

(assert (=> b!304849 (= e!219499 Unit!21274)))

(declare-fun b!304850 () Bool)

(declare-fun e!219506 () Bool)

(assert (=> b!304850 (= e!219506 e!219500)))

(declare-fun res!250698 () Bool)

(assert (=> b!304850 (=> (not res!250698) (not e!219500))))

(assert (=> b!304850 (= res!250698 e!219503)))

(declare-fun c!14658 () Bool)

(assert (=> b!304850 (= c!14658 (= (_3!1557 lt!438590) (_4!600 lt!438590)))))

(declare-fun lt!438593 () Unit!21271)

(assert (=> b!304850 (= lt!438593 e!219504)))

(declare-fun c!14656 () Bool)

(assert (=> b!304850 (= c!14656 (bvslt (_1!13255 lt!438591) (_2!13255 lt!438591)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1200)

(assert (=> b!304850 (= lt!438591 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!304850 (= lt!438592 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!304850 (= lt!438594 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304850 (= lt!438590 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304851 () Bool)

(declare-fun e!219505 () Bool)

(assert (=> b!304851 (= e!219505 e!219506)))

(declare-fun res!250695 () Bool)

(assert (=> b!304851 (=> (not res!250695) (not e!219506))))

(declare-fun lt!438597 () (_ BitVec 64))

(assert (=> b!304851 (= res!250695 (and (bvsle toBit!258 lt!438597) (bvsle fromBit!258 lt!438597)))))

(assert (=> b!304851 (= lt!438597 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8029 a1!948))))))

(declare-fun b!304852 () Bool)

(declare-fun res!250696 () Bool)

(assert (=> b!304852 (=> (not res!250696) (not e!219506))))

(assert (=> b!304852 (= res!250696 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438597) (not (= fromSlice!52 toSlice!52))))))

(declare-fun bm!5702 () Bool)

(assert (=> bm!5702 (= call!5705 (byteRangesEq!0 (ite c!14658 (select (arr!9112 a1!948) (_3!1557 lt!438590)) (select (arr!9112 a1!948) (_4!600 lt!438590))) (ite c!14658 (select (arr!9112 a2!948) (_3!1557 lt!438590)) (select (arr!9112 a2!948) (_4!600 lt!438590))) (ite c!14658 lt!438594 #b00000000000000000000000000000000) lt!438592))))

(declare-fun b!304853 () Bool)

(declare-fun lt!438595 () Unit!21271)

(assert (=> b!304853 (= e!219499 lt!438595)))

(declare-fun arrayRangesEqImpliesEq!262 (array!18515 array!18515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21271)

(assert (=> b!304853 (= lt!438595 (arrayRangesEqImpliesEq!262 a1!948 a2!948 (_1!13255 lt!438590) (_3!1557 lt!438591) (_2!13255 lt!438590)))))

(assert (=> b!304853 (= (select (arr!9112 a1!948) (_3!1557 lt!438591)) (select (arr!9112 a2!948) (_3!1557 lt!438591)))))

(declare-fun b!304854 () Bool)

(declare-fun res!250700 () Bool)

(assert (=> b!304854 (=> (not res!250700) (not e!219506))))

(declare-fun arrayBitRangesEq!0 (array!18515 array!18515 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304854 (= res!250700 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!250697 () Bool)

(assert (=> start!67926 (=> (not res!250697) (not e!219505))))

(assert (=> start!67926 (= res!250697 (and (bvsle (size!8029 a1!948) (size!8029 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67926 e!219505))

(assert (=> start!67926 true))

(declare-fun array_inv!7641 (array!18515) Bool)

(assert (=> start!67926 (array_inv!7641 a1!948)))

(assert (=> start!67926 (array_inv!7641 a2!948)))

(declare-fun b!304855 () Bool)

(assert (=> b!304855 (= e!219501 call!5705)))

(assert (= (and start!67926 res!250697) b!304851))

(assert (= (and b!304851 res!250695) b!304854))

(assert (= (and b!304854 res!250700) b!304852))

(assert (= (and b!304852 res!250696) b!304850))

(assert (= (and b!304850 c!14656) b!304846))

(assert (= (and b!304850 (not c!14656)) b!304845))

(assert (= (and b!304850 c!14658) b!304848))

(assert (= (and b!304850 (not c!14658)) b!304844))

(assert (= (and b!304844 res!250701) b!304843))

(assert (= (and b!304843 (not res!250699)) b!304855))

(assert (= (or b!304848 b!304855) bm!5702))

(assert (= (and b!304850 res!250698) b!304847))

(assert (= (and b!304847 c!14657) b!304853))

(assert (= (and b!304847 (not c!14657)) b!304849))

(declare-fun m!443331 () Bool)

(assert (=> bm!5702 m!443331))

(declare-fun m!443333 () Bool)

(assert (=> bm!5702 m!443333))

(declare-fun m!443335 () Bool)

(assert (=> bm!5702 m!443335))

(declare-fun m!443337 () Bool)

(assert (=> bm!5702 m!443337))

(declare-fun m!443339 () Bool)

(assert (=> bm!5702 m!443339))

(declare-fun m!443341 () Bool)

(assert (=> b!304850 m!443341))

(declare-fun m!443343 () Bool)

(assert (=> b!304850 m!443343))

(declare-fun m!443345 () Bool)

(assert (=> start!67926 m!443345))

(declare-fun m!443347 () Bool)

(assert (=> start!67926 m!443347))

(declare-fun m!443349 () Bool)

(assert (=> b!304853 m!443349))

(declare-fun m!443351 () Bool)

(assert (=> b!304853 m!443351))

(declare-fun m!443353 () Bool)

(assert (=> b!304853 m!443353))

(declare-fun m!443355 () Bool)

(assert (=> b!304846 m!443355))

(declare-fun m!443357 () Bool)

(assert (=> b!304846 m!443357))

(assert (=> b!304844 m!443335))

(assert (=> b!304844 m!443331))

(assert (=> b!304844 m!443335))

(assert (=> b!304844 m!443331))

(declare-fun m!443359 () Bool)

(assert (=> b!304844 m!443359))

(declare-fun m!443361 () Bool)

(assert (=> b!304854 m!443361))

(push 1)

(assert (not start!67926))

(assert (not b!304853))

(assert (not b!304850))

(assert (not bm!5702))

(assert (not b!304844))

(assert (not b!304846))

(assert (not b!304854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

