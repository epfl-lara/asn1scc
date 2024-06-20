; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27596 () Bool)

(assert start!27596)

(declare-fun b!142215 () Bool)

(declare-fun res!118696 () Bool)

(declare-fun e!94733 () Bool)

(assert (=> b!142215 (=> (not res!118696) (not e!94733))))

(declare-datatypes ((array!6518 0))(
  ( (array!6519 (arr!3664 (Array (_ BitVec 32) (_ BitVec 8))) (size!2951 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5160 0))(
  ( (BitStream!5161 (buf!3375 array!6518) (currentByte!6244 (_ BitVec 32)) (currentBit!6239 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8890 0))(
  ( (Unit!8891) )
))
(declare-datatypes ((tuple2!12630 0))(
  ( (tuple2!12631 (_1!6648 Unit!8890) (_2!6648 BitStream!5160)) )
))
(declare-fun lt!220488 () tuple2!12630)

(declare-fun thiss!1634 () BitStream!5160)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142215 (= res!118696 (= (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2951 (buf!3375 thiss!1634)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634)))))))

(declare-fun lt!220485 () (_ BitVec 64))

(declare-fun b!142216 () Bool)

(declare-fun lt!220487 () tuple2!12630)

(declare-fun e!94737 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6518 array!6518 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142216 (= e!94737 (arrayBitRangesEq!0 (buf!3375 (_2!6648 lt!220488)) (buf!3375 (_2!6648 lt!220487)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!220485))))

(declare-fun b!142217 () Bool)

(declare-fun res!118694 () Bool)

(declare-fun e!94731 () Bool)

(assert (=> b!142217 (=> (not res!118694) (not e!94731))))

(declare-fun isPrefixOf!0 (BitStream!5160 BitStream!5160) Bool)

(assert (=> b!142217 (= res!118694 (isPrefixOf!0 (_2!6648 lt!220488) (_2!6648 lt!220487)))))

(declare-fun b!142218 () Bool)

(declare-fun e!94734 () Bool)

(assert (=> b!142218 (= e!94734 e!94731)))

(declare-fun res!118691 () Bool)

(assert (=> b!142218 (=> (not res!118691) (not e!94731))))

(declare-fun lt!220484 () (_ BitVec 64))

(assert (=> b!142218 (= res!118691 (= (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220487))) (currentByte!6244 (_2!6648 lt!220487)) (currentBit!6239 (_2!6648 lt!220487))) (bvadd (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!220484))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!142218 (= lt!220484 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142220 () Bool)

(declare-fun e!94738 () Bool)

(assert (=> b!142220 (= e!94738 (not e!94737))))

(declare-fun res!118700 () Bool)

(assert (=> b!142220 (=> res!118700 e!94737)))

(assert (=> b!142220 (= res!118700 (bvsgt lt!220485 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))))))))

(assert (=> b!142220 (= lt!220485 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634))))))

(declare-fun e!94736 () Bool)

(assert (=> b!142220 e!94736))

(declare-fun res!118690 () Bool)

(assert (=> b!142220 (=> (not res!118690) (not e!94736))))

(assert (=> b!142220 (= res!118690 (isPrefixOf!0 thiss!1634 (_2!6648 lt!220487)))))

(declare-fun lt!220483 () Unit!8890)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5160 BitStream!5160 BitStream!5160) Unit!8890)

(assert (=> b!142220 (= lt!220483 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6648 lt!220488) (_2!6648 lt!220487)))))

(assert (=> b!142220 e!94734))

(declare-fun res!118692 () Bool)

(assert (=> b!142220 (=> (not res!118692) (not e!94734))))

(assert (=> b!142220 (= res!118692 (= (size!2951 (buf!3375 (_2!6648 lt!220488))) (size!2951 (buf!3375 (_2!6648 lt!220487)))))))

(declare-fun arr!237 () array!6518)

(declare-fun appendByteArrayLoop!0 (BitStream!5160 array!6518 (_ BitVec 32) (_ BitVec 32)) tuple2!12630)

(assert (=> b!142220 (= lt!220487 (appendByteArrayLoop!0 (_2!6648 lt!220488) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142220 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!220482 () Unit!8890)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5160 BitStream!5160 (_ BitVec 64) (_ BitVec 32)) Unit!8890)

(assert (=> b!142220 (= lt!220482 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6648 lt!220488) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!142220 e!94733))

(declare-fun res!118689 () Bool)

(assert (=> b!142220 (=> (not res!118689) (not e!94733))))

(assert (=> b!142220 (= res!118689 (= (size!2951 (buf!3375 thiss!1634)) (size!2951 (buf!3375 (_2!6648 lt!220488)))))))

(declare-fun appendByte!0 (BitStream!5160 (_ BitVec 8)) tuple2!12630)

(assert (=> b!142220 (= lt!220488 (appendByte!0 thiss!1634 (select (arr!3664 arr!237) from!447)))))

(declare-fun b!142221 () Bool)

(declare-fun e!94732 () Bool)

(assert (=> b!142221 (= e!94731 (not e!94732))))

(declare-fun res!118697 () Bool)

(assert (=> b!142221 (=> res!118697 e!94732)))

(declare-datatypes ((tuple2!12632 0))(
  ( (tuple2!12633 (_1!6649 BitStream!5160) (_2!6649 array!6518)) )
))
(declare-fun lt!220480 () tuple2!12632)

(declare-datatypes ((tuple2!12634 0))(
  ( (tuple2!12635 (_1!6650 BitStream!5160) (_2!6650 BitStream!5160)) )
))
(declare-fun lt!220481 () tuple2!12634)

(assert (=> b!142221 (= res!118697 (or (not (= (size!2951 (_2!6649 lt!220480)) (size!2951 arr!237))) (not (= (_1!6649 lt!220480) (_2!6650 lt!220481)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5160 array!6518 (_ BitVec 32) (_ BitVec 32)) tuple2!12632)

(assert (=> b!142221 (= lt!220480 (readByteArrayLoopPure!0 (_1!6650 lt!220481) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142221 (validate_offset_bits!1 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220487)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488))) lt!220484)))

(declare-fun lt!220486 () Unit!8890)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5160 array!6518 (_ BitVec 64)) Unit!8890)

(assert (=> b!142221 (= lt!220486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6648 lt!220488) (buf!3375 (_2!6648 lt!220487)) lt!220484))))

(declare-fun reader!0 (BitStream!5160 BitStream!5160) tuple2!12634)

(assert (=> b!142221 (= lt!220481 (reader!0 (_2!6648 lt!220488) (_2!6648 lt!220487)))))

(declare-fun b!142222 () Bool)

(declare-fun res!118693 () Bool)

(assert (=> b!142222 (=> (not res!118693) (not e!94738))))

(assert (=> b!142222 (= res!118693 (bvslt from!447 to!404))))

(declare-fun lt!220490 () tuple2!12634)

(declare-fun b!142223 () Bool)

(declare-datatypes ((tuple2!12636 0))(
  ( (tuple2!12637 (_1!6651 BitStream!5160) (_2!6651 (_ BitVec 8))) )
))
(declare-fun lt!220489 () tuple2!12636)

(assert (=> b!142223 (= e!94733 (and (= (_2!6651 lt!220489) (select (arr!3664 arr!237) from!447)) (= (_1!6651 lt!220489) (_2!6650 lt!220490))))))

(declare-fun readBytePure!0 (BitStream!5160) tuple2!12636)

(assert (=> b!142223 (= lt!220489 (readBytePure!0 (_1!6650 lt!220490)))))

(assert (=> b!142223 (= lt!220490 (reader!0 thiss!1634 (_2!6648 lt!220488)))))

(declare-fun b!142224 () Bool)

(declare-fun res!118695 () Bool)

(assert (=> b!142224 (=> (not res!118695) (not e!94738))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142224 (= res!118695 (invariant!0 (currentBit!6239 thiss!1634) (currentByte!6244 thiss!1634) (size!2951 (buf!3375 thiss!1634))))))

(declare-fun b!142225 () Bool)

(declare-fun e!94740 () Bool)

(declare-fun array_inv!2740 (array!6518) Bool)

(assert (=> b!142225 (= e!94740 (array_inv!2740 (buf!3375 thiss!1634)))))

(declare-fun b!142226 () Bool)

(assert (=> b!142226 (= e!94736 (invariant!0 (currentBit!6239 thiss!1634) (currentByte!6244 thiss!1634) (size!2951 (buf!3375 (_2!6648 lt!220488)))))))

(declare-fun b!142227 () Bool)

