; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52628 () Bool)

(assert start!52628)

(declare-fun b!243316 () Bool)

(declare-fun e!168667 () Bool)

(declare-fun e!168662 () Bool)

(assert (=> b!243316 (= e!168667 e!168662)))

(declare-fun res!203277 () Bool)

(assert (=> b!243316 (=> (not res!203277) (not e!168662))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((array!13340 0))(
  ( (array!13341 (arr!6835 (Array (_ BitVec 32) (_ BitVec 8))) (size!5848 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10618 0))(
  ( (BitStream!10619 (buf!6317 array!13340) (currentByte!11689 (_ BitVec 32)) (currentBit!11684 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17785 0))(
  ( (Unit!17786) )
))
(declare-datatypes ((tuple2!20844 0))(
  ( (tuple2!20845 (_1!11344 Unit!17785) (_2!11344 BitStream!10618)) )
))
(declare-fun lt!379197 () tuple2!20844)

(declare-datatypes ((tuple2!20846 0))(
  ( (tuple2!20847 (_1!11345 BitStream!10618) (_2!11345 Bool)) )
))
(declare-fun lt!379192 () tuple2!20846)

(assert (=> b!243316 (= res!203277 (and (= (_2!11345 lt!379192) bit!26) (= (_1!11345 lt!379192) (_2!11344 lt!379197))))))

(declare-fun thiss!1005 () BitStream!10618)

(declare-fun readBitPure!0 (BitStream!10618) tuple2!20846)

(declare-fun readerFrom!0 (BitStream!10618 (_ BitVec 32) (_ BitVec 32)) BitStream!10618)

(assert (=> b!243316 (= lt!379192 (readBitPure!0 (readerFrom!0 (_2!11344 lt!379197) (currentBit!11684 thiss!1005) (currentByte!11689 thiss!1005))))))

(declare-fun b!243317 () Bool)

(declare-fun e!168668 () Bool)

(declare-fun lt!379205 () tuple2!20846)

(declare-datatypes ((tuple2!20848 0))(
  ( (tuple2!20849 (_1!11346 BitStream!10618) (_2!11346 BitStream!10618)) )
))
(declare-fun lt!379195 () tuple2!20848)

(assert (=> b!243317 (= e!168668 (not (or (not (_2!11345 lt!379205)) (not (= (_1!11345 lt!379205) (_2!11346 lt!379195))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10618 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20846)

(assert (=> b!243317 (= lt!379205 (checkBitsLoopPure!0 (_1!11346 lt!379195) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!379189 () tuple2!20844)

(declare-fun lt!379190 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243317 (validate_offset_bits!1 ((_ sign_extend 32) (size!5848 (buf!6317 (_2!11344 lt!379189)))) ((_ sign_extend 32) (currentByte!11689 (_2!11344 lt!379197))) ((_ sign_extend 32) (currentBit!11684 (_2!11344 lt!379197))) lt!379190)))

(declare-fun lt!379198 () Unit!17785)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10618 array!13340 (_ BitVec 64)) Unit!17785)

(assert (=> b!243317 (= lt!379198 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11344 lt!379197) (buf!6317 (_2!11344 lt!379189)) lt!379190))))

(declare-fun reader!0 (BitStream!10618 BitStream!10618) tuple2!20848)

(assert (=> b!243317 (= lt!379195 (reader!0 (_2!11344 lt!379197) (_2!11344 lt!379189)))))

(declare-fun res!203271 () Bool)

(declare-fun e!168669 () Bool)

(assert (=> start!52628 (=> (not res!203271) (not e!168669))))

(assert (=> start!52628 (= res!203271 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52628 e!168669))

(assert (=> start!52628 true))

(declare-fun e!168663 () Bool)

(declare-fun inv!12 (BitStream!10618) Bool)

(assert (=> start!52628 (and (inv!12 thiss!1005) e!168663)))

(declare-fun b!243318 () Bool)

(declare-fun res!203270 () Bool)

(declare-fun e!168671 () Bool)

(assert (=> b!243318 (=> (not res!203270) (not e!168671))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243318 (= res!203270 (invariant!0 (currentBit!11684 thiss!1005) (currentByte!11689 thiss!1005) (size!5848 (buf!6317 (_2!11344 lt!379197)))))))

(declare-fun b!243319 () Bool)

(declare-fun res!203276 () Bool)

(assert (=> b!243319 (=> (not res!203276) (not e!168668))))

(declare-fun isPrefixOf!0 (BitStream!10618 BitStream!10618) Bool)

(assert (=> b!243319 (= res!203276 (isPrefixOf!0 (_2!11344 lt!379197) (_2!11344 lt!379189)))))

(declare-fun b!243320 () Bool)

(declare-fun lt!379200 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243320 (= e!168662 (= (bitIndex!0 (size!5848 (buf!6317 (_1!11345 lt!379192))) (currentByte!11689 (_1!11345 lt!379192)) (currentBit!11684 (_1!11345 lt!379192))) lt!379200))))

(declare-fun b!243321 () Bool)

(assert (=> b!243321 (= e!168671 (invariant!0 (currentBit!11684 thiss!1005) (currentByte!11689 thiss!1005) (size!5848 (buf!6317 (_2!11344 lt!379189)))))))

(declare-fun b!243322 () Bool)

(declare-fun e!168665 () Bool)

(assert (=> b!243322 (= e!168665 e!168667)))

(declare-fun res!203272 () Bool)

(assert (=> b!243322 (=> (not res!203272) (not e!168667))))

(declare-fun lt!379203 () (_ BitVec 64))

(assert (=> b!243322 (= res!203272 (= lt!379200 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379203)))))

(assert (=> b!243322 (= lt!379200 (bitIndex!0 (size!5848 (buf!6317 (_2!11344 lt!379197))) (currentByte!11689 (_2!11344 lt!379197)) (currentBit!11684 (_2!11344 lt!379197))))))

(assert (=> b!243322 (= lt!379203 (bitIndex!0 (size!5848 (buf!6317 thiss!1005)) (currentByte!11689 thiss!1005) (currentBit!11684 thiss!1005)))))

(declare-fun b!243323 () Bool)

(declare-fun e!168670 () Bool)

(assert (=> b!243323 (= e!168670 e!168668)))

(declare-fun res!203274 () Bool)

(assert (=> b!243323 (=> (not res!203274) (not e!168668))))

(assert (=> b!243323 (= res!203274 (= (bitIndex!0 (size!5848 (buf!6317 (_2!11344 lt!379189))) (currentByte!11689 (_2!11344 lt!379189)) (currentBit!11684 (_2!11344 lt!379189))) (bvadd (bitIndex!0 (size!5848 (buf!6317 (_2!11344 lt!379197))) (currentByte!11689 (_2!11344 lt!379197)) (currentBit!11684 (_2!11344 lt!379197))) lt!379190)))))

(assert (=> b!243323 (= lt!379190 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243324 () Bool)

(declare-fun array_inv!5589 (array!13340) Bool)

(assert (=> b!243324 (= e!168663 (array_inv!5589 (buf!6317 thiss!1005)))))

(declare-fun b!243325 () Bool)

(declare-fun res!203273 () Bool)

(assert (=> b!243325 (=> (not res!203273) (not e!168667))))

(assert (=> b!243325 (= res!203273 (isPrefixOf!0 thiss!1005 (_2!11344 lt!379197)))))

(declare-fun b!243326 () Bool)

(assert (=> b!243326 (= e!168669 (not true))))

(assert (=> b!243326 (validate_offset_bits!1 ((_ sign_extend 32) (size!5848 (buf!6317 (_2!11344 lt!379189)))) ((_ sign_extend 32) (currentByte!11689 thiss!1005)) ((_ sign_extend 32) (currentBit!11684 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379202 () Unit!17785)

(assert (=> b!243326 (= lt!379202 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6317 (_2!11344 lt!379189)) (bvsub nBits!297 from!289)))))

(declare-fun lt!379191 () tuple2!20848)

(assert (=> b!243326 (= (_2!11345 (readBitPure!0 (_1!11346 lt!379191))) bit!26)))

(declare-fun lt!379196 () tuple2!20848)

(assert (=> b!243326 (= lt!379196 (reader!0 (_2!11344 lt!379197) (_2!11344 lt!379189)))))

(assert (=> b!243326 (= lt!379191 (reader!0 thiss!1005 (_2!11344 lt!379189)))))

(declare-fun e!168666 () Bool)

(assert (=> b!243326 e!168666))

(declare-fun res!203280 () Bool)

(assert (=> b!243326 (=> (not res!203280) (not e!168666))))

(declare-fun lt!379194 () tuple2!20846)

(declare-fun lt!379193 () tuple2!20846)

(assert (=> b!243326 (= res!203280 (= (bitIndex!0 (size!5848 (buf!6317 (_1!11345 lt!379194))) (currentByte!11689 (_1!11345 lt!379194)) (currentBit!11684 (_1!11345 lt!379194))) (bitIndex!0 (size!5848 (buf!6317 (_1!11345 lt!379193))) (currentByte!11689 (_1!11345 lt!379193)) (currentBit!11684 (_1!11345 lt!379193)))))))

(declare-fun lt!379201 () Unit!17785)

(declare-fun lt!379206 () BitStream!10618)

(declare-fun readBitPrefixLemma!0 (BitStream!10618 BitStream!10618) Unit!17785)

(assert (=> b!243326 (= lt!379201 (readBitPrefixLemma!0 lt!379206 (_2!11344 lt!379189)))))

(assert (=> b!243326 (= lt!379193 (readBitPure!0 (BitStream!10619 (buf!6317 (_2!11344 lt!379189)) (currentByte!11689 thiss!1005) (currentBit!11684 thiss!1005))))))

(assert (=> b!243326 (= lt!379194 (readBitPure!0 lt!379206))))

(assert (=> b!243326 (= lt!379206 (BitStream!10619 (buf!6317 (_2!11344 lt!379197)) (currentByte!11689 thiss!1005) (currentBit!11684 thiss!1005)))))

(assert (=> b!243326 e!168671))

(declare-fun res!203268 () Bool)

(assert (=> b!243326 (=> (not res!203268) (not e!168671))))

(assert (=> b!243326 (= res!203268 (isPrefixOf!0 thiss!1005 (_2!11344 lt!379189)))))

(declare-fun lt!379199 () Unit!17785)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10618 BitStream!10618 BitStream!10618) Unit!17785)

(assert (=> b!243326 (= lt!379199 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11344 lt!379197) (_2!11344 lt!379189)))))

(assert (=> b!243326 e!168670))

(declare-fun res!203269 () Bool)

(assert (=> b!243326 (=> (not res!203269) (not e!168670))))

(assert (=> b!243326 (= res!203269 (= (size!5848 (buf!6317 (_2!11344 lt!379197))) (size!5848 (buf!6317 (_2!11344 lt!379189)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10618 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20844)

(assert (=> b!243326 (= lt!379189 (appendNBitsLoop!0 (_2!11344 lt!379197) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243326 (validate_offset_bits!1 ((_ sign_extend 32) (size!5848 (buf!6317 (_2!11344 lt!379197)))) ((_ sign_extend 32) (currentByte!11689 (_2!11344 lt!379197))) ((_ sign_extend 32) (currentBit!11684 (_2!11344 lt!379197))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379204 () Unit!17785)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10618 BitStream!10618 (_ BitVec 64) (_ BitVec 64)) Unit!17785)

(assert (=> b!243326 (= lt!379204 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11344 lt!379197) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!243326 e!168665))

(declare-fun res!203279 () Bool)

(assert (=> b!243326 (=> (not res!203279) (not e!168665))))

(assert (=> b!243326 (= res!203279 (= (size!5848 (buf!6317 thiss!1005)) (size!5848 (buf!6317 (_2!11344 lt!379197)))))))

(declare-fun appendBit!0 (BitStream!10618 Bool) tuple2!20844)

(assert (=> b!243326 (= lt!379197 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243327 () Bool)

(declare-fun res!203275 () Bool)

(assert (=> b!243327 (=> (not res!203275) (not e!168669))))

(assert (=> b!243327 (= res!203275 (validate_offset_bits!1 ((_ sign_extend 32) (size!5848 (buf!6317 thiss!1005))) ((_ sign_extend 32) (currentByte!11689 thiss!1005)) ((_ sign_extend 32) (currentBit!11684 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243328 () Bool)

(assert (=> b!243328 (= e!168666 (= (_2!11345 lt!379194) (_2!11345 lt!379193)))))

(declare-fun b!243329 () Bool)

(declare-fun res!203278 () Bool)

(assert (=> b!243329 (=> (not res!203278) (not e!168669))))

(assert (=> b!243329 (= res!203278 (bvslt from!289 nBits!297))))

(assert (= (and start!52628 res!203271) b!243327))

(assert (= (and b!243327 res!203275) b!243329))

(assert (= (and b!243329 res!203278) b!243326))

(assert (= (and b!243326 res!203279) b!243322))

(assert (= (and b!243322 res!203272) b!243325))

(assert (= (and b!243325 res!203273) b!243316))

(assert (= (and b!243316 res!203277) b!243320))

(assert (= (and b!243326 res!203269) b!243323))

(assert (= (and b!243323 res!203274) b!243319))

(assert (= (and b!243319 res!203276) b!243317))

(assert (= (and b!243326 res!203268) b!243318))

(assert (= (and b!243318 res!203270) b!243321))

(assert (= (and b!243326 res!203280) b!243328))

(assert (= start!52628 b!243324))

(declare-fun m!366593 () Bool)

(assert (=> b!243324 m!366593))

(declare-fun m!366595 () Bool)

(assert (=> b!243318 m!366595))

(declare-fun m!366597 () Bool)

(assert (=> b!243327 m!366597))

(declare-fun m!366599 () Bool)

(assert (=> b!243326 m!366599))

(declare-fun m!366601 () Bool)

(assert (=> b!243326 m!366601))

(declare-fun m!366603 () Bool)

(assert (=> b!243326 m!366603))

(declare-fun m!366605 () Bool)

(assert (=> b!243326 m!366605))

(declare-fun m!366607 () Bool)

(assert (=> b!243326 m!366607))

(declare-fun m!366609 () Bool)

(assert (=> b!243326 m!366609))

(declare-fun m!366611 () Bool)

(assert (=> b!243326 m!366611))

(declare-fun m!366613 () Bool)

(assert (=> b!243326 m!366613))

(declare-fun m!366615 () Bool)

(assert (=> b!243326 m!366615))

(declare-fun m!366617 () Bool)

(assert (=> b!243326 m!366617))

(declare-fun m!366619 () Bool)

(assert (=> b!243326 m!366619))

(declare-fun m!366621 () Bool)

(assert (=> b!243326 m!366621))

(declare-fun m!366623 () Bool)

(assert (=> b!243326 m!366623))

(declare-fun m!366625 () Bool)

(assert (=> b!243326 m!366625))

(declare-fun m!366627 () Bool)

(assert (=> b!243326 m!366627))

(declare-fun m!366629 () Bool)

(assert (=> b!243326 m!366629))

(declare-fun m!366631 () Bool)

(assert (=> b!243319 m!366631))

(declare-fun m!366633 () Bool)

(assert (=> b!243322 m!366633))

(declare-fun m!366635 () Bool)

(assert (=> b!243322 m!366635))

(declare-fun m!366637 () Bool)

(assert (=> b!243317 m!366637))

(declare-fun m!366639 () Bool)

(assert (=> b!243317 m!366639))

(declare-fun m!366641 () Bool)

(assert (=> b!243317 m!366641))

(assert (=> b!243317 m!366623))

(declare-fun m!366643 () Bool)

(assert (=> b!243320 m!366643))

(declare-fun m!366645 () Bool)

(assert (=> b!243323 m!366645))

(assert (=> b!243323 m!366633))

(declare-fun m!366647 () Bool)

(assert (=> start!52628 m!366647))

(declare-fun m!366649 () Bool)

(assert (=> b!243316 m!366649))

(assert (=> b!243316 m!366649))

(declare-fun m!366651 () Bool)

(assert (=> b!243316 m!366651))

(declare-fun m!366653 () Bool)

(assert (=> b!243321 m!366653))

(declare-fun m!366655 () Bool)

(assert (=> b!243325 m!366655))

(push 1)

(assert (not b!243327))

(assert (not b!243321))

(assert (not b!243326))

(assert (not b!243318))

(assert (not b!243324))

(assert (not b!243319))

(assert (not b!243316))

(assert (not start!52628))

(assert (not b!243323))

(assert (not b!243322))

(assert (not b!243317))

(assert (not b!243320))

(assert (not b!243325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

