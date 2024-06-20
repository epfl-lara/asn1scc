; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41430 () Bool)

(assert start!41430)

(declare-fun b!194401 () Bool)

(declare-fun e!133764 () Bool)

(declare-fun e!133761 () Bool)

(assert (=> b!194401 (= e!133764 e!133761)))

(declare-fun res!162568 () Bool)

(assert (=> b!194401 (=> res!162568 e!133761)))

(declare-datatypes ((array!9999 0))(
  ( (array!10000 (arr!5340 (Array (_ BitVec 32) (_ BitVec 8))) (size!4410 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7928 0))(
  ( (BitStream!7929 (buf!4893 array!9999) (currentByte!9183 (_ BitVec 32)) (currentBit!9178 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16824 0))(
  ( (tuple2!16825 (_1!9057 BitStream!7928) (_2!9057 (_ BitVec 64))) )
))
(declare-fun lt!302119 () tuple2!16824)

(declare-datatypes ((tuple2!16826 0))(
  ( (tuple2!16827 (_1!9058 BitStream!7928) (_2!9058 BitStream!7928)) )
))
(declare-fun lt!302133 () tuple2!16826)

(assert (=> b!194401 (= res!162568 (not (= (_1!9057 lt!302119) (_2!9058 lt!302133))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!302129 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16824)

(assert (=> b!194401 (= lt!302119 (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302133) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302129))))

(declare-datatypes ((Unit!13736 0))(
  ( (Unit!13737) )
))
(declare-datatypes ((tuple2!16828 0))(
  ( (tuple2!16829 (_1!9059 Unit!13736) (_2!9059 BitStream!7928)) )
))
(declare-fun lt!302111 () tuple2!16828)

(declare-fun lt!302130 () tuple2!16828)

(declare-fun lt!302116 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!194401 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130))) lt!302116)))

(declare-fun lt!302118 () Unit!13736)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7928 array!9999 (_ BitVec 64)) Unit!13736)

(assert (=> b!194401 (= lt!302118 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9059 lt!302130) (buf!4893 (_2!9059 lt!302111)) lt!302116))))

(assert (=> b!194401 (= lt!302116 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!302124 () (_ BitVec 64))

(declare-datatypes ((tuple2!16830 0))(
  ( (tuple2!16831 (_1!9060 BitStream!7928) (_2!9060 Bool)) )
))
(declare-fun lt!302112 () tuple2!16830)

(declare-fun lt!302117 () (_ BitVec 64))

(assert (=> b!194401 (= lt!302129 (bvor lt!302117 (ite (_2!9060 lt!302112) lt!302124 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!302106 () tuple2!16824)

(declare-fun lt!302123 () tuple2!16826)

(assert (=> b!194401 (= lt!302106 (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302123) nBits!348 i!590 lt!302117))))

(declare-fun thiss!1204 () BitStream!7928)

(declare-fun lt!302125 () (_ BitVec 64))

(assert (=> b!194401 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))) ((_ sign_extend 32) (currentByte!9183 thiss!1204)) ((_ sign_extend 32) (currentBit!9178 thiss!1204)) lt!302125)))

(declare-fun lt!302126 () Unit!13736)

(assert (=> b!194401 (= lt!302126 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4893 (_2!9059 lt!302111)) lt!302125))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194401 (= lt!302117 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!302109 () Bool)

(assert (=> b!194401 (= (_2!9060 lt!302112) lt!302109)))

(declare-fun readBitPure!0 (BitStream!7928) tuple2!16830)

(assert (=> b!194401 (= lt!302112 (readBitPure!0 (_1!9058 lt!302123)))))

(declare-fun reader!0 (BitStream!7928 BitStream!7928) tuple2!16826)

(assert (=> b!194401 (= lt!302133 (reader!0 (_2!9059 lt!302130) (_2!9059 lt!302111)))))

(assert (=> b!194401 (= lt!302123 (reader!0 thiss!1204 (_2!9059 lt!302111)))))

(declare-fun e!133754 () Bool)

(assert (=> b!194401 e!133754))

(declare-fun res!162558 () Bool)

(assert (=> b!194401 (=> (not res!162558) (not e!133754))))

(declare-fun lt!302132 () tuple2!16830)

(declare-fun lt!302131 () tuple2!16830)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194401 (= res!162558 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302132))) (currentByte!9183 (_1!9060 lt!302132)) (currentBit!9178 (_1!9060 lt!302132))) (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302131))) (currentByte!9183 (_1!9060 lt!302131)) (currentBit!9178 (_1!9060 lt!302131)))))))

(declare-fun lt!302128 () Unit!13736)

(declare-fun lt!302107 () BitStream!7928)

(declare-fun readBitPrefixLemma!0 (BitStream!7928 BitStream!7928) Unit!13736)

(assert (=> b!194401 (= lt!302128 (readBitPrefixLemma!0 lt!302107 (_2!9059 lt!302111)))))

(assert (=> b!194401 (= lt!302131 (readBitPure!0 (BitStream!7929 (buf!4893 (_2!9059 lt!302111)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204))))))

(assert (=> b!194401 (= lt!302132 (readBitPure!0 lt!302107))))

(declare-fun e!133759 () Bool)

(assert (=> b!194401 e!133759))

(declare-fun res!162574 () Bool)

(assert (=> b!194401 (=> (not res!162574) (not e!133759))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!194401 (= res!162574 (invariant!0 (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204) (size!4410 (buf!4893 (_2!9059 lt!302130)))))))

(assert (=> b!194401 (= lt!302107 (BitStream!7929 (buf!4893 (_2!9059 lt!302130)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)))))

(declare-fun b!194403 () Bool)

(declare-fun e!133752 () Bool)

(assert (=> b!194403 (= e!133752 e!133764)))

(declare-fun res!162559 () Bool)

(assert (=> b!194403 (=> res!162559 e!133764)))

(declare-fun lt!302115 () (_ BitVec 64))

(declare-fun lt!302113 () (_ BitVec 64))

(assert (=> b!194403 (= res!162559 (not (= lt!302113 (bvsub (bvsub (bvadd lt!302115 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!194403 (= lt!302113 (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302111))) (currentByte!9183 (_2!9059 lt!302111)) (currentBit!9178 (_2!9059 lt!302111))))))

(declare-fun isPrefixOf!0 (BitStream!7928 BitStream!7928) Bool)

(assert (=> b!194403 (isPrefixOf!0 thiss!1204 (_2!9059 lt!302111))))

(declare-fun lt!302120 () Unit!13736)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7928 BitStream!7928 BitStream!7928) Unit!13736)

(assert (=> b!194403 (= lt!302120 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9059 lt!302130) (_2!9059 lt!302111)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7928 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16828)

(assert (=> b!194403 (= lt!302111 (appendBitsLSBFirstLoopTR!0 (_2!9059 lt!302130) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!194404 () Bool)

(declare-fun e!133766 () Bool)

(declare-fun e!133755 () Bool)

(assert (=> b!194404 (= e!133766 e!133755)))

(declare-fun res!162553 () Bool)

(assert (=> b!194404 (=> (not res!162553) (not e!133755))))

(declare-fun lt!302108 () tuple2!16830)

(assert (=> b!194404 (= res!162553 (and (= (_2!9060 lt!302108) lt!302109) (= (_1!9060 lt!302108) (_2!9059 lt!302130))))))

(declare-fun readerFrom!0 (BitStream!7928 (_ BitVec 32) (_ BitVec 32)) BitStream!7928)

(assert (=> b!194404 (= lt!302108 (readBitPure!0 (readerFrom!0 (_2!9059 lt!302130) (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204))))))

(declare-fun b!194405 () Bool)

(declare-fun e!133765 () Bool)

(assert (=> b!194405 (= e!133761 e!133765)))

(declare-fun res!162567 () Bool)

(assert (=> b!194405 (=> res!162567 e!133765)))

(declare-fun lt!302114 () BitStream!7928)

(assert (=> b!194405 (= res!162567 (not (= (_1!9058 lt!302133) lt!302114)))))

(declare-fun e!133753 () Bool)

(assert (=> b!194405 e!133753))

(declare-fun res!162564 () Bool)

(assert (=> b!194405 (=> (not res!162564) (not e!133753))))

(declare-fun lt!302122 () tuple2!16824)

(assert (=> b!194405 (= res!162564 (and (= (_2!9057 lt!302106) (_2!9057 lt!302122)) (= (_1!9057 lt!302106) (_1!9057 lt!302122))))))

(declare-fun lt!302134 () Unit!13736)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13736)

(assert (=> b!194405 (= lt!302134 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9058 lt!302123) nBits!348 i!590 lt!302117))))

(assert (=> b!194405 (= lt!302122 (readNBitsLSBFirstsLoopPure!0 lt!302114 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302129))))

(declare-fun withMovedBitIndex!0 (BitStream!7928 (_ BitVec 64)) BitStream!7928)

(assert (=> b!194405 (= lt!302114 (withMovedBitIndex!0 (_1!9058 lt!302123) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!302110 () (_ BitVec 64))

(declare-fun b!194406 () Bool)

(assert (=> b!194406 (= e!133753 (and (= lt!302110 (bvsub lt!302115 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9058 lt!302133) lt!302114)) (= (_2!9057 lt!302106) (_2!9057 lt!302119)))))))

(declare-fun b!194407 () Bool)

(declare-fun e!133758 () Bool)

(assert (=> b!194407 (= e!133758 (not e!133752))))

(declare-fun res!162566 () Bool)

(assert (=> b!194407 (=> res!162566 e!133752)))

(assert (=> b!194407 (= res!162566 (not (= lt!302115 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!302110))))))

(assert (=> b!194407 (= lt!302115 (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))))))

(assert (=> b!194407 (= lt!302110 (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)))))

(declare-fun e!133760 () Bool)

(assert (=> b!194407 e!133760))

(declare-fun res!162569 () Bool)

(assert (=> b!194407 (=> (not res!162569) (not e!133760))))

(assert (=> b!194407 (= res!162569 (= (size!4410 (buf!4893 thiss!1204)) (size!4410 (buf!4893 (_2!9059 lt!302130)))))))

(declare-fun appendBit!0 (BitStream!7928 Bool) tuple2!16828)

(assert (=> b!194407 (= lt!302130 (appendBit!0 thiss!1204 lt!302109))))

(assert (=> b!194407 (= lt!302109 (not (= (bvand v!189 lt!302124) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194407 (= lt!302124 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!194408 () Bool)

(assert (=> b!194408 (= e!133759 (invariant!0 (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204) (size!4410 (buf!4893 (_2!9059 lt!302111)))))))

(declare-fun b!194409 () Bool)

(declare-fun res!162552 () Bool)

(assert (=> b!194409 (=> (not res!162552) (not e!133758))))

(assert (=> b!194409 (= res!162552 (invariant!0 (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204) (size!4410 (buf!4893 thiss!1204))))))

(declare-fun b!194410 () Bool)

(declare-fun res!162570 () Bool)

(declare-fun e!133751 () Bool)

(assert (=> b!194410 (=> (not res!162570) (not e!133751))))

(assert (=> b!194410 (= res!162570 (= (_2!9057 lt!302106) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!194411 () Bool)

(declare-fun e!133757 () Bool)

(assert (=> b!194411 (= e!133765 e!133757)))

(declare-fun res!162561 () Bool)

(assert (=> b!194411 (=> res!162561 e!133757)))

(assert (=> b!194411 (= res!162561 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9058 lt!302123)))) ((_ sign_extend 32) (currentByte!9183 (_1!9058 lt!302123))) ((_ sign_extend 32) (currentBit!9178 (_1!9058 lt!302123))) lt!302125)))))

(assert (=> b!194411 e!133751))

(declare-fun res!162575 () Bool)

(assert (=> b!194411 (=> (not res!162575) (not e!133751))))

(assert (=> b!194411 (= res!162575 (= (size!4410 (buf!4893 thiss!1204)) (size!4410 (buf!4893 (_2!9059 lt!302111)))))))

(declare-fun b!194412 () Bool)

(declare-fun res!162554 () Bool)

(assert (=> b!194412 (=> res!162554 e!133764)))

(assert (=> b!194412 (= res!162554 (not (isPrefixOf!0 thiss!1204 (_2!9059 lt!302130))))))

(declare-fun b!194413 () Bool)

(declare-fun res!162556 () Bool)

(assert (=> b!194413 (=> (not res!162556) (not e!133766))))

(assert (=> b!194413 (= res!162556 (isPrefixOf!0 thiss!1204 (_2!9059 lt!302130)))))

(declare-fun b!194414 () Bool)

(assert (=> b!194414 (= e!133754 (= (_2!9060 lt!302132) (_2!9060 lt!302131)))))

(declare-fun b!194415 () Bool)

(assert (=> b!194415 (= e!133760 e!133766)))

(declare-fun res!162562 () Bool)

(assert (=> b!194415 (=> (not res!162562) (not e!133766))))

(declare-fun lt!302121 () (_ BitVec 64))

(declare-fun lt!302127 () (_ BitVec 64))

(assert (=> b!194415 (= res!162562 (= lt!302121 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!302127)))))

(assert (=> b!194415 (= lt!302121 (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))))))

(assert (=> b!194415 (= lt!302127 (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)))))

(declare-fun b!194416 () Bool)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194416 (= e!133757 (= (bvand lt!302117 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194417 () Bool)

(declare-fun e!133756 () Bool)

(declare-fun array_inv!4151 (array!9999) Bool)

(assert (=> b!194417 (= e!133756 (array_inv!4151 (buf!4893 thiss!1204)))))

(declare-fun res!162572 () Bool)

(declare-fun e!133762 () Bool)

(assert (=> start!41430 (=> (not res!162572) (not e!133762))))

(assert (=> start!41430 (= res!162572 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41430 e!133762))

(assert (=> start!41430 true))

(declare-fun inv!12 (BitStream!7928) Bool)

(assert (=> start!41430 (and (inv!12 thiss!1204) e!133756)))

(declare-fun b!194402 () Bool)

(declare-fun res!162565 () Bool)

(assert (=> b!194402 (=> res!162565 e!133764)))

(assert (=> b!194402 (= res!162565 (not (isPrefixOf!0 (_2!9059 lt!302130) (_2!9059 lt!302111))))))

(declare-fun b!194418 () Bool)

(assert (=> b!194418 (= e!133762 e!133758)))

(declare-fun res!162576 () Bool)

(assert (=> b!194418 (=> (not res!162576) (not e!133758))))

(assert (=> b!194418 (= res!162576 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 thiss!1204))) ((_ sign_extend 32) (currentByte!9183 thiss!1204)) ((_ sign_extend 32) (currentBit!9178 thiss!1204)) lt!302125))))

