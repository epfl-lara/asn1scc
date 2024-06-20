; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1822 () Bool)

(assert start!1822)

(declare-fun b!8628 () Bool)

(declare-fun res!9142 () Bool)

(declare-fun e!5385 () Bool)

(assert (=> b!8628 (=> (not res!9142) (not e!5385))))

(declare-datatypes ((array!572 0))(
  ( (array!573 (arr!650 (Array (_ BitVec 32) (_ BitVec 8))) (size!245 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!468 0))(
  ( (BitStream!469 (buf!581 array!572) (currentByte!1620 (_ BitVec 32)) (currentBit!1615 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!468)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8628 (= res!9142 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) nBits!460))))

(declare-fun res!9144 () Bool)

(assert (=> start!1822 (=> (not res!9144) (not e!5385))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!572)

(assert (=> start!1822 (= res!9144 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!245 srcBuffer!6))))))))

(assert (=> start!1822 e!5385))

(assert (=> start!1822 true))

(declare-fun array_inv!240 (array!572) Bool)

(assert (=> start!1822 (array_inv!240 srcBuffer!6)))

(declare-fun e!5386 () Bool)

(declare-fun inv!12 (BitStream!468) Bool)

(assert (=> start!1822 (and (inv!12 thiss!1486) e!5386)))

(declare-fun b!8629 () Bool)

(declare-fun e!5383 () Bool)

(assert (=> b!8629 (= e!5385 e!5383)))

(declare-fun res!9141 () Bool)

(assert (=> b!8629 (=> (not res!9141) (not e!5383))))

(declare-datatypes ((Unit!744 0))(
  ( (Unit!745) )
))
(declare-datatypes ((tuple2!1162 0))(
  ( (tuple2!1163 (_1!612 Unit!744) (_2!612 BitStream!468)) )
))
(declare-fun lt!12518 () tuple2!1162)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8629 (= res!9141 (invariant!0 (currentBit!1615 (_2!612 lt!12518)) (currentByte!1620 (_2!612 lt!12518)) (size!245 (buf!581 (_2!612 lt!12518)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!468 array!572 (_ BitVec 64) (_ BitVec 64)) tuple2!1162)

(assert (=> b!8629 (= lt!12518 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8630 () Bool)

(declare-fun res!9140 () Bool)

(assert (=> b!8630 (=> (not res!9140) (not e!5383))))

(declare-fun isPrefixOf!0 (BitStream!468 BitStream!468) Bool)

(assert (=> b!8630 (= res!9140 (isPrefixOf!0 thiss!1486 (_2!612 lt!12518)))))

(declare-fun b!8631 () Bool)

(declare-datatypes ((tuple2!1164 0))(
  ( (tuple2!1165 (_1!613 BitStream!468) (_2!613 BitStream!468)) )
))
(declare-fun lt!12517 () tuple2!1164)

(declare-datatypes ((List!142 0))(
  ( (Nil!139) (Cons!138 (h!257 Bool) (t!892 List!142)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!468 array!572 (_ BitVec 64) (_ BitVec 64)) List!142)

(declare-datatypes ((tuple2!1166 0))(
  ( (tuple2!1167 (_1!614 array!572) (_2!614 BitStream!468)) )
))
(declare-fun readBits!0 (BitStream!468 (_ BitVec 64)) tuple2!1166)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!468 BitStream!468 (_ BitVec 64)) List!142)

(assert (=> b!8631 (= e!5383 (not (= (byteArrayBitContentToList!0 (_2!612 lt!12518) (_1!614 (readBits!0 (_1!613 lt!12517) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!612 lt!12518) (_1!613 lt!12517) nBits!460))))))

(assert (=> b!8631 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) nBits!460)))

(declare-fun lt!12516 () Unit!744)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!468 array!572 (_ BitVec 64)) Unit!744)

(assert (=> b!8631 (= lt!12516 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!581 (_2!612 lt!12518)) nBits!460))))

(declare-fun reader!0 (BitStream!468 BitStream!468) tuple2!1164)

(assert (=> b!8631 (= lt!12517 (reader!0 thiss!1486 (_2!612 lt!12518)))))

(declare-fun b!8632 () Bool)

(assert (=> b!8632 (= e!5386 (array_inv!240 (buf!581 thiss!1486)))))

(declare-fun b!8633 () Bool)

(declare-fun res!9145 () Bool)

(assert (=> b!8633 (=> (not res!9145) (not e!5383))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8633 (= res!9145 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12518))) (currentByte!1620 (_2!612 lt!12518)) (currentBit!1615 (_2!612 lt!12518))) (bvadd (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)) nBits!460)))))

(declare-fun b!8634 () Bool)

(declare-fun res!9143 () Bool)

(assert (=> b!8634 (=> (not res!9143) (not e!5383))))

(assert (=> b!8634 (= res!9143 (= (size!245 (buf!581 thiss!1486)) (size!245 (buf!581 (_2!612 lt!12518)))))))

(assert (= (and start!1822 res!9144) b!8628))

(assert (= (and b!8628 res!9142) b!8629))

(assert (= (and b!8629 res!9141) b!8634))

(assert (= (and b!8634 res!9143) b!8633))

(assert (= (and b!8633 res!9145) b!8630))

(assert (= (and b!8630 res!9140) b!8631))

(assert (= start!1822 b!8632))

(declare-fun m!11805 () Bool)

(assert (=> start!1822 m!11805))

(declare-fun m!11807 () Bool)

(assert (=> start!1822 m!11807))

(declare-fun m!11809 () Bool)

(assert (=> b!8631 m!11809))

(declare-fun m!11811 () Bool)

(assert (=> b!8631 m!11811))

(declare-fun m!11813 () Bool)

(assert (=> b!8631 m!11813))

(declare-fun m!11815 () Bool)

(assert (=> b!8631 m!11815))

(declare-fun m!11817 () Bool)

(assert (=> b!8631 m!11817))

(declare-fun m!11819 () Bool)

(assert (=> b!8631 m!11819))

(declare-fun m!11821 () Bool)

(assert (=> b!8632 m!11821))

(declare-fun m!11823 () Bool)

(assert (=> b!8629 m!11823))

(declare-fun m!11825 () Bool)

(assert (=> b!8629 m!11825))

(declare-fun m!11827 () Bool)

(assert (=> b!8628 m!11827))

(declare-fun m!11829 () Bool)

(assert (=> b!8630 m!11829))

(declare-fun m!11831 () Bool)

(assert (=> b!8633 m!11831))

(declare-fun m!11833 () Bool)

(assert (=> b!8633 m!11833))

(check-sat (not start!1822) (not b!8630) (not b!8631) (not b!8629) (not b!8632) (not b!8628) (not b!8633))
(check-sat)
(get-model)

(declare-fun d!2544 () Bool)

(declare-fun res!9172 () Bool)

(declare-fun e!5407 () Bool)

(assert (=> d!2544 (=> (not res!9172) (not e!5407))))

(assert (=> d!2544 (= res!9172 (= (size!245 (buf!581 thiss!1486)) (size!245 (buf!581 (_2!612 lt!12518)))))))

(assert (=> d!2544 (= (isPrefixOf!0 thiss!1486 (_2!612 lt!12518)) e!5407)))

(declare-fun b!8662 () Bool)

(declare-fun res!9171 () Bool)

(assert (=> b!8662 (=> (not res!9171) (not e!5407))))

(assert (=> b!8662 (= res!9171 (bvsle (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)) (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12518))) (currentByte!1620 (_2!612 lt!12518)) (currentBit!1615 (_2!612 lt!12518)))))))

(declare-fun b!8663 () Bool)

(declare-fun e!5408 () Bool)

(assert (=> b!8663 (= e!5407 e!5408)))

(declare-fun res!9170 () Bool)

(assert (=> b!8663 (=> res!9170 e!5408)))

