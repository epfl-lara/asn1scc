; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27594 () Bool)

(assert start!27594)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!94701 () Bool)

(declare-datatypes ((array!6516 0))(
  ( (array!6517 (arr!3663 (Array (_ BitVec 32) (_ BitVec 8))) (size!2950 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6516)

(declare-fun b!142170 () Bool)

(declare-datatypes ((BitStream!5158 0))(
  ( (BitStream!5159 (buf!3374 array!6516) (currentByte!6243 (_ BitVec 32)) (currentBit!6238 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12622 0))(
  ( (tuple2!12623 (_1!6644 BitStream!5158) (_2!6644 array!6516)) )
))
(declare-fun lt!220454 () tuple2!12622)

(declare-fun arrayRangesEq!266 (array!6516 array!6516 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142170 (= e!94701 (not (arrayRangesEq!266 arr!237 (_2!6644 lt!220454) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142171 () Bool)

(declare-fun res!118651 () Bool)

(declare-fun e!94703 () Bool)

(assert (=> b!142171 (=> (not res!118651) (not e!94703))))

(declare-datatypes ((Unit!8888 0))(
  ( (Unit!8889) )
))
(declare-datatypes ((tuple2!12624 0))(
  ( (tuple2!12625 (_1!6645 Unit!8888) (_2!6645 BitStream!5158)) )
))
(declare-fun lt!220447 () tuple2!12624)

(declare-fun thiss!1634 () BitStream!5158)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142171 (= res!118651 (= (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2950 (buf!3374 thiss!1634)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634)))))))

(declare-fun b!142172 () Bool)

(declare-fun res!118657 () Bool)

(declare-fun e!94710 () Bool)

(assert (=> b!142172 (=> (not res!118657) (not e!94710))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142172 (= res!118657 (invariant!0 (currentBit!6238 thiss!1634) (currentByte!6243 thiss!1634) (size!2950 (buf!3374 thiss!1634))))))

(declare-fun b!142173 () Bool)

(declare-fun res!118650 () Bool)

(assert (=> b!142173 (=> (not res!118650) (not e!94710))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142173 (= res!118650 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2950 (buf!3374 thiss!1634))) ((_ sign_extend 32) (currentByte!6243 thiss!1634)) ((_ sign_extend 32) (currentBit!6238 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!142174 () Bool)

(declare-fun res!118653 () Bool)

(assert (=> b!142174 (=> (not res!118653) (not e!94710))))

(assert (=> b!142174 (= res!118653 (bvslt from!447 to!404))))

(declare-fun b!142175 () Bool)

(declare-fun res!118658 () Bool)

(declare-fun e!94702 () Bool)

(assert (=> b!142175 (=> res!118658 e!94702)))

(declare-fun lt!220455 () (_ BitVec 64))

(declare-fun lt!220448 () tuple2!12624)

(assert (=> b!142175 (= res!118658 (bvsgt lt!220455 (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220448))) (currentByte!6243 (_2!6645 lt!220448)) (currentBit!6238 (_2!6645 lt!220448)))))))

(declare-datatypes ((tuple2!12626 0))(
  ( (tuple2!12627 (_1!6646 BitStream!5158) (_2!6646 (_ BitVec 8))) )
))
(declare-fun lt!220449 () tuple2!12626)

(declare-datatypes ((tuple2!12628 0))(
  ( (tuple2!12629 (_1!6647 BitStream!5158) (_2!6647 BitStream!5158)) )
))
(declare-fun lt!220452 () tuple2!12628)

(declare-fun b!142176 () Bool)

(assert (=> b!142176 (= e!94703 (and (= (_2!6646 lt!220449) (select (arr!3663 arr!237) from!447)) (= (_1!6646 lt!220449) (_2!6647 lt!220452))))))

(declare-fun readBytePure!0 (BitStream!5158) tuple2!12626)

(assert (=> b!142176 (= lt!220449 (readBytePure!0 (_1!6647 lt!220452)))))

(declare-fun reader!0 (BitStream!5158 BitStream!5158) tuple2!12628)

(assert (=> b!142176 (= lt!220452 (reader!0 thiss!1634 (_2!6645 lt!220447)))))

(declare-fun res!118655 () Bool)

(assert (=> start!27594 (=> (not res!118655) (not e!94710))))

(assert (=> start!27594 (= res!118655 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2950 arr!237))))))

(assert (=> start!27594 e!94710))

(assert (=> start!27594 true))

(declare-fun array_inv!2739 (array!6516) Bool)

(assert (=> start!27594 (array_inv!2739 arr!237)))

(declare-fun e!94706 () Bool)

(declare-fun inv!12 (BitStream!5158) Bool)

(assert (=> start!27594 (and (inv!12 thiss!1634) e!94706)))

(declare-fun b!142177 () Bool)

(assert (=> b!142177 (= e!94706 (array_inv!2739 (buf!3374 thiss!1634)))))

(declare-fun b!142178 () Bool)

(declare-fun res!118659 () Bool)

(assert (=> b!142178 (=> (not res!118659) (not e!94703))))

(declare-fun isPrefixOf!0 (BitStream!5158 BitStream!5158) Bool)

(assert (=> b!142178 (= res!118659 (isPrefixOf!0 thiss!1634 (_2!6645 lt!220447)))))

(declare-fun b!142179 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6516 array!6516 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142179 (= e!94702 (arrayBitRangesEq!0 (buf!3374 (_2!6645 lt!220447)) (buf!3374 (_2!6645 lt!220448)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!220455))))

(declare-fun b!142180 () Bool)

(declare-fun e!94705 () Bool)

(declare-fun e!94707 () Bool)

(assert (=> b!142180 (= e!94705 e!94707)))

(declare-fun res!118656 () Bool)

(assert (=> b!142180 (=> (not res!118656) (not e!94707))))

(declare-fun lt!220450 () (_ BitVec 64))

(assert (=> b!142180 (= res!118656 (= (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220448))) (currentByte!6243 (_2!6645 lt!220448)) (currentBit!6238 (_2!6645 lt!220448))) (bvadd (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!220450))))))

(assert (=> b!142180 (= lt!220450 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142181 () Bool)

(assert (=> b!142181 (= e!94710 (not e!94702))))

(declare-fun res!118654 () Bool)

(assert (=> b!142181 (=> res!118654 e!94702)))

(assert (=> b!142181 (= res!118654 (bvsgt lt!220455 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))))))))

(assert (=> b!142181 (= lt!220455 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634))))))

(declare-fun e!94709 () Bool)

(assert (=> b!142181 e!94709))

(declare-fun res!118652 () Bool)

(assert (=> b!142181 (=> (not res!118652) (not e!94709))))

(assert (=> b!142181 (= res!118652 (isPrefixOf!0 thiss!1634 (_2!6645 lt!220448)))))

(declare-fun lt!220453 () Unit!8888)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5158 BitStream!5158 BitStream!5158) Unit!8888)

(assert (=> b!142181 (= lt!220453 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6645 lt!220447) (_2!6645 lt!220448)))))

(assert (=> b!142181 e!94705))

(declare-fun res!118647 () Bool)

(assert (=> b!142181 (=> (not res!118647) (not e!94705))))

