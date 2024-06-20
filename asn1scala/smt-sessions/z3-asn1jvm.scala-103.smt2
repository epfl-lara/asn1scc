; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2578 () Bool)

(assert start!2578)

(declare-fun b!12294 () Bool)

(declare-fun res!11804 () Bool)

(declare-fun e!7473 () Bool)

(assert (=> b!12294 (=> (not res!11804) (not e!7473))))

(declare-datatypes ((array!674 0))(
  ( (array!675 (arr!719 (Array (_ BitVec 32) (_ BitVec 8))) (size!293 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!546 0))(
  ( (BitStream!547 (buf!641 array!674) (currentByte!1719 (_ BitVec 32)) (currentBit!1714 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!546)

(declare-datatypes ((Unit!1045 0))(
  ( (Unit!1046) )
))
(declare-datatypes ((tuple2!1432 0))(
  ( (tuple2!1433 (_1!768 Unit!1045) (_2!768 BitStream!546)) )
))
(declare-fun lt!19717 () tuple2!1432)

(assert (=> b!12294 (= res!11804 (= (size!293 (buf!641 thiss!1486)) (size!293 (buf!641 (_2!768 lt!19717)))))))

(declare-fun b!12295 () Bool)

(declare-fun res!11806 () Bool)

(assert (=> b!12295 (=> (not res!11806) (not e!7473))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12295 (= res!11806 (= (bitIndex!0 (size!293 (buf!641 (_2!768 lt!19717))) (currentByte!1719 (_2!768 lt!19717)) (currentBit!1714 (_2!768 lt!19717))) (bvadd (bitIndex!0 (size!293 (buf!641 thiss!1486)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486)) nBits!460)))))

(declare-fun b!12296 () Bool)

(declare-fun e!7474 () Bool)

(assert (=> b!12296 (= e!7474 e!7473)))

(declare-fun res!11801 () Bool)

(assert (=> b!12296 (=> (not res!11801) (not e!7473))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12296 (= res!11801 (invariant!0 (currentBit!1714 (_2!768 lt!19717)) (currentByte!1719 (_2!768 lt!19717)) (size!293 (buf!641 (_2!768 lt!19717)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!674)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!546 array!674 (_ BitVec 64) (_ BitVec 64)) tuple2!1432)

(assert (=> b!12296 (= lt!19717 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12297 () Bool)

(declare-fun e!7472 () Bool)

(declare-datatypes ((tuple2!1434 0))(
  ( (tuple2!1435 (_1!769 BitStream!546) (_2!769 BitStream!546)) )
))
(declare-fun lt!19718 () tuple2!1434)

(declare-datatypes ((tuple2!1436 0))(
  ( (tuple2!1437 (_1!770 array!674) (_2!770 BitStream!546)) )
))
(declare-fun lt!19714 () tuple2!1436)

(declare-fun inv!12 (BitStream!546) Bool)

(assert (=> b!12297 (= e!7472 (inv!12 (BitStream!547 (buf!641 (_1!769 lt!19718)) (currentByte!1719 (_2!770 lt!19714)) (currentBit!1714 (_2!770 lt!19714)))))))

(declare-fun b!12298 () Bool)

(declare-fun res!11808 () Bool)

(assert (=> b!12298 (=> (not res!11808) (not e!7473))))

(declare-fun isPrefixOf!0 (BitStream!546 BitStream!546) Bool)

(assert (=> b!12298 (= res!11808 (isPrefixOf!0 thiss!1486 (_2!768 lt!19717)))))

(declare-fun b!12299 () Bool)

(declare-fun e!7477 () Bool)

(assert (=> b!12299 (= e!7473 (not e!7477))))

(declare-fun res!11802 () Bool)

(assert (=> b!12299 (=> res!11802 e!7477)))

(declare-datatypes ((List!169 0))(
  ( (Nil!166) (Cons!165 (h!284 Bool) (t!919 List!169)) )
))
(declare-fun lt!19716 () List!169)

(declare-fun byteArrayBitContentToList!0 (BitStream!546 array!674 (_ BitVec 64) (_ BitVec 64)) List!169)

(assert (=> b!12299 (= res!11802 (not (= (byteArrayBitContentToList!0 (_2!768 lt!19717) (_1!770 lt!19714) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!19716)))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!546 BitStream!546 (_ BitVec 64)) List!169)

(assert (=> b!12299 (= lt!19716 (bitStreamReadBitsIntoList!0 (_2!768 lt!19717) (_1!769 lt!19718) nBits!460))))

(declare-fun readBits!0 (BitStream!546 (_ BitVec 64)) tuple2!1436)

(assert (=> b!12299 (= lt!19714 (readBits!0 (_1!769 lt!19718) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12299 (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!19717)))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486)) nBits!460)))

(declare-fun lt!19715 () Unit!1045)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!546 array!674 (_ BitVec 64)) Unit!1045)

(assert (=> b!12299 (= lt!19715 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!641 (_2!768 lt!19717)) nBits!460))))

(declare-fun reader!0 (BitStream!546 BitStream!546) tuple2!1434)

(assert (=> b!12299 (= lt!19718 (reader!0 thiss!1486 (_2!768 lt!19717)))))

(declare-fun b!12300 () Bool)

(declare-fun e!7475 () Bool)

(declare-fun array_inv!282 (array!674) Bool)

(assert (=> b!12300 (= e!7475 (array_inv!282 (buf!641 thiss!1486)))))

(declare-fun b!12301 () Bool)

(assert (=> b!12301 (= e!7477 e!7472)))

(declare-fun res!11805 () Bool)

(assert (=> b!12301 (=> res!11805 e!7472)))

(declare-fun checkByteArrayBitContent!0 (BitStream!546 array!674 array!674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12301 (= res!11805 (not (checkByteArrayBitContent!0 (_2!768 lt!19717) srcBuffer!6 (_1!770 lt!19714) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!19713 () Unit!1045)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!546 array!674 array!674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1045)

(assert (=> b!12301 (= lt!19713 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!768 lt!19717) srcBuffer!6 (_1!770 lt!19714) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun res!11807 () Bool)

(assert (=> start!2578 (=> (not res!11807) (not e!7474))))

(assert (=> start!2578 (= res!11807 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!293 srcBuffer!6))))))))

(assert (=> start!2578 e!7474))

(assert (=> start!2578 true))

(assert (=> start!2578 (array_inv!282 srcBuffer!6)))

(assert (=> start!2578 (and (inv!12 thiss!1486) e!7475)))

(declare-fun b!12302 () Bool)

(declare-fun res!11803 () Bool)

(assert (=> b!12302 (=> (not res!11803) (not e!7474))))

(assert (=> b!12302 (= res!11803 (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 thiss!1486))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486)) nBits!460))))

(declare-fun b!12303 () Bool)

(declare-fun res!11809 () Bool)

(assert (=> b!12303 (=> res!11809 e!7477)))

(assert (=> b!12303 (= res!11809 (not (= lt!19716 (byteArrayBitContentToList!0 (_2!768 lt!19717) srcBuffer!6 from!367 nBits!460))))))

(assert (= (and start!2578 res!11807) b!12302))

(assert (= (and b!12302 res!11803) b!12296))

(assert (= (and b!12296 res!11801) b!12294))

(assert (= (and b!12294 res!11804) b!12295))

(assert (= (and b!12295 res!11806) b!12298))

(assert (= (and b!12298 res!11808) b!12299))

(assert (= (and b!12299 (not res!11802)) b!12303))

