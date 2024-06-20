; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52206 () Bool)

(assert start!52206)

(declare-fun b!240342 () Bool)

(declare-fun e!166592 () Bool)

(declare-datatypes ((array!13137 0))(
  ( (array!13138 (arr!6740 (Array (_ BitVec 32) (_ BitVec 8))) (size!5753 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10428 0))(
  ( (BitStream!10429 (buf!6213 array!13137) (currentByte!11567 (_ BitVec 32)) (currentBit!11562 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10428)

(declare-fun array_inv!5494 (array!13137) Bool)

(assert (=> b!240342 (= e!166592 (array_inv!5494 (buf!6213 thiss!982)))))

(declare-fun b!240343 () Bool)

(declare-fun res!200639 () Bool)

(declare-fun e!166589 () Bool)

(assert (=> b!240343 (=> (not res!200639) (not e!166589))))

(declare-datatypes ((Unit!17607 0))(
  ( (Unit!17608) )
))
(declare-datatypes ((tuple2!20370 0))(
  ( (tuple2!20371 (_1!11107 Unit!17607) (_2!11107 BitStream!10428)) )
))
(declare-fun lt!375396 () tuple2!20370)

(declare-fun isPrefixOf!0 (BitStream!10428 BitStream!10428) Bool)

(assert (=> b!240343 (= res!200639 (isPrefixOf!0 thiss!982 (_2!11107 lt!375396)))))

(declare-fun b!240345 () Bool)

(declare-datatypes ((tuple2!20372 0))(
  ( (tuple2!20373 (_1!11108 BitStream!10428) (_2!11108 Bool)) )
))
(declare-fun lt!375398 () tuple2!20372)

(declare-datatypes ((tuple2!20374 0))(
  ( (tuple2!20375 (_1!11109 BitStream!10428) (_2!11109 BitStream!10428)) )
))
(declare-fun lt!375399 () tuple2!20374)

(assert (=> b!240345 (= e!166589 (not (or (not (_2!11108 lt!375398)) (not (= (_1!11108 lt!375398) (_2!11109 lt!375399))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10428 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20372)

(assert (=> b!240345 (= lt!375398 (checkBitsLoopPure!0 (_1!11109 lt!375399) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240345 (validate_offset_bits!1 ((_ sign_extend 32) (size!5753 (buf!6213 (_2!11107 lt!375396)))) ((_ sign_extend 32) (currentByte!11567 thiss!982)) ((_ sign_extend 32) (currentBit!11562 thiss!982)) nBits!288)))

(declare-fun lt!375395 () Unit!17607)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10428 array!13137 (_ BitVec 64)) Unit!17607)

(assert (=> b!240345 (= lt!375395 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6213 (_2!11107 lt!375396)) nBits!288))))

(declare-fun reader!0 (BitStream!10428 BitStream!10428) tuple2!20374)

(assert (=> b!240345 (= lt!375399 (reader!0 thiss!982 (_2!11107 lt!375396)))))

(declare-fun b!240346 () Bool)

(declare-fun res!200642 () Bool)

(declare-fun e!166590 () Bool)

(assert (=> b!240346 (=> (not res!200642) (not e!166590))))

(assert (=> b!240346 (= res!200642 (validate_offset_bits!1 ((_ sign_extend 32) (size!5753 (buf!6213 thiss!982))) ((_ sign_extend 32) (currentByte!11567 thiss!982)) ((_ sign_extend 32) (currentBit!11562 thiss!982)) nBits!288))))

(declare-fun b!240347 () Bool)

(assert (=> b!240347 (= e!166590 (not true))))

(declare-fun lt!375392 () tuple2!20374)

(assert (=> b!240347 (= lt!375392 (reader!0 thiss!982 (_2!11107 lt!375396)))))

(declare-fun lt!375397 () Bool)

(assert (=> b!240347 (= lt!375397 (isPrefixOf!0 thiss!982 (_2!11107 lt!375396)))))

(declare-fun lt!375394 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240347 (= lt!375394 (bitIndex!0 (size!5753 (buf!6213 (_2!11107 lt!375396))) (currentByte!11567 (_2!11107 lt!375396)) (currentBit!11562 (_2!11107 lt!375396))))))

(declare-fun lt!375393 () (_ BitVec 64))

(assert (=> b!240347 (= lt!375393 (bitIndex!0 (size!5753 (buf!6213 thiss!982)) (currentByte!11567 thiss!982) (currentBit!11562 thiss!982)))))

(assert (=> b!240347 e!166589))

(declare-fun res!200643 () Bool)

(assert (=> b!240347 (=> (not res!200643) (not e!166589))))

(assert (=> b!240347 (= res!200643 (= (size!5753 (buf!6213 thiss!982)) (size!5753 (buf!6213 (_2!11107 lt!375396)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10428 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20370)

(assert (=> b!240347 (= lt!375396 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!200641 () Bool)

(assert (=> start!52206 (=> (not res!200641) (not e!166590))))

(assert (=> start!52206 (= res!200641 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52206 e!166590))

(assert (=> start!52206 true))

(declare-fun inv!12 (BitStream!10428) Bool)

(assert (=> start!52206 (and (inv!12 thiss!982) e!166592)))

(declare-fun b!240344 () Bool)

(declare-fun res!200640 () Bool)

(assert (=> b!240344 (=> (not res!200640) (not e!166589))))

(assert (=> b!240344 (= res!200640 (= (bitIndex!0 (size!5753 (buf!6213 (_2!11107 lt!375396))) (currentByte!11567 (_2!11107 lt!375396)) (currentBit!11562 (_2!11107 lt!375396))) (bvadd (bitIndex!0 (size!5753 (buf!6213 thiss!982)) (currentByte!11567 thiss!982) (currentBit!11562 thiss!982)) nBits!288)))))

(assert (= (and start!52206 res!200641) b!240346))

(assert (= (and b!240346 res!200642) b!240347))

(assert (= (and b!240347 res!200643) b!240344))

(assert (= (and b!240344 res!200640) b!240343))

(assert (= (and b!240343 res!200639) b!240345))

(assert (= start!52206 b!240342))

(declare-fun m!362815 () Bool)

(assert (=> b!240344 m!362815))

(declare-fun m!362817 () Bool)

(assert (=> b!240344 m!362817))

(assert (=> b!240347 m!362815))

(assert (=> b!240347 m!362817))

(declare-fun m!362819 () Bool)

(assert (=> b!240347 m!362819))

(declare-fun m!362821 () Bool)

(assert (=> b!240347 m!362821))

(declare-fun m!362823 () Bool)

(assert (=> b!240347 m!362823))

(declare-fun m!362825 () Bool)

(assert (=> start!52206 m!362825))

(declare-fun m!362827 () Bool)

(assert (=> b!240346 m!362827))

(assert (=> b!240343 m!362819))

(declare-fun m!362829 () Bool)

(assert (=> b!240342 m!362829))

(declare-fun m!362831 () Bool)

(assert (=> b!240345 m!362831))

(declare-fun m!362833 () Bool)

(assert (=> b!240345 m!362833))

(declare-fun m!362835 () Bool)

(assert (=> b!240345 m!362835))

(assert (=> b!240345 m!362823))

(check-sat (not b!240347) (not b!240345) (not b!240346) (not start!52206) (not b!240342) (not b!240343) (not b!240344))
