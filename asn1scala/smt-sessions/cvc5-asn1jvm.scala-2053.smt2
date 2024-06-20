; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52354 () Bool)

(assert start!52354)

(declare-fun b!240939 () Bool)

(declare-fun e!166952 () Bool)

(assert (=> b!240939 (= e!166952 (not true))))

(declare-datatypes ((array!13183 0))(
  ( (array!13184 (arr!6760 (Array (_ BitVec 32) (_ BitVec 8))) (size!5773 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10468 0))(
  ( (BitStream!10469 (buf!6239 array!13183) (currentByte!11599 (_ BitVec 32)) (currentBit!11594 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20484 0))(
  ( (tuple2!20485 (_1!11164 BitStream!10468) (_2!11164 BitStream!10468)) )
))
(declare-fun lt!376497 () tuple2!20484)

(declare-fun thiss!982 () BitStream!10468)

(declare-datatypes ((Unit!17647 0))(
  ( (Unit!17648) )
))
(declare-datatypes ((tuple2!20486 0))(
  ( (tuple2!20487 (_1!11165 Unit!17647) (_2!11165 BitStream!10468)) )
))
(declare-fun lt!376496 () tuple2!20486)

(declare-fun reader!0 (BitStream!10468 BitStream!10468) tuple2!20484)

(assert (=> b!240939 (= lt!376497 (reader!0 thiss!982 (_2!11165 lt!376496)))))

(declare-fun lt!376498 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10468 BitStream!10468) Bool)

(assert (=> b!240939 (= lt!376498 (isPrefixOf!0 thiss!982 (_2!11165 lt!376496)))))

(declare-fun lt!376500 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240939 (= lt!376500 (bitIndex!0 (size!5773 (buf!6239 (_2!11165 lt!376496))) (currentByte!11599 (_2!11165 lt!376496)) (currentBit!11594 (_2!11165 lt!376496))))))

(declare-fun lt!376499 () (_ BitVec 64))

(assert (=> b!240939 (= lt!376499 (bitIndex!0 (size!5773 (buf!6239 thiss!982)) (currentByte!11599 thiss!982) (currentBit!11594 thiss!982)))))

(declare-fun e!166954 () Bool)

(assert (=> b!240939 e!166954))

(declare-fun res!201141 () Bool)

(assert (=> b!240939 (=> (not res!201141) (not e!166954))))

(assert (=> b!240939 (= res!201141 (= (size!5773 (buf!6239 thiss!982)) (size!5773 (buf!6239 (_2!11165 lt!376496)))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10468 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20486)

(assert (=> b!240939 (= lt!376496 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240940 () Bool)

(declare-fun res!201142 () Bool)

(assert (=> b!240940 (=> (not res!201142) (not e!166954))))

(assert (=> b!240940 (= res!201142 (= (bitIndex!0 (size!5773 (buf!6239 (_2!11165 lt!376496))) (currentByte!11599 (_2!11165 lt!376496)) (currentBit!11594 (_2!11165 lt!376496))) (bvadd (bitIndex!0 (size!5773 (buf!6239 thiss!982)) (currentByte!11599 thiss!982) (currentBit!11594 thiss!982)) nBits!288)))))

(declare-fun b!240941 () Bool)

(declare-fun res!201140 () Bool)

(assert (=> b!240941 (=> (not res!201140) (not e!166954))))

(assert (=> b!240941 (= res!201140 (isPrefixOf!0 thiss!982 (_2!11165 lt!376496)))))

(declare-fun b!240942 () Bool)

(declare-fun res!201143 () Bool)

(assert (=> b!240942 (=> (not res!201143) (not e!166952))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240942 (= res!201143 (validate_offset_bits!1 ((_ sign_extend 32) (size!5773 (buf!6239 thiss!982))) ((_ sign_extend 32) (currentByte!11599 thiss!982)) ((_ sign_extend 32) (currentBit!11594 thiss!982)) nBits!288))))

(declare-fun res!201144 () Bool)

(assert (=> start!52354 (=> (not res!201144) (not e!166952))))

(assert (=> start!52354 (= res!201144 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52354 e!166952))

(assert (=> start!52354 true))

(declare-fun e!166953 () Bool)

(declare-fun inv!12 (BitStream!10468) Bool)

(assert (=> start!52354 (and (inv!12 thiss!982) e!166953)))

(declare-fun b!240943 () Bool)

(declare-fun array_inv!5514 (array!13183) Bool)

(assert (=> b!240943 (= e!166953 (array_inv!5514 (buf!6239 thiss!982)))))

(declare-fun b!240944 () Bool)

(declare-datatypes ((tuple2!20488 0))(
  ( (tuple2!20489 (_1!11166 BitStream!10468) (_2!11166 Bool)) )
))
(declare-fun lt!376494 () tuple2!20488)

(declare-fun lt!376495 () tuple2!20484)

(assert (=> b!240944 (= e!166954 (not (or (not (_2!11166 lt!376494)) (not (= (_1!11166 lt!376494) (_2!11164 lt!376495))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10468 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20488)

(assert (=> b!240944 (= lt!376494 (checkBitsLoopPure!0 (_1!11164 lt!376495) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240944 (validate_offset_bits!1 ((_ sign_extend 32) (size!5773 (buf!6239 (_2!11165 lt!376496)))) ((_ sign_extend 32) (currentByte!11599 thiss!982)) ((_ sign_extend 32) (currentBit!11594 thiss!982)) nBits!288)))

(declare-fun lt!376493 () Unit!17647)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10468 array!13183 (_ BitVec 64)) Unit!17647)

(assert (=> b!240944 (= lt!376493 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6239 (_2!11165 lt!376496)) nBits!288))))

(assert (=> b!240944 (= lt!376495 (reader!0 thiss!982 (_2!11165 lt!376496)))))

(assert (= (and start!52354 res!201144) b!240942))

(assert (= (and b!240942 res!201143) b!240939))

(assert (= (and b!240939 res!201141) b!240940))

(assert (= (and b!240940 res!201142) b!240941))

(assert (= (and b!240941 res!201140) b!240944))

(assert (= start!52354 b!240943))

(declare-fun m!363591 () Bool)

(assert (=> start!52354 m!363591))

(declare-fun m!363593 () Bool)

(assert (=> b!240939 m!363593))

(declare-fun m!363595 () Bool)

(assert (=> b!240939 m!363595))

(declare-fun m!363597 () Bool)

(assert (=> b!240939 m!363597))

(declare-fun m!363599 () Bool)

(assert (=> b!240939 m!363599))

(declare-fun m!363601 () Bool)

(assert (=> b!240939 m!363601))

(assert (=> b!240940 m!363595))

(assert (=> b!240940 m!363597))

(declare-fun m!363603 () Bool)

(assert (=> b!240944 m!363603))

(declare-fun m!363605 () Bool)

(assert (=> b!240944 m!363605))

(declare-fun m!363607 () Bool)

(assert (=> b!240944 m!363607))

(assert (=> b!240944 m!363601))

(assert (=> b!240941 m!363593))

(declare-fun m!363609 () Bool)

(assert (=> b!240942 m!363609))

(declare-fun m!363611 () Bool)

(assert (=> b!240943 m!363611))

(push 1)

(assert (not b!240944))

(assert (not b!240939))

(assert (not b!240942))

(assert (not start!52354))

(assert (not b!240940))

(assert (not b!240943))

(assert (not b!240941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