(assert (= (and b!12303 (not res!11809)) b!12301))

(assert (= (and b!12301 (not res!11805)) b!12297))

(assert (= start!2578 b!12300))

(declare-fun m!18583 () Bool)

(assert (=> b!12296 m!18583))

(declare-fun m!18585 () Bool)

(assert (=> b!12296 m!18585))

(declare-fun m!18587 () Bool)

(assert (=> b!12301 m!18587))

(declare-fun m!18589 () Bool)

(assert (=> b!12301 m!18589))

(declare-fun m!18591 () Bool)

(assert (=> b!12295 m!18591))

(declare-fun m!18593 () Bool)

(assert (=> b!12295 m!18593))

(declare-fun m!18595 () Bool)

(assert (=> b!12299 m!18595))

(declare-fun m!18597 () Bool)

(assert (=> b!12299 m!18597))

(declare-fun m!18599 () Bool)

(assert (=> b!12299 m!18599))

(declare-fun m!18601 () Bool)

(assert (=> b!12299 m!18601))

(declare-fun m!18603 () Bool)

(assert (=> b!12299 m!18603))

(declare-fun m!18605 () Bool)

(assert (=> b!12299 m!18605))

(declare-fun m!18607 () Bool)

(assert (=> b!12298 m!18607))

(declare-fun m!18609 () Bool)

(assert (=> b!12303 m!18609))

(declare-fun m!18611 () Bool)

(assert (=> b!12297 m!18611))

(declare-fun m!18613 () Bool)

(assert (=> b!12302 m!18613))

(declare-fun m!18615 () Bool)

(assert (=> start!2578 m!18615))

(declare-fun m!18617 () Bool)

(assert (=> start!2578 m!18617))

(declare-fun m!18619 () Bool)

(assert (=> b!12300 m!18619))

(check-sat (not b!12301) (not b!12298) (not b!12295) (not start!2578) (not b!12303) (not b!12296) (not b!12297) (not b!12302) (not b!12300) (not b!12299))
(check-sat)
(get-model)

(declare-fun d!4060 () Bool)