(assert (=> b!194418 (= lt!302125 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!194419 () Bool)

(declare-fun res!162560 () Bool)

(assert (=> b!194419 (=> res!162560 e!133764)))

(assert (=> b!194419 (= res!162560 (not (invariant!0 (currentBit!9178 (_2!9059 lt!302111)) (currentByte!9183 (_2!9059 lt!302111)) (size!4410 (buf!4893 (_2!9059 lt!302111))))))))

(declare-fun b!194420 () Bool)

(declare-fun res!162571 () Bool)

(assert (=> b!194420 (=> res!162571 e!133765)))

(assert (=> b!194420 (= res!162571 (not (= (bitIndex!0 (size!4410 (buf!4893 (_1!9057 lt!302106))) (currentByte!9183 (_1!9057 lt!302106)) (currentBit!9178 (_1!9057 lt!302106))) (bitIndex!0 (size!4410 (buf!4893 (_2!9058 lt!302123))) (currentByte!9183 (_2!9058 lt!302123)) (currentBit!9178 (_2!9058 lt!302123))))))))

(declare-fun b!194421 () Bool)

(declare-fun res!162563 () Bool)

(assert (=> b!194421 (=> (not res!162563) (not e!133753))))

(assert (=> b!194421 (= res!162563 (= (_1!9058 lt!302133) (withMovedBitIndex!0 (_2!9058 lt!302133) (bvsub lt!302115 lt!302113))))))

(declare-fun b!194422 () Bool)

(declare-fun res!162573 () Bool)

(assert (=> b!194422 (=> (not res!162573) (not e!133753))))

(assert (=> b!194422 (= res!162573 (= (_1!9058 lt!302123) (withMovedBitIndex!0 (_2!9058 lt!302123) (bvsub lt!302110 lt!302113))))))

(declare-fun b!194423 () Bool)

(declare-fun res!162555 () Bool)

(assert (=> b!194423 (=> (not res!162555) (not e!133758))))

(assert (=> b!194423 (= res!162555 (not (= i!590 nBits!348)))))

(declare-fun b!194424 () Bool)

(declare-fun res!162557 () Bool)

(assert (=> b!194424 (=> res!162557 e!133764)))

(assert (=> b!194424 (= res!162557 (or (not (= (size!4410 (buf!4893 (_2!9059 lt!302111))) (size!4410 (buf!4893 thiss!1204)))) (not (= lt!302113 (bvsub (bvadd lt!302110 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!194425 () Bool)

(assert (=> b!194425 (= e!133755 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302108))) (currentByte!9183 (_1!9060 lt!302108)) (currentBit!9178 (_1!9060 lt!302108))) lt!302121))))

(declare-fun b!194426 () Bool)

(assert (=> b!194426 (= e!133751 (= (_1!9057 lt!302106) (_2!9058 lt!302123)))))

(assert (= (and start!41430 res!162572) b!194418))

(assert (= (and b!194418 res!162576) b!194409))

(assert (= (and b!194409 res!162552) b!194423))

(assert (= (and b!194423 res!162555) b!194407))

(assert (= (and b!194407 res!162569) b!194415))

(assert (= (and b!194415 res!162562) b!194413))

(assert (= (and b!194413 res!162556) b!194404))

(assert (= (and b!194404 res!162553) b!194425))

(assert (= (and b!194407 (not res!162566)) b!194403))

(assert (= (and b!194403 (not res!162559)) b!194419))

(assert (= (and b!194419 (not res!162560)) b!194424))

(assert (= (and b!194424 (not res!162557)) b!194402))

(assert (= (and b!194402 (not res!162565)) b!194412))

(assert (= (and b!194412 (not res!162554)) b!194401))

(assert (= (and b!194401 res!162574) b!194408))

(assert (= (and b!194401 res!162558) b!194414))

(assert (= (and b!194401 (not res!162568)) b!194405))

(assert (= (and b!194405 res!162564) b!194422))

(assert (= (and b!194422 res!162573) b!194421))

(assert (= (and b!194421 res!162563) b!194406))

(assert (= (and b!194405 (not res!162567)) b!194420))

(assert (= (and b!194420 (not res!162571)) b!194411))

(assert (= (and b!194411 res!162575) b!194410))

(assert (= (and b!194410 res!162570) b!194426))

(assert (= (and b!194411 (not res!162561)) b!194416))

(assert (= start!41430 b!194417))

(declare-fun m!301153 () Bool)

(assert (=> b!194425 m!301153))

(declare-fun m!301155 () Bool)

(assert (=> b!194409 m!301155))

(declare-fun m!301157 () Bool)

(assert (=> b!194417 m!301157))

(declare-fun m!301159 () Bool)

(assert (=> b!194411 m!301159))

(declare-fun m!301161 () Bool)

(assert (=> b!194405 m!301161))

(declare-fun m!301163 () Bool)

(assert (=> b!194405 m!301163))

(declare-fun m!301165 () Bool)

(assert (=> b!194405 m!301165))

(declare-fun m!301167 () Bool)

(assert (=> b!194422 m!301167))

(declare-fun m!301169 () Bool)

(assert (=> b!194407 m!301169))

(declare-fun m!301171 () Bool)

(assert (=> b!194407 m!301171))

(declare-fun m!301173 () Bool)

(assert (=> b!194407 m!301173))

(declare-fun m!301175 () Bool)

(assert (=> b!194419 m!301175))

(declare-fun m!301177 () Bool)

(assert (=> b!194401 m!301177))

(declare-fun m!301179 () Bool)

(assert (=> b!194401 m!301179))

(declare-fun m!301181 () Bool)

(assert (=> b!194401 m!301181))

(declare-fun m!301183 () Bool)

(assert (=> b!194401 m!301183))

(declare-fun m!301185 () Bool)

(assert (=> b!194401 m!301185))

(declare-fun m!301187 () Bool)

(assert (=> b!194401 m!301187))

(declare-fun m!301189 () Bool)

(assert (=> b!194401 m!301189))

(declare-fun m!301191 () Bool)

(assert (=> b!194401 m!301191))

(declare-fun m!301193 () Bool)

(assert (=> b!194401 m!301193))

(declare-fun m!301195 () Bool)

(assert (=> b!194401 m!301195))

(declare-fun m!301197 () Bool)

(assert (=> b!194401 m!301197))

(declare-fun m!301199 () Bool)

(assert (=> b!194401 m!301199))

(declare-fun m!301201 () Bool)

(assert (=> b!194401 m!301201))

(declare-fun m!301203 () Bool)

(assert (=> b!194401 m!301203))

(declare-fun m!301205 () Bool)

(assert (=> b!194401 m!301205))

(declare-fun m!301207 () Bool)

(assert (=> b!194401 m!301207))

(assert (=> b!194415 m!301169))

(assert (=> b!194415 m!301171))

(declare-fun m!301209 () Bool)

(assert (=> b!194408 m!301209))

(declare-fun m!301211 () Bool)

(assert (=> b!194402 m!301211))

(declare-fun m!301213 () Bool)

(assert (=> start!41430 m!301213))

(declare-fun m!301215 () Bool)

(assert (=> b!194403 m!301215))

(declare-fun m!301217 () Bool)

(assert (=> b!194403 m!301217))

(declare-fun m!301219 () Bool)

(assert (=> b!194403 m!301219))

(declare-fun m!301221 () Bool)

(assert (=> b!194403 m!301221))

(declare-fun m!301223 () Bool)

(assert (=> b!194420 m!301223))

(declare-fun m!301225 () Bool)

(assert (=> b!194420 m!301225))

(declare-fun m!301227 () Bool)

(assert (=> b!194416 m!301227))

(declare-fun m!301229 () Bool)

(assert (=> b!194412 m!301229))

(declare-fun m!301231 () Bool)

(assert (=> b!194404 m!301231))

(assert (=> b!194404 m!301231))

(declare-fun m!301233 () Bool)

(assert (=> b!194404 m!301233))

(assert (=> b!194413 m!301229))

(declare-fun m!301235 () Bool)

(assert (=> b!194421 m!301235))

(declare-fun m!301237 () Bool)

(assert (=> b!194418 m!301237))

(declare-fun m!301239 () Bool)

(assert (=> b!194410 m!301239))

(push 1)

(assert (not b!194425))

(assert (not b!194404))

(assert (not b!194415))

(assert (not b!194407))

(assert (not b!194418))

(assert (not b!194420))

(assert (not b!194409))

(assert (not b!194419))

(assert (not b!194410))

(assert (not b!194403))

(assert (not b!194422))

(assert (not start!41430))

(assert (not b!194405))

(assert (not b!194412))

(assert (not b!194401))

(assert (not b!194421))

(assert (not b!194402))

(assert (not b!194411))

(assert (not b!194416))

(assert (not b!194413))

(assert (not b!194408))

(assert (not b!194417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65979 () Bool)

(declare-fun e!133798 () Bool)

(assert (=> d!65979 e!133798))

(declare-fun res!162633 () Bool)

(assert (=> d!65979 (=> (not res!162633) (not e!133798))))

(declare-fun lt!302223 () (_ BitVec 64))

(declare-fun lt!302219 () (_ BitVec 64))

(declare-fun lt!302222 () (_ BitVec 64))

(assert (=> d!65979 (= res!162633 (= lt!302223 (bvsub lt!302219 lt!302222)))))

(assert (=> d!65979 (or (= (bvand lt!302219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302219 lt!302222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65979 (= lt!302222 (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9060 lt!302108)))) ((_ sign_extend 32) (currentByte!9183 (_1!9060 lt!302108))) ((_ sign_extend 32) (currentBit!9178 (_1!9060 lt!302108)))))))

(declare-fun lt!302220 () (_ BitVec 64))

(declare-fun lt!302224 () (_ BitVec 64))

(assert (=> d!65979 (= lt!302219 (bvmul lt!302220 lt!302224))))

(assert (=> d!65979 (or (= lt!302220 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302224 (bvsdiv (bvmul lt!302220 lt!302224) lt!302220)))))

(assert (=> d!65979 (= lt!302224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65979 (= lt!302220 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9060 lt!302108)))))))

(assert (=> d!65979 (= lt!302223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9183 (_1!9060 lt!302108))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9178 (_1!9060 lt!302108)))))))

(assert (=> d!65979 (invariant!0 (currentBit!9178 (_1!9060 lt!302108)) (currentByte!9183 (_1!9060 lt!302108)) (size!4410 (buf!4893 (_1!9060 lt!302108))))))

(assert (=> d!65979 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302108))) (currentByte!9183 (_1!9060 lt!302108)) (currentBit!9178 (_1!9060 lt!302108))) lt!302223)))

(declare-fun b!194483 () Bool)

(declare-fun res!162632 () Bool)

(assert (=> b!194483 (=> (not res!162632) (not e!133798))))

(assert (=> b!194483 (= res!162632 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302223))))

(declare-fun b!194484 () Bool)

(declare-fun lt!302221 () (_ BitVec 64))

(assert (=> b!194484 (= e!133798 (bvsle lt!302223 (bvmul lt!302221 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194484 (or (= lt!302221 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302221 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302221)))))

(assert (=> b!194484 (= lt!302221 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9060 lt!302108)))))))

(assert (= (and d!65979 res!162633) b!194483))

(assert (= (and b!194483 res!162632) b!194484))

(declare-fun m!301281 () Bool)

(assert (=> d!65979 m!301281))

(declare-fun m!301283 () Bool)

(assert (=> d!65979 m!301283))

(assert (=> b!194425 d!65979))

(declare-fun d!65993 () Bool)

(declare-fun e!133799 () Bool)

(assert (=> d!65993 e!133799))

(declare-fun res!162635 () Bool)

(assert (=> d!65993 (=> (not res!162635) (not e!133799))))

(declare-fun lt!302228 () (_ BitVec 64))

(declare-fun lt!302225 () (_ BitVec 64))

(declare-fun lt!302229 () (_ BitVec 64))

(assert (=> d!65993 (= res!162635 (= lt!302229 (bvsub lt!302225 lt!302228)))))

(assert (=> d!65993 (or (= (bvand lt!302225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302225 lt!302228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65993 (= lt!302228 (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302111))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302111)))))))

(declare-fun lt!302226 () (_ BitVec 64))

(declare-fun lt!302230 () (_ BitVec 64))

(assert (=> d!65993 (= lt!302225 (bvmul lt!302226 lt!302230))))

(assert (=> d!65993 (or (= lt!302226 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302230 (bvsdiv (bvmul lt!302226 lt!302230) lt!302226)))))

(assert (=> d!65993 (= lt!302230 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65993 (= lt!302226 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))))))

(assert (=> d!65993 (= lt!302229 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302111))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302111)))))))

(assert (=> d!65993 (invariant!0 (currentBit!9178 (_2!9059 lt!302111)) (currentByte!9183 (_2!9059 lt!302111)) (size!4410 (buf!4893 (_2!9059 lt!302111))))))

(assert (=> d!65993 (= (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302111))) (currentByte!9183 (_2!9059 lt!302111)) (currentBit!9178 (_2!9059 lt!302111))) lt!302229)))

(declare-fun b!194485 () Bool)

(declare-fun res!162634 () Bool)

(assert (=> b!194485 (=> (not res!162634) (not e!133799))))

(assert (=> b!194485 (= res!162634 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302229))))

(declare-fun b!194486 () Bool)

(declare-fun lt!302227 () (_ BitVec 64))

(assert (=> b!194486 (= e!133799 (bvsle lt!302229 (bvmul lt!302227 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194486 (or (= lt!302227 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302227 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302227)))))

(assert (=> b!194486 (= lt!302227 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))))))

(assert (= (and d!65993 res!162635) b!194485))

(assert (= (and b!194485 res!162634) b!194486))

(declare-fun m!301285 () Bool)

(assert (=> d!65993 m!301285))

(assert (=> d!65993 m!301175))

(assert (=> b!194403 d!65993))

(declare-fun d!65995 () Bool)

(declare-fun res!162642 () Bool)

(declare-fun e!133804 () Bool)

(assert (=> d!65995 (=> (not res!162642) (not e!133804))))

(assert (=> d!65995 (= res!162642 (= (size!4410 (buf!4893 thiss!1204)) (size!4410 (buf!4893 (_2!9059 lt!302111)))))))

(assert (=> d!65995 (= (isPrefixOf!0 thiss!1204 (_2!9059 lt!302111)) e!133804)))

(declare-fun b!194493 () Bool)

(declare-fun res!162643 () Bool)

(assert (=> b!194493 (=> (not res!162643) (not e!133804))))

(assert (=> b!194493 (= res!162643 (bvsle (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)) (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302111))) (currentByte!9183 (_2!9059 lt!302111)) (currentBit!9178 (_2!9059 lt!302111)))))))

(declare-fun b!194494 () Bool)

(declare-fun e!133805 () Bool)

(assert (=> b!194494 (= e!133804 e!133805)))

(declare-fun res!162644 () Bool)

(assert (=> b!194494 (=> res!162644 e!133805)))