(declare-fun arrayRangesEq!267 (array!6518 array!6518 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142227 (= e!94732 (not (arrayRangesEq!267 arr!237 (_2!6649 lt!220480) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142219 () Bool)

(declare-fun res!118702 () Bool)

(assert (=> b!142219 (=> res!118702 e!94737)))

(assert (=> b!142219 (= res!118702 (bvsgt lt!220485 (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220487))) (currentByte!6244 (_2!6648 lt!220487)) (currentBit!6239 (_2!6648 lt!220487)))))))

(declare-fun res!118699 () Bool)

(assert (=> start!27596 (=> (not res!118699) (not e!94738))))

(assert (=> start!27596 (= res!118699 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2951 arr!237))))))

(assert (=> start!27596 e!94738))

(assert (=> start!27596 true))

(assert (=> start!27596 (array_inv!2740 arr!237)))

(declare-fun inv!12 (BitStream!5160) Bool)

(assert (=> start!27596 (and (inv!12 thiss!1634) e!94740)))

(declare-fun b!142228 () Bool)

(declare-fun res!118698 () Bool)

(assert (=> b!142228 (=> (not res!118698) (not e!94733))))

(assert (=> b!142228 (= res!118698 (isPrefixOf!0 thiss!1634 (_2!6648 lt!220488)))))

(declare-fun b!142229 () Bool)

(declare-fun res!118701 () Bool)

(assert (=> b!142229 (=> (not res!118701) (not e!94738))))

(assert (=> b!142229 (= res!118701 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2951 (buf!3375 thiss!1634))) ((_ sign_extend 32) (currentByte!6244 thiss!1634)) ((_ sign_extend 32) (currentBit!6239 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27596 res!118699) b!142229))

(assert (= (and b!142229 res!118701) b!142222))

(assert (= (and b!142222 res!118693) b!142224))

(assert (= (and b!142224 res!118695) b!142220))

(assert (= (and b!142220 res!118689) b!142215))

(assert (= (and b!142215 res!118696) b!142228))

(assert (= (and b!142228 res!118698) b!142223))

(assert (= (and b!142220 res!118692) b!142218))

(assert (= (and b!142218 res!118691) b!142217))

(assert (= (and b!142217 res!118694) b!142221))

(assert (= (and b!142221 (not res!118697)) b!142227))

(assert (= (and b!142220 res!118690) b!142226))

(assert (= (and b!142220 (not res!118700)) b!142219))

(assert (= (and b!142219 (not res!118702)) b!142216))

(assert (= start!27596 b!142225))

(declare-fun m!218369 () Bool)

(assert (=> b!142225 m!218369))

(declare-fun m!218371 () Bool)

(assert (=> b!142229 m!218371))

(declare-fun m!218373 () Bool)

(assert (=> b!142226 m!218373))

(declare-fun m!218375 () Bool)

(assert (=> b!142217 m!218375))

(declare-fun m!218377 () Bool)

(assert (=> b!142221 m!218377))

(declare-fun m!218379 () Bool)

(assert (=> b!142221 m!218379))

(declare-fun m!218381 () Bool)

(assert (=> b!142221 m!218381))

(declare-fun m!218383 () Bool)

(assert (=> b!142221 m!218383))

(declare-fun m!218385 () Bool)

(assert (=> b!142220 m!218385))

(declare-fun m!218387 () Bool)

(assert (=> b!142220 m!218387))

(declare-fun m!218389 () Bool)

(assert (=> b!142220 m!218389))

(declare-fun m!218391 () Bool)

(assert (=> b!142220 m!218391))

(declare-fun m!218393 () Bool)

(assert (=> b!142220 m!218393))

(declare-fun m!218395 () Bool)

(assert (=> b!142220 m!218395))

(assert (=> b!142220 m!218393))

(declare-fun m!218397 () Bool)

(assert (=> b!142220 m!218397))

(declare-fun m!218399 () Bool)

(assert (=> b!142220 m!218399))

(declare-fun m!218401 () Bool)

(assert (=> b!142219 m!218401))

(declare-fun m!218403 () Bool)

(assert (=> b!142224 m!218403))

(declare-fun m!218405 () Bool)

(assert (=> b!142227 m!218405))

(declare-fun m!218407 () Bool)

(assert (=> start!27596 m!218407))

(declare-fun m!218409 () Bool)

(assert (=> start!27596 m!218409))

(assert (=> b!142223 m!218393))

(declare-fun m!218411 () Bool)

(assert (=> b!142223 m!218411))

(declare-fun m!218413 () Bool)

(assert (=> b!142223 m!218413))

(declare-fun m!218415 () Bool)

(assert (=> b!142215 m!218415))

(declare-fun m!218417 () Bool)

(assert (=> b!142215 m!218417))

(assert (=> b!142218 m!218401))

(assert (=> b!142218 m!218415))

(declare-fun m!218419 () Bool)

(assert (=> b!142228 m!218419))

(declare-fun m!218421 () Bool)

(assert (=> b!142216 m!218421))

(check-sat (not b!142215) (not b!142229) (not b!142216) (not b!142219) (not b!142217) (not b!142227) (not b!142225) (not b!142223) (not b!142220) (not b!142224) (not b!142228) (not b!142218) (not start!27596) (not b!142221) (not b!142226))
(check-sat)
(get-model)

(declare-fun d!45599 () Bool)

(declare-datatypes ((tuple2!12648 0))(
  ( (tuple2!12649 (_1!6661 (_ BitVec 8)) (_2!6661 BitStream!5160)) )
))
(declare-fun lt!220693 () tuple2!12648)

(declare-fun readByte!0 (BitStream!5160) tuple2!12648)

(assert (=> d!45599 (= lt!220693 (readByte!0 (_1!6650 lt!220490)))))

(assert (=> d!45599 (= (readBytePure!0 (_1!6650 lt!220490)) (tuple2!12637 (_2!6661 lt!220693) (_1!6661 lt!220693)))))

(declare-fun bs!11196 () Bool)

(assert (= bs!11196 d!45599))

(declare-fun m!218615 () Bool)

(assert (=> bs!11196 m!218615))

(assert (=> b!142223 d!45599))

(declare-fun b!142436 () Bool)

(declare-fun res!118886 () Bool)

(declare-fun e!94881 () Bool)

(assert (=> b!142436 (=> (not res!118886) (not e!94881))))

(declare-fun lt!220797 () tuple2!12634)

(assert (=> b!142436 (= res!118886 (isPrefixOf!0 (_1!6650 lt!220797) thiss!1634))))

(declare-fun b!142437 () Bool)

(declare-fun e!94880 () Unit!8890)

(declare-fun Unit!8896 () Unit!8890)

(assert (=> b!142437 (= e!94880 Unit!8896)))

(declare-fun d!45605 () Bool)

(assert (=> d!45605 e!94881))

(declare-fun res!118885 () Bool)

(assert (=> d!45605 (=> (not res!118885) (not e!94881))))

(assert (=> d!45605 (= res!118885 (isPrefixOf!0 (_1!6650 lt!220797) (_2!6650 lt!220797)))))

(declare-fun lt!220801 () BitStream!5160)

(assert (=> d!45605 (= lt!220797 (tuple2!12635 lt!220801 (_2!6648 lt!220488)))))

(declare-fun lt!220808 () Unit!8890)

(declare-fun lt!220805 () Unit!8890)

(assert (=> d!45605 (= lt!220808 lt!220805)))

(assert (=> d!45605 (isPrefixOf!0 lt!220801 (_2!6648 lt!220488))))

(assert (=> d!45605 (= lt!220805 (lemmaIsPrefixTransitive!0 lt!220801 (_2!6648 lt!220488) (_2!6648 lt!220488)))))

(declare-fun lt!220810 () Unit!8890)

(declare-fun lt!220815 () Unit!8890)

(assert (=> d!45605 (= lt!220810 lt!220815)))

(assert (=> d!45605 (isPrefixOf!0 lt!220801 (_2!6648 lt!220488))))

(assert (=> d!45605 (= lt!220815 (lemmaIsPrefixTransitive!0 lt!220801 thiss!1634 (_2!6648 lt!220488)))))

(declare-fun lt!220812 () Unit!8890)

(assert (=> d!45605 (= lt!220812 e!94880)))

(declare-fun c!7824 () Bool)

