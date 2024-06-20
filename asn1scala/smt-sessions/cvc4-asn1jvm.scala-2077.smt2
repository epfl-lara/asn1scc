; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52626 () Bool)

(assert start!52626)

(declare-fun b!243274 () Bool)

(declare-fun res!203233 () Bool)

(declare-fun e!168635 () Bool)

(assert (=> b!243274 (=> (not res!203233) (not e!168635))))

(declare-datatypes ((array!13338 0))(
  ( (array!13339 (arr!6834 (Array (_ BitVec 32) (_ BitVec 8))) (size!5847 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10616 0))(
  ( (BitStream!10617 (buf!6316 array!13338) (currentByte!11688 (_ BitVec 32)) (currentBit!11683 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10616)

(declare-datatypes ((Unit!17783 0))(
  ( (Unit!17784) )
))
(declare-datatypes ((tuple2!20838 0))(
  ( (tuple2!20839 (_1!11341 Unit!17783) (_2!11341 BitStream!10616)) )
))
(declare-fun lt!379143 () tuple2!20838)

(declare-fun isPrefixOf!0 (BitStream!10616 BitStream!10616) Bool)

(assert (=> b!243274 (= res!203233 (isPrefixOf!0 thiss!1005 (_2!11341 lt!379143)))))

(declare-fun b!243275 () Bool)

(declare-fun e!168637 () Bool)

(assert (=> b!243275 (= e!168637 (not true))))

(declare-datatypes ((tuple2!20840 0))(
  ( (tuple2!20841 (_1!11342 BitStream!10616) (_2!11342 BitStream!10616)) )
))
(declare-fun lt!379149 () tuple2!20840)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20842 0))(
  ( (tuple2!20843 (_1!11343 BitStream!10616) (_2!11343 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10616) tuple2!20842)

(assert (=> b!243275 (= (_2!11343 (readBitPure!0 (_1!11342 lt!379149))) bit!26)))

(declare-fun lt!379145 () tuple2!20840)

(declare-fun lt!379142 () tuple2!20838)

(declare-fun reader!0 (BitStream!10616 BitStream!10616) tuple2!20840)

(assert (=> b!243275 (= lt!379145 (reader!0 (_2!11341 lt!379143) (_2!11341 lt!379142)))))

(assert (=> b!243275 (= lt!379149 (reader!0 thiss!1005 (_2!11341 lt!379142)))))

(declare-fun e!168632 () Bool)

(assert (=> b!243275 e!168632))

(declare-fun res!203241 () Bool)

(assert (=> b!243275 (=> (not res!203241) (not e!168632))))

(declare-fun lt!379137 () tuple2!20842)

(declare-fun lt!379140 () tuple2!20842)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243275 (= res!203241 (= (bitIndex!0 (size!5847 (buf!6316 (_1!11343 lt!379137))) (currentByte!11688 (_1!11343 lt!379137)) (currentBit!11683 (_1!11343 lt!379137))) (bitIndex!0 (size!5847 (buf!6316 (_1!11343 lt!379140))) (currentByte!11688 (_1!11343 lt!379140)) (currentBit!11683 (_1!11343 lt!379140)))))))

(declare-fun lt!379150 () Unit!17783)

(declare-fun lt!379139 () BitStream!10616)

(declare-fun readBitPrefixLemma!0 (BitStream!10616 BitStream!10616) Unit!17783)

(assert (=> b!243275 (= lt!379150 (readBitPrefixLemma!0 lt!379139 (_2!11341 lt!379142)))))

(assert (=> b!243275 (= lt!379140 (readBitPure!0 (BitStream!10617 (buf!6316 (_2!11341 lt!379142)) (currentByte!11688 thiss!1005) (currentBit!11683 thiss!1005))))))

(assert (=> b!243275 (= lt!379137 (readBitPure!0 lt!379139))))

(assert (=> b!243275 (= lt!379139 (BitStream!10617 (buf!6316 (_2!11341 lt!379143)) (currentByte!11688 thiss!1005) (currentBit!11683 thiss!1005)))))

(declare-fun e!168640 () Bool)

(assert (=> b!243275 e!168640))

(declare-fun res!203234 () Bool)

(assert (=> b!243275 (=> (not res!203234) (not e!168640))))

(assert (=> b!243275 (= res!203234 (isPrefixOf!0 thiss!1005 (_2!11341 lt!379142)))))

(declare-fun lt!379141 () Unit!17783)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10616 BitStream!10616 BitStream!10616) Unit!17783)

(assert (=> b!243275 (= lt!379141 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11341 lt!379143) (_2!11341 lt!379142)))))