(assert (=> b!194494 (= res!162644 (= (size!4410 (buf!4893 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!194495 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9999 array!9999 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!194495 (= e!133805 (arrayBitRangesEq!0 (buf!4893 thiss!1204) (buf!4893 (_2!9059 lt!302111)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204))))))

(assert (= (and d!65995 res!162642) b!194493))

(assert (= (and b!194493 res!162643) b!194494))

(assert (= (and b!194494 (not res!162644)) b!194495))

(assert (=> b!194493 m!301171))

(assert (=> b!194493 m!301215))

(assert (=> b!194495 m!301171))

(assert (=> b!194495 m!301171))

(declare-fun m!301287 () Bool)

(assert (=> b!194495 m!301287))

(assert (=> b!194403 d!65995))

(declare-fun d!65997 () Bool)

(assert (=> d!65997 (isPrefixOf!0 thiss!1204 (_2!9059 lt!302111))))

(declare-fun lt!302233 () Unit!13736)

(declare-fun choose!30 (BitStream!7928 BitStream!7928 BitStream!7928) Unit!13736)

(assert (=> d!65997 (= lt!302233 (choose!30 thiss!1204 (_2!9059 lt!302130) (_2!9059 lt!302111)))))

(assert (=> d!65997 (isPrefixOf!0 thiss!1204 (_2!9059 lt!302130))))

(assert (=> d!65997 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9059 lt!302130) (_2!9059 lt!302111)) lt!302233)))

(declare-fun bs!16403 () Bool)

(assert (= bs!16403 d!65997))

(assert (=> bs!16403 m!301217))

(declare-fun m!301289 () Bool)

(assert (=> bs!16403 m!301289))

(assert (=> bs!16403 m!301229))

(assert (=> b!194403 d!65997))

(declare-fun b!194576 () Bool)

(declare-fun e!133854 () Bool)

(declare-fun lt!302524 () tuple2!16824)

(declare-fun lt!302559 () tuple2!16826)

(assert (=> b!194576 (= e!133854 (= (_1!9057 lt!302524) (_2!9058 lt!302559)))))

(declare-fun b!194577 () Bool)

(declare-fun lt!302562 () tuple2!16830)

(declare-fun lt!302552 () tuple2!16828)

(assert (=> b!194577 (= lt!302562 (readBitPure!0 (readerFrom!0 (_2!9059 lt!302552) (currentBit!9178 (_2!9059 lt!302130)) (currentByte!9183 (_2!9059 lt!302130)))))))

(declare-fun res!162707 () Bool)

(declare-fun lt!302567 () Bool)

(assert (=> b!194577 (= res!162707 (and (= (_2!9060 lt!302562) lt!302567) (= (_1!9060 lt!302562) (_2!9059 lt!302552))))))

(declare-fun e!133853 () Bool)

(assert (=> b!194577 (=> (not res!162707) (not e!133853))))

(declare-fun e!133859 () Bool)

(assert (=> b!194577 (= e!133859 e!133853)))

(declare-fun b!194578 () Bool)

(declare-fun res!162716 () Bool)

(declare-fun e!133858 () Bool)

(assert (=> b!194578 (=> (not res!162716) (not e!133858))))

(declare-fun lt!302518 () (_ BitVec 64))

(declare-fun lt!302527 () (_ BitVec 64))

(declare-fun lt!302546 () tuple2!16828)

(assert (=> b!194578 (= res!162716 (= (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302546))) (currentByte!9183 (_2!9059 lt!302546)) (currentBit!9178 (_2!9059 lt!302546))) (bvsub lt!302527 lt!302518)))))

(assert (=> b!194578 (or (= (bvand lt!302527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302518 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302527 lt!302518) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194578 (= lt!302518 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!302539 () (_ BitVec 64))

(declare-fun lt!302526 () (_ BitVec 64))

(assert (=> b!194578 (= lt!302527 (bvadd lt!302539 lt!302526))))

(assert (=> b!194578 (or (not (= (bvand lt!302539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302526 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302539 lt!302526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194578 (= lt!302526 ((_ sign_extend 32) nBits!348))))

(assert (=> b!194578 (= lt!302539 (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))))))

(declare-fun bm!3059 () Bool)

(declare-fun call!3062 () Bool)

(declare-fun lt!302533 () tuple2!16828)

(declare-fun c!9721 () Bool)

(assert (=> bm!3059 (= call!3062 (isPrefixOf!0 (_2!9059 lt!302130) (ite c!9721 (_2!9059 lt!302130) (_2!9059 lt!302533))))))

(declare-fun b!194579 () Bool)

(declare-fun e!133857 () (_ BitVec 64))

(assert (=> b!194579 (= e!133857 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!194580 () Bool)

(declare-fun res!162705 () Bool)

(assert (=> b!194580 (=> (not res!162705) (not e!133858))))

(assert (=> b!194580 (= res!162705 (= (size!4410 (buf!4893 (_2!9059 lt!302130))) (size!4410 (buf!4893 (_2!9059 lt!302546)))))))

(declare-fun b!194581 () Bool)

(declare-fun res!162712 () Bool)

(assert (=> b!194581 (= res!162712 (isPrefixOf!0 (_2!9059 lt!302130) (_2!9059 lt!302552)))))

(assert (=> b!194581 (=> (not res!162712) (not e!133859))))

(declare-fun b!194582 () Bool)

(declare-fun e!133852 () tuple2!16828)

(declare-fun Unit!13740 () Unit!13736)

(assert (=> b!194582 (= e!133852 (tuple2!16829 Unit!13740 (_2!9059 lt!302130)))))

(declare-fun lt!302536 () Unit!13736)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7928) Unit!13736)

(assert (=> b!194582 (= lt!302536 (lemmaIsPrefixRefl!0 (_2!9059 lt!302130)))))

(assert (=> b!194582 call!3062))

(declare-fun lt!302514 () Unit!13736)

(assert (=> b!194582 (= lt!302514 lt!302536)))

(declare-fun b!194584 () Bool)

(declare-fun res!162709 () Bool)

(assert (=> b!194584 (=> (not res!162709) (not e!133858))))

(assert (=> b!194584 (= res!162709 (isPrefixOf!0 (_2!9059 lt!302130) (_2!9059 lt!302546)))))

(declare-fun b!194585 () Bool)

(assert (=> b!194585 (= e!133857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!194586 () Bool)

(assert (=> b!194586 (= e!133852 (tuple2!16829 (_1!9059 lt!302533) (_2!9059 lt!302533)))))

(assert (=> b!194586 (= lt!302567 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194586 (= lt!302552 (appendBit!0 (_2!9059 lt!302130) lt!302567))))

(declare-fun res!162706 () Bool)

(assert (=> b!194586 (= res!162706 (= (size!4410 (buf!4893 (_2!9059 lt!302130))) (size!4410 (buf!4893 (_2!9059 lt!302552)))))))

(assert (=> b!194586 (=> (not res!162706) (not e!133859))))

(assert (=> b!194586 e!133859))

(declare-fun lt!302543 () tuple2!16828)

(assert (=> b!194586 (= lt!302543 lt!302552)))

(assert (=> b!194586 (= lt!302533 (appendBitsLSBFirstLoopTR!0 (_2!9059 lt!302543) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!302563 () Unit!13736)

(assert (=> b!194586 (= lt!302563 (lemmaIsPrefixTransitive!0 (_2!9059 lt!302130) (_2!9059 lt!302543) (_2!9059 lt!302533)))))

(assert (=> b!194586 call!3062))

(declare-fun lt!302540 () Unit!13736)

(assert (=> b!194586 (= lt!302540 lt!302563)))

(assert (=> b!194586 (invariant!0 (currentBit!9178 (_2!9059 lt!302130)) (currentByte!9183 (_2!9059 lt!302130)) (size!4410 (buf!4893 (_2!9059 lt!302543))))))

(declare-fun lt!302525 () BitStream!7928)

(assert (=> b!194586 (= lt!302525 (BitStream!7929 (buf!4893 (_2!9059 lt!302543)) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))))))

(assert (=> b!194586 (invariant!0 (currentBit!9178 lt!302525) (currentByte!9183 lt!302525) (size!4410 (buf!4893 (_2!9059 lt!302533))))))

(declare-fun lt!302569 () BitStream!7928)

(assert (=> b!194586 (= lt!302569 (BitStream!7929 (buf!4893 (_2!9059 lt!302533)) (currentByte!9183 lt!302525) (currentBit!9178 lt!302525)))))

(declare-fun lt!302545 () tuple2!16830)

(assert (=> b!194586 (= lt!302545 (readBitPure!0 lt!302525))))

(declare-fun lt!302532 () tuple2!16830)

(assert (=> b!194586 (= lt!302532 (readBitPure!0 lt!302569))))

(declare-fun lt!302565 () Unit!13736)

(assert (=> b!194586 (= lt!302565 (readBitPrefixLemma!0 lt!302525 (_2!9059 lt!302533)))))

(declare-fun res!162715 () Bool)

(assert (=> b!194586 (= res!162715 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302545))) (currentByte!9183 (_1!9060 lt!302545)) (currentBit!9178 (_1!9060 lt!302545))) (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302532))) (currentByte!9183 (_1!9060 lt!302532)) (currentBit!9178 (_1!9060 lt!302532)))))))

(declare-fun e!133851 () Bool)

(assert (=> b!194586 (=> (not res!162715) (not e!133851))))

(assert (=> b!194586 e!133851))

(declare-fun lt!302542 () Unit!13736)

(assert (=> b!194586 (= lt!302542 lt!302565)))

(declare-fun lt!302557 () tuple2!16826)

(assert (=> b!194586 (= lt!302557 (reader!0 (_2!9059 lt!302130) (_2!9059 lt!302533)))))

(declare-fun lt!302566 () tuple2!16826)

(assert (=> b!194586 (= lt!302566 (reader!0 (_2!9059 lt!302543) (_2!9059 lt!302533)))))

(declare-fun lt!302556 () tuple2!16830)

(assert (=> b!194586 (= lt!302556 (readBitPure!0 (_1!9058 lt!302557)))))

(assert (=> b!194586 (= (_2!9060 lt!302556) lt!302567)))

(declare-fun lt!302555 () Unit!13736)

(declare-fun Unit!13750 () Unit!13736)

(assert (=> b!194586 (= lt!302555 Unit!13750)))

(declare-fun lt!302534 () (_ BitVec 64))

(assert (=> b!194586 (= lt!302534 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302535 () (_ BitVec 64))

(assert (=> b!194586 (= lt!302535 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302520 () Unit!13736)

(assert (=> b!194586 (= lt!302520 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9059 lt!302130) (buf!4893 (_2!9059 lt!302533)) lt!302535))))

(assert (=> b!194586 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302533)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130))) lt!302535)))

(declare-fun lt!302550 () Unit!13736)

(assert (=> b!194586 (= lt!302550 lt!302520)))

(declare-fun lt!302531 () tuple2!16824)

(assert (=> b!194586 (= lt!302531 (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302557) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302534))))

(declare-fun lt!302529 () (_ BitVec 64))

(assert (=> b!194586 (= lt!302529 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!302560 () Unit!13736)

(assert (=> b!194586 (= lt!302560 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9059 lt!302543) (buf!4893 (_2!9059 lt!302533)) lt!302529))))

(assert (=> b!194586 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302533)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302543))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302543))) lt!302529)))

(declare-fun lt!302564 () Unit!13736)

(assert (=> b!194586 (= lt!302564 lt!302560)))

(declare-fun lt!302551 () tuple2!16824)

(assert (=> b!194586 (= lt!302551 (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302566) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!302534 (ite (_2!9060 lt!302556) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!302530 () tuple2!16824)

(assert (=> b!194586 (= lt!302530 (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302557) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302534))))

(declare-fun c!9720 () Bool)

(assert (=> b!194586 (= c!9720 (_2!9060 (readBitPure!0 (_1!9058 lt!302557))))))

(declare-fun lt!302558 () tuple2!16824)

(assert (=> b!194586 (= lt!302558 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9058 lt!302557) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!302534 e!133857)))))

(declare-fun lt!302561 () Unit!13736)

(assert (=> b!194586 (= lt!302561 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9058 lt!302557) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302534))))

(assert (=> b!194586 (and (= (_2!9057 lt!302530) (_2!9057 lt!302558)) (= (_1!9057 lt!302530) (_1!9057 lt!302558)))))

(declare-fun lt!302521 () Unit!13736)

(assert (=> b!194586 (= lt!302521 lt!302561)))

(assert (=> b!194586 (= (_1!9058 lt!302557) (withMovedBitIndex!0 (_2!9058 lt!302557) (bvsub (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))) (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302533))) (currentByte!9183 (_2!9059 lt!302533)) (currentBit!9178 (_2!9059 lt!302533))))))))

(declare-fun lt!302519 () Unit!13736)

(declare-fun Unit!13751 () Unit!13736)

(assert (=> b!194586 (= lt!302519 Unit!13751)))

(assert (=> b!194586 (= (_1!9058 lt!302566) (withMovedBitIndex!0 (_2!9058 lt!302566) (bvsub (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302543))) (currentByte!9183 (_2!9059 lt!302543)) (currentBit!9178 (_2!9059 lt!302543))) (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302533))) (currentByte!9183 (_2!9059 lt!302533)) (currentBit!9178 (_2!9059 lt!302533))))))))

(declare-fun lt!302523 () Unit!13736)

(declare-fun Unit!13752 () Unit!13736)

(assert (=> b!194586 (= lt!302523 Unit!13752)))

(assert (=> b!194586 (= (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))) (bvsub (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302543))) (currentByte!9183 (_2!9059 lt!302543)) (currentBit!9178 (_2!9059 lt!302543))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!302547 () Unit!13736)

(declare-fun Unit!13753 () Unit!13736)

(assert (=> b!194586 (= lt!302547 Unit!13753)))

(assert (=> b!194586 (= (_2!9057 lt!302531) (_2!9057 lt!302551))))

(declare-fun lt!302522 () Unit!13736)

(declare-fun Unit!13754 () Unit!13736)

(assert (=> b!194586 (= lt!302522 Unit!13754)))

(assert (=> b!194586 (invariant!0 (currentBit!9178 (_2!9059 lt!302533)) (currentByte!9183 (_2!9059 lt!302533)) (size!4410 (buf!4893 (_2!9059 lt!302533))))))

(declare-fun lt!302537 () Unit!13736)

(declare-fun Unit!13755 () Unit!13736)

(assert (=> b!194586 (= lt!302537 Unit!13755)))

(assert (=> b!194586 (= (size!4410 (buf!4893 (_2!9059 lt!302130))) (size!4410 (buf!4893 (_2!9059 lt!302533))))))

(declare-fun lt!302554 () Unit!13736)

(declare-fun Unit!13756 () Unit!13736)

(assert (=> b!194586 (= lt!302554 Unit!13756)))

(assert (=> b!194586 (= (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302533))) (currentByte!9183 (_2!9059 lt!302533)) (currentBit!9178 (_2!9059 lt!302533))) (bvsub (bvadd (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302541 () Unit!13736)

(declare-fun Unit!13757 () Unit!13736)

(assert (=> b!194586 (= lt!302541 Unit!13757)))

(declare-fun lt!302528 () Unit!13736)

(declare-fun Unit!13758 () Unit!13736)

(assert (=> b!194586 (= lt!302528 Unit!13758)))

(assert (=> b!194586 (= lt!302559 (reader!0 (_2!9059 lt!302130) (_2!9059 lt!302533)))))

(declare-fun lt!302517 () (_ BitVec 64))

(assert (=> b!194586 (= lt!302517 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!302515 () Unit!13736)

(assert (=> b!194586 (= lt!302515 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9059 lt!302130) (buf!4893 (_2!9059 lt!302533)) lt!302517))))

(assert (=> b!194586 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302533)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130))) lt!302517)))