(assert (=> d!4060 (= (invariant!0 (currentBit!1714 (_2!768 lt!19717)) (currentByte!1719 (_2!768 lt!19717)) (size!293 (buf!641 (_2!768 lt!19717)))) (and (bvsge (currentBit!1714 (_2!768 lt!19717)) #b00000000000000000000000000000000) (bvslt (currentBit!1714 (_2!768 lt!19717)) #b00000000000000000000000000001000) (bvsge (currentByte!1719 (_2!768 lt!19717)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1719 (_2!768 lt!19717)) (size!293 (buf!641 (_2!768 lt!19717)))) (and (= (currentBit!1714 (_2!768 lt!19717)) #b00000000000000000000000000000000) (= (currentByte!1719 (_2!768 lt!19717)) (size!293 (buf!641 (_2!768 lt!19717))))))))))

(assert (=> b!12296 d!4060))

(declare-fun d!4068 () Bool)

(declare-fun e!7558 () Bool)

(assert (=> d!4068 e!7558))

(declare-fun res!11923 () Bool)

(assert (=> d!4068 (=> (not res!11923) (not e!7558))))

(declare-fun lt!20144 () (_ BitVec 64))

(declare-fun lt!20112 () tuple2!1432)

(assert (=> d!4068 (= res!11923 (= (bitIndex!0 (size!293 (buf!641 (_2!768 lt!20112))) (currentByte!1719 (_2!768 lt!20112)) (currentBit!1714 (_2!768 lt!20112))) (bvsub lt!20144 from!367)))))

(assert (=> d!4068 (or (= (bvand lt!20144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20144 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!20126 () (_ BitVec 64))

(assert (=> d!4068 (= lt!20144 (bvadd lt!20126 from!367 nBits!460))))

(assert (=> d!4068 (or (not (= (bvand lt!20126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!20126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!20126 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4068 (= lt!20126 (bitIndex!0 (size!293 (buf!641 thiss!1486)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486)))))

(declare-fun e!7559 () tuple2!1432)

(assert (=> d!4068 (= lt!20112 e!7559)))

(declare-fun c!936 () Bool)

(assert (=> d!4068 (= c!936 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!20151 () Unit!1045)

(declare-fun lt!20137 () Unit!1045)

(assert (=> d!4068 (= lt!20151 lt!20137)))

(assert (=> d!4068 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!546) Unit!1045)

(assert (=> d!4068 (= lt!20137 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!20116 () (_ BitVec 64))

(assert (=> d!4068 (= lt!20116 (bitIndex!0 (size!293 (buf!641 thiss!1486)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486)))))

(assert (=> d!4068 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4068 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!20112)))

(declare-fun b!12458 () Bool)

(declare-fun lt!20153 () tuple2!1432)

(declare-fun Unit!1056 () Unit!1045)

(assert (=> b!12458 (= e!7559 (tuple2!1433 Unit!1056 (_2!768 lt!20153)))))

(declare-fun lt!20146 () tuple2!1432)

(declare-fun appendBitFromByte!0 (BitStream!546 (_ BitVec 8) (_ BitVec 32)) tuple2!1432)

(assert (=> b!12458 (= lt!20146 (appendBitFromByte!0 thiss!1486 (select (arr!719 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!20136 () (_ BitVec 64))

(assert (=> b!12458 (= lt!20136 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!20133 () (_ BitVec 64))

(assert (=> b!12458 (= lt!20133 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!20119 () Unit!1045)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!546 BitStream!546 (_ BitVec 64) (_ BitVec 64)) Unit!1045)

(assert (=> b!12458 (= lt!20119 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!768 lt!20146) lt!20136 lt!20133))))

(assert (=> b!12458 (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!20146)))) ((_ sign_extend 32) (currentByte!1719 (_2!768 lt!20146))) ((_ sign_extend 32) (currentBit!1714 (_2!768 lt!20146))) (bvsub lt!20136 lt!20133))))

(declare-fun lt!20127 () Unit!1045)

(assert (=> b!12458 (= lt!20127 lt!20119)))

(declare-fun lt!20141 () tuple2!1434)

(declare-fun call!254 () tuple2!1434)

(assert (=> b!12458 (= lt!20141 call!254)))

(declare-fun lt!20148 () (_ BitVec 64))

(assert (=> b!12458 (= lt!20148 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!20134 () Unit!1045)

(assert (=> b!12458 (= lt!20134 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!641 (_2!768 lt!20146)) lt!20148))))

(assert (=> b!12458 (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!20146)))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486)) lt!20148)))

(declare-fun lt!20120 () Unit!1045)

(assert (=> b!12458 (= lt!20120 lt!20134)))

(declare-fun head!66 (List!169) Bool)

(assert (=> b!12458 (= (head!66 (byteArrayBitContentToList!0 (_2!768 lt!20146) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!66 (bitStreamReadBitsIntoList!0 (_2!768 lt!20146) (_1!769 lt!20141) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!20131 () Unit!1045)

(declare-fun Unit!1058 () Unit!1045)

(assert (=> b!12458 (= lt!20131 Unit!1058)))

(assert (=> b!12458 (= lt!20153 (appendBitsMSBFirstLoop!0 (_2!768 lt!20146) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!20129 () Unit!1045)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!546 BitStream!546 BitStream!546) Unit!1045)

(assert (=> b!12458 (= lt!20129 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!768 lt!20146) (_2!768 lt!20153)))))

(assert (=> b!12458 (isPrefixOf!0 thiss!1486 (_2!768 lt!20153))))

(declare-fun lt!20113 () Unit!1045)

(assert (=> b!12458 (= lt!20113 lt!20129)))

(assert (=> b!12458 (= (size!293 (buf!641 (_2!768 lt!20153))) (size!293 (buf!641 thiss!1486)))))

(declare-fun lt!20111 () Unit!1045)

(declare-fun Unit!1059 () Unit!1045)

(assert (=> b!12458 (= lt!20111 Unit!1059)))

(assert (=> b!12458 (= (bitIndex!0 (size!293 (buf!641 (_2!768 lt!20153))) (currentByte!1719 (_2!768 lt!20153)) (currentBit!1714 (_2!768 lt!20153))) (bvsub (bvadd (bitIndex!0 (size!293 (buf!641 thiss!1486)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!20145 () Unit!1045)

(declare-fun Unit!1060 () Unit!1045)

(assert (=> b!12458 (= lt!20145 Unit!1060)))

(assert (=> b!12458 (= (bitIndex!0 (size!293 (buf!641 (_2!768 lt!20153))) (currentByte!1719 (_2!768 lt!20153)) (currentBit!1714 (_2!768 lt!20153))) (bvsub (bvsub (bvadd (bitIndex!0 (size!293 (buf!641 (_2!768 lt!20146))) (currentByte!1719 (_2!768 lt!20146)) (currentBit!1714 (_2!768 lt!20146))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!20118 () Unit!1045)

(declare-fun Unit!1061 () Unit!1045)

(assert (=> b!12458 (= lt!20118 Unit!1061)))

(declare-fun lt!20115 () tuple2!1434)

(assert (=> b!12458 (= lt!20115 (reader!0 thiss!1486 (_2!768 lt!20153)))))

(declare-fun lt!20140 () (_ BitVec 64))

(assert (=> b!12458 (= lt!20140 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!20138 () Unit!1045)

(assert (=> b!12458 (= lt!20138 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!641 (_2!768 lt!20153)) lt!20140))))

(assert (=> b!12458 (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!20153)))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486)) lt!20140)))

(declare-fun lt!20130 () Unit!1045)

(assert (=> b!12458 (= lt!20130 lt!20138)))

(declare-fun lt!20139 () tuple2!1434)

(assert (=> b!12458 (= lt!20139 (reader!0 (_2!768 lt!20146) (_2!768 lt!20153)))))

(declare-fun lt!20121 () (_ BitVec 64))

(assert (=> b!12458 (= lt!20121 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!20152 () Unit!1045)

(assert (=> b!12458 (= lt!20152 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!768 lt!20146) (buf!641 (_2!768 lt!20153)) lt!20121))))

(assert (=> b!12458 (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!20153)))) ((_ sign_extend 32) (currentByte!1719 (_2!768 lt!20146))) ((_ sign_extend 32) (currentBit!1714 (_2!768 lt!20146))) lt!20121)))

(declare-fun lt!20142 () Unit!1045)

(assert (=> b!12458 (= lt!20142 lt!20152)))

(declare-fun lt!20135 () List!169)

(assert (=> b!12458 (= lt!20135 (byteArrayBitContentToList!0 (_2!768 lt!20153) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!20150 () List!169)

(assert (=> b!12458 (= lt!20150 (byteArrayBitContentToList!0 (_2!768 lt!20153) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!20143 () List!169)

(assert (=> b!12458 (= lt!20143 (bitStreamReadBitsIntoList!0 (_2!768 lt!20153) (_1!769 lt!20115) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!20147 () List!169)

(assert (=> b!12458 (= lt!20147 (bitStreamReadBitsIntoList!0 (_2!768 lt!20153) (_1!769 lt!20139) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!20114 () (_ BitVec 64))

(assert (=> b!12458 (= lt!20114 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!20124 () Unit!1045)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!546 BitStream!546 BitStream!546 BitStream!546 (_ BitVec 64) List!169) Unit!1045)

(assert (=> b!12458 (= lt!20124 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!768 lt!20153) (_2!768 lt!20153) (_1!769 lt!20115) (_1!769 lt!20139) lt!20114 lt!20143))))

(declare-fun tail!74 (List!169) List!169)

(assert (=> b!12458 (= (bitStreamReadBitsIntoList!0 (_2!768 lt!20153) (_1!769 lt!20139) (bvsub lt!20114 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!74 lt!20143))))

(declare-fun lt!20117 () Unit!1045)

(assert (=> b!12458 (= lt!20117 lt!20124)))

(declare-fun lt!20123 () Unit!1045)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!674 array!674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1045)

(assert (=> b!12458 (= lt!20123 (arrayBitRangesEqImpliesEq!0 (buf!641 (_2!768 lt!20146)) (buf!641 (_2!768 lt!20153)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!20116 (bitIndex!0 (size!293 (buf!641 (_2!768 lt!20146))) (currentByte!1719 (_2!768 lt!20146)) (currentBit!1714 (_2!768 lt!20146)))))))

(declare-fun bitAt!0 (array!674 (_ BitVec 64)) Bool)

(assert (=> b!12458 (= (bitAt!0 (buf!641 (_2!768 lt!20146)) lt!20116) (bitAt!0 (buf!641 (_2!768 lt!20153)) lt!20116))))

(declare-fun lt!20110 () Unit!1045)

(assert (=> b!12458 (= lt!20110 lt!20123)))

(declare-fun b!12459 () Bool)

(declare-fun Unit!1062 () Unit!1045)

(assert (=> b!12459 (= e!7559 (tuple2!1433 Unit!1062 thiss!1486))))

(assert (=> b!12459 (= (size!293 (buf!641 thiss!1486)) (size!293 (buf!641 thiss!1486)))))

(declare-fun lt!20149 () Unit!1045)

(declare-fun Unit!1063 () Unit!1045)

(assert (=> b!12459 (= lt!20149 Unit!1063)))

(assert (=> b!12459 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!770 (readBits!0 (_1!769 call!254) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!12460 () Bool)

(declare-fun res!11922 () Bool)

(assert (=> b!12460 (=> (not res!11922) (not e!7558))))

(assert (=> b!12460 (= res!11922 (isPrefixOf!0 thiss!1486 (_2!768 lt!20112)))))

(declare-fun bm!251 () Bool)

(assert (=> bm!251 (= call!254 (reader!0 thiss!1486 (ite c!936 (_2!768 lt!20146) thiss!1486)))))

(declare-fun b!12461 () Bool)

(declare-fun res!11924 () Bool)

(assert (=> b!12461 (=> (not res!11924) (not e!7558))))

(assert (=> b!12461 (= res!11924 (invariant!0 (currentBit!1714 (_2!768 lt!20112)) (currentByte!1719 (_2!768 lt!20112)) (size!293 (buf!641 (_2!768 lt!20112)))))))

(declare-fun b!12462 () Bool)

(declare-fun res!11920 () Bool)

(assert (=> b!12462 (=> (not res!11920) (not e!7558))))

(assert (=> b!12462 (= res!11920 (= (size!293 (buf!641 thiss!1486)) (size!293 (buf!641 (_2!768 lt!20112)))))))

(declare-fun b!12463 () Bool)

(declare-fun e!7557 () Bool)

(declare-fun lt!20122 () (_ BitVec 64))

(assert (=> b!12463 (= e!7557 (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 thiss!1486))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486)) lt!20122))))

(declare-fun lt!20125 () tuple2!1434)

(declare-fun b!12464 () Bool)

(assert (=> b!12464 (= e!7558 (= (bitStreamReadBitsIntoList!0 (_2!768 lt!20112) (_1!769 lt!20125) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!768 lt!20112) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!12464 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12464 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!20128 () Unit!1045)

(declare-fun lt!20132 () Unit!1045)

(assert (=> b!12464 (= lt!20128 lt!20132)))

(assert (=> b!12464 (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!20112)))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486)) lt!20122)))

(assert (=> b!12464 (= lt!20132 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!641 (_2!768 lt!20112)) lt!20122))))

(assert (=> b!12464 e!7557))

(declare-fun res!11921 () Bool)

(assert (=> b!12464 (=> (not res!11921) (not e!7557))))

(assert (=> b!12464 (= res!11921 (and (= (size!293 (buf!641 thiss!1486)) (size!293 (buf!641 (_2!768 lt!20112)))) (bvsge lt!20122 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12464 (= lt!20122 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!12464 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12464 (= lt!20125 (reader!0 thiss!1486 (_2!768 lt!20112)))))

(declare-fun b!12465 () Bool)

(declare-fun res!11919 () Bool)

(assert (=> b!12465 (=> (not res!11919) (not e!7558))))

(assert (=> b!12465 (= res!11919 (= (size!293 (buf!641 (_2!768 lt!20112))) (size!293 (buf!641 thiss!1486))))))

(assert (= (and d!4068 c!936) b!12458))

(assert (= (and d!4068 (not c!936)) b!12459))

(assert (= (or b!12458 b!12459) bm!251))

(assert (= (and d!4068 res!11923) b!12461))

(assert (= (and b!12461 res!11924) b!12462))

(assert (= (and b!12462 res!11920) b!12460))

(assert (= (and b!12460 res!11922) b!12465))

(assert (= (and b!12465 res!11919) b!12464))

(assert (= (and b!12464 res!11921) b!12463))

(declare-fun m!18845 () Bool)

(assert (=> b!12464 m!18845))

(declare-fun m!18847 () Bool)

(assert (=> b!12464 m!18847))

(declare-fun m!18849 () Bool)

(assert (=> b!12464 m!18849))

(declare-fun m!18851 () Bool)

(assert (=> b!12464 m!18851))

(declare-fun m!18853 () Bool)

(assert (=> b!12464 m!18853))

(declare-fun m!18855 () Bool)

(assert (=> bm!251 m!18855))

(declare-fun m!18857 () Bool)

(assert (=> b!12461 m!18857))

(declare-fun m!18859 () Bool)

(assert (=> b!12460 m!18859))

(declare-fun m!18861 () Bool)

(assert (=> b!12459 m!18861))

(declare-fun m!18863 () Bool)

(assert (=> b!12459 m!18863))

(declare-fun m!18865 () Bool)

(assert (=> b!12463 m!18865))

(declare-fun m!18867 () Bool)

(assert (=> b!12458 m!18867))

(declare-fun m!18869 () Bool)

(assert (=> b!12458 m!18869))

(declare-fun m!18871 () Bool)

(assert (=> b!12458 m!18871))

(declare-fun m!18873 () Bool)

(assert (=> b!12458 m!18873))

(declare-fun m!18875 () Bool)

(assert (=> b!12458 m!18875))

(declare-fun m!18877 () Bool)

(assert (=> b!12458 m!18877))

(declare-fun m!18879 () Bool)

(assert (=> b!12458 m!18879))

(declare-fun m!18881 () Bool)

(assert (=> b!12458 m!18881))

(declare-fun m!18883 () Bool)

(assert (=> b!12458 m!18883))

(declare-fun m!18885 () Bool)

(assert (=> b!12458 m!18885))

(declare-fun m!18887 () Bool)

(assert (=> b!12458 m!18887))

(declare-fun m!18889 () Bool)

(assert (=> b!12458 m!18889))

(declare-fun m!18891 () Bool)

(assert (=> b!12458 m!18891))

(declare-fun m!18893 () Bool)

(assert (=> b!12458 m!18893))

(declare-fun m!18895 () Bool)

(assert (=> b!12458 m!18895))

(declare-fun m!18897 () Bool)

(assert (=> b!12458 m!18897))

(assert (=> b!12458 m!18879))

(declare-fun m!18899 () Bool)

(assert (=> b!12458 m!18899))

(declare-fun m!18901 () Bool)

(assert (=> b!12458 m!18901))

(declare-fun m!18903 () Bool)

(assert (=> b!12458 m!18903))

(declare-fun m!18905 () Bool)

(assert (=> b!12458 m!18905))

(declare-fun m!18907 () Bool)

(assert (=> b!12458 m!18907))

(declare-fun m!18909 () Bool)

(assert (=> b!12458 m!18909))

(declare-fun m!18911 () Bool)

(assert (=> b!12458 m!18911))

(declare-fun m!18913 () Bool)

(assert (=> b!12458 m!18913))

(assert (=> b!12458 m!18899))

(declare-fun m!18915 () Bool)

(assert (=> b!12458 m!18915))

(declare-fun m!18917 () Bool)

(assert (=> b!12458 m!18917))

(declare-fun m!18919 () Bool)

(assert (=> b!12458 m!18919))

(assert (=> b!12458 m!18593))

(declare-fun m!18921 () Bool)

(assert (=> b!12458 m!18921))

(assert (=> b!12458 m!18909))

(declare-fun m!18923 () Bool)

(assert (=> b!12458 m!18923))

(declare-fun m!18925 () Bool)

(assert (=> b!12458 m!18925))

(declare-fun m!18927 () Bool)

(assert (=> b!12458 m!18927))

(assert (=> b!12458 m!18895))

(declare-fun m!18929 () Bool)

(assert (=> d!4068 m!18929))

(assert (=> d!4068 m!18593))

(declare-fun m!18931 () Bool)

(assert (=> d!4068 m!18931))

(declare-fun m!18933 () Bool)

(assert (=> d!4068 m!18933))

(assert (=> b!12296 d!4068))

(declare-fun d!4104 () Bool)

(declare-fun res!11938 () Bool)

(declare-fun e!7570 () Bool)

(assert (=> d!4104 (=> res!11938 e!7570)))

(assert (=> d!4104 (= res!11938 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4104 (= (checkByteArrayBitContent!0 (_2!768 lt!19717) srcBuffer!6 (_1!770 lt!19714) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7570)))

(declare-fun b!12479 () Bool)

(declare-fun e!7571 () Bool)

(assert (=> b!12479 (= e!7570 e!7571)))

(declare-fun res!11939 () Bool)

(assert (=> b!12479 (=> (not res!11939) (not e!7571))))

(assert (=> b!12479 (= res!11939 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!719 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!719 (_1!770 lt!19714)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!12480 () Bool)

(assert (=> b!12480 (= e!7571 (checkByteArrayBitContent!0 (_2!768 lt!19717) srcBuffer!6 (_1!770 lt!19714) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!4104 (not res!11938)) b!12479))

(assert (= (and b!12479 res!11939) b!12480))

(assert (=> b!12479 m!18899))

(declare-fun m!18939 () Bool)

(assert (=> b!12479 m!18939))

(declare-fun m!18941 () Bool)

(assert (=> b!12479 m!18941))

(declare-fun m!18943 () Bool)

(assert (=> b!12479 m!18943))

(declare-fun m!18945 () Bool)

(assert (=> b!12480 m!18945))

(assert (=> b!12301 d!4104))

(declare-fun d!4110 () Bool)

(assert (=> d!4110 (checkByteArrayBitContent!0 (_2!768 lt!19717) srcBuffer!6 (_1!770 lt!19714) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!20159 () Unit!1045)

(declare-fun choose!65 (BitStream!546 array!674 array!674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1045)

(assert (=> d!4110 (= lt!20159 (choose!65 (_2!768 lt!19717) srcBuffer!6 (_1!770 lt!19714) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!4110 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4110 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!768 lt!19717) srcBuffer!6 (_1!770 lt!19714) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20159)))

(declare-fun bs!1127 () Bool)

(assert (= bs!1127 d!4110))

(assert (=> bs!1127 m!18587))

(declare-fun m!18947 () Bool)

(assert (=> bs!1127 m!18947))

(assert (=> b!12301 d!4110))

(declare-fun d!4112 () Bool)

(declare-fun c!939 () Bool)

(assert (=> d!4112 (= c!939 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7574 () List!169)

(assert (=> d!4112 (= (byteArrayBitContentToList!0 (_2!768 lt!19717) srcBuffer!6 from!367 nBits!460) e!7574)))

(declare-fun b!12485 () Bool)

(assert (=> b!12485 (= e!7574 Nil!166)))

(declare-fun b!12486 () Bool)

(assert (=> b!12486 (= e!7574 (Cons!165 (not (= (bvand ((_ sign_extend 24) (select (arr!719 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!768 lt!19717) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!4112 c!939) b!12485))

(assert (= (and d!4112 (not c!939)) b!12486))

(assert (=> b!12486 m!18899))

(assert (=> b!12486 m!18939))

(declare-fun m!18949 () Bool)

(assert (=> b!12486 m!18949))

(assert (=> b!12303 d!4112))

(declare-fun d!4114 () Bool)

(assert (=> d!4114 (= (array_inv!282 srcBuffer!6) (bvsge (size!293 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2578 d!4114))

(declare-fun d!4116 () Bool)

(assert (=> d!4116 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1714 thiss!1486) (currentByte!1719 thiss!1486) (size!293 (buf!641 thiss!1486))))))

(declare-fun bs!1128 () Bool)

(assert (= bs!1128 d!4116))

(declare-fun m!18951 () Bool)

(assert (=> bs!1128 m!18951))

(assert (=> start!2578 d!4116))

(declare-fun d!4118 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 thiss!1486))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!293 (buf!641 thiss!1486))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486))) nBits!460))))

(declare-fun bs!1129 () Bool)

(assert (= bs!1129 d!4118))

(declare-fun m!18953 () Bool)

(assert (=> bs!1129 m!18953))

(assert (=> b!12302 d!4118))

(declare-fun d!4120 () Bool)

(assert (=> d!4120 (= (inv!12 (BitStream!547 (buf!641 (_1!769 lt!19718)) (currentByte!1719 (_2!770 lt!19714)) (currentBit!1714 (_2!770 lt!19714)))) (invariant!0 (currentBit!1714 (BitStream!547 (buf!641 (_1!769 lt!19718)) (currentByte!1719 (_2!770 lt!19714)) (currentBit!1714 (_2!770 lt!19714)))) (currentByte!1719 (BitStream!547 (buf!641 (_1!769 lt!19718)) (currentByte!1719 (_2!770 lt!19714)) (currentBit!1714 (_2!770 lt!19714)))) (size!293 (buf!641 (BitStream!547 (buf!641 (_1!769 lt!19718)) (currentByte!1719 (_2!770 lt!19714)) (currentBit!1714 (_2!770 lt!19714)))))))))

(declare-fun bs!1130 () Bool)

(assert (= bs!1130 d!4120))

(declare-fun m!18955 () Bool)

(assert (=> bs!1130 m!18955))

(assert (=> b!12297 d!4120))

(declare-fun d!4122 () Bool)

(declare-fun e!7592 () Bool)

(assert (=> d!4122 e!7592))

(declare-fun res!11961 () Bool)

(assert (=> d!4122 (=> (not res!11961) (not e!7592))))

(declare-fun lt!20270 () tuple2!1434)

(assert (=> d!4122 (= res!11961 (isPrefixOf!0 (_1!769 lt!20270) (_2!769 lt!20270)))))

(declare-fun lt!20264 () BitStream!546)

(assert (=> d!4122 (= lt!20270 (tuple2!1435 lt!20264 (_2!768 lt!19717)))))

(declare-fun lt!20267 () Unit!1045)

(declare-fun lt!20280 () Unit!1045)

(assert (=> d!4122 (= lt!20267 lt!20280)))

(assert (=> d!4122 (isPrefixOf!0 lt!20264 (_2!768 lt!19717))))

(assert (=> d!4122 (= lt!20280 (lemmaIsPrefixTransitive!0 lt!20264 (_2!768 lt!19717) (_2!768 lt!19717)))))

(declare-fun lt!20278 () Unit!1045)

(declare-fun lt!20268 () Unit!1045)

(assert (=> d!4122 (= lt!20278 lt!20268)))

(assert (=> d!4122 (isPrefixOf!0 lt!20264 (_2!768 lt!19717))))

(assert (=> d!4122 (= lt!20268 (lemmaIsPrefixTransitive!0 lt!20264 thiss!1486 (_2!768 lt!19717)))))

(declare-fun lt!20277 () Unit!1045)

(declare-fun e!7591 () Unit!1045)

(assert (=> d!4122 (= lt!20277 e!7591)))

(declare-fun c!951 () Bool)

(assert (=> d!4122 (= c!951 (not (= (size!293 (buf!641 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!20271 () Unit!1045)

(declare-fun lt!20275 () Unit!1045)

(assert (=> d!4122 (= lt!20271 lt!20275)))

(assert (=> d!4122 (isPrefixOf!0 (_2!768 lt!19717) (_2!768 lt!19717))))

(assert (=> d!4122 (= lt!20275 (lemmaIsPrefixRefl!0 (_2!768 lt!19717)))))

(declare-fun lt!20263 () Unit!1045)

(declare-fun lt!20279 () Unit!1045)

(assert (=> d!4122 (= lt!20263 lt!20279)))

(assert (=> d!4122 (= lt!20279 (lemmaIsPrefixRefl!0 (_2!768 lt!19717)))))

(declare-fun lt!20266 () Unit!1045)

(declare-fun lt!20281 () Unit!1045)

(assert (=> d!4122 (= lt!20266 lt!20281)))

(assert (=> d!4122 (isPrefixOf!0 lt!20264 lt!20264)))

(assert (=> d!4122 (= lt!20281 (lemmaIsPrefixRefl!0 lt!20264))))

(declare-fun lt!20276 () Unit!1045)

(declare-fun lt!20262 () Unit!1045)

(assert (=> d!4122 (= lt!20276 lt!20262)))

(assert (=> d!4122 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!4122 (= lt!20262 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!4122 (= lt!20264 (BitStream!547 (buf!641 (_2!768 lt!19717)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486)))))

(assert (=> d!4122 (isPrefixOf!0 thiss!1486 (_2!768 lt!19717))))

(assert (=> d!4122 (= (reader!0 thiss!1486 (_2!768 lt!19717)) lt!20270)))

(declare-fun b!12530 () Bool)

(declare-fun res!11963 () Bool)

(assert (=> b!12530 (=> (not res!11963) (not e!7592))))

(assert (=> b!12530 (= res!11963 (isPrefixOf!0 (_2!769 lt!20270) (_2!768 lt!19717)))))

(declare-fun b!12531 () Bool)

(declare-fun lt!20269 () Unit!1045)

(assert (=> b!12531 (= e!7591 lt!20269)))

(declare-fun lt!20272 () (_ BitVec 64))

(assert (=> b!12531 (= lt!20272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!20274 () (_ BitVec 64))

(assert (=> b!12531 (= lt!20274 (bitIndex!0 (size!293 (buf!641 thiss!1486)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!674 array!674 (_ BitVec 64) (_ BitVec 64)) Unit!1045)

(assert (=> b!12531 (= lt!20269 (arrayBitRangesEqSymmetric!0 (buf!641 thiss!1486) (buf!641 (_2!768 lt!19717)) lt!20272 lt!20274))))

(declare-fun arrayBitRangesEq!0 (array!674 array!674 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12531 (arrayBitRangesEq!0 (buf!641 (_2!768 lt!19717)) (buf!641 thiss!1486) lt!20272 lt!20274)))

(declare-fun b!12532 () Bool)

(declare-fun res!11962 () Bool)

(assert (=> b!12532 (=> (not res!11962) (not e!7592))))

(assert (=> b!12532 (= res!11962 (isPrefixOf!0 (_1!769 lt!20270) thiss!1486))))

(declare-fun lt!20273 () (_ BitVec 64))

(declare-fun b!12533 () Bool)

(declare-fun lt!20265 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!546 (_ BitVec 64)) BitStream!546)

(assert (=> b!12533 (= e!7592 (= (_1!769 lt!20270) (withMovedBitIndex!0 (_2!769 lt!20270) (bvsub lt!20273 lt!20265))))))

(assert (=> b!12533 (or (= (bvand lt!20273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20273 lt!20265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12533 (= lt!20265 (bitIndex!0 (size!293 (buf!641 (_2!768 lt!19717))) (currentByte!1719 (_2!768 lt!19717)) (currentBit!1714 (_2!768 lt!19717))))))

(assert (=> b!12533 (= lt!20273 (bitIndex!0 (size!293 (buf!641 thiss!1486)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486)))))

(declare-fun b!12534 () Bool)

(declare-fun Unit!1069 () Unit!1045)

(assert (=> b!12534 (= e!7591 Unit!1069)))

(assert (= (and d!4122 c!951) b!12531))

(assert (= (and d!4122 (not c!951)) b!12534))

(assert (= (and d!4122 res!11961) b!12532))

(assert (= (and b!12532 res!11962) b!12530))

(assert (= (and b!12530 res!11963) b!12533))

(declare-fun m!18981 () Bool)

(assert (=> b!12530 m!18981))

(declare-fun m!18983 () Bool)

(assert (=> b!12532 m!18983))

(declare-fun m!18985 () Bool)

(assert (=> d!4122 m!18985))

(assert (=> d!4122 m!18607))

(declare-fun m!18987 () Bool)

(assert (=> d!4122 m!18987))

(declare-fun m!18989 () Bool)

(assert (=> d!4122 m!18989))

(declare-fun m!18991 () Bool)

(assert (=> d!4122 m!18991))

(declare-fun m!18993 () Bool)

(assert (=> d!4122 m!18993))

(declare-fun m!18995 () Bool)

(assert (=> d!4122 m!18995))

(declare-fun m!18997 () Bool)

(assert (=> d!4122 m!18997))

(declare-fun m!18999 () Bool)

(assert (=> d!4122 m!18999))

(assert (=> d!4122 m!18933))

(assert (=> d!4122 m!18931))

(declare-fun m!19001 () Bool)

(assert (=> b!12533 m!19001))

(assert (=> b!12533 m!18591))

(assert (=> b!12533 m!18593))

(assert (=> b!12531 m!18593))

(declare-fun m!19003 () Bool)

(assert (=> b!12531 m!19003))

(declare-fun m!19005 () Bool)

(assert (=> b!12531 m!19005))

(assert (=> b!12299 d!4122))

(declare-fun b!12589 () Bool)

(declare-fun res!12012 () Bool)

(declare-fun e!7614 () Bool)

(assert (=> b!12589 (=> (not res!12012) (not e!7614))))

(declare-fun lt!20469 () tuple2!1436)

(assert (=> b!12589 (= res!12012 (bvsle (currentByte!1719 (_1!769 lt!19718)) (currentByte!1719 (_2!770 lt!20469))))))

(declare-fun d!4132 () Bool)

(assert (=> d!4132 e!7614))

(declare-fun res!12013 () Bool)

(assert (=> d!4132 (=> (not res!12013) (not e!7614))))

(assert (=> d!4132 (= res!12013 (= (buf!641 (_2!770 lt!20469)) (buf!641 (_1!769 lt!19718))))))

(declare-datatypes ((tuple3!96 0))(
  ( (tuple3!97 (_1!780 Unit!1045) (_2!780 BitStream!546) (_3!54 array!674)) )
))
(declare-fun lt!20473 () tuple3!96)

(assert (=> d!4132 (= lt!20469 (tuple2!1437 (_3!54 lt!20473) (_2!780 lt!20473)))))

(declare-fun readBitsLoop!0 (BitStream!546 (_ BitVec 64) array!674 (_ BitVec 64) (_ BitVec 64)) tuple3!96)

(assert (=> d!4132 (= lt!20473 (readBitsLoop!0 (_1!769 lt!19718) nBits!460 (array!675 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!4132 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4132 (= (readBits!0 (_1!769 lt!19718) nBits!460) lt!20469)))

(declare-fun b!12590 () Bool)

(declare-fun res!12014 () Bool)

(assert (=> b!12590 (=> (not res!12014) (not e!7614))))

(declare-fun lt!20468 () (_ BitVec 64))

(assert (=> b!12590 (= res!12014 (= (bvadd lt!20468 nBits!460) (bitIndex!0 (size!293 (buf!641 (_2!770 lt!20469))) (currentByte!1719 (_2!770 lt!20469)) (currentBit!1714 (_2!770 lt!20469)))))))

(assert (=> b!12590 (or (not (= (bvand lt!20468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!20468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!20468 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12590 (= lt!20468 (bitIndex!0 (size!293 (buf!641 (_1!769 lt!19718))) (currentByte!1719 (_1!769 lt!19718)) (currentBit!1714 (_1!769 lt!19718))))))

(declare-fun b!12591 () Bool)

(declare-fun res!12010 () Bool)

(assert (=> b!12591 (=> (not res!12010) (not e!7614))))

(assert (=> b!12591 (= res!12010 (invariant!0 (currentBit!1714 (_2!770 lt!20469)) (currentByte!1719 (_2!770 lt!20469)) (size!293 (buf!641 (_2!770 lt!20469)))))))

(declare-fun b!12592 () Bool)

(declare-fun res!12011 () Bool)

(assert (=> b!12592 (=> (not res!12011) (not e!7614))))

(declare-fun lt!20471 () (_ BitVec 64))

(assert (=> b!12592 (= res!12011 (= (size!293 (_1!770 lt!20469)) ((_ extract 31 0) lt!20471)))))

(assert (=> b!12592 (and (bvslt lt!20471 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!20471 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!20466 () (_ BitVec 64))

(declare-fun lt!20472 () (_ BitVec 64))

(assert (=> b!12592 (= lt!20471 (bvsdiv lt!20466 lt!20472))))

(assert (=> b!12592 (and (not (= lt!20472 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!20466 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!20472 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!12592 (= lt!20472 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!20470 () (_ BitVec 64))

(declare-fun lt!20467 () (_ BitVec 64))

(assert (=> b!12592 (= lt!20466 (bvsub lt!20470 lt!20467))))

(assert (=> b!12592 (or (= (bvand lt!20470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20470 lt!20467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12592 (= lt!20467 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!20474 () (_ BitVec 64))

(assert (=> b!12592 (= lt!20470 (bvadd nBits!460 lt!20474))))

(assert (=> b!12592 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!20474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12592 (= lt!20474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!12593 () Bool)

(assert (=> b!12593 (= e!7614 (= (byteArrayBitContentToList!0 (_2!770 lt!20469) (_1!770 lt!20469) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!770 lt!20469) (_1!769 lt!19718) nBits!460)))))

(assert (= (and d!4132 res!12013) b!12590))

(assert (= (and b!12590 res!12014) b!12591))

(assert (= (and b!12591 res!12010) b!12592))

(assert (= (and b!12592 res!12011) b!12589))

(assert (= (and b!12589 res!12012) b!12593))

(declare-fun m!19121 () Bool)

(assert (=> d!4132 m!19121))

(declare-fun m!19123 () Bool)

(assert (=> b!12590 m!19123))

(declare-fun m!19125 () Bool)

(assert (=> b!12590 m!19125))

(declare-fun m!19127 () Bool)

(assert (=> b!12591 m!19127))

(declare-fun m!19129 () Bool)

(assert (=> b!12593 m!19129))

(declare-fun m!19131 () Bool)

(assert (=> b!12593 m!19131))

(assert (=> b!12299 d!4132))

(declare-fun d!4142 () Bool)

(assert (=> d!4142 (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!19717)))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486)) nBits!460)))

(declare-fun lt!20477 () Unit!1045)

(declare-fun choose!9 (BitStream!546 array!674 (_ BitVec 64) BitStream!546) Unit!1045)

(assert (=> d!4142 (= lt!20477 (choose!9 thiss!1486 (buf!641 (_2!768 lt!19717)) nBits!460 (BitStream!547 (buf!641 (_2!768 lt!19717)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486))))))

(assert (=> d!4142 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!641 (_2!768 lt!19717)) nBits!460) lt!20477)))

(declare-fun bs!1134 () Bool)

(assert (= bs!1134 d!4142))

(assert (=> bs!1134 m!18601))

(declare-fun m!19133 () Bool)

(assert (=> bs!1134 m!19133))

(assert (=> b!12299 d!4142))

(declare-fun d!4144 () Bool)

(declare-fun c!956 () Bool)

(assert (=> d!4144 (= c!956 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7615 () List!169)

(assert (=> d!4144 (= (byteArrayBitContentToList!0 (_2!768 lt!19717) (_1!770 lt!19714) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7615)))

(declare-fun b!12594 () Bool)

(assert (=> b!12594 (= e!7615 Nil!166)))

(declare-fun b!12595 () Bool)

(assert (=> b!12595 (= e!7615 (Cons!165 (not (= (bvand ((_ sign_extend 24) (select (arr!719 (_1!770 lt!19714)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!768 lt!19717) (_1!770 lt!19714) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!4144 c!956) b!12594))

(assert (= (and d!4144 (not c!956)) b!12595))

(assert (=> b!12595 m!18941))

(assert (=> b!12595 m!18943))

(declare-fun m!19135 () Bool)

(assert (=> b!12595 m!19135))

(assert (=> b!12299 d!4144))

(declare-datatypes ((tuple2!1452 0))(
  ( (tuple2!1453 (_1!781 List!169) (_2!781 BitStream!546)) )
))
(declare-fun e!7620 () tuple2!1452)

(declare-fun lt!20484 () (_ BitVec 64))

(declare-datatypes ((tuple2!1454 0))(
  ( (tuple2!1455 (_1!782 Bool) (_2!782 BitStream!546)) )
))
(declare-fun lt!20486 () tuple2!1454)

(declare-fun b!12605 () Bool)

(assert (=> b!12605 (= e!7620 (tuple2!1453 (Cons!165 (_1!782 lt!20486) (bitStreamReadBitsIntoList!0 (_2!768 lt!19717) (_2!782 lt!20486) (bvsub nBits!460 lt!20484))) (_2!782 lt!20486)))))

(declare-fun readBit!0 (BitStream!546) tuple2!1454)

(assert (=> b!12605 (= lt!20486 (readBit!0 (_1!769 lt!19718)))))

(assert (=> b!12605 (= lt!20484 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!4146 () Bool)

(declare-fun e!7621 () Bool)

(assert (=> d!4146 e!7621))

(declare-fun c!961 () Bool)

(assert (=> d!4146 (= c!961 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!20485 () List!169)

(assert (=> d!4146 (= lt!20485 (_1!781 e!7620))))

(declare-fun c!962 () Bool)

(assert (=> d!4146 (= c!962 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4146 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!4146 (= (bitStreamReadBitsIntoList!0 (_2!768 lt!19717) (_1!769 lt!19718) nBits!460) lt!20485)))

(declare-fun b!12606 () Bool)

(declare-fun isEmpty!42 (List!169) Bool)

(assert (=> b!12606 (= e!7621 (isEmpty!42 lt!20485))))

(declare-fun b!12604 () Bool)

(assert (=> b!12604 (= e!7620 (tuple2!1453 Nil!166 (_1!769 lt!19718)))))

(declare-fun b!12607 () Bool)

(declare-fun length!37 (List!169) Int)

(assert (=> b!12607 (= e!7621 (> (length!37 lt!20485) 0))))

(assert (= (and d!4146 c!962) b!12604))

(assert (= (and d!4146 (not c!962)) b!12605))

(assert (= (and d!4146 c!961) b!12606))

(assert (= (and d!4146 (not c!961)) b!12607))

(declare-fun m!19137 () Bool)

(assert (=> b!12605 m!19137))

(declare-fun m!19139 () Bool)

(assert (=> b!12605 m!19139))

(declare-fun m!19141 () Bool)

(assert (=> b!12606 m!19141))

(declare-fun m!19143 () Bool)

(assert (=> b!12607 m!19143))

(assert (=> b!12299 d!4146))

(declare-fun d!4148 () Bool)

(assert (=> d!4148 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!19717)))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!19717)))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486))) nBits!460))))

(declare-fun bs!1135 () Bool)

(assert (= bs!1135 d!4148))

(declare-fun m!19145 () Bool)

(assert (=> bs!1135 m!19145))

(assert (=> b!12299 d!4148))

(declare-fun d!4150 () Bool)

(declare-fun res!12022 () Bool)

(declare-fun e!7626 () Bool)

(assert (=> d!4150 (=> (not res!12022) (not e!7626))))

(assert (=> d!4150 (= res!12022 (= (size!293 (buf!641 thiss!1486)) (size!293 (buf!641 (_2!768 lt!19717)))))))

(assert (=> d!4150 (= (isPrefixOf!0 thiss!1486 (_2!768 lt!19717)) e!7626)))

(declare-fun b!12614 () Bool)

(declare-fun res!12023 () Bool)

(assert (=> b!12614 (=> (not res!12023) (not e!7626))))

(assert (=> b!12614 (= res!12023 (bvsle (bitIndex!0 (size!293 (buf!641 thiss!1486)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486)) (bitIndex!0 (size!293 (buf!641 (_2!768 lt!19717))) (currentByte!1719 (_2!768 lt!19717)) (currentBit!1714 (_2!768 lt!19717)))))))

(declare-fun b!12615 () Bool)

(declare-fun e!7627 () Bool)

(assert (=> b!12615 (= e!7626 e!7627)))

(declare-fun res!12021 () Bool)

(assert (=> b!12615 (=> res!12021 e!7627)))

(assert (=> b!12615 (= res!12021 (= (size!293 (buf!641 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!12616 () Bool)

(assert (=> b!12616 (= e!7627 (arrayBitRangesEq!0 (buf!641 thiss!1486) (buf!641 (_2!768 lt!19717)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!293 (buf!641 thiss!1486)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486))))))

(assert (= (and d!4150 res!12022) b!12614))

(assert (= (and b!12614 res!12023) b!12615))

(assert (= (and b!12615 (not res!12021)) b!12616))

(assert (=> b!12614 m!18593))

(assert (=> b!12614 m!18591))

(assert (=> b!12616 m!18593))

(assert (=> b!12616 m!18593))

(declare-fun m!19147 () Bool)

(assert (=> b!12616 m!19147))

(assert (=> b!12298 d!4150))

(declare-fun d!4152 () Bool)

(assert (=> d!4152 (= (array_inv!282 (buf!641 thiss!1486)) (bvsge (size!293 (buf!641 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!12300 d!4152))

(declare-fun d!4154 () Bool)

(declare-fun e!7630 () Bool)

(assert (=> d!4154 e!7630))

(declare-fun res!12028 () Bool)

(assert (=> d!4154 (=> (not res!12028) (not e!7630))))

(declare-fun lt!20500 () (_ BitVec 64))

(declare-fun lt!20499 () (_ BitVec 64))

(declare-fun lt!20504 () (_ BitVec 64))

(assert (=> d!4154 (= res!12028 (= lt!20500 (bvsub lt!20499 lt!20504)))))

(assert (=> d!4154 (or (= (bvand lt!20499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20499 lt!20504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4154 (= lt!20504 (remainingBits!0 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!19717)))) ((_ sign_extend 32) (currentByte!1719 (_2!768 lt!19717))) ((_ sign_extend 32) (currentBit!1714 (_2!768 lt!19717)))))))

(declare-fun lt!20503 () (_ BitVec 64))

(declare-fun lt!20502 () (_ BitVec 64))

(assert (=> d!4154 (= lt!20499 (bvmul lt!20503 lt!20502))))

(assert (=> d!4154 (or (= lt!20503 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20502 (bvsdiv (bvmul lt!20503 lt!20502) lt!20503)))))

(assert (=> d!4154 (= lt!20502 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4154 (= lt!20503 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!19717)))))))

(assert (=> d!4154 (= lt!20500 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1719 (_2!768 lt!19717))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1714 (_2!768 lt!19717)))))))

(assert (=> d!4154 (invariant!0 (currentBit!1714 (_2!768 lt!19717)) (currentByte!1719 (_2!768 lt!19717)) (size!293 (buf!641 (_2!768 lt!19717))))))

(assert (=> d!4154 (= (bitIndex!0 (size!293 (buf!641 (_2!768 lt!19717))) (currentByte!1719 (_2!768 lt!19717)) (currentBit!1714 (_2!768 lt!19717))) lt!20500)))

(declare-fun b!12621 () Bool)

(declare-fun res!12029 () Bool)

(assert (=> b!12621 (=> (not res!12029) (not e!7630))))

(assert (=> b!12621 (= res!12029 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20500))))

(declare-fun b!12622 () Bool)

(declare-fun lt!20501 () (_ BitVec 64))

(assert (=> b!12622 (= e!7630 (bvsle lt!20500 (bvmul lt!20501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12622 (or (= lt!20501 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20501 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20501)))))

(assert (=> b!12622 (= lt!20501 ((_ sign_extend 32) (size!293 (buf!641 (_2!768 lt!19717)))))))

(assert (= (and d!4154 res!12028) b!12621))

(assert (= (and b!12621 res!12029) b!12622))

(declare-fun m!19149 () Bool)

(assert (=> d!4154 m!19149))

(assert (=> d!4154 m!18583))

(assert (=> b!12295 d!4154))

(declare-fun d!4156 () Bool)

(declare-fun e!7631 () Bool)

(assert (=> d!4156 e!7631))

(declare-fun res!12030 () Bool)

(assert (=> d!4156 (=> (not res!12030) (not e!7631))))

(declare-fun lt!20510 () (_ BitVec 64))

(declare-fun lt!20505 () (_ BitVec 64))

(declare-fun lt!20506 () (_ BitVec 64))

(assert (=> d!4156 (= res!12030 (= lt!20506 (bvsub lt!20505 lt!20510)))))

(assert (=> d!4156 (or (= (bvand lt!20505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20510 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20505 lt!20510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4156 (= lt!20510 (remainingBits!0 ((_ sign_extend 32) (size!293 (buf!641 thiss!1486))) ((_ sign_extend 32) (currentByte!1719 thiss!1486)) ((_ sign_extend 32) (currentBit!1714 thiss!1486))))))

(declare-fun lt!20509 () (_ BitVec 64))

(declare-fun lt!20508 () (_ BitVec 64))

(assert (=> d!4156 (= lt!20505 (bvmul lt!20509 lt!20508))))

(assert (=> d!4156 (or (= lt!20509 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20508 (bvsdiv (bvmul lt!20509 lt!20508) lt!20509)))))

(assert (=> d!4156 (= lt!20508 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4156 (= lt!20509 ((_ sign_extend 32) (size!293 (buf!641 thiss!1486))))))

(assert (=> d!4156 (= lt!20506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1719 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1714 thiss!1486))))))

(assert (=> d!4156 (invariant!0 (currentBit!1714 thiss!1486) (currentByte!1719 thiss!1486) (size!293 (buf!641 thiss!1486)))))

(assert (=> d!4156 (= (bitIndex!0 (size!293 (buf!641 thiss!1486)) (currentByte!1719 thiss!1486) (currentBit!1714 thiss!1486)) lt!20506)))

(declare-fun b!12623 () Bool)

(declare-fun res!12031 () Bool)

(assert (=> b!12623 (=> (not res!12031) (not e!7631))))

(assert (=> b!12623 (= res!12031 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20506))))

(declare-fun b!12624 () Bool)

(declare-fun lt!20507 () (_ BitVec 64))

(assert (=> b!12624 (= e!7631 (bvsle lt!20506 (bvmul lt!20507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12624 (or (= lt!20507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20507)))))

(assert (=> b!12624 (= lt!20507 ((_ sign_extend 32) (size!293 (buf!641 thiss!1486))))))

(assert (= (and d!4156 res!12030) b!12623))

(assert (= (and b!12623 res!12031) b!12624))

(assert (=> d!4156 m!18953))

(assert (=> d!4156 m!18951))

(assert (=> b!12295 d!4156))

(check-sat (not b!12595) (not d!4132) (not d!4156) (not b!12458) (not b!12530) (not d!4118) (not d!4120) (not b!12532) (not b!12590) (not b!12607) (not d!4154) (not b!12464) (not d!4110) (not b!12593) (not b!12533) (not d!4116) (not d!4142) (not b!12606) (not b!12460) (not b!12463) (not b!12605) (not b!12616) (not d!4122) (not d!4148) (not bm!251) (not d!4068) (not b!12614) (not b!12461) (not b!12591) (not b!12459) (not b!12480) (not b!12531) (not b!12486))