(assert (=> b!142181 (= res!118647 (= (size!2950 (buf!3374 (_2!6645 lt!220447))) (size!2950 (buf!3374 (_2!6645 lt!220448)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5158 array!6516 (_ BitVec 32) (_ BitVec 32)) tuple2!12624)

(assert (=> b!142181 (= lt!220448 (appendByteArrayLoop!0 (_2!6645 lt!220447) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!142181 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!220456 () Unit!8888)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5158 BitStream!5158 (_ BitVec 64) (_ BitVec 32)) Unit!8888)

(assert (=> b!142181 (= lt!220456 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6645 lt!220447) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!142181 e!94703))

(declare-fun res!118648 () Bool)

(assert (=> b!142181 (=> (not res!118648) (not e!94703))))

(assert (=> b!142181 (= res!118648 (= (size!2950 (buf!3374 thiss!1634)) (size!2950 (buf!3374 (_2!6645 lt!220447)))))))

(declare-fun appendByte!0 (BitStream!5158 (_ BitVec 8)) tuple2!12624)

(assert (=> b!142181 (= lt!220447 (appendByte!0 thiss!1634 (select (arr!3663 arr!237) from!447)))))

(declare-fun b!142182 () Bool)

(declare-fun res!118649 () Bool)

(assert (=> b!142182 (=> (not res!118649) (not e!94707))))

(assert (=> b!142182 (= res!118649 (isPrefixOf!0 (_2!6645 lt!220447) (_2!6645 lt!220448)))))

(declare-fun b!142183 () Bool)

(assert (=> b!142183 (= e!94707 (not e!94701))))

(declare-fun res!118660 () Bool)

(assert (=> b!142183 (=> res!118660 e!94701)))

(declare-fun lt!220451 () tuple2!12628)

(assert (=> b!142183 (= res!118660 (or (not (= (size!2950 (_2!6644 lt!220454)) (size!2950 arr!237))) (not (= (_1!6644 lt!220454) (_2!6647 lt!220451)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5158 array!6516 (_ BitVec 32) (_ BitVec 32)) tuple2!12622)

(assert (=> b!142183 (= lt!220454 (readByteArrayLoopPure!0 (_1!6647 lt!220451) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142183 (validate_offset_bits!1 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220448)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447))) lt!220450)))

(declare-fun lt!220457 () Unit!8888)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5158 array!6516 (_ BitVec 64)) Unit!8888)

(assert (=> b!142183 (= lt!220457 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6645 lt!220447) (buf!3374 (_2!6645 lt!220448)) lt!220450))))

(assert (=> b!142183 (= lt!220451 (reader!0 (_2!6645 lt!220447) (_2!6645 lt!220448)))))

(declare-fun b!142184 () Bool)

(assert (=> b!142184 (= e!94709 (invariant!0 (currentBit!6238 thiss!1634) (currentByte!6243 thiss!1634) (size!2950 (buf!3374 (_2!6645 lt!220447)))))))

(assert (= (and start!27594 res!118655) b!142173))

(assert (= (and b!142173 res!118650) b!142174))

(assert (= (and b!142174 res!118653) b!142172))

(assert (= (and b!142172 res!118657) b!142181))

(assert (= (and b!142181 res!118648) b!142171))

(assert (= (and b!142171 res!118651) b!142178))

(assert (= (and b!142178 res!118659) b!142176))

(assert (= (and b!142181 res!118647) b!142180))

(assert (= (and b!142180 res!118656) b!142182))

(assert (= (and b!142182 res!118649) b!142183))

(assert (= (and b!142183 (not res!118660)) b!142170))

(assert (= (and b!142181 res!118652) b!142184))

(assert (= (and b!142181 (not res!118654)) b!142175))

(assert (= (and b!142175 (not res!118658)) b!142179))

(assert (= start!27594 b!142177))

(declare-fun m!218315 () Bool)

(assert (=> b!142180 m!218315))

(declare-fun m!218317 () Bool)

(assert (=> b!142180 m!218317))

(declare-fun m!218319 () Bool)

(assert (=> b!142170 m!218319))

(declare-fun m!218321 () Bool)

(assert (=> b!142181 m!218321))

(declare-fun m!218323 () Bool)

(assert (=> b!142181 m!218323))

(declare-fun m!218325 () Bool)

(assert (=> b!142181 m!218325))

(declare-fun m!218327 () Bool)

(assert (=> b!142181 m!218327))

(declare-fun m!218329 () Bool)

(assert (=> b!142181 m!218329))

(declare-fun m!218331 () Bool)

(assert (=> b!142181 m!218331))

(assert (=> b!142181 m!218329))

(declare-fun m!218333 () Bool)

(assert (=> b!142181 m!218333))

(declare-fun m!218335 () Bool)

(assert (=> b!142181 m!218335))

(declare-fun m!218337 () Bool)

(assert (=> b!142179 m!218337))

(assert (=> b!142176 m!218329))

(declare-fun m!218339 () Bool)

(assert (=> b!142176 m!218339))

(declare-fun m!218341 () Bool)

(assert (=> b!142176 m!218341))

(assert (=> b!142171 m!218317))

(declare-fun m!218343 () Bool)

(assert (=> b!142171 m!218343))

(declare-fun m!218345 () Bool)

(assert (=> start!27594 m!218345))

(declare-fun m!218347 () Bool)

(assert (=> start!27594 m!218347))

(declare-fun m!218349 () Bool)

(assert (=> b!142173 m!218349))

(declare-fun m!218351 () Bool)

(assert (=> b!142182 m!218351))

(declare-fun m!218353 () Bool)

(assert (=> b!142172 m!218353))

(declare-fun m!218355 () Bool)

(assert (=> b!142184 m!218355))

(declare-fun m!218357 () Bool)

(assert (=> b!142178 m!218357))

(declare-fun m!218359 () Bool)

(assert (=> b!142177 m!218359))

(assert (=> b!142175 m!218315))

(declare-fun m!218361 () Bool)

(assert (=> b!142183 m!218361))

(declare-fun m!218363 () Bool)

(assert (=> b!142183 m!218363))

(declare-fun m!218365 () Bool)

(assert (=> b!142183 m!218365))

(declare-fun m!218367 () Bool)

(assert (=> b!142183 m!218367))

(push 1)

(assert (not b!142170))

(assert (not start!27594))

(assert (not b!142171))

(assert (not b!142183))

(assert (not b!142176))

(assert (not b!142178))

(assert (not b!142184))

(assert (not b!142179))

(assert (not b!142175))

(assert (not b!142173))

(assert (not b!142181))

(assert (not b!142180))

(assert (not b!142177))

(assert (not b!142182))

(assert (not b!142172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!142306 () Bool)

(declare-fun res!118775 () Bool)

(declare-fun lt!220556 () (_ BitVec 32))

(assert (=> b!142306 (= res!118775 (= lt!220556 #b00000000000000000000000000000000))))

(declare-fun e!94793 () Bool)

(assert (=> b!142306 (=> res!118775 e!94793)))

(declare-fun e!94798 () Bool)

(assert (=> b!142306 (= e!94798 e!94793)))

(declare-fun d!45551 () Bool)

(declare-fun res!118772 () Bool)

(declare-fun e!94794 () Bool)

(assert (=> d!45551 (=> res!118772 e!94794)))

(assert (=> d!45551 (= res!118772 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!220455))))

(assert (=> d!45551 (= (arrayBitRangesEq!0 (buf!3374 (_2!6645 lt!220447)) (buf!3374 (_2!6645 lt!220448)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!220455) e!94794)))

(declare-fun b!142307 () Bool)

(declare-fun e!94795 () Bool)

(declare-fun call!1848 () Bool)

(assert (=> b!142307 (= e!94795 call!1848)))

(declare-fun bm!1845 () Bool)

(declare-fun c!7814 () Bool)

(declare-datatypes ((tuple4!124 0))(
  ( (tuple4!125 (_1!6656 (_ BitVec 32)) (_2!6656 (_ BitVec 32)) (_3!333 (_ BitVec 32)) (_4!62 (_ BitVec 32))) )
))
(declare-fun lt!220555 () tuple4!124)

(declare-fun lt!220554 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1845 (= call!1848 (byteRangesEq!0 (ite c!7814 (select (arr!3663 (buf!3374 (_2!6645 lt!220447))) (_3!333 lt!220555)) (select (arr!3663 (buf!3374 (_2!6645 lt!220447))) (_4!62 lt!220555))) (ite c!7814 (select (arr!3663 (buf!3374 (_2!6645 lt!220448))) (_3!333 lt!220555)) (select (arr!3663 (buf!3374 (_2!6645 lt!220448))) (_4!62 lt!220555))) (ite c!7814 lt!220554 #b00000000000000000000000000000000) lt!220556))))

(declare-fun b!142308 () Bool)

(declare-fun e!94797 () Bool)

(assert (=> b!142308 (= e!94794 e!94797)))

(declare-fun res!118776 () Bool)

(assert (=> b!142308 (=> (not res!118776) (not e!94797))))

(declare-fun e!94796 () Bool)

(assert (=> b!142308 (= res!118776 e!94796)))

(declare-fun res!118774 () Bool)

(assert (=> b!142308 (=> res!118774 e!94796)))

(assert (=> b!142308 (= res!118774 (bvsge (_1!6656 lt!220555) (_2!6656 lt!220555)))))

(assert (=> b!142308 (= lt!220556 ((_ extract 31 0) (bvsrem lt!220455 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142308 (= lt!220554 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!124)

(assert (=> b!142308 (= lt!220555 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!220455))))

(declare-fun b!142309 () Bool)

(assert (=> b!142309 (= e!94796 (arrayRangesEq!266 (buf!3374 (_2!6645 lt!220447)) (buf!3374 (_2!6645 lt!220448)) (_1!6656 lt!220555) (_2!6656 lt!220555)))))

(declare-fun b!142310 () Bool)

(assert (=> b!142310 (= e!94795 e!94798)))

(declare-fun res!118773 () Bool)

(assert (=> b!142310 (= res!118773 (byteRangesEq!0 (select (arr!3663 (buf!3374 (_2!6645 lt!220447))) (_3!333 lt!220555)) (select (arr!3663 (buf!3374 (_2!6645 lt!220448))) (_3!333 lt!220555)) lt!220554 #b00000000000000000000000000001000))))

(assert (=> b!142310 (=> (not res!118773) (not e!94798))))

(declare-fun b!142311 () Bool)

(assert (=> b!142311 (= e!94793 call!1848)))

(declare-fun b!142312 () Bool)

(assert (=> b!142312 (= e!94797 e!94795)))

(assert (=> b!142312 (= c!7814 (= (_3!333 lt!220555) (_4!62 lt!220555)))))

(assert (= (and d!45551 (not res!118772)) b!142308))

(assert (= (and b!142308 (not res!118774)) b!142309))

(assert (= (and b!142308 res!118776) b!142312))

(assert (= (and b!142312 c!7814) b!142307))

(assert (= (and b!142312 (not c!7814)) b!142310))

(assert (= (and b!142310 res!118773) b!142306))

(assert (= (and b!142306 (not res!118775)) b!142311))

(assert (= (or b!142307 b!142311) bm!1845))

(declare-fun m!218487 () Bool)

(assert (=> bm!1845 m!218487))

(declare-fun m!218489 () Bool)

(assert (=> bm!1845 m!218489))

(declare-fun m!218491 () Bool)

(assert (=> bm!1845 m!218491))

(declare-fun m!218493 () Bool)

(assert (=> bm!1845 m!218493))

(declare-fun m!218495 () Bool)

(assert (=> bm!1845 m!218495))

(declare-fun m!218497 () Bool)

(assert (=> b!142308 m!218497))

(declare-fun m!218499 () Bool)

(assert (=> b!142309 m!218499))

(assert (=> b!142310 m!218491))

(assert (=> b!142310 m!218495))

(assert (=> b!142310 m!218491))

(assert (=> b!142310 m!218495))

(declare-fun m!218501 () Bool)

(assert (=> b!142310 m!218501))

(assert (=> b!142179 d!45551))

(declare-fun d!45559 () Bool)

(declare-fun res!118783 () Bool)

(declare-fun e!94804 () Bool)

(assert (=> d!45559 (=> (not res!118783) (not e!94804))))

(assert (=> d!45559 (= res!118783 (= (size!2950 (buf!3374 thiss!1634)) (size!2950 (buf!3374 (_2!6645 lt!220447)))))))

(assert (=> d!45559 (= (isPrefixOf!0 thiss!1634 (_2!6645 lt!220447)) e!94804)))

(declare-fun b!142319 () Bool)

(declare-fun res!118784 () Bool)

(assert (=> b!142319 (=> (not res!118784) (not e!94804))))

(assert (=> b!142319 (= res!118784 (bvsle (bitIndex!0 (size!2950 (buf!3374 thiss!1634)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634)) (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447)))))))

(declare-fun b!142320 () Bool)

(declare-fun e!94803 () Bool)

(assert (=> b!142320 (= e!94804 e!94803)))

(declare-fun res!118785 () Bool)

(assert (=> b!142320 (=> res!118785 e!94803)))

(assert (=> b!142320 (= res!118785 (= (size!2950 (buf!3374 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142321 () Bool)

(assert (=> b!142321 (= e!94803 (arrayBitRangesEq!0 (buf!3374 thiss!1634) (buf!3374 (_2!6645 lt!220447)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2950 (buf!3374 thiss!1634)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634))))))

(assert (= (and d!45559 res!118783) b!142319))

(assert (= (and b!142319 res!118784) b!142320))

(assert (= (and b!142320 (not res!118785)) b!142321))

(assert (=> b!142319 m!218343))

(assert (=> b!142319 m!218317))

(assert (=> b!142321 m!218343))

(assert (=> b!142321 m!218343))

(declare-fun m!218505 () Bool)

(assert (=> b!142321 m!218505))

(assert (=> b!142178 d!45559))

(declare-fun d!45563 () Bool)

(declare-fun e!94807 () Bool)

(assert (=> d!45563 e!94807))

(declare-fun res!118790 () Bool)

(assert (=> d!45563 (=> (not res!118790) (not e!94807))))

(declare-fun lt!220575 () (_ BitVec 64))

(declare-fun lt!220577 () (_ BitVec 64))

(declare-fun lt!220579 () (_ BitVec 64))

(assert (=> d!45563 (= res!118790 (= lt!220575 (bvsub lt!220579 lt!220577)))))

(assert (=> d!45563 (or (= (bvand lt!220579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220577 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220579 lt!220577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45563 (= lt!220577 (remainingBits!0 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447)))))))

(declare-fun lt!220580 () (_ BitVec 64))

(declare-fun lt!220576 () (_ BitVec 64))

(assert (=> d!45563 (= lt!220579 (bvmul lt!220580 lt!220576))))

(assert (=> d!45563 (or (= lt!220580 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220576 (bvsdiv (bvmul lt!220580 lt!220576) lt!220580)))))

(assert (=> d!45563 (= lt!220576 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45563 (= lt!220580 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))))))

(assert (=> d!45563 (= lt!220575 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447)))))))

(assert (=> d!45563 (invariant!0 (currentBit!6238 (_2!6645 lt!220447)) (currentByte!6243 (_2!6645 lt!220447)) (size!2950 (buf!3374 (_2!6645 lt!220447))))))

(assert (=> d!45563 (= (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447))) lt!220575)))

(declare-fun b!142326 () Bool)

(declare-fun res!118791 () Bool)

(assert (=> b!142326 (=> (not res!118791) (not e!94807))))

(assert (=> b!142326 (= res!118791 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220575))))

(declare-fun b!142327 () Bool)

(declare-fun lt!220578 () (_ BitVec 64))

(assert (=> b!142327 (= e!94807 (bvsle lt!220575 (bvmul lt!220578 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142327 (or (= lt!220578 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220578 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220578)))))

(assert (=> b!142327 (= lt!220578 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))))))

(assert (= (and d!45563 res!118790) b!142326))

(assert (= (and b!142326 res!118791) b!142327))

(declare-fun m!218511 () Bool)

(assert (=> d!45563 m!218511))

(declare-fun m!218513 () Bool)

(assert (=> d!45563 m!218513))

(assert (=> b!142171 d!45563))

(declare-fun d!45569 () Bool)

(declare-fun e!94808 () Bool)

(assert (=> d!45569 e!94808))

(declare-fun res!118792 () Bool)

(assert (=> d!45569 (=> (not res!118792) (not e!94808))))

(declare-fun lt!220583 () (_ BitVec 64))

(declare-fun lt!220585 () (_ BitVec 64))

(declare-fun lt!220581 () (_ BitVec 64))

(assert (=> d!45569 (= res!118792 (= lt!220581 (bvsub lt!220585 lt!220583)))))

(assert (=> d!45569 (or (= (bvand lt!220585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220583 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220585 lt!220583) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45569 (= lt!220583 (remainingBits!0 ((_ sign_extend 32) (size!2950 (buf!3374 thiss!1634))) ((_ sign_extend 32) (currentByte!6243 thiss!1634)) ((_ sign_extend 32) (currentBit!6238 thiss!1634))))))

(declare-fun lt!220586 () (_ BitVec 64))

(declare-fun lt!220582 () (_ BitVec 64))

(assert (=> d!45569 (= lt!220585 (bvmul lt!220586 lt!220582))))

(assert (=> d!45569 (or (= lt!220586 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220582 (bvsdiv (bvmul lt!220586 lt!220582) lt!220586)))))

(assert (=> d!45569 (= lt!220582 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45569 (= lt!220586 ((_ sign_extend 32) (size!2950 (buf!3374 thiss!1634))))))

(assert (=> d!45569 (= lt!220581 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6243 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6238 thiss!1634))))))

(assert (=> d!45569 (invariant!0 (currentBit!6238 thiss!1634) (currentByte!6243 thiss!1634) (size!2950 (buf!3374 thiss!1634)))))

(assert (=> d!45569 (= (bitIndex!0 (size!2950 (buf!3374 thiss!1634)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634)) lt!220581)))

(declare-fun b!142328 () Bool)

(declare-fun res!118793 () Bool)

(assert (=> b!142328 (=> (not res!118793) (not e!94808))))

(assert (=> b!142328 (= res!118793 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220581))))

(declare-fun b!142329 () Bool)

(declare-fun lt!220584 () (_ BitVec 64))

(assert (=> b!142329 (= e!94808 (bvsle lt!220581 (bvmul lt!220584 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142329 (or (= lt!220584 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220584 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220584)))))

(assert (=> b!142329 (= lt!220584 ((_ sign_extend 32) (size!2950 (buf!3374 thiss!1634))))))

(assert (= (and d!45569 res!118792) b!142328))

(assert (= (and b!142328 res!118793) b!142329))

(declare-fun m!218515 () Bool)

(assert (=> d!45569 m!218515))

(assert (=> d!45569 m!218353))

(assert (=> b!142171 d!45569))

(declare-fun d!45571 () Bool)

(declare-fun res!118794 () Bool)

(declare-fun e!94810 () Bool)

(assert (=> d!45571 (=> (not res!118794) (not e!94810))))

(assert (=> d!45571 (= res!118794 (= (size!2950 (buf!3374 (_2!6645 lt!220447))) (size!2950 (buf!3374 (_2!6645 lt!220448)))))))

(assert (=> d!45571 (= (isPrefixOf!0 (_2!6645 lt!220447) (_2!6645 lt!220448)) e!94810)))

(declare-fun b!142330 () Bool)

(declare-fun res!118795 () Bool)

(assert (=> b!142330 (=> (not res!118795) (not e!94810))))

(assert (=> b!142330 (= res!118795 (bvsle (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447))) (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220448))) (currentByte!6243 (_2!6645 lt!220448)) (currentBit!6238 (_2!6645 lt!220448)))))))

(declare-fun b!142331 () Bool)

(declare-fun e!94809 () Bool)

(assert (=> b!142331 (= e!94810 e!94809)))

(declare-fun res!118796 () Bool)

(assert (=> b!142331 (=> res!118796 e!94809)))

(assert (=> b!142331 (= res!118796 (= (size!2950 (buf!3374 (_2!6645 lt!220447))) #b00000000000000000000000000000000))))

(declare-fun b!142332 () Bool)

(assert (=> b!142332 (= e!94809 (arrayBitRangesEq!0 (buf!3374 (_2!6645 lt!220447)) (buf!3374 (_2!6645 lt!220448)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447)))))))

(assert (= (and d!45571 res!118794) b!142330))

(assert (= (and b!142330 res!118795) b!142331))

(assert (= (and b!142331 (not res!118796)) b!142332))

(assert (=> b!142330 m!218317))

(assert (=> b!142330 m!218315))

(assert (=> b!142332 m!218317))

(assert (=> b!142332 m!218317))

(declare-fun m!218517 () Bool)

(assert (=> b!142332 m!218517))

(assert (=> b!142182 d!45571))

(declare-fun d!45573 () Bool)

(declare-fun e!94811 () Bool)

(assert (=> d!45573 e!94811))

(declare-fun res!118797 () Bool)

(assert (=> d!45573 (=> (not res!118797) (not e!94811))))

(declare-fun lt!220591 () (_ BitVec 64))

(declare-fun lt!220589 () (_ BitVec 64))

(declare-fun lt!220587 () (_ BitVec 64))

(assert (=> d!45573 (= res!118797 (= lt!220587 (bvsub lt!220591 lt!220589)))))

(assert (=> d!45573 (or (= (bvand lt!220591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220591 lt!220589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45573 (= lt!220589 (remainingBits!0 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220448)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220448))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220448)))))))

(declare-fun lt!220592 () (_ BitVec 64))

(declare-fun lt!220588 () (_ BitVec 64))

(assert (=> d!45573 (= lt!220591 (bvmul lt!220592 lt!220588))))

(assert (=> d!45573 (or (= lt!220592 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220588 (bvsdiv (bvmul lt!220592 lt!220588) lt!220592)))))

(assert (=> d!45573 (= lt!220588 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45573 (= lt!220592 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220448)))))))

(assert (=> d!45573 (= lt!220587 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220448))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220448)))))))