(declare-fun lt!302568 () Unit!13736)

(assert (=> b!194586 (= lt!302568 lt!302515)))

(assert (=> b!194586 (= lt!302524 (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302559) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!162714 () Bool)

(assert (=> b!194586 (= res!162714 (= (_2!9057 lt!302524) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!194586 (=> (not res!162714) (not e!133854))))

(assert (=> b!194586 e!133854))

(declare-fun lt!302549 () Unit!13736)

(declare-fun Unit!13759 () Unit!13736)

(assert (=> b!194586 (= lt!302549 Unit!13759)))

(declare-fun b!194587 () Bool)

(declare-fun e!133856 () Bool)

(declare-fun lt!302553 () (_ BitVec 64))

(assert (=> b!194587 (= e!133856 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302130)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130))) lt!302553))))

(declare-fun b!194588 () Bool)

(assert (=> b!194588 (= e!133853 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302562))) (currentByte!9183 (_1!9060 lt!302562)) (currentBit!9178 (_1!9060 lt!302562))) (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302552))) (currentByte!9183 (_2!9059 lt!302552)) (currentBit!9178 (_2!9059 lt!302552)))))))

(declare-fun b!194589 () Bool)

(assert (=> b!194589 (= e!133851 (= (_2!9060 lt!302545) (_2!9060 lt!302532)))))

(declare-fun b!194590 () Bool)

(declare-fun res!162708 () Bool)

(assert (=> b!194590 (= res!162708 (= (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302552))) (currentByte!9183 (_2!9059 lt!302552)) (currentBit!9178 (_2!9059 lt!302552))) (bvadd (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!194590 (=> (not res!162708) (not e!133859))))

(declare-fun b!194591 () Bool)

(declare-fun e!133855 () Bool)

(declare-fun lt!302548 () tuple2!16824)

(declare-fun lt!302538 () tuple2!16826)

(assert (=> b!194591 (= e!133855 (= (_1!9057 lt!302548) (_2!9058 lt!302538)))))

(declare-fun b!194583 () Bool)

(assert (=> b!194583 (= e!133858 e!133855)))

(declare-fun res!162713 () Bool)

(assert (=> b!194583 (=> (not res!162713) (not e!133855))))

(assert (=> b!194583 (= res!162713 (= (_2!9057 lt!302548) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!194583 (= lt!302548 (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302538) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!302544 () Unit!13736)

(declare-fun lt!302516 () Unit!13736)

(assert (=> b!194583 (= lt!302544 lt!302516)))

(assert (=> b!194583 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302546)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130))) lt!302553)))

(assert (=> b!194583 (= lt!302516 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9059 lt!302130) (buf!4893 (_2!9059 lt!302546)) lt!302553))))

(assert (=> b!194583 e!133856))

(declare-fun res!162711 () Bool)

(assert (=> b!194583 (=> (not res!162711) (not e!133856))))

(assert (=> b!194583 (= res!162711 (and (= (size!4410 (buf!4893 (_2!9059 lt!302130))) (size!4410 (buf!4893 (_2!9059 lt!302546)))) (bvsge lt!302553 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194583 (= lt!302553 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!194583 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!194583 (= lt!302538 (reader!0 (_2!9059 lt!302130) (_2!9059 lt!302546)))))

(declare-fun d!65999 () Bool)

(assert (=> d!65999 e!133858))

(declare-fun res!162710 () Bool)

(assert (=> d!65999 (=> (not res!162710) (not e!133858))))

(assert (=> d!65999 (= res!162710 (invariant!0 (currentBit!9178 (_2!9059 lt!302546)) (currentByte!9183 (_2!9059 lt!302546)) (size!4410 (buf!4893 (_2!9059 lt!302546)))))))

(assert (=> d!65999 (= lt!302546 e!133852)))

(assert (=> d!65999 (= c!9721 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65999 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65999 (= (appendBitsLSBFirstLoopTR!0 (_2!9059 lt!302130) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!302546)))

(assert (= (and d!65999 c!9721) b!194582))

(assert (= (and d!65999 (not c!9721)) b!194586))

(assert (= (and b!194586 res!162706) b!194590))

(assert (= (and b!194590 res!162708) b!194581))

(assert (= (and b!194581 res!162712) b!194577))

(assert (= (and b!194577 res!162707) b!194588))

(assert (= (and b!194586 res!162715) b!194589))

(assert (= (and b!194586 c!9720) b!194579))

(assert (= (and b!194586 (not c!9720)) b!194585))

(assert (= (and b!194586 res!162714) b!194576))

(assert (= (or b!194582 b!194586) bm!3059))

(assert (= (and d!65999 res!162710) b!194580))

(assert (= (and b!194580 res!162705) b!194578))

(assert (= (and b!194578 res!162716) b!194584))

(assert (= (and b!194584 res!162709) b!194583))

(assert (= (and b!194583 res!162711) b!194587))

(assert (= (and b!194583 res!162713) b!194591))

(declare-fun m!301383 () Bool)

(assert (=> b!194578 m!301383))

(assert (=> b!194578 m!301169))

(declare-fun m!301385 () Bool)

(assert (=> b!194586 m!301385))

(declare-fun m!301387 () Bool)

(assert (=> b!194586 m!301387))

(declare-fun m!301389 () Bool)

(assert (=> b!194586 m!301389))

(assert (=> b!194586 m!301239))

(declare-fun m!301391 () Bool)

(assert (=> b!194586 m!301391))

(declare-fun m!301393 () Bool)

(assert (=> b!194586 m!301393))

(declare-fun m!301395 () Bool)

(assert (=> b!194586 m!301395))

(declare-fun m!301397 () Bool)

(assert (=> b!194586 m!301397))

(declare-fun m!301399 () Bool)

(assert (=> b!194586 m!301399))

(declare-fun m!301401 () Bool)

(assert (=> b!194586 m!301401))

(declare-fun m!301403 () Bool)

(assert (=> b!194586 m!301403))

(declare-fun m!301405 () Bool)

(assert (=> b!194586 m!301405))

(declare-fun m!301407 () Bool)

(assert (=> b!194586 m!301407))

(declare-fun m!301409 () Bool)

(assert (=> b!194586 m!301409))

(declare-fun m!301411 () Bool)

(assert (=> b!194586 m!301411))

(assert (=> b!194586 m!301399))

(declare-fun m!301413 () Bool)

(assert (=> b!194586 m!301413))

(declare-fun m!301415 () Bool)

(assert (=> b!194586 m!301415))

(declare-fun m!301417 () Bool)

(assert (=> b!194586 m!301417))

(declare-fun m!301419 () Bool)

(assert (=> b!194586 m!301419))

(declare-fun m!301421 () Bool)

(assert (=> b!194586 m!301421))

(declare-fun m!301423 () Bool)

(assert (=> b!194586 m!301423))

(declare-fun m!301425 () Bool)

(assert (=> b!194586 m!301425))

(declare-fun m!301427 () Bool)

(assert (=> b!194586 m!301427))

(declare-fun m!301429 () Bool)

(assert (=> b!194586 m!301429))

(declare-fun m!301431 () Bool)

(assert (=> b!194586 m!301431))

(declare-fun m!301433 () Bool)

(assert (=> b!194586 m!301433))

(declare-fun m!301435 () Bool)

(assert (=> b!194586 m!301435))

(declare-fun m!301437 () Bool)

(assert (=> b!194586 m!301437))

(assert (=> b!194586 m!301169))

(declare-fun m!301439 () Bool)

(assert (=> b!194586 m!301439))

(declare-fun m!301441 () Bool)

(assert (=> b!194586 m!301441))

(declare-fun m!301443 () Bool)

(assert (=> b!194586 m!301443))

(declare-fun m!301445 () Bool)

(assert (=> b!194586 m!301445))

(declare-fun m!301447 () Bool)

(assert (=> b!194590 m!301447))

(assert (=> b!194590 m!301169))

(declare-fun m!301449 () Bool)

(assert (=> b!194581 m!301449))

(declare-fun m!301451 () Bool)

(assert (=> b!194584 m!301451))

(declare-fun m!301453 () Bool)

(assert (=> b!194577 m!301453))

(assert (=> b!194577 m!301453))

(declare-fun m!301455 () Bool)

(assert (=> b!194577 m!301455))

(declare-fun m!301457 () Bool)

(assert (=> b!194588 m!301457))

(assert (=> b!194588 m!301447))

(declare-fun m!301459 () Bool)

(assert (=> b!194587 m!301459))

(declare-fun m!301461 () Bool)

(assert (=> d!65999 m!301461))

(declare-fun m!301463 () Bool)

(assert (=> b!194582 m!301463))

(assert (=> b!194583 m!301385))

(assert (=> b!194583 m!301239))

(declare-fun m!301465 () Bool)

(assert (=> b!194583 m!301465))

(declare-fun m!301467 () Bool)

(assert (=> b!194583 m!301467))

(declare-fun m!301469 () Bool)

(assert (=> b!194583 m!301469))

(declare-fun m!301471 () Bool)

(assert (=> b!194583 m!301471))

(declare-fun m!301473 () Bool)

(assert (=> bm!3059 m!301473))

(assert (=> b!194403 d!65999))

(declare-fun d!66003 () Bool)

(assert (=> d!66003 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204) (size!4410 (buf!4893 thiss!1204))))))

(declare-fun bs!16404 () Bool)

(assert (= bs!16404 d!66003))

(assert (=> bs!16404 m!301155))

(assert (=> start!41430 d!66003))

(declare-fun d!66005 () Bool)

(declare-fun lt!302604 () tuple2!16824)

(declare-fun lt!302603 () tuple2!16824)

(assert (=> d!66005 (and (= (_2!9057 lt!302604) (_2!9057 lt!302603)) (= (_1!9057 lt!302604) (_1!9057 lt!302603)))))

(declare-fun lt!302599 () (_ BitVec 64))

(declare-fun lt!302601 () BitStream!7928)

(declare-fun lt!302600 () Unit!13736)

(declare-fun lt!302602 () Bool)

(declare-fun choose!56 (BitStream!7928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16824 tuple2!16824 BitStream!7928 (_ BitVec 64) Bool BitStream!7928 (_ BitVec 64) tuple2!16824 tuple2!16824 BitStream!7928 (_ BitVec 64)) Unit!13736)

(assert (=> d!66005 (= lt!302600 (choose!56 (_1!9058 lt!302123) nBits!348 i!590 lt!302117 lt!302604 (tuple2!16825 (_1!9057 lt!302604) (_2!9057 lt!302604)) (_1!9057 lt!302604) (_2!9057 lt!302604) lt!302602 lt!302601 lt!302599 lt!302603 (tuple2!16825 (_1!9057 lt!302603) (_2!9057 lt!302603)) (_1!9057 lt!302603) (_2!9057 lt!302603)))))

(assert (=> d!66005 (= lt!302603 (readNBitsLSBFirstsLoopPure!0 lt!302601 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!302599))))

(assert (=> d!66005 (= lt!302599 (bvor lt!302117 (ite lt!302602 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66005 (= lt!302601 (withMovedBitIndex!0 (_1!9058 lt!302123) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!66005 (= lt!302602 (_2!9060 (readBitPure!0 (_1!9058 lt!302123))))))

(assert (=> d!66005 (= lt!302604 (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302123) nBits!348 i!590 lt!302117))))

(assert (=> d!66005 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9058 lt!302123) nBits!348 i!590 lt!302117) lt!302600)))

(declare-fun bs!16407 () Bool)

(assert (= bs!16407 d!66005))

(assert (=> bs!16407 m!301193))

(assert (=> bs!16407 m!301189))

(declare-fun m!301499 () Bool)

(assert (=> bs!16407 m!301499))

(declare-fun m!301505 () Bool)

(assert (=> bs!16407 m!301505))

(assert (=> bs!16407 m!301165))

(assert (=> b!194405 d!66005))

(declare-datatypes ((tuple2!16836 0))(
  ( (tuple2!16837 (_1!9063 (_ BitVec 64)) (_2!9063 BitStream!7928)) )
))
(declare-fun lt!302621 () tuple2!16836)

(declare-fun d!66025 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16836)

(assert (=> d!66025 (= lt!302621 (readNBitsLSBFirstsLoop!0 lt!302114 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302129))))

(assert (=> d!66025 (= (readNBitsLSBFirstsLoopPure!0 lt!302114 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302129) (tuple2!16825 (_2!9063 lt!302621) (_1!9063 lt!302621)))))

(declare-fun bs!16409 () Bool)

(assert (= bs!16409 d!66025))

(declare-fun m!301509 () Bool)

(assert (=> bs!16409 m!301509))

(assert (=> b!194405 d!66025))

(declare-fun d!66031 () Bool)

(declare-fun e!133883 () Bool)

(assert (=> d!66031 e!133883))

(declare-fun res!162747 () Bool)

(assert (=> d!66031 (=> (not res!162747) (not e!133883))))

(declare-fun lt!302671 () (_ BitVec 64))

(declare-fun lt!302670 () BitStream!7928)

(assert (=> d!66031 (= res!162747 (= (bvadd lt!302671 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4410 (buf!4893 lt!302670)) (currentByte!9183 lt!302670) (currentBit!9178 lt!302670))))))

(assert (=> d!66031 (or (not (= (bvand lt!302671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302671 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66031 (= lt!302671 (bitIndex!0 (size!4410 (buf!4893 (_1!9058 lt!302123))) (currentByte!9183 (_1!9058 lt!302123)) (currentBit!9178 (_1!9058 lt!302123))))))

(declare-fun moveBitIndex!0 (BitStream!7928 (_ BitVec 64)) tuple2!16828)

(assert (=> d!66031 (= lt!302670 (_2!9059 (moveBitIndex!0 (_1!9058 lt!302123) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7928 (_ BitVec 64)) Bool)

(assert (=> d!66031 (moveBitIndexPrecond!0 (_1!9058 lt!302123) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!66031 (= (withMovedBitIndex!0 (_1!9058 lt!302123) #b0000000000000000000000000000000000000000000000000000000000000001) lt!302670)))

(declare-fun b!194625 () Bool)

(assert (=> b!194625 (= e!133883 (= (size!4410 (buf!4893 (_1!9058 lt!302123))) (size!4410 (buf!4893 lt!302670))))))

(assert (= (and d!66031 res!162747) b!194625))

(declare-fun m!301511 () Bool)

(assert (=> d!66031 m!301511))

(declare-fun m!301513 () Bool)

(assert (=> d!66031 m!301513))

(declare-fun m!301515 () Bool)

(assert (=> d!66031 m!301515))

(declare-fun m!301517 () Bool)

(assert (=> d!66031 m!301517))

(assert (=> b!194405 d!66031))

(declare-fun d!66033 () Bool)

(declare-datatypes ((tuple2!16838 0))(
  ( (tuple2!16839 (_1!9064 Bool) (_2!9064 BitStream!7928)) )
))
(declare-fun lt!302704 () tuple2!16838)

(declare-fun readBit!0 (BitStream!7928) tuple2!16838)

(assert (=> d!66033 (= lt!302704 (readBit!0 (readerFrom!0 (_2!9059 lt!302130) (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204))))))

(assert (=> d!66033 (= (readBitPure!0 (readerFrom!0 (_2!9059 lt!302130) (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204))) (tuple2!16831 (_2!9064 lt!302704) (_1!9064 lt!302704)))))

(declare-fun bs!16412 () Bool)

(assert (= bs!16412 d!66033))

(assert (=> bs!16412 m!301231))

(declare-fun m!301523 () Bool)

(assert (=> bs!16412 m!301523))

(assert (=> b!194404 d!66033))

(declare-fun d!66037 () Bool)

(declare-fun e!133889 () Bool)

(assert (=> d!66037 e!133889))

(declare-fun res!162752 () Bool)

(assert (=> d!66037 (=> (not res!162752) (not e!133889))))

(assert (=> d!66037 (= res!162752 (invariant!0 (currentBit!9178 (_2!9059 lt!302130)) (currentByte!9183 (_2!9059 lt!302130)) (size!4410 (buf!4893 (_2!9059 lt!302130)))))))

(assert (=> d!66037 (= (readerFrom!0 (_2!9059 lt!302130) (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204)) (BitStream!7929 (buf!4893 (_2!9059 lt!302130)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)))))

(declare-fun b!194633 () Bool)

(assert (=> b!194633 (= e!133889 (invariant!0 (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204) (size!4410 (buf!4893 (_2!9059 lt!302130)))))))

(assert (= (and d!66037 res!162752) b!194633))

(declare-fun m!301533 () Bool)

(assert (=> d!66037 m!301533))

(assert (=> b!194633 m!301181))

(assert (=> b!194404 d!66037))

(declare-fun d!66043 () Bool)

(declare-fun e!133892 () Bool)

(assert (=> d!66043 e!133892))

(declare-fun res!162756 () Bool)

(assert (=> d!66043 (=> (not res!162756) (not e!133892))))

(declare-fun lt!302740 () (_ BitVec 64))

(declare-fun lt!302743 () (_ BitVec 64))

(declare-fun lt!302744 () (_ BitVec 64))

(assert (=> d!66043 (= res!162756 (= lt!302744 (bvsub lt!302740 lt!302743)))))

(assert (=> d!66043 (or (= (bvand lt!302740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302743 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302740 lt!302743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66043 (= lt!302743 (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302130)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130)))))))

(declare-fun lt!302741 () (_ BitVec 64))

(declare-fun lt!302745 () (_ BitVec 64))

(assert (=> d!66043 (= lt!302740 (bvmul lt!302741 lt!302745))))

(assert (=> d!66043 (or (= lt!302741 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302745 (bvsdiv (bvmul lt!302741 lt!302745) lt!302741)))))

(assert (=> d!66043 (= lt!302745 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66043 (= lt!302741 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302130)))))))

(assert (=> d!66043 (= lt!302744 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130)))))))

(assert (=> d!66043 (invariant!0 (currentBit!9178 (_2!9059 lt!302130)) (currentByte!9183 (_2!9059 lt!302130)) (size!4410 (buf!4893 (_2!9059 lt!302130))))))

(assert (=> d!66043 (= (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))) lt!302744)))

(declare-fun b!194634 () Bool)

(declare-fun res!162754 () Bool)

(assert (=> b!194634 (=> (not res!162754) (not e!133892))))

(assert (=> b!194634 (= res!162754 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302744))))

(declare-fun b!194635 () Bool)

(declare-fun lt!302742 () (_ BitVec 64))

(assert (=> b!194635 (= e!133892 (bvsle lt!302744 (bvmul lt!302742 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194635 (or (= lt!302742 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302742 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302742)))))

(assert (=> b!194635 (= lt!302742 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302130)))))))

(assert (= (and d!66043 res!162756) b!194634))

(assert (= (and b!194634 res!162754) b!194635))

(declare-fun m!301539 () Bool)

(assert (=> d!66043 m!301539))

(assert (=> d!66043 m!301533))

(assert (=> b!194415 d!66043))

(declare-fun d!66049 () Bool)

(declare-fun e!133893 () Bool)

(assert (=> d!66049 e!133893))

(declare-fun res!162758 () Bool)

(assert (=> d!66049 (=> (not res!162758) (not e!133893))))

(declare-fun lt!302750 () (_ BitVec 64))

(declare-fun lt!302746 () (_ BitVec 64))

(declare-fun lt!302749 () (_ BitVec 64))

(assert (=> d!66049 (= res!162758 (= lt!302750 (bvsub lt!302746 lt!302749)))))

(assert (=> d!66049 (or (= (bvand lt!302746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302746 lt!302749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66049 (= lt!302749 (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 thiss!1204))) ((_ sign_extend 32) (currentByte!9183 thiss!1204)) ((_ sign_extend 32) (currentBit!9178 thiss!1204))))))

(declare-fun lt!302747 () (_ BitVec 64))

(declare-fun lt!302751 () (_ BitVec 64))

(assert (=> d!66049 (= lt!302746 (bvmul lt!302747 lt!302751))))

(assert (=> d!66049 (or (= lt!302747 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302751 (bvsdiv (bvmul lt!302747 lt!302751) lt!302747)))))

(assert (=> d!66049 (= lt!302751 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66049 (= lt!302747 ((_ sign_extend 32) (size!4410 (buf!4893 thiss!1204))))))

(assert (=> d!66049 (= lt!302750 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9183 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9178 thiss!1204))))))

