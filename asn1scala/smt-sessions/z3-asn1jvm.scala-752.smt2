; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21600 () Bool)

(assert start!21600)

(declare-fun b!108834 () Bool)

(declare-fun res!89751 () Bool)

(declare-fun e!71263 () Bool)

(assert (=> b!108834 (=> (not res!89751) (not e!71263))))

(declare-datatypes ((array!4963 0))(
  ( (array!4964 (arr!2851 (Array (_ BitVec 32) (_ BitVec 8))) (size!2258 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3990 0))(
  ( (BitStream!3991 (buf!2649 array!4963) (currentByte!5185 (_ BitVec 32)) (currentBit!5180 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3990)

(declare-datatypes ((Unit!6657 0))(
  ( (Unit!6658) )
))
(declare-datatypes ((tuple2!8996 0))(
  ( (tuple2!8997 (_1!4755 Unit!6657) (_2!4755 BitStream!3990)) )
))
(declare-fun lt!164223 () tuple2!8996)

(declare-fun isPrefixOf!0 (BitStream!3990 BitStream!3990) Bool)

(assert (=> b!108834 (= res!89751 (isPrefixOf!0 thiss!1305 (_2!4755 lt!164223)))))

(declare-fun b!108835 () Bool)

(declare-fun lt!164236 () (_ BitVec 64))

(declare-datatypes ((tuple2!8998 0))(
  ( (tuple2!8999 (_1!4756 BitStream!3990) (_2!4756 (_ BitVec 64))) )
))
(declare-fun lt!164237 () tuple2!8998)

(declare-fun lt!164222 () tuple2!8998)

(declare-datatypes ((tuple2!9000 0))(
  ( (tuple2!9001 (_1!4757 BitStream!3990) (_2!4757 BitStream!3990)) )
))
(declare-fun lt!164224 () tuple2!9000)

(declare-fun lt!164233 () BitStream!3990)

(declare-fun e!71267 () Bool)

(declare-fun lt!164234 () (_ BitVec 64))

(declare-fun lt!164226 () tuple2!9000)

(assert (=> b!108835 (= e!71267 (and (= lt!164234 (bvsub lt!164236 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4757 lt!164224) lt!164233)) (and (= (_2!4756 lt!164237) (_2!4756 lt!164222)) (= (_1!4756 lt!164237) (_2!4757 lt!164226))))))))

(declare-fun b!108836 () Bool)

(declare-fun e!71266 () Bool)

(declare-fun e!71264 () Bool)

(assert (=> b!108836 (= e!71266 e!71264)))

(declare-fun res!89754 () Bool)

(assert (=> b!108836 (=> (not res!89754) (not e!71264))))

(declare-fun lt!164212 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108836 (= res!89754 (validate_offset_bits!1 ((_ sign_extend 32) (size!2258 (buf!2649 thiss!1305))) ((_ sign_extend 32) (currentByte!5185 thiss!1305)) ((_ sign_extend 32) (currentBit!5180 thiss!1305)) lt!164212))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!108836 (= lt!164212 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108837 () Bool)

(declare-fun res!89758 () Bool)

(declare-fun e!71257 () Bool)

(assert (=> b!108837 (=> (not res!89758) (not e!71257))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108837 (= res!89758 (invariant!0 (currentBit!5180 thiss!1305) (currentByte!5185 thiss!1305) (size!2258 (buf!2649 (_2!4755 lt!164223)))))))

(declare-fun b!108839 () Bool)

(declare-fun res!89755 () Bool)

(assert (=> b!108839 (=> (not res!89755) (not e!71264))))

(assert (=> b!108839 (= res!89755 (bvslt i!615 nBits!396))))

(declare-fun b!108840 () Bool)

(declare-fun e!71261 () Bool)

(assert (=> b!108840 (= e!71261 true)))

(assert (=> b!108840 e!71267))

(declare-fun res!89750 () Bool)

(assert (=> b!108840 (=> (not res!89750) (not e!71267))))

(declare-fun lt!164232 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3990 (_ BitVec 64)) BitStream!3990)

(assert (=> b!108840 (= res!89750 (= (_1!4757 lt!164224) (withMovedBitIndex!0 (_2!4757 lt!164224) (bvsub lt!164236 lt!164232))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108840 (= lt!164236 (bitIndex!0 (size!2258 (buf!2649 (_2!4755 lt!164223))) (currentByte!5185 (_2!4755 lt!164223)) (currentBit!5180 (_2!4755 lt!164223))))))

(assert (=> b!108840 (= (_1!4757 lt!164226) (withMovedBitIndex!0 (_2!4757 lt!164226) (bvsub lt!164234 lt!164232)))))

(declare-fun lt!164220 () tuple2!8996)

(assert (=> b!108840 (= lt!164232 (bitIndex!0 (size!2258 (buf!2649 (_2!4755 lt!164220))) (currentByte!5185 (_2!4755 lt!164220)) (currentBit!5180 (_2!4755 lt!164220))))))

(assert (=> b!108840 (= lt!164234 (bitIndex!0 (size!2258 (buf!2649 thiss!1305)) (currentByte!5185 thiss!1305) (currentBit!5180 thiss!1305)))))

(declare-fun lt!164210 () tuple2!8998)

(assert (=> b!108840 (and (= (_2!4756 lt!164237) (_2!4756 lt!164210)) (= (_1!4756 lt!164237) (_1!4756 lt!164210)))))

(declare-fun lt!164228 () Unit!6657)

(declare-fun lt!164217 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6657)

(assert (=> b!108840 (= lt!164228 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4757 lt!164226) nBits!396 i!615 lt!164217))))

(declare-fun lt!164215 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8998)

(assert (=> b!108840 (= lt!164210 (readNLeastSignificantBitsLoopPure!0 lt!164233 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164215))))

(assert (=> b!108840 (= lt!164233 (withMovedBitIndex!0 (_1!4757 lt!164226) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108841 () Bool)

(declare-fun e!71265 () Bool)

(assert (=> b!108841 (= e!71263 e!71265)))

(declare-fun res!89747 () Bool)

(assert (=> b!108841 (=> (not res!89747) (not e!71265))))

(declare-fun lt!164216 () Bool)

(declare-datatypes ((tuple2!9002 0))(
  ( (tuple2!9003 (_1!4758 BitStream!3990) (_2!4758 Bool)) )
))
(declare-fun lt!164225 () tuple2!9002)

(assert (=> b!108841 (= res!89747 (and (= (_2!4758 lt!164225) lt!164216) (= (_1!4758 lt!164225) (_2!4755 lt!164223))))))

(declare-fun readBitPure!0 (BitStream!3990) tuple2!9002)

(declare-fun readerFrom!0 (BitStream!3990 (_ BitVec 32) (_ BitVec 32)) BitStream!3990)

(assert (=> b!108841 (= lt!164225 (readBitPure!0 (readerFrom!0 (_2!4755 lt!164223) (currentBit!5180 thiss!1305) (currentByte!5185 thiss!1305))))))

(declare-fun b!108842 () Bool)

(declare-fun e!71258 () Bool)

(declare-fun array_inv!2060 (array!4963) Bool)

(assert (=> b!108842 (= e!71258 (array_inv!2060 (buf!2649 thiss!1305)))))

(declare-fun b!108843 () Bool)

(declare-fun e!71260 () Bool)

(assert (=> b!108843 (= e!71260 e!71263)))

(declare-fun res!89752 () Bool)

(assert (=> b!108843 (=> (not res!89752) (not e!71263))))

(declare-fun lt!164213 () (_ BitVec 64))

(declare-fun lt!164235 () (_ BitVec 64))

(assert (=> b!108843 (= res!89752 (= lt!164213 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164235)))))

(assert (=> b!108843 (= lt!164213 (bitIndex!0 (size!2258 (buf!2649 (_2!4755 lt!164223))) (currentByte!5185 (_2!4755 lt!164223)) (currentBit!5180 (_2!4755 lt!164223))))))

(assert (=> b!108843 (= lt!164235 (bitIndex!0 (size!2258 (buf!2649 thiss!1305)) (currentByte!5185 thiss!1305) (currentBit!5180 thiss!1305)))))

(declare-fun b!108844 () Bool)

(assert (=> b!108844 (= e!71257 (invariant!0 (currentBit!5180 thiss!1305) (currentByte!5185 thiss!1305) (size!2258 (buf!2649 (_2!4755 lt!164220)))))))

(declare-fun b!108845 () Bool)

(assert (=> b!108845 (= e!71264 (not e!71261))))

(declare-fun res!89746 () Bool)

(assert (=> b!108845 (=> res!89746 e!71261)))

(assert (=> b!108845 (= res!89746 (not (= (_1!4756 lt!164222) (_2!4757 lt!164224))))))

(assert (=> b!108845 (= lt!164222 (readNLeastSignificantBitsLoopPure!0 (_1!4757 lt!164224) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164215))))

(declare-fun lt!164209 () (_ BitVec 64))

(assert (=> b!108845 (validate_offset_bits!1 ((_ sign_extend 32) (size!2258 (buf!2649 (_2!4755 lt!164220)))) ((_ sign_extend 32) (currentByte!5185 (_2!4755 lt!164223))) ((_ sign_extend 32) (currentBit!5180 (_2!4755 lt!164223))) lt!164209)))

(declare-fun lt!164214 () Unit!6657)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3990 array!4963 (_ BitVec 64)) Unit!6657)

(assert (=> b!108845 (= lt!164214 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4755 lt!164223) (buf!2649 (_2!4755 lt!164220)) lt!164209))))

(assert (=> b!108845 (= lt!164209 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164221 () (_ BitVec 64))

(declare-fun lt!164231 () tuple2!9002)

(assert (=> b!108845 (= lt!164215 (bvor lt!164217 (ite (_2!4758 lt!164231) lt!164221 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108845 (= lt!164237 (readNLeastSignificantBitsLoopPure!0 (_1!4757 lt!164226) nBits!396 i!615 lt!164217))))

(assert (=> b!108845 (validate_offset_bits!1 ((_ sign_extend 32) (size!2258 (buf!2649 (_2!4755 lt!164220)))) ((_ sign_extend 32) (currentByte!5185 thiss!1305)) ((_ sign_extend 32) (currentBit!5180 thiss!1305)) lt!164212)))

(declare-fun lt!164219 () Unit!6657)

(assert (=> b!108845 (= lt!164219 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2649 (_2!4755 lt!164220)) lt!164212))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108845 (= lt!164217 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!108845 (= (_2!4758 lt!164231) lt!164216)))

(assert (=> b!108845 (= lt!164231 (readBitPure!0 (_1!4757 lt!164226)))))

(declare-fun reader!0 (BitStream!3990 BitStream!3990) tuple2!9000)

(assert (=> b!108845 (= lt!164224 (reader!0 (_2!4755 lt!164223) (_2!4755 lt!164220)))))

(assert (=> b!108845 (= lt!164226 (reader!0 thiss!1305 (_2!4755 lt!164220)))))

(declare-fun e!71259 () Bool)

(assert (=> b!108845 e!71259))

(declare-fun res!89756 () Bool)

(assert (=> b!108845 (=> (not res!89756) (not e!71259))))

(declare-fun lt!164227 () tuple2!9002)

(declare-fun lt!164229 () tuple2!9002)

(assert (=> b!108845 (= res!89756 (= (bitIndex!0 (size!2258 (buf!2649 (_1!4758 lt!164227))) (currentByte!5185 (_1!4758 lt!164227)) (currentBit!5180 (_1!4758 lt!164227))) (bitIndex!0 (size!2258 (buf!2649 (_1!4758 lt!164229))) (currentByte!5185 (_1!4758 lt!164229)) (currentBit!5180 (_1!4758 lt!164229)))))))

(declare-fun lt!164211 () Unit!6657)

(declare-fun lt!164218 () BitStream!3990)

(declare-fun readBitPrefixLemma!0 (BitStream!3990 BitStream!3990) Unit!6657)

(assert (=> b!108845 (= lt!164211 (readBitPrefixLemma!0 lt!164218 (_2!4755 lt!164220)))))

(assert (=> b!108845 (= lt!164229 (readBitPure!0 (BitStream!3991 (buf!2649 (_2!4755 lt!164220)) (currentByte!5185 thiss!1305) (currentBit!5180 thiss!1305))))))

(assert (=> b!108845 (= lt!164227 (readBitPure!0 lt!164218))))

(assert (=> b!108845 (= lt!164218 (BitStream!3991 (buf!2649 (_2!4755 lt!164223)) (currentByte!5185 thiss!1305) (currentBit!5180 thiss!1305)))))

(assert (=> b!108845 e!71257))

(declare-fun res!89749 () Bool)

(assert (=> b!108845 (=> (not res!89749) (not e!71257))))

(assert (=> b!108845 (= res!89749 (isPrefixOf!0 thiss!1305 (_2!4755 lt!164220)))))

(declare-fun lt!164230 () Unit!6657)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3990 BitStream!3990 BitStream!3990) Unit!6657)

(assert (=> b!108845 (= lt!164230 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4755 lt!164223) (_2!4755 lt!164220)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3990 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8996)

(assert (=> b!108845 (= lt!164220 (appendNLeastSignificantBitsLoop!0 (_2!4755 lt!164223) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!108845 e!71260))

(declare-fun res!89753 () Bool)

(assert (=> b!108845 (=> (not res!89753) (not e!71260))))

(assert (=> b!108845 (= res!89753 (= (size!2258 (buf!2649 thiss!1305)) (size!2258 (buf!2649 (_2!4755 lt!164223)))))))

(declare-fun appendBit!0 (BitStream!3990 Bool) tuple2!8996)

(assert (=> b!108845 (= lt!164223 (appendBit!0 thiss!1305 lt!164216))))

(assert (=> b!108845 (= lt!164216 (not (= (bvand v!199 lt!164221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108845 (= lt!164221 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun res!89748 () Bool)

(assert (=> start!21600 (=> (not res!89748) (not e!71266))))

(assert (=> start!21600 (= res!89748 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21600 e!71266))

(assert (=> start!21600 true))

(declare-fun inv!12 (BitStream!3990) Bool)

(assert (=> start!21600 (and (inv!12 thiss!1305) e!71258)))

(declare-fun b!108838 () Bool)

(assert (=> b!108838 (= e!71259 (= (_2!4758 lt!164227) (_2!4758 lt!164229)))))

(declare-fun b!108846 () Bool)

(assert (=> b!108846 (= e!71265 (= (bitIndex!0 (size!2258 (buf!2649 (_1!4758 lt!164225))) (currentByte!5185 (_1!4758 lt!164225)) (currentBit!5180 (_1!4758 lt!164225))) lt!164213))))

(declare-fun b!108847 () Bool)

(declare-fun res!89757 () Bool)

(assert (=> b!108847 (=> (not res!89757) (not e!71264))))

(assert (=> b!108847 (= res!89757 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!21600 res!89748) b!108836))

(assert (= (and b!108836 res!89754) b!108847))

(assert (= (and b!108847 res!89757) b!108839))

(assert (= (and b!108839 res!89755) b!108845))

(assert (= (and b!108845 res!89753) b!108843))

(assert (= (and b!108843 res!89752) b!108834))

(assert (= (and b!108834 res!89751) b!108841))

(assert (= (and b!108841 res!89747) b!108846))

(assert (= (and b!108845 res!89749) b!108837))

(assert (= (and b!108837 res!89758) b!108844))

(assert (= (and b!108845 res!89756) b!108838))

(assert (= (and b!108845 (not res!89746)) b!108840))

(assert (= (and b!108840 res!89750) b!108835))

(assert (= start!21600 b!108842))

(declare-fun m!161395 () Bool)

(assert (=> b!108843 m!161395))

(declare-fun m!161397 () Bool)

(assert (=> b!108843 m!161397))

(declare-fun m!161399 () Bool)

(assert (=> b!108836 m!161399))

(declare-fun m!161401 () Bool)

(assert (=> b!108845 m!161401))

(declare-fun m!161403 () Bool)

(assert (=> b!108845 m!161403))

(declare-fun m!161405 () Bool)

(assert (=> b!108845 m!161405))

(declare-fun m!161407 () Bool)

(assert (=> b!108845 m!161407))

(declare-fun m!161409 () Bool)

(assert (=> b!108845 m!161409))

(declare-fun m!161411 () Bool)

(assert (=> b!108845 m!161411))

(declare-fun m!161413 () Bool)

(assert (=> b!108845 m!161413))

(declare-fun m!161415 () Bool)

(assert (=> b!108845 m!161415))

(declare-fun m!161417 () Bool)

(assert (=> b!108845 m!161417))

(declare-fun m!161419 () Bool)

(assert (=> b!108845 m!161419))

(declare-fun m!161421 () Bool)

(assert (=> b!108845 m!161421))

(declare-fun m!161423 () Bool)

(assert (=> b!108845 m!161423))

(declare-fun m!161425 () Bool)

(assert (=> b!108845 m!161425))

(declare-fun m!161427 () Bool)

(assert (=> b!108845 m!161427))

(declare-fun m!161429 () Bool)

(assert (=> b!108845 m!161429))

(declare-fun m!161431 () Bool)

(assert (=> b!108845 m!161431))

(declare-fun m!161433 () Bool)

(assert (=> b!108845 m!161433))

(declare-fun m!161435 () Bool)

(assert (=> b!108845 m!161435))

(declare-fun m!161437 () Bool)

(assert (=> b!108845 m!161437))

(declare-fun m!161439 () Bool)

(assert (=> b!108840 m!161439))

(assert (=> b!108840 m!161397))

(declare-fun m!161441 () Bool)

(assert (=> b!108840 m!161441))

(assert (=> b!108840 m!161395))

(declare-fun m!161443 () Bool)

(assert (=> b!108840 m!161443))

(declare-fun m!161445 () Bool)

(assert (=> b!108840 m!161445))

(declare-fun m!161447 () Bool)

(assert (=> b!108840 m!161447))

(declare-fun m!161449 () Bool)

(assert (=> b!108840 m!161449))

(declare-fun m!161451 () Bool)

(assert (=> b!108842 m!161451))

(declare-fun m!161453 () Bool)

(assert (=> b!108846 m!161453))

(declare-fun m!161455 () Bool)

(assert (=> b!108837 m!161455))

(declare-fun m!161457 () Bool)

(assert (=> b!108847 m!161457))

(declare-fun m!161459 () Bool)

(assert (=> start!21600 m!161459))

(declare-fun m!161461 () Bool)

(assert (=> b!108844 m!161461))

(declare-fun m!161463 () Bool)

(assert (=> b!108834 m!161463))

(declare-fun m!161465 () Bool)

(assert (=> b!108841 m!161465))

(assert (=> b!108841 m!161465))

(declare-fun m!161467 () Bool)

(assert (=> b!108841 m!161467))

(check-sat (not b!108834) (not b!108843) (not b!108840) (not b!108846) (not b!108841) (not start!21600) (not b!108836) (not b!108847) (not b!108845) (not b!108837) (not b!108842) (not b!108844))