(declare-fun e!168633 () Bool)

(assert (=> b!243275 e!168633))

(declare-fun res!203230 () Bool)

(assert (=> b!243275 (=> (not res!203230) (not e!168633))))

(assert (=> b!243275 (= res!203230 (= (size!5847 (buf!6316 (_2!11341 lt!379143))) (size!5847 (buf!6316 (_2!11341 lt!379142)))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun appendNBitsLoop!0 (BitStream!10616 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20838)

(assert (=> b!243275 (= lt!379142 (appendNBitsLoop!0 (_2!11341 lt!379143) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243275 (validate_offset_bits!1 ((_ sign_extend 32) (size!5847 (buf!6316 (_2!11341 lt!379143)))) ((_ sign_extend 32) (currentByte!11688 (_2!11341 lt!379143))) ((_ sign_extend 32) (currentBit!11683 (_2!11341 lt!379143))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379144 () Unit!17783)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10616 BitStream!10616 (_ BitVec 64) (_ BitVec 64)) Unit!17783)

(assert (=> b!243275 (= lt!379144 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11341 lt!379143) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168639 () Bool)

(assert (=> b!243275 e!168639))

(declare-fun res!203235 () Bool)

(assert (=> b!243275 (=> (not res!203235) (not e!168639))))

(assert (=> b!243275 (= res!203235 (= (size!5847 (buf!6316 thiss!1005)) (size!5847 (buf!6316 (_2!11341 lt!379143)))))))

(declare-fun appendBit!0 (BitStream!10616 Bool) tuple2!20838)

(assert (=> b!243275 (= lt!379143 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243277 () Bool)

(assert (=> b!243277 (= e!168639 e!168635)))

(declare-fun res!203229 () Bool)

(assert (=> b!243277 (=> (not res!203229) (not e!168635))))

(declare-fun lt!379136 () (_ BitVec 64))

(declare-fun lt!379147 () (_ BitVec 64))

(assert (=> b!243277 (= res!203229 (= lt!379136 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379147)))))

(assert (=> b!243277 (= lt!379136 (bitIndex!0 (size!5847 (buf!6316 (_2!11341 lt!379143))) (currentByte!11688 (_2!11341 lt!379143)) (currentBit!11683 (_2!11341 lt!379143))))))

(assert (=> b!243277 (= lt!379147 (bitIndex!0 (size!5847 (buf!6316 thiss!1005)) (currentByte!11688 thiss!1005) (currentBit!11683 thiss!1005)))))

(declare-fun b!243278 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243278 (= e!168640 (invariant!0 (currentBit!11683 thiss!1005) (currentByte!11688 thiss!1005) (size!5847 (buf!6316 (_2!11341 lt!379142)))))))

(declare-fun b!243279 () Bool)

(declare-fun res!203232 () Bool)

(assert (=> b!243279 (=> (not res!203232) (not e!168637))))

(assert (=> b!243279 (= res!203232 (bvslt from!289 nBits!297))))

(declare-fun b!243280 () Bool)

(declare-fun e!168634 () Bool)

(declare-fun lt!379146 () tuple2!20842)

(declare-fun lt!379152 () tuple2!20840)

(assert (=> b!243280 (= e!168634 (not (or (not (_2!11343 lt!379146)) (not (= (_1!11343 lt!379146) (_2!11342 lt!379152))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10616 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20842)

(assert (=> b!243280 (= lt!379146 (checkBitsLoopPure!0 (_1!11342 lt!379152) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!379151 () (_ BitVec 64))

(assert (=> b!243280 (validate_offset_bits!1 ((_ sign_extend 32) (size!5847 (buf!6316 (_2!11341 lt!379142)))) ((_ sign_extend 32) (currentByte!11688 (_2!11341 lt!379143))) ((_ sign_extend 32) (currentBit!11683 (_2!11341 lt!379143))) lt!379151)))

(declare-fun lt!379148 () Unit!17783)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10616 array!13338 (_ BitVec 64)) Unit!17783)

(assert (=> b!243280 (= lt!379148 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11341 lt!379143) (buf!6316 (_2!11341 lt!379142)) lt!379151))))

(assert (=> b!243280 (= lt!379152 (reader!0 (_2!11341 lt!379143) (_2!11341 lt!379142)))))

(declare-fun b!243281 () Bool)

(declare-fun e!168636 () Bool)

(declare-fun array_inv!5588 (array!13338) Bool)

(assert (=> b!243281 (= e!168636 (array_inv!5588 (buf!6316 thiss!1005)))))

(declare-fun b!243282 () Bool)

(assert (=> b!243282 (= e!168632 (= (_2!11343 lt!379137) (_2!11343 lt!379140)))))

(declare-fun b!243283 () Bool)

(declare-fun res!203237 () Bool)

(assert (=> b!243283 (=> (not res!203237) (not e!168640))))

(assert (=> b!243283 (= res!203237 (invariant!0 (currentBit!11683 thiss!1005) (currentByte!11688 thiss!1005) (size!5847 (buf!6316 (_2!11341 lt!379143)))))))

(declare-fun b!243276 () Bool)

(declare-fun res!203236 () Bool)

(assert (=> b!243276 (=> (not res!203236) (not e!168637))))

(assert (=> b!243276 (= res!203236 (validate_offset_bits!1 ((_ sign_extend 32) (size!5847 (buf!6316 thiss!1005))) ((_ sign_extend 32) (currentByte!11688 thiss!1005)) ((_ sign_extend 32) (currentBit!11683 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!203231 () Bool)

(assert (=> start!52626 (=> (not res!203231) (not e!168637))))

(assert (=> start!52626 (= res!203231 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52626 e!168637))

(assert (=> start!52626 true))

(declare-fun inv!12 (BitStream!10616) Bool)

(assert (=> start!52626 (and (inv!12 thiss!1005) e!168636)))

(declare-fun b!243284 () Bool)

(declare-fun res!203239 () Bool)

(assert (=> b!243284 (=> (not res!203239) (not e!168634))))

(assert (=> b!243284 (= res!203239 (isPrefixOf!0 (_2!11341 lt!379143) (_2!11341 lt!379142)))))

(declare-fun b!243285 () Bool)

(declare-fun e!168641 () Bool)

(assert (=> b!243285 (= e!168635 e!168641)))

(declare-fun res!203240 () Bool)

(assert (=> b!243285 (=> (not res!203240) (not e!168641))))

(declare-fun lt!379138 () tuple2!20842)

(assert (=> b!243285 (= res!203240 (and (= (_2!11343 lt!379138) bit!26) (= (_1!11343 lt!379138) (_2!11341 lt!379143))))))

(declare-fun readerFrom!0 (BitStream!10616 (_ BitVec 32) (_ BitVec 32)) BitStream!10616)

(assert (=> b!243285 (= lt!379138 (readBitPure!0 (readerFrom!0 (_2!11341 lt!379143) (currentBit!11683 thiss!1005) (currentByte!11688 thiss!1005))))))

(declare-fun b!243286 () Bool)

(assert (=> b!243286 (= e!168633 e!168634)))

(declare-fun res!203238 () Bool)

(assert (=> b!243286 (=> (not res!203238) (not e!168634))))

(assert (=> b!243286 (= res!203238 (= (bitIndex!0 (size!5847 (buf!6316 (_2!11341 lt!379142))) (currentByte!11688 (_2!11341 lt!379142)) (currentBit!11683 (_2!11341 lt!379142))) (bvadd (bitIndex!0 (size!5847 (buf!6316 (_2!11341 lt!379143))) (currentByte!11688 (_2!11341 lt!379143)) (currentBit!11683 (_2!11341 lt!379143))) lt!379151)))))

(assert (=> b!243286 (= lt!379151 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243287 () Bool)

(assert (=> b!243287 (= e!168641 (= (bitIndex!0 (size!5847 (buf!6316 (_1!11343 lt!379138))) (currentByte!11688 (_1!11343 lt!379138)) (currentBit!11683 (_1!11343 lt!379138))) lt!379136))))

(assert (= (and start!52626 res!203231) b!243276))

(assert (= (and b!243276 res!203236) b!243279))

(assert (= (and b!243279 res!203232) b!243275))

(assert (= (and b!243275 res!203235) b!243277))

(assert (= (and b!243277 res!203229) b!243274))

(assert (= (and b!243274 res!203233) b!243285))

(assert (= (and b!243285 res!203240) b!243287))

(assert (= (and b!243275 res!203230) b!243286))

(assert (= (and b!243286 res!203238) b!243284))

(assert (= (and b!243284 res!203239) b!243280))

(assert (= (and b!243275 res!203234) b!243283))

(assert (= (and b!243283 res!203237) b!243278))

(assert (= (and b!243275 res!203241) b!243282))

(assert (= start!52626 b!243281))

(declare-fun m!366533 () Bool)

(assert (=> b!243284 m!366533))

(declare-fun m!366535 () Bool)

(assert (=> b!243281 m!366535))

(declare-fun m!366537 () Bool)

(assert (=> b!243285 m!366537))

(assert (=> b!243285 m!366537))

(declare-fun m!366539 () Bool)

(assert (=> b!243285 m!366539))

(declare-fun m!366541 () Bool)

(assert (=> b!243280 m!366541))

(declare-fun m!366543 () Bool)

(assert (=> b!243280 m!366543))

(declare-fun m!366545 () Bool)

(assert (=> b!243280 m!366545))

(declare-fun m!366547 () Bool)

(assert (=> b!243280 m!366547))

(declare-fun m!366549 () Bool)

(assert (=> b!243277 m!366549))

(declare-fun m!366551 () Bool)

(assert (=> b!243277 m!366551))

(declare-fun m!366553 () Bool)

(assert (=> b!243274 m!366553))

(declare-fun m!366555 () Bool)

(assert (=> b!243275 m!366555))

(assert (=> b!243275 m!366547))

(declare-fun m!366557 () Bool)

(assert (=> b!243275 m!366557))

(declare-fun m!366559 () Bool)

(assert (=> b!243275 m!366559))

(declare-fun m!366561 () Bool)

(assert (=> b!243275 m!366561))

(declare-fun m!366563 () Bool)

(assert (=> b!243275 m!366563))

(declare-fun m!366565 () Bool)

(assert (=> b!243275 m!366565))

(declare-fun m!366567 () Bool)

(assert (=> b!243275 m!366567))

(declare-fun m!366569 () Bool)

(assert (=> b!243275 m!366569))

(declare-fun m!366571 () Bool)

(assert (=> b!243275 m!366571))

(declare-fun m!366573 () Bool)

(assert (=> b!243275 m!366573))

(declare-fun m!366575 () Bool)

(assert (=> b!243275 m!366575))

(declare-fun m!366577 () Bool)

(assert (=> b!243275 m!366577))

(declare-fun m!366579 () Bool)

(assert (=> b!243275 m!366579))

(declare-fun m!366581 () Bool)

(assert (=> b!243276 m!366581))

(declare-fun m!366583 () Bool)

(assert (=> b!243287 m!366583))

(declare-fun m!366585 () Bool)

(assert (=> b!243286 m!366585))

(assert (=> b!243286 m!366549))

(declare-fun m!366587 () Bool)

(assert (=> b!243278 m!366587))

(declare-fun m!366589 () Bool)

(assert (=> b!243283 m!366589))

(declare-fun m!366591 () Bool)

(assert (=> start!52626 m!366591))

(push 1)

(assert (not b!243277))

(assert (not b!243274))

(assert (not start!52626))

(assert (not b!243286))

(assert (not b!243284))

(assert (not b!243280))

(assert (not b!243283))

(assert (not b!243278))

(assert (not b!243287))

(assert (not b!243276))

(assert (not b!243285))

(assert (not b!243275))

(assert (not b!243281))

(check-sat)

(pop 1)