(assert (=> d!66049 (invariant!0 (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204) (size!4410 (buf!4893 thiss!1204)))))

(assert (=> d!66049 (= (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)) lt!302750)))

(declare-fun b!194638 () Bool)

(declare-fun res!162757 () Bool)

(assert (=> b!194638 (=> (not res!162757) (not e!133893))))

(assert (=> b!194638 (= res!162757 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302750))))

(declare-fun b!194639 () Bool)

(declare-fun lt!302748 () (_ BitVec 64))

(assert (=> b!194639 (= e!133893 (bvsle lt!302750 (bvmul lt!302748 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194639 (or (= lt!302748 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302748 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302748)))))

(assert (=> b!194639 (= lt!302748 ((_ sign_extend 32) (size!4410 (buf!4893 thiss!1204))))))

(assert (= (and d!66049 res!162758) b!194638))

(assert (= (and b!194638 res!162757) b!194639))

(declare-fun m!301541 () Bool)

(assert (=> d!66049 m!301541))

(assert (=> d!66049 m!301155))

(assert (=> b!194415 d!66049))

(declare-fun d!66051 () Bool)

(assert (=> d!66051 (= (array_inv!4151 (buf!4893 thiss!1204)) (bvsge (size!4410 (buf!4893 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!194417 d!66051))

(declare-fun d!66053 () Bool)

(assert (=> d!66053 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!194416 d!66053))

(declare-fun d!66055 () Bool)

(assert (=> d!66055 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 thiss!1204))) ((_ sign_extend 32) (currentByte!9183 thiss!1204)) ((_ sign_extend 32) (currentBit!9178 thiss!1204)) lt!302125) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 thiss!1204))) ((_ sign_extend 32) (currentByte!9183 thiss!1204)) ((_ sign_extend 32) (currentBit!9178 thiss!1204))) lt!302125))))

(declare-fun bs!16417 () Bool)

(assert (= bs!16417 d!66055))

(assert (=> bs!16417 m!301541))

(assert (=> b!194418 d!66055))

(assert (=> b!194407 d!66043))

(assert (=> b!194407 d!66049))

(declare-fun b!194665 () Bool)

(declare-fun e!133905 () Bool)

(declare-fun e!133906 () Bool)

(assert (=> b!194665 (= e!133905 e!133906)))

(declare-fun res!162781 () Bool)

(assert (=> b!194665 (=> (not res!162781) (not e!133906))))

(declare-fun lt!302790 () tuple2!16828)

(declare-fun lt!302791 () tuple2!16830)

(assert (=> b!194665 (= res!162781 (and (= (_2!9060 lt!302791) lt!302109) (= (_1!9060 lt!302791) (_2!9059 lt!302790))))))

(assert (=> b!194665 (= lt!302791 (readBitPure!0 (readerFrom!0 (_2!9059 lt!302790) (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204))))))

(declare-fun b!194666 () Bool)

(assert (=> b!194666 (= e!133906 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302791))) (currentByte!9183 (_1!9060 lt!302791)) (currentBit!9178 (_1!9060 lt!302791))) (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302790))) (currentByte!9183 (_2!9059 lt!302790)) (currentBit!9178 (_2!9059 lt!302790)))))))

(declare-fun b!194664 () Bool)

(declare-fun res!162784 () Bool)

(assert (=> b!194664 (=> (not res!162784) (not e!133905))))

(assert (=> b!194664 (= res!162784 (isPrefixOf!0 thiss!1204 (_2!9059 lt!302790)))))

(declare-fun d!66061 () Bool)

(assert (=> d!66061 e!133905))

(declare-fun res!162783 () Bool)

(assert (=> d!66061 (=> (not res!162783) (not e!133905))))

(assert (=> d!66061 (= res!162783 (= (size!4410 (buf!4893 thiss!1204)) (size!4410 (buf!4893 (_2!9059 lt!302790)))))))

(declare-fun choose!16 (BitStream!7928 Bool) tuple2!16828)

(assert (=> d!66061 (= lt!302790 (choose!16 thiss!1204 lt!302109))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66061 (validate_offset_bit!0 ((_ sign_extend 32) (size!4410 (buf!4893 thiss!1204))) ((_ sign_extend 32) (currentByte!9183 thiss!1204)) ((_ sign_extend 32) (currentBit!9178 thiss!1204)))))

(assert (=> d!66061 (= (appendBit!0 thiss!1204 lt!302109) lt!302790)))

(declare-fun b!194663 () Bool)

(declare-fun res!162782 () Bool)

(assert (=> b!194663 (=> (not res!162782) (not e!133905))))

(declare-fun lt!302792 () (_ BitVec 64))

(declare-fun lt!302789 () (_ BitVec 64))

(assert (=> b!194663 (= res!162782 (= (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302790))) (currentByte!9183 (_2!9059 lt!302790)) (currentBit!9178 (_2!9059 lt!302790))) (bvadd lt!302792 lt!302789)))))

(assert (=> b!194663 (or (not (= (bvand lt!302792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302789 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302792 lt!302789) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194663 (= lt!302789 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!194663 (= lt!302792 (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)))))

(assert (= (and d!66061 res!162783) b!194663))

(assert (= (and b!194663 res!162782) b!194664))

(assert (= (and b!194664 res!162784) b!194665))

(assert (= (and b!194665 res!162781) b!194666))

(declare-fun m!301553 () Bool)

(assert (=> b!194664 m!301553))

(declare-fun m!301555 () Bool)

(assert (=> b!194665 m!301555))

(assert (=> b!194665 m!301555))

(declare-fun m!301557 () Bool)

(assert (=> b!194665 m!301557))

(declare-fun m!301559 () Bool)

(assert (=> d!66061 m!301559))

(declare-fun m!301561 () Bool)

(assert (=> d!66061 m!301561))

(declare-fun m!301563 () Bool)

(assert (=> b!194663 m!301563))

(assert (=> b!194663 m!301171))

(declare-fun m!301565 () Bool)

(assert (=> b!194666 m!301565))

(assert (=> b!194666 m!301563))

(assert (=> b!194407 d!66061))

(declare-fun d!66067 () Bool)

(assert (=> d!66067 (= (invariant!0 (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204) (size!4410 (buf!4893 thiss!1204))) (and (bvsge (currentBit!9178 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9178 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9183 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9183 thiss!1204) (size!4410 (buf!4893 thiss!1204))) (and (= (currentBit!9178 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9183 thiss!1204) (size!4410 (buf!4893 thiss!1204)))))))))

(assert (=> b!194409 d!66067))

(declare-fun d!66069 () Bool)

(assert (=> d!66069 (= (invariant!0 (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204) (size!4410 (buf!4893 (_2!9059 lt!302111)))) (and (bvsge (currentBit!9178 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9178 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9183 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9183 thiss!1204) (size!4410 (buf!4893 (_2!9059 lt!302111)))) (and (= (currentBit!9178 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9183 thiss!1204) (size!4410 (buf!4893 (_2!9059 lt!302111))))))))))

(assert (=> b!194408 d!66069))

(declare-fun d!66071 () Bool)

(assert (=> d!66071 (= (invariant!0 (currentBit!9178 (_2!9059 lt!302111)) (currentByte!9183 (_2!9059 lt!302111)) (size!4410 (buf!4893 (_2!9059 lt!302111)))) (and (bvsge (currentBit!9178 (_2!9059 lt!302111)) #b00000000000000000000000000000000) (bvslt (currentBit!9178 (_2!9059 lt!302111)) #b00000000000000000000000000001000) (bvsge (currentByte!9183 (_2!9059 lt!302111)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9183 (_2!9059 lt!302111)) (size!4410 (buf!4893 (_2!9059 lt!302111)))) (and (= (currentBit!9178 (_2!9059 lt!302111)) #b00000000000000000000000000000000) (= (currentByte!9183 (_2!9059 lt!302111)) (size!4410 (buf!4893 (_2!9059 lt!302111))))))))))

(assert (=> b!194419 d!66071))

(declare-fun d!66073 () Bool)

(assert (=> d!66073 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!194410 d!66073))

(declare-fun d!66075 () Bool)

(declare-fun e!133907 () Bool)

(assert (=> d!66075 e!133907))

(declare-fun res!162785 () Bool)

(assert (=> d!66075 (=> (not res!162785) (not e!133907))))

(declare-fun lt!302794 () (_ BitVec 64))

(declare-fun lt!302793 () BitStream!7928)

(assert (=> d!66075 (= res!162785 (= (bvadd lt!302794 (bvsub lt!302115 lt!302113)) (bitIndex!0 (size!4410 (buf!4893 lt!302793)) (currentByte!9183 lt!302793) (currentBit!9178 lt!302793))))))

(assert (=> d!66075 (or (not (= (bvand lt!302794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302115 lt!302113) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302794 (bvsub lt!302115 lt!302113)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66075 (= lt!302794 (bitIndex!0 (size!4410 (buf!4893 (_2!9058 lt!302133))) (currentByte!9183 (_2!9058 lt!302133)) (currentBit!9178 (_2!9058 lt!302133))))))

(assert (=> d!66075 (= lt!302793 (_2!9059 (moveBitIndex!0 (_2!9058 lt!302133) (bvsub lt!302115 lt!302113))))))

(assert (=> d!66075 (moveBitIndexPrecond!0 (_2!9058 lt!302133) (bvsub lt!302115 lt!302113))))

(assert (=> d!66075 (= (withMovedBitIndex!0 (_2!9058 lt!302133) (bvsub lt!302115 lt!302113)) lt!302793)))

(declare-fun b!194667 () Bool)

(assert (=> b!194667 (= e!133907 (= (size!4410 (buf!4893 (_2!9058 lt!302133))) (size!4410 (buf!4893 lt!302793))))))

(assert (= (and d!66075 res!162785) b!194667))

(declare-fun m!301567 () Bool)

(assert (=> d!66075 m!301567))

(declare-fun m!301569 () Bool)

(assert (=> d!66075 m!301569))

(declare-fun m!301571 () Bool)

(assert (=> d!66075 m!301571))

(declare-fun m!301573 () Bool)

(assert (=> d!66075 m!301573))

(assert (=> b!194421 d!66075))

(declare-fun d!66077 () Bool)

(declare-fun e!133917 () Bool)

(assert (=> d!66077 e!133917))

(declare-fun res!162799 () Bool)

(assert (=> d!66077 (=> (not res!162799) (not e!133917))))

(declare-fun lt!302855 () (_ BitVec 64))

(declare-fun lt!302851 () (_ BitVec 64))

(declare-fun lt!302854 () (_ BitVec 64))

(assert (=> d!66077 (= res!162799 (= lt!302855 (bvsub lt!302851 lt!302854)))))

(assert (=> d!66077 (or (= (bvand lt!302851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302854 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302851 lt!302854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66077 (= lt!302854 (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9057 lt!302106)))) ((_ sign_extend 32) (currentByte!9183 (_1!9057 lt!302106))) ((_ sign_extend 32) (currentBit!9178 (_1!9057 lt!302106)))))))

(declare-fun lt!302852 () (_ BitVec 64))

(declare-fun lt!302856 () (_ BitVec 64))

(assert (=> d!66077 (= lt!302851 (bvmul lt!302852 lt!302856))))

(assert (=> d!66077 (or (= lt!302852 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302856 (bvsdiv (bvmul lt!302852 lt!302856) lt!302852)))))

(assert (=> d!66077 (= lt!302856 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66077 (= lt!302852 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9057 lt!302106)))))))

(assert (=> d!66077 (= lt!302855 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9183 (_1!9057 lt!302106))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9178 (_1!9057 lt!302106)))))))

(assert (=> d!66077 (invariant!0 (currentBit!9178 (_1!9057 lt!302106)) (currentByte!9183 (_1!9057 lt!302106)) (size!4410 (buf!4893 (_1!9057 lt!302106))))))

(assert (=> d!66077 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9057 lt!302106))) (currentByte!9183 (_1!9057 lt!302106)) (currentBit!9178 (_1!9057 lt!302106))) lt!302855)))