(assert (=> d!45573 (invariant!0 (currentBit!6238 (_2!6645 lt!220448)) (currentByte!6243 (_2!6645 lt!220448)) (size!2950 (buf!3374 (_2!6645 lt!220448))))))

(assert (=> d!45573 (= (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220448))) (currentByte!6243 (_2!6645 lt!220448)) (currentBit!6238 (_2!6645 lt!220448))) lt!220587)))

(declare-fun b!142333 () Bool)

(declare-fun res!118798 () Bool)

(assert (=> b!142333 (=> (not res!118798) (not e!94811))))

(assert (=> b!142333 (= res!118798 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220587))))

(declare-fun b!142334 () Bool)

(declare-fun lt!220590 () (_ BitVec 64))

(assert (=> b!142334 (= e!94811 (bvsle lt!220587 (bvmul lt!220590 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142334 (or (= lt!220590 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220590 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220590)))))

(assert (=> b!142334 (= lt!220590 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220448)))))))

(assert (= (and d!45573 res!118797) b!142333))

(assert (= (and b!142333 res!118798) b!142334))

(declare-fun m!218519 () Bool)

(assert (=> d!45573 m!218519))

(declare-fun m!218521 () Bool)

(assert (=> d!45573 m!218521))

(assert (=> b!142180 d!45573))