(assert (=> b!8663 (= res!9170 (= (size!245 (buf!581 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!8664 () Bool)

(declare-fun arrayBitRangesEq!0 (array!572 array!572 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8664 (= e!5408 (arrayBitRangesEq!0 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(assert (= (and d!2544 res!9172) b!8662))

(assert (= (and b!8662 res!9171) b!8663))

(assert (= (and b!8663 (not res!9170)) b!8664))

(assert (=> b!8662 m!11833))

(assert (=> b!8662 m!11831))

(assert (=> b!8664 m!11833))

(assert (=> b!8664 m!11833))

(declare-fun m!11865 () Bool)

(assert (=> b!8664 m!11865))

(assert (=> b!8630 d!2544))

(declare-fun d!2548 () Bool)

(assert (=> d!2548 (= (array_inv!240 srcBuffer!6) (bvsge (size!245 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1822 d!2548))

(declare-fun d!2550 () Bool)

(assert (=> d!2550 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1615 thiss!1486) (currentByte!1620 thiss!1486) (size!245 (buf!581 thiss!1486))))))

(declare-fun bs!848 () Bool)

(assert (= bs!848 d!2550))

(declare-fun m!11867 () Bool)

(assert (=> bs!848 m!11867))

(assert (=> start!1822 d!2550))

(declare-fun d!2552 () Bool)

(assert (=> d!2552 (= (invariant!0 (currentBit!1615 (_2!612 lt!12518)) (currentByte!1620 (_2!612 lt!12518)) (size!245 (buf!581 (_2!612 lt!12518)))) (and (bvsge (currentBit!1615 (_2!612 lt!12518)) #b00000000000000000000000000000000) (bvslt (currentBit!1615 (_2!612 lt!12518)) #b00000000000000000000000000001000) (bvsge (currentByte!1620 (_2!612 lt!12518)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1620 (_2!612 lt!12518)) (size!245 (buf!581 (_2!612 lt!12518)))) (and (= (currentBit!1615 (_2!612 lt!12518)) #b00000000000000000000000000000000) (= (currentByte!1620 (_2!612 lt!12518)) (size!245 (buf!581 (_2!612 lt!12518))))))))))

(assert (=> b!8629 d!2552))

(declare-fun b!8713 () Bool)

(declare-fun e!5428 () tuple2!1162)

(declare-fun Unit!748 () Unit!744)

(assert (=> b!8713 (= e!5428 (tuple2!1163 Unit!748 thiss!1486))))

(assert (=> b!8713 (= (size!245 (buf!581 thiss!1486)) (size!245 (buf!581 thiss!1486)))))

(declare-fun lt!12792 () Unit!744)

(declare-fun Unit!749 () Unit!744)

(assert (=> b!8713 (= lt!12792 Unit!749)))

(declare-fun call!135 () tuple2!1164)

(declare-fun checkByteArrayBitContent!0 (BitStream!468 array!572 array!572 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8713 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!614 (readBits!0 (_1!613 call!135) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8714 () Bool)

(declare-fun lt!12816 () tuple2!1162)

(declare-fun Unit!750 () Unit!744)

(assert (=> b!8714 (= e!5428 (tuple2!1163 Unit!750 (_2!612 lt!12816)))))

(declare-fun lt!12825 () tuple2!1162)

(declare-fun appendBitFromByte!0 (BitStream!468 (_ BitVec 8) (_ BitVec 32)) tuple2!1162)

(assert (=> b!8714 (= lt!12825 (appendBitFromByte!0 thiss!1486 (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!12826 () (_ BitVec 64))

(assert (=> b!8714 (= lt!12826 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12827 () (_ BitVec 64))

(assert (=> b!8714 (= lt!12827 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12815 () Unit!744)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!468 BitStream!468 (_ BitVec 64) (_ BitVec 64)) Unit!744)

(assert (=> b!8714 (= lt!12815 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!612 lt!12825) lt!12826 lt!12827))))

(assert (=> b!8714 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) (bvsub lt!12826 lt!12827))))

(declare-fun lt!12808 () Unit!744)

(assert (=> b!8714 (= lt!12808 lt!12815)))

(declare-fun lt!12796 () tuple2!1164)

(assert (=> b!8714 (= lt!12796 (reader!0 thiss!1486 (_2!612 lt!12825)))))

(declare-fun lt!12817 () (_ BitVec 64))

(assert (=> b!8714 (= lt!12817 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12832 () Unit!744)

(assert (=> b!8714 (= lt!12832 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!581 (_2!612 lt!12825)) lt!12817))))

(assert (=> b!8714 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12817)))

(declare-fun lt!12799 () Unit!744)

(assert (=> b!8714 (= lt!12799 lt!12832)))

(declare-fun head!47 (List!142) Bool)

(assert (=> b!8714 (= (head!47 (byteArrayBitContentToList!0 (_2!612 lt!12825) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!47 (bitStreamReadBitsIntoList!0 (_2!612 lt!12825) (_1!613 lt!12796) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12828 () Unit!744)

(declare-fun Unit!751 () Unit!744)

(assert (=> b!8714 (= lt!12828 Unit!751)))

(assert (=> b!8714 (= lt!12816 (appendBitsMSBFirstLoop!0 (_2!612 lt!12825) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!12794 () Unit!744)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!468 BitStream!468 BitStream!468) Unit!744)

(assert (=> b!8714 (= lt!12794 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!612 lt!12825) (_2!612 lt!12816)))))

(assert (=> b!8714 (isPrefixOf!0 thiss!1486 (_2!612 lt!12816))))

(declare-fun lt!12822 () Unit!744)

(assert (=> b!8714 (= lt!12822 lt!12794)))

(assert (=> b!8714 (= (size!245 (buf!581 (_2!612 lt!12816))) (size!245 (buf!581 thiss!1486)))))

(declare-fun lt!12818 () Unit!744)

(declare-fun Unit!753 () Unit!744)

(assert (=> b!8714 (= lt!12818 Unit!753)))

(assert (=> b!8714 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12816))) (currentByte!1620 (_2!612 lt!12816)) (currentBit!1615 (_2!612 lt!12816))) (bvsub (bvadd (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!12807 () Unit!744)

(declare-fun Unit!755 () Unit!744)

(assert (=> b!8714 (= lt!12807 Unit!755)))

(assert (=> b!8714 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12816))) (currentByte!1620 (_2!612 lt!12816)) (currentBit!1615 (_2!612 lt!12816))) (bvsub (bvsub (bvadd (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12795 () Unit!744)

(declare-fun Unit!756 () Unit!744)

(assert (=> b!8714 (= lt!12795 Unit!756)))

(declare-fun lt!12810 () tuple2!1164)

(assert (=> b!8714 (= lt!12810 call!135)))

(declare-fun lt!12834 () (_ BitVec 64))

(assert (=> b!8714 (= lt!12834 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12793 () Unit!744)

(assert (=> b!8714 (= lt!12793 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!581 (_2!612 lt!12816)) lt!12834))))

(assert (=> b!8714 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12834)))

(declare-fun lt!12802 () Unit!744)

(assert (=> b!8714 (= lt!12802 lt!12793)))

(declare-fun lt!12797 () tuple2!1164)

(assert (=> b!8714 (= lt!12797 (reader!0 (_2!612 lt!12825) (_2!612 lt!12816)))))

(declare-fun lt!12821 () (_ BitVec 64))

(assert (=> b!8714 (= lt!12821 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12809 () Unit!744)

(assert (=> b!8714 (= lt!12809 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!612 lt!12825) (buf!581 (_2!612 lt!12816)) lt!12821))))

(assert (=> b!8714 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) lt!12821)))

(declare-fun lt!12813 () Unit!744)

(assert (=> b!8714 (= lt!12813 lt!12809)))

(declare-fun lt!12803 () List!142)

(assert (=> b!8714 (= lt!12803 (byteArrayBitContentToList!0 (_2!612 lt!12816) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12800 () List!142)

(assert (=> b!8714 (= lt!12800 (byteArrayBitContentToList!0 (_2!612 lt!12816) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12835 () List!142)

(assert (=> b!8714 (= lt!12835 (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_1!613 lt!12810) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12820 () List!142)

(assert (=> b!8714 (= lt!12820 (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_1!613 lt!12797) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12819 () (_ BitVec 64))

(assert (=> b!8714 (= lt!12819 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12806 () Unit!744)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!468 BitStream!468 BitStream!468 BitStream!468 (_ BitVec 64) List!142) Unit!744)

(assert (=> b!8714 (= lt!12806 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!612 lt!12816) (_2!612 lt!12816) (_1!613 lt!12810) (_1!613 lt!12797) lt!12819 lt!12835))))

(declare-fun tail!55 (List!142) List!142)

(assert (=> b!8714 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_1!613 lt!12797) (bvsub lt!12819 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!55 lt!12835))))

(declare-fun lt!12804 () Unit!744)

(assert (=> b!8714 (= lt!12804 lt!12806)))

(declare-fun lt!12798 () (_ BitVec 64))

(declare-fun lt!12831 () Unit!744)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!572 array!572 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!744)

(assert (=> b!8714 (= lt!12831 (arrayBitRangesEqImpliesEq!0 (buf!581 (_2!612 lt!12825)) (buf!581 (_2!612 lt!12816)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12798 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825)))))))

(declare-fun bitAt!0 (array!572 (_ BitVec 64)) Bool)

(assert (=> b!8714 (= (bitAt!0 (buf!581 (_2!612 lt!12825)) lt!12798) (bitAt!0 (buf!581 (_2!612 lt!12816)) lt!12798))))

(declare-fun lt!12829 () Unit!744)

(assert (=> b!8714 (= lt!12829 lt!12831)))

(declare-fun b!8715 () Bool)

(declare-fun res!9209 () Bool)

(declare-fun e!5427 () Bool)

(assert (=> b!8715 (=> (not res!9209) (not e!5427))))

(declare-fun lt!12805 () tuple2!1162)

(assert (=> b!8715 (= res!9209 (isPrefixOf!0 thiss!1486 (_2!612 lt!12805)))))

(declare-fun b!8716 () Bool)

(declare-fun res!9212 () Bool)

(assert (=> b!8716 (=> (not res!9212) (not e!5427))))

(assert (=> b!8716 (= res!9212 (invariant!0 (currentBit!1615 (_2!612 lt!12805)) (currentByte!1620 (_2!612 lt!12805)) (size!245 (buf!581 (_2!612 lt!12805)))))))

(declare-fun d!2556 () Bool)

(assert (=> d!2556 e!5427))

(declare-fun res!9213 () Bool)

(assert (=> d!2556 (=> (not res!9213) (not e!5427))))

(declare-fun lt!12830 () (_ BitVec 64))

(assert (=> d!2556 (= res!9213 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12805))) (currentByte!1620 (_2!612 lt!12805)) (currentBit!1615 (_2!612 lt!12805))) (bvsub lt!12830 from!367)))))

(assert (=> d!2556 (or (= (bvand lt!12830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12830 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12801 () (_ BitVec 64))

(assert (=> d!2556 (= lt!12830 (bvadd lt!12801 from!367 nBits!460))))

(assert (=> d!2556 (or (not (= (bvand lt!12801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!12801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!12801 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2556 (= lt!12801 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(assert (=> d!2556 (= lt!12805 e!5428)))

(declare-fun c!480 () Bool)

(assert (=> d!2556 (= c!480 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!12814 () Unit!744)

(declare-fun lt!12812 () Unit!744)

(assert (=> d!2556 (= lt!12814 lt!12812)))

(assert (=> d!2556 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!468) Unit!744)

(assert (=> d!2556 (= lt!12812 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2556 (= lt!12798 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(assert (=> d!2556 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2556 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!12805)))

(declare-fun b!8717 () Bool)

(declare-fun res!9214 () Bool)

(assert (=> b!8717 (=> (not res!9214) (not e!5427))))

(assert (=> b!8717 (= res!9214 (= (size!245 (buf!581 (_2!612 lt!12805))) (size!245 (buf!581 thiss!1486))))))

(declare-fun bm!132 () Bool)

(assert (=> bm!132 (= call!135 (reader!0 thiss!1486 (ite c!480 (_2!612 lt!12816) thiss!1486)))))

(declare-fun b!8718 () Bool)

(declare-fun e!5429 () Bool)

(declare-fun lt!12811 () (_ BitVec 64))

(assert (=> b!8718 (= e!5429 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12811))))

(declare-fun b!8719 () Bool)

(declare-fun res!9211 () Bool)

(assert (=> b!8719 (=> (not res!9211) (not e!5427))))

(assert (=> b!8719 (= res!9211 (= (size!245 (buf!581 thiss!1486)) (size!245 (buf!581 (_2!612 lt!12805)))))))

(declare-fun lt!12823 () tuple2!1164)

(declare-fun b!8720 () Bool)

(assert (=> b!8720 (= e!5427 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12805) (_1!613 lt!12823) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!612 lt!12805) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8720 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8720 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12824 () Unit!744)

(declare-fun lt!12833 () Unit!744)

(assert (=> b!8720 (= lt!12824 lt!12833)))

(assert (=> b!8720 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12805)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12811)))

(assert (=> b!8720 (= lt!12833 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!581 (_2!612 lt!12805)) lt!12811))))

(assert (=> b!8720 e!5429))

(declare-fun res!9210 () Bool)

(assert (=> b!8720 (=> (not res!9210) (not e!5429))))

(assert (=> b!8720 (= res!9210 (and (= (size!245 (buf!581 thiss!1486)) (size!245 (buf!581 (_2!612 lt!12805)))) (bvsge lt!12811 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8720 (= lt!12811 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8720 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8720 (= lt!12823 (reader!0 thiss!1486 (_2!612 lt!12805)))))

(assert (= (and d!2556 c!480) b!8714))

(assert (= (and d!2556 (not c!480)) b!8713))

(assert (= (or b!8714 b!8713) bm!132))

(assert (= (and d!2556 res!9213) b!8716))

(assert (= (and b!8716 res!9212) b!8719))

(assert (= (and b!8719 res!9211) b!8715))

(assert (= (and b!8715 res!9209) b!8717))

(assert (= (and b!8717 res!9214) b!8720))

(assert (= (and b!8720 res!9210) b!8718))

(declare-fun m!11869 () Bool)

(assert (=> b!8718 m!11869))

(declare-fun m!11871 () Bool)

(assert (=> d!2556 m!11871))

(assert (=> d!2556 m!11833))

(declare-fun m!11873 () Bool)

(assert (=> d!2556 m!11873))

(declare-fun m!11875 () Bool)

(assert (=> d!2556 m!11875))

(declare-fun m!11877 () Bool)

(assert (=> b!8713 m!11877))

(declare-fun m!11879 () Bool)

(assert (=> b!8713 m!11879))

(declare-fun m!11881 () Bool)

(assert (=> b!8716 m!11881))

(declare-fun m!11883 () Bool)

(assert (=> b!8714 m!11883))

(declare-fun m!11885 () Bool)

(assert (=> b!8714 m!11885))

(declare-fun m!11887 () Bool)

(assert (=> b!8714 m!11887))

(declare-fun m!11889 () Bool)

(assert (=> b!8714 m!11889))

(declare-fun m!11891 () Bool)

(assert (=> b!8714 m!11891))

(declare-fun m!11893 () Bool)

(assert (=> b!8714 m!11893))

(declare-fun m!11897 () Bool)

(assert (=> b!8714 m!11897))

(declare-fun m!11899 () Bool)

(assert (=> b!8714 m!11899))

(declare-fun m!11903 () Bool)

(assert (=> b!8714 m!11903))

(declare-fun m!11907 () Bool)

(assert (=> b!8714 m!11907))

(assert (=> b!8714 m!11897))

(declare-fun m!11913 () Bool)

(assert (=> b!8714 m!11913))

(declare-fun m!11917 () Bool)

(assert (=> b!8714 m!11917))

(declare-fun m!11923 () Bool)

(assert (=> b!8714 m!11923))

(declare-fun m!11927 () Bool)

(assert (=> b!8714 m!11927))

(assert (=> b!8714 m!11833))

(declare-fun m!11931 () Bool)

(assert (=> b!8714 m!11931))

(declare-fun m!11935 () Bool)

(assert (=> b!8714 m!11935))

(declare-fun m!11939 () Bool)

(assert (=> b!8714 m!11939))

(declare-fun m!11941 () Bool)

(assert (=> b!8714 m!11941))

(assert (=> b!8714 m!11923))

(assert (=> b!8714 m!11931))

(declare-fun m!11949 () Bool)

(assert (=> b!8714 m!11949))

(declare-fun m!11955 () Bool)

(assert (=> b!8714 m!11955))

(declare-fun m!11959 () Bool)

(assert (=> b!8714 m!11959))

(declare-fun m!11963 () Bool)

(assert (=> b!8714 m!11963))

(declare-fun m!11967 () Bool)

(assert (=> b!8714 m!11967))

(declare-fun m!11971 () Bool)

(assert (=> b!8714 m!11971))

(declare-fun m!11975 () Bool)

(assert (=> b!8714 m!11975))

(declare-fun m!11979 () Bool)

(assert (=> b!8714 m!11979))

(declare-fun m!11981 () Bool)

(assert (=> b!8714 m!11981))

(declare-fun m!11985 () Bool)

(assert (=> b!8714 m!11985))

(declare-fun m!11989 () Bool)

(assert (=> b!8714 m!11989))

(assert (=> b!8714 m!11903))

(declare-fun m!11995 () Bool)

(assert (=> b!8714 m!11995))

(declare-fun m!11999 () Bool)

(assert (=> b!8714 m!11999))

(declare-fun m!12003 () Bool)

(assert (=> bm!132 m!12003))

(declare-fun m!12005 () Bool)

(assert (=> b!8715 m!12005))

(declare-fun m!12009 () Bool)

(assert (=> b!8720 m!12009))

(declare-fun m!12011 () Bool)

(assert (=> b!8720 m!12011))

(declare-fun m!12017 () Bool)

(assert (=> b!8720 m!12017))

(declare-fun m!12021 () Bool)

(assert (=> b!8720 m!12021))

(declare-fun m!12025 () Bool)

(assert (=> b!8720 m!12025))

(assert (=> b!8629 d!2556))

(declare-fun d!2560 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2560 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486))) nBits!460))))

(declare-fun bs!849 () Bool)

(assert (= bs!849 d!2560))

(declare-fun m!12049 () Bool)

(assert (=> bs!849 m!12049))

(assert (=> b!8628 d!2560))

(declare-fun d!2564 () Bool)

(declare-fun e!5441 () Bool)

(assert (=> d!2564 e!5441))

(declare-fun res!9232 () Bool)

(assert (=> d!2564 (=> (not res!9232) (not e!5441))))

(declare-fun lt!12938 () (_ BitVec 64))

(declare-fun lt!12937 () (_ BitVec 64))

(declare-fun lt!12939 () (_ BitVec 64))

(assert (=> d!2564 (= res!9232 (= lt!12938 (bvsub lt!12937 lt!12939)))))

(assert (=> d!2564 (or (= (bvand lt!12937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12939 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12937 lt!12939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2564 (= lt!12939 (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12518))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12518)))))))

(declare-fun lt!12940 () (_ BitVec 64))

(declare-fun lt!12941 () (_ BitVec 64))

(assert (=> d!2564 (= lt!12937 (bvmul lt!12940 lt!12941))))

(assert (=> d!2564 (or (= lt!12940 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!12941 (bvsdiv (bvmul lt!12940 lt!12941) lt!12940)))))

(assert (=> d!2564 (= lt!12941 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2564 (= lt!12940 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))))))

(assert (=> d!2564 (= lt!12938 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12518))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12518)))))))

(assert (=> d!2564 (invariant!0 (currentBit!1615 (_2!612 lt!12518)) (currentByte!1620 (_2!612 lt!12518)) (size!245 (buf!581 (_2!612 lt!12518))))))

(assert (=> d!2564 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12518))) (currentByte!1620 (_2!612 lt!12518)) (currentBit!1615 (_2!612 lt!12518))) lt!12938)))

(declare-fun b!8747 () Bool)

(declare-fun res!9231 () Bool)

(assert (=> b!8747 (=> (not res!9231) (not e!5441))))

(assert (=> b!8747 (= res!9231 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12938))))

(declare-fun b!8748 () Bool)

(declare-fun lt!12936 () (_ BitVec 64))

(assert (=> b!8748 (= e!5441 (bvsle lt!12938 (bvmul lt!12936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8748 (or (= lt!12936 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!12936 #b0000000000000000000000000000000000000000000000000000000000001000) lt!12936)))))

(assert (=> b!8748 (= lt!12936 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))))))

(assert (= (and d!2564 res!9232) b!8747))

(assert (= (and b!8747 res!9231) b!8748))

(declare-fun m!12149 () Bool)

(assert (=> d!2564 m!12149))

(assert (=> d!2564 m!11823))

(assert (=> b!8633 d!2564))

(declare-fun d!2574 () Bool)

(declare-fun e!5442 () Bool)

(assert (=> d!2574 e!5442))

(declare-fun res!9234 () Bool)

(assert (=> d!2574 (=> (not res!9234) (not e!5442))))

(declare-fun lt!12944 () (_ BitVec 64))

(declare-fun lt!12943 () (_ BitVec 64))

(declare-fun lt!12945 () (_ BitVec 64))

(assert (=> d!2574 (= res!9234 (= lt!12944 (bvsub lt!12943 lt!12945)))))

(assert (=> d!2574 (or (= (bvand lt!12943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12945 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12943 lt!12945) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2574 (= lt!12945 (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486))))))

(declare-fun lt!12946 () (_ BitVec 64))

(declare-fun lt!12947 () (_ BitVec 64))

(assert (=> d!2574 (= lt!12943 (bvmul lt!12946 lt!12947))))

(assert (=> d!2574 (or (= lt!12946 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!12947 (bvsdiv (bvmul lt!12946 lt!12947) lt!12946)))))

(assert (=> d!2574 (= lt!12947 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2574 (= lt!12946 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))))))

(assert (=> d!2574 (= lt!12944 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 thiss!1486))))))

(assert (=> d!2574 (invariant!0 (currentBit!1615 thiss!1486) (currentByte!1620 thiss!1486) (size!245 (buf!581 thiss!1486)))))

(assert (=> d!2574 (= (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)) lt!12944)))

(declare-fun b!8749 () Bool)

(declare-fun res!9233 () Bool)

(assert (=> b!8749 (=> (not res!9233) (not e!5442))))

(assert (=> b!8749 (= res!9233 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12944))))

(declare-fun b!8750 () Bool)

(declare-fun lt!12942 () (_ BitVec 64))

(assert (=> b!8750 (= e!5442 (bvsle lt!12944 (bvmul lt!12942 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8750 (or (= lt!12942 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!12942 #b0000000000000000000000000000000000000000000000000000000000001000) lt!12942)))))

(assert (=> b!8750 (= lt!12942 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))))))

(assert (= (and d!2574 res!9234) b!8749))

(assert (= (and b!8749 res!9233) b!8750))

(assert (=> d!2574 m!12049))

(assert (=> d!2574 m!11867))

(assert (=> b!8633 d!2574))

(declare-fun d!2576 () Bool)

(assert (=> d!2576 (= (array_inv!240 (buf!581 thiss!1486)) (bvsge (size!245 (buf!581 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8632 d!2576))

(declare-fun d!2580 () Bool)

(declare-fun c!492 () Bool)

(assert (=> d!2580 (= c!492 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5449 () List!142)

(assert (=> d!2580 (= (byteArrayBitContentToList!0 (_2!612 lt!12518) (_1!614 (readBits!0 (_1!613 lt!12517) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!5449)))

(declare-fun b!8763 () Bool)

(assert (=> b!8763 (= e!5449 Nil!139)))

(declare-fun b!8764 () Bool)

(assert (=> b!8764 (= e!5449 (Cons!138 (not (= (bvand ((_ sign_extend 24) (select (arr!650 (_1!614 (readBits!0 (_1!613 lt!12517) nBits!460))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!612 lt!12518) (_1!614 (readBits!0 (_1!613 lt!12517) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2580 c!492) b!8763))

(assert (= (and d!2580 (not c!492)) b!8764))

(declare-fun m!12153 () Bool)

(assert (=> b!8764 m!12153))

(declare-fun m!12155 () Bool)

(assert (=> b!8764 m!12155))

(declare-fun m!12157 () Bool)

(assert (=> b!8764 m!12157))

(assert (=> b!8631 d!2580))

(declare-fun lt!13063 () (_ BitVec 64))

(declare-fun e!5467 () Bool)

(declare-fun lt!13061 () (_ BitVec 64))

(declare-fun lt!13050 () tuple2!1164)

(declare-fun b!8801 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!468 (_ BitVec 64)) BitStream!468)

(assert (=> b!8801 (= e!5467 (= (_1!613 lt!13050) (withMovedBitIndex!0 (_2!613 lt!13050) (bvsub lt!13063 lt!13061))))))

(assert (=> b!8801 (or (= (bvand lt!13063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13061 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13063 lt!13061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8801 (= lt!13061 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12518))) (currentByte!1620 (_2!612 lt!12518)) (currentBit!1615 (_2!612 lt!12518))))))

(assert (=> b!8801 (= lt!13063 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(declare-fun d!2582 () Bool)

(assert (=> d!2582 e!5467))

(declare-fun res!9247 () Bool)

(assert (=> d!2582 (=> (not res!9247) (not e!5467))))

(assert (=> d!2582 (= res!9247 (isPrefixOf!0 (_1!613 lt!13050) (_2!613 lt!13050)))))

(declare-fun lt!13046 () BitStream!468)

(assert (=> d!2582 (= lt!13050 (tuple2!1165 lt!13046 (_2!612 lt!12518)))))

(declare-fun lt!13054 () Unit!744)

(declare-fun lt!13055 () Unit!744)

(assert (=> d!2582 (= lt!13054 lt!13055)))

(assert (=> d!2582 (isPrefixOf!0 lt!13046 (_2!612 lt!12518))))

(assert (=> d!2582 (= lt!13055 (lemmaIsPrefixTransitive!0 lt!13046 (_2!612 lt!12518) (_2!612 lt!12518)))))

(declare-fun lt!13062 () Unit!744)

(declare-fun lt!13056 () Unit!744)

(assert (=> d!2582 (= lt!13062 lt!13056)))

(assert (=> d!2582 (isPrefixOf!0 lt!13046 (_2!612 lt!12518))))

(assert (=> d!2582 (= lt!13056 (lemmaIsPrefixTransitive!0 lt!13046 thiss!1486 (_2!612 lt!12518)))))

(declare-fun lt!13058 () Unit!744)

(declare-fun e!5466 () Unit!744)

(assert (=> d!2582 (= lt!13058 e!5466)))

(declare-fun c!505 () Bool)

(assert (=> d!2582 (= c!505 (not (= (size!245 (buf!581 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!13064 () Unit!744)

(declare-fun lt!13049 () Unit!744)

(assert (=> d!2582 (= lt!13064 lt!13049)))

(assert (=> d!2582 (isPrefixOf!0 (_2!612 lt!12518) (_2!612 lt!12518))))

(assert (=> d!2582 (= lt!13049 (lemmaIsPrefixRefl!0 (_2!612 lt!12518)))))

(declare-fun lt!13059 () Unit!744)

(declare-fun lt!13048 () Unit!744)

(assert (=> d!2582 (= lt!13059 lt!13048)))

(assert (=> d!2582 (= lt!13048 (lemmaIsPrefixRefl!0 (_2!612 lt!12518)))))

(declare-fun lt!13053 () Unit!744)

(declare-fun lt!13051 () Unit!744)

(assert (=> d!2582 (= lt!13053 lt!13051)))

(assert (=> d!2582 (isPrefixOf!0 lt!13046 lt!13046)))

(assert (=> d!2582 (= lt!13051 (lemmaIsPrefixRefl!0 lt!13046))))

(declare-fun lt!13057 () Unit!744)

(declare-fun lt!13065 () Unit!744)

(assert (=> d!2582 (= lt!13057 lt!13065)))

(assert (=> d!2582 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2582 (= lt!13065 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2582 (= lt!13046 (BitStream!469 (buf!581 (_2!612 lt!12518)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(assert (=> d!2582 (isPrefixOf!0 thiss!1486 (_2!612 lt!12518))))

(assert (=> d!2582 (= (reader!0 thiss!1486 (_2!612 lt!12518)) lt!13050)))

(declare-fun b!8802 () Bool)

(declare-fun lt!13052 () Unit!744)

(assert (=> b!8802 (= e!5466 lt!13052)))

(declare-fun lt!13060 () (_ BitVec 64))

(assert (=> b!8802 (= lt!13060 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13047 () (_ BitVec 64))

(assert (=> b!8802 (= lt!13047 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!572 array!572 (_ BitVec 64) (_ BitVec 64)) Unit!744)

(assert (=> b!8802 (= lt!13052 (arrayBitRangesEqSymmetric!0 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12518)) lt!13060 lt!13047))))

(assert (=> b!8802 (arrayBitRangesEq!0 (buf!581 (_2!612 lt!12518)) (buf!581 thiss!1486) lt!13060 lt!13047)))

(declare-fun b!8803 () Bool)

(declare-fun res!9249 () Bool)

(assert (=> b!8803 (=> (not res!9249) (not e!5467))))

(assert (=> b!8803 (= res!9249 (isPrefixOf!0 (_1!613 lt!13050) thiss!1486))))

(declare-fun b!8804 () Bool)

(declare-fun Unit!769 () Unit!744)

(assert (=> b!8804 (= e!5466 Unit!769)))

(declare-fun b!8805 () Bool)

(declare-fun res!9248 () Bool)

(assert (=> b!8805 (=> (not res!9248) (not e!5467))))

(assert (=> b!8805 (= res!9248 (isPrefixOf!0 (_2!613 lt!13050) (_2!612 lt!12518)))))

(assert (= (and d!2582 c!505) b!8802))

(assert (= (and d!2582 (not c!505)) b!8804))

(assert (= (and d!2582 res!9247) b!8803))

(assert (= (and b!8803 res!9249) b!8805))

(assert (= (and b!8805 res!9248) b!8801))

(declare-fun m!12175 () Bool)

(assert (=> b!8801 m!12175))

(assert (=> b!8801 m!11831))

(assert (=> b!8801 m!11833))

(assert (=> d!2582 m!11873))

(assert (=> d!2582 m!11829))

(declare-fun m!12177 () Bool)

(assert (=> d!2582 m!12177))

(assert (=> d!2582 m!11875))

(declare-fun m!12179 () Bool)

(assert (=> d!2582 m!12179))

(declare-fun m!12181 () Bool)

(assert (=> d!2582 m!12181))

(declare-fun m!12183 () Bool)

(assert (=> d!2582 m!12183))

(declare-fun m!12185 () Bool)

(assert (=> d!2582 m!12185))

(declare-fun m!12187 () Bool)

(assert (=> d!2582 m!12187))

(declare-fun m!12189 () Bool)

(assert (=> d!2582 m!12189))

(declare-fun m!12191 () Bool)

(assert (=> d!2582 m!12191))

(declare-fun m!12193 () Bool)

(assert (=> b!8803 m!12193))

(declare-fun m!12195 () Bool)

(assert (=> b!8805 m!12195))

(assert (=> b!8802 m!11833))

(declare-fun m!12197 () Bool)

(assert (=> b!8802 m!12197))

(declare-fun m!12199 () Bool)

(assert (=> b!8802 m!12199))

(assert (=> b!8631 d!2582))

(declare-fun d!2588 () Bool)

(assert (=> d!2588 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) nBits!460)))

(declare-fun lt!13088 () Unit!744)

(declare-fun choose!9 (BitStream!468 array!572 (_ BitVec 64) BitStream!468) Unit!744)

(assert (=> d!2588 (= lt!13088 (choose!9 thiss!1486 (buf!581 (_2!612 lt!12518)) nBits!460 (BitStream!469 (buf!581 (_2!612 lt!12518)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(assert (=> d!2588 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!581 (_2!612 lt!12518)) nBits!460) lt!13088)))

(declare-fun bs!852 () Bool)

(assert (= bs!852 d!2588))

(assert (=> bs!852 m!11819))

(declare-fun m!12227 () Bool)

(assert (=> bs!852 m!12227))

(assert (=> b!8631 d!2588))

(declare-fun d!2592 () Bool)

(assert (=> d!2592 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486))) nBits!460))))

(declare-fun bs!853 () Bool)

(assert (= bs!853 d!2592))

(declare-fun m!12229 () Bool)

(assert (=> bs!853 m!12229))

(assert (=> b!8631 d!2592))

(declare-fun lt!13197 () tuple2!1166)

(declare-fun b!8855 () Bool)

(declare-fun e!5480 () Bool)

(assert (=> b!8855 (= e!5480 (= (byteArrayBitContentToList!0 (_2!614 lt!13197) (_1!614 lt!13197) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!614 lt!13197) (_1!613 lt!12517) nBits!460)))))

(declare-fun b!8856 () Bool)

(declare-fun res!9294 () Bool)

(assert (=> b!8856 (=> (not res!9294) (not e!5480))))

(assert (=> b!8856 (= res!9294 (invariant!0 (currentBit!1615 (_2!614 lt!13197)) (currentByte!1620 (_2!614 lt!13197)) (size!245 (buf!581 (_2!614 lt!13197)))))))

(declare-fun d!2594 () Bool)

(assert (=> d!2594 e!5480))

(declare-fun res!9296 () Bool)

(assert (=> d!2594 (=> (not res!9296) (not e!5480))))

(assert (=> d!2594 (= res!9296 (= (buf!581 (_2!614 lt!13197)) (buf!581 (_1!613 lt!12517))))))

(declare-datatypes ((tuple3!64 0))(
  ( (tuple3!65 (_1!621 Unit!744) (_2!621 BitStream!468) (_3!32 array!572)) )
))
(declare-fun lt!13193 () tuple3!64)

(assert (=> d!2594 (= lt!13197 (tuple2!1167 (_3!32 lt!13193) (_2!621 lt!13193)))))

(declare-fun readBitsLoop!0 (BitStream!468 (_ BitVec 64) array!572 (_ BitVec 64) (_ BitVec 64)) tuple3!64)

(assert (=> d!2594 (= lt!13193 (readBitsLoop!0 (_1!613 lt!12517) nBits!460 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2594 (= (readBits!0 (_1!613 lt!12517) nBits!460) lt!13197)))

(declare-fun b!8857 () Bool)

(declare-fun res!9295 () Bool)

(assert (=> b!8857 (=> (not res!9295) (not e!5480))))

(declare-fun lt!13199 () (_ BitVec 64))

(assert (=> b!8857 (= res!9295 (= (bvadd lt!13199 nBits!460) (bitIndex!0 (size!245 (buf!581 (_2!614 lt!13197))) (currentByte!1620 (_2!614 lt!13197)) (currentBit!1615 (_2!614 lt!13197)))))))

(assert (=> b!8857 (or (not (= (bvand lt!13199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13199 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8857 (= lt!13199 (bitIndex!0 (size!245 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)) (currentBit!1615 (_1!613 lt!12517))))))

(declare-fun b!8858 () Bool)

(declare-fun res!9297 () Bool)

(assert (=> b!8858 (=> (not res!9297) (not e!5480))))

(declare-fun lt!13200 () (_ BitVec 64))

(assert (=> b!8858 (= res!9297 (= (size!245 (_1!614 lt!13197)) ((_ extract 31 0) lt!13200)))))

(assert (=> b!8858 (and (bvslt lt!13200 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!13200 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!13198 () (_ BitVec 64))

(declare-fun lt!13196 () (_ BitVec 64))

(assert (=> b!8858 (= lt!13200 (bvsdiv lt!13198 lt!13196))))

(assert (=> b!8858 (and (not (= lt!13196 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!13198 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!13196 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!8858 (= lt!13196 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!13192 () (_ BitVec 64))

(declare-fun lt!13194 () (_ BitVec 64))

(assert (=> b!8858 (= lt!13198 (bvsub lt!13192 lt!13194))))

(assert (=> b!8858 (or (= (bvand lt!13192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13192 lt!13194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8858 (= lt!13194 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13195 () (_ BitVec 64))

(assert (=> b!8858 (= lt!13192 (bvadd nBits!460 lt!13195))))

(assert (=> b!8858 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13195 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!13195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8858 (= lt!13195 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!8859 () Bool)

(declare-fun res!9293 () Bool)

(assert (=> b!8859 (=> (not res!9293) (not e!5480))))

(assert (=> b!8859 (= res!9293 (bvsle (currentByte!1620 (_1!613 lt!12517)) (currentByte!1620 (_2!614 lt!13197))))))

(assert (= (and d!2594 res!9296) b!8857))

(assert (= (and b!8857 res!9295) b!8856))

(assert (= (and b!8856 res!9294) b!8858))

(assert (= (and b!8858 res!9297) b!8859))

(assert (= (and b!8859 res!9293) b!8855))

(declare-fun m!12257 () Bool)

(assert (=> b!8855 m!12257))

(declare-fun m!12259 () Bool)

(assert (=> b!8855 m!12259))

(declare-fun m!12261 () Bool)

(assert (=> b!8856 m!12261))

(declare-fun m!12263 () Bool)

(assert (=> d!2594 m!12263))

(declare-fun m!12265 () Bool)

(assert (=> b!8857 m!12265))

(declare-fun m!12267 () Bool)

(assert (=> b!8857 m!12267))

(assert (=> b!8631 d!2594))

(declare-fun b!8889 () Bool)

(declare-datatypes ((tuple2!1182 0))(
  ( (tuple2!1183 (_1!624 List!142) (_2!624 BitStream!468)) )
))
(declare-fun e!5495 () tuple2!1182)

(assert (=> b!8889 (= e!5495 (tuple2!1183 Nil!139 (_1!613 lt!12517)))))

(declare-fun b!8891 () Bool)

(declare-fun e!5494 () Bool)

(declare-fun lt!13255 () List!142)

(declare-fun isEmpty!27 (List!142) Bool)

(assert (=> b!8891 (= e!5494 (isEmpty!27 lt!13255))))

(declare-fun b!8892 () Bool)

(declare-fun length!22 (List!142) Int)

(assert (=> b!8892 (= e!5494 (> (length!22 lt!13255) 0))))

(declare-fun b!8890 () Bool)

(declare-fun lt!13256 () (_ BitVec 64))

(declare-datatypes ((tuple2!1184 0))(
  ( (tuple2!1185 (_1!625 Bool) (_2!625 BitStream!468)) )
))
(declare-fun lt!13254 () tuple2!1184)

(assert (=> b!8890 (= e!5495 (tuple2!1183 (Cons!138 (_1!625 lt!13254) (bitStreamReadBitsIntoList!0 (_2!612 lt!12518) (_2!625 lt!13254) (bvsub nBits!460 lt!13256))) (_2!625 lt!13254)))))

(declare-fun readBit!0 (BitStream!468) tuple2!1184)

(assert (=> b!8890 (= lt!13254 (readBit!0 (_1!613 lt!12517)))))

(assert (=> b!8890 (= lt!13256 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2602 () Bool)

(assert (=> d!2602 e!5494))

(declare-fun c!518 () Bool)

(assert (=> d!2602 (= c!518 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2602 (= lt!13255 (_1!624 e!5495))))

(declare-fun c!517 () Bool)

(assert (=> d!2602 (= c!517 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2602 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2602 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12518) (_1!613 lt!12517) nBits!460) lt!13255)))

(assert (= (and d!2602 c!517) b!8889))

(assert (= (and d!2602 (not c!517)) b!8890))

(assert (= (and d!2602 c!518) b!8891))

(assert (= (and d!2602 (not c!518)) b!8892))

(declare-fun m!12305 () Bool)

(assert (=> b!8891 m!12305))

(declare-fun m!12307 () Bool)

(assert (=> b!8892 m!12307))

(declare-fun m!12309 () Bool)

(assert (=> b!8890 m!12309))

(declare-fun m!12311 () Bool)

(assert (=> b!8890 m!12311))

(assert (=> b!8631 d!2602))

(check-sat (not b!8664) (not bm!132) (not b!8718) (not b!8713) (not b!8892) (not d!2592) (not b!8803) (not d!2594) (not d!2550) (not d!2582) (not b!8662) (not b!8856) (not d!2588) (not b!8715) (not b!8716) (not b!8764) (not b!8720) (not b!8714) (not d!2564) (not b!8805) (not b!8802) (not b!8801) (not b!8857) (not d!2560) (not b!8891) (not b!8890) (not d!2556) (not b!8855) (not d!2574))
(check-sat)
(get-model)

(declare-fun d!2632 () Bool)

(assert (=> d!2632 (= (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 thiss!1486)))))))

(assert (=> d!2592 d!2632))

(declare-fun d!2634 () Bool)

(assert (=> d!2634 (= (invariant!0 (currentBit!1615 (_2!612 lt!12805)) (currentByte!1620 (_2!612 lt!12805)) (size!245 (buf!581 (_2!612 lt!12805)))) (and (bvsge (currentBit!1615 (_2!612 lt!12805)) #b00000000000000000000000000000000) (bvslt (currentBit!1615 (_2!612 lt!12805)) #b00000000000000000000000000001000) (bvsge (currentByte!1620 (_2!612 lt!12805)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1620 (_2!612 lt!12805)) (size!245 (buf!581 (_2!612 lt!12805)))) (and (= (currentBit!1615 (_2!612 lt!12805)) #b00000000000000000000000000000000) (= (currentByte!1620 (_2!612 lt!12805)) (size!245 (buf!581 (_2!612 lt!12805))))))))))

(assert (=> b!8716 d!2634))

(declare-fun d!2636 () Bool)

(assert (=> d!2636 (= (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 thiss!1486)))))))

(assert (=> d!2560 d!2636))

(declare-fun d!2638 () Bool)

(assert (=> d!2638 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) lt!12821) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825)))) lt!12821))))

(declare-fun bs!860 () Bool)

(assert (= bs!860 d!2638))

(declare-fun m!12327 () Bool)

(assert (=> bs!860 m!12327))

(assert (=> b!8714 d!2638))

(declare-fun d!2640 () Bool)

(declare-fun e!5516 () Bool)

(assert (=> d!2640 e!5516))

(declare-fun res!9343 () Bool)

(assert (=> d!2640 (=> (not res!9343) (not e!5516))))

(assert (=> d!2640 (= res!9343 (or (= (bvand lt!12826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12827 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12826 lt!12827) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!13295 () Unit!744)

(declare-fun choose!27 (BitStream!468 BitStream!468 (_ BitVec 64) (_ BitVec 64)) Unit!744)

(assert (=> d!2640 (= lt!13295 (choose!27 thiss!1486 (_2!612 lt!12825) lt!12826 lt!12827))))

(assert (=> d!2640 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12827) (bvsle lt!12827 lt!12826))))

(assert (=> d!2640 (= (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!612 lt!12825) lt!12826 lt!12827) lt!13295)))

(declare-fun b!8925 () Bool)

(assert (=> b!8925 (= e!5516 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) (bvsub lt!12826 lt!12827)))))

(assert (= (and d!2640 res!9343) b!8925))

(declare-fun m!12329 () Bool)

(assert (=> d!2640 m!12329))

(assert (=> b!8925 m!11893))

(assert (=> b!8714 d!2640))

(declare-fun d!2642 () Bool)

(assert (=> d!2642 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) (bvsub lt!12826 lt!12827)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825)))) (bvsub lt!12826 lt!12827)))))

(declare-fun bs!861 () Bool)

(assert (= bs!861 d!2642))

(declare-fun m!12331 () Bool)

(assert (=> bs!861 m!12331))

(assert (=> b!8714 d!2642))

(declare-fun lt!13311 () (_ BitVec 64))

(declare-fun lt!13313 () (_ BitVec 64))

(declare-fun b!8926 () Bool)

(declare-fun e!5518 () Bool)

(declare-fun lt!13300 () tuple2!1164)

(assert (=> b!8926 (= e!5518 (= (_1!613 lt!13300) (withMovedBitIndex!0 (_2!613 lt!13300) (bvsub lt!13313 lt!13311))))))

(assert (=> b!8926 (or (= (bvand lt!13313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13311 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13313 lt!13311) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8926 (= lt!13311 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12816))) (currentByte!1620 (_2!612 lt!12816)) (currentBit!1615 (_2!612 lt!12816))))))

(assert (=> b!8926 (= lt!13313 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825))))))

(declare-fun d!2644 () Bool)

(assert (=> d!2644 e!5518))

(declare-fun res!9344 () Bool)

(assert (=> d!2644 (=> (not res!9344) (not e!5518))))

(assert (=> d!2644 (= res!9344 (isPrefixOf!0 (_1!613 lt!13300) (_2!613 lt!13300)))))

(declare-fun lt!13296 () BitStream!468)

(assert (=> d!2644 (= lt!13300 (tuple2!1165 lt!13296 (_2!612 lt!12816)))))

(declare-fun lt!13304 () Unit!744)

(declare-fun lt!13305 () Unit!744)

(assert (=> d!2644 (= lt!13304 lt!13305)))

(assert (=> d!2644 (isPrefixOf!0 lt!13296 (_2!612 lt!12816))))

(assert (=> d!2644 (= lt!13305 (lemmaIsPrefixTransitive!0 lt!13296 (_2!612 lt!12816) (_2!612 lt!12816)))))

(declare-fun lt!13312 () Unit!744)

(declare-fun lt!13306 () Unit!744)

(assert (=> d!2644 (= lt!13312 lt!13306)))

(assert (=> d!2644 (isPrefixOf!0 lt!13296 (_2!612 lt!12816))))

(assert (=> d!2644 (= lt!13306 (lemmaIsPrefixTransitive!0 lt!13296 (_2!612 lt!12825) (_2!612 lt!12816)))))

(declare-fun lt!13308 () Unit!744)

(declare-fun e!5517 () Unit!744)

(assert (=> d!2644 (= lt!13308 e!5517)))

(declare-fun c!519 () Bool)

(assert (=> d!2644 (= c!519 (not (= (size!245 (buf!581 (_2!612 lt!12825))) #b00000000000000000000000000000000)))))

(declare-fun lt!13314 () Unit!744)

(declare-fun lt!13299 () Unit!744)

(assert (=> d!2644 (= lt!13314 lt!13299)))

(assert (=> d!2644 (isPrefixOf!0 (_2!612 lt!12816) (_2!612 lt!12816))))

(assert (=> d!2644 (= lt!13299 (lemmaIsPrefixRefl!0 (_2!612 lt!12816)))))

(declare-fun lt!13309 () Unit!744)

(declare-fun lt!13298 () Unit!744)

(assert (=> d!2644 (= lt!13309 lt!13298)))

(assert (=> d!2644 (= lt!13298 (lemmaIsPrefixRefl!0 (_2!612 lt!12816)))))

(declare-fun lt!13303 () Unit!744)

(declare-fun lt!13301 () Unit!744)

(assert (=> d!2644 (= lt!13303 lt!13301)))

(assert (=> d!2644 (isPrefixOf!0 lt!13296 lt!13296)))

(assert (=> d!2644 (= lt!13301 (lemmaIsPrefixRefl!0 lt!13296))))

(declare-fun lt!13307 () Unit!744)

(declare-fun lt!13315 () Unit!744)

(assert (=> d!2644 (= lt!13307 lt!13315)))

(assert (=> d!2644 (isPrefixOf!0 (_2!612 lt!12825) (_2!612 lt!12825))))

(assert (=> d!2644 (= lt!13315 (lemmaIsPrefixRefl!0 (_2!612 lt!12825)))))

(assert (=> d!2644 (= lt!13296 (BitStream!469 (buf!581 (_2!612 lt!12816)) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825))))))

(assert (=> d!2644 (isPrefixOf!0 (_2!612 lt!12825) (_2!612 lt!12816))))

(assert (=> d!2644 (= (reader!0 (_2!612 lt!12825) (_2!612 lt!12816)) lt!13300)))

(declare-fun b!8927 () Bool)

(declare-fun lt!13302 () Unit!744)

(assert (=> b!8927 (= e!5517 lt!13302)))

(declare-fun lt!13310 () (_ BitVec 64))

(assert (=> b!8927 (= lt!13310 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13297 () (_ BitVec 64))

(assert (=> b!8927 (= lt!13297 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825))))))

(assert (=> b!8927 (= lt!13302 (arrayBitRangesEqSymmetric!0 (buf!581 (_2!612 lt!12825)) (buf!581 (_2!612 lt!12816)) lt!13310 lt!13297))))

(assert (=> b!8927 (arrayBitRangesEq!0 (buf!581 (_2!612 lt!12816)) (buf!581 (_2!612 lt!12825)) lt!13310 lt!13297)))

(declare-fun b!8928 () Bool)

(declare-fun res!9346 () Bool)

(assert (=> b!8928 (=> (not res!9346) (not e!5518))))

(assert (=> b!8928 (= res!9346 (isPrefixOf!0 (_1!613 lt!13300) (_2!612 lt!12825)))))

(declare-fun b!8929 () Bool)

(declare-fun Unit!772 () Unit!744)

(assert (=> b!8929 (= e!5517 Unit!772)))

(declare-fun b!8930 () Bool)

(declare-fun res!9345 () Bool)

(assert (=> b!8930 (=> (not res!9345) (not e!5518))))

(assert (=> b!8930 (= res!9345 (isPrefixOf!0 (_2!613 lt!13300) (_2!612 lt!12816)))))

(assert (= (and d!2644 c!519) b!8927))

(assert (= (and d!2644 (not c!519)) b!8929))

(assert (= (and d!2644 res!9344) b!8928))

(assert (= (and b!8928 res!9346) b!8930))

(assert (= (and b!8930 res!9345) b!8926))

(declare-fun m!12333 () Bool)

(assert (=> b!8926 m!12333))

(assert (=> b!8926 m!11891))

(assert (=> b!8926 m!11923))

(declare-fun m!12335 () Bool)

(assert (=> d!2644 m!12335))

(declare-fun m!12337 () Bool)

(assert (=> d!2644 m!12337))

(declare-fun m!12339 () Bool)

(assert (=> d!2644 m!12339))

(declare-fun m!12341 () Bool)

(assert (=> d!2644 m!12341))

(declare-fun m!12343 () Bool)

(assert (=> d!2644 m!12343))

(declare-fun m!12345 () Bool)

(assert (=> d!2644 m!12345))

(declare-fun m!12347 () Bool)

(assert (=> d!2644 m!12347))

(declare-fun m!12349 () Bool)

(assert (=> d!2644 m!12349))

(declare-fun m!12351 () Bool)

(assert (=> d!2644 m!12351))

(declare-fun m!12353 () Bool)

(assert (=> d!2644 m!12353))

(declare-fun m!12355 () Bool)

(assert (=> d!2644 m!12355))

(declare-fun m!12357 () Bool)

(assert (=> b!8928 m!12357))

(declare-fun m!12359 () Bool)

(assert (=> b!8930 m!12359))

(assert (=> b!8927 m!11923))

(declare-fun m!12361 () Bool)

(assert (=> b!8927 m!12361))

(declare-fun m!12363 () Bool)

(assert (=> b!8927 m!12363))

(assert (=> b!8714 d!2644))

(assert (=> b!8714 d!2574))

(declare-fun d!2646 () Bool)

(declare-fun e!5519 () Bool)

(assert (=> d!2646 e!5519))

(declare-fun res!9348 () Bool)

(assert (=> d!2646 (=> (not res!9348) (not e!5519))))

(declare-fun lt!13317 () (_ BitVec 64))

(declare-fun lt!13319 () (_ BitVec 64))

(declare-fun lt!13318 () (_ BitVec 64))

(assert (=> d!2646 (= res!9348 (= lt!13318 (bvsub lt!13317 lt!13319)))))

(assert (=> d!2646 (or (= (bvand lt!13317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13319 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13317 lt!13319) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2646 (= lt!13319 (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825)))))))

(declare-fun lt!13320 () (_ BitVec 64))

(declare-fun lt!13321 () (_ BitVec 64))

(assert (=> d!2646 (= lt!13317 (bvmul lt!13320 lt!13321))))

(assert (=> d!2646 (or (= lt!13320 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13321 (bvsdiv (bvmul lt!13320 lt!13321) lt!13320)))))

(assert (=> d!2646 (= lt!13321 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2646 (= lt!13320 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))))))

(assert (=> d!2646 (= lt!13318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825)))))))

(assert (=> d!2646 (invariant!0 (currentBit!1615 (_2!612 lt!12825)) (currentByte!1620 (_2!612 lt!12825)) (size!245 (buf!581 (_2!612 lt!12825))))))

(assert (=> d!2646 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825))) lt!13318)))

(declare-fun b!8931 () Bool)

(declare-fun res!9347 () Bool)

(assert (=> b!8931 (=> (not res!9347) (not e!5519))))

(assert (=> b!8931 (= res!9347 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13318))))

(declare-fun b!8932 () Bool)

(declare-fun lt!13316 () (_ BitVec 64))

(assert (=> b!8932 (= e!5519 (bvsle lt!13318 (bvmul lt!13316 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8932 (or (= lt!13316 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13316 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13316)))))

(assert (=> b!8932 (= lt!13316 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))))))

(assert (= (and d!2646 res!9348) b!8931))

(assert (= (and b!8931 res!9347) b!8932))

(assert (=> d!2646 m!12331))

(declare-fun m!12365 () Bool)

(assert (=> d!2646 m!12365))

(assert (=> b!8714 d!2646))

(declare-fun d!2648 () Bool)

(assert (=> d!2648 (= (bitAt!0 (buf!581 (_2!612 lt!12825)) lt!12798) (not (= (bvand ((_ sign_extend 24) (select (arr!650 (buf!581 (_2!612 lt!12825))) ((_ extract 31 0) (bvsdiv lt!12798 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!12798 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!862 () Bool)

(assert (= bs!862 d!2648))

(declare-fun m!12367 () Bool)

(assert (=> bs!862 m!12367))

(declare-fun m!12369 () Bool)

(assert (=> bs!862 m!12369))

(assert (=> b!8714 d!2648))

(declare-fun d!2650 () Bool)

(assert (=> d!2650 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12817)))

(declare-fun lt!13322 () Unit!744)

(assert (=> d!2650 (= lt!13322 (choose!9 thiss!1486 (buf!581 (_2!612 lt!12825)) lt!12817 (BitStream!469 (buf!581 (_2!612 lt!12825)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(assert (=> d!2650 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!581 (_2!612 lt!12825)) lt!12817) lt!13322)))

(declare-fun bs!863 () Bool)

(assert (= bs!863 d!2650))

(assert (=> bs!863 m!11913))

(declare-fun m!12371 () Bool)

(assert (=> bs!863 m!12371))

(assert (=> b!8714 d!2650))

(declare-fun d!2652 () Bool)

(declare-fun c!520 () Bool)

(assert (=> d!2652 (= c!520 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5520 () List!142)

(assert (=> d!2652 (= (byteArrayBitContentToList!0 (_2!612 lt!12816) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) e!5520)))

(declare-fun b!8933 () Bool)

(assert (=> b!8933 (= e!5520 Nil!139)))

(declare-fun b!8934 () Bool)

(assert (=> b!8934 (= e!5520 (Cons!138 (not (= (bvand ((_ sign_extend 24) (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!612 lt!12816) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2652 c!520) b!8933))

(assert (= (and d!2652 (not c!520)) b!8934))

(declare-fun m!12373 () Bool)

(assert (=> b!8934 m!12373))

(declare-fun m!12375 () Bool)

(assert (=> b!8934 m!12375))

(declare-fun m!12377 () Bool)

(assert (=> b!8934 m!12377))

(assert (=> b!8714 d!2652))

(declare-fun b!8935 () Bool)

(declare-fun e!5522 () tuple2!1182)

(assert (=> b!8935 (= e!5522 (tuple2!1183 Nil!139 (_1!613 lt!12797)))))

(declare-fun b!8937 () Bool)

(declare-fun e!5521 () Bool)

(declare-fun lt!13324 () List!142)

(assert (=> b!8937 (= e!5521 (isEmpty!27 lt!13324))))

(declare-fun b!8938 () Bool)

(assert (=> b!8938 (= e!5521 (> (length!22 lt!13324) 0))))

(declare-fun lt!13325 () (_ BitVec 64))

(declare-fun lt!13323 () tuple2!1184)

(declare-fun b!8936 () Bool)

(assert (=> b!8936 (= e!5522 (tuple2!1183 (Cons!138 (_1!625 lt!13323) (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_2!625 lt!13323) (bvsub (bvsub lt!12819 #b0000000000000000000000000000000000000000000000000000000000000001) lt!13325))) (_2!625 lt!13323)))))

(assert (=> b!8936 (= lt!13323 (readBit!0 (_1!613 lt!12797)))))

(assert (=> b!8936 (= lt!13325 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2654 () Bool)

(assert (=> d!2654 e!5521))

(declare-fun c!522 () Bool)

(assert (=> d!2654 (= c!522 (= (bvsub lt!12819 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2654 (= lt!13324 (_1!624 e!5522))))

(declare-fun c!521 () Bool)

(assert (=> d!2654 (= c!521 (= (bvsub lt!12819 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2654 (bvsge (bvsub lt!12819 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2654 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_1!613 lt!12797) (bvsub lt!12819 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!13324)))

(assert (= (and d!2654 c!521) b!8935))

(assert (= (and d!2654 (not c!521)) b!8936))

(assert (= (and d!2654 c!522) b!8937))

(assert (= (and d!2654 (not c!522)) b!8938))

(declare-fun m!12379 () Bool)

(assert (=> b!8937 m!12379))

(declare-fun m!12381 () Bool)

(assert (=> b!8938 m!12381))

(declare-fun m!12383 () Bool)

(assert (=> b!8936 m!12383))

(declare-fun m!12385 () Bool)

(assert (=> b!8936 m!12385))

(assert (=> b!8714 d!2654))

(declare-fun d!2656 () Bool)

(assert (=> d!2656 (= (tail!55 lt!12835) (t!892 lt!12835))))

(assert (=> b!8714 d!2656))

(declare-fun d!2658 () Bool)

(assert (=> d!2658 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) lt!12821)))

(declare-fun lt!13326 () Unit!744)

(assert (=> d!2658 (= lt!13326 (choose!9 (_2!612 lt!12825) (buf!581 (_2!612 lt!12816)) lt!12821 (BitStream!469 (buf!581 (_2!612 lt!12816)) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825)))))))

(assert (=> d!2658 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!612 lt!12825) (buf!581 (_2!612 lt!12816)) lt!12821) lt!13326)))

(declare-fun bs!864 () Bool)

(assert (= bs!864 d!2658))

(assert (=> bs!864 m!11989))

(declare-fun m!12387 () Bool)

(assert (=> bs!864 m!12387))

(assert (=> b!8714 d!2658))

(declare-fun b!8939 () Bool)

(declare-fun e!5524 () tuple2!1182)

(assert (=> b!8939 (= e!5524 (tuple2!1183 Nil!139 (_1!613 lt!12810)))))

(declare-fun b!8941 () Bool)

(declare-fun e!5523 () Bool)

(declare-fun lt!13328 () List!142)

(assert (=> b!8941 (= e!5523 (isEmpty!27 lt!13328))))

(declare-fun b!8942 () Bool)

(assert (=> b!8942 (= e!5523 (> (length!22 lt!13328) 0))))

(declare-fun lt!13327 () tuple2!1184)

(declare-fun lt!13329 () (_ BitVec 64))

(declare-fun b!8940 () Bool)

(assert (=> b!8940 (= e!5524 (tuple2!1183 (Cons!138 (_1!625 lt!13327) (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_2!625 lt!13327) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!13329))) (_2!625 lt!13327)))))

(assert (=> b!8940 (= lt!13327 (readBit!0 (_1!613 lt!12810)))))

(assert (=> b!8940 (= lt!13329 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2660 () Bool)

(assert (=> d!2660 e!5523))

(declare-fun c!524 () Bool)

(assert (=> d!2660 (= c!524 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2660 (= lt!13328 (_1!624 e!5524))))

(declare-fun c!523 () Bool)

(assert (=> d!2660 (= c!523 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2660 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2660 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_1!613 lt!12810) (bvsub (bvadd from!367 nBits!460) from!367)) lt!13328)))

(assert (= (and d!2660 c!523) b!8939))

(assert (= (and d!2660 (not c!523)) b!8940))

(assert (= (and d!2660 c!524) b!8941))

(assert (= (and d!2660 (not c!524)) b!8942))

(declare-fun m!12389 () Bool)

(assert (=> b!8941 m!12389))

(declare-fun m!12391 () Bool)

(assert (=> b!8942 m!12391))

(declare-fun m!12393 () Bool)

(assert (=> b!8940 m!12393))

(declare-fun m!12395 () Bool)

(assert (=> b!8940 m!12395))

(assert (=> b!8714 d!2660))

(declare-fun b!8943 () Bool)

(declare-fun e!5526 () tuple2!1182)

(assert (=> b!8943 (= e!5526 (tuple2!1183 Nil!139 (_1!613 lt!12796)))))

(declare-fun b!8945 () Bool)

(declare-fun e!5525 () Bool)

(declare-fun lt!13331 () List!142)

(assert (=> b!8945 (= e!5525 (isEmpty!27 lt!13331))))

(declare-fun b!8946 () Bool)

(assert (=> b!8946 (= e!5525 (> (length!22 lt!13331) 0))))

(declare-fun b!8944 () Bool)

(declare-fun lt!13330 () tuple2!1184)

(declare-fun lt!13332 () (_ BitVec 64))

(assert (=> b!8944 (= e!5526 (tuple2!1183 (Cons!138 (_1!625 lt!13330) (bitStreamReadBitsIntoList!0 (_2!612 lt!12825) (_2!625 lt!13330) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!13332))) (_2!625 lt!13330)))))

(assert (=> b!8944 (= lt!13330 (readBit!0 (_1!613 lt!12796)))))

(assert (=> b!8944 (= lt!13332 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2662 () Bool)

(assert (=> d!2662 e!5525))

(declare-fun c!526 () Bool)

(assert (=> d!2662 (= c!526 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2662 (= lt!13331 (_1!624 e!5526))))

(declare-fun c!525 () Bool)

(assert (=> d!2662 (= c!525 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2662 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2662 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12825) (_1!613 lt!12796) #b0000000000000000000000000000000000000000000000000000000000000001) lt!13331)))

(assert (= (and d!2662 c!525) b!8943))

(assert (= (and d!2662 (not c!525)) b!8944))

(assert (= (and d!2662 c!526) b!8945))

(assert (= (and d!2662 (not c!526)) b!8946))

(declare-fun m!12397 () Bool)

(assert (=> b!8945 m!12397))

(declare-fun m!12399 () Bool)

(assert (=> b!8946 m!12399))

(declare-fun m!12401 () Bool)

(assert (=> b!8944 m!12401))

(declare-fun m!12403 () Bool)

(assert (=> b!8944 m!12403))

(assert (=> b!8714 d!2662))

(declare-fun d!2664 () Bool)

(declare-fun e!5527 () Bool)

(assert (=> d!2664 e!5527))

(declare-fun res!9350 () Bool)

(assert (=> d!2664 (=> (not res!9350) (not e!5527))))

(declare-fun lt!13335 () (_ BitVec 64))

(declare-fun lt!13334 () (_ BitVec 64))

(declare-fun lt!13336 () (_ BitVec 64))

(assert (=> d!2664 (= res!9350 (= lt!13335 (bvsub lt!13334 lt!13336)))))

(assert (=> d!2664 (or (= (bvand lt!13334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13336 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13334 lt!13336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2664 (= lt!13336 (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12816))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12816)))))))

(declare-fun lt!13337 () (_ BitVec 64))

(declare-fun lt!13338 () (_ BitVec 64))

(assert (=> d!2664 (= lt!13334 (bvmul lt!13337 lt!13338))))

(assert (=> d!2664 (or (= lt!13337 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13338 (bvsdiv (bvmul lt!13337 lt!13338) lt!13337)))))

(assert (=> d!2664 (= lt!13338 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2664 (= lt!13337 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))))))

(assert (=> d!2664 (= lt!13335 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12816))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12816)))))))

(assert (=> d!2664 (invariant!0 (currentBit!1615 (_2!612 lt!12816)) (currentByte!1620 (_2!612 lt!12816)) (size!245 (buf!581 (_2!612 lt!12816))))))

(assert (=> d!2664 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12816))) (currentByte!1620 (_2!612 lt!12816)) (currentBit!1615 (_2!612 lt!12816))) lt!13335)))

(declare-fun b!8947 () Bool)

(declare-fun res!9349 () Bool)

(assert (=> b!8947 (=> (not res!9349) (not e!5527))))

(assert (=> b!8947 (= res!9349 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13335))))

(declare-fun b!8948 () Bool)

(declare-fun lt!13333 () (_ BitVec 64))

(assert (=> b!8948 (= e!5527 (bvsle lt!13335 (bvmul lt!13333 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8948 (or (= lt!13333 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13333 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13333)))))

(assert (=> b!8948 (= lt!13333 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))))))

(assert (= (and d!2664 res!9350) b!8947))

(assert (= (and b!8947 res!9349) b!8948))

(declare-fun m!12405 () Bool)

(assert (=> d!2664 m!12405))

(declare-fun m!12407 () Bool)

(assert (=> d!2664 m!12407))

(assert (=> b!8714 d!2664))

(declare-fun d!2666 () Bool)

(declare-fun e!5530 () Bool)

(assert (=> d!2666 e!5530))

(declare-fun res!9353 () Bool)

(assert (=> d!2666 (=> (not res!9353) (not e!5530))))

(declare-fun lt!13344 () (_ BitVec 64))

(assert (=> d!2666 (= res!9353 (or (= (bvand lt!12819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12819 lt!13344) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!2666 (= lt!13344 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13343 () Unit!744)

(declare-fun choose!42 (BitStream!468 BitStream!468 BitStream!468 BitStream!468 (_ BitVec 64) List!142) Unit!744)

(assert (=> d!2666 (= lt!13343 (choose!42 (_2!612 lt!12816) (_2!612 lt!12816) (_1!613 lt!12810) (_1!613 lt!12797) lt!12819 lt!12835))))

(assert (=> d!2666 (bvsgt lt!12819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2666 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!612 lt!12816) (_2!612 lt!12816) (_1!613 lt!12810) (_1!613 lt!12797) lt!12819 lt!12835) lt!13343)))

(declare-fun b!8951 () Bool)

(assert (=> b!8951 (= e!5530 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_1!613 lt!12797) (bvsub lt!12819 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!55 lt!12835)))))

(assert (= (and d!2666 res!9353) b!8951))

(declare-fun m!12409 () Bool)

(assert (=> d!2666 m!12409))

(assert (=> b!8951 m!11981))

(assert (=> b!8951 m!11975))

(assert (=> b!8714 d!2666))

(declare-fun b!8952 () Bool)

(declare-fun e!5532 () tuple2!1182)

(assert (=> b!8952 (= e!5532 (tuple2!1183 Nil!139 (_1!613 lt!12797)))))

(declare-fun b!8954 () Bool)

(declare-fun e!5531 () Bool)

(declare-fun lt!13346 () List!142)

(assert (=> b!8954 (= e!5531 (isEmpty!27 lt!13346))))

(declare-fun b!8955 () Bool)

(assert (=> b!8955 (= e!5531 (> (length!22 lt!13346) 0))))

(declare-fun lt!13345 () tuple2!1184)

(declare-fun b!8953 () Bool)

(declare-fun lt!13347 () (_ BitVec 64))

(assert (=> b!8953 (= e!5532 (tuple2!1183 (Cons!138 (_1!625 lt!13345) (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_2!625 lt!13345) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) lt!13347))) (_2!625 lt!13345)))))

(assert (=> b!8953 (= lt!13345 (readBit!0 (_1!613 lt!12797)))))

(assert (=> b!8953 (= lt!13347 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2668 () Bool)

(assert (=> d!2668 e!5531))

(declare-fun c!528 () Bool)

(assert (=> d!2668 (= c!528 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2668 (= lt!13346 (_1!624 e!5532))))

(declare-fun c!527 () Bool)

(assert (=> d!2668 (= c!527 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2668 (bvsge (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2668 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12816) (_1!613 lt!12797) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!13346)))

(assert (= (and d!2668 c!527) b!8952))

(assert (= (and d!2668 (not c!527)) b!8953))

(assert (= (and d!2668 c!528) b!8954))

(assert (= (and d!2668 (not c!528)) b!8955))

(declare-fun m!12411 () Bool)

(assert (=> b!8954 m!12411))

(declare-fun m!12413 () Bool)

(assert (=> b!8955 m!12413))

(declare-fun m!12415 () Bool)

(assert (=> b!8953 m!12415))

(assert (=> b!8953 m!12385))

(assert (=> b!8714 d!2668))

(declare-fun d!2670 () Bool)

(declare-fun c!529 () Bool)

(assert (=> d!2670 (= c!529 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5533 () List!142)

(assert (=> d!2670 (= (byteArrayBitContentToList!0 (_2!612 lt!12825) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001) e!5533)))

(declare-fun b!8956 () Bool)

(assert (=> b!8956 (= e!5533 Nil!139)))

(declare-fun b!8957 () Bool)

(assert (=> b!8957 (= e!5533 (Cons!138 (not (= (bvand ((_ sign_extend 24) (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!612 lt!12825) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2670 c!529) b!8956))

(assert (= (and d!2670 (not c!529)) b!8957))

(assert (=> b!8957 m!11931))

(declare-fun m!12417 () Bool)

(assert (=> b!8957 m!12417))

(declare-fun m!12419 () Bool)

(assert (=> b!8957 m!12419))

(assert (=> b!8714 d!2670))

(declare-fun b!8958 () Bool)

(declare-fun e!5535 () tuple2!1162)

(declare-fun Unit!773 () Unit!744)

(assert (=> b!8958 (= e!5535 (tuple2!1163 Unit!773 (_2!612 lt!12825)))))

(assert (=> b!8958 (= (size!245 (buf!581 (_2!612 lt!12825))) (size!245 (buf!581 (_2!612 lt!12825))))))

(declare-fun lt!13348 () Unit!744)

(declare-fun Unit!774 () Unit!744)

(assert (=> b!8958 (= lt!13348 Unit!774)))

(declare-fun call!138 () tuple2!1164)

(assert (=> b!8958 (checkByteArrayBitContent!0 (_2!612 lt!12825) srcBuffer!6 (_1!614 (readBits!0 (_1!613 call!138) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!8959 () Bool)

(declare-fun lt!13372 () tuple2!1162)

(declare-fun Unit!775 () Unit!744)

(assert (=> b!8959 (= e!5535 (tuple2!1163 Unit!775 (_2!612 lt!13372)))))

(declare-fun lt!13381 () tuple2!1162)

(assert (=> b!8959 (= lt!13381 (appendBitFromByte!0 (_2!612 lt!12825) (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!13382 () (_ BitVec 64))

(assert (=> b!8959 (= lt!13382 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!13383 () (_ BitVec 64))

(assert (=> b!8959 (= lt!13383 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13371 () Unit!744)

(assert (=> b!8959 (= lt!13371 (validateOffsetBitsIneqLemma!0 (_2!612 lt!12825) (_2!612 lt!13381) lt!13382 lt!13383))))

(assert (=> b!8959 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!13381)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!13381))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!13381))) (bvsub lt!13382 lt!13383))))

(declare-fun lt!13364 () Unit!744)

(assert (=> b!8959 (= lt!13364 lt!13371)))

(declare-fun lt!13352 () tuple2!1164)

(assert (=> b!8959 (= lt!13352 (reader!0 (_2!612 lt!12825) (_2!612 lt!13381)))))

(declare-fun lt!13373 () (_ BitVec 64))

(assert (=> b!8959 (= lt!13373 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13388 () Unit!744)

(assert (=> b!8959 (= lt!13388 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!612 lt!12825) (buf!581 (_2!612 lt!13381)) lt!13373))))

(assert (=> b!8959 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!13381)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) lt!13373)))

(declare-fun lt!13355 () Unit!744)

(assert (=> b!8959 (= lt!13355 lt!13388)))

(assert (=> b!8959 (= (head!47 (byteArrayBitContentToList!0 (_2!612 lt!13381) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!47 (bitStreamReadBitsIntoList!0 (_2!612 lt!13381) (_1!613 lt!13352) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!13384 () Unit!744)

(declare-fun Unit!776 () Unit!744)

(assert (=> b!8959 (= lt!13384 Unit!776)))

(assert (=> b!8959 (= lt!13372 (appendBitsMSBFirstLoop!0 (_2!612 lt!13381) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!13350 () Unit!744)

(assert (=> b!8959 (= lt!13350 (lemmaIsPrefixTransitive!0 (_2!612 lt!12825) (_2!612 lt!13381) (_2!612 lt!13372)))))

(assert (=> b!8959 (isPrefixOf!0 (_2!612 lt!12825) (_2!612 lt!13372))))

(declare-fun lt!13378 () Unit!744)

(assert (=> b!8959 (= lt!13378 lt!13350)))

(assert (=> b!8959 (= (size!245 (buf!581 (_2!612 lt!13372))) (size!245 (buf!581 (_2!612 lt!12825))))))

(declare-fun lt!13374 () Unit!744)

(declare-fun Unit!777 () Unit!744)

(assert (=> b!8959 (= lt!13374 Unit!777)))

(assert (=> b!8959 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!13372))) (currentByte!1620 (_2!612 lt!13372)) (currentBit!1615 (_2!612 lt!13372))) (bvsub (bvadd (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!13363 () Unit!744)

(declare-fun Unit!778 () Unit!744)

(assert (=> b!8959 (= lt!13363 Unit!778)))

(assert (=> b!8959 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!13372))) (currentByte!1620 (_2!612 lt!13372)) (currentBit!1615 (_2!612 lt!13372))) (bvsub (bvsub (bvadd (bitIndex!0 (size!245 (buf!581 (_2!612 lt!13381))) (currentByte!1620 (_2!612 lt!13381)) (currentBit!1615 (_2!612 lt!13381))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!13351 () Unit!744)

(declare-fun Unit!779 () Unit!744)

(assert (=> b!8959 (= lt!13351 Unit!779)))

(declare-fun lt!13366 () tuple2!1164)

(assert (=> b!8959 (= lt!13366 call!138)))

(declare-fun lt!13390 () (_ BitVec 64))

(assert (=> b!8959 (= lt!13390 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!13349 () Unit!744)

(assert (=> b!8959 (= lt!13349 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!612 lt!12825) (buf!581 (_2!612 lt!13372)) lt!13390))))

(assert (=> b!8959 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!13372)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) lt!13390)))

(declare-fun lt!13358 () Unit!744)

(assert (=> b!8959 (= lt!13358 lt!13349)))

(declare-fun lt!13353 () tuple2!1164)

(assert (=> b!8959 (= lt!13353 (reader!0 (_2!612 lt!13381) (_2!612 lt!13372)))))

(declare-fun lt!13377 () (_ BitVec 64))

(assert (=> b!8959 (= lt!13377 (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!13365 () Unit!744)

(assert (=> b!8959 (= lt!13365 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!612 lt!13381) (buf!581 (_2!612 lt!13372)) lt!13377))))

(assert (=> b!8959 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!13372)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!13381))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!13381))) lt!13377)))

(declare-fun lt!13369 () Unit!744)

(assert (=> b!8959 (= lt!13369 lt!13365)))

(declare-fun lt!13359 () List!142)

(assert (=> b!8959 (= lt!13359 (byteArrayBitContentToList!0 (_2!612 lt!13372) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!13356 () List!142)

(assert (=> b!8959 (= lt!13356 (byteArrayBitContentToList!0 (_2!612 lt!13372) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!13391 () List!142)

(assert (=> b!8959 (= lt!13391 (bitStreamReadBitsIntoList!0 (_2!612 lt!13372) (_1!613 lt!13366) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!13376 () List!142)

(assert (=> b!8959 (= lt!13376 (bitStreamReadBitsIntoList!0 (_2!612 lt!13372) (_1!613 lt!13353) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!13375 () (_ BitVec 64))

(assert (=> b!8959 (= lt!13375 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!13362 () Unit!744)

(assert (=> b!8959 (= lt!13362 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!612 lt!13372) (_2!612 lt!13372) (_1!613 lt!13366) (_1!613 lt!13353) lt!13375 lt!13391))))

(assert (=> b!8959 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!13372) (_1!613 lt!13353) (bvsub lt!13375 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!55 lt!13391))))

(declare-fun lt!13360 () Unit!744)

(assert (=> b!8959 (= lt!13360 lt!13362)))

(declare-fun lt!13354 () (_ BitVec 64))

(declare-fun lt!13387 () Unit!744)

(assert (=> b!8959 (= lt!13387 (arrayBitRangesEqImpliesEq!0 (buf!581 (_2!612 lt!13381)) (buf!581 (_2!612 lt!13372)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!13354 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!13381))) (currentByte!1620 (_2!612 lt!13381)) (currentBit!1615 (_2!612 lt!13381)))))))

(assert (=> b!8959 (= (bitAt!0 (buf!581 (_2!612 lt!13381)) lt!13354) (bitAt!0 (buf!581 (_2!612 lt!13372)) lt!13354))))

(declare-fun lt!13385 () Unit!744)

(assert (=> b!8959 (= lt!13385 lt!13387)))

(declare-fun b!8960 () Bool)

(declare-fun res!9354 () Bool)

(declare-fun e!5534 () Bool)

(assert (=> b!8960 (=> (not res!9354) (not e!5534))))

(declare-fun lt!13361 () tuple2!1162)

(assert (=> b!8960 (= res!9354 (isPrefixOf!0 (_2!612 lt!12825) (_2!612 lt!13361)))))

(declare-fun b!8961 () Bool)

(declare-fun res!9357 () Bool)

(assert (=> b!8961 (=> (not res!9357) (not e!5534))))

(assert (=> b!8961 (= res!9357 (invariant!0 (currentBit!1615 (_2!612 lt!13361)) (currentByte!1620 (_2!612 lt!13361)) (size!245 (buf!581 (_2!612 lt!13361)))))))

(declare-fun d!2672 () Bool)

(assert (=> d!2672 e!5534))

(declare-fun res!9358 () Bool)

(assert (=> d!2672 (=> (not res!9358) (not e!5534))))

(declare-fun lt!13386 () (_ BitVec 64))

(assert (=> d!2672 (= res!9358 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!13361))) (currentByte!1620 (_2!612 lt!13361)) (currentBit!1615 (_2!612 lt!13361))) (bvsub lt!13386 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!2672 (or (= (bvand lt!13386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13386 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!13357 () (_ BitVec 64))

(assert (=> d!2672 (= lt!13386 (bvadd lt!13357 from!367 nBits!460))))

(assert (=> d!2672 (or (not (= (bvand lt!13357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13357 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2672 (= lt!13357 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825))))))

(assert (=> d!2672 (= lt!13361 e!5535)))

(declare-fun c!530 () Bool)

(assert (=> d!2672 (= c!530 (bvslt (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!13370 () Unit!744)

(declare-fun lt!13368 () Unit!744)

(assert (=> d!2672 (= lt!13370 lt!13368)))

(assert (=> d!2672 (isPrefixOf!0 (_2!612 lt!12825) (_2!612 lt!12825))))

(assert (=> d!2672 (= lt!13368 (lemmaIsPrefixRefl!0 (_2!612 lt!12825)))))

(assert (=> d!2672 (= lt!13354 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825))))))

(assert (=> d!2672 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2672 (= (appendBitsMSBFirstLoop!0 (_2!612 lt!12825) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)) lt!13361)))

(declare-fun b!8962 () Bool)

(declare-fun res!9359 () Bool)

(assert (=> b!8962 (=> (not res!9359) (not e!5534))))

(assert (=> b!8962 (= res!9359 (= (size!245 (buf!581 (_2!612 lt!13361))) (size!245 (buf!581 (_2!612 lt!12825)))))))

(declare-fun bm!135 () Bool)

(assert (=> bm!135 (= call!138 (reader!0 (_2!612 lt!12825) (ite c!530 (_2!612 lt!13372) (_2!612 lt!12825))))))

(declare-fun b!8963 () Bool)

(declare-fun e!5536 () Bool)

(declare-fun lt!13367 () (_ BitVec 64))

(assert (=> b!8963 (= e!5536 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) lt!13367))))

(declare-fun b!8964 () Bool)

(declare-fun res!9356 () Bool)

(assert (=> b!8964 (=> (not res!9356) (not e!5534))))

(assert (=> b!8964 (= res!9356 (= (size!245 (buf!581 (_2!612 lt!12825))) (size!245 (buf!581 (_2!612 lt!13361)))))))

(declare-fun b!8965 () Bool)

(declare-fun lt!13379 () tuple2!1164)

(assert (=> b!8965 (= e!5534 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!13361) (_1!613 lt!13379) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!612 lt!13361) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!8965 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8965 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!13380 () Unit!744)

(declare-fun lt!13389 () Unit!744)

(assert (=> b!8965 (= lt!13380 lt!13389)))

(assert (=> b!8965 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!13361)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12825))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12825))) lt!13367)))

(assert (=> b!8965 (= lt!13389 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!612 lt!12825) (buf!581 (_2!612 lt!13361)) lt!13367))))

(assert (=> b!8965 e!5536))

(declare-fun res!9355 () Bool)

(assert (=> b!8965 (=> (not res!9355) (not e!5536))))

(assert (=> b!8965 (= res!9355 (and (= (size!245 (buf!581 (_2!612 lt!12825))) (size!245 (buf!581 (_2!612 lt!13361)))) (bvsge lt!13367 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8965 (= lt!13367 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!8965 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8965 (= lt!13379 (reader!0 (_2!612 lt!12825) (_2!612 lt!13361)))))

(assert (= (and d!2672 c!530) b!8959))

(assert (= (and d!2672 (not c!530)) b!8958))

(assert (= (or b!8959 b!8958) bm!135))

(assert (= (and d!2672 res!9358) b!8961))

(assert (= (and b!8961 res!9357) b!8964))

(assert (= (and b!8964 res!9356) b!8960))

(assert (= (and b!8960 res!9354) b!8962))

(assert (= (and b!8962 res!9359) b!8965))

(assert (= (and b!8965 res!9355) b!8963))

(declare-fun m!12421 () Bool)

(assert (=> b!8963 m!12421))

(declare-fun m!12423 () Bool)

(assert (=> d!2672 m!12423))

(assert (=> d!2672 m!11923))

(assert (=> d!2672 m!12335))

(assert (=> d!2672 m!12341))

(declare-fun m!12425 () Bool)

(assert (=> b!8958 m!12425))

(declare-fun m!12427 () Bool)

(assert (=> b!8958 m!12427))

(declare-fun m!12429 () Bool)

(assert (=> b!8961 m!12429))

(declare-fun m!12431 () Bool)

(assert (=> b!8959 m!12431))

(declare-fun m!12433 () Bool)

(assert (=> b!8959 m!12433))

(declare-fun m!12435 () Bool)

(assert (=> b!8959 m!12435))

(declare-fun m!12437 () Bool)

(assert (=> b!8959 m!12437))

(declare-fun m!12439 () Bool)

(assert (=> b!8959 m!12439))

(declare-fun m!12441 () Bool)

(assert (=> b!8959 m!12441))

(declare-fun m!12443 () Bool)

(assert (=> b!8959 m!12443))

(declare-fun m!12445 () Bool)

(assert (=> b!8959 m!12445))

(declare-fun m!12447 () Bool)

(assert (=> b!8959 m!12447))

(declare-fun m!12449 () Bool)

(assert (=> b!8959 m!12449))

(assert (=> b!8959 m!12443))

(declare-fun m!12451 () Bool)

(assert (=> b!8959 m!12451))

(declare-fun m!12453 () Bool)

(assert (=> b!8959 m!12453))

(declare-fun m!12455 () Bool)

(assert (=> b!8959 m!12455))

(declare-fun m!12457 () Bool)

(assert (=> b!8959 m!12457))

(assert (=> b!8959 m!11923))

(assert (=> b!8959 m!12373))

(declare-fun m!12459 () Bool)

(assert (=> b!8959 m!12459))

(declare-fun m!12461 () Bool)

(assert (=> b!8959 m!12461))

(declare-fun m!12463 () Bool)

(assert (=> b!8959 m!12463))

(assert (=> b!8959 m!12455))

(assert (=> b!8959 m!12373))

(declare-fun m!12465 () Bool)

(assert (=> b!8959 m!12465))

(declare-fun m!12467 () Bool)

(assert (=> b!8959 m!12467))

(declare-fun m!12469 () Bool)

(assert (=> b!8959 m!12469))

(declare-fun m!12471 () Bool)

(assert (=> b!8959 m!12471))

(declare-fun m!12473 () Bool)

(assert (=> b!8959 m!12473))

(declare-fun m!12475 () Bool)

(assert (=> b!8959 m!12475))

(declare-fun m!12477 () Bool)

(assert (=> b!8959 m!12477))

(declare-fun m!12479 () Bool)

(assert (=> b!8959 m!12479))

(declare-fun m!12481 () Bool)

(assert (=> b!8959 m!12481))

(declare-fun m!12483 () Bool)

(assert (=> b!8959 m!12483))

(declare-fun m!12485 () Bool)

(assert (=> b!8959 m!12485))

(assert (=> b!8959 m!12447))

(declare-fun m!12487 () Bool)

(assert (=> b!8959 m!12487))

(declare-fun m!12489 () Bool)

(assert (=> b!8959 m!12489))

(declare-fun m!12491 () Bool)

(assert (=> bm!135 m!12491))

(declare-fun m!12493 () Bool)

(assert (=> b!8960 m!12493))

(declare-fun m!12495 () Bool)

(assert (=> b!8965 m!12495))

(declare-fun m!12497 () Bool)

(assert (=> b!8965 m!12497))

(declare-fun m!12499 () Bool)

(assert (=> b!8965 m!12499))

(declare-fun m!12501 () Bool)

(assert (=> b!8965 m!12501))

(declare-fun m!12503 () Bool)

(assert (=> b!8965 m!12503))

(assert (=> b!8714 d!2672))

(declare-fun d!2674 () Bool)

(declare-fun res!9362 () Bool)

(declare-fun e!5537 () Bool)

(assert (=> d!2674 (=> (not res!9362) (not e!5537))))

(assert (=> d!2674 (= res!9362 (= (size!245 (buf!581 thiss!1486)) (size!245 (buf!581 (_2!612 lt!12816)))))))

(assert (=> d!2674 (= (isPrefixOf!0 thiss!1486 (_2!612 lt!12816)) e!5537)))

(declare-fun b!8966 () Bool)

(declare-fun res!9361 () Bool)

(assert (=> b!8966 (=> (not res!9361) (not e!5537))))

(assert (=> b!8966 (= res!9361 (bvsle (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)) (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12816))) (currentByte!1620 (_2!612 lt!12816)) (currentBit!1615 (_2!612 lt!12816)))))))

(declare-fun b!8967 () Bool)

(declare-fun e!5538 () Bool)

(assert (=> b!8967 (= e!5537 e!5538)))

(declare-fun res!9360 () Bool)

(assert (=> b!8967 (=> res!9360 e!5538)))

(assert (=> b!8967 (= res!9360 (= (size!245 (buf!581 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!8968 () Bool)

(assert (=> b!8968 (= e!5538 (arrayBitRangesEq!0 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12816)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(assert (= (and d!2674 res!9362) b!8966))

(assert (= (and b!8966 res!9361) b!8967))

(assert (= (and b!8967 (not res!9360)) b!8968))

(assert (=> b!8966 m!11833))

(assert (=> b!8966 m!11891))

(assert (=> b!8968 m!11833))

(assert (=> b!8968 m!11833))

(declare-fun m!12505 () Bool)

(assert (=> b!8968 m!12505))

(assert (=> b!8714 d!2674))

(declare-fun d!2676 () Bool)

(assert (=> d!2676 (isPrefixOf!0 thiss!1486 (_2!612 lt!12816))))

(declare-fun lt!13394 () Unit!744)

(declare-fun choose!30 (BitStream!468 BitStream!468 BitStream!468) Unit!744)

(assert (=> d!2676 (= lt!13394 (choose!30 thiss!1486 (_2!612 lt!12825) (_2!612 lt!12816)))))

(assert (=> d!2676 (isPrefixOf!0 thiss!1486 (_2!612 lt!12825))))

(assert (=> d!2676 (= (lemmaIsPrefixTransitive!0 thiss!1486 (_2!612 lt!12825) (_2!612 lt!12816)) lt!13394)))

(declare-fun bs!865 () Bool)

(assert (= bs!865 d!2676))

(assert (=> bs!865 m!11967))

(declare-fun m!12507 () Bool)

(assert (=> bs!865 m!12507))

(declare-fun m!12509 () Bool)

(assert (=> bs!865 m!12509))

(assert (=> b!8714 d!2676))

(declare-fun d!2678 () Bool)

(assert (=> d!2678 (= (bitAt!0 (buf!581 (_2!612 lt!12825)) lt!12798) (bitAt!0 (buf!581 (_2!612 lt!12816)) lt!12798))))

(declare-fun lt!13397 () Unit!744)

(declare-fun choose!31 (array!572 array!572 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!744)

(assert (=> d!2678 (= lt!13397 (choose!31 (buf!581 (_2!612 lt!12825)) (buf!581 (_2!612 lt!12816)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12798 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825)))))))

(assert (=> d!2678 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825)))))))

(assert (=> d!2678 (= (arrayBitRangesEqImpliesEq!0 (buf!581 (_2!612 lt!12825)) (buf!581 (_2!612 lt!12816)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12798 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825)))) lt!13397)))

(declare-fun bs!866 () Bool)

(assert (= bs!866 d!2678))

(assert (=> bs!866 m!11935))

(assert (=> bs!866 m!11941))

(assert (=> bs!866 m!11923))

(declare-fun m!12511 () Bool)

(assert (=> bs!866 m!12511))

(assert (=> b!8714 d!2678))

(declare-fun d!2680 () Bool)

(assert (=> d!2680 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12817) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12825)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486))) lt!12817))))

(declare-fun bs!867 () Bool)

(assert (= bs!867 d!2680))

(declare-fun m!12513 () Bool)

(assert (=> bs!867 m!12513))

(assert (=> b!8714 d!2680))

(declare-fun d!2682 () Bool)

(assert (=> d!2682 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12834)))

(declare-fun lt!13398 () Unit!744)

(assert (=> d!2682 (= lt!13398 (choose!9 thiss!1486 (buf!581 (_2!612 lt!12816)) lt!12834 (BitStream!469 (buf!581 (_2!612 lt!12816)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(assert (=> d!2682 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!581 (_2!612 lt!12816)) lt!12834) lt!13398)))

(declare-fun bs!868 () Bool)

(assert (= bs!868 d!2682))

(assert (=> bs!868 m!11963))

(declare-fun m!12515 () Bool)

(assert (=> bs!868 m!12515))

(assert (=> b!8714 d!2682))

(declare-fun d!2684 () Bool)

(assert (=> d!2684 (= (head!47 (byteArrayBitContentToList!0 (_2!612 lt!12825) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!257 (byteArrayBitContentToList!0 (_2!612 lt!12825) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!8714 d!2684))

(declare-fun d!2686 () Bool)

(declare-fun c!531 () Bool)

(assert (=> d!2686 (= c!531 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5539 () List!142)

(assert (=> d!2686 (= (byteArrayBitContentToList!0 (_2!612 lt!12816) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!5539)))

(declare-fun b!8969 () Bool)

(assert (=> b!8969 (= e!5539 Nil!139)))

(declare-fun b!8970 () Bool)

(assert (=> b!8970 (= e!5539 (Cons!138 (not (= (bvand ((_ sign_extend 24) (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!612 lt!12816) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2686 c!531) b!8969))

(assert (= (and d!2686 (not c!531)) b!8970))

(assert (=> b!8970 m!11931))

(assert (=> b!8970 m!12417))

(assert (=> b!8970 m!11979))

(assert (=> b!8714 d!2686))

(declare-fun d!2688 () Bool)

(assert (=> d!2688 (= (head!47 (bitStreamReadBitsIntoList!0 (_2!612 lt!12825) (_1!613 lt!12796) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!257 (bitStreamReadBitsIntoList!0 (_2!612 lt!12825) (_1!613 lt!12796) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!8714 d!2688))

(declare-fun d!2690 () Bool)

(assert (=> d!2690 (= (bitAt!0 (buf!581 (_2!612 lt!12816)) lt!12798) (not (= (bvand ((_ sign_extend 24) (select (arr!650 (buf!581 (_2!612 lt!12816))) ((_ extract 31 0) (bvsdiv lt!12798 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!12798 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!869 () Bool)

(assert (= bs!869 d!2690))

(declare-fun m!12517 () Bool)

(assert (=> bs!869 m!12517))

(assert (=> bs!869 m!12369))

(assert (=> b!8714 d!2690))

(declare-fun b!8988 () Bool)

(declare-fun res!9384 () Bool)

(declare-fun e!5551 () Bool)

(assert (=> b!8988 (=> (not res!9384) (not e!5551))))

(declare-fun lt!13423 () tuple2!1162)

(assert (=> b!8988 (= res!9384 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!13423))) (currentByte!1620 (_2!612 lt!13423)) (currentBit!1615 (_2!612 lt!13423))) (bvadd (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!8989 () Bool)

(declare-fun e!5549 () Bool)

(declare-fun e!5550 () Bool)

(assert (=> b!8989 (= e!5549 e!5550)))

(declare-fun res!9381 () Bool)

(assert (=> b!8989 (=> (not res!9381) (not e!5550))))

(declare-fun lt!13428 () (_ BitVec 8))

(declare-fun lt!13431 () tuple2!1162)

(declare-datatypes ((tuple2!1186 0))(
  ( (tuple2!1187 (_1!627 BitStream!468) (_2!627 Bool)) )
))
(declare-fun lt!13434 () tuple2!1186)

(assert (=> b!8989 (= res!9381 (and (= (_2!627 lt!13434) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!13428)) #b00000000000000000000000000000000))) (= (_1!627 lt!13434) (_2!612 lt!13431))))))

(declare-fun lt!13425 () tuple2!1166)

(declare-fun lt!13433 () BitStream!468)

(assert (=> b!8989 (= lt!13425 (readBits!0 lt!13433 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!468) tuple2!1186)

(assert (=> b!8989 (= lt!13434 (readBitPure!0 lt!13433))))

(declare-fun readerFrom!0 (BitStream!468 (_ BitVec 32) (_ BitVec 32)) BitStream!468)

(assert (=> b!8989 (= lt!13433 (readerFrom!0 (_2!612 lt!13431) (currentBit!1615 thiss!1486) (currentByte!1620 thiss!1486)))))

(declare-fun b!8990 () Bool)

(declare-fun res!9380 () Bool)

(assert (=> b!8990 (=> (not res!9380) (not e!5549))))

(assert (=> b!8990 (= res!9380 (isPrefixOf!0 thiss!1486 (_2!612 lt!13431)))))

(declare-fun d!2692 () Bool)

(assert (=> d!2692 e!5549))

(declare-fun res!9386 () Bool)

(assert (=> d!2692 (=> (not res!9386) (not e!5549))))

(assert (=> d!2692 (= res!9386 (= (size!245 (buf!581 (_2!612 lt!13431))) (size!245 (buf!581 thiss!1486))))))

(declare-fun lt!13424 () array!572)

(assert (=> d!2692 (= lt!13428 (select (arr!650 lt!13424) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!2692 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!245 lt!13424)))))

(assert (=> d!2692 (= lt!13424 (array!573 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!13426 () tuple2!1162)

(assert (=> d!2692 (= lt!13431 (tuple2!1163 (_1!612 lt!13426) (_2!612 lt!13426)))))

(assert (=> d!2692 (= lt!13426 lt!13423)))

(assert (=> d!2692 e!5551))

(declare-fun res!9382 () Bool)

(assert (=> d!2692 (=> (not res!9382) (not e!5551))))

(assert (=> d!2692 (= res!9382 (= (size!245 (buf!581 thiss!1486)) (size!245 (buf!581 (_2!612 lt!13423)))))))

(declare-fun lt!13429 () Bool)

(declare-fun appendBit!0 (BitStream!468 Bool) tuple2!1162)

(assert (=> d!2692 (= lt!13423 (appendBit!0 thiss!1486 lt!13429))))

(assert (=> d!2692 (= lt!13429 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!2692 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!2692 (= (appendBitFromByte!0 thiss!1486 (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!13431)))

(declare-fun b!8991 () Bool)

(declare-fun e!5548 () Bool)

(declare-fun lt!13432 () tuple2!1186)

(assert (=> b!8991 (= e!5548 (= (bitIndex!0 (size!245 (buf!581 (_1!627 lt!13432))) (currentByte!1620 (_1!627 lt!13432)) (currentBit!1615 (_1!627 lt!13432))) (bitIndex!0 (size!245 (buf!581 (_2!612 lt!13423))) (currentByte!1620 (_2!612 lt!13423)) (currentBit!1615 (_2!612 lt!13423)))))))

(declare-fun b!8992 () Bool)

(assert (=> b!8992 (= e!5551 e!5548)))

(declare-fun res!9385 () Bool)

(assert (=> b!8992 (=> (not res!9385) (not e!5548))))

(assert (=> b!8992 (= res!9385 (and (= (_2!627 lt!13432) lt!13429) (= (_1!627 lt!13432) (_2!612 lt!13423))))))

(assert (=> b!8992 (= lt!13432 (readBitPure!0 (readerFrom!0 (_2!612 lt!13423) (currentBit!1615 thiss!1486) (currentByte!1620 thiss!1486))))))

(declare-fun b!8993 () Bool)

(assert (=> b!8993 (= e!5550 (= (bitIndex!0 (size!245 (buf!581 (_1!627 lt!13434))) (currentByte!1620 (_1!627 lt!13434)) (currentBit!1615 (_1!627 lt!13434))) (bitIndex!0 (size!245 (buf!581 (_2!612 lt!13431))) (currentByte!1620 (_2!612 lt!13431)) (currentBit!1615 (_2!612 lt!13431)))))))

(declare-fun b!8994 () Bool)

(declare-fun res!9383 () Bool)

(assert (=> b!8994 (=> (not res!9383) (not e!5549))))

(declare-fun lt!13430 () (_ BitVec 64))

(declare-fun lt!13427 () (_ BitVec 64))

(assert (=> b!8994 (= res!9383 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!13431))) (currentByte!1620 (_2!612 lt!13431)) (currentBit!1615 (_2!612 lt!13431))) (bvadd lt!13427 lt!13430)))))

(assert (=> b!8994 (or (not (= (bvand lt!13427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13430 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13427 lt!13430) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8994 (= lt!13430 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!8994 (= lt!13427 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(declare-fun b!8995 () Bool)

(declare-fun res!9379 () Bool)

(assert (=> b!8995 (=> (not res!9379) (not e!5551))))

(assert (=> b!8995 (= res!9379 (isPrefixOf!0 thiss!1486 (_2!612 lt!13423)))))

(assert (= (and d!2692 res!9382) b!8988))

(assert (= (and b!8988 res!9384) b!8995))

(assert (= (and b!8995 res!9379) b!8992))

(assert (= (and b!8992 res!9385) b!8991))

(assert (= (and d!2692 res!9386) b!8994))

(assert (= (and b!8994 res!9383) b!8990))

(assert (= (and b!8990 res!9380) b!8989))

(assert (= (and b!8989 res!9381) b!8993))

(declare-fun m!12519 () Bool)

(assert (=> b!8990 m!12519))

(declare-fun m!12521 () Bool)

(assert (=> b!8991 m!12521))

(declare-fun m!12523 () Bool)

(assert (=> b!8991 m!12523))

(declare-fun m!12525 () Bool)

(assert (=> d!2692 m!12525))

(declare-fun m!12527 () Bool)

(assert (=> d!2692 m!12527))

(assert (=> d!2692 m!12417))

(declare-fun m!12529 () Bool)

(assert (=> b!8994 m!12529))

(assert (=> b!8994 m!11833))

(declare-fun m!12531 () Bool)

(assert (=> b!8989 m!12531))

(declare-fun m!12533 () Bool)

(assert (=> b!8989 m!12533))

(declare-fun m!12535 () Bool)

(assert (=> b!8989 m!12535))

(declare-fun m!12537 () Bool)

(assert (=> b!8992 m!12537))

(assert (=> b!8992 m!12537))

(declare-fun m!12539 () Bool)

(assert (=> b!8992 m!12539))

(declare-fun m!12541 () Bool)

(assert (=> b!8993 m!12541))

(assert (=> b!8993 m!12529))

(declare-fun m!12543 () Bool)

(assert (=> b!8995 m!12543))

(assert (=> b!8988 m!12523))

(assert (=> b!8988 m!11833))

(assert (=> b!8714 d!2692))

(declare-fun d!2694 () Bool)

(assert (=> d!2694 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12834) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12816)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486))) lt!12834))))

(declare-fun bs!870 () Bool)

(assert (= bs!870 d!2694))

(declare-fun m!12545 () Bool)

(assert (=> bs!870 m!12545))

(assert (=> b!8714 d!2694))

(declare-fun lt!13439 () tuple2!1164)

(declare-fun lt!13452 () (_ BitVec 64))

(declare-fun e!5553 () Bool)

(declare-fun lt!13450 () (_ BitVec 64))

(declare-fun b!8996 () Bool)

(assert (=> b!8996 (= e!5553 (= (_1!613 lt!13439) (withMovedBitIndex!0 (_2!613 lt!13439) (bvsub lt!13452 lt!13450))))))

(assert (=> b!8996 (or (= (bvand lt!13452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13450 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13452 lt!13450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8996 (= lt!13450 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12825))) (currentByte!1620 (_2!612 lt!12825)) (currentBit!1615 (_2!612 lt!12825))))))

(assert (=> b!8996 (= lt!13452 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(declare-fun d!2696 () Bool)

(assert (=> d!2696 e!5553))

(declare-fun res!9387 () Bool)

(assert (=> d!2696 (=> (not res!9387) (not e!5553))))

(assert (=> d!2696 (= res!9387 (isPrefixOf!0 (_1!613 lt!13439) (_2!613 lt!13439)))))

(declare-fun lt!13435 () BitStream!468)

(assert (=> d!2696 (= lt!13439 (tuple2!1165 lt!13435 (_2!612 lt!12825)))))

(declare-fun lt!13443 () Unit!744)

(declare-fun lt!13444 () Unit!744)

(assert (=> d!2696 (= lt!13443 lt!13444)))

(assert (=> d!2696 (isPrefixOf!0 lt!13435 (_2!612 lt!12825))))

(assert (=> d!2696 (= lt!13444 (lemmaIsPrefixTransitive!0 lt!13435 (_2!612 lt!12825) (_2!612 lt!12825)))))

(declare-fun lt!13451 () Unit!744)

(declare-fun lt!13445 () Unit!744)

(assert (=> d!2696 (= lt!13451 lt!13445)))

(assert (=> d!2696 (isPrefixOf!0 lt!13435 (_2!612 lt!12825))))

(assert (=> d!2696 (= lt!13445 (lemmaIsPrefixTransitive!0 lt!13435 thiss!1486 (_2!612 lt!12825)))))

(declare-fun lt!13447 () Unit!744)

(declare-fun e!5552 () Unit!744)

(assert (=> d!2696 (= lt!13447 e!5552)))

(declare-fun c!532 () Bool)

(assert (=> d!2696 (= c!532 (not (= (size!245 (buf!581 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!13453 () Unit!744)

(declare-fun lt!13438 () Unit!744)

(assert (=> d!2696 (= lt!13453 lt!13438)))

(assert (=> d!2696 (isPrefixOf!0 (_2!612 lt!12825) (_2!612 lt!12825))))

(assert (=> d!2696 (= lt!13438 (lemmaIsPrefixRefl!0 (_2!612 lt!12825)))))

(declare-fun lt!13448 () Unit!744)

(declare-fun lt!13437 () Unit!744)

(assert (=> d!2696 (= lt!13448 lt!13437)))

(assert (=> d!2696 (= lt!13437 (lemmaIsPrefixRefl!0 (_2!612 lt!12825)))))

(declare-fun lt!13442 () Unit!744)

(declare-fun lt!13440 () Unit!744)

(assert (=> d!2696 (= lt!13442 lt!13440)))

(assert (=> d!2696 (isPrefixOf!0 lt!13435 lt!13435)))

(assert (=> d!2696 (= lt!13440 (lemmaIsPrefixRefl!0 lt!13435))))

(declare-fun lt!13446 () Unit!744)

(declare-fun lt!13454 () Unit!744)

(assert (=> d!2696 (= lt!13446 lt!13454)))

(assert (=> d!2696 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2696 (= lt!13454 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2696 (= lt!13435 (BitStream!469 (buf!581 (_2!612 lt!12825)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(assert (=> d!2696 (isPrefixOf!0 thiss!1486 (_2!612 lt!12825))))

(assert (=> d!2696 (= (reader!0 thiss!1486 (_2!612 lt!12825)) lt!13439)))

(declare-fun b!8997 () Bool)

(declare-fun lt!13441 () Unit!744)

(assert (=> b!8997 (= e!5552 lt!13441)))

(declare-fun lt!13449 () (_ BitVec 64))

(assert (=> b!8997 (= lt!13449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13436 () (_ BitVec 64))

(assert (=> b!8997 (= lt!13436 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(assert (=> b!8997 (= lt!13441 (arrayBitRangesEqSymmetric!0 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12825)) lt!13449 lt!13436))))

(assert (=> b!8997 (arrayBitRangesEq!0 (buf!581 (_2!612 lt!12825)) (buf!581 thiss!1486) lt!13449 lt!13436)))

(declare-fun b!8998 () Bool)

(declare-fun res!9389 () Bool)

(assert (=> b!8998 (=> (not res!9389) (not e!5553))))

(assert (=> b!8998 (= res!9389 (isPrefixOf!0 (_1!613 lt!13439) thiss!1486))))

(declare-fun b!8999 () Bool)

(declare-fun Unit!780 () Unit!744)

(assert (=> b!8999 (= e!5552 Unit!780)))

(declare-fun b!9000 () Bool)

(declare-fun res!9388 () Bool)

(assert (=> b!9000 (=> (not res!9388) (not e!5553))))

(assert (=> b!9000 (= res!9388 (isPrefixOf!0 (_2!613 lt!13439) (_2!612 lt!12825)))))

(assert (= (and d!2696 c!532) b!8997))

(assert (= (and d!2696 (not c!532)) b!8999))

(assert (= (and d!2696 res!9387) b!8998))

(assert (= (and b!8998 res!9389) b!9000))

(assert (= (and b!9000 res!9388) b!8996))

(declare-fun m!12547 () Bool)

(assert (=> b!8996 m!12547))

(assert (=> b!8996 m!11923))

(assert (=> b!8996 m!11833))

(assert (=> d!2696 m!11873))

(assert (=> d!2696 m!12509))

(declare-fun m!12549 () Bool)

(assert (=> d!2696 m!12549))

(assert (=> d!2696 m!11875))

(declare-fun m!12551 () Bool)

(assert (=> d!2696 m!12551))

(assert (=> d!2696 m!12335))

(assert (=> d!2696 m!12341))

(declare-fun m!12553 () Bool)

(assert (=> d!2696 m!12553))

(declare-fun m!12555 () Bool)

(assert (=> d!2696 m!12555))

(declare-fun m!12557 () Bool)

(assert (=> d!2696 m!12557))

(declare-fun m!12559 () Bool)

(assert (=> d!2696 m!12559))

(declare-fun m!12561 () Bool)

(assert (=> b!8998 m!12561))

(declare-fun m!12563 () Bool)

(assert (=> b!9000 m!12563))

(assert (=> b!8997 m!11833))

(declare-fun m!12565 () Bool)

(assert (=> b!8997 m!12565))

(declare-fun m!12567 () Bool)

(assert (=> b!8997 m!12567))

(assert (=> b!8714 d!2696))

(declare-fun d!2698 () Bool)

(declare-fun e!5554 () Bool)

(assert (=> d!2698 e!5554))

(declare-fun res!9391 () Bool)

(assert (=> d!2698 (=> (not res!9391) (not e!5554))))

(declare-fun lt!13457 () (_ BitVec 64))

(declare-fun lt!13458 () (_ BitVec 64))

(declare-fun lt!13456 () (_ BitVec 64))

(assert (=> d!2698 (= res!9391 (= lt!13457 (bvsub lt!13456 lt!13458)))))

(assert (=> d!2698 (or (= (bvand lt!13456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13456 lt!13458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2698 (= lt!13458 (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!614 lt!13197)))) ((_ sign_extend 32) (currentByte!1620 (_2!614 lt!13197))) ((_ sign_extend 32) (currentBit!1615 (_2!614 lt!13197)))))))

(declare-fun lt!13459 () (_ BitVec 64))

(declare-fun lt!13460 () (_ BitVec 64))

(assert (=> d!2698 (= lt!13456 (bvmul lt!13459 lt!13460))))

(assert (=> d!2698 (or (= lt!13459 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13460 (bvsdiv (bvmul lt!13459 lt!13460) lt!13459)))))

(assert (=> d!2698 (= lt!13460 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2698 (= lt!13459 ((_ sign_extend 32) (size!245 (buf!581 (_2!614 lt!13197)))))))

(assert (=> d!2698 (= lt!13457 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 (_2!614 lt!13197))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 (_2!614 lt!13197)))))))

(assert (=> d!2698 (invariant!0 (currentBit!1615 (_2!614 lt!13197)) (currentByte!1620 (_2!614 lt!13197)) (size!245 (buf!581 (_2!614 lt!13197))))))

(assert (=> d!2698 (= (bitIndex!0 (size!245 (buf!581 (_2!614 lt!13197))) (currentByte!1620 (_2!614 lt!13197)) (currentBit!1615 (_2!614 lt!13197))) lt!13457)))

(declare-fun b!9001 () Bool)

(declare-fun res!9390 () Bool)

(assert (=> b!9001 (=> (not res!9390) (not e!5554))))

(assert (=> b!9001 (= res!9390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13457))))

(declare-fun b!9002 () Bool)

(declare-fun lt!13455 () (_ BitVec 64))

(assert (=> b!9002 (= e!5554 (bvsle lt!13457 (bvmul lt!13455 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9002 (or (= lt!13455 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13455 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13455)))))

(assert (=> b!9002 (= lt!13455 ((_ sign_extend 32) (size!245 (buf!581 (_2!614 lt!13197)))))))

(assert (= (and d!2698 res!9391) b!9001))

(assert (= (and b!9001 res!9390) b!9002))

(declare-fun m!12569 () Bool)

(assert (=> d!2698 m!12569))

(assert (=> d!2698 m!12261))

(assert (=> b!8857 d!2698))

(declare-fun d!2700 () Bool)

(declare-fun e!5555 () Bool)

(assert (=> d!2700 e!5555))

(declare-fun res!9393 () Bool)

(assert (=> d!2700 (=> (not res!9393) (not e!5555))))

(declare-fun lt!13462 () (_ BitVec 64))

(declare-fun lt!13464 () (_ BitVec 64))

(declare-fun lt!13463 () (_ BitVec 64))

(assert (=> d!2700 (= res!9393 (= lt!13463 (bvsub lt!13462 lt!13464)))))

(assert (=> d!2700 (or (= (bvand lt!13462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13462 lt!13464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2700 (= lt!13464 (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_1!613 lt!12517)))) ((_ sign_extend 32) (currentByte!1620 (_1!613 lt!12517))) ((_ sign_extend 32) (currentBit!1615 (_1!613 lt!12517)))))))

(declare-fun lt!13465 () (_ BitVec 64))

(declare-fun lt!13466 () (_ BitVec 64))

(assert (=> d!2700 (= lt!13462 (bvmul lt!13465 lt!13466))))

(assert (=> d!2700 (or (= lt!13465 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13466 (bvsdiv (bvmul lt!13465 lt!13466) lt!13465)))))

(assert (=> d!2700 (= lt!13466 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2700 (= lt!13465 ((_ sign_extend 32) (size!245 (buf!581 (_1!613 lt!12517)))))))

(assert (=> d!2700 (= lt!13463 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 (_1!613 lt!12517))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 (_1!613 lt!12517)))))))

(assert (=> d!2700 (invariant!0 (currentBit!1615 (_1!613 lt!12517)) (currentByte!1620 (_1!613 lt!12517)) (size!245 (buf!581 (_1!613 lt!12517))))))

(assert (=> d!2700 (= (bitIndex!0 (size!245 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)) (currentBit!1615 (_1!613 lt!12517))) lt!13463)))

(declare-fun b!9003 () Bool)

(declare-fun res!9392 () Bool)

(assert (=> b!9003 (=> (not res!9392) (not e!5555))))

(assert (=> b!9003 (= res!9392 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13463))))

(declare-fun b!9004 () Bool)

(declare-fun lt!13461 () (_ BitVec 64))

(assert (=> b!9004 (= e!5555 (bvsle lt!13463 (bvmul lt!13461 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9004 (or (= lt!13461 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13461 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13461)))))

(assert (=> b!9004 (= lt!13461 ((_ sign_extend 32) (size!245 (buf!581 (_1!613 lt!12517)))))))

(assert (= (and d!2700 res!9393) b!9003))

(assert (= (and b!9003 res!9392) b!9004))

(declare-fun m!12571 () Bool)

(assert (=> d!2700 m!12571))

(declare-fun m!12573 () Bool)

(assert (=> d!2700 m!12573))

(assert (=> b!8857 d!2700))

(declare-fun d!2702 () Bool)

(declare-fun res!9396 () Bool)

(declare-fun e!5556 () Bool)

(assert (=> d!2702 (=> (not res!9396) (not e!5556))))

(assert (=> d!2702 (= res!9396 (= (size!245 (buf!581 thiss!1486)) (size!245 (buf!581 (_2!612 lt!12805)))))))

(assert (=> d!2702 (= (isPrefixOf!0 thiss!1486 (_2!612 lt!12805)) e!5556)))

(declare-fun b!9005 () Bool)

(declare-fun res!9395 () Bool)

(assert (=> b!9005 (=> (not res!9395) (not e!5556))))

(assert (=> b!9005 (= res!9395 (bvsle (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)) (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12805))) (currentByte!1620 (_2!612 lt!12805)) (currentBit!1615 (_2!612 lt!12805)))))))

(declare-fun b!9006 () Bool)

(declare-fun e!5557 () Bool)

(assert (=> b!9006 (= e!5556 e!5557)))

(declare-fun res!9394 () Bool)

(assert (=> b!9006 (=> res!9394 e!5557)))

(assert (=> b!9006 (= res!9394 (= (size!245 (buf!581 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9007 () Bool)

(assert (=> b!9007 (= e!5557 (arrayBitRangesEq!0 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12805)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(assert (= (and d!2702 res!9396) b!9005))

(assert (= (and b!9005 res!9395) b!9006))

(assert (= (and b!9006 (not res!9394)) b!9007))

(assert (=> b!9005 m!11833))

(assert (=> b!9005 m!11871))

(assert (=> b!9007 m!11833))

(assert (=> b!9007 m!11833))

(declare-fun m!12575 () Bool)

(assert (=> b!9007 m!12575))

(assert (=> b!8715 d!2702))

(declare-fun d!2704 () Bool)

(declare-fun res!9401 () Bool)

(declare-fun e!5562 () Bool)

(assert (=> d!2704 (=> res!9401 e!5562)))

(assert (=> d!2704 (= res!9401 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2704 (= (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!614 (readBits!0 (_1!613 call!135) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) e!5562)))

(declare-fun b!9012 () Bool)

(declare-fun e!5563 () Bool)

(assert (=> b!9012 (= e!5562 e!5563)))

(declare-fun res!9402 () Bool)

(assert (=> b!9012 (=> (not res!9402) (not e!5563))))

(assert (=> b!9012 (= res!9402 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!650 (_1!614 (readBits!0 (_1!613 call!135) (bvsub (bvadd from!367 nBits!460) from!367)))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!9013 () Bool)

(assert (=> b!9013 (= e!5563 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!614 (readBits!0 (_1!613 call!135) (bvsub (bvadd from!367 nBits!460) from!367))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2704 (not res!9401)) b!9012))

(assert (= (and b!9012 res!9402) b!9013))

(assert (=> b!9012 m!11931))

(assert (=> b!9012 m!12417))

(declare-fun m!12577 () Bool)

(assert (=> b!9012 m!12577))

(assert (=> b!9012 m!12155))

(declare-fun m!12579 () Bool)

(assert (=> b!9013 m!12579))

(assert (=> b!8713 d!2704))

(declare-fun b!9014 () Bool)

(declare-fun lt!13472 () tuple2!1166)

(declare-fun e!5564 () Bool)

(assert (=> b!9014 (= e!5564 (= (byteArrayBitContentToList!0 (_2!614 lt!13472) (_1!614 lt!13472) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bitStreamReadBitsIntoList!0 (_2!614 lt!13472) (_1!613 call!135) (bvsub (bvadd from!367 nBits!460) from!367))))))

(declare-fun b!9015 () Bool)

(declare-fun res!9404 () Bool)

(assert (=> b!9015 (=> (not res!9404) (not e!5564))))

(assert (=> b!9015 (= res!9404 (invariant!0 (currentBit!1615 (_2!614 lt!13472)) (currentByte!1620 (_2!614 lt!13472)) (size!245 (buf!581 (_2!614 lt!13472)))))))

(declare-fun d!2706 () Bool)

(assert (=> d!2706 e!5564))

(declare-fun res!9406 () Bool)

(assert (=> d!2706 (=> (not res!9406) (not e!5564))))

(assert (=> d!2706 (= res!9406 (= (buf!581 (_2!614 lt!13472)) (buf!581 (_1!613 call!135))))))

(declare-fun lt!13468 () tuple3!64)

(assert (=> d!2706 (= lt!13472 (tuple2!1167 (_3!32 lt!13468) (_2!621 lt!13468)))))

(assert (=> d!2706 (= lt!13468 (readBitsLoop!0 (_1!613 call!135) (bvsub (bvadd from!367 nBits!460) from!367) (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)))))

(assert (=> d!2706 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bvsle (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2706 (= (readBits!0 (_1!613 call!135) (bvsub (bvadd from!367 nBits!460) from!367)) lt!13472)))

(declare-fun b!9016 () Bool)

(declare-fun res!9405 () Bool)

(assert (=> b!9016 (=> (not res!9405) (not e!5564))))

(declare-fun lt!13474 () (_ BitVec 64))

(assert (=> b!9016 (= res!9405 (= (bvadd lt!13474 (bvsub (bvadd from!367 nBits!460) from!367)) (bitIndex!0 (size!245 (buf!581 (_2!614 lt!13472))) (currentByte!1620 (_2!614 lt!13472)) (currentBit!1615 (_2!614 lt!13472)))))))

(assert (=> b!9016 (or (not (= (bvand lt!13474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13474 (bvsub (bvadd from!367 nBits!460) from!367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9016 (= lt!13474 (bitIndex!0 (size!245 (buf!581 (_1!613 call!135))) (currentByte!1620 (_1!613 call!135)) (currentBit!1615 (_1!613 call!135))))))

(declare-fun b!9017 () Bool)

(declare-fun res!9407 () Bool)

(assert (=> b!9017 (=> (not res!9407) (not e!5564))))

(declare-fun lt!13475 () (_ BitVec 64))

(assert (=> b!9017 (= res!9407 (= (size!245 (_1!614 lt!13472)) ((_ extract 31 0) lt!13475)))))

(assert (=> b!9017 (and (bvslt lt!13475 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!13475 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!13473 () (_ BitVec 64))

(declare-fun lt!13471 () (_ BitVec 64))

(assert (=> b!9017 (= lt!13475 (bvsdiv lt!13473 lt!13471))))

(assert (=> b!9017 (and (not (= lt!13471 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!13473 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!13471 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!9017 (= lt!13471 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!13467 () (_ BitVec 64))

(declare-fun lt!13469 () (_ BitVec 64))

(assert (=> b!9017 (= lt!13473 (bvsub lt!13467 lt!13469))))

(assert (=> b!9017 (or (= (bvand lt!13467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13469 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13467 lt!13469) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9017 (= lt!13469 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13470 () (_ BitVec 64))

(assert (=> b!9017 (= lt!13467 (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!13470))))

(assert (=> b!9017 (or (not (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13470 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!13470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9017 (= lt!13470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!9018 () Bool)

(declare-fun res!9403 () Bool)

(assert (=> b!9018 (=> (not res!9403) (not e!5564))))

(assert (=> b!9018 (= res!9403 (bvsle (currentByte!1620 (_1!613 call!135)) (currentByte!1620 (_2!614 lt!13472))))))

(assert (= (and d!2706 res!9406) b!9016))

(assert (= (and b!9016 res!9405) b!9015))

(assert (= (and b!9015 res!9404) b!9017))

(assert (= (and b!9017 res!9407) b!9018))

(assert (= (and b!9018 res!9403) b!9014))

(declare-fun m!12581 () Bool)

(assert (=> b!9014 m!12581))

(declare-fun m!12583 () Bool)

(assert (=> b!9014 m!12583))

(declare-fun m!12585 () Bool)

(assert (=> b!9015 m!12585))

(declare-fun m!12587 () Bool)

(assert (=> d!2706 m!12587))

(declare-fun m!12589 () Bool)

(assert (=> b!9016 m!12589))

(declare-fun m!12591 () Bool)

(assert (=> b!9016 m!12591))

(assert (=> b!8713 d!2706))

(declare-fun b!9033 () Bool)

(declare-fun e!5578 () Bool)

(declare-fun e!5581 () Bool)

(assert (=> b!9033 (= e!5578 e!5581)))

(declare-fun res!9418 () Bool)

(assert (=> b!9033 (=> (not res!9418) (not e!5581))))

(declare-fun e!5579 () Bool)

(assert (=> b!9033 (= res!9418 e!5579)))

(declare-fun res!9419 () Bool)

(assert (=> b!9033 (=> res!9419 e!5579)))

(declare-datatypes ((tuple4!0 0))(
  ( (tuple4!1 (_1!628 (_ BitVec 32)) (_2!628 (_ BitVec 32)) (_3!34 (_ BitVec 32)) (_4!0 (_ BitVec 32))) )
))
(declare-fun lt!13483 () tuple4!0)

(assert (=> b!9033 (= res!9419 (bvsge (_1!628 lt!13483) (_2!628 lt!13483)))))

(declare-fun lt!13484 () (_ BitVec 32))

(assert (=> b!9033 (= lt!13484 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13482 () (_ BitVec 32))

(assert (=> b!9033 (= lt!13482 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!0)

(assert (=> b!9033 (= lt!13483 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(declare-fun b!9034 () Bool)

(declare-fun e!5580 () Bool)

(assert (=> b!9034 (= e!5581 e!5580)))

(declare-fun c!535 () Bool)

(assert (=> b!9034 (= c!535 (= (_3!34 lt!13483) (_4!0 lt!13483)))))

(declare-fun d!2708 () Bool)

(declare-fun res!9422 () Bool)

(assert (=> d!2708 (=> res!9422 e!5578)))

(assert (=> d!2708 (= res!9422 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(assert (=> d!2708 (= (arrayBitRangesEq!0 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))) e!5578)))

(declare-fun b!9035 () Bool)

(declare-fun e!5577 () Bool)

(assert (=> b!9035 (= e!5580 e!5577)))

(declare-fun res!9420 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9035 (= res!9420 (byteRangesEq!0 (select (arr!650 (buf!581 thiss!1486)) (_3!34 lt!13483)) (select (arr!650 (buf!581 (_2!612 lt!12518))) (_3!34 lt!13483)) lt!13482 #b00000000000000000000000000001000))))

(assert (=> b!9035 (=> (not res!9420) (not e!5577))))

(declare-fun bm!138 () Bool)

(declare-fun call!141 () Bool)

(assert (=> bm!138 (= call!141 (byteRangesEq!0 (ite c!535 (select (arr!650 (buf!581 thiss!1486)) (_3!34 lt!13483)) (select (arr!650 (buf!581 thiss!1486)) (_4!0 lt!13483))) (ite c!535 (select (arr!650 (buf!581 (_2!612 lt!12518))) (_3!34 lt!13483)) (select (arr!650 (buf!581 (_2!612 lt!12518))) (_4!0 lt!13483))) (ite c!535 lt!13482 #b00000000000000000000000000000000) lt!13484))))

(declare-fun b!9036 () Bool)

(declare-fun e!5582 () Bool)

(assert (=> b!9036 (= e!5582 call!141)))

(declare-fun b!9037 () Bool)

(assert (=> b!9037 (= e!5580 call!141)))

(declare-fun b!9038 () Bool)

(declare-fun arrayRangesEq!1 (array!572 array!572 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9038 (= e!5579 (arrayRangesEq!1 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12518)) (_1!628 lt!13483) (_2!628 lt!13483)))))

(declare-fun b!9039 () Bool)

(declare-fun res!9421 () Bool)

(assert (=> b!9039 (= res!9421 (= lt!13484 #b00000000000000000000000000000000))))

(assert (=> b!9039 (=> res!9421 e!5582)))

(assert (=> b!9039 (= e!5577 e!5582)))

(assert (= (and d!2708 (not res!9422)) b!9033))

(assert (= (and b!9033 (not res!9419)) b!9038))

(assert (= (and b!9033 res!9418) b!9034))

(assert (= (and b!9034 c!535) b!9037))

(assert (= (and b!9034 (not c!535)) b!9035))

(assert (= (and b!9035 res!9420) b!9039))

(assert (= (and b!9039 (not res!9421)) b!9036))

(assert (= (or b!9037 b!9036) bm!138))

(assert (=> b!9033 m!11833))

(declare-fun m!12593 () Bool)

(assert (=> b!9033 m!12593))

(declare-fun m!12595 () Bool)

(assert (=> b!9035 m!12595))

(declare-fun m!12597 () Bool)

(assert (=> b!9035 m!12597))

(assert (=> b!9035 m!12595))

(assert (=> b!9035 m!12597))

(declare-fun m!12599 () Bool)

(assert (=> b!9035 m!12599))

(declare-fun m!12601 () Bool)

(assert (=> bm!138 m!12601))

(assert (=> bm!138 m!12597))

(declare-fun m!12603 () Bool)

(assert (=> bm!138 m!12603))

(assert (=> bm!138 m!12595))

(declare-fun m!12605 () Bool)

(assert (=> bm!138 m!12605))

(declare-fun m!12607 () Bool)

(assert (=> b!9038 m!12607))

(assert (=> b!8664 d!2708))

(assert (=> b!8664 d!2574))

(declare-fun d!2710 () Bool)

(assert (=> d!2710 (= (invariant!0 (currentBit!1615 (_2!614 lt!13197)) (currentByte!1620 (_2!614 lt!13197)) (size!245 (buf!581 (_2!614 lt!13197)))) (and (bvsge (currentBit!1615 (_2!614 lt!13197)) #b00000000000000000000000000000000) (bvslt (currentBit!1615 (_2!614 lt!13197)) #b00000000000000000000000000001000) (bvsge (currentByte!1620 (_2!614 lt!13197)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1620 (_2!614 lt!13197)) (size!245 (buf!581 (_2!614 lt!13197)))) (and (= (currentBit!1615 (_2!614 lt!13197)) #b00000000000000000000000000000000) (= (currentByte!1620 (_2!614 lt!13197)) (size!245 (buf!581 (_2!614 lt!13197))))))))))

(assert (=> b!8856 d!2710))

(declare-fun d!2712 () Bool)

(declare-fun c!536 () Bool)

(assert (=> d!2712 (= c!536 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5583 () List!142)

(assert (=> d!2712 (= (byteArrayBitContentToList!0 (_2!614 lt!13197) (_1!614 lt!13197) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!5583)))

(declare-fun b!9040 () Bool)

(assert (=> b!9040 (= e!5583 Nil!139)))

(declare-fun b!9041 () Bool)

(assert (=> b!9041 (= e!5583 (Cons!138 (not (= (bvand ((_ sign_extend 24) (select (arr!650 (_1!614 lt!13197)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!614 lt!13197) (_1!614 lt!13197) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2712 c!536) b!9040))

(assert (= (and d!2712 (not c!536)) b!9041))

(declare-fun m!12609 () Bool)

(assert (=> b!9041 m!12609))

(assert (=> b!9041 m!12155))

(declare-fun m!12611 () Bool)

(assert (=> b!9041 m!12611))

(assert (=> b!8855 d!2712))

(declare-fun b!9042 () Bool)

(declare-fun e!5585 () tuple2!1182)

(assert (=> b!9042 (= e!5585 (tuple2!1183 Nil!139 (_1!613 lt!12517)))))

(declare-fun b!9044 () Bool)

(declare-fun e!5584 () Bool)

(declare-fun lt!13486 () List!142)

(assert (=> b!9044 (= e!5584 (isEmpty!27 lt!13486))))

(declare-fun b!9045 () Bool)

(assert (=> b!9045 (= e!5584 (> (length!22 lt!13486) 0))))

(declare-fun lt!13485 () tuple2!1184)

(declare-fun b!9043 () Bool)

(declare-fun lt!13487 () (_ BitVec 64))

(assert (=> b!9043 (= e!5585 (tuple2!1183 (Cons!138 (_1!625 lt!13485) (bitStreamReadBitsIntoList!0 (_2!614 lt!13197) (_2!625 lt!13485) (bvsub nBits!460 lt!13487))) (_2!625 lt!13485)))))

(assert (=> b!9043 (= lt!13485 (readBit!0 (_1!613 lt!12517)))))

(assert (=> b!9043 (= lt!13487 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2714 () Bool)

(assert (=> d!2714 e!5584))

(declare-fun c!538 () Bool)

(assert (=> d!2714 (= c!538 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2714 (= lt!13486 (_1!624 e!5585))))

(declare-fun c!537 () Bool)

(assert (=> d!2714 (= c!537 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2714 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2714 (= (bitStreamReadBitsIntoList!0 (_2!614 lt!13197) (_1!613 lt!12517) nBits!460) lt!13486)))

(assert (= (and d!2714 c!537) b!9042))

(assert (= (and d!2714 (not c!537)) b!9043))

(assert (= (and d!2714 c!538) b!9044))

(assert (= (and d!2714 (not c!538)) b!9045))

(declare-fun m!12613 () Bool)

(assert (=> b!9044 m!12613))

(declare-fun m!12615 () Bool)

(assert (=> b!9045 m!12615))

(declare-fun m!12617 () Bool)

(assert (=> b!9043 m!12617))

(assert (=> b!9043 m!12311))

(assert (=> b!8855 d!2714))

(assert (=> b!8662 d!2574))

(assert (=> b!8662 d!2564))

(assert (=> d!2574 d!2636))

(declare-fun d!2716 () Bool)

(assert (=> d!2716 (= (invariant!0 (currentBit!1615 thiss!1486) (currentByte!1620 thiss!1486) (size!245 (buf!581 thiss!1486))) (and (bvsge (currentBit!1615 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1615 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1620 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1620 thiss!1486) (size!245 (buf!581 thiss!1486))) (and (= (currentBit!1615 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1620 thiss!1486) (size!245 (buf!581 thiss!1486)))))))))

(assert (=> d!2574 d!2716))

(declare-fun d!2718 () Bool)

(assert (=> d!2718 (= (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12518))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12518)))) (bvsub (bvmul ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12518))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12518))))))))

(assert (=> d!2564 d!2718))

(assert (=> d!2564 d!2552))

(declare-fun d!2720 () Bool)

(declare-fun res!9425 () Bool)

(declare-fun e!5586 () Bool)

(assert (=> d!2720 (=> (not res!9425) (not e!5586))))

(assert (=> d!2720 (= res!9425 (= (size!245 (buf!581 thiss!1486)) (size!245 (buf!581 thiss!1486))))))

(assert (=> d!2720 (= (isPrefixOf!0 thiss!1486 thiss!1486) e!5586)))

(declare-fun b!9046 () Bool)

(declare-fun res!9424 () Bool)

(assert (=> b!9046 (=> (not res!9424) (not e!5586))))

(assert (=> b!9046 (= res!9424 (bvsle (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)) (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(declare-fun b!9047 () Bool)

(declare-fun e!5587 () Bool)

(assert (=> b!9047 (= e!5586 e!5587)))

(declare-fun res!9423 () Bool)

(assert (=> b!9047 (=> res!9423 e!5587)))

(assert (=> b!9047 (= res!9423 (= (size!245 (buf!581 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9048 () Bool)

(assert (=> b!9048 (= e!5587 (arrayBitRangesEq!0 (buf!581 thiss!1486) (buf!581 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(assert (= (and d!2720 res!9425) b!9046))

(assert (= (and b!9046 res!9424) b!9047))

(assert (= (and b!9047 (not res!9423)) b!9048))

(assert (=> b!9046 m!11833))

(assert (=> b!9046 m!11833))

(assert (=> b!9048 m!11833))

(assert (=> b!9048 m!11833))

(declare-fun m!12619 () Bool)

(assert (=> b!9048 m!12619))

(assert (=> d!2582 d!2720))

(declare-fun d!2722 () Bool)

(declare-fun res!9428 () Bool)

(declare-fun e!5588 () Bool)

(assert (=> d!2722 (=> (not res!9428) (not e!5588))))

(assert (=> d!2722 (= res!9428 (= (size!245 (buf!581 lt!13046)) (size!245 (buf!581 lt!13046))))))

(assert (=> d!2722 (= (isPrefixOf!0 lt!13046 lt!13046) e!5588)))

(declare-fun b!9049 () Bool)

(declare-fun res!9427 () Bool)

(assert (=> b!9049 (=> (not res!9427) (not e!5588))))

(assert (=> b!9049 (= res!9427 (bvsle (bitIndex!0 (size!245 (buf!581 lt!13046)) (currentByte!1620 lt!13046) (currentBit!1615 lt!13046)) (bitIndex!0 (size!245 (buf!581 lt!13046)) (currentByte!1620 lt!13046) (currentBit!1615 lt!13046))))))

(declare-fun b!9050 () Bool)

(declare-fun e!5589 () Bool)

(assert (=> b!9050 (= e!5588 e!5589)))

(declare-fun res!9426 () Bool)

(assert (=> b!9050 (=> res!9426 e!5589)))

(assert (=> b!9050 (= res!9426 (= (size!245 (buf!581 lt!13046)) #b00000000000000000000000000000000))))

(declare-fun b!9051 () Bool)

(assert (=> b!9051 (= e!5589 (arrayBitRangesEq!0 (buf!581 lt!13046) (buf!581 lt!13046) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 lt!13046)) (currentByte!1620 lt!13046) (currentBit!1615 lt!13046))))))

(assert (= (and d!2722 res!9428) b!9049))

(assert (= (and b!9049 res!9427) b!9050))

(assert (= (and b!9050 (not res!9426)) b!9051))

(declare-fun m!12621 () Bool)

(assert (=> b!9049 m!12621))

(assert (=> b!9049 m!12621))

(assert (=> b!9051 m!12621))

(assert (=> b!9051 m!12621))

(declare-fun m!12623 () Bool)

(assert (=> b!9051 m!12623))

(assert (=> d!2582 d!2722))

(declare-fun d!2724 () Bool)

(declare-fun res!9431 () Bool)

(declare-fun e!5590 () Bool)

(assert (=> d!2724 (=> (not res!9431) (not e!5590))))

(assert (=> d!2724 (= res!9431 (= (size!245 (buf!581 (_1!613 lt!13050))) (size!245 (buf!581 (_2!613 lt!13050)))))))

(assert (=> d!2724 (= (isPrefixOf!0 (_1!613 lt!13050) (_2!613 lt!13050)) e!5590)))

(declare-fun b!9052 () Bool)

(declare-fun res!9430 () Bool)

(assert (=> b!9052 (=> (not res!9430) (not e!5590))))

(assert (=> b!9052 (= res!9430 (bvsle (bitIndex!0 (size!245 (buf!581 (_1!613 lt!13050))) (currentByte!1620 (_1!613 lt!13050)) (currentBit!1615 (_1!613 lt!13050))) (bitIndex!0 (size!245 (buf!581 (_2!613 lt!13050))) (currentByte!1620 (_2!613 lt!13050)) (currentBit!1615 (_2!613 lt!13050)))))))

(declare-fun b!9053 () Bool)

(declare-fun e!5591 () Bool)

(assert (=> b!9053 (= e!5590 e!5591)))

(declare-fun res!9429 () Bool)

(assert (=> b!9053 (=> res!9429 e!5591)))

(assert (=> b!9053 (= res!9429 (= (size!245 (buf!581 (_1!613 lt!13050))) #b00000000000000000000000000000000))))

(declare-fun b!9054 () Bool)

(assert (=> b!9054 (= e!5591 (arrayBitRangesEq!0 (buf!581 (_1!613 lt!13050)) (buf!581 (_2!613 lt!13050)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 (_1!613 lt!13050))) (currentByte!1620 (_1!613 lt!13050)) (currentBit!1615 (_1!613 lt!13050)))))))

(assert (= (and d!2724 res!9431) b!9052))

(assert (= (and b!9052 res!9430) b!9053))

(assert (= (and b!9053 (not res!9429)) b!9054))

(declare-fun m!12625 () Bool)

(assert (=> b!9052 m!12625))

(declare-fun m!12627 () Bool)

(assert (=> b!9052 m!12627))

(assert (=> b!9054 m!12625))

(assert (=> b!9054 m!12625))

(declare-fun m!12629 () Bool)

(assert (=> b!9054 m!12629))

(assert (=> d!2582 d!2724))

(declare-fun d!2726 () Bool)

(assert (=> d!2726 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lt!13490 () Unit!744)

(declare-fun choose!11 (BitStream!468) Unit!744)

(assert (=> d!2726 (= lt!13490 (choose!11 thiss!1486))))

(assert (=> d!2726 (= (lemmaIsPrefixRefl!0 thiss!1486) lt!13490)))

(declare-fun bs!872 () Bool)

(assert (= bs!872 d!2726))

(assert (=> bs!872 m!11873))

(declare-fun m!12631 () Bool)

(assert (=> bs!872 m!12631))

(assert (=> d!2582 d!2726))

(declare-fun d!2728 () Bool)

(declare-fun res!9434 () Bool)

(declare-fun e!5592 () Bool)

(assert (=> d!2728 (=> (not res!9434) (not e!5592))))

(assert (=> d!2728 (= res!9434 (= (size!245 (buf!581 (_2!612 lt!12518))) (size!245 (buf!581 (_2!612 lt!12518)))))))

(assert (=> d!2728 (= (isPrefixOf!0 (_2!612 lt!12518) (_2!612 lt!12518)) e!5592)))

(declare-fun b!9055 () Bool)

(declare-fun res!9433 () Bool)

(assert (=> b!9055 (=> (not res!9433) (not e!5592))))

(assert (=> b!9055 (= res!9433 (bvsle (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12518))) (currentByte!1620 (_2!612 lt!12518)) (currentBit!1615 (_2!612 lt!12518))) (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12518))) (currentByte!1620 (_2!612 lt!12518)) (currentBit!1615 (_2!612 lt!12518)))))))

(declare-fun b!9056 () Bool)

(declare-fun e!5593 () Bool)

(assert (=> b!9056 (= e!5592 e!5593)))

(declare-fun res!9432 () Bool)

(assert (=> b!9056 (=> res!9432 e!5593)))

(assert (=> b!9056 (= res!9432 (= (size!245 (buf!581 (_2!612 lt!12518))) #b00000000000000000000000000000000))))

(declare-fun b!9057 () Bool)

(assert (=> b!9057 (= e!5593 (arrayBitRangesEq!0 (buf!581 (_2!612 lt!12518)) (buf!581 (_2!612 lt!12518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12518))) (currentByte!1620 (_2!612 lt!12518)) (currentBit!1615 (_2!612 lt!12518)))))))

(assert (= (and d!2728 res!9434) b!9055))

(assert (= (and b!9055 res!9433) b!9056))

(assert (= (and b!9056 (not res!9432)) b!9057))

(assert (=> b!9055 m!11831))

(assert (=> b!9055 m!11831))

(assert (=> b!9057 m!11831))

(assert (=> b!9057 m!11831))

(declare-fun m!12633 () Bool)

(assert (=> b!9057 m!12633))

(assert (=> d!2582 d!2728))

(declare-fun d!2730 () Bool)

(declare-fun res!9437 () Bool)

(declare-fun e!5594 () Bool)

(assert (=> d!2730 (=> (not res!9437) (not e!5594))))

(assert (=> d!2730 (= res!9437 (= (size!245 (buf!581 lt!13046)) (size!245 (buf!581 (_2!612 lt!12518)))))))

(assert (=> d!2730 (= (isPrefixOf!0 lt!13046 (_2!612 lt!12518)) e!5594)))

(declare-fun b!9058 () Bool)

(declare-fun res!9436 () Bool)

(assert (=> b!9058 (=> (not res!9436) (not e!5594))))

(assert (=> b!9058 (= res!9436 (bvsle (bitIndex!0 (size!245 (buf!581 lt!13046)) (currentByte!1620 lt!13046) (currentBit!1615 lt!13046)) (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12518))) (currentByte!1620 (_2!612 lt!12518)) (currentBit!1615 (_2!612 lt!12518)))))))

(declare-fun b!9059 () Bool)

(declare-fun e!5595 () Bool)

(assert (=> b!9059 (= e!5594 e!5595)))

(declare-fun res!9435 () Bool)

(assert (=> b!9059 (=> res!9435 e!5595)))

(assert (=> b!9059 (= res!9435 (= (size!245 (buf!581 lt!13046)) #b00000000000000000000000000000000))))

(declare-fun b!9060 () Bool)

(assert (=> b!9060 (= e!5595 (arrayBitRangesEq!0 (buf!581 lt!13046) (buf!581 (_2!612 lt!12518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 lt!13046)) (currentByte!1620 lt!13046) (currentBit!1615 lt!13046))))))

(assert (= (and d!2730 res!9437) b!9058))

(assert (= (and b!9058 res!9436) b!9059))

(assert (= (and b!9059 (not res!9435)) b!9060))

(assert (=> b!9058 m!12621))

(assert (=> b!9058 m!11831))

(assert (=> b!9060 m!12621))

(assert (=> b!9060 m!12621))

(declare-fun m!12635 () Bool)

(assert (=> b!9060 m!12635))

(assert (=> d!2582 d!2730))

(assert (=> d!2582 d!2544))

(declare-fun d!2732 () Bool)

(assert (=> d!2732 (isPrefixOf!0 lt!13046 lt!13046)))

(declare-fun lt!13491 () Unit!744)

(assert (=> d!2732 (= lt!13491 (choose!11 lt!13046))))

(assert (=> d!2732 (= (lemmaIsPrefixRefl!0 lt!13046) lt!13491)))

(declare-fun bs!873 () Bool)

(assert (= bs!873 d!2732))

(assert (=> bs!873 m!12187))

(declare-fun m!12637 () Bool)

(assert (=> bs!873 m!12637))

(assert (=> d!2582 d!2732))

(declare-fun d!2734 () Bool)

(assert (=> d!2734 (isPrefixOf!0 lt!13046 (_2!612 lt!12518))))

(declare-fun lt!13492 () Unit!744)

(assert (=> d!2734 (= lt!13492 (choose!30 lt!13046 (_2!612 lt!12518) (_2!612 lt!12518)))))

(assert (=> d!2734 (isPrefixOf!0 lt!13046 (_2!612 lt!12518))))

(assert (=> d!2734 (= (lemmaIsPrefixTransitive!0 lt!13046 (_2!612 lt!12518) (_2!612 lt!12518)) lt!13492)))

(declare-fun bs!874 () Bool)

(assert (= bs!874 d!2734))

(assert (=> bs!874 m!12177))

(declare-fun m!12639 () Bool)

(assert (=> bs!874 m!12639))

(assert (=> bs!874 m!12177))

(assert (=> d!2582 d!2734))

(declare-fun d!2736 () Bool)

(assert (=> d!2736 (isPrefixOf!0 (_2!612 lt!12518) (_2!612 lt!12518))))

(declare-fun lt!13493 () Unit!744)

(assert (=> d!2736 (= lt!13493 (choose!11 (_2!612 lt!12518)))))

(assert (=> d!2736 (= (lemmaIsPrefixRefl!0 (_2!612 lt!12518)) lt!13493)))

(declare-fun bs!875 () Bool)

(assert (= bs!875 d!2736))

(assert (=> bs!875 m!12181))

(declare-fun m!12641 () Bool)

(assert (=> bs!875 m!12641))

(assert (=> d!2582 d!2736))

(declare-fun d!2738 () Bool)

(assert (=> d!2738 (isPrefixOf!0 lt!13046 (_2!612 lt!12518))))

(declare-fun lt!13494 () Unit!744)

(assert (=> d!2738 (= lt!13494 (choose!30 lt!13046 thiss!1486 (_2!612 lt!12518)))))

(assert (=> d!2738 (isPrefixOf!0 lt!13046 thiss!1486)))

(assert (=> d!2738 (= (lemmaIsPrefixTransitive!0 lt!13046 thiss!1486 (_2!612 lt!12518)) lt!13494)))

(declare-fun bs!876 () Bool)

(assert (= bs!876 d!2738))

(assert (=> bs!876 m!12177))

(declare-fun m!12643 () Bool)

(assert (=> bs!876 m!12643))

(declare-fun m!12645 () Bool)

(assert (=> bs!876 m!12645))

(assert (=> d!2582 d!2738))

(declare-fun d!2740 () Bool)

(declare-fun size!247 (List!142) Int)

(assert (=> d!2740 (= (length!22 lt!13255) (size!247 lt!13255))))

(declare-fun bs!877 () Bool)

(assert (= bs!877 d!2740))

(declare-fun m!12647 () Bool)

(assert (=> bs!877 m!12647))

(assert (=> b!8892 d!2740))

(declare-fun b!9061 () Bool)

(declare-fun e!5597 () tuple2!1182)

(assert (=> b!9061 (= e!5597 (tuple2!1183 Nil!139 (_2!625 lt!13254)))))

(declare-fun b!9063 () Bool)

(declare-fun e!5596 () Bool)

(declare-fun lt!13496 () List!142)

(assert (=> b!9063 (= e!5596 (isEmpty!27 lt!13496))))

(declare-fun b!9064 () Bool)

(assert (=> b!9064 (= e!5596 (> (length!22 lt!13496) 0))))

(declare-fun lt!13497 () (_ BitVec 64))

(declare-fun lt!13495 () tuple2!1184)

(declare-fun b!9062 () Bool)

(assert (=> b!9062 (= e!5597 (tuple2!1183 (Cons!138 (_1!625 lt!13495) (bitStreamReadBitsIntoList!0 (_2!612 lt!12518) (_2!625 lt!13495) (bvsub (bvsub nBits!460 lt!13256) lt!13497))) (_2!625 lt!13495)))))

(assert (=> b!9062 (= lt!13495 (readBit!0 (_2!625 lt!13254)))))

(assert (=> b!9062 (= lt!13497 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2742 () Bool)

(assert (=> d!2742 e!5596))

(declare-fun c!540 () Bool)

(assert (=> d!2742 (= c!540 (= (bvsub nBits!460 lt!13256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2742 (= lt!13496 (_1!624 e!5597))))

(declare-fun c!539 () Bool)

(assert (=> d!2742 (= c!539 (= (bvsub nBits!460 lt!13256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2742 (bvsge (bvsub nBits!460 lt!13256) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2742 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12518) (_2!625 lt!13254) (bvsub nBits!460 lt!13256)) lt!13496)))

(assert (= (and d!2742 c!539) b!9061))

(assert (= (and d!2742 (not c!539)) b!9062))

(assert (= (and d!2742 c!540) b!9063))

(assert (= (and d!2742 (not c!540)) b!9064))

(declare-fun m!12649 () Bool)

(assert (=> b!9063 m!12649))

(declare-fun m!12651 () Bool)

(assert (=> b!9064 m!12651))

(declare-fun m!12653 () Bool)

(assert (=> b!9062 m!12653))

(declare-fun m!12655 () Bool)

(assert (=> b!9062 m!12655))

(assert (=> b!8890 d!2742))

(declare-fun d!2744 () Bool)

(declare-fun e!5604 () Bool)

(assert (=> d!2744 e!5604))

(declare-fun res!9440 () Bool)

(assert (=> d!2744 (=> (not res!9440) (not e!5604))))

(declare-fun increaseBitIndex!0 (BitStream!468) tuple2!1162)

(assert (=> d!2744 (= res!9440 (= (buf!581 (_2!612 (increaseBitIndex!0 (_1!613 lt!12517)))) (buf!581 (_1!613 lt!12517))))))

(declare-fun lt!13512 () Bool)

(assert (=> d!2744 (= lt!13512 (not (= (bvand ((_ sign_extend 24) (select (arr!650 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1615 (_1!613 lt!12517))))) #b00000000000000000000000000000000)))))

(declare-fun lt!13517 () tuple2!1184)

(assert (=> d!2744 (= lt!13517 (tuple2!1185 (not (= (bvand ((_ sign_extend 24) (select (arr!650 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1615 (_1!613 lt!12517))))) #b00000000000000000000000000000000)) (_2!612 (increaseBitIndex!0 (_1!613 lt!12517)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!2744 (validate_offset_bit!0 ((_ sign_extend 32) (size!245 (buf!581 (_1!613 lt!12517)))) ((_ sign_extend 32) (currentByte!1620 (_1!613 lt!12517))) ((_ sign_extend 32) (currentBit!1615 (_1!613 lt!12517))))))

(assert (=> d!2744 (= (readBit!0 (_1!613 lt!12517)) lt!13517)))

(declare-fun lt!13514 () (_ BitVec 64))

(declare-fun b!9067 () Bool)

(declare-fun lt!13518 () (_ BitVec 64))

(assert (=> b!9067 (= e!5604 (= (bitIndex!0 (size!245 (buf!581 (_2!612 (increaseBitIndex!0 (_1!613 lt!12517))))) (currentByte!1620 (_2!612 (increaseBitIndex!0 (_1!613 lt!12517)))) (currentBit!1615 (_2!612 (increaseBitIndex!0 (_1!613 lt!12517))))) (bvadd lt!13518 lt!13514)))))

(assert (=> b!9067 (or (not (= (bvand lt!13518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13514 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13518 lt!13514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9067 (= lt!13514 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!9067 (= lt!13518 (bitIndex!0 (size!245 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)) (currentBit!1615 (_1!613 lt!12517))))))

(declare-fun lt!13515 () Bool)

(assert (=> b!9067 (= lt!13515 (not (= (bvand ((_ sign_extend 24) (select (arr!650 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1615 (_1!613 lt!12517))))) #b00000000000000000000000000000000)))))

(declare-fun lt!13513 () Bool)

(assert (=> b!9067 (= lt!13513 (not (= (bvand ((_ sign_extend 24) (select (arr!650 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1615 (_1!613 lt!12517))))) #b00000000000000000000000000000000)))))

(declare-fun lt!13516 () Bool)

(assert (=> b!9067 (= lt!13516 (not (= (bvand ((_ sign_extend 24) (select (arr!650 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1615 (_1!613 lt!12517))))) #b00000000000000000000000000000000)))))

(assert (= (and d!2744 res!9440) b!9067))

(declare-fun m!12657 () Bool)

(assert (=> d!2744 m!12657))

(declare-fun m!12659 () Bool)

(assert (=> d!2744 m!12659))

(declare-fun m!12661 () Bool)

(assert (=> d!2744 m!12661))

(declare-fun m!12663 () Bool)

(assert (=> d!2744 m!12663))

(assert (=> b!9067 m!12659))

(assert (=> b!9067 m!12661))

(declare-fun m!12665 () Bool)

(assert (=> b!9067 m!12665))

(assert (=> b!9067 m!12267))

(assert (=> b!9067 m!12657))

(assert (=> b!8890 d!2744))

(declare-fun d!2746 () Bool)

(get-info :version)

(assert (=> d!2746 (= (isEmpty!27 lt!13255) ((_ is Nil!139) lt!13255))))

(assert (=> b!8891 d!2746))

(declare-fun d!2748 () Bool)

(declare-fun res!9443 () Bool)

(declare-fun e!5605 () Bool)

(assert (=> d!2748 (=> (not res!9443) (not e!5605))))

(assert (=> d!2748 (= res!9443 (= (size!245 (buf!581 (_2!613 lt!13050))) (size!245 (buf!581 (_2!612 lt!12518)))))))

(assert (=> d!2748 (= (isPrefixOf!0 (_2!613 lt!13050) (_2!612 lt!12518)) e!5605)))

(declare-fun b!9068 () Bool)

(declare-fun res!9442 () Bool)

(assert (=> b!9068 (=> (not res!9442) (not e!5605))))

(assert (=> b!9068 (= res!9442 (bvsle (bitIndex!0 (size!245 (buf!581 (_2!613 lt!13050))) (currentByte!1620 (_2!613 lt!13050)) (currentBit!1615 (_2!613 lt!13050))) (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12518))) (currentByte!1620 (_2!612 lt!12518)) (currentBit!1615 (_2!612 lt!12518)))))))

(declare-fun b!9069 () Bool)

(declare-fun e!5606 () Bool)

(assert (=> b!9069 (= e!5605 e!5606)))

(declare-fun res!9441 () Bool)

(assert (=> b!9069 (=> res!9441 e!5606)))

(assert (=> b!9069 (= res!9441 (= (size!245 (buf!581 (_2!613 lt!13050))) #b00000000000000000000000000000000))))

(declare-fun b!9070 () Bool)

(assert (=> b!9070 (= e!5606 (arrayBitRangesEq!0 (buf!581 (_2!613 lt!13050)) (buf!581 (_2!612 lt!12518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 (_2!613 lt!13050))) (currentByte!1620 (_2!613 lt!13050)) (currentBit!1615 (_2!613 lt!13050)))))))

(assert (= (and d!2748 res!9443) b!9068))

(assert (= (and b!9068 res!9442) b!9069))

(assert (= (and b!9069 (not res!9441)) b!9070))

(assert (=> b!9068 m!12627))

(assert (=> b!9068 m!11831))

(assert (=> b!9070 m!12627))

(assert (=> b!9070 m!12627))

(declare-fun m!12667 () Bool)

(assert (=> b!9070 m!12667))

(assert (=> b!8805 d!2748))

(declare-fun b!9071 () Bool)

(declare-fun e!5608 () tuple2!1182)

(assert (=> b!9071 (= e!5608 (tuple2!1183 Nil!139 (_1!613 lt!12823)))))

(declare-fun b!9073 () Bool)

(declare-fun e!5607 () Bool)

(declare-fun lt!13520 () List!142)

(assert (=> b!9073 (= e!5607 (isEmpty!27 lt!13520))))

(declare-fun b!9074 () Bool)

(assert (=> b!9074 (= e!5607 (> (length!22 lt!13520) 0))))

(declare-fun lt!13519 () tuple2!1184)

(declare-fun lt!13521 () (_ BitVec 64))

(declare-fun b!9072 () Bool)

(assert (=> b!9072 (= e!5608 (tuple2!1183 (Cons!138 (_1!625 lt!13519) (bitStreamReadBitsIntoList!0 (_2!612 lt!12805) (_2!625 lt!13519) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!13521))) (_2!625 lt!13519)))))

(assert (=> b!9072 (= lt!13519 (readBit!0 (_1!613 lt!12823)))))

(assert (=> b!9072 (= lt!13521 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2750 () Bool)

(assert (=> d!2750 e!5607))

(declare-fun c!542 () Bool)

(assert (=> d!2750 (= c!542 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2750 (= lt!13520 (_1!624 e!5608))))

(declare-fun c!541 () Bool)

(assert (=> d!2750 (= c!541 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2750 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2750 (= (bitStreamReadBitsIntoList!0 (_2!612 lt!12805) (_1!613 lt!12823) (bvsub (bvadd from!367 nBits!460) from!367)) lt!13520)))

(assert (= (and d!2750 c!541) b!9071))

(assert (= (and d!2750 (not c!541)) b!9072))

(assert (= (and d!2750 c!542) b!9073))

(assert (= (and d!2750 (not c!542)) b!9074))

(declare-fun m!12669 () Bool)

(assert (=> b!9073 m!12669))

(declare-fun m!12671 () Bool)

(assert (=> b!9074 m!12671))

(declare-fun m!12673 () Bool)

(assert (=> b!9072 m!12673))

(declare-fun m!12675 () Bool)

(assert (=> b!9072 m!12675))

(assert (=> b!8720 d!2750))

(declare-fun e!5610 () Bool)

(declare-fun lt!13526 () tuple2!1164)

(declare-fun b!9075 () Bool)

(declare-fun lt!13537 () (_ BitVec 64))

(declare-fun lt!13539 () (_ BitVec 64))

(assert (=> b!9075 (= e!5610 (= (_1!613 lt!13526) (withMovedBitIndex!0 (_2!613 lt!13526) (bvsub lt!13539 lt!13537))))))

(assert (=> b!9075 (or (= (bvand lt!13539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13539 lt!13537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9075 (= lt!13537 (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12805))) (currentByte!1620 (_2!612 lt!12805)) (currentBit!1615 (_2!612 lt!12805))))))

(assert (=> b!9075 (= lt!13539 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(declare-fun d!2752 () Bool)

(assert (=> d!2752 e!5610))

(declare-fun res!9444 () Bool)

(assert (=> d!2752 (=> (not res!9444) (not e!5610))))

(assert (=> d!2752 (= res!9444 (isPrefixOf!0 (_1!613 lt!13526) (_2!613 lt!13526)))))

(declare-fun lt!13522 () BitStream!468)

(assert (=> d!2752 (= lt!13526 (tuple2!1165 lt!13522 (_2!612 lt!12805)))))

(declare-fun lt!13530 () Unit!744)

(declare-fun lt!13531 () Unit!744)

(assert (=> d!2752 (= lt!13530 lt!13531)))

(assert (=> d!2752 (isPrefixOf!0 lt!13522 (_2!612 lt!12805))))

(assert (=> d!2752 (= lt!13531 (lemmaIsPrefixTransitive!0 lt!13522 (_2!612 lt!12805) (_2!612 lt!12805)))))

(declare-fun lt!13538 () Unit!744)

(declare-fun lt!13532 () Unit!744)

(assert (=> d!2752 (= lt!13538 lt!13532)))

(assert (=> d!2752 (isPrefixOf!0 lt!13522 (_2!612 lt!12805))))

(assert (=> d!2752 (= lt!13532 (lemmaIsPrefixTransitive!0 lt!13522 thiss!1486 (_2!612 lt!12805)))))

(declare-fun lt!13534 () Unit!744)

(declare-fun e!5609 () Unit!744)

(assert (=> d!2752 (= lt!13534 e!5609)))

(declare-fun c!543 () Bool)

(assert (=> d!2752 (= c!543 (not (= (size!245 (buf!581 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!13540 () Unit!744)

(declare-fun lt!13525 () Unit!744)

(assert (=> d!2752 (= lt!13540 lt!13525)))

(assert (=> d!2752 (isPrefixOf!0 (_2!612 lt!12805) (_2!612 lt!12805))))

(assert (=> d!2752 (= lt!13525 (lemmaIsPrefixRefl!0 (_2!612 lt!12805)))))

(declare-fun lt!13535 () Unit!744)

(declare-fun lt!13524 () Unit!744)

(assert (=> d!2752 (= lt!13535 lt!13524)))

(assert (=> d!2752 (= lt!13524 (lemmaIsPrefixRefl!0 (_2!612 lt!12805)))))

(declare-fun lt!13529 () Unit!744)

(declare-fun lt!13527 () Unit!744)

(assert (=> d!2752 (= lt!13529 lt!13527)))

(assert (=> d!2752 (isPrefixOf!0 lt!13522 lt!13522)))

(assert (=> d!2752 (= lt!13527 (lemmaIsPrefixRefl!0 lt!13522))))

(declare-fun lt!13533 () Unit!744)

(declare-fun lt!13541 () Unit!744)

(assert (=> d!2752 (= lt!13533 lt!13541)))

(assert (=> d!2752 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2752 (= lt!13541 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2752 (= lt!13522 (BitStream!469 (buf!581 (_2!612 lt!12805)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(assert (=> d!2752 (isPrefixOf!0 thiss!1486 (_2!612 lt!12805))))

(assert (=> d!2752 (= (reader!0 thiss!1486 (_2!612 lt!12805)) lt!13526)))

(declare-fun b!9076 () Bool)

(declare-fun lt!13528 () Unit!744)

(assert (=> b!9076 (= e!5609 lt!13528)))

(declare-fun lt!13536 () (_ BitVec 64))

(assert (=> b!9076 (= lt!13536 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13523 () (_ BitVec 64))

(assert (=> b!9076 (= lt!13523 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(assert (=> b!9076 (= lt!13528 (arrayBitRangesEqSymmetric!0 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12805)) lt!13536 lt!13523))))

(assert (=> b!9076 (arrayBitRangesEq!0 (buf!581 (_2!612 lt!12805)) (buf!581 thiss!1486) lt!13536 lt!13523)))

(declare-fun b!9077 () Bool)

(declare-fun res!9446 () Bool)

(assert (=> b!9077 (=> (not res!9446) (not e!5610))))

(assert (=> b!9077 (= res!9446 (isPrefixOf!0 (_1!613 lt!13526) thiss!1486))))

(declare-fun b!9078 () Bool)

(declare-fun Unit!781 () Unit!744)

(assert (=> b!9078 (= e!5609 Unit!781)))

(declare-fun b!9079 () Bool)

(declare-fun res!9445 () Bool)

(assert (=> b!9079 (=> (not res!9445) (not e!5610))))

(assert (=> b!9079 (= res!9445 (isPrefixOf!0 (_2!613 lt!13526) (_2!612 lt!12805)))))

(assert (= (and d!2752 c!543) b!9076))

(assert (= (and d!2752 (not c!543)) b!9078))

(assert (= (and d!2752 res!9444) b!9077))

(assert (= (and b!9077 res!9446) b!9079))

(assert (= (and b!9079 res!9445) b!9075))

(declare-fun m!12677 () Bool)

(assert (=> b!9075 m!12677))

(assert (=> b!9075 m!11871))

(assert (=> b!9075 m!11833))

(assert (=> d!2752 m!11873))

(assert (=> d!2752 m!12005))

(declare-fun m!12679 () Bool)

(assert (=> d!2752 m!12679))

(assert (=> d!2752 m!11875))

(declare-fun m!12681 () Bool)

(assert (=> d!2752 m!12681))

(declare-fun m!12683 () Bool)

(assert (=> d!2752 m!12683))

(declare-fun m!12685 () Bool)

(assert (=> d!2752 m!12685))

(declare-fun m!12687 () Bool)

(assert (=> d!2752 m!12687))

(declare-fun m!12689 () Bool)

(assert (=> d!2752 m!12689))

(declare-fun m!12691 () Bool)

(assert (=> d!2752 m!12691))

(declare-fun m!12693 () Bool)

(assert (=> d!2752 m!12693))

(declare-fun m!12695 () Bool)

(assert (=> b!9077 m!12695))

(declare-fun m!12697 () Bool)

(assert (=> b!9079 m!12697))

(assert (=> b!9076 m!11833))

(declare-fun m!12699 () Bool)

(assert (=> b!9076 m!12699))

(declare-fun m!12701 () Bool)

(assert (=> b!9076 m!12701))

(assert (=> b!8720 d!2752))

(declare-fun d!2754 () Bool)

(declare-fun c!544 () Bool)

(assert (=> d!2754 (= c!544 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5611 () List!142)

(assert (=> d!2754 (= (byteArrayBitContentToList!0 (_2!612 lt!12805) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!5611)))

(declare-fun b!9080 () Bool)

(assert (=> b!9080 (= e!5611 Nil!139)))

(declare-fun b!9081 () Bool)

(assert (=> b!9081 (= e!5611 (Cons!138 (not (= (bvand ((_ sign_extend 24) (select (arr!650 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!612 lt!12805) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2754 c!544) b!9080))

(assert (= (and d!2754 (not c!544)) b!9081))

(assert (=> b!9081 m!11931))

(assert (=> b!9081 m!12417))

(declare-fun m!12703 () Bool)

(assert (=> b!9081 m!12703))

(assert (=> b!8720 d!2754))

(declare-fun d!2756 () Bool)

(assert (=> d!2756 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12805)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12811)))

(declare-fun lt!13542 () Unit!744)

(assert (=> d!2756 (= lt!13542 (choose!9 thiss!1486 (buf!581 (_2!612 lt!12805)) lt!12811 (BitStream!469 (buf!581 (_2!612 lt!12805)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(assert (=> d!2756 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!581 (_2!612 lt!12805)) lt!12811) lt!13542)))

(declare-fun bs!878 () Bool)

(assert (= bs!878 d!2756))

(assert (=> bs!878 m!12021))

(declare-fun m!12705 () Bool)

(assert (=> bs!878 m!12705))

(assert (=> b!8720 d!2756))

(declare-fun d!2758 () Bool)

(assert (=> d!2758 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12805)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12811) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12805)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486))) lt!12811))))

(declare-fun bs!879 () Bool)

(assert (= bs!879 d!2758))

(declare-fun m!12707 () Bool)

(assert (=> bs!879 m!12707))

(assert (=> b!8720 d!2758))

(declare-fun b!9100 () Bool)

(declare-fun res!9463 () Bool)

(declare-fun e!5620 () Bool)

(assert (=> b!9100 (=> (not res!9463) (not e!5620))))

(declare-fun lt!13639 () tuple3!64)

(assert (=> b!9100 (= res!9463 (arrayBitRangesEq!0 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!32 lt!13639) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!9101 () Bool)

(declare-fun res!9467 () Bool)

(assert (=> b!9101 (=> (not res!9467) (not e!5620))))

(assert (=> b!9101 (= res!9467 (and (= (buf!581 (_1!613 lt!12517)) (buf!581 (_2!621 lt!13639))) (= (size!245 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!245 (_3!32 lt!13639)))))))

(declare-fun lt!13636 () array!572)

(declare-fun lt!13621 () (_ BitVec 64))

(declare-fun call!147 () Bool)

(declare-fun lt!13641 () array!572)

(declare-fun lt!13637 () tuple3!64)

(declare-fun bm!143 () Bool)

(declare-fun lt!13625 () (_ BitVec 64))

(declare-fun c!547 () Bool)

(declare-fun lt!13642 () (_ BitVec 64))

(assert (=> bm!143 (= call!147 (arrayBitRangesEq!0 (ite c!547 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!13636) (ite c!547 (_3!32 lt!13637) lt!13641) (ite c!547 lt!13621 lt!13625) (ite c!547 #b0000000000000000000000000000000000000000000000000000000000000000 lt!13642)))))

(declare-fun b!9102 () Bool)

(declare-fun res!9465 () Bool)

(assert (=> b!9102 (=> (not res!9465) (not e!5620))))

(assert (=> b!9102 (= res!9465 (invariant!0 (currentBit!1615 (_2!621 lt!13639)) (currentByte!1620 (_2!621 lt!13639)) (size!245 (buf!581 (_2!621 lt!13639)))))))

(declare-fun b!9103 () Bool)

(declare-fun res!9461 () Bool)

(assert (=> b!9103 (=> (not res!9461) (not e!5620))))

(declare-fun e!5622 () Bool)

(assert (=> b!9103 (= res!9461 e!5622)))

(declare-fun res!9464 () Bool)

(assert (=> b!9103 (=> res!9464 e!5622)))

(assert (=> b!9103 (= res!9464 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun b!9104 () Bool)

(declare-fun e!5621 () tuple3!64)

(declare-fun lt!13618 () Unit!744)

(assert (=> b!9104 (= e!5621 (tuple3!65 lt!13618 (_2!621 lt!13637) (_3!32 lt!13637)))))

(declare-fun lt!13624 () tuple2!1184)

(assert (=> b!9104 (= lt!13624 (readBit!0 (_1!613 lt!12517)))))

(declare-fun lt!13630 () (_ BitVec 32))

(assert (=> b!9104 (= lt!13630 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13635 () (_ BitVec 32))

(assert (=> b!9104 (= lt!13635 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13622 () array!572)

(assert (=> b!9104 (= lt!13622 (array!573 (store (arr!650 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!13630 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!650 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!13630)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!13635)))) ((_ sign_extend 24) (ite (_1!625 lt!13624) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!13635) #b00000000))))) (size!245 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!13646 () (_ BitVec 64))

(assert (=> b!9104 (= lt!13646 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!13619 () (_ BitVec 64))

(assert (=> b!9104 (= lt!13619 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!13650 () Unit!744)

(assert (=> b!9104 (= lt!13650 (validateOffsetBitsIneqLemma!0 (_1!613 lt!12517) (_2!625 lt!13624) lt!13646 lt!13619))))

(assert (=> b!9104 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!625 lt!13624)))) ((_ sign_extend 32) (currentByte!1620 (_2!625 lt!13624))) ((_ sign_extend 32) (currentBit!1615 (_2!625 lt!13624))) (bvsub lt!13646 lt!13619))))

(declare-fun lt!13638 () Unit!744)

(assert (=> b!9104 (= lt!13638 lt!13650)))

(assert (=> b!9104 (= lt!13637 (readBitsLoop!0 (_2!625 lt!13624) nBits!460 lt!13622 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!460))))

(declare-fun res!9466 () Bool)

(assert (=> b!9104 (= res!9466 (= (bvsub (bvadd (bitIndex!0 (size!245 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)) (currentBit!1615 (_1!613 lt!12517))) nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!245 (buf!581 (_2!621 lt!13637))) (currentByte!1620 (_2!621 lt!13637)) (currentBit!1615 (_2!621 lt!13637)))))))

(declare-fun e!5623 () Bool)

(assert (=> b!9104 (=> (not res!9466) (not e!5623))))

(assert (=> b!9104 e!5623))

(declare-fun lt!13626 () Unit!744)

(declare-fun Unit!782 () Unit!744)

(assert (=> b!9104 (= lt!13626 Unit!782)))

(declare-fun lt!13631 () (_ BitVec 32))

(assert (=> b!9104 (= lt!13631 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13627 () (_ BitVec 32))

(assert (=> b!9104 (= lt!13627 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13648 () Unit!744)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!572 (_ BitVec 64) Bool) Unit!744)

(assert (=> b!9104 (= lt!13648 (arrayBitRangesUpdatedAtLemma!0 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!625 lt!13624)))))

(declare-fun call!146 () Bool)

(assert (=> b!9104 call!146))

(declare-fun lt!13620 () Unit!744)

(assert (=> b!9104 (= lt!13620 lt!13648)))

(assert (=> b!9104 (= lt!13621 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13640 () Unit!744)

(declare-fun arrayBitRangesEqTransitive!0 (array!572 array!572 array!572 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!744)

(assert (=> b!9104 (= lt!13640 (arrayBitRangesEqTransitive!0 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!13622 (_3!32 lt!13637) lt!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!9104 call!147))

(declare-fun lt!13628 () Unit!744)

(assert (=> b!9104 (= lt!13628 lt!13640)))

(assert (=> b!9104 (arrayBitRangesEq!0 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!32 lt!13637) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13645 () Unit!744)

(declare-fun Unit!783 () Unit!744)

(assert (=> b!9104 (= lt!13645 Unit!783)))

(declare-fun lt!13617 () Unit!744)

(assert (=> b!9104 (= lt!13617 (arrayBitRangesEqImpliesEq!0 lt!13622 (_3!32 lt!13637) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!9104 (= (bitAt!0 lt!13622 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!32 lt!13637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!13623 () Unit!744)

(assert (=> b!9104 (= lt!13623 lt!13617)))

(declare-fun lt!13644 () Unit!744)

(declare-fun Unit!784 () Unit!744)

(assert (=> b!9104 (= lt!13644 Unit!784)))

(declare-fun lt!13632 () Bool)

(assert (=> b!9104 (= lt!13632 (= (bitAt!0 (_3!32 lt!13637) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!625 lt!13624)))))

(declare-fun Unit!785 () Unit!744)

(assert (=> b!9104 (= lt!13618 Unit!785)))

(assert (=> b!9104 lt!13632))

(declare-fun b!9105 () Bool)

(assert (=> b!9105 (= e!5623 (and (= (buf!581 (_1!613 lt!12517)) (buf!581 (_2!621 lt!13637))) (= (size!245 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!245 (_3!32 lt!13637)))))))

(declare-fun d!2760 () Bool)

(assert (=> d!2760 e!5620))

(declare-fun res!9462 () Bool)

(assert (=> d!2760 (=> (not res!9462) (not e!5620))))

(declare-fun lt!13643 () (_ BitVec 64))

(assert (=> d!2760 (= res!9462 (= (bvsub lt!13643 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!245 (buf!581 (_2!621 lt!13639))) (currentByte!1620 (_2!621 lt!13639)) (currentBit!1615 (_2!621 lt!13639)))))))

(assert (=> d!2760 (or (= (bvand lt!13643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13643 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!13647 () (_ BitVec 64))

(assert (=> d!2760 (= lt!13643 (bvadd lt!13647 nBits!460))))

(assert (=> d!2760 (or (not (= (bvand lt!13647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13647 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2760 (= lt!13647 (bitIndex!0 (size!245 (buf!581 (_1!613 lt!12517))) (currentByte!1620 (_1!613 lt!12517)) (currentBit!1615 (_1!613 lt!12517))))))

(assert (=> d!2760 (= lt!13639 e!5621)))

(assert (=> d!2760 (= c!547 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2760 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2760 (= (readBitsLoop!0 (_1!613 lt!12517) nBits!460 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!13639)))

(declare-fun bm!144 () Bool)

(assert (=> bm!144 (= call!146 (arrayBitRangesEq!0 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!547 (array!573 (store (arr!650 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!13631 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!650 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!13631)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!13627)))) ((_ sign_extend 24) (ite (_1!625 lt!13624) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!13627) #b00000000))))) (size!245 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!547 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!245 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!9106 () Bool)

(assert (=> b!9106 (= e!5622 (= (bitAt!0 (_3!32 lt!13639) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!627 (readBitPure!0 (_1!613 lt!12517)))))))

(declare-fun b!9107 () Bool)

(assert (=> b!9107 (= e!5620 (= (byteArrayBitContentToList!0 (_2!621 lt!13639) (_3!32 lt!13639) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!621 lt!13639) (_1!613 lt!12517) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9107 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9107 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!13634 () Unit!744)

(declare-fun b!9108 () Bool)

(assert (=> b!9108 (= e!5621 (tuple3!65 lt!13634 (_1!613 lt!12517) (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!13615 () Unit!744)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!572) Unit!744)

(assert (=> b!9108 (= lt!13615 (arrayBitRangesEqReflexiveLemma!0 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!9108 call!146))

(declare-fun lt!13629 () Unit!744)

(assert (=> b!9108 (= lt!13629 lt!13615)))

(assert (=> b!9108 (= lt!13636 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!9108 (= lt!13641 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!13649 () (_ BitVec 64))

(assert (=> b!9108 (= lt!13649 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13633 () (_ BitVec 64))

(assert (=> b!9108 (= lt!13633 ((_ sign_extend 32) (size!245 (array!573 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!13616 () (_ BitVec 64))

(assert (=> b!9108 (= lt!13616 (bvmul lt!13633 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!9108 (= lt!13625 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!9108 (= lt!13642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!572 array!572 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!744)

(assert (=> b!9108 (= lt!13634 (arrayBitRangesEqSlicedLemma!0 lt!13636 lt!13641 lt!13649 lt!13616 lt!13625 lt!13642))))

(assert (=> b!9108 call!147))

(assert (= (and d!2760 c!547) b!9104))

(assert (= (and d!2760 (not c!547)) b!9108))

(assert (= (and b!9104 res!9466) b!9105))

(assert (= (or b!9104 b!9108) bm!143))

(assert (= (or b!9104 b!9108) bm!144))

(assert (= (and d!2760 res!9462) b!9101))

(assert (= (and b!9101 res!9467) b!9100))

(assert (= (and b!9100 res!9463) b!9103))

(assert (= (and b!9103 (not res!9464)) b!9106))

(assert (= (and b!9103 res!9461) b!9102))

(assert (= (and b!9102 res!9465) b!9107))

(declare-fun m!12709 () Bool)

(assert (=> b!9100 m!12709))

(declare-fun m!12711 () Bool)

(assert (=> bm!144 m!12711))

(declare-fun m!12713 () Bool)

(assert (=> bm!144 m!12713))

(declare-fun m!12715 () Bool)

(assert (=> bm!144 m!12715))

(declare-fun m!12717 () Bool)

(assert (=> bm!144 m!12717))

(declare-fun m!12719 () Bool)

(assert (=> b!9106 m!12719))

(declare-fun m!12721 () Bool)

(assert (=> b!9106 m!12721))

(declare-fun m!12723 () Bool)

(assert (=> bm!143 m!12723))

(declare-fun m!12725 () Bool)

(assert (=> b!9104 m!12725))

(declare-fun m!12727 () Bool)

(assert (=> b!9104 m!12727))

(declare-fun m!12729 () Bool)

(assert (=> b!9104 m!12729))

(declare-fun m!12731 () Bool)

(assert (=> b!9104 m!12731))

(declare-fun m!12733 () Bool)

(assert (=> b!9104 m!12733))

(assert (=> b!9104 m!12267))

(declare-fun m!12735 () Bool)

(assert (=> b!9104 m!12735))

(declare-fun m!12737 () Bool)

(assert (=> b!9104 m!12737))

(declare-fun m!12739 () Bool)

(assert (=> b!9104 m!12739))

(declare-fun m!12741 () Bool)

(assert (=> b!9104 m!12741))

(assert (=> b!9104 m!12311))

(declare-fun m!12743 () Bool)

(assert (=> b!9104 m!12743))

(declare-fun m!12745 () Bool)

(assert (=> b!9104 m!12745))

(declare-fun m!12747 () Bool)

(assert (=> b!9104 m!12747))

(declare-fun m!12749 () Bool)

(assert (=> b!9104 m!12749))

(declare-fun m!12751 () Bool)

(assert (=> b!9108 m!12751))

(declare-fun m!12753 () Bool)

(assert (=> b!9108 m!12753))

(declare-fun m!12755 () Bool)

(assert (=> b!9107 m!12755))

(declare-fun m!12757 () Bool)

(assert (=> b!9107 m!12757))

(declare-fun m!12759 () Bool)

(assert (=> b!9102 m!12759))

(declare-fun m!12761 () Bool)

(assert (=> d!2760 m!12761))

(assert (=> d!2760 m!12267))

(assert (=> d!2594 d!2760))

(assert (=> d!2550 d!2716))

(assert (=> b!8802 d!2574))

(declare-fun d!2762 () Bool)

(assert (=> d!2762 (arrayBitRangesEq!0 (buf!581 (_2!612 lt!12518)) (buf!581 thiss!1486) lt!13060 lt!13047)))

(declare-fun lt!13653 () Unit!744)

(declare-fun choose!8 (array!572 array!572 (_ BitVec 64) (_ BitVec 64)) Unit!744)

(assert (=> d!2762 (= lt!13653 (choose!8 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12518)) lt!13060 lt!13047))))

(assert (=> d!2762 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13060) (bvsle lt!13060 lt!13047))))

(assert (=> d!2762 (= (arrayBitRangesEqSymmetric!0 (buf!581 thiss!1486) (buf!581 (_2!612 lt!12518)) lt!13060 lt!13047) lt!13653)))

(declare-fun bs!880 () Bool)

(assert (= bs!880 d!2762))

(assert (=> bs!880 m!12199))

(declare-fun m!12763 () Bool)

(assert (=> bs!880 m!12763))

(assert (=> b!8802 d!2762))

(declare-fun b!9109 () Bool)

(declare-fun e!5625 () Bool)

(declare-fun e!5628 () Bool)

(assert (=> b!9109 (= e!5625 e!5628)))

(declare-fun res!9468 () Bool)

(assert (=> b!9109 (=> (not res!9468) (not e!5628))))

(declare-fun e!5626 () Bool)

(assert (=> b!9109 (= res!9468 e!5626)))

(declare-fun res!9469 () Bool)

(assert (=> b!9109 (=> res!9469 e!5626)))

(declare-fun lt!13655 () tuple4!0)

(assert (=> b!9109 (= res!9469 (bvsge (_1!628 lt!13655) (_2!628 lt!13655)))))

(declare-fun lt!13656 () (_ BitVec 32))

(assert (=> b!9109 (= lt!13656 ((_ extract 31 0) (bvsrem lt!13047 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!13654 () (_ BitVec 32))

(assert (=> b!9109 (= lt!13654 ((_ extract 31 0) (bvsrem lt!13060 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9109 (= lt!13655 (arrayBitIndices!0 lt!13060 lt!13047))))

(declare-fun b!9110 () Bool)

(declare-fun e!5627 () Bool)

(assert (=> b!9110 (= e!5628 e!5627)))

(declare-fun c!548 () Bool)

(assert (=> b!9110 (= c!548 (= (_3!34 lt!13655) (_4!0 lt!13655)))))

(declare-fun d!2764 () Bool)

(declare-fun res!9472 () Bool)

(assert (=> d!2764 (=> res!9472 e!5625)))

(assert (=> d!2764 (= res!9472 (bvsge lt!13060 lt!13047))))

(assert (=> d!2764 (= (arrayBitRangesEq!0 (buf!581 (_2!612 lt!12518)) (buf!581 thiss!1486) lt!13060 lt!13047) e!5625)))

(declare-fun b!9111 () Bool)

(declare-fun e!5624 () Bool)

(assert (=> b!9111 (= e!5627 e!5624)))

(declare-fun res!9470 () Bool)

(assert (=> b!9111 (= res!9470 (byteRangesEq!0 (select (arr!650 (buf!581 (_2!612 lt!12518))) (_3!34 lt!13655)) (select (arr!650 (buf!581 thiss!1486)) (_3!34 lt!13655)) lt!13654 #b00000000000000000000000000001000))))

(assert (=> b!9111 (=> (not res!9470) (not e!5624))))

(declare-fun call!148 () Bool)

(declare-fun bm!145 () Bool)

(assert (=> bm!145 (= call!148 (byteRangesEq!0 (ite c!548 (select (arr!650 (buf!581 (_2!612 lt!12518))) (_3!34 lt!13655)) (select (arr!650 (buf!581 (_2!612 lt!12518))) (_4!0 lt!13655))) (ite c!548 (select (arr!650 (buf!581 thiss!1486)) (_3!34 lt!13655)) (select (arr!650 (buf!581 thiss!1486)) (_4!0 lt!13655))) (ite c!548 lt!13654 #b00000000000000000000000000000000) lt!13656))))

(declare-fun b!9112 () Bool)

(declare-fun e!5629 () Bool)

(assert (=> b!9112 (= e!5629 call!148)))

(declare-fun b!9113 () Bool)

(assert (=> b!9113 (= e!5627 call!148)))

(declare-fun b!9114 () Bool)

(assert (=> b!9114 (= e!5626 (arrayRangesEq!1 (buf!581 (_2!612 lt!12518)) (buf!581 thiss!1486) (_1!628 lt!13655) (_2!628 lt!13655)))))

(declare-fun b!9115 () Bool)

(declare-fun res!9471 () Bool)

(assert (=> b!9115 (= res!9471 (= lt!13656 #b00000000000000000000000000000000))))

(assert (=> b!9115 (=> res!9471 e!5629)))

(assert (=> b!9115 (= e!5624 e!5629)))

(assert (= (and d!2764 (not res!9472)) b!9109))

(assert (= (and b!9109 (not res!9469)) b!9114))

(assert (= (and b!9109 res!9468) b!9110))

(assert (= (and b!9110 c!548) b!9113))

(assert (= (and b!9110 (not c!548)) b!9111))

(assert (= (and b!9111 res!9470) b!9115))

(assert (= (and b!9115 (not res!9471)) b!9112))

(assert (= (or b!9113 b!9112) bm!145))

(declare-fun m!12765 () Bool)

(assert (=> b!9109 m!12765))

(declare-fun m!12767 () Bool)

(assert (=> b!9111 m!12767))

(declare-fun m!12769 () Bool)

(assert (=> b!9111 m!12769))

(assert (=> b!9111 m!12767))

(assert (=> b!9111 m!12769))

(declare-fun m!12771 () Bool)

(assert (=> b!9111 m!12771))

(declare-fun m!12773 () Bool)

(assert (=> bm!145 m!12773))

(assert (=> bm!145 m!12769))

(declare-fun m!12775 () Bool)

(assert (=> bm!145 m!12775))

(assert (=> bm!145 m!12767))

(declare-fun m!12777 () Bool)

(assert (=> bm!145 m!12777))

(declare-fun m!12779 () Bool)

(assert (=> b!9114 m!12779))

(assert (=> b!8802 d!2764))

(declare-fun d!2766 () Bool)

(declare-fun res!9475 () Bool)

(declare-fun e!5630 () Bool)

(assert (=> d!2766 (=> (not res!9475) (not e!5630))))

(assert (=> d!2766 (= res!9475 (= (size!245 (buf!581 (_1!613 lt!13050))) (size!245 (buf!581 thiss!1486))))))

(assert (=> d!2766 (= (isPrefixOf!0 (_1!613 lt!13050) thiss!1486) e!5630)))

(declare-fun b!9116 () Bool)

(declare-fun res!9474 () Bool)

(assert (=> b!9116 (=> (not res!9474) (not e!5630))))

(assert (=> b!9116 (= res!9474 (bvsle (bitIndex!0 (size!245 (buf!581 (_1!613 lt!13050))) (currentByte!1620 (_1!613 lt!13050)) (currentBit!1615 (_1!613 lt!13050))) (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))))))

(declare-fun b!9117 () Bool)

(declare-fun e!5631 () Bool)

(assert (=> b!9117 (= e!5630 e!5631)))

(declare-fun res!9473 () Bool)

(assert (=> b!9117 (=> res!9473 e!5631)))

(assert (=> b!9117 (= res!9473 (= (size!245 (buf!581 (_1!613 lt!13050))) #b00000000000000000000000000000000))))

(declare-fun b!9118 () Bool)

(assert (=> b!9118 (= e!5631 (arrayBitRangesEq!0 (buf!581 (_1!613 lt!13050)) (buf!581 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!245 (buf!581 (_1!613 lt!13050))) (currentByte!1620 (_1!613 lt!13050)) (currentBit!1615 (_1!613 lt!13050)))))))

(assert (= (and d!2766 res!9475) b!9116))

(assert (= (and b!9116 res!9474) b!9117))

(assert (= (and b!9117 (not res!9473)) b!9118))

(assert (=> b!9116 m!12625))

(assert (=> b!9116 m!11833))

(assert (=> b!9118 m!12625))

(assert (=> b!9118 m!12625))

(declare-fun m!12781 () Bool)

(assert (=> b!9118 m!12781))

(assert (=> b!8803 d!2766))

(declare-fun d!2768 () Bool)

(declare-fun e!5634 () Bool)

(assert (=> d!2768 e!5634))

(declare-fun res!9478 () Bool)

(assert (=> d!2768 (=> (not res!9478) (not e!5634))))

(declare-fun lt!13662 () (_ BitVec 64))

(declare-fun lt!13661 () BitStream!468)

(assert (=> d!2768 (= res!9478 (= (bvadd lt!13662 (bvsub lt!13063 lt!13061)) (bitIndex!0 (size!245 (buf!581 lt!13661)) (currentByte!1620 lt!13661) (currentBit!1615 lt!13661))))))

(assert (=> d!2768 (or (not (= (bvand lt!13662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13063 lt!13061) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!13662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!13662 (bvsub lt!13063 lt!13061)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2768 (= lt!13662 (bitIndex!0 (size!245 (buf!581 (_2!613 lt!13050))) (currentByte!1620 (_2!613 lt!13050)) (currentBit!1615 (_2!613 lt!13050))))))

(declare-fun moveBitIndex!0 (BitStream!468 (_ BitVec 64)) tuple2!1162)

(assert (=> d!2768 (= lt!13661 (_2!612 (moveBitIndex!0 (_2!613 lt!13050) (bvsub lt!13063 lt!13061))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!468 (_ BitVec 64)) Bool)

(assert (=> d!2768 (moveBitIndexPrecond!0 (_2!613 lt!13050) (bvsub lt!13063 lt!13061))))

(assert (=> d!2768 (= (withMovedBitIndex!0 (_2!613 lt!13050) (bvsub lt!13063 lt!13061)) lt!13661)))

(declare-fun b!9121 () Bool)

(assert (=> b!9121 (= e!5634 (= (size!245 (buf!581 (_2!613 lt!13050))) (size!245 (buf!581 lt!13661))))))

(assert (= (and d!2768 res!9478) b!9121))

(declare-fun m!12783 () Bool)

(assert (=> d!2768 m!12783))

(assert (=> d!2768 m!12627))

(declare-fun m!12785 () Bool)

(assert (=> d!2768 m!12785))

(declare-fun m!12787 () Bool)

(assert (=> d!2768 m!12787))

(assert (=> b!8801 d!2768))

(assert (=> b!8801 d!2564))

(assert (=> b!8801 d!2574))

(declare-fun b!9122 () Bool)

(declare-fun lt!13678 () (_ BitVec 64))

(declare-fun lt!13680 () (_ BitVec 64))

(declare-fun lt!13667 () tuple2!1164)

(declare-fun e!5636 () Bool)

(assert (=> b!9122 (= e!5636 (= (_1!613 lt!13667) (withMovedBitIndex!0 (_2!613 lt!13667) (bvsub lt!13680 lt!13678))))))

(assert (=> b!9122 (or (= (bvand lt!13680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13680 lt!13678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9122 (= lt!13678 (bitIndex!0 (size!245 (buf!581 (ite c!480 (_2!612 lt!12816) thiss!1486))) (currentByte!1620 (ite c!480 (_2!612 lt!12816) thiss!1486)) (currentBit!1615 (ite c!480 (_2!612 lt!12816) thiss!1486))))))

(assert (=> b!9122 (= lt!13680 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(declare-fun d!2770 () Bool)

(assert (=> d!2770 e!5636))

(declare-fun res!9479 () Bool)

(assert (=> d!2770 (=> (not res!9479) (not e!5636))))

(assert (=> d!2770 (= res!9479 (isPrefixOf!0 (_1!613 lt!13667) (_2!613 lt!13667)))))

(declare-fun lt!13663 () BitStream!468)

(assert (=> d!2770 (= lt!13667 (tuple2!1165 lt!13663 (ite c!480 (_2!612 lt!12816) thiss!1486)))))

(declare-fun lt!13671 () Unit!744)

(declare-fun lt!13672 () Unit!744)

(assert (=> d!2770 (= lt!13671 lt!13672)))

(assert (=> d!2770 (isPrefixOf!0 lt!13663 (ite c!480 (_2!612 lt!12816) thiss!1486))))

(assert (=> d!2770 (= lt!13672 (lemmaIsPrefixTransitive!0 lt!13663 (ite c!480 (_2!612 lt!12816) thiss!1486) (ite c!480 (_2!612 lt!12816) thiss!1486)))))

(declare-fun lt!13679 () Unit!744)

(declare-fun lt!13673 () Unit!744)

(assert (=> d!2770 (= lt!13679 lt!13673)))

(assert (=> d!2770 (isPrefixOf!0 lt!13663 (ite c!480 (_2!612 lt!12816) thiss!1486))))

(assert (=> d!2770 (= lt!13673 (lemmaIsPrefixTransitive!0 lt!13663 thiss!1486 (ite c!480 (_2!612 lt!12816) thiss!1486)))))

(declare-fun lt!13675 () Unit!744)

(declare-fun e!5635 () Unit!744)

(assert (=> d!2770 (= lt!13675 e!5635)))

(declare-fun c!549 () Bool)

(assert (=> d!2770 (= c!549 (not (= (size!245 (buf!581 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!13681 () Unit!744)

(declare-fun lt!13666 () Unit!744)

(assert (=> d!2770 (= lt!13681 lt!13666)))

(assert (=> d!2770 (isPrefixOf!0 (ite c!480 (_2!612 lt!12816) thiss!1486) (ite c!480 (_2!612 lt!12816) thiss!1486))))

(assert (=> d!2770 (= lt!13666 (lemmaIsPrefixRefl!0 (ite c!480 (_2!612 lt!12816) thiss!1486)))))

(declare-fun lt!13676 () Unit!744)

(declare-fun lt!13665 () Unit!744)

(assert (=> d!2770 (= lt!13676 lt!13665)))

(assert (=> d!2770 (= lt!13665 (lemmaIsPrefixRefl!0 (ite c!480 (_2!612 lt!12816) thiss!1486)))))

(declare-fun lt!13670 () Unit!744)

(declare-fun lt!13668 () Unit!744)

(assert (=> d!2770 (= lt!13670 lt!13668)))

(assert (=> d!2770 (isPrefixOf!0 lt!13663 lt!13663)))

(assert (=> d!2770 (= lt!13668 (lemmaIsPrefixRefl!0 lt!13663))))

(declare-fun lt!13674 () Unit!744)

(declare-fun lt!13682 () Unit!744)

(assert (=> d!2770 (= lt!13674 lt!13682)))

(assert (=> d!2770 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2770 (= lt!13682 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2770 (= lt!13663 (BitStream!469 (buf!581 (ite c!480 (_2!612 lt!12816) thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(assert (=> d!2770 (isPrefixOf!0 thiss!1486 (ite c!480 (_2!612 lt!12816) thiss!1486))))

(assert (=> d!2770 (= (reader!0 thiss!1486 (ite c!480 (_2!612 lt!12816) thiss!1486)) lt!13667)))

(declare-fun b!9123 () Bool)

(declare-fun lt!13669 () Unit!744)

(assert (=> b!9123 (= e!5635 lt!13669)))

(declare-fun lt!13677 () (_ BitVec 64))

(assert (=> b!9123 (= lt!13677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13664 () (_ BitVec 64))

(assert (=> b!9123 (= lt!13664 (bitIndex!0 (size!245 (buf!581 thiss!1486)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486)))))

(assert (=> b!9123 (= lt!13669 (arrayBitRangesEqSymmetric!0 (buf!581 thiss!1486) (buf!581 (ite c!480 (_2!612 lt!12816) thiss!1486)) lt!13677 lt!13664))))

(assert (=> b!9123 (arrayBitRangesEq!0 (buf!581 (ite c!480 (_2!612 lt!12816) thiss!1486)) (buf!581 thiss!1486) lt!13677 lt!13664)))

(declare-fun b!9124 () Bool)

(declare-fun res!9481 () Bool)

(assert (=> b!9124 (=> (not res!9481) (not e!5636))))

(assert (=> b!9124 (= res!9481 (isPrefixOf!0 (_1!613 lt!13667) thiss!1486))))

(declare-fun b!9125 () Bool)

(declare-fun Unit!786 () Unit!744)

(assert (=> b!9125 (= e!5635 Unit!786)))

(declare-fun b!9126 () Bool)

(declare-fun res!9480 () Bool)

(assert (=> b!9126 (=> (not res!9480) (not e!5636))))

(assert (=> b!9126 (= res!9480 (isPrefixOf!0 (_2!613 lt!13667) (ite c!480 (_2!612 lt!12816) thiss!1486)))))

(assert (= (and d!2770 c!549) b!9123))

(assert (= (and d!2770 (not c!549)) b!9125))

(assert (= (and d!2770 res!9479) b!9124))

(assert (= (and b!9124 res!9481) b!9126))

(assert (= (and b!9126 res!9480) b!9122))

(declare-fun m!12789 () Bool)

(assert (=> b!9122 m!12789))

(declare-fun m!12791 () Bool)

(assert (=> b!9122 m!12791))

(assert (=> b!9122 m!11833))

(assert (=> d!2770 m!11873))

(declare-fun m!12793 () Bool)

(assert (=> d!2770 m!12793))

(declare-fun m!12795 () Bool)

(assert (=> d!2770 m!12795))

(assert (=> d!2770 m!11875))

(declare-fun m!12797 () Bool)

(assert (=> d!2770 m!12797))

(declare-fun m!12799 () Bool)

(assert (=> d!2770 m!12799))

(declare-fun m!12801 () Bool)

(assert (=> d!2770 m!12801))

(declare-fun m!12803 () Bool)

(assert (=> d!2770 m!12803))

(declare-fun m!12805 () Bool)

(assert (=> d!2770 m!12805))

(declare-fun m!12807 () Bool)

(assert (=> d!2770 m!12807))

(declare-fun m!12809 () Bool)

(assert (=> d!2770 m!12809))

(declare-fun m!12811 () Bool)

(assert (=> b!9124 m!12811))

(declare-fun m!12813 () Bool)

(assert (=> b!9126 m!12813))

(assert (=> b!9123 m!11833))

(declare-fun m!12815 () Bool)

(assert (=> b!9123 m!12815))

(declare-fun m!12817 () Bool)

(assert (=> b!9123 m!12817))

(assert (=> bm!132 d!2770))

(declare-fun d!2772 () Bool)

(assert (=> d!2772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) lt!12811) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 thiss!1486))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486))) lt!12811))))

(declare-fun bs!881 () Bool)

(assert (= bs!881 d!2772))

(assert (=> bs!881 m!12049))

(assert (=> b!8718 d!2772))

(declare-fun d!2774 () Bool)

(declare-fun e!5637 () Bool)

(assert (=> d!2774 e!5637))

(declare-fun res!9483 () Bool)

(assert (=> d!2774 (=> (not res!9483) (not e!5637))))

(declare-fun lt!13684 () (_ BitVec 64))

(declare-fun lt!13686 () (_ BitVec 64))

(declare-fun lt!13685 () (_ BitVec 64))

(assert (=> d!2774 (= res!9483 (= lt!13685 (bvsub lt!13684 lt!13686)))))

(assert (=> d!2774 (or (= (bvand lt!13684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!13686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!13684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!13684 lt!13686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2774 (= lt!13686 (remainingBits!0 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12805)))) ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12805))) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12805)))))))

(declare-fun lt!13687 () (_ BitVec 64))

(declare-fun lt!13688 () (_ BitVec 64))

(assert (=> d!2774 (= lt!13684 (bvmul lt!13687 lt!13688))))

(assert (=> d!2774 (or (= lt!13687 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!13688 (bvsdiv (bvmul lt!13687 lt!13688) lt!13687)))))

(assert (=> d!2774 (= lt!13688 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2774 (= lt!13687 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12805)))))))

(assert (=> d!2774 (= lt!13685 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1620 (_2!612 lt!12805))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1615 (_2!612 lt!12805)))))))

(assert (=> d!2774 (invariant!0 (currentBit!1615 (_2!612 lt!12805)) (currentByte!1620 (_2!612 lt!12805)) (size!245 (buf!581 (_2!612 lt!12805))))))

(assert (=> d!2774 (= (bitIndex!0 (size!245 (buf!581 (_2!612 lt!12805))) (currentByte!1620 (_2!612 lt!12805)) (currentBit!1615 (_2!612 lt!12805))) lt!13685)))

(declare-fun b!9127 () Bool)

(declare-fun res!9482 () Bool)

(assert (=> b!9127 (=> (not res!9482) (not e!5637))))

(assert (=> b!9127 (= res!9482 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!13685))))

(declare-fun b!9128 () Bool)

(declare-fun lt!13683 () (_ BitVec 64))

(assert (=> b!9128 (= e!5637 (bvsle lt!13685 (bvmul lt!13683 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9128 (or (= lt!13683 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!13683 #b0000000000000000000000000000000000000000000000000000000000001000) lt!13683)))))

(assert (=> b!9128 (= lt!13683 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12805)))))))

(assert (= (and d!2774 res!9483) b!9127))

(assert (= (and b!9127 res!9482) b!9128))

(declare-fun m!12819 () Bool)

(assert (=> d!2774 m!12819))

(assert (=> d!2774 m!11881))

(assert (=> d!2556 d!2774))

(assert (=> d!2556 d!2574))

(assert (=> d!2556 d!2720))

(assert (=> d!2556 d!2726))

(declare-fun d!2776 () Bool)

(declare-fun c!550 () Bool)

(assert (=> d!2776 (= c!550 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5638 () List!142)

(assert (=> d!2776 (= (byteArrayBitContentToList!0 (_2!612 lt!12518) (_1!614 (readBits!0 (_1!613 lt!12517) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!5638)))

(declare-fun b!9129 () Bool)

(assert (=> b!9129 (= e!5638 Nil!139)))

(declare-fun b!9130 () Bool)

(assert (=> b!9130 (= e!5638 (Cons!138 (not (= (bvand ((_ sign_extend 24) (select (arr!650 (_1!614 (readBits!0 (_1!613 lt!12517) nBits!460))) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!612 lt!12518) (_1!614 (readBits!0 (_1!613 lt!12517) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2776 c!550) b!9129))

(assert (= (and d!2776 (not c!550)) b!9130))

(declare-fun m!12821 () Bool)

(assert (=> b!9130 m!12821))

(declare-fun m!12823 () Bool)

(assert (=> b!9130 m!12823))

(declare-fun m!12825 () Bool)

(assert (=> b!9130 m!12825))

(assert (=> b!8764 d!2776))

(assert (=> d!2588 d!2592))

(declare-fun d!2778 () Bool)

(assert (=> d!2778 (validate_offset_bits!1 ((_ sign_extend 32) (size!245 (buf!581 (_2!612 lt!12518)))) ((_ sign_extend 32) (currentByte!1620 thiss!1486)) ((_ sign_extend 32) (currentBit!1615 thiss!1486)) nBits!460)))

(assert (=> d!2778 true))

(declare-fun _$6!159 () Unit!744)

(assert (=> d!2778 (= (choose!9 thiss!1486 (buf!581 (_2!612 lt!12518)) nBits!460 (BitStream!469 (buf!581 (_2!612 lt!12518)) (currentByte!1620 thiss!1486) (currentBit!1615 thiss!1486))) _$6!159)))

(declare-fun bs!882 () Bool)

(assert (= bs!882 d!2778))

(assert (=> bs!882 m!11819))

(assert (=> d!2588 d!2778))

(check-sat (not b!9058) (not b!8938) (not b!8965) (not b!9000) (not b!8994) (not b!9045) (not b!9081) (not b!8970) (not b!8934) (not b!9075) (not b!8996) (not b!9054) (not b!9116) (not b!9109) (not b!8936) (not d!2658) (not bm!138) (not d!2768) (not b!8968) (not b!8989) (not d!2706) (not d!2650) (not b!8954) (not b!8927) (not d!2744) (not b!8926) (not b!9016) (not b!9043) (not b!9067) (not b!9057) (not b!9118) (not b!9102) (not b!8951) (not d!2678) (not d!2738) (not b!9044) (not b!9100) (not d!2644) (not d!2698) (not b!8955) (not d!2682) (not d!2772) (not b!9074) (not d!2642) (not bm!135) (not d!2732) (not d!2672) (not b!9108) (not d!2778) (not b!9055) (not b!9111) (not b!9041) (not d!2756) (not b!8998) (not b!8925) (not b!9126) (not b!8942) (not b!9106) (not d!2666) (not d!2640) (not b!9076) (not d!2700) (not b!9051) (not b!8958) (not bm!143) (not d!2736) (not b!8963) (not b!9014) (not b!8937) (not b!8992) (not d!2770) (not d!2734) (not b!9107) (not b!8988) (not b!9035) (not b!9068) (not b!8991) (not b!9038) (not b!9052) (not b!9007) (not b!8928) (not b!9114) (not b!8959) (not b!8960) (not b!9063) (not d!2696) (not b!9077) (not b!8946) (not d!2638) (not b!9104) (not b!8990) (not d!2762) (not d!2726) (not b!9070) (not b!9046) (not b!8953) (not d!2758) (not b!8966) (not bm!144) (not d!2664) (not b!8995) (not b!8957) (not b!9033) (not d!2752) (not b!9048) (not d!2680) (not b!9060) (not d!2646) (not b!8961) (not d!2740) (not d!2694) (not d!2774) (not b!9124) (not b!9062) (not b!8997) (not b!8945) (not b!8930) (not b!9015) (not b!8940) (not b!8941) (not b!9079) (not b!9005) (not b!8993) (not b!8944) (not d!2760) (not b!9013) (not d!2692) (not b!9072) (not bm!145) (not b!9049) (not d!2676) (not b!9064) (not b!9073) (not b!9122) (not b!9130) (not b!9123))
(check-sat)
