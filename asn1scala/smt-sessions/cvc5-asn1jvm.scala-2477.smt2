; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63090 () Bool)

(assert start!63090)

(declare-fun res!234219 () Bool)

(declare-fun e!201703 () Bool)

(assert (=> start!63090 (=> (not res!234219) (not e!201703))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16300 0))(
  ( (array!16301 (arr!8032 (Array (_ BitVec 32) (_ BitVec 8))) (size!7036 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16300)

(declare-fun a2!699 () array!16300)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!63090 (= res!234219 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7036 a1!699) (size!7036 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7036 a1!699))))))))

(assert (=> start!63090 e!201703))

(assert (=> start!63090 true))

(declare-fun array_inv!6760 (array!16300) Bool)

(assert (=> start!63090 (array_inv!6760 a1!699)))

(assert (=> start!63090 (array_inv!6760 a2!699)))

(declare-fun b!282326 () Bool)

(declare-fun res!234221 () Bool)

(assert (=> b!282326 (=> (not res!234221) (not e!201703))))

(declare-fun arrayBitRangesEq!0 (array!16300 array!16300 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!282326 (= res!234221 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!282327 () Bool)

(declare-fun res!234220 () Bool)

(assert (=> b!282327 (=> (not res!234220) (not e!201703))))

(assert (=> b!282327 (= res!234220 (bvsge from!822 to!789))))

(declare-fun b!282328 () Bool)

(assert (=> b!282328 (= e!201703 (not (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789)))))

(assert (= (and start!63090 res!234219) b!282326))

(assert (= (and b!282326 res!234221) b!282327))

(assert (= (and b!282327 res!234220) b!282328))

(declare-fun m!415455 () Bool)

(assert (=> start!63090 m!415455))

(declare-fun m!415457 () Bool)

(assert (=> start!63090 m!415457))

(declare-fun m!415459 () Bool)

(assert (=> b!282326 m!415459))

(declare-fun m!415461 () Bool)

(assert (=> b!282328 m!415461))

(push 1)

(assert (not b!282328))

(assert (not start!63090))

(assert (not b!282326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!282417 () Bool)

(declare-fun e!201787 () Bool)

(declare-fun e!201789 () Bool)

(assert (=> b!282417 (= e!201787 e!201789)))

(declare-fun res!234291 () Bool)

(declare-fun call!4753 () Bool)

(assert (=> b!282417 (= res!234291 call!4753)))

(assert (=> b!282417 (=> (not res!234291) (not e!201789))))

(declare-fun b!282418 () Bool)

(declare-fun e!201788 () Bool)

(declare-fun e!201785 () Bool)

(assert (=> b!282418 (= e!201788 e!201785)))

(declare-fun res!234292 () Bool)

(assert (=> b!282418 (=> (not res!234292) (not e!201785))))

(declare-fun e!201786 () Bool)

(assert (=> b!282418 (= res!234292 e!201786)))

(declare-fun res!234294 () Bool)

(assert (=> b!282418 (=> res!234294 e!201786)))

(declare-datatypes ((tuple4!826 0))(
  ( (tuple4!827 (_1!12488 (_ BitVec 32)) (_2!12488 (_ BitVec 32)) (_3!1193 (_ BitVec 32)) (_4!413 (_ BitVec 32))) )
))
(declare-fun lt!417770 () tuple4!826)

(assert (=> b!282418 (= res!234294 (bvsge (_1!12488 lt!417770) (_2!12488 lt!417770)))))

(declare-fun lt!417771 () (_ BitVec 32))

(assert (=> b!282418 (= lt!417771 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417769 () (_ BitVec 32))

(assert (=> b!282418 (= lt!417769 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!826)

(assert (=> b!282418 (= lt!417770 (arrayBitIndices!0 from!822 to!789))))

(declare-fun d!97154 () Bool)

(declare-fun res!234293 () Bool)

(assert (=> d!97154 (=> res!234293 e!201788)))

(assert (=> d!97154 (= res!234293 (bvsge from!822 to!789))))

(assert (=> d!97154 (= (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789) e!201788)))

(declare-fun b!282419 () Bool)

(declare-fun arrayRangesEq!1305 (array!16300 array!16300 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282419 (= e!201786 (arrayRangesEq!1305 a2!699 a1!699 (_1!12488 lt!417770) (_2!12488 lt!417770)))))

(declare-fun b!282420 () Bool)

(assert (=> b!282420 (= e!201787 call!4753)))

(declare-fun b!282421 () Bool)

(declare-fun res!234290 () Bool)

(assert (=> b!282421 (= res!234290 (= lt!417771 #b00000000000000000000000000000000))))

(declare-fun e!201784 () Bool)

(assert (=> b!282421 (=> res!234290 e!201784)))

(assert (=> b!282421 (= e!201789 e!201784)))

(declare-fun b!282422 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282422 (= e!201784 (byteRangesEq!0 (select (arr!8032 a2!699) (_4!413 lt!417770)) (select (arr!8032 a1!699) (_4!413 lt!417770)) #b00000000000000000000000000000000 lt!417771))))

(declare-fun b!282423 () Bool)

(assert (=> b!282423 (= e!201785 e!201787)))

(declare-fun c!13235 () Bool)

(assert (=> b!282423 (= c!13235 (= (_3!1193 lt!417770) (_4!413 lt!417770)))))

(declare-fun bm!4750 () Bool)

(assert (=> bm!4750 (= call!4753 (byteRangesEq!0 (select (arr!8032 a2!699) (_3!1193 lt!417770)) (select (arr!8032 a1!699) (_3!1193 lt!417770)) lt!417769 (ite c!13235 lt!417771 #b00000000000000000000000000001000)))))

(assert (= (and d!97154 (not res!234293)) b!282418))

(assert (= (and b!282418 (not res!234294)) b!282419))

(assert (= (and b!282418 res!234292) b!282423))

(assert (= (and b!282423 c!13235) b!282420))

(assert (= (and b!282423 (not c!13235)) b!282417))

(assert (= (and b!282417 res!234291) b!282421))

(assert (= (and b!282421 (not res!234290)) b!282422))

(assert (= (or b!282420 b!282417) bm!4750))

(declare-fun m!415539 () Bool)

(assert (=> b!282418 m!415539))

(declare-fun m!415541 () Bool)

(assert (=> b!282419 m!415541))

(declare-fun m!415543 () Bool)

(assert (=> b!282422 m!415543))

(declare-fun m!415545 () Bool)

(assert (=> b!282422 m!415545))

(assert (=> b!282422 m!415543))

(assert (=> b!282422 m!415545))

(declare-fun m!415547 () Bool)

(assert (=> b!282422 m!415547))

(declare-fun m!415549 () Bool)

(assert (=> bm!4750 m!415549))

(declare-fun m!415551 () Bool)

(assert (=> bm!4750 m!415551))

(assert (=> bm!4750 m!415549))

(assert (=> bm!4750 m!415551))

(declare-fun m!415553 () Bool)

(assert (=> bm!4750 m!415553))

(assert (=> b!282328 d!97154))

(declare-fun d!97170 () Bool)

(assert (=> d!97170 (= (array_inv!6760 a1!699) (bvsge (size!7036 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!63090 d!97170))

(declare-fun d!97172 () Bool)

(assert (=> d!97172 (= (array_inv!6760 a2!699) (bvsge (size!7036 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!63090 d!97172))

(declare-fun b!282424 () Bool)

(declare-fun e!201793 () Bool)

(declare-fun e!201795 () Bool)

(assert (=> b!282424 (= e!201793 e!201795)))

(declare-fun res!234296 () Bool)

(declare-fun call!4754 () Bool)

(assert (=> b!282424 (= res!234296 call!4754)))

(assert (=> b!282424 (=> (not res!234296) (not e!201795))))

(declare-fun b!282425 () Bool)

(declare-fun e!201794 () Bool)

(declare-fun e!201791 () Bool)

(assert (=> b!282425 (= e!201794 e!201791)))

(declare-fun res!234297 () Bool)

(assert (=> b!282425 (=> (not res!234297) (not e!201791))))

(declare-fun e!201792 () Bool)

(assert (=> b!282425 (= res!234297 e!201792)))

(declare-fun res!234299 () Bool)

(assert (=> b!282425 (=> res!234299 e!201792)))

(declare-fun lt!417773 () tuple4!826)

(assert (=> b!282425 (= res!234299 (bvsge (_1!12488 lt!417773) (_2!12488 lt!417773)))))

(declare-fun lt!417774 () (_ BitVec 32))

(assert (=> b!282425 (= lt!417774 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417772 () (_ BitVec 32))

(assert (=> b!282425 (= lt!417772 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!282425 (= lt!417773 (arrayBitIndices!0 from!822 to!789))))

(declare-fun d!97174 () Bool)

(declare-fun res!234298 () Bool)

(assert (=> d!97174 (=> res!234298 e!201794)))

(assert (=> d!97174 (= res!234298 (bvsge from!822 to!789))))

(assert (=> d!97174 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201794)))

(declare-fun b!282426 () Bool)

(assert (=> b!282426 (= e!201792 (arrayRangesEq!1305 a1!699 a2!699 (_1!12488 lt!417773) (_2!12488 lt!417773)))))

(declare-fun b!282427 () Bool)

(assert (=> b!282427 (= e!201793 call!4754)))

(declare-fun b!282428 () Bool)

(declare-fun res!234295 () Bool)

(assert (=> b!282428 (= res!234295 (= lt!417774 #b00000000000000000000000000000000))))

(declare-fun e!201790 () Bool)

(assert (=> b!282428 (=> res!234295 e!201790)))

(assert (=> b!282428 (= e!201795 e!201790)))

(declare-fun b!282429 () Bool)

(assert (=> b!282429 (= e!201790 (byteRangesEq!0 (select (arr!8032 a1!699) (_4!413 lt!417773)) (select (arr!8032 a2!699) (_4!413 lt!417773)) #b00000000000000000000000000000000 lt!417774))))

(declare-fun b!282430 () Bool)

(assert (=> b!282430 (= e!201791 e!201793)))

(declare-fun c!13236 () Bool)

(assert (=> b!282430 (= c!13236 (= (_3!1193 lt!417773) (_4!413 lt!417773)))))

(declare-fun bm!4751 () Bool)

(assert (=> bm!4751 (= call!4754 (byteRangesEq!0 (select (arr!8032 a1!699) (_3!1193 lt!417773)) (select (arr!8032 a2!699) (_3!1193 lt!417773)) lt!417772 (ite c!13236 lt!417774 #b00000000000000000000000000001000)))))

(assert (= (and d!97174 (not res!234298)) b!282425))

(assert (= (and b!282425 (not res!234299)) b!282426))

(assert (= (and b!282425 res!234297) b!282430))