(assert (=> d!45605 (= c!7824 (not (= (size!2951 (buf!3375 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!220804 () Unit!8890)

(declare-fun lt!220800 () Unit!8890)

(assert (=> d!45605 (= lt!220804 lt!220800)))

(assert (=> d!45605 (isPrefixOf!0 (_2!6648 lt!220488) (_2!6648 lt!220488))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5160) Unit!8890)

(assert (=> d!45605 (= lt!220800 (lemmaIsPrefixRefl!0 (_2!6648 lt!220488)))))

(declare-fun lt!220809 () Unit!8890)

(declare-fun lt!220803 () Unit!8890)

(assert (=> d!45605 (= lt!220809 lt!220803)))

(assert (=> d!45605 (= lt!220803 (lemmaIsPrefixRefl!0 (_2!6648 lt!220488)))))

(declare-fun lt!220806 () Unit!8890)

(declare-fun lt!220799 () Unit!8890)

(assert (=> d!45605 (= lt!220806 lt!220799)))

(assert (=> d!45605 (isPrefixOf!0 lt!220801 lt!220801)))

(assert (=> d!45605 (= lt!220799 (lemmaIsPrefixRefl!0 lt!220801))))

(declare-fun lt!220798 () Unit!8890)

(declare-fun lt!220811 () Unit!8890)

(assert (=> d!45605 (= lt!220798 lt!220811)))

(assert (=> d!45605 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45605 (= lt!220811 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45605 (= lt!220801 (BitStream!5161 (buf!3375 (_2!6648 lt!220488)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634)))))

(assert (=> d!45605 (isPrefixOf!0 thiss!1634 (_2!6648 lt!220488))))

(assert (=> d!45605 (= (reader!0 thiss!1634 (_2!6648 lt!220488)) lt!220797)))

(declare-fun b!142438 () Bool)

(declare-fun lt!220802 () Unit!8890)

(assert (=> b!142438 (= e!94880 lt!220802)))

(declare-fun lt!220813 () (_ BitVec 64))

(assert (=> b!142438 (= lt!220813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!220807 () (_ BitVec 64))

(assert (=> b!142438 (= lt!220807 (bitIndex!0 (size!2951 (buf!3375 thiss!1634)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6518 array!6518 (_ BitVec 64) (_ BitVec 64)) Unit!8890)

(assert (=> b!142438 (= lt!220802 (arrayBitRangesEqSymmetric!0 (buf!3375 thiss!1634) (buf!3375 (_2!6648 lt!220488)) lt!220813 lt!220807))))

(assert (=> b!142438 (arrayBitRangesEq!0 (buf!3375 (_2!6648 lt!220488)) (buf!3375 thiss!1634) lt!220813 lt!220807)))

(declare-fun lt!220796 () (_ BitVec 64))

(declare-fun lt!220814 () (_ BitVec 64))

(declare-fun b!142439 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5160 (_ BitVec 64)) BitStream!5160)

(assert (=> b!142439 (= e!94881 (= (_1!6650 lt!220797) (withMovedBitIndex!0 (_2!6650 lt!220797) (bvsub lt!220796 lt!220814))))))

(assert (=> b!142439 (or (= (bvand lt!220796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220814 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220796 lt!220814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142439 (= lt!220814 (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488))))))

(assert (=> b!142439 (= lt!220796 (bitIndex!0 (size!2951 (buf!3375 thiss!1634)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634)))))

(declare-fun b!142440 () Bool)

(declare-fun res!118882 () Bool)

(assert (=> b!142440 (=> (not res!118882) (not e!94881))))

(assert (=> b!142440 (= res!118882 (isPrefixOf!0 (_2!6650 lt!220797) (_2!6648 lt!220488)))))

(assert (= (and d!45605 c!7824) b!142438))

(assert (= (and d!45605 (not c!7824)) b!142437))

(assert (= (and d!45605 res!118885) b!142436))

(assert (= (and b!142436 res!118886) b!142440))

(assert (= (and b!142440 res!118882) b!142439))

(declare-fun m!218651 () Bool)

(assert (=> b!142436 m!218651))

(assert (=> b!142438 m!218417))

(declare-fun m!218653 () Bool)

(assert (=> b!142438 m!218653))

(declare-fun m!218655 () Bool)

(assert (=> b!142438 m!218655))

(declare-fun m!218657 () Bool)

(assert (=> b!142439 m!218657))

(assert (=> b!142439 m!218415))

(assert (=> b!142439 m!218417))

(declare-fun m!218659 () Bool)

(assert (=> b!142440 m!218659))

(declare-fun m!218661 () Bool)

(assert (=> d!45605 m!218661))

(declare-fun m!218663 () Bool)

(assert (=> d!45605 m!218663))

(assert (=> d!45605 m!218419))

(declare-fun m!218665 () Bool)

(assert (=> d!45605 m!218665))

(declare-fun m!218667 () Bool)

(assert (=> d!45605 m!218667))

(declare-fun m!218669 () Bool)

(assert (=> d!45605 m!218669))

(declare-fun m!218671 () Bool)

(assert (=> d!45605 m!218671))

(declare-fun m!218673 () Bool)

(assert (=> d!45605 m!218673))

(declare-fun m!218675 () Bool)

(assert (=> d!45605 m!218675))

(declare-fun m!218677 () Bool)

(assert (=> d!45605 m!218677))

(declare-fun m!218679 () Bool)

(assert (=> d!45605 m!218679))

(assert (=> b!142223 d!45605))

(declare-fun d!45631 () Bool)

(assert (=> d!45631 (= (invariant!0 (currentBit!6239 thiss!1634) (currentByte!6244 thiss!1634) (size!2951 (buf!3375 thiss!1634))) (and (bvsge (currentBit!6239 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6239 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6244 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6244 thiss!1634) (size!2951 (buf!3375 thiss!1634))) (and (= (currentBit!6239 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6244 thiss!1634) (size!2951 (buf!3375 thiss!1634)))))))))

(assert (=> b!142224 d!45631))

(declare-fun d!45633 () Bool)

(declare-fun e!94888 () Bool)

(assert (=> d!45633 e!94888))

(declare-fun res!118906 () Bool)

(assert (=> d!45633 (=> (not res!118906) (not e!94888))))

(declare-fun lt!220860 () (_ BitVec 64))

(declare-fun lt!220857 () (_ BitVec 64))

(declare-fun lt!220861 () (_ BitVec 64))

(assert (=> d!45633 (= res!118906 (= lt!220861 (bvsub lt!220860 lt!220857)))))

(assert (=> d!45633 (or (= (bvand lt!220860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220857 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220860 lt!220857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45633 (= lt!220857 (remainingBits!0 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488)))))))

(declare-fun lt!220856 () (_ BitVec 64))

(declare-fun lt!220859 () (_ BitVec 64))

(assert (=> d!45633 (= lt!220860 (bvmul lt!220856 lt!220859))))

(assert (=> d!45633 (or (= lt!220856 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220859 (bvsdiv (bvmul lt!220856 lt!220859) lt!220856)))))

(assert (=> d!45633 (= lt!220859 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45633 (= lt!220856 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))))))

(assert (=> d!45633 (= lt!220861 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488)))))))

(assert (=> d!45633 (invariant!0 (currentBit!6239 (_2!6648 lt!220488)) (currentByte!6244 (_2!6648 lt!220488)) (size!2951 (buf!3375 (_2!6648 lt!220488))))))

(assert (=> d!45633 (= (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488))) lt!220861)))

(declare-fun b!142461 () Bool)

(declare-fun res!118905 () Bool)

(assert (=> b!142461 (=> (not res!118905) (not e!94888))))

(assert (=> b!142461 (= res!118905 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220861))))

(declare-fun b!142462 () Bool)

(declare-fun lt!220858 () (_ BitVec 64))

(assert (=> b!142462 (= e!94888 (bvsle lt!220861 (bvmul lt!220858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142462 (or (= lt!220858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220858)))))

(assert (=> b!142462 (= lt!220858 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))))))

(assert (= (and d!45633 res!118906) b!142461))

(assert (= (and b!142461 res!118905) b!142462))

(declare-fun m!218697 () Bool)

(assert (=> d!45633 m!218697))

(declare-fun m!218699 () Bool)

(assert (=> d!45633 m!218699))

(assert (=> b!142215 d!45633))

(declare-fun d!45637 () Bool)

(declare-fun e!94889 () Bool)

(assert (=> d!45637 e!94889))

(declare-fun res!118908 () Bool)

(assert (=> d!45637 (=> (not res!118908) (not e!94889))))

(declare-fun lt!220867 () (_ BitVec 64))

(declare-fun lt!220863 () (_ BitVec 64))

(declare-fun lt!220866 () (_ BitVec 64))

(assert (=> d!45637 (= res!118908 (= lt!220867 (bvsub lt!220866 lt!220863)))))

(assert (=> d!45637 (or (= (bvand lt!220866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220863 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220866 lt!220863) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45637 (= lt!220863 (remainingBits!0 ((_ sign_extend 32) (size!2951 (buf!3375 thiss!1634))) ((_ sign_extend 32) (currentByte!6244 thiss!1634)) ((_ sign_extend 32) (currentBit!6239 thiss!1634))))))

(declare-fun lt!220862 () (_ BitVec 64))

(declare-fun lt!220865 () (_ BitVec 64))

(assert (=> d!45637 (= lt!220866 (bvmul lt!220862 lt!220865))))

(assert (=> d!45637 (or (= lt!220862 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220865 (bvsdiv (bvmul lt!220862 lt!220865) lt!220862)))))

(assert (=> d!45637 (= lt!220865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45637 (= lt!220862 ((_ sign_extend 32) (size!2951 (buf!3375 thiss!1634))))))

(assert (=> d!45637 (= lt!220867 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6244 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6239 thiss!1634))))))

(assert (=> d!45637 (invariant!0 (currentBit!6239 thiss!1634) (currentByte!6244 thiss!1634) (size!2951 (buf!3375 thiss!1634)))))

(assert (=> d!45637 (= (bitIndex!0 (size!2951 (buf!3375 thiss!1634)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634)) lt!220867)))

(declare-fun b!142463 () Bool)

(declare-fun res!118907 () Bool)

(assert (=> b!142463 (=> (not res!118907) (not e!94889))))

(assert (=> b!142463 (= res!118907 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220867))))

