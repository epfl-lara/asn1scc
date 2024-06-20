; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52222 () Bool)

(assert start!52222)

(declare-fun res!200763 () Bool)

(declare-fun e!166686 () Bool)

(assert (=> start!52222 (=> (not res!200763) (not e!166686))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52222 (= res!200763 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52222 e!166686))

(assert (=> start!52222 true))

(declare-datatypes ((array!13153 0))(
  ( (array!13154 (arr!6748 (Array (_ BitVec 32) (_ BitVec 8))) (size!5761 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10444 0))(
  ( (BitStream!10445 (buf!6221 array!13153) (currentByte!11575 (_ BitVec 32)) (currentBit!11570 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10444)

(declare-fun e!166688 () Bool)

(declare-fun inv!12 (BitStream!10444) Bool)

(assert (=> start!52222 (and (inv!12 thiss!982) e!166688)))

(declare-fun b!240486 () Bool)

(declare-fun res!200762 () Bool)

(assert (=> b!240486 (=> (not res!200762) (not e!166686))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240486 (= res!200762 (validate_offset_bits!1 ((_ sign_extend 32) (size!5761 (buf!6221 thiss!982))) ((_ sign_extend 32) (currentByte!11575 thiss!982)) ((_ sign_extend 32) (currentBit!11570 thiss!982)) nBits!288))))

(declare-fun b!240487 () Bool)

(assert (=> b!240487 (= e!166686 (not true))))

(declare-datatypes ((Unit!17623 0))(
  ( (Unit!17624) )
))
(declare-datatypes ((tuple2!20418 0))(
  ( (tuple2!20419 (_1!11131 Unit!17623) (_2!11131 BitStream!10444)) )
))
(declare-fun lt!375600 () tuple2!20418)

(assert (=> b!240487 (validate_offset_bits!1 ((_ sign_extend 32) (size!5761 (buf!6221 (_2!11131 lt!375600)))) ((_ sign_extend 32) (currentByte!11575 thiss!982)) ((_ sign_extend 32) (currentBit!11570 thiss!982)) nBits!288)))

(declare-fun lt!375603 () Unit!17623)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10444 array!13153 (_ BitVec 64)) Unit!17623)

(assert (=> b!240487 (= lt!375603 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6221 (_2!11131 lt!375600)) nBits!288))))

(declare-datatypes ((tuple2!20420 0))(
  ( (tuple2!20421 (_1!11132 BitStream!10444) (_2!11132 BitStream!10444)) )
))
(declare-fun lt!375598 () tuple2!20420)

(declare-fun reader!0 (BitStream!10444 BitStream!10444) tuple2!20420)

(assert (=> b!240487 (= lt!375598 (reader!0 thiss!982 (_2!11131 lt!375600)))))

(declare-fun lt!375595 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10444 BitStream!10444) Bool)

(assert (=> b!240487 (= lt!375595 (isPrefixOf!0 thiss!982 (_2!11131 lt!375600)))))

(declare-fun lt!375596 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240487 (= lt!375596 (bitIndex!0 (size!5761 (buf!6221 (_2!11131 lt!375600))) (currentByte!11575 (_2!11131 lt!375600)) (currentBit!11570 (_2!11131 lt!375600))))))

(declare-fun lt!375599 () (_ BitVec 64))

(assert (=> b!240487 (= lt!375599 (bitIndex!0 (size!5761 (buf!6221 thiss!982)) (currentByte!11575 thiss!982) (currentBit!11570 thiss!982)))))

(declare-fun e!166685 () Bool)

(assert (=> b!240487 e!166685))

(declare-fun res!200761 () Bool)

(assert (=> b!240487 (=> (not res!200761) (not e!166685))))

(assert (=> b!240487 (= res!200761 (= (size!5761 (buf!6221 thiss!982)) (size!5761 (buf!6221 (_2!11131 lt!375600)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10444 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20418)

(assert (=> b!240487 (= lt!375600 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240488 () Bool)

(declare-fun res!200759 () Bool)

(assert (=> b!240488 (=> (not res!200759) (not e!166685))))

(assert (=> b!240488 (= res!200759 (isPrefixOf!0 thiss!982 (_2!11131 lt!375600)))))

(declare-fun b!240489 () Bool)

(declare-datatypes ((tuple2!20422 0))(
  ( (tuple2!20423 (_1!11133 BitStream!10444) (_2!11133 Bool)) )
))
(declare-fun lt!375602 () tuple2!20422)

(declare-fun lt!375597 () tuple2!20420)

(assert (=> b!240489 (= e!166685 (not (or (not (_2!11133 lt!375602)) (not (= (_1!11133 lt!375602) (_2!11132 lt!375597))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10444 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20422)

(assert (=> b!240489 (= lt!375602 (checkBitsLoopPure!0 (_1!11132 lt!375597) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240489 (validate_offset_bits!1 ((_ sign_extend 32) (size!5761 (buf!6221 (_2!11131 lt!375600)))) ((_ sign_extend 32) (currentByte!11575 thiss!982)) ((_ sign_extend 32) (currentBit!11570 thiss!982)) nBits!288)))

(declare-fun lt!375601 () Unit!17623)

(assert (=> b!240489 (= lt!375601 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6221 (_2!11131 lt!375600)) nBits!288))))

(assert (=> b!240489 (= lt!375597 (reader!0 thiss!982 (_2!11131 lt!375600)))))

(declare-fun b!240490 () Bool)

(declare-fun array_inv!5502 (array!13153) Bool)

(assert (=> b!240490 (= e!166688 (array_inv!5502 (buf!6221 thiss!982)))))

(declare-fun b!240491 () Bool)

(declare-fun res!200760 () Bool)

(assert (=> b!240491 (=> (not res!200760) (not e!166685))))

(assert (=> b!240491 (= res!200760 (= (bitIndex!0 (size!5761 (buf!6221 (_2!11131 lt!375600))) (currentByte!11575 (_2!11131 lt!375600)) (currentBit!11570 (_2!11131 lt!375600))) (bvadd (bitIndex!0 (size!5761 (buf!6221 thiss!982)) (currentByte!11575 thiss!982) (currentBit!11570 thiss!982)) nBits!288)))))

(assert (= (and start!52222 res!200763) b!240486))

(assert (= (and b!240486 res!200762) b!240487))

(assert (= (and b!240487 res!200761) b!240491))

(assert (= (and b!240491 res!200760) b!240488))

(assert (= (and b!240488 res!200759) b!240489))

(assert (= start!52222 b!240490))

(declare-fun m!362991 () Bool)

(assert (=> b!240486 m!362991))

(declare-fun m!362993 () Bool)

(assert (=> b!240487 m!362993))

(declare-fun m!362995 () Bool)

(assert (=> b!240487 m!362995))

(declare-fun m!362997 () Bool)

(assert (=> b!240487 m!362997))

(declare-fun m!362999 () Bool)

(assert (=> b!240487 m!362999))

(declare-fun m!363001 () Bool)

(assert (=> b!240487 m!363001))

(declare-fun m!363003 () Bool)

(assert (=> b!240487 m!363003))

(declare-fun m!363005 () Bool)

(assert (=> b!240487 m!363005))

(assert (=> b!240491 m!362999))

(assert (=> b!240491 m!363001))

(declare-fun m!363007 () Bool)

(assert (=> b!240490 m!363007))

(assert (=> b!240488 m!362993))

(declare-fun m!363009 () Bool)

(assert (=> start!52222 m!363009))

(declare-fun m!363011 () Bool)

(assert (=> b!240489 m!363011))

(assert (=> b!240489 m!363005))

(assert (=> b!240489 m!362995))

(assert (=> b!240489 m!362997))

(push 1)

(assert (not b!240486))

(assert (not b!240491))

(assert (not b!240487))

(assert (not b!240490))

(assert (not start!52222))

(assert (not b!240489))

(assert (not b!240488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

