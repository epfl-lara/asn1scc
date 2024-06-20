; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52198 () Bool)

(assert start!52198)

(declare-fun b!240270 () Bool)

(declare-fun res!200579 () Bool)

(declare-fun e!166543 () Bool)

(assert (=> b!240270 (=> (not res!200579) (not e!166543))))

(declare-datatypes ((array!13129 0))(
  ( (array!13130 (arr!6736 (Array (_ BitVec 32) (_ BitVec 8))) (size!5749 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10420 0))(
  ( (BitStream!10421 (buf!6209 array!13129) (currentByte!11563 (_ BitVec 32)) (currentBit!11558 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10420)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240270 (= res!200579 (validate_offset_bits!1 ((_ sign_extend 32) (size!5749 (buf!6209 thiss!982))) ((_ sign_extend 32) (currentByte!11563 thiss!982)) ((_ sign_extend 32) (currentBit!11558 thiss!982)) nBits!288))))

(declare-fun res!200581 () Bool)

(assert (=> start!52198 (=> (not res!200581) (not e!166543))))

(assert (=> start!52198 (= res!200581 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52198 e!166543))

(assert (=> start!52198 true))

(declare-fun e!166544 () Bool)

(declare-fun inv!12 (BitStream!10420) Bool)

(assert (=> start!52198 (and (inv!12 thiss!982) e!166544)))

(declare-fun b!240271 () Bool)

(declare-fun array_inv!5490 (array!13129) Bool)

(assert (=> b!240271 (= e!166544 (array_inv!5490 (buf!6209 thiss!982)))))

(declare-fun b!240272 () Bool)

(declare-fun res!200580 () Bool)

(declare-fun e!166542 () Bool)

(assert (=> b!240272 (=> (not res!200580) (not e!166542))))

(declare-datatypes ((Unit!17599 0))(
  ( (Unit!17600) )
))
(declare-datatypes ((tuple2!20346 0))(
  ( (tuple2!20347 (_1!11095 Unit!17599) (_2!11095 BitStream!10420)) )
))
(declare-fun lt!375297 () tuple2!20346)

(declare-fun isPrefixOf!0 (BitStream!10420 BitStream!10420) Bool)

(assert (=> b!240272 (= res!200580 (isPrefixOf!0 thiss!982 (_2!11095 lt!375297)))))

(declare-fun b!240273 () Bool)

(declare-datatypes ((tuple2!20348 0))(
  ( (tuple2!20349 (_1!11096 BitStream!10420) (_2!11096 Bool)) )
))
(declare-fun lt!375298 () tuple2!20348)

(declare-datatypes ((tuple2!20350 0))(
  ( (tuple2!20351 (_1!11097 BitStream!10420) (_2!11097 BitStream!10420)) )
))
(declare-fun lt!375299 () tuple2!20350)

(assert (=> b!240273 (= e!166542 (not (or (not (_2!11096 lt!375298)) (not (= (_1!11096 lt!375298) (_2!11097 lt!375299))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10420 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20348)

(assert (=> b!240273 (= lt!375298 (checkBitsLoopPure!0 (_1!11097 lt!375299) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240273 (validate_offset_bits!1 ((_ sign_extend 32) (size!5749 (buf!6209 (_2!11095 lt!375297)))) ((_ sign_extend 32) (currentByte!11563 thiss!982)) ((_ sign_extend 32) (currentBit!11558 thiss!982)) nBits!288)))

(declare-fun lt!375302 () Unit!17599)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10420 array!13129 (_ BitVec 64)) Unit!17599)

(assert (=> b!240273 (= lt!375302 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6209 (_2!11095 lt!375297)) nBits!288))))

(declare-fun reader!0 (BitStream!10420 BitStream!10420) tuple2!20350)

(assert (=> b!240273 (= lt!375299 (reader!0 thiss!982 (_2!11095 lt!375297)))))

(declare-fun b!240274 () Bool)

(assert (=> b!240274 (= e!166543 (not true))))

(declare-fun lt!375301 () tuple2!20350)

(assert (=> b!240274 (= lt!375301 (reader!0 thiss!982 (_2!11095 lt!375297)))))

(declare-fun lt!375300 () Bool)

(assert (=> b!240274 (= lt!375300 (isPrefixOf!0 thiss!982 (_2!11095 lt!375297)))))

(declare-fun lt!375303 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240274 (= lt!375303 (bitIndex!0 (size!5749 (buf!6209 (_2!11095 lt!375297))) (currentByte!11563 (_2!11095 lt!375297)) (currentBit!11558 (_2!11095 lt!375297))))))

(declare-fun lt!375296 () (_ BitVec 64))

(assert (=> b!240274 (= lt!375296 (bitIndex!0 (size!5749 (buf!6209 thiss!982)) (currentByte!11563 thiss!982) (currentBit!11558 thiss!982)))))

(assert (=> b!240274 e!166542))

(declare-fun res!200583 () Bool)

(assert (=> b!240274 (=> (not res!200583) (not e!166542))))

(assert (=> b!240274 (= res!200583 (= (size!5749 (buf!6209 thiss!982)) (size!5749 (buf!6209 (_2!11095 lt!375297)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10420 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20346)

(assert (=> b!240274 (= lt!375297 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240275 () Bool)

(declare-fun res!200582 () Bool)

(assert (=> b!240275 (=> (not res!200582) (not e!166542))))

(assert (=> b!240275 (= res!200582 (= (bitIndex!0 (size!5749 (buf!6209 (_2!11095 lt!375297))) (currentByte!11563 (_2!11095 lt!375297)) (currentBit!11558 (_2!11095 lt!375297))) (bvadd (bitIndex!0 (size!5749 (buf!6209 thiss!982)) (currentByte!11563 thiss!982) (currentBit!11558 thiss!982)) nBits!288)))))

(assert (= (and start!52198 res!200581) b!240270))

(assert (= (and b!240270 res!200579) b!240274))

(assert (= (and b!240274 res!200583) b!240275))

(assert (= (and b!240275 res!200582) b!240272))

(assert (= (and b!240272 res!200580) b!240273))

(assert (= start!52198 b!240271))

(declare-fun m!362727 () Bool)

(assert (=> b!240271 m!362727))

(declare-fun m!362729 () Bool)

(assert (=> b!240274 m!362729))

(declare-fun m!362731 () Bool)

(assert (=> b!240274 m!362731))

(declare-fun m!362733 () Bool)

(assert (=> b!240274 m!362733))

(declare-fun m!362735 () Bool)

(assert (=> b!240274 m!362735))

(declare-fun m!362737 () Bool)

(assert (=> b!240274 m!362737))

(assert (=> b!240275 m!362729))

(assert (=> b!240275 m!362731))

(declare-fun m!362739 () Bool)

(assert (=> start!52198 m!362739))

(assert (=> b!240272 m!362737))

(declare-fun m!362741 () Bool)

(assert (=> b!240273 m!362741))

(declare-fun m!362743 () Bool)

(assert (=> b!240273 m!362743))

(declare-fun m!362745 () Bool)

(assert (=> b!240273 m!362745))

(assert (=> b!240273 m!362735))

(declare-fun m!362747 () Bool)

(assert (=> b!240270 m!362747))

(push 1)

(assert (not b!240270))

(assert (not start!52198))

(assert (not b!240275))

(assert (not b!240274))

(assert (not b!240272))

(assert (not b!240273))

(assert (not b!240271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