(declare-fun b!142464 () Bool)

(declare-fun lt!220864 () (_ BitVec 64))

(assert (=> b!142464 (= e!94889 (bvsle lt!220867 (bvmul lt!220864 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142464 (or (= lt!220864 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220864 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220864)))))

(assert (=> b!142464 (= lt!220864 ((_ sign_extend 32) (size!2951 (buf!3375 thiss!1634))))))

(assert (= (and d!45637 res!118908) b!142463))

(assert (= (and b!142463 res!118907) b!142464))

(declare-fun m!218709 () Bool)

(assert (=> d!45637 m!218709))

(assert (=> d!45637 m!218403))

(assert (=> b!142215 d!45637))

(declare-fun d!45641 () Bool)

(assert (=> d!45641 (= (array_inv!2740 (buf!3375 thiss!1634)) (bvsge (size!2951 (buf!3375 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!142225 d!45641))

(declare-fun d!45643 () Bool)

(declare-fun res!118913 () Bool)

(declare-fun e!94894 () Bool)

(assert (=> d!45643 (=> res!118913 e!94894)))

(assert (=> d!45643 (= res!118913 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45643 (= (arrayRangesEq!267 arr!237 (_2!6649 lt!220480) #b00000000000000000000000000000000 to!404) e!94894)))

(declare-fun b!142469 () Bool)

(declare-fun e!94895 () Bool)

(assert (=> b!142469 (= e!94894 e!94895)))

(declare-fun res!118914 () Bool)

(assert (=> b!142469 (=> (not res!118914) (not e!94895))))

(assert (=> b!142469 (= res!118914 (= (select (arr!3664 arr!237) #b00000000000000000000000000000000) (select (arr!3664 (_2!6649 lt!220480)) #b00000000000000000000000000000000)))))

(declare-fun b!142470 () Bool)

(assert (=> b!142470 (= e!94895 (arrayRangesEq!267 arr!237 (_2!6649 lt!220480) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45643 (not res!118913)) b!142469))

(assert (= (and b!142469 res!118914) b!142470))

(declare-fun m!218711 () Bool)

(assert (=> b!142469 m!218711))

(declare-fun m!218713 () Bool)

(assert (=> b!142469 m!218713))

(declare-fun m!218715 () Bool)

(assert (=> b!142470 m!218715))

(assert (=> b!142227 d!45643))

(declare-fun e!94909 () Bool)

(declare-fun lt!220880 () (_ BitVec 32))

(declare-fun b!142485 () Bool)

(declare-datatypes ((tuple4!128 0))(
  ( (tuple4!129 (_1!6663 (_ BitVec 32)) (_2!6663 (_ BitVec 32)) (_3!337 (_ BitVec 32)) (_4!64 (_ BitVec 32))) )
))
(declare-fun lt!220882 () tuple4!128)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142485 (= e!94909 (byteRangesEq!0 (select (arr!3664 (buf!3375 (_2!6648 lt!220488))) (_4!64 lt!220882)) (select (arr!3664 (buf!3375 (_2!6648 lt!220487))) (_4!64 lt!220882)) #b00000000000000000000000000000000 lt!220880))))

(declare-fun b!142486 () Bool)

(declare-fun e!94913 () Bool)

(declare-fun e!94912 () Bool)

(assert (=> b!142486 (= e!94913 e!94912)))

(declare-fun c!7827 () Bool)

(assert (=> b!142486 (= c!7827 (= (_3!337 lt!220882) (_4!64 lt!220882)))))

(declare-fun d!45649 () Bool)

(declare-fun res!118927 () Bool)

(declare-fun e!94910 () Bool)

(assert (=> d!45649 (=> res!118927 e!94910)))

(assert (=> d!45649 (= res!118927 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!220485))))

(assert (=> d!45649 (= (arrayBitRangesEq!0 (buf!3375 (_2!6648 lt!220488)) (buf!3375 (_2!6648 lt!220487)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!220485) e!94910)))

(declare-fun b!142487 () Bool)

(declare-fun res!118925 () Bool)

(assert (=> b!142487 (= res!118925 (= lt!220880 #b00000000000000000000000000000000))))

(assert (=> b!142487 (=> res!118925 e!94909)))

(declare-fun e!94908 () Bool)

(assert (=> b!142487 (= e!94908 e!94909)))

(declare-fun b!142488 () Bool)

(declare-fun e!94911 () Bool)

(assert (=> b!142488 (= e!94911 (arrayRangesEq!267 (buf!3375 (_2!6648 lt!220488)) (buf!3375 (_2!6648 lt!220487)) (_1!6663 lt!220882) (_2!6663 lt!220882)))))

(declare-fun b!142489 () Bool)

(assert (=> b!142489 (= e!94912 e!94908)))

(declare-fun res!118928 () Bool)

(declare-fun call!1854 () Bool)

(assert (=> b!142489 (= res!118928 call!1854)))

(assert (=> b!142489 (=> (not res!118928) (not e!94908))))

(declare-fun b!142490 () Bool)

(assert (=> b!142490 (= e!94910 e!94913)))

(declare-fun res!118929 () Bool)

(assert (=> b!142490 (=> (not res!118929) (not e!94913))))

(assert (=> b!142490 (= res!118929 e!94911)))

(declare-fun res!118926 () Bool)

(assert (=> b!142490 (=> res!118926 e!94911)))

(assert (=> b!142490 (= res!118926 (bvsge (_1!6663 lt!220882) (_2!6663 lt!220882)))))

(assert (=> b!142490 (= lt!220880 ((_ extract 31 0) (bvsrem lt!220485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!220881 () (_ BitVec 32))

(assert (=> b!142490 (= lt!220881 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!128)

(assert (=> b!142490 (= lt!220882 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!220485))))

(declare-fun b!142491 () Bool)

(assert (=> b!142491 (= e!94912 call!1854)))

(declare-fun bm!1851 () Bool)

(assert (=> bm!1851 (= call!1854 (byteRangesEq!0 (select (arr!3664 (buf!3375 (_2!6648 lt!220488))) (_3!337 lt!220882)) (select (arr!3664 (buf!3375 (_2!6648 lt!220487))) (_3!337 lt!220882)) lt!220881 (ite c!7827 lt!220880 #b00000000000000000000000000001000)))))

(assert (= (and d!45649 (not res!118927)) b!142490))

(assert (= (and b!142490 (not res!118926)) b!142488))

(assert (= (and b!142490 res!118929) b!142486))

(assert (= (and b!142486 c!7827) b!142491))

(assert (= (and b!142486 (not c!7827)) b!142489))

(assert (= (and b!142489 res!118928) b!142487))

(assert (= (and b!142487 (not res!118925)) b!142485))

(assert (= (or b!142491 b!142489) bm!1851))

(declare-fun m!218723 () Bool)

(assert (=> b!142485 m!218723))

(declare-fun m!218725 () Bool)

(assert (=> b!142485 m!218725))

(assert (=> b!142485 m!218723))

(assert (=> b!142485 m!218725))

(declare-fun m!218727 () Bool)

(assert (=> b!142485 m!218727))

(declare-fun m!218729 () Bool)

(assert (=> b!142488 m!218729))

(declare-fun m!218731 () Bool)

(assert (=> b!142490 m!218731))

(declare-fun m!218733 () Bool)

(assert (=> bm!1851 m!218733))

(declare-fun m!218735 () Bool)

(assert (=> bm!1851 m!218735))

(assert (=> bm!1851 m!218733))

(assert (=> bm!1851 m!218735))

(declare-fun m!218737 () Bool)

(assert (=> bm!1851 m!218737))

(assert (=> b!142216 d!45649))

(declare-fun d!45657 () Bool)

(assert (=> d!45657 (= (invariant!0 (currentBit!6239 thiss!1634) (currentByte!6244 thiss!1634) (size!2951 (buf!3375 (_2!6648 lt!220488)))) (and (bvsge (currentBit!6239 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6239 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6244 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6244 thiss!1634) (size!2951 (buf!3375 (_2!6648 lt!220488)))) (and (= (currentBit!6239 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6244 thiss!1634) (size!2951 (buf!3375 (_2!6648 lt!220488))))))))))

(assert (=> b!142226 d!45657))

(declare-fun d!45659 () Bool)

(declare-fun res!118937 () Bool)

(declare-fun e!94919 () Bool)

(assert (=> d!45659 (=> (not res!118937) (not e!94919))))

(assert (=> d!45659 (= res!118937 (= (size!2951 (buf!3375 thiss!1634)) (size!2951 (buf!3375 (_2!6648 lt!220488)))))))

(assert (=> d!45659 (= (isPrefixOf!0 thiss!1634 (_2!6648 lt!220488)) e!94919)))

(declare-fun b!142498 () Bool)

(declare-fun res!118936 () Bool)

(assert (=> b!142498 (=> (not res!118936) (not e!94919))))

(assert (=> b!142498 (= res!118936 (bvsle (bitIndex!0 (size!2951 (buf!3375 thiss!1634)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634)) (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488)))))))

(declare-fun b!142499 () Bool)

(declare-fun e!94918 () Bool)

(assert (=> b!142499 (= e!94919 e!94918)))

(declare-fun res!118938 () Bool)

(assert (=> b!142499 (=> res!118938 e!94918)))

(assert (=> b!142499 (= res!118938 (= (size!2951 (buf!3375 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142500 () Bool)

(assert (=> b!142500 (= e!94918 (arrayBitRangesEq!0 (buf!3375 thiss!1634) (buf!3375 (_2!6648 lt!220488)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2951 (buf!3375 thiss!1634)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634))))))

(assert (= (and d!45659 res!118937) b!142498))

(assert (= (and b!142498 res!118936) b!142499))

(assert (= (and b!142499 (not res!118938)) b!142500))

(assert (=> b!142498 m!218417))

(assert (=> b!142498 m!218415))

(assert (=> b!142500 m!218417))

(assert (=> b!142500 m!218417))

(declare-fun m!218739 () Bool)

(assert (=> b!142500 m!218739))

(assert (=> b!142228 d!45659))

(declare-fun d!45661 () Bool)

(declare-fun res!118940 () Bool)

(declare-fun e!94921 () Bool)

(assert (=> d!45661 (=> (not res!118940) (not e!94921))))

(assert (=> d!45661 (= res!118940 (= (size!2951 (buf!3375 (_2!6648 lt!220488))) (size!2951 (buf!3375 (_2!6648 lt!220487)))))))

(assert (=> d!45661 (= (isPrefixOf!0 (_2!6648 lt!220488) (_2!6648 lt!220487)) e!94921)))

(declare-fun b!142501 () Bool)

(declare-fun res!118939 () Bool)

(assert (=> b!142501 (=> (not res!118939) (not e!94921))))

(assert (=> b!142501 (= res!118939 (bvsle (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488))) (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220487))) (currentByte!6244 (_2!6648 lt!220487)) (currentBit!6239 (_2!6648 lt!220487)))))))

(declare-fun b!142502 () Bool)

(declare-fun e!94920 () Bool)

(assert (=> b!142502 (= e!94921 e!94920)))

(declare-fun res!118941 () Bool)

(assert (=> b!142502 (=> res!118941 e!94920)))

(assert (=> b!142502 (= res!118941 (= (size!2951 (buf!3375 (_2!6648 lt!220488))) #b00000000000000000000000000000000))))

(declare-fun b!142503 () Bool)

(assert (=> b!142503 (= e!94920 (arrayBitRangesEq!0 (buf!3375 (_2!6648 lt!220488)) (buf!3375 (_2!6648 lt!220487)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488)))))))

(assert (= (and d!45661 res!118940) b!142501))

(assert (= (and b!142501 res!118939) b!142502))

(assert (= (and b!142502 (not res!118941)) b!142503))

(assert (=> b!142501 m!218415))

(assert (=> b!142501 m!218401))

(assert (=> b!142503 m!218415))

(assert (=> b!142503 m!218415))

(declare-fun m!218741 () Bool)

(assert (=> b!142503 m!218741))

(assert (=> b!142217 d!45661))

(declare-fun d!45663 () Bool)

(declare-fun e!94922 () Bool)

(assert (=> d!45663 e!94922))

(declare-fun res!118943 () Bool)

(assert (=> d!45663 (=> (not res!118943) (not e!94922))))

(declare-fun lt!220887 () (_ BitVec 64))

(declare-fun lt!220888 () (_ BitVec 64))

(declare-fun lt!220884 () (_ BitVec 64))

(assert (=> d!45663 (= res!118943 (= lt!220888 (bvsub lt!220887 lt!220884)))))

(assert (=> d!45663 (or (= (bvand lt!220887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220884 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220887 lt!220884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45663 (= lt!220884 (remainingBits!0 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220487)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220487))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220487)))))))

(declare-fun lt!220883 () (_ BitVec 64))

(declare-fun lt!220886 () (_ BitVec 64))

(assert (=> d!45663 (= lt!220887 (bvmul lt!220883 lt!220886))))

(assert (=> d!45663 (or (= lt!220883 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220886 (bvsdiv (bvmul lt!220883 lt!220886) lt!220883)))))

(assert (=> d!45663 (= lt!220886 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45663 (= lt!220883 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220487)))))))

(assert (=> d!45663 (= lt!220888 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220487))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220487)))))))

(assert (=> d!45663 (invariant!0 (currentBit!6239 (_2!6648 lt!220487)) (currentByte!6244 (_2!6648 lt!220487)) (size!2951 (buf!3375 (_2!6648 lt!220487))))))

(assert (=> d!45663 (= (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220487))) (currentByte!6244 (_2!6648 lt!220487)) (currentBit!6239 (_2!6648 lt!220487))) lt!220888)))

(declare-fun b!142504 () Bool)

(declare-fun res!118942 () Bool)

(assert (=> b!142504 (=> (not res!118942) (not e!94922))))

(assert (=> b!142504 (= res!118942 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220888))))

(declare-fun b!142505 () Bool)

(declare-fun lt!220885 () (_ BitVec 64))

(assert (=> b!142505 (= e!94922 (bvsle lt!220888 (bvmul lt!220885 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142505 (or (= lt!220885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220885)))))

(assert (=> b!142505 (= lt!220885 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220487)))))))

(assert (= (and d!45663 res!118943) b!142504))

(assert (= (and b!142504 res!118942) b!142505))

(declare-fun m!218743 () Bool)

(assert (=> d!45663 m!218743))

(declare-fun m!218745 () Bool)

(assert (=> d!45663 m!218745))

(assert (=> b!142219 d!45663))

(declare-fun d!45665 () Bool)

(assert (=> d!45665 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2951 (buf!3375 thiss!1634))) ((_ sign_extend 32) (currentByte!6244 thiss!1634)) ((_ sign_extend 32) (currentBit!6239 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2951 (buf!3375 thiss!1634))) ((_ sign_extend 32) (currentByte!6244 thiss!1634)) ((_ sign_extend 32) (currentBit!6239 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11205 () Bool)

(assert (= bs!11205 d!45665))

(assert (=> bs!11205 m!218709))

(assert (=> b!142229 d!45665))

(declare-fun d!45667 () Bool)

(assert (=> d!45667 (= (array_inv!2740 arr!237) (bvsge (size!2951 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27596 d!45667))

(declare-fun d!45669 () Bool)

(assert (=> d!45669 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6239 thiss!1634) (currentByte!6244 thiss!1634) (size!2951 (buf!3375 thiss!1634))))))

(declare-fun bs!11206 () Bool)

(assert (= bs!11206 d!45669))

(assert (=> bs!11206 m!218403))

(assert (=> start!27596 d!45669))

(assert (=> b!142218 d!45663))

(assert (=> b!142218 d!45633))

(declare-fun d!45671 () Bool)

(declare-fun res!118945 () Bool)

(declare-fun e!94924 () Bool)

(assert (=> d!45671 (=> (not res!118945) (not e!94924))))

(assert (=> d!45671 (= res!118945 (= (size!2951 (buf!3375 thiss!1634)) (size!2951 (buf!3375 (_2!6648 lt!220487)))))))

(assert (=> d!45671 (= (isPrefixOf!0 thiss!1634 (_2!6648 lt!220487)) e!94924)))

(declare-fun b!142506 () Bool)

(declare-fun res!118944 () Bool)

(assert (=> b!142506 (=> (not res!118944) (not e!94924))))

(assert (=> b!142506 (= res!118944 (bvsle (bitIndex!0 (size!2951 (buf!3375 thiss!1634)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634)) (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220487))) (currentByte!6244 (_2!6648 lt!220487)) (currentBit!6239 (_2!6648 lt!220487)))))))

(declare-fun b!142507 () Bool)

(declare-fun e!94923 () Bool)

(assert (=> b!142507 (= e!94924 e!94923)))

(declare-fun res!118946 () Bool)

(assert (=> b!142507 (=> res!118946 e!94923)))

(assert (=> b!142507 (= res!118946 (= (size!2951 (buf!3375 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142508 () Bool)

(assert (=> b!142508 (= e!94923 (arrayBitRangesEq!0 (buf!3375 thiss!1634) (buf!3375 (_2!6648 lt!220487)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2951 (buf!3375 thiss!1634)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634))))))

(assert (= (and d!45671 res!118945) b!142506))

(assert (= (and b!142506 res!118944) b!142507))

(assert (= (and b!142507 (not res!118946)) b!142508))

(assert (=> b!142506 m!218417))

(assert (=> b!142506 m!218401))

(assert (=> b!142508 m!218417))

(assert (=> b!142508 m!218417))

(declare-fun m!218747 () Bool)

(assert (=> b!142508 m!218747))

(assert (=> b!142220 d!45671))

(declare-fun d!45673 () Bool)

(assert (=> d!45673 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11207 () Bool)

(assert (= bs!11207 d!45673))

(assert (=> bs!11207 m!218697))

(assert (=> b!142220 d!45673))

(declare-fun d!45675 () Bool)

(assert (=> d!45675 (isPrefixOf!0 thiss!1634 (_2!6648 lt!220487))))

(declare-fun lt!220891 () Unit!8890)

(declare-fun choose!30 (BitStream!5160 BitStream!5160 BitStream!5160) Unit!8890)

(assert (=> d!45675 (= lt!220891 (choose!30 thiss!1634 (_2!6648 lt!220488) (_2!6648 lt!220487)))))

(assert (=> d!45675 (isPrefixOf!0 thiss!1634 (_2!6648 lt!220488))))

(assert (=> d!45675 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6648 lt!220488) (_2!6648 lt!220487)) lt!220891)))

(declare-fun bs!11208 () Bool)

(assert (= bs!11208 d!45675))

(assert (=> bs!11208 m!218387))

(declare-fun m!218749 () Bool)

(assert (=> bs!11208 m!218749))

(assert (=> bs!11208 m!218419))

(assert (=> b!142220 d!45675))

(declare-fun d!45677 () Bool)

(declare-fun e!94937 () Bool)

(assert (=> d!45677 e!94937))

(declare-fun res!118965 () Bool)

(assert (=> d!45677 (=> (not res!118965) (not e!94937))))

(assert (=> d!45677 (= res!118965 (and (or (let ((rhs!3191 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3191 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3191) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45678 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45678 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45678 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3190 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3190 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3190) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!220957 () Unit!8890)

(declare-fun choose!57 (BitStream!5160 BitStream!5160 (_ BitVec 64) (_ BitVec 32)) Unit!8890)

(assert (=> d!45677 (= lt!220957 (choose!57 thiss!1634 (_2!6648 lt!220488) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45677 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6648 lt!220488) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!220957)))

(declare-fun lt!220956 () (_ BitVec 32))

(declare-fun b!142531 () Bool)

(assert (=> b!142531 (= e!94937 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488))) (bvsub (bvsub to!404 from!447) lt!220956)))))

(assert (=> b!142531 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!220956 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!220956) #b10000000000000000000000000000000)))))

(declare-fun lt!220958 () (_ BitVec 64))

(assert (=> b!142531 (= lt!220956 ((_ extract 31 0) lt!220958))))

(assert (=> b!142531 (and (bvslt lt!220958 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!220958 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!142531 (= lt!220958 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45677 res!118965) b!142531))

(declare-fun m!218751 () Bool)

(assert (=> d!45677 m!218751))

(declare-fun m!218753 () Bool)

(assert (=> b!142531 m!218753))

(assert (=> b!142220 d!45677))

(declare-fun d!45680 () Bool)

(declare-fun e!94938 () Bool)

(assert (=> d!45680 e!94938))

(declare-fun res!118967 () Bool)

(assert (=> d!45680 (=> (not res!118967) (not e!94938))))

(declare-fun lt!220963 () (_ BitVec 64))

(declare-fun lt!220960 () (_ BitVec 64))

(declare-fun lt!220964 () (_ BitVec 64))

(assert (=> d!45680 (= res!118967 (= lt!220964 (bvsub lt!220963 lt!220960)))))

(assert (=> d!45680 (or (= (bvand lt!220963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220963 lt!220960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45680 (= lt!220960 (remainingBits!0 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))) ((_ sign_extend 32) (currentByte!6244 thiss!1634)) ((_ sign_extend 32) (currentBit!6239 thiss!1634))))))

(declare-fun lt!220959 () (_ BitVec 64))

(declare-fun lt!220962 () (_ BitVec 64))

(assert (=> d!45680 (= lt!220963 (bvmul lt!220959 lt!220962))))

(assert (=> d!45680 (or (= lt!220959 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220962 (bvsdiv (bvmul lt!220959 lt!220962) lt!220959)))))

(assert (=> d!45680 (= lt!220962 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45680 (= lt!220959 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))))))

(assert (=> d!45680 (= lt!220964 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6244 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6239 thiss!1634))))))

(assert (=> d!45680 (invariant!0 (currentBit!6239 thiss!1634) (currentByte!6244 thiss!1634) (size!2951 (buf!3375 (_2!6648 lt!220488))))))

(assert (=> d!45680 (= (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634)) lt!220964)))

(declare-fun b!142532 () Bool)

(declare-fun res!118966 () Bool)

(assert (=> b!142532 (=> (not res!118966) (not e!94938))))

(assert (=> b!142532 (= res!118966 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220964))))

(declare-fun b!142533 () Bool)

(declare-fun lt!220961 () (_ BitVec 64))

(assert (=> b!142533 (= e!94938 (bvsle lt!220964 (bvmul lt!220961 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142533 (or (= lt!220961 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220961 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220961)))))

(assert (=> b!142533 (= lt!220961 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))))))

(assert (= (and d!45680 res!118967) b!142532))

(assert (= (and b!142532 res!118966) b!142533))

(declare-fun m!218755 () Bool)

(assert (=> d!45680 m!218755))

(assert (=> d!45680 m!218373))

(assert (=> b!142220 d!45680))

(declare-fun b!142559 () Bool)

(declare-fun e!94953 () Bool)

(declare-fun e!94954 () Bool)

(assert (=> b!142559 (= e!94953 e!94954)))

(declare-fun res!118993 () Bool)

(assert (=> b!142559 (=> (not res!118993) (not e!94954))))

(declare-fun lt!221041 () tuple2!12632)

(declare-fun lt!221046 () tuple2!12634)

(assert (=> b!142559 (= res!118993 (and (= (size!2951 (_2!6649 lt!221041)) (size!2951 arr!237)) (= (_1!6649 lt!221041) (_2!6650 lt!221046))))))

(assert (=> b!142559 (= lt!221041 (readByteArrayLoopPure!0 (_1!6650 lt!221046) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!221039 () Unit!8890)

(declare-fun lt!221043 () Unit!8890)

(assert (=> b!142559 (= lt!221039 lt!221043)))

(declare-fun lt!221045 () tuple2!12630)

(declare-fun lt!221038 () (_ BitVec 64))

(assert (=> b!142559 (validate_offset_bits!1 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!221045)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488))) lt!221038)))

(assert (=> b!142559 (= lt!221043 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6648 lt!220488) (buf!3375 (_2!6648 lt!221045)) lt!221038))))

(declare-fun e!94952 () Bool)

(assert (=> b!142559 e!94952))

(declare-fun res!118991 () Bool)

(assert (=> b!142559 (=> (not res!118991) (not e!94952))))

(assert (=> b!142559 (= res!118991 (and (= (size!2951 (buf!3375 (_2!6648 lt!220488))) (size!2951 (buf!3375 (_2!6648 lt!221045)))) (bvsge lt!221038 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142559 (= lt!221038 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142559 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142559 (= lt!221046 (reader!0 (_2!6648 lt!220488) (_2!6648 lt!221045)))))

(declare-fun b!142560 () Bool)

(declare-fun res!118989 () Bool)

(assert (=> b!142560 (=> (not res!118989) (not e!94953))))

(assert (=> b!142560 (= res!118989 (isPrefixOf!0 (_2!6648 lt!220488) (_2!6648 lt!221045)))))

(declare-fun b!142561 () Bool)

(assert (=> b!142561 (= e!94952 (validate_offset_bits!1 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220488)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488))) lt!221038))))

(declare-fun b!142562 () Bool)

(declare-fun res!118990 () Bool)

(assert (=> b!142562 (=> (not res!118990) (not e!94953))))

(declare-fun lt!221040 () (_ BitVec 64))

(declare-fun lt!221042 () (_ BitVec 64))

(assert (=> b!142562 (= res!118990 (= (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!221045))) (currentByte!6244 (_2!6648 lt!221045)) (currentBit!6239 (_2!6648 lt!221045))) (bvadd lt!221042 lt!221040)))))

(assert (=> b!142562 (or (not (= (bvand lt!221042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221040 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!221042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!221042 lt!221040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!221044 () (_ BitVec 64))

(assert (=> b!142562 (= lt!221040 (bvmul lt!221044 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!142562 (or (= lt!221044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221044)))))

(assert (=> b!142562 (= lt!221044 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142562 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142562 (= lt!221042 (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488))))))

(declare-fun d!45682 () Bool)

(assert (=> d!45682 e!94953))

(declare-fun res!118992 () Bool)

(assert (=> d!45682 (=> (not res!118992) (not e!94953))))

(assert (=> d!45682 (= res!118992 (= (size!2951 (buf!3375 (_2!6648 lt!220488))) (size!2951 (buf!3375 (_2!6648 lt!221045)))))))

(declare-fun choose!64 (BitStream!5160 array!6518 (_ BitVec 32) (_ BitVec 32)) tuple2!12630)

(assert (=> d!45682 (= lt!221045 (choose!64 (_2!6648 lt!220488) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45682 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2951 arr!237)))))

(assert (=> d!45682 (= (appendByteArrayLoop!0 (_2!6648 lt!220488) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!221045)))

(declare-fun b!142563 () Bool)

(assert (=> b!142563 (= e!94954 (arrayRangesEq!267 arr!237 (_2!6649 lt!221041) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!45682 res!118992) b!142562))

(assert (= (and b!142562 res!118990) b!142560))

(assert (= (and b!142560 res!118989) b!142559))

(assert (= (and b!142559 res!118991) b!142561))

(assert (= (and b!142559 res!118993) b!142563))

(declare-fun m!218835 () Bool)

(assert (=> b!142563 m!218835))

(declare-fun m!218837 () Bool)

(assert (=> b!142561 m!218837))

(declare-fun m!218839 () Bool)

(assert (=> b!142560 m!218839))

(declare-fun m!218841 () Bool)

(assert (=> d!45682 m!218841))

(declare-fun m!218843 () Bool)

(assert (=> b!142562 m!218843))

(assert (=> b!142562 m!218415))

(declare-fun m!218845 () Bool)

(assert (=> b!142559 m!218845))

(declare-fun m!218847 () Bool)

(assert (=> b!142559 m!218847))

(declare-fun m!218849 () Bool)

(assert (=> b!142559 m!218849))

(declare-fun m!218851 () Bool)

(assert (=> b!142559 m!218851))

(assert (=> b!142220 d!45682))

(declare-fun d!45698 () Bool)

(declare-fun e!94957 () Bool)

(assert (=> d!45698 e!94957))

(declare-fun res!119002 () Bool)

(assert (=> d!45698 (=> (not res!119002) (not e!94957))))

(declare-fun lt!221060 () tuple2!12630)

(assert (=> d!45698 (= res!119002 (= (size!2951 (buf!3375 thiss!1634)) (size!2951 (buf!3375 (_2!6648 lt!221060)))))))

(declare-fun choose!6 (BitStream!5160 (_ BitVec 8)) tuple2!12630)

(assert (=> d!45698 (= lt!221060 (choose!6 thiss!1634 (select (arr!3664 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45698 (validate_offset_byte!0 ((_ sign_extend 32) (size!2951 (buf!3375 thiss!1634))) ((_ sign_extend 32) (currentByte!6244 thiss!1634)) ((_ sign_extend 32) (currentBit!6239 thiss!1634)))))

(assert (=> d!45698 (= (appendByte!0 thiss!1634 (select (arr!3664 arr!237) from!447)) lt!221060)))

(declare-fun b!142570 () Bool)

(declare-fun res!119000 () Bool)

(assert (=> b!142570 (=> (not res!119000) (not e!94957))))

(declare-fun lt!221059 () (_ BitVec 64))

(declare-fun lt!221057 () (_ BitVec 64))

(assert (=> b!142570 (= res!119000 (= (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!221060))) (currentByte!6244 (_2!6648 lt!221060)) (currentBit!6239 (_2!6648 lt!221060))) (bvadd lt!221059 lt!221057)))))

(assert (=> b!142570 (or (not (= (bvand lt!221059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221057 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!221059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!221059 lt!221057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142570 (= lt!221057 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!142570 (= lt!221059 (bitIndex!0 (size!2951 (buf!3375 thiss!1634)) (currentByte!6244 thiss!1634) (currentBit!6239 thiss!1634)))))

(declare-fun b!142571 () Bool)

(declare-fun res!119001 () Bool)

(assert (=> b!142571 (=> (not res!119001) (not e!94957))))

(assert (=> b!142571 (= res!119001 (isPrefixOf!0 thiss!1634 (_2!6648 lt!221060)))))

(declare-fun lt!221058 () tuple2!12636)

(declare-fun b!142572 () Bool)

(declare-fun lt!221061 () tuple2!12634)

(assert (=> b!142572 (= e!94957 (and (= (_2!6651 lt!221058) (select (arr!3664 arr!237) from!447)) (= (_1!6651 lt!221058) (_2!6650 lt!221061))))))

(assert (=> b!142572 (= lt!221058 (readBytePure!0 (_1!6650 lt!221061)))))

(assert (=> b!142572 (= lt!221061 (reader!0 thiss!1634 (_2!6648 lt!221060)))))

(assert (= (and d!45698 res!119002) b!142570))

(assert (= (and b!142570 res!119000) b!142571))

(assert (= (and b!142571 res!119001) b!142572))

(assert (=> d!45698 m!218393))

(declare-fun m!218853 () Bool)

(assert (=> d!45698 m!218853))

(declare-fun m!218855 () Bool)

(assert (=> d!45698 m!218855))

(declare-fun m!218857 () Bool)

(assert (=> b!142570 m!218857))

(assert (=> b!142570 m!218417))

(declare-fun m!218859 () Bool)

(assert (=> b!142571 m!218859))

(declare-fun m!218861 () Bool)

(assert (=> b!142572 m!218861))

(declare-fun m!218863 () Bool)

(assert (=> b!142572 m!218863))

(assert (=> b!142220 d!45698))

(declare-datatypes ((tuple3!546 0))(
  ( (tuple3!547 (_1!6664 Unit!8890) (_2!6664 BitStream!5160) (_3!338 array!6518)) )
))
(declare-fun lt!221064 () tuple3!546)

(declare-fun d!45700 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5160 array!6518 (_ BitVec 32) (_ BitVec 32)) tuple3!546)

(assert (=> d!45700 (= lt!221064 (readByteArrayLoop!0 (_1!6650 lt!220481) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45700 (= (readByteArrayLoopPure!0 (_1!6650 lt!220481) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12633 (_2!6664 lt!221064) (_3!338 lt!221064)))))

(declare-fun bs!11213 () Bool)

(assert (= bs!11213 d!45700))

(declare-fun m!218865 () Bool)

(assert (=> bs!11213 m!218865))

(assert (=> b!142221 d!45700))

(declare-fun d!45702 () Bool)

(assert (=> d!45702 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220487)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488))) lt!220484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220487)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488)))) lt!220484))))

(declare-fun bs!11214 () Bool)

(assert (= bs!11214 d!45702))

(declare-fun m!218867 () Bool)

(assert (=> bs!11214 m!218867))

(assert (=> b!142221 d!45702))

(declare-fun d!45704 () Bool)

(assert (=> d!45704 (validate_offset_bits!1 ((_ sign_extend 32) (size!2951 (buf!3375 (_2!6648 lt!220487)))) ((_ sign_extend 32) (currentByte!6244 (_2!6648 lt!220488))) ((_ sign_extend 32) (currentBit!6239 (_2!6648 lt!220488))) lt!220484)))

(declare-fun lt!221067 () Unit!8890)

(declare-fun choose!9 (BitStream!5160 array!6518 (_ BitVec 64) BitStream!5160) Unit!8890)

(assert (=> d!45704 (= lt!221067 (choose!9 (_2!6648 lt!220488) (buf!3375 (_2!6648 lt!220487)) lt!220484 (BitStream!5161 (buf!3375 (_2!6648 lt!220487)) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488)))))))

(assert (=> d!45704 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6648 lt!220488) (buf!3375 (_2!6648 lt!220487)) lt!220484) lt!221067)))