(assert (=> b!142180 d!45563))

(declare-fun d!45575 () Bool)

(declare-fun res!118803 () Bool)

(declare-fun e!94816 () Bool)

(assert (=> d!45575 (=> res!118803 e!94816)))

(assert (=> d!45575 (= res!118803 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45575 (= (arrayRangesEq!266 arr!237 (_2!6644 lt!220454) #b00000000000000000000000000000000 to!404) e!94816)))

(declare-fun b!142339 () Bool)

(declare-fun e!94817 () Bool)

(assert (=> b!142339 (= e!94816 e!94817)))

(declare-fun res!118804 () Bool)

(assert (=> b!142339 (=> (not res!118804) (not e!94817))))

(assert (=> b!142339 (= res!118804 (= (select (arr!3663 arr!237) #b00000000000000000000000000000000) (select (arr!3663 (_2!6644 lt!220454)) #b00000000000000000000000000000000)))))

(declare-fun b!142340 () Bool)

(assert (=> b!142340 (= e!94817 (arrayRangesEq!266 arr!237 (_2!6644 lt!220454) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45575 (not res!118803)) b!142339))

(assert (= (and b!142339 res!118804) b!142340))

(declare-fun m!218523 () Bool)

(assert (=> b!142339 m!218523))

(declare-fun m!218525 () Bool)

(assert (=> b!142339 m!218525))

(declare-fun m!218527 () Bool)

(assert (=> b!142340 m!218527))

(assert (=> b!142170 d!45575))

(declare-fun d!45577 () Bool)

(declare-fun res!118805 () Bool)

(declare-fun e!94819 () Bool)

(assert (=> d!45577 (=> (not res!118805) (not e!94819))))

(assert (=> d!45577 (= res!118805 (= (size!2950 (buf!3374 thiss!1634)) (size!2950 (buf!3374 (_2!6645 lt!220448)))))))

(assert (=> d!45577 (= (isPrefixOf!0 thiss!1634 (_2!6645 lt!220448)) e!94819)))

(declare-fun b!142341 () Bool)

(declare-fun res!118806 () Bool)

(assert (=> b!142341 (=> (not res!118806) (not e!94819))))

(assert (=> b!142341 (= res!118806 (bvsle (bitIndex!0 (size!2950 (buf!3374 thiss!1634)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634)) (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220448))) (currentByte!6243 (_2!6645 lt!220448)) (currentBit!6238 (_2!6645 lt!220448)))))))

(declare-fun b!142342 () Bool)

(declare-fun e!94818 () Bool)

(assert (=> b!142342 (= e!94819 e!94818)))

(declare-fun res!118807 () Bool)

(assert (=> b!142342 (=> res!118807 e!94818)))

(assert (=> b!142342 (= res!118807 (= (size!2950 (buf!3374 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142343 () Bool)

(assert (=> b!142343 (= e!94818 (arrayBitRangesEq!0 (buf!3374 thiss!1634) (buf!3374 (_2!6645 lt!220448)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2950 (buf!3374 thiss!1634)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634))))))

(assert (= (and d!45577 res!118805) b!142341))

(assert (= (and b!142341 res!118806) b!142342))

(assert (= (and b!142342 (not res!118807)) b!142343))

(assert (=> b!142341 m!218343))

(assert (=> b!142341 m!218315))

(assert (=> b!142343 m!218343))

(assert (=> b!142343 m!218343))

(declare-fun m!218529 () Bool)

(assert (=> b!142343 m!218529))

(assert (=> b!142181 d!45577))

(declare-fun d!45579 () Bool)

(declare-fun e!94861 () Bool)

(assert (=> d!45579 e!94861))

(declare-fun res!118856 () Bool)

(assert (=> d!45579 (=> (not res!118856) (not e!94861))))

(declare-fun lt!220715 () tuple2!12624)

(assert (=> d!45579 (= res!118856 (= (size!2950 (buf!3374 (_2!6645 lt!220447))) (size!2950 (buf!3374 (_2!6645 lt!220715)))))))

(declare-fun choose!64 (BitStream!5158 array!6516 (_ BitVec 32) (_ BitVec 32)) tuple2!12624)

(assert (=> d!45579 (= lt!220715 (choose!64 (_2!6645 lt!220447) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45579 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2950 arr!237)))))

(assert (=> d!45579 (= (appendByteArrayLoop!0 (_2!6645 lt!220447) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!220715)))

(declare-fun b!142406 () Bool)

(declare-fun e!94862 () Bool)

(declare-fun lt!220712 () (_ BitVec 64))

(assert (=> b!142406 (= e!94862 (validate_offset_bits!1 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447))) lt!220712))))

(declare-fun e!94863 () Bool)

(declare-fun b!142407 () Bool)

(declare-fun lt!220719 () tuple2!12622)

(assert (=> b!142407 (= e!94863 (arrayRangesEq!266 arr!237 (_2!6644 lt!220719) #b00000000000000000000000000000000 to!404))))

(declare-fun b!142408 () Bool)

(declare-fun res!118857 () Bool)

(assert (=> b!142408 (=> (not res!118857) (not e!94861))))

(declare-fun lt!220716 () (_ BitVec 64))

(declare-fun lt!220717 () (_ BitVec 64))

(assert (=> b!142408 (= res!118857 (= (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220715))) (currentByte!6243 (_2!6645 lt!220715)) (currentBit!6238 (_2!6645 lt!220715))) (bvadd lt!220717 lt!220716)))))

(assert (=> b!142408 (or (not (= (bvand lt!220717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220716 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220717 lt!220716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!220713 () (_ BitVec 64))

(assert (=> b!142408 (= lt!220716 (bvmul lt!220713 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!142408 (or (= lt!220713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220713)))))

(assert (=> b!142408 (= lt!220713 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142408 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142408 (= lt!220717 (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447))))))

(declare-fun b!142409 () Bool)

(assert (=> b!142409 (= e!94861 e!94863)))

(declare-fun res!118860 () Bool)

(assert (=> b!142409 (=> (not res!118860) (not e!94863))))

(declare-fun lt!220720 () tuple2!12628)

(assert (=> b!142409 (= res!118860 (and (= (size!2950 (_2!6644 lt!220719)) (size!2950 arr!237)) (= (_1!6644 lt!220719) (_2!6647 lt!220720))))))

(assert (=> b!142409 (= lt!220719 (readByteArrayLoopPure!0 (_1!6647 lt!220720) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!220714 () Unit!8888)

(declare-fun lt!220718 () Unit!8888)

(assert (=> b!142409 (= lt!220714 lt!220718)))

(assert (=> b!142409 (validate_offset_bits!1 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220715)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447))) lt!220712)))

(assert (=> b!142409 (= lt!220718 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6645 lt!220447) (buf!3374 (_2!6645 lt!220715)) lt!220712))))

(assert (=> b!142409 e!94862))

(declare-fun res!118859 () Bool)

(assert (=> b!142409 (=> (not res!118859) (not e!94862))))

(assert (=> b!142409 (= res!118859 (and (= (size!2950 (buf!3374 (_2!6645 lt!220447))) (size!2950 (buf!3374 (_2!6645 lt!220715)))) (bvsge lt!220712 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142409 (= lt!220712 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142409 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142409 (= lt!220720 (reader!0 (_2!6645 lt!220447) (_2!6645 lt!220715)))))

(declare-fun b!142410 () Bool)

(declare-fun res!118858 () Bool)

(assert (=> b!142410 (=> (not res!118858) (not e!94861))))

(assert (=> b!142410 (= res!118858 (isPrefixOf!0 (_2!6645 lt!220447) (_2!6645 lt!220715)))))

(assert (= (and d!45579 res!118856) b!142408))

(assert (= (and b!142408 res!118857) b!142410))

(assert (= (and b!142410 res!118858) b!142409))

(assert (= (and b!142409 res!118859) b!142406))

(assert (= (and b!142409 res!118860) b!142407))

(declare-fun m!218617 () Bool)

(assert (=> b!142410 m!218617))

(declare-fun m!218619 () Bool)

(assert (=> b!142406 m!218619))

(declare-fun m!218621 () Bool)

(assert (=> b!142409 m!218621))

(declare-fun m!218623 () Bool)

(assert (=> b!142409 m!218623))

(declare-fun m!218625 () Bool)

(assert (=> b!142409 m!218625))

(declare-fun m!218627 () Bool)

(assert (=> b!142409 m!218627))

(declare-fun m!218629 () Bool)

(assert (=> b!142408 m!218629))

(assert (=> b!142408 m!218317))

(declare-fun m!218631 () Bool)

(assert (=> d!45579 m!218631))

(declare-fun m!218633 () Bool)

(assert (=> b!142407 m!218633))

(assert (=> b!142181 d!45579))

(declare-fun d!45614 () Bool)

(declare-fun e!94872 () Bool)

(assert (=> d!45614 e!94872))

(declare-fun res!118871 () Bool)

(assert (=> d!45614 (=> (not res!118871) (not e!94872))))

(assert (=> d!45614 (= res!118871 (and (or (let ((rhs!3188 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3188 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3188) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45615 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45615 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45615 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3187 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3187 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3187) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!220742 () Unit!8888)

(declare-fun choose!57 (BitStream!5158 BitStream!5158 (_ BitVec 64) (_ BitVec 32)) Unit!8888)

(assert (=> d!45614 (= lt!220742 (choose!57 thiss!1634 (_2!6645 lt!220447) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45614 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6645 lt!220447) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!220742)))

(declare-fun lt!220744 () (_ BitVec 32))

(declare-fun b!142421 () Bool)

(assert (=> b!142421 (= e!94872 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447))) (bvsub (bvsub to!404 from!447) lt!220744)))))

(assert (=> b!142421 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!220744 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!220744) #b10000000000000000000000000000000)))))

(declare-fun lt!220743 () (_ BitVec 64))

(assert (=> b!142421 (= lt!220744 ((_ extract 31 0) lt!220743))))

(assert (=> b!142421 (and (bvslt lt!220743 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!220743 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!142421 (= lt!220743 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45614 res!118871) b!142421))

(declare-fun m!218643 () Bool)

(assert (=> d!45614 m!218643))

(declare-fun m!218645 () Bool)

(assert (=> b!142421 m!218645))

(assert (=> b!142181 d!45614))

(declare-fun d!45623 () Bool)

(assert (=> d!45623 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11200 () Bool)

(assert (= bs!11200 d!45623))

(assert (=> bs!11200 m!218511))

(assert (=> b!142181 d!45623))

(declare-fun d!45625 () Bool)

(declare-fun e!94873 () Bool)

(assert (=> d!45625 e!94873))

(declare-fun res!118872 () Bool)

(assert (=> d!45625 (=> (not res!118872) (not e!94873))))

(declare-fun lt!220745 () (_ BitVec 64))

(declare-fun lt!220749 () (_ BitVec 64))

(declare-fun lt!220747 () (_ BitVec 64))

(assert (=> d!45625 (= res!118872 (= lt!220745 (bvsub lt!220749 lt!220747)))))

(assert (=> d!45625 (or (= (bvand lt!220749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220749 lt!220747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45625 (= lt!220747 (remainingBits!0 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))) ((_ sign_extend 32) (currentByte!6243 thiss!1634)) ((_ sign_extend 32) (currentBit!6238 thiss!1634))))))

(declare-fun lt!220750 () (_ BitVec 64))

(declare-fun lt!220746 () (_ BitVec 64))

(assert (=> d!45625 (= lt!220749 (bvmul lt!220750 lt!220746))))

(assert (=> d!45625 (or (= lt!220750 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220746 (bvsdiv (bvmul lt!220750 lt!220746) lt!220750)))))

(assert (=> d!45625 (= lt!220746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45625 (= lt!220750 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))))))

(assert (=> d!45625 (= lt!220745 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6243 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6238 thiss!1634))))))

(assert (=> d!45625 (invariant!0 (currentBit!6238 thiss!1634) (currentByte!6243 thiss!1634) (size!2950 (buf!3374 (_2!6645 lt!220447))))))

(assert (=> d!45625 (= (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634)) lt!220745)))

(declare-fun b!142422 () Bool)

(declare-fun res!118873 () Bool)

(assert (=> b!142422 (=> (not res!118873) (not e!94873))))

(assert (=> b!142422 (= res!118873 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220745))))

(declare-fun b!142423 () Bool)

(declare-fun lt!220748 () (_ BitVec 64))

(assert (=> b!142423 (= e!94873 (bvsle lt!220745 (bvmul lt!220748 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142423 (or (= lt!220748 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220748 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220748)))))

(assert (=> b!142423 (= lt!220748 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220447)))))))

(assert (= (and d!45625 res!118872) b!142422))

(assert (= (and b!142422 res!118873) b!142423))

(declare-fun m!218647 () Bool)

(assert (=> d!45625 m!218647))

(assert (=> d!45625 m!218355))

(assert (=> b!142181 d!45625))

(declare-fun d!45627 () Bool)

(assert (=> d!45627 (isPrefixOf!0 thiss!1634 (_2!6645 lt!220448))))

(declare-fun lt!220753 () Unit!8888)

(declare-fun choose!30 (BitStream!5158 BitStream!5158 BitStream!5158) Unit!8888)

(assert (=> d!45627 (= lt!220753 (choose!30 thiss!1634 (_2!6645 lt!220447) (_2!6645 lt!220448)))))

(assert (=> d!45627 (isPrefixOf!0 thiss!1634 (_2!6645 lt!220447))))

(assert (=> d!45627 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6645 lt!220447) (_2!6645 lt!220448)) lt!220753)))

(declare-fun bs!11201 () Bool)

(assert (= bs!11201 d!45627))

(assert (=> bs!11201 m!218325))

(declare-fun m!218649 () Bool)

(assert (=> bs!11201 m!218649))

(assert (=> bs!11201 m!218357))

(assert (=> b!142181 d!45627))

(declare-fun d!45629 () Bool)

(declare-fun e!94887 () Bool)

(assert (=> d!45629 e!94887))

(declare-fun res!118902 () Bool)

(assert (=> d!45629 (=> (not res!118902) (not e!94887))))

(declare-fun lt!220851 () tuple2!12624)

(assert (=> d!45629 (= res!118902 (= (size!2950 (buf!3374 thiss!1634)) (size!2950 (buf!3374 (_2!6645 lt!220851)))))))

(declare-fun choose!6 (BitStream!5158 (_ BitVec 8)) tuple2!12624)

(assert (=> d!45629 (= lt!220851 (choose!6 thiss!1634 (select (arr!3663 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45629 (validate_offset_byte!0 ((_ sign_extend 32) (size!2950 (buf!3374 thiss!1634))) ((_ sign_extend 32) (currentByte!6243 thiss!1634)) ((_ sign_extend 32) (currentBit!6238 thiss!1634)))))

(assert (=> d!45629 (= (appendByte!0 thiss!1634 (select (arr!3663 arr!237) from!447)) lt!220851)))

(declare-fun b!142458 () Bool)

(declare-fun res!118903 () Bool)

(assert (=> b!142458 (=> (not res!118903) (not e!94887))))

(declare-fun lt!220855 () (_ BitVec 64))

(declare-fun lt!220853 () (_ BitVec 64))

(assert (=> b!142458 (= res!118903 (= (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220851))) (currentByte!6243 (_2!6645 lt!220851)) (currentBit!6238 (_2!6645 lt!220851))) (bvadd lt!220853 lt!220855)))))

(assert (=> b!142458 (or (not (= (bvand lt!220853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220855 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220853 lt!220855) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142458 (= lt!220855 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!142458 (= lt!220853 (bitIndex!0 (size!2950 (buf!3374 thiss!1634)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634)))))

(declare-fun b!142459 () Bool)

(declare-fun res!118904 () Bool)

(assert (=> b!142459 (=> (not res!118904) (not e!94887))))

(assert (=> b!142459 (= res!118904 (isPrefixOf!0 thiss!1634 (_2!6645 lt!220851)))))

(declare-fun lt!220852 () tuple2!12626)

(declare-fun lt!220854 () tuple2!12628)

(declare-fun b!142460 () Bool)

(assert (=> b!142460 (= e!94887 (and (= (_2!6646 lt!220852) (select (arr!3663 arr!237) from!447)) (= (_1!6646 lt!220852) (_2!6647 lt!220854))))))

(assert (=> b!142460 (= lt!220852 (readBytePure!0 (_1!6647 lt!220854)))))

(assert (=> b!142460 (= lt!220854 (reader!0 thiss!1634 (_2!6645 lt!220851)))))

(assert (= (and d!45629 res!118902) b!142458))

(assert (= (and b!142458 res!118903) b!142459))

(assert (= (and b!142459 res!118904) b!142460))

(assert (=> d!45629 m!218329))

(declare-fun m!218693 () Bool)

(assert (=> d!45629 m!218693))

(declare-fun m!218695 () Bool)

(assert (=> d!45629 m!218695))

(declare-fun m!218701 () Bool)

(assert (=> b!142458 m!218701))

(assert (=> b!142458 m!218343))

(declare-fun m!218703 () Bool)

(assert (=> b!142459 m!218703))

(declare-fun m!218705 () Bool)

(assert (=> b!142460 m!218705))

(declare-fun m!218707 () Bool)

(assert (=> b!142460 m!218707))

(assert (=> b!142181 d!45629))

(declare-fun d!45639 () Bool)

(assert (=> d!45639 (= (invariant!0 (currentBit!6238 thiss!1634) (currentByte!6243 thiss!1634) (size!2950 (buf!3374 (_2!6645 lt!220447)))) (and (bvsge (currentBit!6238 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6238 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6243 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6243 thiss!1634) (size!2950 (buf!3374 (_2!6645 lt!220447)))) (and (= (currentBit!6238 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6243 thiss!1634) (size!2950 (buf!3374 (_2!6645 lt!220447))))))))))

(assert (=> b!142184 d!45639))

(declare-fun d!45645 () Bool)

(assert (=> d!45645 (= (invariant!0 (currentBit!6238 thiss!1634) (currentByte!6243 thiss!1634) (size!2950 (buf!3374 thiss!1634))) (and (bvsge (currentBit!6238 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6238 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6243 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6243 thiss!1634) (size!2950 (buf!3374 thiss!1634))) (and (= (currentBit!6238 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6243 thiss!1634) (size!2950 (buf!3374 thiss!1634)))))))))

(assert (=> b!142172 d!45645))

(declare-fun d!45647 () Bool)

(declare-datatypes ((tuple3!544 0))(
  ( (tuple3!545 (_1!6659 Unit!8888) (_2!6659 BitStream!5158) (_3!336 array!6516)) )
))
(declare-fun lt!220870 () tuple3!544)

(declare-fun readByteArrayLoop!0 (BitStream!5158 array!6516 (_ BitVec 32) (_ BitVec 32)) tuple3!544)

(assert (=> d!45647 (= lt!220870 (readByteArrayLoop!0 (_1!6647 lt!220451) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45647 (= (readByteArrayLoopPure!0 (_1!6647 lt!220451) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12623 (_2!6659 lt!220870) (_3!336 lt!220870)))))

(declare-fun bs!11202 () Bool)

(assert (= bs!11202 d!45647))

(declare-fun m!218717 () Bool)

(assert (=> bs!11202 m!218717))

(assert (=> b!142183 d!45647))

(declare-fun d!45651 () Bool)

(assert (=> d!45651 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220448)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447))) lt!220450) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220448)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447)))) lt!220450))))

(declare-fun bs!11203 () Bool)

(assert (= bs!11203 d!45651))

(declare-fun m!218719 () Bool)

(assert (=> bs!11203 m!218719))

(assert (=> b!142183 d!45651))

(declare-fun d!45653 () Bool)

(assert (=> d!45653 (validate_offset_bits!1 ((_ sign_extend 32) (size!2950 (buf!3374 (_2!6645 lt!220448)))) ((_ sign_extend 32) (currentByte!6243 (_2!6645 lt!220447))) ((_ sign_extend 32) (currentBit!6238 (_2!6645 lt!220447))) lt!220450)))

(declare-fun lt!220873 () Unit!8888)

(declare-fun choose!9 (BitStream!5158 array!6516 (_ BitVec 64) BitStream!5158) Unit!8888)

(assert (=> d!45653 (= lt!220873 (choose!9 (_2!6645 lt!220447) (buf!3374 (_2!6645 lt!220448)) lt!220450 (BitStream!5159 (buf!3374 (_2!6645 lt!220448)) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447)))))))

