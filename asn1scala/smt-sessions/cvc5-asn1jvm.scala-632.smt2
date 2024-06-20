; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17836 () Bool)

(assert start!17836)

(declare-fun b!86791 () Bool)

(declare-fun e!57632 () Bool)

(declare-fun e!57637 () Bool)

(assert (=> b!86791 (= e!57632 e!57637)))

(declare-fun res!71336 () Bool)

(assert (=> b!86791 (=> (not res!71336) (not e!57637))))

(declare-fun lt!135411 () Bool)

(declare-datatypes ((array!4104 0))(
  ( (array!4105 (arr!2490 (Array (_ BitVec 32) (_ BitVec 8))) (size!1853 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3268 0))(
  ( (BitStream!3269 (buf!2243 array!4104) (currentByte!4458 (_ BitVec 32)) (currentBit!4453 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5725 0))(
  ( (Unit!5726) )
))
(declare-datatypes ((tuple2!7348 0))(
  ( (tuple2!7349 (_1!3901 Unit!5725) (_2!3901 BitStream!3268)) )
))
(declare-fun lt!135413 () tuple2!7348)

(declare-datatypes ((tuple2!7350 0))(
  ( (tuple2!7351 (_1!3902 BitStream!3268) (_2!3902 Bool)) )
))
(declare-fun lt!135410 () tuple2!7350)

(assert (=> b!86791 (= res!71336 (and (= (_2!3902 lt!135410) lt!135411) (= (_1!3902 lt!135410) (_2!3901 lt!135413))))))

(declare-fun thiss!1152 () BitStream!3268)

(declare-fun readBitPure!0 (BitStream!3268) tuple2!7350)

(declare-fun readerFrom!0 (BitStream!3268 (_ BitVec 32) (_ BitVec 32)) BitStream!3268)

(assert (=> b!86791 (= lt!135410 (readBitPure!0 (readerFrom!0 (_2!3901 lt!135413) (currentBit!4453 thiss!1152) (currentByte!4458 thiss!1152))))))

(declare-fun b!86793 () Bool)

(declare-fun e!57634 () Bool)

(declare-fun array_inv!1699 (array!4104) Bool)

(assert (=> b!86793 (= e!57634 (array_inv!1699 (buf!2243 thiss!1152)))))

(declare-fun b!86794 () Bool)

(declare-fun res!71345 () Bool)

(declare-fun e!57639 () Bool)

(assert (=> b!86794 (=> res!71345 e!57639)))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!86794 (= res!71345 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86795 () Bool)

(declare-fun res!71338 () Bool)

(declare-fun e!57630 () Bool)

(assert (=> b!86795 (=> (not res!71338) (not e!57630))))

(assert (=> b!86795 (= res!71338 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86796 () Bool)

(declare-fun e!57629 () Bool)

(assert (=> b!86796 (= e!57629 e!57632)))

(declare-fun res!71343 () Bool)

(assert (=> b!86796 (=> (not res!71343) (not e!57632))))

(declare-fun lt!135412 () (_ BitVec 64))

(declare-fun lt!135408 () (_ BitVec 64))

(assert (=> b!86796 (= res!71343 (= lt!135412 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135408)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86796 (= lt!135412 (bitIndex!0 (size!1853 (buf!2243 (_2!3901 lt!135413))) (currentByte!4458 (_2!3901 lt!135413)) (currentBit!4453 (_2!3901 lt!135413))))))

(declare-fun b!86797 () Bool)

(declare-fun res!71347 () Bool)

(declare-fun e!57633 () Bool)

(assert (=> b!86797 (=> res!71347 e!57633)))

(declare-datatypes ((tuple3!406 0))(
  ( (tuple3!407 (_1!3903 Unit!5725) (_2!3903 BitStream!3268) (_3!227 (_ BitVec 32))) )
))
(declare-fun lt!135414 () tuple3!406)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86797 (= res!71347 (not (invariant!0 (currentBit!4453 (_2!3903 lt!135414)) (currentByte!4458 (_2!3903 lt!135414)) (size!1853 (buf!2243 (_2!3903 lt!135414))))))))

(declare-fun b!86798 () Bool)

(declare-fun res!71329 () Bool)

(assert (=> b!86798 (=> (not res!71329) (not e!57630))))

(declare-fun thiss!1151 () BitStream!3268)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86798 (= res!71329 (validate_offset_bits!1 ((_ sign_extend 32) (size!1853 (buf!2243 thiss!1151))) ((_ sign_extend 32) (currentByte!4458 thiss!1151)) ((_ sign_extend 32) (currentBit!4453 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86799 () Bool)

(assert (=> b!86799 (= e!57639 e!57633)))

(declare-fun res!71333 () Bool)

(assert (=> b!86799 (=> res!71333 e!57633)))

(assert (=> b!86799 (= res!71333 (bvslt (_3!227 lt!135414) #b00000000000000000000000000000000))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3268 (_ BitVec 64) BitStream!3268 (_ BitVec 32)) tuple3!406)

(assert (=> b!86799 (= lt!135414 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3901 lt!135413) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86800 () Bool)

(declare-fun res!71334 () Bool)

(assert (=> b!86800 (=> (not res!71334) (not e!57630))))

(assert (=> b!86800 (= res!71334 (invariant!0 (currentBit!4453 thiss!1152) (currentByte!4458 thiss!1152) (size!1853 (buf!2243 thiss!1152))))))

(declare-fun b!86801 () Bool)

(declare-fun e!57636 () Bool)

(assert (=> b!86801 (= e!57636 (array_inv!1699 (buf!2243 thiss!1151)))))

(declare-fun b!86802 () Bool)

(declare-fun res!71331 () Bool)

(assert (=> b!86802 (=> (not res!71331) (not e!57630))))

(assert (=> b!86802 (= res!71331 (invariant!0 (currentBit!4453 thiss!1151) (currentByte!4458 thiss!1151) (size!1853 (buf!2243 thiss!1151))))))

(declare-fun b!86803 () Bool)

(declare-fun e!57638 () Bool)

(assert (=> b!86803 (= e!57630 e!57638)))

(declare-fun res!71346 () Bool)

(assert (=> b!86803 (=> (not res!71346) (not e!57638))))

(declare-fun lt!135409 () (_ BitVec 64))

(assert (=> b!86803 (= res!71346 (= lt!135408 (bvadd lt!135409 ((_ sign_extend 32) i!576))))))

(assert (=> b!86803 (= lt!135408 (bitIndex!0 (size!1853 (buf!2243 thiss!1152)) (currentByte!4458 thiss!1152) (currentBit!4453 thiss!1152)))))

(assert (=> b!86803 (= lt!135409 (bitIndex!0 (size!1853 (buf!2243 thiss!1151)) (currentByte!4458 thiss!1151) (currentBit!4453 thiss!1151)))))

(declare-fun b!86804 () Bool)

(declare-fun res!71337 () Bool)

(assert (=> b!86804 (=> (not res!71337) (not e!57632))))

(declare-fun isPrefixOf!0 (BitStream!3268 BitStream!3268) Bool)

(assert (=> b!86804 (= res!71337 (isPrefixOf!0 thiss!1152 (_2!3901 lt!135413)))))

(declare-fun b!86805 () Bool)

(assert (=> b!86805 (= e!57638 (not e!57639))))

(declare-fun res!71328 () Bool)

(assert (=> b!86805 (=> res!71328 e!57639)))

(assert (=> b!86805 (= res!71328 (not (invariant!0 (currentBit!4453 (_2!3901 lt!135413)) (currentByte!4458 (_2!3901 lt!135413)) (size!1853 (buf!2243 (_2!3901 lt!135413))))))))

(assert (=> b!86805 e!57629))

(declare-fun res!71332 () Bool)

(assert (=> b!86805 (=> (not res!71332) (not e!57629))))

(assert (=> b!86805 (= res!71332 (= (size!1853 (buf!2243 thiss!1152)) (size!1853 (buf!2243 (_2!3901 lt!135413)))))))

(declare-fun appendBit!0 (BitStream!3268 Bool) tuple2!7348)

(assert (=> b!86805 (= lt!135413 (appendBit!0 thiss!1152 lt!135411))))

(assert (=> b!86805 (= lt!135411 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!71335 () Bool)

(assert (=> start!17836 (=> (not res!71335) (not e!57630))))

(assert (=> start!17836 (= res!71335 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17836 e!57630))

(declare-fun inv!12 (BitStream!3268) Bool)

(assert (=> start!17836 (and (inv!12 thiss!1152) e!57634)))

(assert (=> start!17836 (and (inv!12 thiss!1151) e!57636)))

(assert (=> start!17836 true))

(declare-fun b!86792 () Bool)

(assert (=> b!86792 (= e!57637 (= (bitIndex!0 (size!1853 (buf!2243 (_1!3902 lt!135410))) (currentByte!4458 (_1!3902 lt!135410)) (currentBit!4453 (_1!3902 lt!135410))) lt!135412))))

(declare-fun b!86806 () Bool)

(declare-fun res!71341 () Bool)

(assert (=> b!86806 (=> (not res!71341) (not e!57638))))

(assert (=> b!86806 (= res!71341 (bvslt i!576 nBits!336))))

(declare-fun b!86807 () Bool)

(declare-fun res!71340 () Bool)

(assert (=> b!86807 (=> res!71340 e!57633)))

(assert (=> b!86807 (= res!71340 (or (bvsgt ((_ sign_extend 32) (size!1853 (buf!2243 (_2!3903 lt!135414)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4458 (_2!3903 lt!135414))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4453 (_2!3903 lt!135414))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1853 (buf!2243 (_2!3903 lt!135414)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4458 (_2!3903 lt!135414))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4453 (_2!3903 lt!135414))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86808 () Bool)

(declare-fun res!71344 () Bool)

(assert (=> b!86808 (=> (not res!71344) (not e!57638))))

(assert (=> b!86808 (= res!71344 (validate_offset_bits!1 ((_ sign_extend 32) (size!1853 (buf!2243 thiss!1152))) ((_ sign_extend 32) (currentByte!4458 thiss!1152)) ((_ sign_extend 32) (currentBit!4453 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86809 () Bool)

(declare-fun res!71342 () Bool)

(assert (=> b!86809 (=> res!71342 e!57633)))

(assert (=> b!86809 (= res!71342 (or (bvsgt (_3!227 lt!135414) nBits!336) (not (= (size!1853 (buf!2243 (_2!3903 lt!135414))) (size!1853 (buf!2243 thiss!1151))))))))

(declare-fun b!86810 () Bool)

(declare-fun res!71339 () Bool)

(assert (=> b!86810 (=> (not res!71339) (not e!57630))))

(assert (=> b!86810 (= res!71339 (and (bvsle i!576 nBits!336) (= (size!1853 (buf!2243 thiss!1152)) (size!1853 (buf!2243 thiss!1151)))))))

(declare-fun b!86811 () Bool)

(assert (=> b!86811 (= e!57633 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4453 (_2!3903 lt!135414)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4458 (_2!3903 lt!135414)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1853 (buf!2243 (_2!3903 lt!135414)))))))))

(declare-fun b!86812 () Bool)

(declare-fun res!71330 () Bool)

(assert (=> b!86812 (=> res!71330 e!57633)))

(assert (=> b!86812 (= res!71330 (not (= (bitIndex!0 (size!1853 (buf!2243 (_2!3903 lt!135414))) (currentByte!4458 (_2!3903 lt!135414)) (currentBit!4453 (_2!3903 lt!135414))) (bvadd lt!135409 ((_ sign_extend 32) (_3!227 lt!135414))))))))

(assert (= (and start!17836 res!71335) b!86798))

(assert (= (and b!86798 res!71329) b!86802))

(assert (= (and b!86802 res!71331) b!86795))

(assert (= (and b!86795 res!71338) b!86800))

(assert (= (and b!86800 res!71334) b!86810))

(assert (= (and b!86810 res!71339) b!86803))

(assert (= (and b!86803 res!71346) b!86808))

(assert (= (and b!86808 res!71344) b!86806))

(assert (= (and b!86806 res!71341) b!86805))

(assert (= (and b!86805 res!71332) b!86796))

(assert (= (and b!86796 res!71343) b!86804))

(assert (= (and b!86804 res!71337) b!86791))

(assert (= (and b!86791 res!71336) b!86792))

(assert (= (and b!86805 (not res!71328)) b!86794))

(assert (= (and b!86794 (not res!71345)) b!86799))

(assert (= (and b!86799 (not res!71333)) b!86797))

(assert (= (and b!86797 (not res!71347)) b!86809))

(assert (= (and b!86809 (not res!71342)) b!86812))

(assert (= (and b!86812 (not res!71330)) b!86807))

(assert (= (and b!86807 (not res!71340)) b!86811))

(assert (= start!17836 b!86793))

(assert (= start!17836 b!86801))

(declare-fun m!132491 () Bool)

(assert (=> b!86803 m!132491))

(declare-fun m!132493 () Bool)

(assert (=> b!86803 m!132493))

(declare-fun m!132495 () Bool)

(assert (=> b!86804 m!132495))

(declare-fun m!132497 () Bool)

(assert (=> b!86798 m!132497))

(declare-fun m!132499 () Bool)

(assert (=> b!86799 m!132499))

(declare-fun m!132501 () Bool)

(assert (=> b!86792 m!132501))

(declare-fun m!132503 () Bool)

(assert (=> b!86800 m!132503))

(declare-fun m!132505 () Bool)

(assert (=> b!86808 m!132505))

(declare-fun m!132507 () Bool)

(assert (=> b!86791 m!132507))

(assert (=> b!86791 m!132507))

(declare-fun m!132509 () Bool)

(assert (=> b!86791 m!132509))

(declare-fun m!132511 () Bool)

(assert (=> b!86797 m!132511))

(declare-fun m!132513 () Bool)

(assert (=> b!86801 m!132513))

(declare-fun m!132515 () Bool)

(assert (=> b!86805 m!132515))

(declare-fun m!132517 () Bool)

(assert (=> b!86805 m!132517))

(declare-fun m!132519 () Bool)

(assert (=> b!86812 m!132519))

(declare-fun m!132521 () Bool)

(assert (=> b!86796 m!132521))

(declare-fun m!132523 () Bool)

(assert (=> b!86793 m!132523))

(declare-fun m!132525 () Bool)

(assert (=> start!17836 m!132525))

(declare-fun m!132527 () Bool)

(assert (=> start!17836 m!132527))

(declare-fun m!132529 () Bool)

(assert (=> b!86811 m!132529))

(declare-fun m!132531 () Bool)

(assert (=> b!86802 m!132531))

(push 1)

(assert (not b!86800))

(assert (not b!86792))

(assert (not b!86793))

(assert (not b!86798))

(assert (not b!86799))

(assert (not b!86796))

(assert (not b!86802))

