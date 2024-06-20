; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22970 () Bool)

(assert start!22970)

(declare-fun b!116198 () Bool)

(declare-fun res!96054 () Bool)

(declare-fun e!76135 () Bool)

(assert (=> b!116198 (=> (not res!96054) (not e!76135))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116198 (= res!96054 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116199 () Bool)

(declare-fun res!96055 () Bool)

(assert (=> b!116199 (=> (not res!96055) (not e!76135))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116199 (= res!96055 (bvslt i!615 nBits!396))))

(declare-fun b!116200 () Bool)

(declare-fun e!76140 () Bool)

(declare-datatypes ((array!5234 0))(
  ( (array!5235 (arr!2967 (Array (_ BitVec 32) (_ BitVec 8))) (size!2374 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4222 0))(
  ( (BitStream!4223 (buf!2784 array!5234) (currentByte!5421 (_ BitVec 32)) (currentBit!5416 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4222)

(declare-datatypes ((Unit!7153 0))(
  ( (Unit!7154) )
))
(declare-datatypes ((tuple2!9592 0))(
  ( (tuple2!9593 (_1!5061 Unit!7153) (_2!5061 BitStream!4222)) )
))
(declare-fun lt!177598 () tuple2!9592)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116200 (= e!76140 (invariant!0 (currentBit!5416 thiss!1305) (currentByte!5421 thiss!1305) (size!2374 (buf!2784 (_2!5061 lt!177598)))))))

(declare-fun b!116201 () Bool)

(declare-fun res!96050 () Bool)

(assert (=> b!116201 (=> (not res!96050) (not e!76140))))

(declare-fun lt!177595 () tuple2!9592)

(assert (=> b!116201 (= res!96050 (invariant!0 (currentBit!5416 thiss!1305) (currentByte!5421 thiss!1305) (size!2374 (buf!2784 (_2!5061 lt!177595)))))))

(declare-fun b!116202 () Bool)

(declare-fun e!76143 () Bool)

(declare-fun e!76141 () Bool)

(assert (=> b!116202 (= e!76143 e!76141)))

(declare-fun res!96053 () Bool)

(assert (=> b!116202 (=> (not res!96053) (not e!76141))))

(declare-fun lt!177601 () Bool)

(declare-datatypes ((tuple2!9594 0))(
  ( (tuple2!9595 (_1!5062 BitStream!4222) (_2!5062 Bool)) )
))
(declare-fun lt!177602 () tuple2!9594)

(assert (=> b!116202 (= res!96053 (and (= (_2!5062 lt!177602) lt!177601) (= (_1!5062 lt!177602) (_2!5061 lt!177595))))))

(declare-fun readBitPure!0 (BitStream!4222) tuple2!9594)

(declare-fun readerFrom!0 (BitStream!4222 (_ BitVec 32) (_ BitVec 32)) BitStream!4222)

(assert (=> b!116202 (= lt!177602 (readBitPure!0 (readerFrom!0 (_2!5061 lt!177595) (currentBit!5416 thiss!1305) (currentByte!5421 thiss!1305))))))

(declare-fun b!116203 () Bool)

(declare-fun lt!177593 () tuple2!9594)

(assert (=> b!116203 (= e!76135 (not (or (not (_2!5062 lt!177593)) (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!9596 0))(
  ( (tuple2!9597 (_1!5063 BitStream!4222) (_2!5063 (_ BitVec 64))) )
))
(declare-fun lt!177600 () tuple2!9596)

(declare-datatypes ((tuple2!9598 0))(
  ( (tuple2!9599 (_1!5064 BitStream!4222) (_2!5064 BitStream!4222)) )
))
(declare-fun lt!177589 () tuple2!9598)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9596)

(assert (=> b!116203 (= lt!177600 (readNLeastSignificantBitsLoopPure!0 (_1!5064 lt!177589) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!177596 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116203 (validate_offset_bits!1 ((_ sign_extend 32) (size!2374 (buf!2784 (_2!5061 lt!177598)))) ((_ sign_extend 32) (currentByte!5421 thiss!1305)) ((_ sign_extend 32) (currentBit!5416 thiss!1305)) lt!177596)))

(declare-fun lt!177594 () Unit!7153)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4222 array!5234 (_ BitVec 64)) Unit!7153)

(assert (=> b!116203 (= lt!177594 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2784 (_2!5061 lt!177598)) lt!177596))))

(assert (=> b!116203 (= (_2!5062 lt!177593) lt!177601)))

(assert (=> b!116203 (= lt!177593 (readBitPure!0 (_1!5064 lt!177589)))))

(declare-fun lt!177591 () tuple2!9598)

(declare-fun reader!0 (BitStream!4222 BitStream!4222) tuple2!9598)

(assert (=> b!116203 (= lt!177591 (reader!0 (_2!5061 lt!177595) (_2!5061 lt!177598)))))

(assert (=> b!116203 (= lt!177589 (reader!0 thiss!1305 (_2!5061 lt!177598)))))

(declare-fun e!76136 () Bool)

(assert (=> b!116203 e!76136))

(declare-fun res!96058 () Bool)

(assert (=> b!116203 (=> (not res!96058) (not e!76136))))

(declare-fun lt!177603 () tuple2!9594)

(declare-fun lt!177587 () tuple2!9594)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116203 (= res!96058 (= (bitIndex!0 (size!2374 (buf!2784 (_1!5062 lt!177603))) (currentByte!5421 (_1!5062 lt!177603)) (currentBit!5416 (_1!5062 lt!177603))) (bitIndex!0 (size!2374 (buf!2784 (_1!5062 lt!177587))) (currentByte!5421 (_1!5062 lt!177587)) (currentBit!5416 (_1!5062 lt!177587)))))))

(declare-fun lt!177592 () Unit!7153)

(declare-fun lt!177597 () BitStream!4222)

(declare-fun readBitPrefixLemma!0 (BitStream!4222 BitStream!4222) Unit!7153)

(assert (=> b!116203 (= lt!177592 (readBitPrefixLemma!0 lt!177597 (_2!5061 lt!177598)))))

(assert (=> b!116203 (= lt!177587 (readBitPure!0 (BitStream!4223 (buf!2784 (_2!5061 lt!177598)) (currentByte!5421 thiss!1305) (currentBit!5416 thiss!1305))))))

(assert (=> b!116203 (= lt!177603 (readBitPure!0 lt!177597))))

(assert (=> b!116203 (= lt!177597 (BitStream!4223 (buf!2784 (_2!5061 lt!177595)) (currentByte!5421 thiss!1305) (currentBit!5416 thiss!1305)))))

(assert (=> b!116203 e!76140))

(declare-fun res!96059 () Bool)

(assert (=> b!116203 (=> (not res!96059) (not e!76140))))

(declare-fun isPrefixOf!0 (BitStream!4222 BitStream!4222) Bool)

(assert (=> b!116203 (= res!96059 (isPrefixOf!0 thiss!1305 (_2!5061 lt!177598)))))

(declare-fun lt!177588 () Unit!7153)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4222 BitStream!4222 BitStream!4222) Unit!7153)

(assert (=> b!116203 (= lt!177588 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5061 lt!177595) (_2!5061 lt!177598)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4222 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9592)

(assert (=> b!116203 (= lt!177598 (appendNLeastSignificantBitsLoop!0 (_2!5061 lt!177595) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76142 () Bool)

(assert (=> b!116203 e!76142))

(declare-fun res!96052 () Bool)

(assert (=> b!116203 (=> (not res!96052) (not e!76142))))

(assert (=> b!116203 (= res!96052 (= (size!2374 (buf!2784 thiss!1305)) (size!2374 (buf!2784 (_2!5061 lt!177595)))))))

(declare-fun appendBit!0 (BitStream!4222 Bool) tuple2!9592)

(assert (=> b!116203 (= lt!177595 (appendBit!0 thiss!1305 lt!177601))))

(assert (=> b!116203 (= lt!177601 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116204 () Bool)

(declare-fun res!96051 () Bool)

(assert (=> b!116204 (=> (not res!96051) (not e!76143))))

(assert (=> b!116204 (= res!96051 (isPrefixOf!0 thiss!1305 (_2!5061 lt!177595)))))

(declare-fun b!116205 () Bool)

(declare-fun e!76137 () Bool)

(declare-fun array_inv!2176 (array!5234) Bool)

(assert (=> b!116205 (= e!76137 (array_inv!2176 (buf!2784 thiss!1305)))))

(declare-fun b!116206 () Bool)

(declare-fun lt!177599 () (_ BitVec 64))

(assert (=> b!116206 (= e!76141 (= (bitIndex!0 (size!2374 (buf!2784 (_1!5062 lt!177602))) (currentByte!5421 (_1!5062 lt!177602)) (currentBit!5416 (_1!5062 lt!177602))) lt!177599))))

(declare-fun res!96056 () Bool)

(declare-fun e!76138 () Bool)

(assert (=> start!22970 (=> (not res!96056) (not e!76138))))

(assert (=> start!22970 (= res!96056 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22970 e!76138))

(assert (=> start!22970 true))

(declare-fun inv!12 (BitStream!4222) Bool)

(assert (=> start!22970 (and (inv!12 thiss!1305) e!76137)))

(declare-fun b!116207 () Bool)

(assert (=> b!116207 (= e!76136 (= (_2!5062 lt!177603) (_2!5062 lt!177587)))))

(declare-fun b!116208 () Bool)

(assert (=> b!116208 (= e!76138 e!76135)))

(declare-fun res!96060 () Bool)

(assert (=> b!116208 (=> (not res!96060) (not e!76135))))

(assert (=> b!116208 (= res!96060 (validate_offset_bits!1 ((_ sign_extend 32) (size!2374 (buf!2784 thiss!1305))) ((_ sign_extend 32) (currentByte!5421 thiss!1305)) ((_ sign_extend 32) (currentBit!5416 thiss!1305)) lt!177596))))

(assert (=> b!116208 (= lt!177596 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116209 () Bool)

(assert (=> b!116209 (= e!76142 e!76143)))

(declare-fun res!96057 () Bool)

(assert (=> b!116209 (=> (not res!96057) (not e!76143))))

(declare-fun lt!177590 () (_ BitVec 64))

(assert (=> b!116209 (= res!96057 (= lt!177599 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177590)))))

(assert (=> b!116209 (= lt!177599 (bitIndex!0 (size!2374 (buf!2784 (_2!5061 lt!177595))) (currentByte!5421 (_2!5061 lt!177595)) (currentBit!5416 (_2!5061 lt!177595))))))

(assert (=> b!116209 (= lt!177590 (bitIndex!0 (size!2374 (buf!2784 thiss!1305)) (currentByte!5421 thiss!1305) (currentBit!5416 thiss!1305)))))

(assert (= (and start!22970 res!96056) b!116208))

(assert (= (and b!116208 res!96060) b!116198))

(assert (= (and b!116198 res!96054) b!116199))

(assert (= (and b!116199 res!96055) b!116203))

(assert (= (and b!116203 res!96052) b!116209))

(assert (= (and b!116209 res!96057) b!116204))

(assert (= (and b!116204 res!96051) b!116202))

(assert (= (and b!116202 res!96053) b!116206))

(assert (= (and b!116203 res!96059) b!116201))

(assert (= (and b!116201 res!96050) b!116200))

(assert (= (and b!116203 res!96058) b!116207))

(assert (= start!22970 b!116205))

(declare-fun m!173987 () Bool)

(assert (=> b!116206 m!173987))

(declare-fun m!173989 () Bool)

(assert (=> b!116208 m!173989))

(declare-fun m!173991 () Bool)

(assert (=> b!116198 m!173991))

(declare-fun m!173993 () Bool)

(assert (=> b!116203 m!173993))

(declare-fun m!173995 () Bool)

(assert (=> b!116203 m!173995))

(declare-fun m!173997 () Bool)

(assert (=> b!116203 m!173997))

(declare-fun m!173999 () Bool)

(assert (=> b!116203 m!173999))

(declare-fun m!174001 () Bool)

(assert (=> b!116203 m!174001))

(declare-fun m!174003 () Bool)

(assert (=> b!116203 m!174003))

(declare-fun m!174005 () Bool)

(assert (=> b!116203 m!174005))

(declare-fun m!174007 () Bool)

(assert (=> b!116203 m!174007))

(declare-fun m!174009 () Bool)

(assert (=> b!116203 m!174009))

(declare-fun m!174011 () Bool)

(assert (=> b!116203 m!174011))

(declare-fun m!174013 () Bool)

(assert (=> b!116203 m!174013))

(declare-fun m!174015 () Bool)

(assert (=> b!116203 m!174015))

(declare-fun m!174017 () Bool)

(assert (=> b!116203 m!174017))

(declare-fun m!174019 () Bool)

(assert (=> b!116203 m!174019))

(declare-fun m!174021 () Bool)

(assert (=> b!116203 m!174021))

(declare-fun m!174023 () Bool)

(assert (=> b!116203 m!174023))

(declare-fun m!174025 () Bool)

(assert (=> b!116201 m!174025))

(declare-fun m!174027 () Bool)

(assert (=> b!116205 m!174027))

(declare-fun m!174029 () Bool)

(assert (=> b!116204 m!174029))

(declare-fun m!174031 () Bool)

(assert (=> b!116209 m!174031))

(declare-fun m!174033 () Bool)

(assert (=> b!116209 m!174033))

(declare-fun m!174035 () Bool)

(assert (=> b!116200 m!174035))

(declare-fun m!174037 () Bool)

(assert (=> start!22970 m!174037))

(declare-fun m!174039 () Bool)

(assert (=> b!116202 m!174039))

(assert (=> b!116202 m!174039))

(declare-fun m!174041 () Bool)

(assert (=> b!116202 m!174041))

(push 1)

(assert (not b!116205))

(assert (not b!116200))

(assert (not b!116198))

(assert (not b!116202))

(assert (not b!116206))

(assert (not b!116204))

(assert (not start!22970))

(assert (not b!116201))

(assert (not b!116208))

(assert (not b!116203))

(assert (not b!116209))

(check-sat)

(pop 1)

(push 1)

(check-sat)

