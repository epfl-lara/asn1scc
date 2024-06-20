; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20006 () Bool)

(assert start!20006)

(declare-fun b!99893 () Bool)

(declare-fun e!65376 () Bool)

(declare-fun e!65382 () Bool)

(assert (=> b!99893 (= e!65376 (not e!65382))))

(declare-fun res!81996 () Bool)

(assert (=> b!99893 (=> res!81996 e!65382)))

(declare-datatypes ((array!4705 0))(
  ( (array!4706 (arr!2741 (Array (_ BitVec 32) (_ BitVec 8))) (size!2148 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3770 0))(
  ( (BitStream!3771 (buf!2505 array!4705) (currentByte!4951 (_ BitVec 32)) (currentBit!4946 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6123 0))(
  ( (Unit!6124) )
))
(declare-datatypes ((tuple2!8058 0))(
  ( (tuple2!8059 (_1!4284 Unit!6123) (_2!4284 BitStream!3770)) )
))
(declare-fun lt!144606 () tuple2!8058)

(declare-fun lt!144603 () tuple2!8058)

(assert (=> b!99893 (= res!81996 (not (= (size!2148 (buf!2505 (_2!4284 lt!144606))) (size!2148 (buf!2505 (_2!4284 lt!144603))))))))

(declare-fun e!65381 () Bool)

(assert (=> b!99893 e!65381))

(declare-fun res!81998 () Bool)

(assert (=> b!99893 (=> (not res!81998) (not e!65381))))

(declare-fun thiss!1305 () BitStream!3770)

(declare-fun isPrefixOf!0 (BitStream!3770 BitStream!3770) Bool)

(assert (=> b!99893 (= res!81998 (isPrefixOf!0 thiss!1305 (_2!4284 lt!144603)))))

(declare-fun lt!144604 () Unit!6123)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3770 BitStream!3770 BitStream!3770) Unit!6123)

(assert (=> b!99893 (= lt!144604 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4284 lt!144606) (_2!4284 lt!144603)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3770 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8058)

(assert (=> b!99893 (= lt!144603 (appendNLeastSignificantBitsLoop!0 (_2!4284 lt!144606) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65375 () Bool)

(assert (=> b!99893 e!65375))

(declare-fun res!81994 () Bool)

(assert (=> b!99893 (=> (not res!81994) (not e!65375))))

(assert (=> b!99893 (= res!81994 (= (size!2148 (buf!2505 thiss!1305)) (size!2148 (buf!2505 (_2!4284 lt!144606)))))))

(declare-fun lt!144602 () Bool)

(declare-fun appendBit!0 (BitStream!3770 Bool) tuple2!8058)

(assert (=> b!99893 (= lt!144606 (appendBit!0 thiss!1305 lt!144602))))

(assert (=> b!99893 (= lt!144602 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99894 () Bool)

(declare-fun res!81995 () Bool)

(assert (=> b!99894 (=> res!81995 e!65382)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99894 (= res!81995 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2148 (buf!2505 (_2!4284 lt!144606)))) ((_ sign_extend 32) (currentByte!4951 thiss!1305)) ((_ sign_extend 32) (currentBit!4946 thiss!1305)))))))

(declare-fun b!99895 () Bool)

(declare-fun res!82001 () Bool)

(assert (=> b!99895 (=> (not res!82001) (not e!65376))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99895 (= res!82001 (validate_offset_bits!1 ((_ sign_extend 32) (size!2148 (buf!2505 thiss!1305))) ((_ sign_extend 32) (currentByte!4951 thiss!1305)) ((_ sign_extend 32) (currentBit!4946 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99896 () Bool)

(declare-fun e!65377 () Bool)

(declare-fun array_inv!1950 (array!4705) Bool)

(assert (=> b!99896 (= e!65377 (array_inv!1950 (buf!2505 thiss!1305)))))

(declare-fun b!99897 () Bool)

(declare-fun e!65379 () Bool)

(declare-fun e!65380 () Bool)

(assert (=> b!99897 (= e!65379 e!65380)))

(declare-fun res!81999 () Bool)

(assert (=> b!99897 (=> (not res!81999) (not e!65380))))

(declare-datatypes ((tuple2!8060 0))(
  ( (tuple2!8061 (_1!4285 BitStream!3770) (_2!4285 Bool)) )
))
(declare-fun lt!144605 () tuple2!8060)

(assert (=> b!99897 (= res!81999 (and (= (_2!4285 lt!144605) lt!144602) (= (_1!4285 lt!144605) (_2!4284 lt!144606))))))

(declare-fun readBitPure!0 (BitStream!3770) tuple2!8060)

(declare-fun readerFrom!0 (BitStream!3770 (_ BitVec 32) (_ BitVec 32)) BitStream!3770)

(assert (=> b!99897 (= lt!144605 (readBitPure!0 (readerFrom!0 (_2!4284 lt!144606) (currentBit!4946 thiss!1305) (currentByte!4951 thiss!1305))))))

(declare-fun b!99898 () Bool)

(assert (=> b!99898 (= e!65375 e!65379)))

(declare-fun res!81993 () Bool)

(assert (=> b!99898 (=> (not res!81993) (not e!65379))))

(declare-fun lt!144610 () (_ BitVec 64))

(declare-fun lt!144609 () (_ BitVec 64))

(assert (=> b!99898 (= res!81993 (= lt!144610 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144609)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99898 (= lt!144610 (bitIndex!0 (size!2148 (buf!2505 (_2!4284 lt!144606))) (currentByte!4951 (_2!4284 lt!144606)) (currentBit!4946 (_2!4284 lt!144606))))))

(assert (=> b!99898 (= lt!144609 (bitIndex!0 (size!2148 (buf!2505 thiss!1305)) (currentByte!4951 thiss!1305) (currentBit!4946 thiss!1305)))))

(declare-fun res!82002 () Bool)

(assert (=> start!20006 (=> (not res!82002) (not e!65376))))

(assert (=> start!20006 (= res!82002 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20006 e!65376))

(assert (=> start!20006 true))

(declare-fun inv!12 (BitStream!3770) Bool)

(assert (=> start!20006 (and (inv!12 thiss!1305) e!65377)))

(declare-fun b!99899 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99899 (= e!65381 (invariant!0 (currentBit!4946 thiss!1305) (currentByte!4951 thiss!1305) (size!2148 (buf!2505 (_2!4284 lt!144606)))))))

(declare-fun b!99900 () Bool)

(assert (=> b!99900 (= e!65380 (= (bitIndex!0 (size!2148 (buf!2505 (_1!4285 lt!144605))) (currentByte!4951 (_1!4285 lt!144605)) (currentBit!4946 (_1!4285 lt!144605))) lt!144610))))

(declare-fun b!99901 () Bool)

(assert (=> b!99901 (= e!65382 true)))

(declare-fun lt!144607 () tuple2!8060)

(assert (=> b!99901 (= lt!144607 (readBitPure!0 (BitStream!3771 (buf!2505 (_2!4284 lt!144603)) (currentByte!4951 thiss!1305) (currentBit!4946 thiss!1305))))))

(declare-fun lt!144608 () tuple2!8060)

(assert (=> b!99901 (= lt!144608 (readBitPure!0 (BitStream!3771 (buf!2505 (_2!4284 lt!144606)) (currentByte!4951 thiss!1305) (currentBit!4946 thiss!1305))))))

(assert (=> b!99901 (invariant!0 (currentBit!4946 thiss!1305) (currentByte!4951 thiss!1305) (size!2148 (buf!2505 (_2!4284 lt!144603))))))

(declare-fun b!99902 () Bool)

(declare-fun res!82004 () Bool)

(assert (=> b!99902 (=> res!82004 e!65382)))

(declare-fun arrayBitRangesEq!0 (array!4705 array!4705 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99902 (= res!82004 (not (arrayBitRangesEq!0 (buf!2505 (_2!4284 lt!144606)) (buf!2505 (_2!4284 lt!144603)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2148 (buf!2505 (_2!4284 lt!144606))) (currentByte!4951 thiss!1305) (currentBit!4946 thiss!1305))))))))

(declare-fun b!99903 () Bool)

(declare-fun res!81997 () Bool)

(assert (=> b!99903 (=> (not res!81997) (not e!65379))))

(assert (=> b!99903 (= res!81997 (isPrefixOf!0 thiss!1305 (_2!4284 lt!144606)))))

(declare-fun b!99904 () Bool)

(declare-fun res!82003 () Bool)

(assert (=> b!99904 (=> (not res!82003) (not e!65376))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99904 (= res!82003 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99905 () Bool)

(declare-fun res!82000 () Bool)

(assert (=> b!99905 (=> (not res!82000) (not e!65376))))

(assert (=> b!99905 (= res!82000 (bvslt i!615 nBits!396))))

(assert (= (and start!20006 res!82002) b!99895))

(assert (= (and b!99895 res!82001) b!99904))

(assert (= (and b!99904 res!82003) b!99905))

(assert (= (and b!99905 res!82000) b!99893))

(assert (= (and b!99893 res!81994) b!99898))

(assert (= (and b!99898 res!81993) b!99903))

(assert (= (and b!99903 res!81997) b!99897))

(assert (= (and b!99897 res!81999) b!99900))

(assert (= (and b!99893 res!81998) b!99899))

(assert (= (and b!99893 (not res!81996)) b!99894))

(assert (= (and b!99894 (not res!81995)) b!99902))

(assert (= (and b!99902 (not res!82004)) b!99901))

(assert (= start!20006 b!99896))

(declare-fun m!145231 () Bool)

(assert (=> b!99904 m!145231))

(declare-fun m!145233 () Bool)

(assert (=> b!99901 m!145233))

(declare-fun m!145235 () Bool)

(assert (=> b!99901 m!145235))

(declare-fun m!145237 () Bool)

(assert (=> b!99901 m!145237))

(declare-fun m!145239 () Bool)

(assert (=> b!99893 m!145239))

(declare-fun m!145241 () Bool)

(assert (=> b!99893 m!145241))

(declare-fun m!145243 () Bool)

(assert (=> b!99893 m!145243))

(declare-fun m!145245 () Bool)

(assert (=> b!99893 m!145245))

(declare-fun m!145247 () Bool)

(assert (=> b!99902 m!145247))

(declare-fun m!145249 () Bool)

(assert (=> b!99902 m!145249))

(declare-fun m!145251 () Bool)

(assert (=> b!99894 m!145251))

(declare-fun m!145253 () Bool)

(assert (=> b!99895 m!145253))

(declare-fun m!145255 () Bool)

(assert (=> b!99900 m!145255))

(declare-fun m!145257 () Bool)

(assert (=> b!99903 m!145257))

(declare-fun m!145259 () Bool)

(assert (=> b!99898 m!145259))

(declare-fun m!145261 () Bool)

(assert (=> b!99898 m!145261))

(declare-fun m!145263 () Bool)

(assert (=> b!99896 m!145263))

(declare-fun m!145265 () Bool)

(assert (=> start!20006 m!145265))

(declare-fun m!145267 () Bool)

(assert (=> b!99897 m!145267))

(assert (=> b!99897 m!145267))

(declare-fun m!145269 () Bool)

(assert (=> b!99897 m!145269))

(declare-fun m!145271 () Bool)

(assert (=> b!99899 m!145271))

(push 1)

(assert (not b!99893))

(assert (not b!99902))

(assert (not b!99899))

(assert (not b!99903))

(assert (not b!99896))

(assert (not b!99900))

(assert (not b!99898))

(assert (not b!99901))

(assert (not b!99904))

(assert (not b!99897))

(assert (not b!99895))

(assert (not start!20006))

(assert (not b!99894))

(check-sat)