(declare-fun bs!11215 () Bool)

(assert (= bs!11215 d!45704))

(assert (=> bs!11215 m!218379))

(declare-fun m!218869 () Bool)

(assert (=> bs!11215 m!218869))

(assert (=> b!142221 d!45704))

(declare-fun b!142573 () Bool)

(declare-fun res!119005 () Bool)

(declare-fun e!94959 () Bool)

(assert (=> b!142573 (=> (not res!119005) (not e!94959))))

(declare-fun lt!221069 () tuple2!12634)

(assert (=> b!142573 (= res!119005 (isPrefixOf!0 (_1!6650 lt!221069) (_2!6648 lt!220488)))))

(declare-fun b!142574 () Bool)

(declare-fun e!94958 () Unit!8890)

(declare-fun Unit!8899 () Unit!8890)

(assert (=> b!142574 (= e!94958 Unit!8899)))

(declare-fun d!45706 () Bool)

(assert (=> d!45706 e!94959))

(declare-fun res!119004 () Bool)

(assert (=> d!45706 (=> (not res!119004) (not e!94959))))

(assert (=> d!45706 (= res!119004 (isPrefixOf!0 (_1!6650 lt!221069) (_2!6650 lt!221069)))))

(declare-fun lt!221073 () BitStream!5160)

