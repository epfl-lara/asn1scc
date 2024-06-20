; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20218 () Bool)

(assert start!20218)

(declare-fun b!101205 () Bool)

(declare-fun e!66168 () Bool)

(assert (=> b!101205 (= e!66168 (not true))))

(declare-datatypes ((array!4749 0))(
  ( (array!4750 (arr!2760 (Array (_ BitVec 32) (_ BitVec 8))) (size!2167 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3808 0))(
  ( (BitStream!3809 (buf!2524 array!4749) (currentByte!4991 (_ BitVec 32)) (currentBit!4986 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8182 0))(
  ( (tuple2!8183 (_1!4346 BitStream!3808) (_2!4346 BitStream!3808)) )
))
(declare-fun lt!146956 () tuple2!8182)

(declare-fun lt!146950 () Bool)

(declare-datatypes ((tuple2!8184 0))(
  ( (tuple2!8185 (_1!4347 BitStream!3808) (_2!4347 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3808) tuple2!8184)

(assert (=> b!101205 (= (_2!4347 (readBitPure!0 (_1!4346 lt!146956))) lt!146950)))

(declare-fun lt!146960 () tuple2!8182)

(declare-datatypes ((Unit!6206 0))(
  ( (Unit!6207) )
))
(declare-datatypes ((tuple2!8186 0))(
  ( (tuple2!8187 (_1!4348 Unit!6206) (_2!4348 BitStream!3808)) )
))
(declare-fun lt!146954 () tuple2!8186)

(declare-fun lt!146962 () tuple2!8186)

(declare-fun reader!0 (BitStream!3808 BitStream!3808) tuple2!8182)

(assert (=> b!101205 (= lt!146960 (reader!0 (_2!4348 lt!146954) (_2!4348 lt!146962)))))

(declare-fun thiss!1305 () BitStream!3808)

(assert (=> b!101205 (= lt!146956 (reader!0 thiss!1305 (_2!4348 lt!146962)))))

(declare-fun e!66170 () Bool)

(assert (=> b!101205 e!66170))

(declare-fun res!83141 () Bool)

(assert (=> b!101205 (=> (not res!83141) (not e!66170))))

(declare-fun lt!146957 () tuple2!8184)

(declare-fun lt!146952 () tuple2!8184)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101205 (= res!83141 (= (bitIndex!0 (size!2167 (buf!2524 (_1!4347 lt!146957))) (currentByte!4991 (_1!4347 lt!146957)) (currentBit!4986 (_1!4347 lt!146957))) (bitIndex!0 (size!2167 (buf!2524 (_1!4347 lt!146952))) (currentByte!4991 (_1!4347 lt!146952)) (currentBit!4986 (_1!4347 lt!146952)))))))

(declare-fun lt!146955 () Unit!6206)

(declare-fun lt!146961 () BitStream!3808)

(declare-fun readBitPrefixLemma!0 (BitStream!3808 BitStream!3808) Unit!6206)

(assert (=> b!101205 (= lt!146955 (readBitPrefixLemma!0 lt!146961 (_2!4348 lt!146962)))))

(assert (=> b!101205 (= lt!146952 (readBitPure!0 (BitStream!3809 (buf!2524 (_2!4348 lt!146962)) (currentByte!4991 thiss!1305) (currentBit!4986 thiss!1305))))))

(assert (=> b!101205 (= lt!146957 (readBitPure!0 lt!146961))))

(assert (=> b!101205 (= lt!146961 (BitStream!3809 (buf!2524 (_2!4348 lt!146954)) (currentByte!4991 thiss!1305) (currentBit!4986 thiss!1305)))))

(declare-fun e!66172 () Bool)

(assert (=> b!101205 e!66172))

(declare-fun res!83140 () Bool)

(assert (=> b!101205 (=> (not res!83140) (not e!66172))))

(declare-fun isPrefixOf!0 (BitStream!3808 BitStream!3808) Bool)

(assert (=> b!101205 (= res!83140 (isPrefixOf!0 thiss!1305 (_2!4348 lt!146962)))))

(declare-fun lt!146951 () Unit!6206)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3808 BitStream!3808 BitStream!3808) Unit!6206)

(assert (=> b!101205 (= lt!146951 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4348 lt!146954) (_2!4348 lt!146962)))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3808 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8186)

(assert (=> b!101205 (= lt!146962 (appendNLeastSignificantBitsLoop!0 (_2!4348 lt!146954) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66174 () Bool)

(assert (=> b!101205 e!66174))

(declare-fun res!83142 () Bool)

(assert (=> b!101205 (=> (not res!83142) (not e!66174))))

(assert (=> b!101205 (= res!83142 (= (size!2167 (buf!2524 thiss!1305)) (size!2167 (buf!2524 (_2!4348 lt!146954)))))))

(declare-fun appendBit!0 (BitStream!3808 Bool) tuple2!8186)

(assert (=> b!101205 (= lt!146954 (appendBit!0 thiss!1305 lt!146950))))

(assert (=> b!101205 (= lt!146950 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101206 () Bool)

(assert (=> b!101206 (= e!66170 (= (_2!4347 lt!146957) (_2!4347 lt!146952)))))

(declare-fun b!101207 () Bool)

(declare-fun res!83134 () Bool)

(assert (=> b!101207 (=> (not res!83134) (not e!66168))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101207 (= res!83134 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101208 () Bool)

(declare-fun e!66173 () Bool)

(declare-fun lt!146959 () tuple2!8184)

(declare-fun lt!146958 () (_ BitVec 64))

(assert (=> b!101208 (= e!66173 (= (bitIndex!0 (size!2167 (buf!2524 (_1!4347 lt!146959))) (currentByte!4991 (_1!4347 lt!146959)) (currentBit!4986 (_1!4347 lt!146959))) lt!146958))))

(declare-fun b!101209 () Bool)

(declare-fun e!66167 () Bool)

(declare-fun array_inv!1969 (array!4749) Bool)

(assert (=> b!101209 (= e!66167 (array_inv!1969 (buf!2524 thiss!1305)))))

(declare-fun b!101210 () Bool)

(declare-fun res!83143 () Bool)

(assert (=> b!101210 (=> (not res!83143) (not e!66168))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101210 (= res!83143 (validate_offset_bits!1 ((_ sign_extend 32) (size!2167 (buf!2524 thiss!1305))) ((_ sign_extend 32) (currentByte!4991 thiss!1305)) ((_ sign_extend 32) (currentBit!4986 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!83135 () Bool)

(assert (=> start!20218 (=> (not res!83135) (not e!66168))))

(assert (=> start!20218 (= res!83135 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20218 e!66168))

(assert (=> start!20218 true))

(declare-fun inv!12 (BitStream!3808) Bool)

(assert (=> start!20218 (and (inv!12 thiss!1305) e!66167)))

(declare-fun b!101211 () Bool)

(declare-fun e!66169 () Bool)

(assert (=> b!101211 (= e!66169 e!66173)))

(declare-fun res!83139 () Bool)

(assert (=> b!101211 (=> (not res!83139) (not e!66173))))

(assert (=> b!101211 (= res!83139 (and (= (_2!4347 lt!146959) lt!146950) (= (_1!4347 lt!146959) (_2!4348 lt!146954))))))

(declare-fun readerFrom!0 (BitStream!3808 (_ BitVec 32) (_ BitVec 32)) BitStream!3808)

(assert (=> b!101211 (= lt!146959 (readBitPure!0 (readerFrom!0 (_2!4348 lt!146954) (currentBit!4986 thiss!1305) (currentByte!4991 thiss!1305))))))

(declare-fun b!101212 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101212 (= e!66172 (invariant!0 (currentBit!4986 thiss!1305) (currentByte!4991 thiss!1305) (size!2167 (buf!2524 (_2!4348 lt!146962)))))))

(declare-fun b!101213 () Bool)

(declare-fun res!83136 () Bool)

(assert (=> b!101213 (=> (not res!83136) (not e!66169))))

(assert (=> b!101213 (= res!83136 (isPrefixOf!0 thiss!1305 (_2!4348 lt!146954)))))

(declare-fun b!101214 () Bool)

(assert (=> b!101214 (= e!66174 e!66169)))

(declare-fun res!83138 () Bool)

(assert (=> b!101214 (=> (not res!83138) (not e!66169))))

(declare-fun lt!146953 () (_ BitVec 64))

(assert (=> b!101214 (= res!83138 (= lt!146958 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!146953)))))

(assert (=> b!101214 (= lt!146958 (bitIndex!0 (size!2167 (buf!2524 (_2!4348 lt!146954))) (currentByte!4991 (_2!4348 lt!146954)) (currentBit!4986 (_2!4348 lt!146954))))))

(assert (=> b!101214 (= lt!146953 (bitIndex!0 (size!2167 (buf!2524 thiss!1305)) (currentByte!4991 thiss!1305) (currentBit!4986 thiss!1305)))))

(declare-fun b!101215 () Bool)

(declare-fun res!83137 () Bool)

(assert (=> b!101215 (=> (not res!83137) (not e!66172))))

(assert (=> b!101215 (= res!83137 (invariant!0 (currentBit!4986 thiss!1305) (currentByte!4991 thiss!1305) (size!2167 (buf!2524 (_2!4348 lt!146954)))))))

(declare-fun b!101216 () Bool)

(declare-fun res!83144 () Bool)

(assert (=> b!101216 (=> (not res!83144) (not e!66168))))

(assert (=> b!101216 (= res!83144 (bvslt i!615 nBits!396))))

(assert (= (and start!20218 res!83135) b!101210))

(assert (= (and b!101210 res!83143) b!101207))

(assert (= (and b!101207 res!83134) b!101216))

(assert (= (and b!101216 res!83144) b!101205))

(assert (= (and b!101205 res!83142) b!101214))

(assert (= (and b!101214 res!83138) b!101213))

(assert (= (and b!101213 res!83136) b!101211))

(assert (= (and b!101211 res!83139) b!101208))

(assert (= (and b!101205 res!83140) b!101215))

(assert (= (and b!101215 res!83137) b!101212))

(assert (= (and b!101205 res!83141) b!101206))

(assert (= start!20218 b!101209))

(declare-fun m!147211 () Bool)

(assert (=> b!101208 m!147211))

(declare-fun m!147213 () Bool)

(assert (=> b!101213 m!147213))

(declare-fun m!147215 () Bool)

(assert (=> b!101211 m!147215))

(assert (=> b!101211 m!147215))

(declare-fun m!147217 () Bool)

(assert (=> b!101211 m!147217))

(declare-fun m!147219 () Bool)

(assert (=> start!20218 m!147219))

(declare-fun m!147221 () Bool)

(assert (=> b!101207 m!147221))

(declare-fun m!147223 () Bool)

(assert (=> b!101209 m!147223))

(declare-fun m!147225 () Bool)

(assert (=> b!101210 m!147225))

(declare-fun m!147227 () Bool)

(assert (=> b!101215 m!147227))

(declare-fun m!147229 () Bool)

(assert (=> b!101214 m!147229))

(declare-fun m!147231 () Bool)

(assert (=> b!101214 m!147231))

(declare-fun m!147233 () Bool)

(assert (=> b!101205 m!147233))

(declare-fun m!147235 () Bool)

(assert (=> b!101205 m!147235))

(declare-fun m!147237 () Bool)

(assert (=> b!101205 m!147237))

(declare-fun m!147239 () Bool)

(assert (=> b!101205 m!147239))

(declare-fun m!147241 () Bool)

(assert (=> b!101205 m!147241))

(declare-fun m!147243 () Bool)

(assert (=> b!101205 m!147243))

(declare-fun m!147245 () Bool)

(assert (=> b!101205 m!147245))

(declare-fun m!147247 () Bool)

(assert (=> b!101205 m!147247))

(declare-fun m!147249 () Bool)

(assert (=> b!101205 m!147249))

(declare-fun m!147251 () Bool)

(assert (=> b!101205 m!147251))

(declare-fun m!147253 () Bool)

(assert (=> b!101205 m!147253))

(declare-fun m!147255 () Bool)

(assert (=> b!101205 m!147255))

(declare-fun m!147257 () Bool)

(assert (=> b!101212 m!147257))

(push 1)

(assert (not b!101209))

(assert (not b!101213))

(assert (not start!20218))

(assert (not b!101211))

(assert (not b!101208))

(assert (not b!101212))

(assert (not b!101205))

(assert (not b!101207))

(assert (not b!101215))

(assert (not b!101210))

(assert (not b!101214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