(declare-fun b!194684 () Bool)

(declare-fun res!162798 () Bool)

(assert (=> b!194684 (=> (not res!162798) (not e!133917))))

(assert (=> b!194684 (= res!162798 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302855))))

(declare-fun b!194685 () Bool)

(declare-fun lt!302853 () (_ BitVec 64))

(assert (=> b!194685 (= e!133917 (bvsle lt!302855 (bvmul lt!302853 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194685 (or (= lt!302853 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302853 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302853)))))

(assert (=> b!194685 (= lt!302853 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9057 lt!302106)))))))

(assert (= (and d!66077 res!162799) b!194684))

(assert (= (and b!194684 res!162798) b!194685))

(declare-fun m!301575 () Bool)

(assert (=> d!66077 m!301575))

(declare-fun m!301577 () Bool)

(assert (=> d!66077 m!301577))

(assert (=> b!194420 d!66077))

(declare-fun d!66079 () Bool)

(declare-fun e!133918 () Bool)

(assert (=> d!66079 e!133918))

(declare-fun res!162801 () Bool)

(assert (=> d!66079 (=> (not res!162801) (not e!133918))))

(declare-fun lt!302860 () (_ BitVec 64))

(declare-fun lt!302857 () (_ BitVec 64))

(declare-fun lt!302861 () (_ BitVec 64))

(assert (=> d!66079 (= res!162801 (= lt!302861 (bvsub lt!302857 lt!302860)))))

(assert (=> d!66079 (or (= (bvand lt!302857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!302860 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!302857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302857 lt!302860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66079 (= lt!302860 (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9058 lt!302123)))) ((_ sign_extend 32) (currentByte!9183 (_2!9058 lt!302123))) ((_ sign_extend 32) (currentBit!9178 (_2!9058 lt!302123)))))))

(declare-fun lt!302858 () (_ BitVec 64))

(declare-fun lt!302862 () (_ BitVec 64))

(assert (=> d!66079 (= lt!302857 (bvmul lt!302858 lt!302862))))

(assert (=> d!66079 (or (= lt!302858 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!302862 (bvsdiv (bvmul lt!302858 lt!302862) lt!302858)))))

(assert (=> d!66079 (= lt!302862 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66079 (= lt!302858 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9058 lt!302123)))))))

(assert (=> d!66079 (= lt!302861 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9183 (_2!9058 lt!302123))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9178 (_2!9058 lt!302123)))))))

(assert (=> d!66079 (invariant!0 (currentBit!9178 (_2!9058 lt!302123)) (currentByte!9183 (_2!9058 lt!302123)) (size!4410 (buf!4893 (_2!9058 lt!302123))))))

(assert (=> d!66079 (= (bitIndex!0 (size!4410 (buf!4893 (_2!9058 lt!302123))) (currentByte!9183 (_2!9058 lt!302123)) (currentBit!9178 (_2!9058 lt!302123))) lt!302861)))

(declare-fun b!194686 () Bool)

(declare-fun res!162800 () Bool)

(assert (=> b!194686 (=> (not res!162800) (not e!133918))))

(assert (=> b!194686 (= res!162800 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!302861))))

(declare-fun b!194687 () Bool)

(declare-fun lt!302859 () (_ BitVec 64))

(assert (=> b!194687 (= e!133918 (bvsle lt!302861 (bvmul lt!302859 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194687 (or (= lt!302859 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!302859 #b0000000000000000000000000000000000000000000000000000000000001000) lt!302859)))))

(assert (=> b!194687 (= lt!302859 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9058 lt!302123)))))))

(assert (= (and d!66079 res!162801) b!194686))

(assert (= (and b!194686 res!162800) b!194687))

(declare-fun m!301579 () Bool)

(assert (=> d!66079 m!301579))

(declare-fun m!301581 () Bool)

(assert (=> d!66079 m!301581))

(assert (=> b!194420 d!66079))

(declare-fun d!66081 () Bool)

(declare-fun e!133919 () Bool)

(assert (=> d!66081 e!133919))

(declare-fun res!162802 () Bool)

(assert (=> d!66081 (=> (not res!162802) (not e!133919))))

(declare-fun lt!302863 () BitStream!7928)

(declare-fun lt!302864 () (_ BitVec 64))

(assert (=> d!66081 (= res!162802 (= (bvadd lt!302864 (bvsub lt!302110 lt!302113)) (bitIndex!0 (size!4410 (buf!4893 lt!302863)) (currentByte!9183 lt!302863) (currentBit!9178 lt!302863))))))

(assert (=> d!66081 (or (not (= (bvand lt!302864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!302110 lt!302113) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!302864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!302864 (bvsub lt!302110 lt!302113)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66081 (= lt!302864 (bitIndex!0 (size!4410 (buf!4893 (_2!9058 lt!302123))) (currentByte!9183 (_2!9058 lt!302123)) (currentBit!9178 (_2!9058 lt!302123))))))

(assert (=> d!66081 (= lt!302863 (_2!9059 (moveBitIndex!0 (_2!9058 lt!302123) (bvsub lt!302110 lt!302113))))))

(assert (=> d!66081 (moveBitIndexPrecond!0 (_2!9058 lt!302123) (bvsub lt!302110 lt!302113))))

(assert (=> d!66081 (= (withMovedBitIndex!0 (_2!9058 lt!302123) (bvsub lt!302110 lt!302113)) lt!302863)))

(declare-fun b!194688 () Bool)

(assert (=> b!194688 (= e!133919 (= (size!4410 (buf!4893 (_2!9058 lt!302123))) (size!4410 (buf!4893 lt!302863))))))

(assert (= (and d!66081 res!162802) b!194688))

(declare-fun m!301583 () Bool)

(assert (=> d!66081 m!301583))

(assert (=> d!66081 m!301225))

(declare-fun m!301585 () Bool)

(assert (=> d!66081 m!301585))

(declare-fun m!301587 () Bool)

(assert (=> d!66081 m!301587))

(assert (=> b!194422 d!66081))

(declare-fun d!66083 () Bool)

(assert (=> d!66083 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!194401 d!66083))

(declare-fun lt!302865 () tuple2!16836)

(declare-fun d!66085 () Bool)

(assert (=> d!66085 (= lt!302865 (readNBitsLSBFirstsLoop!0 (_1!9058 lt!302133) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302129))))

(assert (=> d!66085 (= (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302133) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!302129) (tuple2!16825 (_2!9063 lt!302865) (_1!9063 lt!302865)))))

(declare-fun bs!16419 () Bool)

(assert (= bs!16419 d!66085))

(declare-fun m!301589 () Bool)

(assert (=> bs!16419 m!301589))

(assert (=> b!194401 d!66085))

(declare-fun d!66087 () Bool)

(assert (=> d!66087 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))) ((_ sign_extend 32) (currentByte!9183 thiss!1204)) ((_ sign_extend 32) (currentBit!9178 thiss!1204)) lt!302125) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))) ((_ sign_extend 32) (currentByte!9183 thiss!1204)) ((_ sign_extend 32) (currentBit!9178 thiss!1204))) lt!302125))))

(declare-fun bs!16420 () Bool)

(assert (= bs!16420 d!66087))

(declare-fun m!301591 () Bool)

(assert (=> bs!16420 m!301591))

(assert (=> b!194401 d!66087))

(declare-fun b!194729 () Bool)

(declare-fun e!133941 () Unit!13736)

(declare-fun Unit!13773 () Unit!13736)

(assert (=> b!194729 (= e!133941 Unit!13773)))

(declare-fun d!66089 () Bool)

(declare-fun e!133940 () Bool)

(assert (=> d!66089 e!133940))

(declare-fun res!162832 () Bool)

(assert (=> d!66089 (=> (not res!162832) (not e!133940))))

(declare-fun lt!303047 () tuple2!16826)

(assert (=> d!66089 (= res!162832 (isPrefixOf!0 (_1!9058 lt!303047) (_2!9058 lt!303047)))))

(declare-fun lt!303040 () BitStream!7928)

(assert (=> d!66089 (= lt!303047 (tuple2!16827 lt!303040 (_2!9059 lt!302111)))))

(declare-fun lt!303039 () Unit!13736)

(declare-fun lt!303051 () Unit!13736)

(assert (=> d!66089 (= lt!303039 lt!303051)))

(assert (=> d!66089 (isPrefixOf!0 lt!303040 (_2!9059 lt!302111))))

(assert (=> d!66089 (= lt!303051 (lemmaIsPrefixTransitive!0 lt!303040 (_2!9059 lt!302111) (_2!9059 lt!302111)))))

(declare-fun lt!303045 () Unit!13736)

(declare-fun lt!303035 () Unit!13736)

(assert (=> d!66089 (= lt!303045 lt!303035)))

(assert (=> d!66089 (isPrefixOf!0 lt!303040 (_2!9059 lt!302111))))

(assert (=> d!66089 (= lt!303035 (lemmaIsPrefixTransitive!0 lt!303040 thiss!1204 (_2!9059 lt!302111)))))

(declare-fun lt!303043 () Unit!13736)

(assert (=> d!66089 (= lt!303043 e!133941)))

(declare-fun c!9734 () Bool)

(assert (=> d!66089 (= c!9734 (not (= (size!4410 (buf!4893 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!303032 () Unit!13736)

(declare-fun lt!303033 () Unit!13736)

(assert (=> d!66089 (= lt!303032 lt!303033)))

(assert (=> d!66089 (isPrefixOf!0 (_2!9059 lt!302111) (_2!9059 lt!302111))))

(assert (=> d!66089 (= lt!303033 (lemmaIsPrefixRefl!0 (_2!9059 lt!302111)))))

(declare-fun lt!303036 () Unit!13736)

(declare-fun lt!303049 () Unit!13736)

(assert (=> d!66089 (= lt!303036 lt!303049)))

(assert (=> d!66089 (= lt!303049 (lemmaIsPrefixRefl!0 (_2!9059 lt!302111)))))

(declare-fun lt!303037 () Unit!13736)

(declare-fun lt!303046 () Unit!13736)

(assert (=> d!66089 (= lt!303037 lt!303046)))

(assert (=> d!66089 (isPrefixOf!0 lt!303040 lt!303040)))

(assert (=> d!66089 (= lt!303046 (lemmaIsPrefixRefl!0 lt!303040))))

(declare-fun lt!303044 () Unit!13736)

(declare-fun lt!303050 () Unit!13736)

(assert (=> d!66089 (= lt!303044 lt!303050)))

(assert (=> d!66089 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!66089 (= lt!303050 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!66089 (= lt!303040 (BitStream!7929 (buf!4893 (_2!9059 lt!302111)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)))))

(assert (=> d!66089 (isPrefixOf!0 thiss!1204 (_2!9059 lt!302111))))

(assert (=> d!66089 (= (reader!0 thiss!1204 (_2!9059 lt!302111)) lt!303047)))

(declare-fun b!194730 () Bool)

(declare-fun res!162831 () Bool)

(assert (=> b!194730 (=> (not res!162831) (not e!133940))))

(assert (=> b!194730 (= res!162831 (isPrefixOf!0 (_1!9058 lt!303047) thiss!1204))))

(declare-fun b!194731 () Bool)

(declare-fun lt!303048 () (_ BitVec 64))

(declare-fun lt!303042 () (_ BitVec 64))

(assert (=> b!194731 (= e!133940 (= (_1!9058 lt!303047) (withMovedBitIndex!0 (_2!9058 lt!303047) (bvsub lt!303048 lt!303042))))))

(assert (=> b!194731 (or (= (bvand lt!303048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303048 lt!303042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194731 (= lt!303042 (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302111))) (currentByte!9183 (_2!9059 lt!302111)) (currentBit!9178 (_2!9059 lt!302111))))))

(assert (=> b!194731 (= lt!303048 (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)))))

(declare-fun b!194732 () Bool)

(declare-fun res!162833 () Bool)

(assert (=> b!194732 (=> (not res!162833) (not e!133940))))

(assert (=> b!194732 (= res!162833 (isPrefixOf!0 (_2!9058 lt!303047) (_2!9059 lt!302111)))))

(declare-fun b!194733 () Bool)

(declare-fun lt!303038 () Unit!13736)

(assert (=> b!194733 (= e!133941 lt!303038)))

(declare-fun lt!303034 () (_ BitVec 64))

(assert (=> b!194733 (= lt!303034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!303041 () (_ BitVec 64))

(assert (=> b!194733 (= lt!303041 (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9999 array!9999 (_ BitVec 64) (_ BitVec 64)) Unit!13736)

(assert (=> b!194733 (= lt!303038 (arrayBitRangesEqSymmetric!0 (buf!4893 thiss!1204) (buf!4893 (_2!9059 lt!302111)) lt!303034 lt!303041))))

(assert (=> b!194733 (arrayBitRangesEq!0 (buf!4893 (_2!9059 lt!302111)) (buf!4893 thiss!1204) lt!303034 lt!303041)))

(assert (= (and d!66089 c!9734) b!194733))

(assert (= (and d!66089 (not c!9734)) b!194729))

(assert (= (and d!66089 res!162832) b!194730))

(assert (= (and b!194730 res!162831) b!194732))

(assert (= (and b!194732 res!162833) b!194731))

(declare-fun m!301781 () Bool)

(assert (=> b!194730 m!301781))

(declare-fun m!301783 () Bool)

(assert (=> d!66089 m!301783))

(declare-fun m!301785 () Bool)

(assert (=> d!66089 m!301785))

(declare-fun m!301787 () Bool)

(assert (=> d!66089 m!301787))

(assert (=> d!66089 m!301217))

(declare-fun m!301789 () Bool)

(assert (=> d!66089 m!301789))

(declare-fun m!301791 () Bool)

(assert (=> d!66089 m!301791))

(declare-fun m!301793 () Bool)

(assert (=> d!66089 m!301793))

(declare-fun m!301795 () Bool)

(assert (=> d!66089 m!301795))

(declare-fun m!301797 () Bool)

(assert (=> d!66089 m!301797))

(declare-fun m!301799 () Bool)

(assert (=> d!66089 m!301799))

(declare-fun m!301801 () Bool)

(assert (=> d!66089 m!301801))

(declare-fun m!301803 () Bool)

(assert (=> b!194731 m!301803))

(assert (=> b!194731 m!301215))

(assert (=> b!194731 m!301171))

(declare-fun m!301805 () Bool)

(assert (=> b!194732 m!301805))

(assert (=> b!194733 m!301171))

(declare-fun m!301807 () Bool)

(assert (=> b!194733 m!301807))

(declare-fun m!301809 () Bool)

(assert (=> b!194733 m!301809))

(assert (=> b!194401 d!66089))

(declare-fun d!66123 () Bool)

(declare-fun e!133942 () Bool)

(assert (=> d!66123 e!133942))

(declare-fun res!162835 () Bool)

(assert (=> d!66123 (=> (not res!162835) (not e!133942))))

(declare-fun lt!303056 () (_ BitVec 64))

(declare-fun lt!303055 () (_ BitVec 64))

(declare-fun lt!303052 () (_ BitVec 64))

(assert (=> d!66123 (= res!162835 (= lt!303056 (bvsub lt!303052 lt!303055)))))

(assert (=> d!66123 (or (= (bvand lt!303052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303052 lt!303055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66123 (= lt!303055 (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9060 lt!302131)))) ((_ sign_extend 32) (currentByte!9183 (_1!9060 lt!302131))) ((_ sign_extend 32) (currentBit!9178 (_1!9060 lt!302131)))))))

(declare-fun lt!303053 () (_ BitVec 64))

(declare-fun lt!303057 () (_ BitVec 64))

(assert (=> d!66123 (= lt!303052 (bvmul lt!303053 lt!303057))))

(assert (=> d!66123 (or (= lt!303053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!303057 (bvsdiv (bvmul lt!303053 lt!303057) lt!303053)))))

(assert (=> d!66123 (= lt!303057 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66123 (= lt!303053 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9060 lt!302131)))))))

(assert (=> d!66123 (= lt!303056 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9183 (_1!9060 lt!302131))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9178 (_1!9060 lt!302131)))))))

(assert (=> d!66123 (invariant!0 (currentBit!9178 (_1!9060 lt!302131)) (currentByte!9183 (_1!9060 lt!302131)) (size!4410 (buf!4893 (_1!9060 lt!302131))))))

(assert (=> d!66123 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302131))) (currentByte!9183 (_1!9060 lt!302131)) (currentBit!9178 (_1!9060 lt!302131))) lt!303056)))

