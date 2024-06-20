; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22960 () Bool)

(assert start!22960)

(declare-fun b!116018 () Bool)

(declare-fun e!76011 () Bool)

(declare-fun e!76010 () Bool)

(assert (=> b!116018 (= e!76011 e!76010)))

(declare-fun res!95894 () Bool)

(assert (=> b!116018 (=> (not res!95894) (not e!76010))))

(declare-datatypes ((array!5224 0))(
  ( (array!5225 (arr!2962 (Array (_ BitVec 32) (_ BitVec 8))) (size!2369 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4212 0))(
  ( (BitStream!4213 (buf!2779 array!5224) (currentByte!5416 (_ BitVec 32)) (currentBit!5411 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4212)

(declare-fun lt!177393 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116018 (= res!95894 (validate_offset_bits!1 ((_ sign_extend 32) (size!2369 (buf!2779 thiss!1305))) ((_ sign_extend 32) (currentByte!5416 thiss!1305)) ((_ sign_extend 32) (currentBit!5411 thiss!1305)) lt!177393))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116018 (= lt!177393 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116019 () Bool)

(declare-fun res!95893 () Bool)

(declare-fun e!76015 () Bool)

(assert (=> b!116019 (=> (not res!95893) (not e!76015))))

(declare-datatypes ((Unit!7143 0))(
  ( (Unit!7144) )
))
(declare-datatypes ((tuple2!9562 0))(
  ( (tuple2!9563 (_1!5046 Unit!7143) (_2!5046 BitStream!4212)) )
))
(declare-fun lt!177383 () tuple2!9562)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116019 (= res!95893 (invariant!0 (currentBit!5411 thiss!1305) (currentByte!5416 thiss!1305) (size!2369 (buf!2779 (_2!5046 lt!177383)))))))

(declare-fun b!116020 () Bool)

(declare-fun e!76009 () Bool)

(declare-fun e!76016 () Bool)

(assert (=> b!116020 (= e!76009 e!76016)))

(declare-fun res!95890 () Bool)

(assert (=> b!116020 (=> (not res!95890) (not e!76016))))

(declare-fun lt!177384 () (_ BitVec 64))

(declare-fun lt!177380 () (_ BitVec 64))

(assert (=> b!116020 (= res!95890 (= lt!177384 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177380)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116020 (= lt!177384 (bitIndex!0 (size!2369 (buf!2779 (_2!5046 lt!177383))) (currentByte!5416 (_2!5046 lt!177383)) (currentBit!5411 (_2!5046 lt!177383))))))

(assert (=> b!116020 (= lt!177380 (bitIndex!0 (size!2369 (buf!2779 thiss!1305)) (currentByte!5416 thiss!1305) (currentBit!5411 thiss!1305)))))

(declare-fun b!116021 () Bool)

(declare-fun e!76013 () Bool)

(declare-datatypes ((tuple2!9564 0))(
  ( (tuple2!9565 (_1!5047 BitStream!4212) (_2!5047 Bool)) )
))
(declare-fun lt!177382 () tuple2!9564)

(declare-fun lt!177386 () tuple2!9564)

(assert (=> b!116021 (= e!76013 (= (_2!5047 lt!177382) (_2!5047 lt!177386)))))

(declare-fun b!116022 () Bool)

(declare-fun res!95888 () Bool)

(assert (=> b!116022 (=> (not res!95888) (not e!76010))))

(assert (=> b!116022 (= res!95888 (bvslt i!615 nBits!396))))

(declare-fun b!116023 () Bool)

(declare-fun e!76017 () Bool)

(declare-fun lt!177391 () tuple2!9564)

(assert (=> b!116023 (= e!76017 (= (bitIndex!0 (size!2369 (buf!2779 (_1!5047 lt!177391))) (currentByte!5416 (_1!5047 lt!177391)) (currentBit!5411 (_1!5047 lt!177391))) lt!177384))))

(declare-fun b!116024 () Bool)

(declare-fun res!95889 () Bool)

(assert (=> b!116024 (=> (not res!95889) (not e!76010))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116024 (= res!95889 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!95886 () Bool)

(assert (=> start!22960 (=> (not res!95886) (not e!76011))))

(assert (=> start!22960 (= res!95886 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22960 e!76011))

(assert (=> start!22960 true))

(declare-fun e!76012 () Bool)

(declare-fun inv!12 (BitStream!4212) Bool)

(assert (=> start!22960 (and (inv!12 thiss!1305) e!76012)))

(declare-fun b!116025 () Bool)

(declare-fun lt!177388 () tuple2!9562)

(assert (=> b!116025 (= e!76015 (invariant!0 (currentBit!5411 thiss!1305) (currentByte!5416 thiss!1305) (size!2369 (buf!2779 (_2!5046 lt!177388)))))))

(declare-fun b!116026 () Bool)

(declare-fun array_inv!2171 (array!5224) Bool)

(assert (=> b!116026 (= e!76012 (array_inv!2171 (buf!2779 thiss!1305)))))

(declare-fun b!116027 () Bool)

(declare-fun res!95895 () Bool)

(assert (=> b!116027 (=> (not res!95895) (not e!76016))))

(declare-fun isPrefixOf!0 (BitStream!4212 BitStream!4212) Bool)

(assert (=> b!116027 (= res!95895 (isPrefixOf!0 thiss!1305 (_2!5046 lt!177383)))))

(declare-fun b!116028 () Bool)

(assert (=> b!116028 (= e!76016 e!76017)))

(declare-fun res!95887 () Bool)

(assert (=> b!116028 (=> (not res!95887) (not e!76017))))

(declare-fun lt!177381 () Bool)

(assert (=> b!116028 (= res!95887 (and (= (_2!5047 lt!177391) lt!177381) (= (_1!5047 lt!177391) (_2!5046 lt!177383))))))

(declare-fun readBitPure!0 (BitStream!4212) tuple2!9564)

(declare-fun readerFrom!0 (BitStream!4212 (_ BitVec 32) (_ BitVec 32)) BitStream!4212)

(assert (=> b!116028 (= lt!177391 (readBitPure!0 (readerFrom!0 (_2!5046 lt!177383) (currentBit!5411 thiss!1305) (currentByte!5416 thiss!1305))))))

(declare-fun b!116029 () Bool)

(assert (=> b!116029 (= e!76010 (not (or (not (= (size!2369 (buf!2779 thiss!1305)) (size!2369 (buf!2779 (_2!5046 lt!177388))))) (bvsge lt!177393 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9566 0))(
  ( (tuple2!9567 (_1!5048 BitStream!4212) (_2!5048 BitStream!4212)) )
))
(declare-fun lt!177385 () tuple2!9566)

(assert (=> b!116029 (= (_2!5047 (readBitPure!0 (_1!5048 lt!177385))) lt!177381)))

(declare-fun lt!177389 () tuple2!9566)

(declare-fun reader!0 (BitStream!4212 BitStream!4212) tuple2!9566)

(assert (=> b!116029 (= lt!177389 (reader!0 (_2!5046 lt!177383) (_2!5046 lt!177388)))))

(assert (=> b!116029 (= lt!177385 (reader!0 thiss!1305 (_2!5046 lt!177388)))))

(assert (=> b!116029 e!76013))

(declare-fun res!95885 () Bool)

(assert (=> b!116029 (=> (not res!95885) (not e!76013))))

(assert (=> b!116029 (= res!95885 (= (bitIndex!0 (size!2369 (buf!2779 (_1!5047 lt!177382))) (currentByte!5416 (_1!5047 lt!177382)) (currentBit!5411 (_1!5047 lt!177382))) (bitIndex!0 (size!2369 (buf!2779 (_1!5047 lt!177386))) (currentByte!5416 (_1!5047 lt!177386)) (currentBit!5411 (_1!5047 lt!177386)))))))

(declare-fun lt!177387 () Unit!7143)

(declare-fun lt!177390 () BitStream!4212)

(declare-fun readBitPrefixLemma!0 (BitStream!4212 BitStream!4212) Unit!7143)

(assert (=> b!116029 (= lt!177387 (readBitPrefixLemma!0 lt!177390 (_2!5046 lt!177388)))))

(assert (=> b!116029 (= lt!177386 (readBitPure!0 (BitStream!4213 (buf!2779 (_2!5046 lt!177388)) (currentByte!5416 thiss!1305) (currentBit!5411 thiss!1305))))))

(assert (=> b!116029 (= lt!177382 (readBitPure!0 lt!177390))))

(assert (=> b!116029 (= lt!177390 (BitStream!4213 (buf!2779 (_2!5046 lt!177383)) (currentByte!5416 thiss!1305) (currentBit!5411 thiss!1305)))))

(assert (=> b!116029 e!76015))

(declare-fun res!95892 () Bool)

(assert (=> b!116029 (=> (not res!95892) (not e!76015))))

(assert (=> b!116029 (= res!95892 (isPrefixOf!0 thiss!1305 (_2!5046 lt!177388)))))

(declare-fun lt!177392 () Unit!7143)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4212 BitStream!4212 BitStream!4212) Unit!7143)

(assert (=> b!116029 (= lt!177392 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5046 lt!177383) (_2!5046 lt!177388)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4212 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9562)

(assert (=> b!116029 (= lt!177388 (appendNLeastSignificantBitsLoop!0 (_2!5046 lt!177383) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116029 e!76009))

(declare-fun res!95891 () Bool)

(assert (=> b!116029 (=> (not res!95891) (not e!76009))))

(assert (=> b!116029 (= res!95891 (= (size!2369 (buf!2779 thiss!1305)) (size!2369 (buf!2779 (_2!5046 lt!177383)))))))

(declare-fun appendBit!0 (BitStream!4212 Bool) tuple2!9562)

(assert (=> b!116029 (= lt!177383 (appendBit!0 thiss!1305 lt!177381))))

(assert (=> b!116029 (= lt!177381 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!22960 res!95886) b!116018))

(assert (= (and b!116018 res!95894) b!116024))

(assert (= (and b!116024 res!95889) b!116022))

(assert (= (and b!116022 res!95888) b!116029))

(assert (= (and b!116029 res!95891) b!116020))

(assert (= (and b!116020 res!95890) b!116027))

(assert (= (and b!116027 res!95895) b!116028))

(assert (= (and b!116028 res!95887) b!116023))

(assert (= (and b!116029 res!95892) b!116019))

(assert (= (and b!116019 res!95893) b!116025))

(assert (= (and b!116029 res!95885) b!116021))

(assert (= start!22960 b!116026))

(declare-fun m!173747 () Bool)

(assert (=> b!116025 m!173747))

(declare-fun m!173749 () Bool)

(assert (=> b!116027 m!173749))

(declare-fun m!173751 () Bool)

(assert (=> b!116018 m!173751))

(declare-fun m!173753 () Bool)

(assert (=> start!22960 m!173753))

(declare-fun m!173755 () Bool)

(assert (=> b!116024 m!173755))

(declare-fun m!173757 () Bool)

(assert (=> b!116026 m!173757))

(declare-fun m!173759 () Bool)

(assert (=> b!116028 m!173759))

(assert (=> b!116028 m!173759))

(declare-fun m!173761 () Bool)

(assert (=> b!116028 m!173761))

(declare-fun m!173763 () Bool)

(assert (=> b!116029 m!173763))

(declare-fun m!173765 () Bool)

(assert (=> b!116029 m!173765))

(declare-fun m!173767 () Bool)

(assert (=> b!116029 m!173767))

(declare-fun m!173769 () Bool)

(assert (=> b!116029 m!173769))

(declare-fun m!173771 () Bool)

(assert (=> b!116029 m!173771))

(declare-fun m!173773 () Bool)

(assert (=> b!116029 m!173773))

(declare-fun m!173775 () Bool)

(assert (=> b!116029 m!173775))

(declare-fun m!173777 () Bool)

(assert (=> b!116029 m!173777))

(declare-fun m!173779 () Bool)

(assert (=> b!116029 m!173779))

(declare-fun m!173781 () Bool)

(assert (=> b!116029 m!173781))

(declare-fun m!173783 () Bool)

(assert (=> b!116029 m!173783))

(declare-fun m!173785 () Bool)

(assert (=> b!116029 m!173785))

(declare-fun m!173787 () Bool)

(assert (=> b!116019 m!173787))

(declare-fun m!173789 () Bool)

(assert (=> b!116020 m!173789))

(declare-fun m!173791 () Bool)

(assert (=> b!116020 m!173791))

(declare-fun m!173793 () Bool)

(assert (=> b!116023 m!173793))

(check-sat (not b!116027) (not b!116024) (not b!116025) (not b!116019) (not b!116028) (not b!116023) (not start!22960) (not b!116020) (not b!116026) (not b!116018) (not b!116029))
(check-sat)