(assert (=> d!45706 (= lt!221069 (tuple2!12635 lt!221073 (_2!6648 lt!220487)))))

(declare-fun lt!221080 () Unit!8890)

(declare-fun lt!221077 () Unit!8890)

(assert (=> d!45706 (= lt!221080 lt!221077)))

(assert (=> d!45706 (isPrefixOf!0 lt!221073 (_2!6648 lt!220487))))

(assert (=> d!45706 (= lt!221077 (lemmaIsPrefixTransitive!0 lt!221073 (_2!6648 lt!220487) (_2!6648 lt!220487)))))

(declare-fun lt!221082 () Unit!8890)

(declare-fun lt!221087 () Unit!8890)

(assert (=> d!45706 (= lt!221082 lt!221087)))

(assert (=> d!45706 (isPrefixOf!0 lt!221073 (_2!6648 lt!220487))))

(assert (=> d!45706 (= lt!221087 (lemmaIsPrefixTransitive!0 lt!221073 (_2!6648 lt!220488) (_2!6648 lt!220487)))))

(declare-fun lt!221084 () Unit!8890)

(assert (=> d!45706 (= lt!221084 e!94958)))

(declare-fun c!7832 () Bool)

(assert (=> d!45706 (= c!7832 (not (= (size!2951 (buf!3375 (_2!6648 lt!220488))) #b00000000000000000000000000000000)))))

(declare-fun lt!221076 () Unit!8890)

(declare-fun lt!221072 () Unit!8890)

(assert (=> d!45706 (= lt!221076 lt!221072)))

(assert (=> d!45706 (isPrefixOf!0 (_2!6648 lt!220487) (_2!6648 lt!220487))))

(assert (=> d!45706 (= lt!221072 (lemmaIsPrefixRefl!0 (_2!6648 lt!220487)))))

(declare-fun lt!221081 () Unit!8890)

(declare-fun lt!221075 () Unit!8890)

(assert (=> d!45706 (= lt!221081 lt!221075)))

(assert (=> d!45706 (= lt!221075 (lemmaIsPrefixRefl!0 (_2!6648 lt!220487)))))

(declare-fun lt!221078 () Unit!8890)

(declare-fun lt!221071 () Unit!8890)

(assert (=> d!45706 (= lt!221078 lt!221071)))

(assert (=> d!45706 (isPrefixOf!0 lt!221073 lt!221073)))

(assert (=> d!45706 (= lt!221071 (lemmaIsPrefixRefl!0 lt!221073))))

(declare-fun lt!221070 () Unit!8890)

(declare-fun lt!221083 () Unit!8890)

(assert (=> d!45706 (= lt!221070 lt!221083)))

(assert (=> d!45706 (isPrefixOf!0 (_2!6648 lt!220488) (_2!6648 lt!220488))))

(assert (=> d!45706 (= lt!221083 (lemmaIsPrefixRefl!0 (_2!6648 lt!220488)))))

(assert (=> d!45706 (= lt!221073 (BitStream!5161 (buf!3375 (_2!6648 lt!220487)) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488))))))

(assert (=> d!45706 (isPrefixOf!0 (_2!6648 lt!220488) (_2!6648 lt!220487))))

(assert (=> d!45706 (= (reader!0 (_2!6648 lt!220488) (_2!6648 lt!220487)) lt!221069)))

(declare-fun b!142575 () Bool)

(declare-fun lt!221074 () Unit!8890)

(assert (=> b!142575 (= e!94958 lt!221074)))

(declare-fun lt!221085 () (_ BitVec 64))

(assert (=> b!142575 (= lt!221085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!221079 () (_ BitVec 64))

(assert (=> b!142575 (= lt!221079 (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488))))))

(assert (=> b!142575 (= lt!221074 (arrayBitRangesEqSymmetric!0 (buf!3375 (_2!6648 lt!220488)) (buf!3375 (_2!6648 lt!220487)) lt!221085 lt!221079))))

(assert (=> b!142575 (arrayBitRangesEq!0 (buf!3375 (_2!6648 lt!220487)) (buf!3375 (_2!6648 lt!220488)) lt!221085 lt!221079)))

(declare-fun lt!221068 () (_ BitVec 64))

(declare-fun b!142576 () Bool)

(declare-fun lt!221086 () (_ BitVec 64))

(assert (=> b!142576 (= e!94959 (= (_1!6650 lt!221069) (withMovedBitIndex!0 (_2!6650 lt!221069) (bvsub lt!221068 lt!221086))))))

(assert (=> b!142576 (or (= (bvand lt!221068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221086 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221068 lt!221086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142576 (= lt!221086 (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220487))) (currentByte!6244 (_2!6648 lt!220487)) (currentBit!6239 (_2!6648 lt!220487))))))

(assert (=> b!142576 (= lt!221068 (bitIndex!0 (size!2951 (buf!3375 (_2!6648 lt!220488))) (currentByte!6244 (_2!6648 lt!220488)) (currentBit!6239 (_2!6648 lt!220488))))))

(declare-fun b!142577 () Bool)

(declare-fun res!119003 () Bool)

(assert (=> b!142577 (=> (not res!119003) (not e!94959))))

(assert (=> b!142577 (= res!119003 (isPrefixOf!0 (_2!6650 lt!221069) (_2!6648 lt!220487)))))

(assert (= (and d!45706 c!7832) b!142575))

(assert (= (and d!45706 (not c!7832)) b!142574))

(assert (= (and d!45706 res!119004) b!142573))

(assert (= (and b!142573 res!119005) b!142577))

(assert (= (and b!142577 res!119003) b!142576))

(declare-fun m!218871 () Bool)

(assert (=> b!142573 m!218871))

(assert (=> b!142575 m!218415))

(declare-fun m!218873 () Bool)

(assert (=> b!142575 m!218873))

(declare-fun m!218875 () Bool)

(assert (=> b!142575 m!218875))

(declare-fun m!218877 () Bool)

(assert (=> b!142576 m!218877))

(assert (=> b!142576 m!218401))

(assert (=> b!142576 m!218415))

(declare-fun m!218879 () Bool)

(assert (=> b!142577 m!218879))

(assert (=> d!45706 m!218671))

(declare-fun m!218881 () Bool)

(assert (=> d!45706 m!218881))

(assert (=> d!45706 m!218375))

(declare-fun m!218883 () Bool)

(assert (=> d!45706 m!218883))

(declare-fun m!218885 () Bool)

(assert (=> d!45706 m!218885))

(declare-fun m!218887 () Bool)

(assert (=> d!45706 m!218887))

(declare-fun m!218889 () Bool)

(assert (=> d!45706 m!218889))

(declare-fun m!218891 () Bool)

(assert (=> d!45706 m!218891))

(declare-fun m!218893 () Bool)

(assert (=> d!45706 m!218893))

(declare-fun m!218895 () Bool)

(assert (=> d!45706 m!218895))

(assert (=> d!45706 m!218663))

(assert (=> b!142221 d!45706))

(check-sat (not b!142563) (not d!45677) (not b!142570) (not d!45675) (not d!45682) (not b!142439) (not d!45633) (not d!45663) (not b!142573) (not d!45637) (not d!45706) (not b!142571) (not b!142501) (not b!142562) (not d!45698) (not d!45704) (not d!45599) (not b!142531) (not b!142503) (not b!142470) (not b!142560) (not b!142506) (not d!45702) (not b!142572) (not b!142436) (not d!45669) (not b!142576) (not b!142488) (not d!45673) (not b!142508) (not b!142438) (not b!142485) (not bm!1851) (not b!142575) (not b!142577) (not b!142559) (not b!142490) (not b!142561) (not b!142440) (not b!142498) (not d!45680) (not d!45700) (not d!45605) (not b!142500) (not d!45665))