(declare-fun b!194734 () Bool)

(declare-fun res!162834 () Bool)

(assert (=> b!194734 (=> (not res!162834) (not e!133942))))

(assert (=> b!194734 (= res!162834 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!303056))))

(declare-fun b!194735 () Bool)

(declare-fun lt!303054 () (_ BitVec 64))

(assert (=> b!194735 (= e!133942 (bvsle lt!303056 (bvmul lt!303054 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194735 (or (= lt!303054 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!303054 #b0000000000000000000000000000000000000000000000000000000000001000) lt!303054)))))

(assert (=> b!194735 (= lt!303054 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9060 lt!302131)))))))

(assert (= (and d!66123 res!162835) b!194734))

(assert (= (and b!194734 res!162834) b!194735))

(declare-fun m!301811 () Bool)

(assert (=> d!66123 m!301811))

(declare-fun m!301813 () Bool)

(assert (=> d!66123 m!301813))

(assert (=> b!194401 d!66123))

(declare-fun d!66125 () Bool)

(declare-fun lt!303058 () tuple2!16838)

(assert (=> d!66125 (= lt!303058 (readBit!0 (_1!9058 lt!302123)))))

(assert (=> d!66125 (= (readBitPure!0 (_1!9058 lt!302123)) (tuple2!16831 (_2!9064 lt!303058) (_1!9064 lt!303058)))))

(declare-fun bs!16428 () Bool)

(assert (= bs!16428 d!66125))

(declare-fun m!301815 () Bool)

(assert (=> bs!16428 m!301815))

(assert (=> b!194401 d!66125))

(declare-fun d!66127 () Bool)

(assert (=> d!66127 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130))) lt!302116) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130)))) lt!302116))))

(declare-fun bs!16429 () Bool)

(assert (= bs!16429 d!66127))

(declare-fun m!301817 () Bool)

(assert (=> bs!16429 m!301817))

(assert (=> b!194401 d!66127))

(declare-fun d!66129 () Bool)

(declare-fun lt!303059 () tuple2!16838)

(assert (=> d!66129 (= lt!303059 (readBit!0 lt!302107))))

(assert (=> d!66129 (= (readBitPure!0 lt!302107) (tuple2!16831 (_2!9064 lt!303059) (_1!9064 lt!303059)))))

(declare-fun bs!16430 () Bool)

(assert (= bs!16430 d!66129))

(declare-fun m!301819 () Bool)

(assert (=> bs!16430 m!301819))

(assert (=> b!194401 d!66129))

(declare-fun b!194736 () Bool)

(declare-fun e!133944 () Unit!13736)

(declare-fun Unit!13775 () Unit!13736)

(assert (=> b!194736 (= e!133944 Unit!13775)))

(declare-fun d!66131 () Bool)

(declare-fun e!133943 () Bool)

(assert (=> d!66131 e!133943))

(declare-fun res!162837 () Bool)

(assert (=> d!66131 (=> (not res!162837) (not e!133943))))

(declare-fun lt!303075 () tuple2!16826)

(assert (=> d!66131 (= res!162837 (isPrefixOf!0 (_1!9058 lt!303075) (_2!9058 lt!303075)))))

(declare-fun lt!303068 () BitStream!7928)

(assert (=> d!66131 (= lt!303075 (tuple2!16827 lt!303068 (_2!9059 lt!302111)))))

(declare-fun lt!303067 () Unit!13736)

(declare-fun lt!303079 () Unit!13736)

(assert (=> d!66131 (= lt!303067 lt!303079)))

(assert (=> d!66131 (isPrefixOf!0 lt!303068 (_2!9059 lt!302111))))

(assert (=> d!66131 (= lt!303079 (lemmaIsPrefixTransitive!0 lt!303068 (_2!9059 lt!302111) (_2!9059 lt!302111)))))

(declare-fun lt!303073 () Unit!13736)

(declare-fun lt!303063 () Unit!13736)

(assert (=> d!66131 (= lt!303073 lt!303063)))

(assert (=> d!66131 (isPrefixOf!0 lt!303068 (_2!9059 lt!302111))))

(assert (=> d!66131 (= lt!303063 (lemmaIsPrefixTransitive!0 lt!303068 (_2!9059 lt!302130) (_2!9059 lt!302111)))))

(declare-fun lt!303071 () Unit!13736)

(assert (=> d!66131 (= lt!303071 e!133944)))

(declare-fun c!9735 () Bool)

(assert (=> d!66131 (= c!9735 (not (= (size!4410 (buf!4893 (_2!9059 lt!302130))) #b00000000000000000000000000000000)))))

(declare-fun lt!303060 () Unit!13736)

(declare-fun lt!303061 () Unit!13736)

(assert (=> d!66131 (= lt!303060 lt!303061)))

(assert (=> d!66131 (isPrefixOf!0 (_2!9059 lt!302111) (_2!9059 lt!302111))))

(assert (=> d!66131 (= lt!303061 (lemmaIsPrefixRefl!0 (_2!9059 lt!302111)))))

(declare-fun lt!303064 () Unit!13736)

(declare-fun lt!303077 () Unit!13736)

(assert (=> d!66131 (= lt!303064 lt!303077)))

(assert (=> d!66131 (= lt!303077 (lemmaIsPrefixRefl!0 (_2!9059 lt!302111)))))

(declare-fun lt!303065 () Unit!13736)

(declare-fun lt!303074 () Unit!13736)

(assert (=> d!66131 (= lt!303065 lt!303074)))

(assert (=> d!66131 (isPrefixOf!0 lt!303068 lt!303068)))

(assert (=> d!66131 (= lt!303074 (lemmaIsPrefixRefl!0 lt!303068))))

(declare-fun lt!303072 () Unit!13736)

(declare-fun lt!303078 () Unit!13736)

(assert (=> d!66131 (= lt!303072 lt!303078)))

(assert (=> d!66131 (isPrefixOf!0 (_2!9059 lt!302130) (_2!9059 lt!302130))))

(assert (=> d!66131 (= lt!303078 (lemmaIsPrefixRefl!0 (_2!9059 lt!302130)))))

(assert (=> d!66131 (= lt!303068 (BitStream!7929 (buf!4893 (_2!9059 lt!302111)) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))))))

(assert (=> d!66131 (isPrefixOf!0 (_2!9059 lt!302130) (_2!9059 lt!302111))))

(assert (=> d!66131 (= (reader!0 (_2!9059 lt!302130) (_2!9059 lt!302111)) lt!303075)))

(declare-fun b!194737 () Bool)

(declare-fun res!162836 () Bool)

(assert (=> b!194737 (=> (not res!162836) (not e!133943))))

(assert (=> b!194737 (= res!162836 (isPrefixOf!0 (_1!9058 lt!303075) (_2!9059 lt!302130)))))

(declare-fun b!194738 () Bool)

(declare-fun lt!303076 () (_ BitVec 64))

(declare-fun lt!303070 () (_ BitVec 64))

(assert (=> b!194738 (= e!133943 (= (_1!9058 lt!303075) (withMovedBitIndex!0 (_2!9058 lt!303075) (bvsub lt!303076 lt!303070))))))

(assert (=> b!194738 (or (= (bvand lt!303076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303070 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303076 lt!303070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194738 (= lt!303070 (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302111))) (currentByte!9183 (_2!9059 lt!302111)) (currentBit!9178 (_2!9059 lt!302111))))))

(assert (=> b!194738 (= lt!303076 (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))))))

(declare-fun b!194739 () Bool)

(declare-fun res!162838 () Bool)

(assert (=> b!194739 (=> (not res!162838) (not e!133943))))

(assert (=> b!194739 (= res!162838 (isPrefixOf!0 (_2!9058 lt!303075) (_2!9059 lt!302111)))))

(declare-fun b!194740 () Bool)

(declare-fun lt!303066 () Unit!13736)

(assert (=> b!194740 (= e!133944 lt!303066)))

(declare-fun lt!303062 () (_ BitVec 64))

(assert (=> b!194740 (= lt!303062 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!303069 () (_ BitVec 64))

(assert (=> b!194740 (= lt!303069 (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))))))

(assert (=> b!194740 (= lt!303066 (arrayBitRangesEqSymmetric!0 (buf!4893 (_2!9059 lt!302130)) (buf!4893 (_2!9059 lt!302111)) lt!303062 lt!303069))))

(assert (=> b!194740 (arrayBitRangesEq!0 (buf!4893 (_2!9059 lt!302111)) (buf!4893 (_2!9059 lt!302130)) lt!303062 lt!303069)))

(assert (= (and d!66131 c!9735) b!194740))

(assert (= (and d!66131 (not c!9735)) b!194736))

(assert (= (and d!66131 res!162837) b!194737))

(assert (= (and b!194737 res!162836) b!194739))

(assert (= (and b!194739 res!162838) b!194738))

(declare-fun m!301821 () Bool)

(assert (=> b!194737 m!301821))

(declare-fun m!301823 () Bool)

(assert (=> d!66131 m!301823))

(assert (=> d!66131 m!301785))

(declare-fun m!301825 () Bool)

(assert (=> d!66131 m!301825))

(assert (=> d!66131 m!301211))

(declare-fun m!301827 () Bool)

(assert (=> d!66131 m!301827))

(declare-fun m!301829 () Bool)

(assert (=> d!66131 m!301829))

(declare-fun m!301831 () Bool)

(assert (=> d!66131 m!301831))

(declare-fun m!301833 () Bool)

(assert (=> d!66131 m!301833))

(assert (=> d!66131 m!301797))

(declare-fun m!301835 () Bool)

(assert (=> d!66131 m!301835))

(assert (=> d!66131 m!301463))

(declare-fun m!301837 () Bool)

(assert (=> b!194738 m!301837))

(assert (=> b!194738 m!301215))

(assert (=> b!194738 m!301169))

(declare-fun m!301839 () Bool)

(assert (=> b!194739 m!301839))

(assert (=> b!194740 m!301169))

(declare-fun m!301841 () Bool)

(assert (=> b!194740 m!301841))

(declare-fun m!301843 () Bool)

(assert (=> b!194740 m!301843))

(assert (=> b!194401 d!66131))

(declare-fun d!66133 () Bool)

(declare-fun e!133945 () Bool)

(assert (=> d!66133 e!133945))

(declare-fun res!162840 () Bool)

(assert (=> d!66133 (=> (not res!162840) (not e!133945))))

(declare-fun lt!303080 () (_ BitVec 64))

(declare-fun lt!303084 () (_ BitVec 64))

(declare-fun lt!303083 () (_ BitVec 64))

(assert (=> d!66133 (= res!162840 (= lt!303084 (bvsub lt!303080 lt!303083)))))

(assert (=> d!66133 (or (= (bvand lt!303080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!303083 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!303080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!303080 lt!303083) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66133 (= lt!303083 (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9060 lt!302132)))) ((_ sign_extend 32) (currentByte!9183 (_1!9060 lt!302132))) ((_ sign_extend 32) (currentBit!9178 (_1!9060 lt!302132)))))))

(declare-fun lt!303081 () (_ BitVec 64))

(declare-fun lt!303085 () (_ BitVec 64))

(assert (=> d!66133 (= lt!303080 (bvmul lt!303081 lt!303085))))

(assert (=> d!66133 (or (= lt!303081 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!303085 (bvsdiv (bvmul lt!303081 lt!303085) lt!303081)))))

(assert (=> d!66133 (= lt!303085 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66133 (= lt!303081 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9060 lt!302132)))))))

