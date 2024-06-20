; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52200 () Bool)

(assert start!52200)

(declare-fun res!200594 () Bool)

(declare-fun e!166556 () Bool)

(assert (=> start!52200 (=> (not res!200594) (not e!166556))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52200 (= res!200594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52200 e!166556))

(assert (=> start!52200 true))

(declare-datatypes ((array!13131 0))(
  ( (array!13132 (arr!6737 (Array (_ BitVec 32) (_ BitVec 8))) (size!5750 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10422 0))(
  ( (BitStream!10423 (buf!6210 array!13131) (currentByte!11564 (_ BitVec 32)) (currentBit!11559 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10422)

(declare-fun e!166553 () Bool)

(declare-fun inv!12 (BitStream!10422) Bool)

(assert (=> start!52200 (and (inv!12 thiss!982) e!166553)))

(declare-fun b!240288 () Bool)

(declare-fun array_inv!5491 (array!13131) Bool)

(assert (=> b!240288 (= e!166553 (array_inv!5491 (buf!6210 thiss!982)))))

(declare-fun b!240289 () Bool)

(declare-fun res!200597 () Bool)

(assert (=> b!240289 (=> (not res!200597) (not e!166556))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240289 (= res!200597 (validate_offset_bits!1 ((_ sign_extend 32) (size!5750 (buf!6210 thiss!982))) ((_ sign_extend 32) (currentByte!11564 thiss!982)) ((_ sign_extend 32) (currentBit!11559 thiss!982)) nBits!288))))

(declare-fun b!240290 () Bool)

(declare-fun e!166555 () Bool)

(declare-datatypes ((tuple2!20352 0))(
  ( (tuple2!20353 (_1!11098 BitStream!10422) (_2!11098 Bool)) )
))
(declare-fun lt!375327 () tuple2!20352)

(declare-datatypes ((tuple2!20354 0))(
  ( (tuple2!20355 (_1!11099 BitStream!10422) (_2!11099 BitStream!10422)) )
))
(declare-fun lt!375322 () tuple2!20354)

(assert (=> b!240290 (= e!166555 (not (or (not (_2!11098 lt!375327)) (not (= (_1!11098 lt!375327) (_2!11099 lt!375322))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10422 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20352)

(assert (=> b!240290 (= lt!375327 (checkBitsLoopPure!0 (_1!11099 lt!375322) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17601 0))(
  ( (Unit!17602) )
))
(declare-datatypes ((tuple2!20356 0))(
  ( (tuple2!20357 (_1!11100 Unit!17601) (_2!11100 BitStream!10422)) )
))
(declare-fun lt!375326 () tuple2!20356)

(assert (=> b!240290 (validate_offset_bits!1 ((_ sign_extend 32) (size!5750 (buf!6210 (_2!11100 lt!375326)))) ((_ sign_extend 32) (currentByte!11564 thiss!982)) ((_ sign_extend 32) (currentBit!11559 thiss!982)) nBits!288)))

(declare-fun lt!375323 () Unit!17601)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10422 array!13131 (_ BitVec 64)) Unit!17601)

(assert (=> b!240290 (= lt!375323 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6210 (_2!11100 lt!375326)) nBits!288))))

(declare-fun reader!0 (BitStream!10422 BitStream!10422) tuple2!20354)

(assert (=> b!240290 (= lt!375322 (reader!0 thiss!982 (_2!11100 lt!375326)))))

(declare-fun b!240291 () Bool)

(declare-fun res!200595 () Bool)

(assert (=> b!240291 (=> (not res!200595) (not e!166555))))

(declare-fun isPrefixOf!0 (BitStream!10422 BitStream!10422) Bool)

(assert (=> b!240291 (= res!200595 (isPrefixOf!0 thiss!982 (_2!11100 lt!375326)))))

(declare-fun b!240292 () Bool)

(declare-fun res!200596 () Bool)

(assert (=> b!240292 (=> (not res!200596) (not e!166555))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240292 (= res!200596 (= (bitIndex!0 (size!5750 (buf!6210 (_2!11100 lt!375326))) (currentByte!11564 (_2!11100 lt!375326)) (currentBit!11559 (_2!11100 lt!375326))) (bvadd (bitIndex!0 (size!5750 (buf!6210 thiss!982)) (currentByte!11564 thiss!982) (currentBit!11559 thiss!982)) nBits!288)))))

(declare-fun b!240293 () Bool)

(assert (=> b!240293 (= e!166556 (not true))))

(declare-fun lt!375325 () tuple2!20354)

(assert (=> b!240293 (= lt!375325 (reader!0 thiss!982 (_2!11100 lt!375326)))))

(declare-fun lt!375324 () Bool)

(assert (=> b!240293 (= lt!375324 (isPrefixOf!0 thiss!982 (_2!11100 lt!375326)))))

(declare-fun lt!375320 () (_ BitVec 64))

(assert (=> b!240293 (= lt!375320 (bitIndex!0 (size!5750 (buf!6210 (_2!11100 lt!375326))) (currentByte!11564 (_2!11100 lt!375326)) (currentBit!11559 (_2!11100 lt!375326))))))

(declare-fun lt!375321 () (_ BitVec 64))

(assert (=> b!240293 (= lt!375321 (bitIndex!0 (size!5750 (buf!6210 thiss!982)) (currentByte!11564 thiss!982) (currentBit!11559 thiss!982)))))

(assert (=> b!240293 e!166555))

(declare-fun res!200598 () Bool)

(assert (=> b!240293 (=> (not res!200598) (not e!166555))))

(assert (=> b!240293 (= res!200598 (= (size!5750 (buf!6210 thiss!982)) (size!5750 (buf!6210 (_2!11100 lt!375326)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10422 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20356)

(assert (=> b!240293 (= lt!375326 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!52200 res!200594) b!240289))

(assert (= (and b!240289 res!200597) b!240293))

(assert (= (and b!240293 res!200598) b!240292))

(assert (= (and b!240292 res!200596) b!240291))

(assert (= (and b!240291 res!200595) b!240290))

(assert (= start!52200 b!240288))

(declare-fun m!362749 () Bool)

(assert (=> b!240291 m!362749))

(declare-fun m!362751 () Bool)

(assert (=> b!240288 m!362751))

(declare-fun m!362753 () Bool)

(assert (=> b!240289 m!362753))

(declare-fun m!362755 () Bool)

(assert (=> b!240292 m!362755))

(declare-fun m!362757 () Bool)

(assert (=> b!240292 m!362757))

(declare-fun m!362759 () Bool)

(assert (=> start!52200 m!362759))

(declare-fun m!362761 () Bool)

(assert (=> b!240290 m!362761))

(declare-fun m!362763 () Bool)

(assert (=> b!240290 m!362763))

(declare-fun m!362765 () Bool)

(assert (=> b!240290 m!362765))

(declare-fun m!362767 () Bool)

(assert (=> b!240290 m!362767))

(assert (=> b!240293 m!362767))

(assert (=> b!240293 m!362757))

(assert (=> b!240293 m!362749))

(declare-fun m!362769 () Bool)

(assert (=> b!240293 m!362769))

(assert (=> b!240293 m!362755))

(check-sat (not b!240288) (not b!240289) (not b!240291) (not b!240292) (not start!52200) (not b!240290) (not b!240293))