(assert (=> d!45653 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6645 lt!220447) (buf!3374 (_2!6645 lt!220448)) lt!220450) lt!220873)))

(declare-fun bs!11204 () Bool)

(assert (= bs!11204 d!45653))

(assert (=> bs!11204 m!218363))

(declare-fun m!218721 () Bool)

(assert (=> bs!11204 m!218721))

(assert (=> b!142183 d!45653))

(declare-fun b!142534 () Bool)

(declare-fun res!118969 () Bool)

(declare-fun e!94939 () Bool)

(assert (=> b!142534 (=> (not res!118969) (not e!94939))))

(declare-fun lt!220972 () tuple2!12628)

(assert (=> b!142534 (= res!118969 (isPrefixOf!0 (_2!6647 lt!220972) (_2!6645 lt!220448)))))

(declare-fun b!142535 () Bool)

(declare-fun res!118968 () Bool)

(assert (=> b!142535 (=> (not res!118968) (not e!94939))))

(assert (=> b!142535 (= res!118968 (isPrefixOf!0 (_1!6647 lt!220972) (_2!6645 lt!220447)))))

(declare-fun lt!220984 () (_ BitVec 64))

(declare-fun b!142537 () Bool)

(declare-fun lt!220971 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5158 (_ BitVec 64)) BitStream!5158)

