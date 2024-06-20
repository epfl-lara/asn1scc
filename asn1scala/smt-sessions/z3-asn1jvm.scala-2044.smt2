; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52194 () Bool)

(assert start!52194)

(declare-fun b!240234 () Bool)

(declare-fun e!166519 () Bool)

(assert (=> b!240234 (= e!166519 (not true))))

(declare-fun lt!375256 () Bool)

(declare-datatypes ((array!13125 0))(
  ( (array!13126 (arr!6734 (Array (_ BitVec 32) (_ BitVec 8))) (size!5747 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10416 0))(
  ( (BitStream!10417 (buf!6207 array!13125) (currentByte!11561 (_ BitVec 32)) (currentBit!11556 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10416)

(declare-datatypes ((Unit!17595 0))(
  ( (Unit!17596) )
))
(declare-datatypes ((tuple2!20334 0))(
  ( (tuple2!20335 (_1!11089 Unit!17595) (_2!11089 BitStream!10416)) )
))
(declare-fun lt!375258 () tuple2!20334)

(declare-fun isPrefixOf!0 (BitStream!10416 BitStream!10416) Bool)

(assert (=> b!240234 (= lt!375256 (isPrefixOf!0 thiss!982 (_2!11089 lt!375258)))))

(declare-fun lt!375255 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240234 (= lt!375255 (bitIndex!0 (size!5747 (buf!6207 (_2!11089 lt!375258))) (currentByte!11561 (_2!11089 lt!375258)) (currentBit!11556 (_2!11089 lt!375258))))))

(declare-fun lt!375254 () (_ BitVec 64))

(assert (=> b!240234 (= lt!375254 (bitIndex!0 (size!5747 (buf!6207 thiss!982)) (currentByte!11561 thiss!982) (currentBit!11556 thiss!982)))))

(declare-fun e!166518 () Bool)

(assert (=> b!240234 e!166518))

(declare-fun res!200552 () Bool)

(assert (=> b!240234 (=> (not res!200552) (not e!166518))))

(assert (=> b!240234 (= res!200552 (= (size!5747 (buf!6207 thiss!982)) (size!5747 (buf!6207 (_2!11089 lt!375258)))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10416 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20334)

(assert (=> b!240234 (= lt!375258 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240235 () Bool)

(declare-fun res!200553 () Bool)

(assert (=> b!240235 (=> (not res!200553) (not e!166519))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240235 (= res!200553 (validate_offset_bits!1 ((_ sign_extend 32) (size!5747 (buf!6207 thiss!982))) ((_ sign_extend 32) (currentByte!11561 thiss!982)) ((_ sign_extend 32) (currentBit!11556 thiss!982)) nBits!288))))

(declare-fun b!240236 () Bool)

(declare-fun res!200551 () Bool)

(assert (=> b!240236 (=> (not res!200551) (not e!166518))))

(assert (=> b!240236 (= res!200551 (isPrefixOf!0 thiss!982 (_2!11089 lt!375258)))))

(declare-fun b!240237 () Bool)

(declare-fun e!166517 () Bool)

(declare-fun array_inv!5488 (array!13125) Bool)

(assert (=> b!240237 (= e!166517 (array_inv!5488 (buf!6207 thiss!982)))))

(declare-fun res!200549 () Bool)

(assert (=> start!52194 (=> (not res!200549) (not e!166519))))

(assert (=> start!52194 (= res!200549 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52194 e!166519))

(assert (=> start!52194 true))

(declare-fun inv!12 (BitStream!10416) Bool)

(assert (=> start!52194 (and (inv!12 thiss!982) e!166517)))

(declare-fun b!240238 () Bool)

(declare-fun res!200550 () Bool)

(assert (=> b!240238 (=> (not res!200550) (not e!166518))))

(assert (=> b!240238 (= res!200550 (= (bitIndex!0 (size!5747 (buf!6207 (_2!11089 lt!375258))) (currentByte!11561 (_2!11089 lt!375258)) (currentBit!11556 (_2!11089 lt!375258))) (bvadd (bitIndex!0 (size!5747 (buf!6207 thiss!982)) (currentByte!11561 thiss!982) (currentBit!11556 thiss!982)) nBits!288)))))

(declare-fun b!240239 () Bool)

(declare-datatypes ((tuple2!20336 0))(
  ( (tuple2!20337 (_1!11090 BitStream!10416) (_2!11090 Bool)) )
))
(declare-fun lt!375253 () tuple2!20336)

(declare-datatypes ((tuple2!20338 0))(
  ( (tuple2!20339 (_1!11091 BitStream!10416) (_2!11091 BitStream!10416)) )
))
(declare-fun lt!375257 () tuple2!20338)

(assert (=> b!240239 (= e!166518 (not (or (not (_2!11090 lt!375253)) (not (= (_1!11090 lt!375253) (_2!11091 lt!375257))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10416 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20336)

(assert (=> b!240239 (= lt!375253 (checkBitsLoopPure!0 (_1!11091 lt!375257) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240239 (validate_offset_bits!1 ((_ sign_extend 32) (size!5747 (buf!6207 (_2!11089 lt!375258)))) ((_ sign_extend 32) (currentByte!11561 thiss!982)) ((_ sign_extend 32) (currentBit!11556 thiss!982)) nBits!288)))

(declare-fun lt!375252 () Unit!17595)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10416 array!13125 (_ BitVec 64)) Unit!17595)

(assert (=> b!240239 (= lt!375252 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6207 (_2!11089 lt!375258)) nBits!288))))

(declare-fun reader!0 (BitStream!10416 BitStream!10416) tuple2!20338)

(assert (=> b!240239 (= lt!375257 (reader!0 thiss!982 (_2!11089 lt!375258)))))

(assert (= (and start!52194 res!200549) b!240235))

(assert (= (and b!240235 res!200553) b!240234))

(assert (= (and b!240234 res!200552) b!240238))

(assert (= (and b!240238 res!200550) b!240236))

(assert (= (and b!240236 res!200551) b!240239))

(assert (= start!52194 b!240237))

(declare-fun m!362683 () Bool)

(assert (=> b!240239 m!362683))

(declare-fun m!362685 () Bool)

(assert (=> b!240239 m!362685))

(declare-fun m!362687 () Bool)

(assert (=> b!240239 m!362687))

(declare-fun m!362689 () Bool)

(assert (=> b!240239 m!362689))

(declare-fun m!362691 () Bool)

(assert (=> b!240234 m!362691))

(declare-fun m!362693 () Bool)

(assert (=> b!240234 m!362693))

(declare-fun m!362695 () Bool)

(assert (=> b!240234 m!362695))

(declare-fun m!362697 () Bool)

(assert (=> b!240234 m!362697))

(declare-fun m!362699 () Bool)

(assert (=> b!240237 m!362699))

(assert (=> b!240238 m!362693))

(assert (=> b!240238 m!362695))

(declare-fun m!362701 () Bool)

(assert (=> start!52194 m!362701))

(declare-fun m!362703 () Bool)

(assert (=> b!240235 m!362703))

(assert (=> b!240236 m!362691))

(check-sat (not b!240234) (not b!240236) (not b!240238) (not b!240237) (not b!240235) (not b!240239) (not start!52194))
