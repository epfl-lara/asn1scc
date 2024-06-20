; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52208 () Bool)

(assert start!52208)

(declare-fun b!240360 () Bool)

(declare-fun e!166604 () Bool)

(declare-datatypes ((array!13139 0))(
  ( (array!13140 (arr!6741 (Array (_ BitVec 32) (_ BitVec 8))) (size!5754 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10430 0))(
  ( (BitStream!10431 (buf!6214 array!13139) (currentByte!11568 (_ BitVec 32)) (currentBit!11563 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10430)

(declare-fun array_inv!5495 (array!13139) Bool)

(assert (=> b!240360 (= e!166604 (array_inv!5495 (buf!6214 thiss!982)))))

(declare-fun b!240361 () Bool)

(declare-fun e!166601 () Bool)

(declare-datatypes ((tuple2!20376 0))(
  ( (tuple2!20377 (_1!11110 BitStream!10430) (_2!11110 Bool)) )
))
(declare-fun lt!375417 () tuple2!20376)

(declare-datatypes ((tuple2!20378 0))(
  ( (tuple2!20379 (_1!11111 BitStream!10430) (_2!11111 BitStream!10430)) )
))
(declare-fun lt!375418 () tuple2!20378)

(assert (=> b!240361 (= e!166601 (not (or (not (_2!11110 lt!375417)) (not (= (_1!11110 lt!375417) (_2!11111 lt!375418))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10430 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20376)

(assert (=> b!240361 (= lt!375417 (checkBitsLoopPure!0 (_1!11111 lt!375418) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17609 0))(
  ( (Unit!17610) )
))
(declare-datatypes ((tuple2!20380 0))(
  ( (tuple2!20381 (_1!11112 Unit!17609) (_2!11112 BitStream!10430)) )
))
(declare-fun lt!375419 () tuple2!20380)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240361 (validate_offset_bits!1 ((_ sign_extend 32) (size!5754 (buf!6214 (_2!11112 lt!375419)))) ((_ sign_extend 32) (currentByte!11568 thiss!982)) ((_ sign_extend 32) (currentBit!11563 thiss!982)) nBits!288)))

(declare-fun lt!375416 () Unit!17609)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10430 array!13139 (_ BitVec 64)) Unit!17609)

(assert (=> b!240361 (= lt!375416 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6214 (_2!11112 lt!375419)) nBits!288))))

(declare-fun reader!0 (BitStream!10430 BitStream!10430) tuple2!20378)

(assert (=> b!240361 (= lt!375418 (reader!0 thiss!982 (_2!11112 lt!375419)))))

(declare-fun b!240362 () Bool)

(declare-fun res!200654 () Bool)

(assert (=> b!240362 (=> (not res!200654) (not e!166601))))

(declare-fun isPrefixOf!0 (BitStream!10430 BitStream!10430) Bool)

(assert (=> b!240362 (= res!200654 (isPrefixOf!0 thiss!982 (_2!11112 lt!375419)))))

(declare-fun b!240363 () Bool)

(declare-fun e!166603 () Bool)

(assert (=> b!240363 (= e!166603 (not true))))

(declare-fun lt!375423 () tuple2!20378)

(assert (=> b!240363 (= lt!375423 (reader!0 thiss!982 (_2!11112 lt!375419)))))

(declare-fun lt!375420 () Bool)

(assert (=> b!240363 (= lt!375420 (isPrefixOf!0 thiss!982 (_2!11112 lt!375419)))))

(declare-fun lt!375421 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240363 (= lt!375421 (bitIndex!0 (size!5754 (buf!6214 (_2!11112 lt!375419))) (currentByte!11568 (_2!11112 lt!375419)) (currentBit!11563 (_2!11112 lt!375419))))))

(declare-fun lt!375422 () (_ BitVec 64))

(assert (=> b!240363 (= lt!375422 (bitIndex!0 (size!5754 (buf!6214 thiss!982)) (currentByte!11568 thiss!982) (currentBit!11563 thiss!982)))))

(assert (=> b!240363 e!166601))

(declare-fun res!200658 () Bool)

(assert (=> b!240363 (=> (not res!200658) (not e!166601))))

(assert (=> b!240363 (= res!200658 (= (size!5754 (buf!6214 thiss!982)) (size!5754 (buf!6214 (_2!11112 lt!375419)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10430 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20380)

(assert (=> b!240363 (= lt!375419 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!200656 () Bool)

(assert (=> start!52208 (=> (not res!200656) (not e!166603))))

(assert (=> start!52208 (= res!200656 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52208 e!166603))

(assert (=> start!52208 true))

(declare-fun inv!12 (BitStream!10430) Bool)

(assert (=> start!52208 (and (inv!12 thiss!982) e!166604)))

(declare-fun b!240364 () Bool)

(declare-fun res!200655 () Bool)

(assert (=> b!240364 (=> (not res!200655) (not e!166603))))

(assert (=> b!240364 (= res!200655 (validate_offset_bits!1 ((_ sign_extend 32) (size!5754 (buf!6214 thiss!982))) ((_ sign_extend 32) (currentByte!11568 thiss!982)) ((_ sign_extend 32) (currentBit!11563 thiss!982)) nBits!288))))

(declare-fun b!240365 () Bool)

(declare-fun res!200657 () Bool)

(assert (=> b!240365 (=> (not res!200657) (not e!166601))))

(assert (=> b!240365 (= res!200657 (= (bitIndex!0 (size!5754 (buf!6214 (_2!11112 lt!375419))) (currentByte!11568 (_2!11112 lt!375419)) (currentBit!11563 (_2!11112 lt!375419))) (bvadd (bitIndex!0 (size!5754 (buf!6214 thiss!982)) (currentByte!11568 thiss!982) (currentBit!11563 thiss!982)) nBits!288)))))

(assert (= (and start!52208 res!200656) b!240364))

(assert (= (and b!240364 res!200655) b!240363))

(assert (= (and b!240363 res!200658) b!240365))

(assert (= (and b!240365 res!200657) b!240362))

(assert (= (and b!240362 res!200654) b!240361))

(assert (= start!52208 b!240360))

(declare-fun m!362837 () Bool)

(assert (=> start!52208 m!362837))

(declare-fun m!362839 () Bool)

(assert (=> b!240361 m!362839))

(declare-fun m!362841 () Bool)

(assert (=> b!240361 m!362841))

(declare-fun m!362843 () Bool)

(assert (=> b!240361 m!362843))

(declare-fun m!362845 () Bool)

(assert (=> b!240361 m!362845))

(declare-fun m!362847 () Bool)

(assert (=> b!240362 m!362847))

(declare-fun m!362849 () Bool)

(assert (=> b!240364 m!362849))

(declare-fun m!362851 () Bool)

(assert (=> b!240363 m!362851))

(assert (=> b!240363 m!362845))

(declare-fun m!362853 () Bool)

(assert (=> b!240363 m!362853))

(declare-fun m!362855 () Bool)

(assert (=> b!240363 m!362855))

(assert (=> b!240363 m!362847))

(declare-fun m!362857 () Bool)

(assert (=> b!240360 m!362857))

(assert (=> b!240365 m!362851))

(assert (=> b!240365 m!362853))

(push 1)

(assert (not b!240363))

(assert (not b!240360))

(assert (not b!240362))

(assert (not b!240361))

(assert (not b!240365))

(assert (not b!240364))

(assert (not start!52208))

(check-sat)

(pop 1)