(assert (=> d!66133 (= lt!303084 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9183 (_1!9060 lt!302132))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9178 (_1!9060 lt!302132)))))))

(assert (=> d!66133 (invariant!0 (currentBit!9178 (_1!9060 lt!302132)) (currentByte!9183 (_1!9060 lt!302132)) (size!4410 (buf!4893 (_1!9060 lt!302132))))))

(assert (=> d!66133 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!302132))) (currentByte!9183 (_1!9060 lt!302132)) (currentBit!9178 (_1!9060 lt!302132))) lt!303084)))

(declare-fun b!194741 () Bool)

(declare-fun res!162839 () Bool)

(assert (=> b!194741 (=> (not res!162839) (not e!133945))))

(assert (=> b!194741 (= res!162839 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!303084))))

(declare-fun b!194742 () Bool)

(declare-fun lt!303082 () (_ BitVec 64))

(assert (=> b!194742 (= e!133945 (bvsle lt!303084 (bvmul lt!303082 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194742 (or (= lt!303082 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!303082 #b0000000000000000000000000000000000000000000000000000000000001000) lt!303082)))))

(assert (=> b!194742 (= lt!303082 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9060 lt!302132)))))))

(assert (= (and d!66133 res!162840) b!194741))

(assert (= (and b!194741 res!162839) b!194742))

(declare-fun m!301845 () Bool)

(assert (=> d!66133 m!301845))

(declare-fun m!301847 () Bool)

(assert (=> d!66133 m!301847))

(assert (=> b!194401 d!66133))

(declare-fun d!66135 () Bool)

(declare-fun e!133948 () Bool)

(assert (=> d!66135 e!133948))

(declare-fun res!162843 () Bool)

(assert (=> d!66135 (=> (not res!162843) (not e!133948))))

(declare-fun lt!303095 () tuple2!16830)

(declare-fun lt!303094 () tuple2!16830)

(assert (=> d!66135 (= res!162843 (= (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!303095))) (currentByte!9183 (_1!9060 lt!303095)) (currentBit!9178 (_1!9060 lt!303095))) (bitIndex!0 (size!4410 (buf!4893 (_1!9060 lt!303094))) (currentByte!9183 (_1!9060 lt!303094)) (currentBit!9178 (_1!9060 lt!303094)))))))

(declare-fun lt!303096 () Unit!13736)

(declare-fun lt!303097 () BitStream!7928)

(declare-fun choose!50 (BitStream!7928 BitStream!7928 BitStream!7928 tuple2!16830 tuple2!16830 BitStream!7928 Bool tuple2!16830 tuple2!16830 BitStream!7928 Bool) Unit!13736)

(assert (=> d!66135 (= lt!303096 (choose!50 lt!302107 (_2!9059 lt!302111) lt!303097 lt!303095 (tuple2!16831 (_1!9060 lt!303095) (_2!9060 lt!303095)) (_1!9060 lt!303095) (_2!9060 lt!303095) lt!303094 (tuple2!16831 (_1!9060 lt!303094) (_2!9060 lt!303094)) (_1!9060 lt!303094) (_2!9060 lt!303094)))))

(assert (=> d!66135 (= lt!303094 (readBitPure!0 lt!303097))))

(assert (=> d!66135 (= lt!303095 (readBitPure!0 lt!302107))))

(assert (=> d!66135 (= lt!303097 (BitStream!7929 (buf!4893 (_2!9059 lt!302111)) (currentByte!9183 lt!302107) (currentBit!9178 lt!302107)))))

(assert (=> d!66135 (invariant!0 (currentBit!9178 lt!302107) (currentByte!9183 lt!302107) (size!4410 (buf!4893 (_2!9059 lt!302111))))))

(assert (=> d!66135 (= (readBitPrefixLemma!0 lt!302107 (_2!9059 lt!302111)) lt!303096)))

(declare-fun b!194745 () Bool)

(assert (=> b!194745 (= e!133948 (= (_2!9060 lt!303095) (_2!9060 lt!303094)))))

(assert (= (and d!66135 res!162843) b!194745))

(declare-fun m!301849 () Bool)

(assert (=> d!66135 m!301849))

(declare-fun m!301851 () Bool)

(assert (=> d!66135 m!301851))

(assert (=> d!66135 m!301183))

(declare-fun m!301853 () Bool)

(assert (=> d!66135 m!301853))

(declare-fun m!301855 () Bool)

(assert (=> d!66135 m!301855))

(declare-fun m!301857 () Bool)

(assert (=> d!66135 m!301857))

(assert (=> b!194401 d!66135))

(declare-fun d!66137 () Bool)

(assert (=> d!66137 (= (invariant!0 (currentBit!9178 thiss!1204) (currentByte!9183 thiss!1204) (size!4410 (buf!4893 (_2!9059 lt!302130)))) (and (bvsge (currentBit!9178 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9178 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9183 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9183 thiss!1204) (size!4410 (buf!4893 (_2!9059 lt!302130)))) (and (= (currentBit!9178 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9183 thiss!1204) (size!4410 (buf!4893 (_2!9059 lt!302130))))))))))

(assert (=> b!194401 d!66137))

(declare-fun d!66139 () Bool)

(assert (=> d!66139 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))) ((_ sign_extend 32) (currentByte!9183 (_2!9059 lt!302130))) ((_ sign_extend 32) (currentBit!9178 (_2!9059 lt!302130))) lt!302116)))

(declare-fun lt!303100 () Unit!13736)

(declare-fun choose!9 (BitStream!7928 array!9999 (_ BitVec 64) BitStream!7928) Unit!13736)

(assert (=> d!66139 (= lt!303100 (choose!9 (_2!9059 lt!302130) (buf!4893 (_2!9059 lt!302111)) lt!302116 (BitStream!7929 (buf!4893 (_2!9059 lt!302111)) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130)))))))

(assert (=> d!66139 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9059 lt!302130) (buf!4893 (_2!9059 lt!302111)) lt!302116) lt!303100)))

(declare-fun bs!16431 () Bool)

(assert (= bs!16431 d!66139))

(assert (=> bs!16431 m!301177))

(declare-fun m!301859 () Bool)

(assert (=> bs!16431 m!301859))

(assert (=> b!194401 d!66139))

(declare-fun d!66141 () Bool)

(assert (=> d!66141 (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_2!9059 lt!302111)))) ((_ sign_extend 32) (currentByte!9183 thiss!1204)) ((_ sign_extend 32) (currentBit!9178 thiss!1204)) lt!302125)))

(declare-fun lt!303101 () Unit!13736)

(assert (=> d!66141 (= lt!303101 (choose!9 thiss!1204 (buf!4893 (_2!9059 lt!302111)) lt!302125 (BitStream!7929 (buf!4893 (_2!9059 lt!302111)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204))))))

(assert (=> d!66141 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4893 (_2!9059 lt!302111)) lt!302125) lt!303101)))

(declare-fun bs!16432 () Bool)

(assert (= bs!16432 d!66141))

(assert (=> bs!16432 m!301201))

(declare-fun m!301861 () Bool)

(assert (=> bs!16432 m!301861))

(assert (=> b!194401 d!66141))

(declare-fun d!66143 () Bool)

(declare-fun lt!303102 () tuple2!16838)

(assert (=> d!66143 (= lt!303102 (readBit!0 (BitStream!7929 (buf!4893 (_2!9059 lt!302111)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204))))))

(assert (=> d!66143 (= (readBitPure!0 (BitStream!7929 (buf!4893 (_2!9059 lt!302111)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204))) (tuple2!16831 (_2!9064 lt!303102) (_1!9064 lt!303102)))))

(declare-fun bs!16433 () Bool)

(assert (= bs!16433 d!66143))

(declare-fun m!301863 () Bool)

(assert (=> bs!16433 m!301863))

(assert (=> b!194401 d!66143))

(declare-fun d!66145 () Bool)

(declare-fun lt!303103 () tuple2!16836)

(assert (=> d!66145 (= lt!303103 (readNBitsLSBFirstsLoop!0 (_1!9058 lt!302123) nBits!348 i!590 lt!302117))))

(assert (=> d!66145 (= (readNBitsLSBFirstsLoopPure!0 (_1!9058 lt!302123) nBits!348 i!590 lt!302117) (tuple2!16825 (_2!9063 lt!303103) (_1!9063 lt!303103)))))

(declare-fun bs!16434 () Bool)

(assert (= bs!16434 d!66145))

(declare-fun m!301865 () Bool)

(assert (=> bs!16434 m!301865))

(assert (=> b!194401 d!66145))

(declare-fun d!66147 () Bool)

(assert (=> d!66147 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9058 lt!302123)))) ((_ sign_extend 32) (currentByte!9183 (_1!9058 lt!302123))) ((_ sign_extend 32) (currentBit!9178 (_1!9058 lt!302123))) lt!302125) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4410 (buf!4893 (_1!9058 lt!302123)))) ((_ sign_extend 32) (currentByte!9183 (_1!9058 lt!302123))) ((_ sign_extend 32) (currentBit!9178 (_1!9058 lt!302123)))) lt!302125))))

(declare-fun bs!16435 () Bool)

(assert (= bs!16435 d!66147))

(declare-fun m!301867 () Bool)

(assert (=> bs!16435 m!301867))

(assert (=> b!194411 d!66147))

(declare-fun d!66149 () Bool)

(declare-fun res!162844 () Bool)

(declare-fun e!133949 () Bool)

(assert (=> d!66149 (=> (not res!162844) (not e!133949))))

(assert (=> d!66149 (= res!162844 (= (size!4410 (buf!4893 (_2!9059 lt!302130))) (size!4410 (buf!4893 (_2!9059 lt!302111)))))))

(assert (=> d!66149 (= (isPrefixOf!0 (_2!9059 lt!302130) (_2!9059 lt!302111)) e!133949)))

(declare-fun b!194746 () Bool)

(declare-fun res!162845 () Bool)

(assert (=> b!194746 (=> (not res!162845) (not e!133949))))

(assert (=> b!194746 (= res!162845 (bvsle (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130))) (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302111))) (currentByte!9183 (_2!9059 lt!302111)) (currentBit!9178 (_2!9059 lt!302111)))))))

(declare-fun b!194747 () Bool)

(declare-fun e!133950 () Bool)

(assert (=> b!194747 (= e!133949 e!133950)))

(declare-fun res!162846 () Bool)

(assert (=> b!194747 (=> res!162846 e!133950)))

(assert (=> b!194747 (= res!162846 (= (size!4410 (buf!4893 (_2!9059 lt!302130))) #b00000000000000000000000000000000))))

(declare-fun b!194748 () Bool)

(assert (=> b!194748 (= e!133950 (arrayBitRangesEq!0 (buf!4893 (_2!9059 lt!302130)) (buf!4893 (_2!9059 lt!302111)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130)))))))

(assert (= (and d!66149 res!162844) b!194746))

(assert (= (and b!194746 res!162845) b!194747))

(assert (= (and b!194747 (not res!162846)) b!194748))

(assert (=> b!194746 m!301169))

(assert (=> b!194746 m!301215))

(assert (=> b!194748 m!301169))

(assert (=> b!194748 m!301169))

(declare-fun m!301869 () Bool)

(assert (=> b!194748 m!301869))

(assert (=> b!194402 d!66149))

(declare-fun d!66151 () Bool)

(declare-fun res!162847 () Bool)

(declare-fun e!133951 () Bool)

(assert (=> d!66151 (=> (not res!162847) (not e!133951))))

(assert (=> d!66151 (= res!162847 (= (size!4410 (buf!4893 thiss!1204)) (size!4410 (buf!4893 (_2!9059 lt!302130)))))))

(assert (=> d!66151 (= (isPrefixOf!0 thiss!1204 (_2!9059 lt!302130)) e!133951)))

(declare-fun b!194749 () Bool)

(declare-fun res!162848 () Bool)

(assert (=> b!194749 (=> (not res!162848) (not e!133951))))

(assert (=> b!194749 (= res!162848 (bvsle (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204)) (bitIndex!0 (size!4410 (buf!4893 (_2!9059 lt!302130))) (currentByte!9183 (_2!9059 lt!302130)) (currentBit!9178 (_2!9059 lt!302130)))))))

(declare-fun b!194750 () Bool)

(declare-fun e!133952 () Bool)

(assert (=> b!194750 (= e!133951 e!133952)))

(declare-fun res!162849 () Bool)

(assert (=> b!194750 (=> res!162849 e!133952)))

(assert (=> b!194750 (= res!162849 (= (size!4410 (buf!4893 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!194751 () Bool)

(assert (=> b!194751 (= e!133952 (arrayBitRangesEq!0 (buf!4893 thiss!1204) (buf!4893 (_2!9059 lt!302130)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4410 (buf!4893 thiss!1204)) (currentByte!9183 thiss!1204) (currentBit!9178 thiss!1204))))))

(assert (= (and d!66151 res!162847) b!194749))

(assert (= (and b!194749 res!162848) b!194750))

(assert (= (and b!194750 (not res!162849)) b!194751))

(assert (=> b!194749 m!301171))

(assert (=> b!194749 m!301169))

(assert (=> b!194751 m!301171))

(assert (=> b!194751 m!301171))

(declare-fun m!301871 () Bool)

(assert (=> b!194751 m!301871))

(assert (=> b!194413 d!66151))

(assert (=> b!194412 d!66151))

(push 1)

(assert (not b!194733))

(assert (not b!194590))

(assert (not d!66033))

(assert (not d!66131))

(assert (not d!66005))

(assert (not b!194577))

(assert (not d!66043))

(assert (not d!66055))

(assert (not b!194583))

(assert (not d!66087))

(assert (not b!194730))

(assert (not b!194740))

(assert (not d!66049))

(assert (not b!194582))

(assert (not d!65997))

(assert (not d!66003))

(assert (not b!194633))

(assert (not b!194495))

(assert (not d!66135))

(assert (not d!65993))

(assert (not d!66145))

(assert (not d!66085))

(assert (not b!194587))

(assert (not d!66081))

(assert (not b!194663))

(assert (not d!66079))

(assert (not d!66133))

(assert (not d!66077))

(assert (not b!194586))

(assert (not d!66141))

(assert (not b!194588))

(assert (not b!194584))

(assert (not b!194731))

(assert (not d!65979))

(assert (not d!66025))

(assert (not d!66031))

(assert (not b!194748))

(assert (not d!66037))

(assert (not d!66129))

(assert (not b!194751))

(assert (not d!66127))

(assert (not b!194739))

(assert (not d!66143))

(assert (not d!66139))

(assert (not b!194732))

(assert (not d!66147))

(assert (not b!194581))

(assert (not d!66125))

(assert (not d!66075))

(assert (not b!194666))

(assert (not b!194664))

(assert (not d!66089))

(assert (not b!194493))

(assert (not b!194737))

(assert (not b!194746))

(assert (not b!194578))

(assert (not d!66123))

(assert (not d!65999))

(assert (not b!194665))

(assert (not b!194738))

(assert (not bm!3059))

(assert (not b!194749))

(assert (not d!66061))

(check-sat)

(pop 1)

(push 1)

(check-sat)