(assert (=> b!142537 (= e!94939 (= (_1!6647 lt!220972) (withMovedBitIndex!0 (_2!6647 lt!220972) (bvsub lt!220971 lt!220984))))))

(assert (=> b!142537 (or (= (bvand lt!220971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220984 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220971 lt!220984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142537 (= lt!220984 (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220448))) (currentByte!6243 (_2!6645 lt!220448)) (currentBit!6238 (_2!6645 lt!220448))))))

(assert (=> b!142537 (= lt!220971 (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447))))))

(declare-fun b!142538 () Bool)

(declare-fun e!94940 () Unit!8888)

(declare-fun Unit!8895 () Unit!8888)

(assert (=> b!142538 (= e!94940 Unit!8895)))

(declare-fun b!142536 () Bool)

(declare-fun lt!220967 () Unit!8888)

(assert (=> b!142536 (= e!94940 lt!220967)))

(declare-fun lt!220968 () (_ BitVec 64))

(assert (=> b!142536 (= lt!220968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!220977 () (_ BitVec 64))

(assert (=> b!142536 (= lt!220977 (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6516 array!6516 (_ BitVec 64) (_ BitVec 64)) Unit!8888)

(assert (=> b!142536 (= lt!220967 (arrayBitRangesEqSymmetric!0 (buf!3374 (_2!6645 lt!220447)) (buf!3374 (_2!6645 lt!220448)) lt!220968 lt!220977))))

(assert (=> b!142536 (arrayBitRangesEq!0 (buf!3374 (_2!6645 lt!220448)) (buf!3374 (_2!6645 lt!220447)) lt!220968 lt!220977)))

(declare-fun d!45655 () Bool)

(assert (=> d!45655 e!94939))

(declare-fun res!118970 () Bool)

(assert (=> d!45655 (=> (not res!118970) (not e!94939))))

(assert (=> d!45655 (= res!118970 (isPrefixOf!0 (_1!6647 lt!220972) (_2!6647 lt!220972)))))

(declare-fun lt!220980 () BitStream!5158)

(assert (=> d!45655 (= lt!220972 (tuple2!12629 lt!220980 (_2!6645 lt!220448)))))

(declare-fun lt!220975 () Unit!8888)

(declare-fun lt!220982 () Unit!8888)

(assert (=> d!45655 (= lt!220975 lt!220982)))

(assert (=> d!45655 (isPrefixOf!0 lt!220980 (_2!6645 lt!220448))))

(assert (=> d!45655 (= lt!220982 (lemmaIsPrefixTransitive!0 lt!220980 (_2!6645 lt!220448) (_2!6645 lt!220448)))))

(declare-fun lt!220970 () Unit!8888)

(declare-fun lt!220965 () Unit!8888)

(assert (=> d!45655 (= lt!220970 lt!220965)))

(assert (=> d!45655 (isPrefixOf!0 lt!220980 (_2!6645 lt!220448))))

(assert (=> d!45655 (= lt!220965 (lemmaIsPrefixTransitive!0 lt!220980 (_2!6645 lt!220447) (_2!6645 lt!220448)))))

(declare-fun lt!220976 () Unit!8888)

(assert (=> d!45655 (= lt!220976 e!94940)))

(declare-fun c!7830 () Bool)

(assert (=> d!45655 (= c!7830 (not (= (size!2950 (buf!3374 (_2!6645 lt!220447))) #b00000000000000000000000000000000)))))

(declare-fun lt!220983 () Unit!8888)

(declare-fun lt!220969 () Unit!8888)

(assert (=> d!45655 (= lt!220983 lt!220969)))

(assert (=> d!45655 (isPrefixOf!0 (_2!6645 lt!220448) (_2!6645 lt!220448))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5158) Unit!8888)

(assert (=> d!45655 (= lt!220969 (lemmaIsPrefixRefl!0 (_2!6645 lt!220448)))))

(declare-fun lt!220981 () Unit!8888)

(declare-fun lt!220974 () Unit!8888)

(assert (=> d!45655 (= lt!220981 lt!220974)))

(assert (=> d!45655 (= lt!220974 (lemmaIsPrefixRefl!0 (_2!6645 lt!220448)))))

(declare-fun lt!220966 () Unit!8888)

(declare-fun lt!220979 () Unit!8888)

(assert (=> d!45655 (= lt!220966 lt!220979)))

(assert (=> d!45655 (isPrefixOf!0 lt!220980 lt!220980)))

(assert (=> d!45655 (= lt!220979 (lemmaIsPrefixRefl!0 lt!220980))))

(declare-fun lt!220978 () Unit!8888)

(declare-fun lt!220973 () Unit!8888)

(assert (=> d!45655 (= lt!220978 lt!220973)))

(assert (=> d!45655 (isPrefixOf!0 (_2!6645 lt!220447) (_2!6645 lt!220447))))

(assert (=> d!45655 (= lt!220973 (lemmaIsPrefixRefl!0 (_2!6645 lt!220447)))))

(assert (=> d!45655 (= lt!220980 (BitStream!5159 (buf!3374 (_2!6645 lt!220448)) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447))))))

(assert (=> d!45655 (isPrefixOf!0 (_2!6645 lt!220447) (_2!6645 lt!220448))))

(assert (=> d!45655 (= (reader!0 (_2!6645 lt!220447) (_2!6645 lt!220448)) lt!220972)))

(assert (= (and d!45655 c!7830) b!142536))

(assert (= (and d!45655 (not c!7830)) b!142538))

(assert (= (and d!45655 res!118970) b!142535))

(assert (= (and b!142535 res!118968) b!142534))

(assert (= (and b!142534 res!118969) b!142537))

(declare-fun m!218757 () Bool)

(assert (=> d!45655 m!218757))

(declare-fun m!218759 () Bool)

(assert (=> d!45655 m!218759))

(declare-fun m!218761 () Bool)

(assert (=> d!45655 m!218761))

(declare-fun m!218763 () Bool)

(assert (=> d!45655 m!218763))

(assert (=> d!45655 m!218351))

(declare-fun m!218765 () Bool)

(assert (=> d!45655 m!218765))

(declare-fun m!218767 () Bool)

(assert (=> d!45655 m!218767))

(declare-fun m!218769 () Bool)

(assert (=> d!45655 m!218769))

(declare-fun m!218771 () Bool)

(assert (=> d!45655 m!218771))

(declare-fun m!218773 () Bool)

(assert (=> d!45655 m!218773))

(declare-fun m!218775 () Bool)

(assert (=> d!45655 m!218775))

(declare-fun m!218777 () Bool)

(assert (=> b!142535 m!218777))

(declare-fun m!218779 () Bool)

(assert (=> b!142534 m!218779))

(assert (=> b!142536 m!218317))

(declare-fun m!218781 () Bool)

(assert (=> b!142536 m!218781))

(declare-fun m!218783 () Bool)

(assert (=> b!142536 m!218783))

(declare-fun m!218785 () Bool)

(assert (=> b!142537 m!218785))

(assert (=> b!142537 m!218315))

(assert (=> b!142537 m!218317))

(assert (=> b!142183 d!45655))

(declare-fun d!45684 () Bool)

(assert (=> d!45684 (= (array_inv!2739 arr!237) (bvsge (size!2950 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27594 d!45684))

(declare-fun d!45686 () Bool)

(assert (=> d!45686 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6238 thiss!1634) (currentByte!6243 thiss!1634) (size!2950 (buf!3374 thiss!1634))))))

(declare-fun bs!11209 () Bool)

(assert (= bs!11209 d!45686))

(assert (=> bs!11209 m!218353))

(assert (=> start!27594 d!45686))

(declare-fun d!45690 () Bool)

(assert (=> d!45690 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2950 (buf!3374 thiss!1634))) ((_ sign_extend 32) (currentByte!6243 thiss!1634)) ((_ sign_extend 32) (currentBit!6238 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2950 (buf!3374 thiss!1634))) ((_ sign_extend 32) (currentByte!6243 thiss!1634)) ((_ sign_extend 32) (currentBit!6238 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11210 () Bool)

(assert (= bs!11210 d!45690))

(assert (=> bs!11210 m!218515))

(assert (=> b!142173 d!45690))

(declare-fun d!45692 () Bool)

(declare-datatypes ((tuple2!12650 0))(
  ( (tuple2!12651 (_1!6662 (_ BitVec 8)) (_2!6662 BitStream!5158)) )
))
(declare-fun lt!220998 () tuple2!12650)

(declare-fun readByte!0 (BitStream!5158) tuple2!12650)

(assert (=> d!45692 (= lt!220998 (readByte!0 (_1!6647 lt!220452)))))

(assert (=> d!45692 (= (readBytePure!0 (_1!6647 lt!220452)) (tuple2!12627 (_2!6662 lt!220998) (_1!6662 lt!220998)))))

(declare-fun bs!11211 () Bool)

(assert (= bs!11211 d!45692))

(declare-fun m!218805 () Bool)

(assert (=> bs!11211 m!218805))

(assert (=> b!142176 d!45692))

(declare-fun b!142544 () Bool)

(declare-fun res!118977 () Bool)

(declare-fun e!94944 () Bool)

(assert (=> b!142544 (=> (not res!118977) (not e!94944))))

(declare-fun lt!221006 () tuple2!12628)

(assert (=> b!142544 (= res!118977 (isPrefixOf!0 (_2!6647 lt!221006) (_2!6645 lt!220447)))))

(declare-fun b!142545 () Bool)

(declare-fun res!118976 () Bool)

(assert (=> b!142545 (=> (not res!118976) (not e!94944))))

(assert (=> b!142545 (= res!118976 (isPrefixOf!0 (_1!6647 lt!221006) thiss!1634))))

(declare-fun b!142547 () Bool)

(declare-fun lt!221018 () (_ BitVec 64))

(declare-fun lt!221005 () (_ BitVec 64))

(assert (=> b!142547 (= e!94944 (= (_1!6647 lt!221006) (withMovedBitIndex!0 (_2!6647 lt!221006) (bvsub lt!221005 lt!221018))))))

(assert (=> b!142547 (or (= (bvand lt!221005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221018 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221005 lt!221018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142547 (= lt!221018 (bitIndex!0 (size!2950 (buf!3374 (_2!6645 lt!220447))) (currentByte!6243 (_2!6645 lt!220447)) (currentBit!6238 (_2!6645 lt!220447))))))

(assert (=> b!142547 (= lt!221005 (bitIndex!0 (size!2950 (buf!3374 thiss!1634)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634)))))

(declare-fun b!142548 () Bool)

(declare-fun e!94945 () Unit!8888)

(declare-fun Unit!8898 () Unit!8888)

(assert (=> b!142548 (= e!94945 Unit!8898)))

(declare-fun b!142546 () Bool)

(declare-fun lt!221001 () Unit!8888)

(assert (=> b!142546 (= e!94945 lt!221001)))

(declare-fun lt!221002 () (_ BitVec 64))

(assert (=> b!142546 (= lt!221002 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!221011 () (_ BitVec 64))

(assert (=> b!142546 (= lt!221011 (bitIndex!0 (size!2950 (buf!3374 thiss!1634)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634)))))

(assert (=> b!142546 (= lt!221001 (arrayBitRangesEqSymmetric!0 (buf!3374 thiss!1634) (buf!3374 (_2!6645 lt!220447)) lt!221002 lt!221011))))

(assert (=> b!142546 (arrayBitRangesEq!0 (buf!3374 (_2!6645 lt!220447)) (buf!3374 thiss!1634) lt!221002 lt!221011)))

(declare-fun d!45694 () Bool)

(assert (=> d!45694 e!94944))

(declare-fun res!118978 () Bool)

(assert (=> d!45694 (=> (not res!118978) (not e!94944))))

(assert (=> d!45694 (= res!118978 (isPrefixOf!0 (_1!6647 lt!221006) (_2!6647 lt!221006)))))

(declare-fun lt!221014 () BitStream!5158)

(assert (=> d!45694 (= lt!221006 (tuple2!12629 lt!221014 (_2!6645 lt!220447)))))

(declare-fun lt!221009 () Unit!8888)

(declare-fun lt!221016 () Unit!8888)

(assert (=> d!45694 (= lt!221009 lt!221016)))

(assert (=> d!45694 (isPrefixOf!0 lt!221014 (_2!6645 lt!220447))))

(assert (=> d!45694 (= lt!221016 (lemmaIsPrefixTransitive!0 lt!221014 (_2!6645 lt!220447) (_2!6645 lt!220447)))))

(declare-fun lt!221004 () Unit!8888)

(declare-fun lt!220999 () Unit!8888)

(assert (=> d!45694 (= lt!221004 lt!220999)))

(assert (=> d!45694 (isPrefixOf!0 lt!221014 (_2!6645 lt!220447))))

(assert (=> d!45694 (= lt!220999 (lemmaIsPrefixTransitive!0 lt!221014 thiss!1634 (_2!6645 lt!220447)))))

(declare-fun lt!221010 () Unit!8888)

(assert (=> d!45694 (= lt!221010 e!94945)))

(declare-fun c!7831 () Bool)

(assert (=> d!45694 (= c!7831 (not (= (size!2950 (buf!3374 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!221017 () Unit!8888)

(declare-fun lt!221003 () Unit!8888)

(assert (=> d!45694 (= lt!221017 lt!221003)))

(assert (=> d!45694 (isPrefixOf!0 (_2!6645 lt!220447) (_2!6645 lt!220447))))

(assert (=> d!45694 (= lt!221003 (lemmaIsPrefixRefl!0 (_2!6645 lt!220447)))))

(declare-fun lt!221015 () Unit!8888)

(declare-fun lt!221008 () Unit!8888)

(assert (=> d!45694 (= lt!221015 lt!221008)))

(assert (=> d!45694 (= lt!221008 (lemmaIsPrefixRefl!0 (_2!6645 lt!220447)))))

(declare-fun lt!221000 () Unit!8888)

(declare-fun lt!221013 () Unit!8888)

(assert (=> d!45694 (= lt!221000 lt!221013)))

(assert (=> d!45694 (isPrefixOf!0 lt!221014 lt!221014)))

(assert (=> d!45694 (= lt!221013 (lemmaIsPrefixRefl!0 lt!221014))))

(declare-fun lt!221012 () Unit!8888)

(declare-fun lt!221007 () Unit!8888)

(assert (=> d!45694 (= lt!221012 lt!221007)))

(assert (=> d!45694 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45694 (= lt!221007 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45694 (= lt!221014 (BitStream!5159 (buf!3374 (_2!6645 lt!220447)) (currentByte!6243 thiss!1634) (currentBit!6238 thiss!1634)))))

(assert (=> d!45694 (isPrefixOf!0 thiss!1634 (_2!6645 lt!220447))))

(assert (=> d!45694 (= (reader!0 thiss!1634 (_2!6645 lt!220447)) lt!221006)))

(assert (= (and d!45694 c!7831) b!142546))

(assert (= (and d!45694 (not c!7831)) b!142548))

(assert (= (and d!45694 res!118978) b!142545))

(assert (= (and b!142545 res!118976) b!142544))

(assert (= (and b!142544 res!118977) b!142547))

(assert (=> d!45694 m!218767))

(declare-fun m!218807 () Bool)

(assert (=> d!45694 m!218807))

(declare-fun m!218809 () Bool)

(assert (=> d!45694 m!218809))

(declare-fun m!218811 () Bool)

(assert (=> d!45694 m!218811))

(assert (=> d!45694 m!218357))

(declare-fun m!218813 () Bool)

(assert (=> d!45694 m!218813))

(declare-fun m!218815 () Bool)

(assert (=> d!45694 m!218815))

(declare-fun m!218817 () Bool)

(assert (=> d!45694 m!218817))

(assert (=> d!45694 m!218773))

(declare-fun m!218819 () Bool)

(assert (=> d!45694 m!218819))

(declare-fun m!218821 () Bool)

(assert (=> d!45694 m!218821))

(declare-fun m!218823 () Bool)

(assert (=> b!142545 m!218823))

(declare-fun m!218826 () Bool)

(assert (=> b!142544 m!218826))

(assert (=> b!142546 m!218343))

(declare-fun m!218829 () Bool)

(assert (=> b!142546 m!218829))

(declare-fun m!218831 () Bool)

(assert (=> b!142546 m!218831))

(declare-fun m!218833 () Bool)

(assert (=> b!142547 m!218833))

(assert (=> b!142547 m!218317))

(assert (=> b!142547 m!218343))

(assert (=> b!142176 d!45694))

(declare-fun d!45696 () Bool)

(assert (=> d!45696 (= (array_inv!2739 (buf!3374 thiss!1634)) (bvsge (size!2950 (buf!3374 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!142177 d!45696))

(assert (=> b!142175 d!45573))

(push 1)

(assert (not d!45579))

(assert (not b!142321))

(assert (not b!142536))

(assert (not b!142460))

(assert (not d!45692))

(assert (not d!45623))

(assert (not d!45569))

(assert (not bm!1845))

(assert (not b!142545))

(assert (not b!142343))

(assert (not d!45614))

(assert (not b!142547))

(assert (not b!142537))

(assert (not d!45627))

(assert (not b!142309))

(assert (not b!142407))

(assert (not b!142341))

(assert (not d!45686))

(assert (not b!142535))

(assert (not d!45563))

(assert (not b!142459))

(assert (not b!142332))

(assert (not d!45655))

(assert (not d!45573))

(assert (not b!142546))

(assert (not b!142458))

(assert (not b!142308))

(assert (not b!142319))

(assert (not b!142410))

(assert (not b!142421))

(assert (not b!142330))

(assert (not d!45651))

(assert (not d!45653))

(assert (not b!142534))

(assert (not d!45647))

(assert (not b!142406))

(assert (not b!142408))

(assert (not d!45625))

(assert (not b!142544))

(assert (not d!45629))

(assert (not d!45690))

(assert (not b!142409))

(assert (not b!142340))

(assert (not b!142310))

(assert (not d!45694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

