; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52218 () Bool)

(assert start!52218)

(declare-fun b!240450 () Bool)

(declare-fun e!166663 () Bool)

(declare-datatypes ((array!13149 0))(
  ( (array!13150 (arr!6746 (Array (_ BitVec 32) (_ BitVec 8))) (size!5759 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10440 0))(
  ( (BitStream!10441 (buf!6219 array!13149) (currentByte!11573 (_ BitVec 32)) (currentBit!11568 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20406 0))(
  ( (tuple2!20407 (_1!11125 BitStream!10440) (_2!11125 Bool)) )
))
(declare-fun lt!375548 () tuple2!20406)

(declare-datatypes ((tuple2!20408 0))(
  ( (tuple2!20409 (_1!11126 BitStream!10440) (_2!11126 BitStream!10440)) )
))
(declare-fun lt!375545 () tuple2!20408)

(assert (=> b!240450 (= e!166663 (not (or (not (_2!11125 lt!375548)) (not (= (_1!11125 lt!375548) (_2!11126 lt!375545))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10440 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20406)

(assert (=> b!240450 (= lt!375548 (checkBitsLoopPure!0 (_1!11126 lt!375545) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17619 0))(
  ( (Unit!17620) )
))
(declare-datatypes ((tuple2!20410 0))(
  ( (tuple2!20411 (_1!11127 Unit!17619) (_2!11127 BitStream!10440)) )
))
(declare-fun lt!375546 () tuple2!20410)

(declare-fun thiss!982 () BitStream!10440)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240450 (validate_offset_bits!1 ((_ sign_extend 32) (size!5759 (buf!6219 (_2!11127 lt!375546)))) ((_ sign_extend 32) (currentByte!11573 thiss!982)) ((_ sign_extend 32) (currentBit!11568 thiss!982)) nBits!288)))

(declare-fun lt!375544 () Unit!17619)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10440 array!13149 (_ BitVec 64)) Unit!17619)

(assert (=> b!240450 (= lt!375544 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6219 (_2!11127 lt!375546)) nBits!288))))

(declare-fun reader!0 (BitStream!10440 BitStream!10440) tuple2!20408)

(assert (=> b!240450 (= lt!375545 (reader!0 thiss!982 (_2!11127 lt!375546)))))

(declare-fun res!200729 () Bool)

(declare-fun e!166664 () Bool)

(assert (=> start!52218 (=> (not res!200729) (not e!166664))))

(assert (=> start!52218 (= res!200729 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52218 e!166664))

(assert (=> start!52218 true))

(declare-fun e!166661 () Bool)

(declare-fun inv!12 (BitStream!10440) Bool)

(assert (=> start!52218 (and (inv!12 thiss!982) e!166661)))

(declare-fun b!240451 () Bool)

(declare-fun array_inv!5500 (array!13149) Bool)

(assert (=> b!240451 (= e!166661 (array_inv!5500 (buf!6219 thiss!982)))))

(declare-fun b!240452 () Bool)

(declare-fun res!200732 () Bool)

(assert (=> b!240452 (=> (not res!200732) (not e!166663))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240452 (= res!200732 (= (bitIndex!0 (size!5759 (buf!6219 (_2!11127 lt!375546))) (currentByte!11573 (_2!11127 lt!375546)) (currentBit!11568 (_2!11127 lt!375546))) (bvadd (bitIndex!0 (size!5759 (buf!6219 thiss!982)) (currentByte!11573 thiss!982) (currentBit!11568 thiss!982)) nBits!288)))))

(declare-fun b!240453 () Bool)

(declare-fun res!200731 () Bool)

(assert (=> b!240453 (=> (not res!200731) (not e!166663))))

(declare-fun isPrefixOf!0 (BitStream!10440 BitStream!10440) Bool)

(assert (=> b!240453 (= res!200731 (isPrefixOf!0 thiss!982 (_2!11127 lt!375546)))))

(declare-fun b!240454 () Bool)

(declare-fun res!200730 () Bool)

(assert (=> b!240454 (=> (not res!200730) (not e!166664))))

(assert (=> b!240454 (= res!200730 (validate_offset_bits!1 ((_ sign_extend 32) (size!5759 (buf!6219 thiss!982))) ((_ sign_extend 32) (currentByte!11573 thiss!982)) ((_ sign_extend 32) (currentBit!11568 thiss!982)) nBits!288))))

(declare-fun b!240455 () Bool)

(assert (=> b!240455 (= e!166664 (not true))))

(assert (=> b!240455 (validate_offset_bits!1 ((_ sign_extend 32) (size!5759 (buf!6219 (_2!11127 lt!375546)))) ((_ sign_extend 32) (currentByte!11573 thiss!982)) ((_ sign_extend 32) (currentBit!11568 thiss!982)) nBits!288)))

(declare-fun lt!375543 () Unit!17619)

(assert (=> b!240455 (= lt!375543 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6219 (_2!11127 lt!375546)) nBits!288))))

(declare-fun lt!375542 () tuple2!20408)

(assert (=> b!240455 (= lt!375542 (reader!0 thiss!982 (_2!11127 lt!375546)))))

(declare-fun lt!375547 () Bool)

(assert (=> b!240455 (= lt!375547 (isPrefixOf!0 thiss!982 (_2!11127 lt!375546)))))

(declare-fun lt!375541 () (_ BitVec 64))

(assert (=> b!240455 (= lt!375541 (bitIndex!0 (size!5759 (buf!6219 (_2!11127 lt!375546))) (currentByte!11573 (_2!11127 lt!375546)) (currentBit!11568 (_2!11127 lt!375546))))))

(declare-fun lt!375549 () (_ BitVec 64))

(assert (=> b!240455 (= lt!375549 (bitIndex!0 (size!5759 (buf!6219 thiss!982)) (currentByte!11573 thiss!982) (currentBit!11568 thiss!982)))))

(assert (=> b!240455 e!166663))

(declare-fun res!200733 () Bool)

(assert (=> b!240455 (=> (not res!200733) (not e!166663))))

(assert (=> b!240455 (= res!200733 (= (size!5759 (buf!6219 thiss!982)) (size!5759 (buf!6219 (_2!11127 lt!375546)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10440 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20410)

(assert (=> b!240455 (= lt!375546 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!52218 res!200729) b!240454))

(assert (= (and b!240454 res!200730) b!240455))

(assert (= (and b!240455 res!200733) b!240452))

(assert (= (and b!240452 res!200732) b!240453))

(assert (= (and b!240453 res!200731) b!240450))

(assert (= start!52218 b!240451))

(declare-fun m!362947 () Bool)

(assert (=> b!240452 m!362947))

(declare-fun m!362949 () Bool)

(assert (=> b!240452 m!362949))

(declare-fun m!362951 () Bool)

(assert (=> b!240451 m!362951))

(declare-fun m!362953 () Bool)

(assert (=> b!240450 m!362953))

(declare-fun m!362955 () Bool)

(assert (=> b!240450 m!362955))

(declare-fun m!362957 () Bool)

(assert (=> b!240450 m!362957))

(declare-fun m!362959 () Bool)

(assert (=> b!240450 m!362959))

(assert (=> b!240455 m!362947))

(assert (=> b!240455 m!362949))

(declare-fun m!362961 () Bool)

(assert (=> b!240455 m!362961))

(assert (=> b!240455 m!362959))

(assert (=> b!240455 m!362955))

(assert (=> b!240455 m!362957))

(declare-fun m!362963 () Bool)

(assert (=> b!240455 m!362963))

(assert (=> b!240453 m!362963))

(declare-fun m!362965 () Bool)

(assert (=> b!240454 m!362965))

(declare-fun m!362967 () Bool)

(assert (=> start!52218 m!362967))

(check-sat (not start!52218) (not b!240451) (not b!240454) (not b!240450) (not b!240455) (not b!240452) (not b!240453))
