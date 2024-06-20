; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21624 () Bool)

(assert start!21624)

(declare-fun b!109343 () Bool)

(declare-fun res!90219 () Bool)

(declare-fun e!71658 () Bool)

(assert (=> b!109343 (=> (not res!90219) (not e!71658))))

(declare-datatypes ((array!4987 0))(
  ( (array!4988 (arr!2863 (Array (_ BitVec 32) (_ BitVec 8))) (size!2270 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4014 0))(
  ( (BitStream!4015 (buf!2661 array!4987) (currentByte!5197 (_ BitVec 32)) (currentBit!5192 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4014)

(declare-datatypes ((Unit!6681 0))(
  ( (Unit!6682) )
))
(declare-datatypes ((tuple2!9092 0))(
  ( (tuple2!9093 (_1!4803 Unit!6681) (_2!4803 BitStream!4014)) )
))
(declare-fun lt!165278 () tuple2!9092)

(declare-fun isPrefixOf!0 (BitStream!4014 BitStream!4014) Bool)

(assert (=> b!109343 (= res!90219 (isPrefixOf!0 thiss!1305 (_2!4803 lt!165278)))))

(declare-fun b!109344 () Bool)

(declare-fun e!71665 () Bool)

(declare-datatypes ((tuple2!9094 0))(
  ( (tuple2!9095 (_1!4804 BitStream!4014) (_2!4804 BitStream!4014)) )
))
(declare-fun lt!165281 () tuple2!9094)

(declare-fun lt!165269 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109344 (= e!71665 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4804 lt!165281)))) ((_ sign_extend 32) (currentByte!5197 (_1!4804 lt!165281))) ((_ sign_extend 32) (currentBit!5192 (_1!4804 lt!165281))) lt!165269))))

(declare-fun b!109345 () Bool)

(declare-fun e!71659 () Bool)

(assert (=> b!109345 (= e!71659 e!71658)))

(declare-fun res!90231 () Bool)

(assert (=> b!109345 (=> (not res!90231) (not e!71658))))

(declare-fun lt!165263 () (_ BitVec 64))

(declare-fun lt!165276 () (_ BitVec 64))

(assert (=> b!109345 (= res!90231 (= lt!165263 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!165276)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109345 (= lt!165263 (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))))))

(assert (=> b!109345 (= lt!165276 (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)))))

(declare-fun b!109346 () Bool)

(declare-fun e!71667 () Bool)

(assert (=> b!109346 (= e!71658 e!71667)))

(declare-fun res!90221 () Bool)

(assert (=> b!109346 (=> (not res!90221) (not e!71667))))

(declare-datatypes ((tuple2!9096 0))(
  ( (tuple2!9097 (_1!4805 BitStream!4014) (_2!4805 Bool)) )
))
(declare-fun lt!165279 () tuple2!9096)

(declare-fun lt!165268 () Bool)

(assert (=> b!109346 (= res!90221 (and (= (_2!4805 lt!165279) lt!165268) (= (_1!4805 lt!165279) (_2!4803 lt!165278))))))

(declare-fun readBitPure!0 (BitStream!4014) tuple2!9096)

(declare-fun readerFrom!0 (BitStream!4014 (_ BitVec 32) (_ BitVec 32)) BitStream!4014)

(assert (=> b!109346 (= lt!165279 (readBitPure!0 (readerFrom!0 (_2!4803 lt!165278) (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305))))))

(declare-fun b!109347 () Bool)

(declare-fun res!90228 () Bool)

(declare-fun e!71668 () Bool)

(assert (=> b!109347 (=> (not res!90228) (not e!71668))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!109347 (= res!90228 (bvslt i!615 nBits!396))))

(declare-fun b!109348 () Bool)

(assert (=> b!109348 (= e!71667 (= (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165279))) (currentByte!5197 (_1!4805 lt!165279)) (currentBit!5192 (_1!4805 lt!165279))) lt!165263))))

(declare-fun res!90230 () Bool)

(declare-fun e!71666 () Bool)

(assert (=> start!21624 (=> (not res!90230) (not e!71666))))

(assert (=> start!21624 (= res!90230 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21624 e!71666))

(assert (=> start!21624 true))

(declare-fun e!71664 () Bool)

(declare-fun inv!12 (BitStream!4014) Bool)

(assert (=> start!21624 (and (inv!12 thiss!1305) e!71664)))

(declare-fun b!109349 () Bool)

(declare-fun e!71663 () Bool)

(assert (=> b!109349 (= e!71668 (not e!71663))))

(declare-fun res!90224 () Bool)

(assert (=> b!109349 (=> res!90224 e!71663)))

(declare-datatypes ((tuple2!9098 0))(
  ( (tuple2!9099 (_1!4806 BitStream!4014) (_2!4806 (_ BitVec 64))) )
))
(declare-fun lt!165271 () tuple2!9098)

(declare-fun lt!165255 () tuple2!9094)

(assert (=> b!109349 (= res!90224 (not (= (_1!4806 lt!165271) (_2!4804 lt!165255))))))

(declare-fun lt!165261 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9098)

(assert (=> b!109349 (= lt!165271 (readNLeastSignificantBitsLoopPure!0 (_1!4804 lt!165255) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165261))))

(declare-fun lt!165259 () tuple2!9092)

(declare-fun lt!165264 () (_ BitVec 64))

(assert (=> b!109349 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165278))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165278))) lt!165264)))

(declare-fun lt!165256 () Unit!6681)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4014 array!4987 (_ BitVec 64)) Unit!6681)

(assert (=> b!109349 (= lt!165256 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4803 lt!165278) (buf!2661 (_2!4803 lt!165259)) lt!165264))))

(assert (=> b!109349 (= lt!165264 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!165260 () tuple2!9096)

(declare-fun lt!165253 () (_ BitVec 64))

(declare-fun lt!165254 () (_ BitVec 64))

(assert (=> b!109349 (= lt!165261 (bvor lt!165253 (ite (_2!4805 lt!165260) lt!165254 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!165272 () tuple2!9098)

(assert (=> b!109349 (= lt!165272 (readNLeastSignificantBitsLoopPure!0 (_1!4804 lt!165281) nBits!396 i!615 lt!165253))))

(assert (=> b!109349 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))) ((_ sign_extend 32) (currentByte!5197 thiss!1305)) ((_ sign_extend 32) (currentBit!5192 thiss!1305)) lt!165269)))

(declare-fun lt!165277 () Unit!6681)

(assert (=> b!109349 (= lt!165277 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2661 (_2!4803 lt!165259)) lt!165269))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109349 (= lt!165253 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!109349 (= (_2!4805 lt!165260) lt!165268)))

(assert (=> b!109349 (= lt!165260 (readBitPure!0 (_1!4804 lt!165281)))))

(declare-fun reader!0 (BitStream!4014 BitStream!4014) tuple2!9094)

(assert (=> b!109349 (= lt!165255 (reader!0 (_2!4803 lt!165278) (_2!4803 lt!165259)))))

(assert (=> b!109349 (= lt!165281 (reader!0 thiss!1305 (_2!4803 lt!165259)))))

(declare-fun e!71669 () Bool)

(assert (=> b!109349 e!71669))

(declare-fun res!90225 () Bool)

(assert (=> b!109349 (=> (not res!90225) (not e!71669))))

(declare-fun lt!165266 () tuple2!9096)

(declare-fun lt!165275 () tuple2!9096)

(assert (=> b!109349 (= res!90225 (= (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165266))) (currentByte!5197 (_1!4805 lt!165266)) (currentBit!5192 (_1!4805 lt!165266))) (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165275))) (currentByte!5197 (_1!4805 lt!165275)) (currentBit!5192 (_1!4805 lt!165275)))))))

(declare-fun lt!165273 () Unit!6681)

(declare-fun lt!165262 () BitStream!4014)

(declare-fun readBitPrefixLemma!0 (BitStream!4014 BitStream!4014) Unit!6681)

(assert (=> b!109349 (= lt!165273 (readBitPrefixLemma!0 lt!165262 (_2!4803 lt!165259)))))

(assert (=> b!109349 (= lt!165275 (readBitPure!0 (BitStream!4015 (buf!2661 (_2!4803 lt!165259)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305))))))

(assert (=> b!109349 (= lt!165266 (readBitPure!0 lt!165262))))

(assert (=> b!109349 (= lt!165262 (BitStream!4015 (buf!2661 (_2!4803 lt!165278)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)))))

(declare-fun e!71661 () Bool)

(assert (=> b!109349 e!71661))

(declare-fun res!90223 () Bool)

(assert (=> b!109349 (=> (not res!90223) (not e!71661))))

(assert (=> b!109349 (= res!90223 (isPrefixOf!0 thiss!1305 (_2!4803 lt!165259)))))

(declare-fun lt!165274 () Unit!6681)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4014 BitStream!4014 BitStream!4014) Unit!6681)

(assert (=> b!109349 (= lt!165274 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4803 lt!165278) (_2!4803 lt!165259)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4014 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9092)

(assert (=> b!109349 (= lt!165259 (appendNLeastSignificantBitsLoop!0 (_2!4803 lt!165278) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!109349 e!71659))

(declare-fun res!90232 () Bool)

(assert (=> b!109349 (=> (not res!90232) (not e!71659))))

(assert (=> b!109349 (= res!90232 (= (size!2270 (buf!2661 thiss!1305)) (size!2270 (buf!2661 (_2!4803 lt!165278)))))))

(declare-fun appendBit!0 (BitStream!4014 Bool) tuple2!9092)

(assert (=> b!109349 (= lt!165278 (appendBit!0 thiss!1305 lt!165268))))

(assert (=> b!109349 (= lt!165268 (not (= (bvand v!199 lt!165254) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109349 (= lt!165254 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109350 () Bool)

(declare-fun res!90229 () Bool)

(assert (=> b!109350 (=> (not res!90229) (not e!71668))))

(assert (=> b!109350 (= res!90229 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109351 () Bool)

(declare-fun res!90222 () Bool)

(assert (=> b!109351 (=> (not res!90222) (not e!71661))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109351 (= res!90222 (invariant!0 (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305) (size!2270 (buf!2661 (_2!4803 lt!165278)))))))

(declare-fun b!109352 () Bool)

(assert (=> b!109352 (= e!71663 e!71665)))

(declare-fun res!90220 () Bool)

(assert (=> b!109352 (=> res!90220 e!71665)))

(declare-fun lt!165280 () (_ BitVec 64))

(declare-fun lt!165258 () BitStream!4014)

(declare-fun lt!165270 () (_ BitVec 64))

(assert (=> b!109352 (= res!90220 (or (not (= (_1!4804 lt!165255) lt!165258)) (not (= (size!2270 (buf!2661 thiss!1305)) (size!2270 (buf!2661 (_2!4803 lt!165259))))) (not (= lt!165280 (bvadd lt!165270 lt!165269)))))))

(declare-fun e!71660 () Bool)

(assert (=> b!109352 e!71660))

(declare-fun res!90227 () Bool)

(assert (=> b!109352 (=> (not res!90227) (not e!71660))))

(declare-fun lt!165265 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4014 (_ BitVec 64)) BitStream!4014)

(assert (=> b!109352 (= res!90227 (= (_1!4804 lt!165255) (withMovedBitIndex!0 (_2!4804 lt!165255) (bvsub lt!165265 lt!165280))))))

(assert (=> b!109352 (= lt!165265 (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))))))

(assert (=> b!109352 (= (_1!4804 lt!165281) (withMovedBitIndex!0 (_2!4804 lt!165281) (bvsub lt!165270 lt!165280)))))

(assert (=> b!109352 (= lt!165280 (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165259))) (currentByte!5197 (_2!4803 lt!165259)) (currentBit!5192 (_2!4803 lt!165259))))))

(assert (=> b!109352 (= lt!165270 (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)))))

(declare-fun lt!165257 () tuple2!9098)

(assert (=> b!109352 (and (= (_2!4806 lt!165272) (_2!4806 lt!165257)) (= (_1!4806 lt!165272) (_1!4806 lt!165257)))))

(declare-fun lt!165267 () Unit!6681)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6681)

(assert (=> b!109352 (= lt!165267 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4804 lt!165281) nBits!396 i!615 lt!165253))))

(assert (=> b!109352 (= lt!165257 (readNLeastSignificantBitsLoopPure!0 lt!165258 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165261))))

(assert (=> b!109352 (= lt!165258 (withMovedBitIndex!0 (_1!4804 lt!165281) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109353 () Bool)

(declare-fun array_inv!2072 (array!4987) Bool)

(assert (=> b!109353 (= e!71664 (array_inv!2072 (buf!2661 thiss!1305)))))

(declare-fun b!109354 () Bool)

(assert (=> b!109354 (= e!71669 (= (_2!4805 lt!165266) (_2!4805 lt!165275)))))

(declare-fun b!109355 () Bool)

(assert (=> b!109355 (= e!71661 (invariant!0 (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305) (size!2270 (buf!2661 (_2!4803 lt!165259)))))))

(declare-fun b!109356 () Bool)

(assert (=> b!109356 (= e!71666 e!71668)))

(declare-fun res!90226 () Bool)

(assert (=> b!109356 (=> (not res!90226) (not e!71668))))

(assert (=> b!109356 (= res!90226 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 thiss!1305))) ((_ sign_extend 32) (currentByte!5197 thiss!1305)) ((_ sign_extend 32) (currentBit!5192 thiss!1305)) lt!165269))))

(assert (=> b!109356 (= lt!165269 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109357 () Bool)

(assert (=> b!109357 (= e!71660 (and (= lt!165270 (bvsub lt!165265 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4804 lt!165255) lt!165258)) (and (= (_2!4806 lt!165272) (_2!4806 lt!165271)) (= (_1!4806 lt!165272) (_2!4804 lt!165281))))))))

(assert (= (and start!21624 res!90230) b!109356))

(assert (= (and b!109356 res!90226) b!109350))

(assert (= (and b!109350 res!90229) b!109347))

(assert (= (and b!109347 res!90228) b!109349))

(assert (= (and b!109349 res!90232) b!109345))

(assert (= (and b!109345 res!90231) b!109343))

(assert (= (and b!109343 res!90219) b!109346))

(assert (= (and b!109346 res!90221) b!109348))

(assert (= (and b!109349 res!90223) b!109351))

(assert (= (and b!109351 res!90222) b!109355))

(assert (= (and b!109349 res!90225) b!109354))

(assert (= (and b!109349 (not res!90224)) b!109352))

(assert (= (and b!109352 res!90227) b!109357))

(assert (= (and b!109352 (not res!90220)) b!109344))

(assert (= start!21624 b!109353))

(declare-fun m!162285 () Bool)

(assert (=> b!109349 m!162285))

(declare-fun m!162287 () Bool)

(assert (=> b!109349 m!162287))

(declare-fun m!162289 () Bool)

(assert (=> b!109349 m!162289))

(declare-fun m!162291 () Bool)

(assert (=> b!109349 m!162291))

(declare-fun m!162293 () Bool)

(assert (=> b!109349 m!162293))

(declare-fun m!162295 () Bool)

(assert (=> b!109349 m!162295))

(declare-fun m!162297 () Bool)

(assert (=> b!109349 m!162297))

(declare-fun m!162299 () Bool)

(assert (=> b!109349 m!162299))

(declare-fun m!162301 () Bool)

(assert (=> b!109349 m!162301))

(declare-fun m!162303 () Bool)

(assert (=> b!109349 m!162303))

(declare-fun m!162305 () Bool)

(assert (=> b!109349 m!162305))

(declare-fun m!162307 () Bool)

(assert (=> b!109349 m!162307))

(declare-fun m!162309 () Bool)

(assert (=> b!109349 m!162309))

(declare-fun m!162311 () Bool)

(assert (=> b!109349 m!162311))

(declare-fun m!162313 () Bool)

(assert (=> b!109349 m!162313))

(declare-fun m!162315 () Bool)

(assert (=> b!109349 m!162315))

(declare-fun m!162317 () Bool)

(assert (=> b!109349 m!162317))

(declare-fun m!162319 () Bool)

(assert (=> b!109349 m!162319))

(declare-fun m!162321 () Bool)

(assert (=> b!109349 m!162321))

(declare-fun m!162323 () Bool)

(assert (=> b!109345 m!162323))

(declare-fun m!162325 () Bool)

(assert (=> b!109345 m!162325))

(declare-fun m!162327 () Bool)

(assert (=> b!109351 m!162327))

(declare-fun m!162329 () Bool)

(assert (=> b!109356 m!162329))

(declare-fun m!162331 () Bool)

(assert (=> b!109350 m!162331))

(declare-fun m!162333 () Bool)

(assert (=> b!109348 m!162333))

(declare-fun m!162335 () Bool)

(assert (=> b!109355 m!162335))

(declare-fun m!162337 () Bool)

(assert (=> b!109346 m!162337))

(assert (=> b!109346 m!162337))

(declare-fun m!162339 () Bool)

(assert (=> b!109346 m!162339))

(declare-fun m!162341 () Bool)

(assert (=> start!21624 m!162341))

(declare-fun m!162343 () Bool)

(assert (=> b!109352 m!162343))

(assert (=> b!109352 m!162325))

(declare-fun m!162345 () Bool)

(assert (=> b!109352 m!162345))

(assert (=> b!109352 m!162323))

(declare-fun m!162347 () Bool)

(assert (=> b!109352 m!162347))

(declare-fun m!162349 () Bool)

(assert (=> b!109352 m!162349))

(declare-fun m!162351 () Bool)

(assert (=> b!109352 m!162351))

(declare-fun m!162353 () Bool)

(assert (=> b!109352 m!162353))

(declare-fun m!162355 () Bool)

(assert (=> b!109343 m!162355))

(declare-fun m!162357 () Bool)

(assert (=> b!109344 m!162357))

(declare-fun m!162359 () Bool)

(assert (=> b!109353 m!162359))

(check-sat (not b!109348) (not b!109352) (not start!21624) (not b!109350) (not b!109346) (not b!109355) (not b!109349) (not b!109351) (not b!109343) (not b!109344) (not b!109345) (not b!109356) (not b!109353))
(check-sat)
(get-model)

(declare-fun d!34416 () Bool)

(declare-fun e!71708 () Bool)

(assert (=> d!34416 e!71708))

(declare-fun res!90280 () Bool)

(assert (=> d!34416 (=> (not res!90280) (not e!71708))))

(declare-fun lt!165385 () (_ BitVec 64))

(declare-fun lt!165384 () (_ BitVec 64))

(declare-fun lt!165381 () (_ BitVec 64))

(assert (=> d!34416 (= res!90280 (= lt!165384 (bvsub lt!165381 lt!165385)))))

(assert (=> d!34416 (or (= (bvand lt!165381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165381 lt!165385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34416 (= lt!165385 (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4805 lt!165279)))) ((_ sign_extend 32) (currentByte!5197 (_1!4805 lt!165279))) ((_ sign_extend 32) (currentBit!5192 (_1!4805 lt!165279)))))))

(declare-fun lt!165383 () (_ BitVec 64))

(declare-fun lt!165386 () (_ BitVec 64))

(assert (=> d!34416 (= lt!165381 (bvmul lt!165383 lt!165386))))

(assert (=> d!34416 (or (= lt!165383 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165386 (bvsdiv (bvmul lt!165383 lt!165386) lt!165383)))))

(assert (=> d!34416 (= lt!165386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34416 (= lt!165383 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4805 lt!165279)))))))

(assert (=> d!34416 (= lt!165384 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5197 (_1!4805 lt!165279))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5192 (_1!4805 lt!165279)))))))

(assert (=> d!34416 (invariant!0 (currentBit!5192 (_1!4805 lt!165279)) (currentByte!5197 (_1!4805 lt!165279)) (size!2270 (buf!2661 (_1!4805 lt!165279))))))

(assert (=> d!34416 (= (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165279))) (currentByte!5197 (_1!4805 lt!165279)) (currentBit!5192 (_1!4805 lt!165279))) lt!165384)))

(declare-fun b!109407 () Bool)

(declare-fun res!90279 () Bool)

(assert (=> b!109407 (=> (not res!90279) (not e!71708))))

(assert (=> b!109407 (= res!90279 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165384))))

(declare-fun b!109408 () Bool)

(declare-fun lt!165382 () (_ BitVec 64))

(assert (=> b!109408 (= e!71708 (bvsle lt!165384 (bvmul lt!165382 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109408 (or (= lt!165382 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165382 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165382)))))

(assert (=> b!109408 (= lt!165382 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4805 lt!165279)))))))

(assert (= (and d!34416 res!90280) b!109407))

(assert (= (and b!109407 res!90279) b!109408))

(declare-fun m!162437 () Bool)

(assert (=> d!34416 m!162437))

(declare-fun m!162439 () Bool)

(assert (=> d!34416 m!162439))

(assert (=> b!109348 d!34416))

(declare-fun d!34418 () Bool)

(declare-datatypes ((tuple2!9108 0))(
  ( (tuple2!9109 (_1!4811 Bool) (_2!4811 BitStream!4014)) )
))
(declare-fun lt!165389 () tuple2!9108)

(declare-fun readBit!0 (BitStream!4014) tuple2!9108)

(assert (=> d!34418 (= lt!165389 (readBit!0 (readerFrom!0 (_2!4803 lt!165278) (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305))))))

(assert (=> d!34418 (= (readBitPure!0 (readerFrom!0 (_2!4803 lt!165278) (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305))) (tuple2!9097 (_2!4811 lt!165389) (_1!4811 lt!165389)))))

(declare-fun bs!8405 () Bool)

(assert (= bs!8405 d!34418))

(assert (=> bs!8405 m!162337))

(declare-fun m!162441 () Bool)

(assert (=> bs!8405 m!162441))

(assert (=> b!109346 d!34418))

(declare-fun d!34420 () Bool)

(declare-fun e!71711 () Bool)

(assert (=> d!34420 e!71711))

(declare-fun res!90284 () Bool)

(assert (=> d!34420 (=> (not res!90284) (not e!71711))))

(assert (=> d!34420 (= res!90284 (invariant!0 (currentBit!5192 (_2!4803 lt!165278)) (currentByte!5197 (_2!4803 lt!165278)) (size!2270 (buf!2661 (_2!4803 lt!165278)))))))

(assert (=> d!34420 (= (readerFrom!0 (_2!4803 lt!165278) (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305)) (BitStream!4015 (buf!2661 (_2!4803 lt!165278)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)))))

(declare-fun b!109411 () Bool)

(assert (=> b!109411 (= e!71711 (invariant!0 (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305) (size!2270 (buf!2661 (_2!4803 lt!165278)))))))

(assert (= (and d!34420 res!90284) b!109411))

(declare-fun m!162443 () Bool)

(assert (=> d!34420 m!162443))

(assert (=> b!109411 m!162327))

(assert (=> b!109346 d!34420))

(declare-fun d!34422 () Bool)

(assert (=> d!34422 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!109350 d!34422))

(declare-fun d!34424 () Bool)

(assert (=> d!34424 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305) (size!2270 (buf!2661 thiss!1305))))))

(declare-fun bs!8406 () Bool)

(assert (= bs!8406 d!34424))

(declare-fun m!162445 () Bool)

(assert (=> bs!8406 m!162445))

(assert (=> start!21624 d!34424))

(declare-fun d!34426 () Bool)

(assert (=> d!34426 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!109349 d!34426))

(declare-fun d!34428 () Bool)

(assert (=> d!34428 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165278))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165278))) lt!165264) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165278))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165278)))) lt!165264))))

(declare-fun bs!8407 () Bool)

(assert (= bs!8407 d!34428))

(declare-fun m!162447 () Bool)

(assert (=> bs!8407 m!162447))

(assert (=> b!109349 d!34428))

(declare-fun d!34430 () Bool)

(declare-fun e!71712 () Bool)

(assert (=> d!34430 e!71712))

(declare-fun res!90286 () Bool)

(assert (=> d!34430 (=> (not res!90286) (not e!71712))))

(declare-fun lt!165393 () (_ BitVec 64))

(declare-fun lt!165394 () (_ BitVec 64))

(declare-fun lt!165390 () (_ BitVec 64))

(assert (=> d!34430 (= res!90286 (= lt!165393 (bvsub lt!165390 lt!165394)))))

(assert (=> d!34430 (or (= (bvand lt!165390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165390 lt!165394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34430 (= lt!165394 (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4805 lt!165266)))) ((_ sign_extend 32) (currentByte!5197 (_1!4805 lt!165266))) ((_ sign_extend 32) (currentBit!5192 (_1!4805 lt!165266)))))))

(declare-fun lt!165392 () (_ BitVec 64))

(declare-fun lt!165395 () (_ BitVec 64))

(assert (=> d!34430 (= lt!165390 (bvmul lt!165392 lt!165395))))

(assert (=> d!34430 (or (= lt!165392 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165395 (bvsdiv (bvmul lt!165392 lt!165395) lt!165392)))))

(assert (=> d!34430 (= lt!165395 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34430 (= lt!165392 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4805 lt!165266)))))))

(assert (=> d!34430 (= lt!165393 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5197 (_1!4805 lt!165266))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5192 (_1!4805 lt!165266)))))))

(assert (=> d!34430 (invariant!0 (currentBit!5192 (_1!4805 lt!165266)) (currentByte!5197 (_1!4805 lt!165266)) (size!2270 (buf!2661 (_1!4805 lt!165266))))))

(assert (=> d!34430 (= (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165266))) (currentByte!5197 (_1!4805 lt!165266)) (currentBit!5192 (_1!4805 lt!165266))) lt!165393)))

(declare-fun b!109412 () Bool)

(declare-fun res!90285 () Bool)

(assert (=> b!109412 (=> (not res!90285) (not e!71712))))

(assert (=> b!109412 (= res!90285 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165393))))

(declare-fun b!109413 () Bool)

(declare-fun lt!165391 () (_ BitVec 64))

(assert (=> b!109413 (= e!71712 (bvsle lt!165393 (bvmul lt!165391 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109413 (or (= lt!165391 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165391 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165391)))))

(assert (=> b!109413 (= lt!165391 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4805 lt!165266)))))))

(assert (= (and d!34430 res!90286) b!109412))

(assert (= (and b!109412 res!90285) b!109413))

(declare-fun m!162449 () Bool)

(assert (=> d!34430 m!162449))

(declare-fun m!162451 () Bool)

(assert (=> d!34430 m!162451))

(assert (=> b!109349 d!34430))

(declare-fun d!34432 () Bool)

(declare-fun e!71715 () Bool)

(assert (=> d!34432 e!71715))

(declare-fun res!90289 () Bool)

(assert (=> d!34432 (=> (not res!90289) (not e!71715))))

(declare-fun lt!165405 () tuple2!9096)

(declare-fun lt!165404 () tuple2!9096)

(assert (=> d!34432 (= res!90289 (= (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165405))) (currentByte!5197 (_1!4805 lt!165405)) (currentBit!5192 (_1!4805 lt!165405))) (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165404))) (currentByte!5197 (_1!4805 lt!165404)) (currentBit!5192 (_1!4805 lt!165404)))))))

(declare-fun lt!165406 () Unit!6681)

(declare-fun lt!165407 () BitStream!4014)

(declare-fun choose!50 (BitStream!4014 BitStream!4014 BitStream!4014 tuple2!9096 tuple2!9096 BitStream!4014 Bool tuple2!9096 tuple2!9096 BitStream!4014 Bool) Unit!6681)

(assert (=> d!34432 (= lt!165406 (choose!50 lt!165262 (_2!4803 lt!165259) lt!165407 lt!165405 (tuple2!9097 (_1!4805 lt!165405) (_2!4805 lt!165405)) (_1!4805 lt!165405) (_2!4805 lt!165405) lt!165404 (tuple2!9097 (_1!4805 lt!165404) (_2!4805 lt!165404)) (_1!4805 lt!165404) (_2!4805 lt!165404)))))

(assert (=> d!34432 (= lt!165404 (readBitPure!0 lt!165407))))

(assert (=> d!34432 (= lt!165405 (readBitPure!0 lt!165262))))

(assert (=> d!34432 (= lt!165407 (BitStream!4015 (buf!2661 (_2!4803 lt!165259)) (currentByte!5197 lt!165262) (currentBit!5192 lt!165262)))))

(assert (=> d!34432 (invariant!0 (currentBit!5192 lt!165262) (currentByte!5197 lt!165262) (size!2270 (buf!2661 (_2!4803 lt!165259))))))

(assert (=> d!34432 (= (readBitPrefixLemma!0 lt!165262 (_2!4803 lt!165259)) lt!165406)))

(declare-fun b!109416 () Bool)

(assert (=> b!109416 (= e!71715 (= (_2!4805 lt!165405) (_2!4805 lt!165404)))))

(assert (= (and d!34432 res!90289) b!109416))

(declare-fun m!162453 () Bool)

(assert (=> d!34432 m!162453))

(declare-fun m!162455 () Bool)

(assert (=> d!34432 m!162455))

(declare-fun m!162457 () Bool)

(assert (=> d!34432 m!162457))

(declare-fun m!162459 () Bool)

(assert (=> d!34432 m!162459))

(assert (=> d!34432 m!162317))

(declare-fun m!162461 () Bool)

(assert (=> d!34432 m!162461))

(assert (=> b!109349 d!34432))

(declare-fun d!34434 () Bool)

(declare-fun e!71716 () Bool)

(assert (=> d!34434 e!71716))

(declare-fun res!90291 () Bool)

(assert (=> d!34434 (=> (not res!90291) (not e!71716))))

(declare-fun lt!165411 () (_ BitVec 64))

(declare-fun lt!165408 () (_ BitVec 64))

(declare-fun lt!165412 () (_ BitVec 64))

(assert (=> d!34434 (= res!90291 (= lt!165411 (bvsub lt!165408 lt!165412)))))

(assert (=> d!34434 (or (= (bvand lt!165408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165412 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165408 lt!165412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34434 (= lt!165412 (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4805 lt!165275)))) ((_ sign_extend 32) (currentByte!5197 (_1!4805 lt!165275))) ((_ sign_extend 32) (currentBit!5192 (_1!4805 lt!165275)))))))

(declare-fun lt!165410 () (_ BitVec 64))

(declare-fun lt!165413 () (_ BitVec 64))

(assert (=> d!34434 (= lt!165408 (bvmul lt!165410 lt!165413))))

(assert (=> d!34434 (or (= lt!165410 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165413 (bvsdiv (bvmul lt!165410 lt!165413) lt!165410)))))

(assert (=> d!34434 (= lt!165413 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34434 (= lt!165410 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4805 lt!165275)))))))

(assert (=> d!34434 (= lt!165411 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5197 (_1!4805 lt!165275))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5192 (_1!4805 lt!165275)))))))

(assert (=> d!34434 (invariant!0 (currentBit!5192 (_1!4805 lt!165275)) (currentByte!5197 (_1!4805 lt!165275)) (size!2270 (buf!2661 (_1!4805 lt!165275))))))

(assert (=> d!34434 (= (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165275))) (currentByte!5197 (_1!4805 lt!165275)) (currentBit!5192 (_1!4805 lt!165275))) lt!165411)))

(declare-fun b!109417 () Bool)

(declare-fun res!90290 () Bool)

(assert (=> b!109417 (=> (not res!90290) (not e!71716))))

(assert (=> b!109417 (= res!90290 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165411))))

(declare-fun b!109418 () Bool)

(declare-fun lt!165409 () (_ BitVec 64))

(assert (=> b!109418 (= e!71716 (bvsle lt!165411 (bvmul lt!165409 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109418 (or (= lt!165409 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165409 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165409)))))

(assert (=> b!109418 (= lt!165409 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4805 lt!165275)))))))

(assert (= (and d!34434 res!90291) b!109417))

(assert (= (and b!109417 res!90290) b!109418))

(declare-fun m!162463 () Bool)

(assert (=> d!34434 m!162463))

(declare-fun m!162465 () Bool)

(assert (=> d!34434 m!162465))

(assert (=> b!109349 d!34434))

(declare-fun d!34436 () Bool)

(assert (=> d!34436 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165278))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165278))) lt!165264)))

(declare-fun lt!165416 () Unit!6681)

(declare-fun choose!9 (BitStream!4014 array!4987 (_ BitVec 64) BitStream!4014) Unit!6681)

(assert (=> d!34436 (= lt!165416 (choose!9 (_2!4803 lt!165278) (buf!2661 (_2!4803 lt!165259)) lt!165264 (BitStream!4015 (buf!2661 (_2!4803 lt!165259)) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278)))))))

(assert (=> d!34436 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4803 lt!165278) (buf!2661 (_2!4803 lt!165259)) lt!165264) lt!165416)))

(declare-fun bs!8408 () Bool)

(assert (= bs!8408 d!34436))

(assert (=> bs!8408 m!162319))

(declare-fun m!162467 () Bool)

(assert (=> bs!8408 m!162467))

(assert (=> b!109349 d!34436))

(declare-fun d!34438 () Bool)

(assert (=> d!34438 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))) ((_ sign_extend 32) (currentByte!5197 thiss!1305)) ((_ sign_extend 32) (currentBit!5192 thiss!1305)) lt!165269) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))) ((_ sign_extend 32) (currentByte!5197 thiss!1305)) ((_ sign_extend 32) (currentBit!5192 thiss!1305))) lt!165269))))

(declare-fun bs!8409 () Bool)

(assert (= bs!8409 d!34438))

(declare-fun m!162469 () Bool)

(assert (=> bs!8409 m!162469))

(assert (=> b!109349 d!34438))

(declare-fun d!34440 () Bool)

(declare-datatypes ((tuple2!9110 0))(
  ( (tuple2!9111 (_1!4812 (_ BitVec 64)) (_2!4812 BitStream!4014)) )
))
(declare-fun lt!165419 () tuple2!9110)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9110)

(assert (=> d!34440 (= lt!165419 (readNLeastSignificantBitsLoop!0 (_1!4804 lt!165281) nBits!396 i!615 lt!165253))))

(assert (=> d!34440 (= (readNLeastSignificantBitsLoopPure!0 (_1!4804 lt!165281) nBits!396 i!615 lt!165253) (tuple2!9099 (_2!4812 lt!165419) (_1!4812 lt!165419)))))

(declare-fun bs!8410 () Bool)

(assert (= bs!8410 d!34440))

(declare-fun m!162471 () Bool)

(assert (=> bs!8410 m!162471))

(assert (=> b!109349 d!34440))

(declare-fun d!34442 () Bool)

(declare-fun lt!165420 () tuple2!9110)

(assert (=> d!34442 (= lt!165420 (readNLeastSignificantBitsLoop!0 (_1!4804 lt!165255) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165261))))

(assert (=> d!34442 (= (readNLeastSignificantBitsLoopPure!0 (_1!4804 lt!165255) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165261) (tuple2!9099 (_2!4812 lt!165420) (_1!4812 lt!165420)))))

(declare-fun bs!8411 () Bool)

(assert (= bs!8411 d!34442))

(declare-fun m!162473 () Bool)

(assert (=> bs!8411 m!162473))

(assert (=> b!109349 d!34442))

(declare-fun d!34444 () Bool)

(declare-fun lt!165421 () tuple2!9108)

(assert (=> d!34444 (= lt!165421 (readBit!0 lt!165262))))

(assert (=> d!34444 (= (readBitPure!0 lt!165262) (tuple2!9097 (_2!4811 lt!165421) (_1!4811 lt!165421)))))

(declare-fun bs!8412 () Bool)

(assert (= bs!8412 d!34444))

(declare-fun m!162475 () Bool)

(assert (=> bs!8412 m!162475))

(assert (=> b!109349 d!34444))

(declare-fun b!109429 () Bool)

(declare-fun e!71722 () Unit!6681)

(declare-fun lt!165475 () Unit!6681)

(assert (=> b!109429 (= e!71722 lt!165475)))

(declare-fun lt!165468 () (_ BitVec 64))

(assert (=> b!109429 (= lt!165468 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165474 () (_ BitVec 64))

(assert (=> b!109429 (= lt!165474 (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4987 array!4987 (_ BitVec 64) (_ BitVec 64)) Unit!6681)

(assert (=> b!109429 (= lt!165475 (arrayBitRangesEqSymmetric!0 (buf!2661 (_2!4803 lt!165278)) (buf!2661 (_2!4803 lt!165259)) lt!165468 lt!165474))))

(declare-fun arrayBitRangesEq!0 (array!4987 array!4987 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109429 (arrayBitRangesEq!0 (buf!2661 (_2!4803 lt!165259)) (buf!2661 (_2!4803 lt!165278)) lt!165468 lt!165474)))

(declare-fun b!109430 () Bool)

(declare-fun Unit!6685 () Unit!6681)

(assert (=> b!109430 (= e!71722 Unit!6685)))

(declare-fun d!34446 () Bool)

(declare-fun e!71721 () Bool)

(assert (=> d!34446 e!71721))

(declare-fun res!90298 () Bool)

(assert (=> d!34446 (=> (not res!90298) (not e!71721))))

(declare-fun lt!165472 () tuple2!9094)

(assert (=> d!34446 (= res!90298 (isPrefixOf!0 (_1!4804 lt!165472) (_2!4804 lt!165472)))))

(declare-fun lt!165463 () BitStream!4014)

(assert (=> d!34446 (= lt!165472 (tuple2!9095 lt!165463 (_2!4803 lt!165259)))))

(declare-fun lt!165462 () Unit!6681)

(declare-fun lt!165481 () Unit!6681)

(assert (=> d!34446 (= lt!165462 lt!165481)))

(assert (=> d!34446 (isPrefixOf!0 lt!165463 (_2!4803 lt!165259))))

(assert (=> d!34446 (= lt!165481 (lemmaIsPrefixTransitive!0 lt!165463 (_2!4803 lt!165259) (_2!4803 lt!165259)))))

(declare-fun lt!165464 () Unit!6681)

(declare-fun lt!165476 () Unit!6681)

(assert (=> d!34446 (= lt!165464 lt!165476)))

(assert (=> d!34446 (isPrefixOf!0 lt!165463 (_2!4803 lt!165259))))

(assert (=> d!34446 (= lt!165476 (lemmaIsPrefixTransitive!0 lt!165463 (_2!4803 lt!165278) (_2!4803 lt!165259)))))

(declare-fun lt!165473 () Unit!6681)

(assert (=> d!34446 (= lt!165473 e!71722)))

(declare-fun c!6692 () Bool)

(assert (=> d!34446 (= c!6692 (not (= (size!2270 (buf!2661 (_2!4803 lt!165278))) #b00000000000000000000000000000000)))))

(declare-fun lt!165469 () Unit!6681)

(declare-fun lt!165478 () Unit!6681)

(assert (=> d!34446 (= lt!165469 lt!165478)))

(assert (=> d!34446 (isPrefixOf!0 (_2!4803 lt!165259) (_2!4803 lt!165259))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4014) Unit!6681)

(assert (=> d!34446 (= lt!165478 (lemmaIsPrefixRefl!0 (_2!4803 lt!165259)))))

(declare-fun lt!165471 () Unit!6681)

(declare-fun lt!165477 () Unit!6681)

(assert (=> d!34446 (= lt!165471 lt!165477)))

(assert (=> d!34446 (= lt!165477 (lemmaIsPrefixRefl!0 (_2!4803 lt!165259)))))

(declare-fun lt!165466 () Unit!6681)

(declare-fun lt!165470 () Unit!6681)

(assert (=> d!34446 (= lt!165466 lt!165470)))

(assert (=> d!34446 (isPrefixOf!0 lt!165463 lt!165463)))

(assert (=> d!34446 (= lt!165470 (lemmaIsPrefixRefl!0 lt!165463))))

(declare-fun lt!165480 () Unit!6681)

(declare-fun lt!165465 () Unit!6681)

(assert (=> d!34446 (= lt!165480 lt!165465)))

(assert (=> d!34446 (isPrefixOf!0 (_2!4803 lt!165278) (_2!4803 lt!165278))))

(assert (=> d!34446 (= lt!165465 (lemmaIsPrefixRefl!0 (_2!4803 lt!165278)))))

(assert (=> d!34446 (= lt!165463 (BitStream!4015 (buf!2661 (_2!4803 lt!165259)) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))))))

(assert (=> d!34446 (isPrefixOf!0 (_2!4803 lt!165278) (_2!4803 lt!165259))))

(assert (=> d!34446 (= (reader!0 (_2!4803 lt!165278) (_2!4803 lt!165259)) lt!165472)))

(declare-fun lt!165467 () (_ BitVec 64))

(declare-fun lt!165479 () (_ BitVec 64))

(declare-fun b!109431 () Bool)

(assert (=> b!109431 (= e!71721 (= (_1!4804 lt!165472) (withMovedBitIndex!0 (_2!4804 lt!165472) (bvsub lt!165479 lt!165467))))))

(assert (=> b!109431 (or (= (bvand lt!165479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165479 lt!165467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109431 (= lt!165467 (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165259))) (currentByte!5197 (_2!4803 lt!165259)) (currentBit!5192 (_2!4803 lt!165259))))))

(assert (=> b!109431 (= lt!165479 (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))))))

(declare-fun b!109432 () Bool)

(declare-fun res!90299 () Bool)

(assert (=> b!109432 (=> (not res!90299) (not e!71721))))

(assert (=> b!109432 (= res!90299 (isPrefixOf!0 (_2!4804 lt!165472) (_2!4803 lt!165259)))))

(declare-fun b!109433 () Bool)

(declare-fun res!90300 () Bool)

(assert (=> b!109433 (=> (not res!90300) (not e!71721))))

(assert (=> b!109433 (= res!90300 (isPrefixOf!0 (_1!4804 lt!165472) (_2!4803 lt!165278)))))

(assert (= (and d!34446 c!6692) b!109429))

(assert (= (and d!34446 (not c!6692)) b!109430))

(assert (= (and d!34446 res!90298) b!109433))

(assert (= (and b!109433 res!90300) b!109432))

(assert (= (and b!109432 res!90299) b!109431))

(declare-fun m!162477 () Bool)

(assert (=> b!109431 m!162477))

(assert (=> b!109431 m!162345))

(assert (=> b!109431 m!162323))

(declare-fun m!162479 () Bool)

(assert (=> d!34446 m!162479))

(declare-fun m!162481 () Bool)

(assert (=> d!34446 m!162481))

(declare-fun m!162483 () Bool)

(assert (=> d!34446 m!162483))

(declare-fun m!162485 () Bool)

(assert (=> d!34446 m!162485))

(declare-fun m!162487 () Bool)

(assert (=> d!34446 m!162487))

(declare-fun m!162489 () Bool)

(assert (=> d!34446 m!162489))

(declare-fun m!162491 () Bool)

(assert (=> d!34446 m!162491))

(declare-fun m!162493 () Bool)

(assert (=> d!34446 m!162493))

(declare-fun m!162495 () Bool)

(assert (=> d!34446 m!162495))

(declare-fun m!162497 () Bool)

(assert (=> d!34446 m!162497))

(declare-fun m!162499 () Bool)

(assert (=> d!34446 m!162499))

(declare-fun m!162501 () Bool)

(assert (=> b!109432 m!162501))

(assert (=> b!109429 m!162323))

(declare-fun m!162503 () Bool)

(assert (=> b!109429 m!162503))

(declare-fun m!162505 () Bool)

(assert (=> b!109429 m!162505))

(declare-fun m!162507 () Bool)

(assert (=> b!109433 m!162507))

(assert (=> b!109349 d!34446))

(declare-fun d!34448 () Bool)

(assert (=> d!34448 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))) ((_ sign_extend 32) (currentByte!5197 thiss!1305)) ((_ sign_extend 32) (currentBit!5192 thiss!1305)) lt!165269)))

(declare-fun lt!165482 () Unit!6681)

(assert (=> d!34448 (= lt!165482 (choose!9 thiss!1305 (buf!2661 (_2!4803 lt!165259)) lt!165269 (BitStream!4015 (buf!2661 (_2!4803 lt!165259)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305))))))

(assert (=> d!34448 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2661 (_2!4803 lt!165259)) lt!165269) lt!165482)))

(declare-fun bs!8413 () Bool)

(assert (= bs!8413 d!34448))

(assert (=> bs!8413 m!162321))

(declare-fun m!162509 () Bool)

(assert (=> bs!8413 m!162509))

(assert (=> b!109349 d!34448))

(declare-fun b!109543 () Bool)

(declare-fun e!71785 () (_ BitVec 64))

(assert (=> b!109543 (= e!71785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!34450 () Bool)

(declare-fun e!71790 () Bool)

(assert (=> d!34450 e!71790))

(declare-fun res!90404 () Bool)

(assert (=> d!34450 (=> (not res!90404) (not e!71790))))

(declare-fun lt!165777 () tuple2!9092)

(assert (=> d!34450 (= res!90404 (= (size!2270 (buf!2661 (_2!4803 lt!165278))) (size!2270 (buf!2661 (_2!4803 lt!165777)))))))

(declare-fun e!71791 () tuple2!9092)

(assert (=> d!34450 (= lt!165777 e!71791)))

(declare-fun c!6698 () Bool)

(assert (=> d!34450 (= c!6698 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34450 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34450 (= (appendNLeastSignificantBitsLoop!0 (_2!4803 lt!165278) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!165777)))

(declare-fun b!109544 () Bool)

(declare-fun e!71786 () Bool)

(declare-fun lt!165747 () tuple2!9096)

(declare-fun lt!165746 () tuple2!9096)

(assert (=> b!109544 (= e!71786 (= (_2!4805 lt!165747) (_2!4805 lt!165746)))))

(declare-fun lt!165740 () tuple2!9094)

(declare-fun b!109545 () Bool)

(declare-fun lt!165744 () tuple2!9098)

(assert (=> b!109545 (= e!71790 (and (= (_2!4806 lt!165744) v!199) (= (_1!4806 lt!165744) (_2!4804 lt!165740))))))

(declare-fun lt!165762 () (_ BitVec 64))

(assert (=> b!109545 (= lt!165744 (readNLeastSignificantBitsLoopPure!0 (_1!4804 lt!165740) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165762))))

(declare-fun lt!165749 () Unit!6681)

(declare-fun lt!165752 () Unit!6681)

(assert (=> b!109545 (= lt!165749 lt!165752)))

(declare-fun lt!165772 () (_ BitVec 64))

(assert (=> b!109545 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165777)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165278))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165278))) lt!165772)))

(assert (=> b!109545 (= lt!165752 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4803 lt!165278) (buf!2661 (_2!4803 lt!165777)) lt!165772))))

(declare-fun e!71788 () Bool)

(assert (=> b!109545 e!71788))

(declare-fun res!90400 () Bool)

(assert (=> b!109545 (=> (not res!90400) (not e!71788))))

(assert (=> b!109545 (= res!90400 (and (= (size!2270 (buf!2661 (_2!4803 lt!165278))) (size!2270 (buf!2661 (_2!4803 lt!165777)))) (bvsge lt!165772 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109545 (= lt!165772 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!109545 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!109545 (= lt!165762 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!109545 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!109545 (= lt!165740 (reader!0 (_2!4803 lt!165278) (_2!4803 lt!165777)))))

(declare-fun b!109546 () Bool)

(declare-fun res!90401 () Bool)

(declare-fun call!1380 () Bool)

(assert (=> b!109546 (= res!90401 call!1380)))

(declare-fun e!71789 () Bool)

(assert (=> b!109546 (=> (not res!90401) (not e!71789))))

(declare-fun b!109547 () Bool)

(declare-fun res!90402 () Bool)

(declare-fun lt!165771 () tuple2!9092)

(assert (=> b!109547 (= res!90402 (= (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165771))) (currentByte!5197 (_2!4803 lt!165771)) (currentBit!5192 (_2!4803 lt!165771))) (bvadd (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!109547 (=> (not res!90402) (not e!71789))))

(declare-fun b!109548 () Bool)

(declare-fun lt!165756 () tuple2!9092)

(declare-fun Unit!6686 () Unit!6681)

(assert (=> b!109548 (= e!71791 (tuple2!9093 Unit!6686 (_2!4803 lt!165756)))))

(declare-fun lt!165753 () Bool)

(assert (=> b!109548 (= lt!165753 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109548 (= lt!165771 (appendBit!0 (_2!4803 lt!165278) lt!165753))))

(declare-fun res!90408 () Bool)

(assert (=> b!109548 (= res!90408 (= (size!2270 (buf!2661 (_2!4803 lt!165278))) (size!2270 (buf!2661 (_2!4803 lt!165771)))))))

(assert (=> b!109548 (=> (not res!90408) (not e!71789))))

(assert (=> b!109548 e!71789))

(declare-fun lt!165745 () tuple2!9092)

(assert (=> b!109548 (= lt!165745 lt!165771)))

(assert (=> b!109548 (= lt!165756 (appendNLeastSignificantBitsLoop!0 (_2!4803 lt!165745) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!165783 () Unit!6681)

(assert (=> b!109548 (= lt!165783 (lemmaIsPrefixTransitive!0 (_2!4803 lt!165278) (_2!4803 lt!165745) (_2!4803 lt!165756)))))

(assert (=> b!109548 (isPrefixOf!0 (_2!4803 lt!165278) (_2!4803 lt!165756))))

(declare-fun lt!165768 () Unit!6681)

(assert (=> b!109548 (= lt!165768 lt!165783)))

(assert (=> b!109548 (invariant!0 (currentBit!5192 (_2!4803 lt!165278)) (currentByte!5197 (_2!4803 lt!165278)) (size!2270 (buf!2661 (_2!4803 lt!165745))))))

(declare-fun lt!165781 () BitStream!4014)

(assert (=> b!109548 (= lt!165781 (BitStream!4015 (buf!2661 (_2!4803 lt!165745)) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))))))

(assert (=> b!109548 (invariant!0 (currentBit!5192 lt!165781) (currentByte!5197 lt!165781) (size!2270 (buf!2661 (_2!4803 lt!165756))))))

(declare-fun lt!165765 () BitStream!4014)

(assert (=> b!109548 (= lt!165765 (BitStream!4015 (buf!2661 (_2!4803 lt!165756)) (currentByte!5197 lt!165781) (currentBit!5192 lt!165781)))))

(assert (=> b!109548 (= lt!165747 (readBitPure!0 lt!165781))))

(assert (=> b!109548 (= lt!165746 (readBitPure!0 lt!165765))))

(declare-fun lt!165780 () Unit!6681)

(assert (=> b!109548 (= lt!165780 (readBitPrefixLemma!0 lt!165781 (_2!4803 lt!165756)))))

(declare-fun res!90407 () Bool)

(assert (=> b!109548 (= res!90407 (= (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165747))) (currentByte!5197 (_1!4805 lt!165747)) (currentBit!5192 (_1!4805 lt!165747))) (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165746))) (currentByte!5197 (_1!4805 lt!165746)) (currentBit!5192 (_1!4805 lt!165746)))))))

(assert (=> b!109548 (=> (not res!90407) (not e!71786))))

(assert (=> b!109548 e!71786))

(declare-fun lt!165760 () Unit!6681)

(assert (=> b!109548 (= lt!165760 lt!165780)))

(declare-fun lt!165761 () tuple2!9094)

(assert (=> b!109548 (= lt!165761 (reader!0 (_2!4803 lt!165278) (_2!4803 lt!165756)))))

(declare-fun lt!165755 () tuple2!9094)

(assert (=> b!109548 (= lt!165755 (reader!0 (_2!4803 lt!165745) (_2!4803 lt!165756)))))

(declare-fun lt!165773 () tuple2!9096)

(assert (=> b!109548 (= lt!165773 (readBitPure!0 (_1!4804 lt!165761)))))

(assert (=> b!109548 (= (_2!4805 lt!165773) lt!165753)))

(declare-fun lt!165775 () Unit!6681)

(declare-fun Unit!6687 () Unit!6681)

(assert (=> b!109548 (= lt!165775 Unit!6687)))

(declare-fun lt!165774 () (_ BitVec 64))

(assert (=> b!109548 (= lt!165774 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!165759 () (_ BitVec 64))

(assert (=> b!109548 (= lt!165759 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!165776 () Unit!6681)

(assert (=> b!109548 (= lt!165776 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4803 lt!165278) (buf!2661 (_2!4803 lt!165756)) lt!165759))))

(assert (=> b!109548 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165756)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165278))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165278))) lt!165759)))

(declare-fun lt!165742 () Unit!6681)

(assert (=> b!109548 (= lt!165742 lt!165776)))

(declare-fun lt!165741 () tuple2!9098)

(assert (=> b!109548 (= lt!165741 (readNLeastSignificantBitsLoopPure!0 (_1!4804 lt!165761) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165774))))

(declare-fun lt!165779 () (_ BitVec 64))

(assert (=> b!109548 (= lt!165779 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!165739 () Unit!6681)

(assert (=> b!109548 (= lt!165739 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4803 lt!165745) (buf!2661 (_2!4803 lt!165756)) lt!165779))))

(assert (=> b!109548 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165756)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165745))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165745))) lt!165779)))

(declare-fun lt!165743 () Unit!6681)

(assert (=> b!109548 (= lt!165743 lt!165739)))

(declare-fun lt!165770 () tuple2!9098)

(assert (=> b!109548 (= lt!165770 (readNLeastSignificantBitsLoopPure!0 (_1!4804 lt!165755) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!165774 (ite (_2!4805 lt!165773) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!165751 () tuple2!9098)

(assert (=> b!109548 (= lt!165751 (readNLeastSignificantBitsLoopPure!0 (_1!4804 lt!165761) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165774))))

(declare-fun c!6697 () Bool)

(assert (=> b!109548 (= c!6697 (_2!4805 (readBitPure!0 (_1!4804 lt!165761))))))

(declare-fun lt!165769 () tuple2!9098)

(assert (=> b!109548 (= lt!165769 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4804 lt!165761) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!165774 e!71785)))))

(declare-fun lt!165754 () Unit!6681)

(assert (=> b!109548 (= lt!165754 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4804 lt!165761) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165774))))

(assert (=> b!109548 (and (= (_2!4806 lt!165751) (_2!4806 lt!165769)) (= (_1!4806 lt!165751) (_1!4806 lt!165769)))))

(declare-fun lt!165757 () Unit!6681)

(assert (=> b!109548 (= lt!165757 lt!165754)))

(assert (=> b!109548 (= (_1!4804 lt!165761) (withMovedBitIndex!0 (_2!4804 lt!165761) (bvsub (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))) (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165756))) (currentByte!5197 (_2!4803 lt!165756)) (currentBit!5192 (_2!4803 lt!165756))))))))

(declare-fun lt!165763 () Unit!6681)

(declare-fun Unit!6688 () Unit!6681)

(assert (=> b!109548 (= lt!165763 Unit!6688)))

(assert (=> b!109548 (= (_1!4804 lt!165755) (withMovedBitIndex!0 (_2!4804 lt!165755) (bvsub (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165745))) (currentByte!5197 (_2!4803 lt!165745)) (currentBit!5192 (_2!4803 lt!165745))) (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165756))) (currentByte!5197 (_2!4803 lt!165756)) (currentBit!5192 (_2!4803 lt!165756))))))))

(declare-fun lt!165766 () Unit!6681)

(declare-fun Unit!6689 () Unit!6681)

(assert (=> b!109548 (= lt!165766 Unit!6689)))

(assert (=> b!109548 (= (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))) (bvsub (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165745))) (currentByte!5197 (_2!4803 lt!165745)) (currentBit!5192 (_2!4803 lt!165745))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!165748 () Unit!6681)

(declare-fun Unit!6690 () Unit!6681)

(assert (=> b!109548 (= lt!165748 Unit!6690)))

(assert (=> b!109548 (= (_2!4806 lt!165741) (_2!4806 lt!165770))))

(declare-fun lt!165750 () Unit!6681)

(declare-fun Unit!6691 () Unit!6681)

(assert (=> b!109548 (= lt!165750 Unit!6691)))

(assert (=> b!109548 (= (_1!4806 lt!165741) (_2!4804 lt!165761))))

(declare-fun b!109549 () Bool)

(declare-fun e!71787 () Bool)

(declare-fun lt!165778 () tuple2!9096)

(assert (=> b!109549 (= e!71787 (= (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165778))) (currentByte!5197 (_1!4805 lt!165778)) (currentBit!5192 (_1!4805 lt!165778))) (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165771))) (currentByte!5197 (_2!4803 lt!165771)) (currentBit!5192 (_2!4803 lt!165771)))))))

(declare-fun b!109550 () Bool)

(declare-fun res!90403 () Bool)

(assert (=> b!109550 (=> (not res!90403) (not e!71790))))

(declare-fun lt!165782 () (_ BitVec 64))

(declare-fun lt!165767 () (_ BitVec 64))

(assert (=> b!109550 (= res!90403 (= (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165777))) (currentByte!5197 (_2!4803 lt!165777)) (currentBit!5192 (_2!4803 lt!165777))) (bvadd lt!165782 lt!165767)))))

(assert (=> b!109550 (or (not (= (bvand lt!165782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165767 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165782 lt!165767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109550 (= lt!165767 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!109550 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!109550 (= lt!165782 (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))))))

(declare-fun b!109551 () Bool)

(assert (=> b!109551 (= e!71785 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!109552 () Bool)

(declare-fun lt!165764 () Unit!6681)

(assert (=> b!109552 (= e!71791 (tuple2!9093 lt!165764 (_2!4803 lt!165278)))))

(declare-fun lt!165758 () BitStream!4014)

(assert (=> b!109552 (= lt!165758 (_2!4803 lt!165278))))

(assert (=> b!109552 (= lt!165764 (lemmaIsPrefixRefl!0 lt!165758))))

(assert (=> b!109552 call!1380))

(declare-fun b!109553 () Bool)

(assert (=> b!109553 (= e!71788 (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165278)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165278))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165278))) lt!165772))))

(declare-fun b!109554 () Bool)

(assert (=> b!109554 (= lt!165778 (readBitPure!0 (readerFrom!0 (_2!4803 lt!165771) (currentBit!5192 (_2!4803 lt!165278)) (currentByte!5197 (_2!4803 lt!165278)))))))

(declare-fun res!90405 () Bool)

(assert (=> b!109554 (= res!90405 (and (= (_2!4805 lt!165778) lt!165753) (= (_1!4805 lt!165778) (_2!4803 lt!165771))))))

(assert (=> b!109554 (=> (not res!90405) (not e!71787))))

(assert (=> b!109554 (= e!71789 e!71787)))

(declare-fun bm!1377 () Bool)

(assert (=> bm!1377 (= call!1380 (isPrefixOf!0 (ite c!6698 (_2!4803 lt!165278) lt!165758) (ite c!6698 (_2!4803 lt!165771) lt!165758)))))

(declare-fun b!109555 () Bool)

(declare-fun res!90406 () Bool)

(assert (=> b!109555 (=> (not res!90406) (not e!71790))))

(assert (=> b!109555 (= res!90406 (isPrefixOf!0 (_2!4803 lt!165278) (_2!4803 lt!165777)))))

(assert (= (and d!34450 c!6698) b!109548))

(assert (= (and d!34450 (not c!6698)) b!109552))

(assert (= (and b!109548 res!90408) b!109547))

(assert (= (and b!109547 res!90402) b!109546))

(assert (= (and b!109546 res!90401) b!109554))

(assert (= (and b!109554 res!90405) b!109549))

(assert (= (and b!109548 res!90407) b!109544))

(assert (= (and b!109548 c!6697) b!109551))

(assert (= (and b!109548 (not c!6697)) b!109543))

(assert (= (or b!109546 b!109552) bm!1377))

(assert (= (and d!34450 res!90404) b!109550))

(assert (= (and b!109550 res!90403) b!109555))

(assert (= (and b!109555 res!90406) b!109545))

(assert (= (and b!109545 res!90400) b!109553))

(declare-fun m!162647 () Bool)

(assert (=> b!109547 m!162647))

(assert (=> b!109547 m!162323))

(declare-fun m!162649 () Bool)

(assert (=> b!109554 m!162649))

(assert (=> b!109554 m!162649))

(declare-fun m!162651 () Bool)

(assert (=> b!109554 m!162651))

(declare-fun m!162653 () Bool)

(assert (=> b!109553 m!162653))

(declare-fun m!162655 () Bool)

(assert (=> b!109549 m!162655))

(assert (=> b!109549 m!162647))

(declare-fun m!162657 () Bool)

(assert (=> b!109550 m!162657))

(assert (=> b!109550 m!162323))

(declare-fun m!162659 () Bool)

(assert (=> b!109555 m!162659))

(declare-fun m!162661 () Bool)

(assert (=> bm!1377 m!162661))

(declare-fun m!162663 () Bool)

(assert (=> b!109552 m!162663))

(declare-fun m!162665 () Bool)

(assert (=> b!109545 m!162665))

(declare-fun m!162667 () Bool)

(assert (=> b!109545 m!162667))

(declare-fun m!162669 () Bool)

(assert (=> b!109545 m!162669))

(declare-fun m!162671 () Bool)

(assert (=> b!109545 m!162671))

(declare-fun m!162673 () Bool)

(assert (=> b!109545 m!162673))

(declare-fun m!162675 () Bool)

(assert (=> b!109548 m!162675))

(declare-fun m!162677 () Bool)

(assert (=> b!109548 m!162677))

(declare-fun m!162679 () Bool)

(assert (=> b!109548 m!162679))

(declare-fun m!162681 () Bool)

(assert (=> b!109548 m!162681))

(declare-fun m!162683 () Bool)

(assert (=> b!109548 m!162683))

(declare-fun m!162685 () Bool)

(assert (=> b!109548 m!162685))

(declare-fun m!162687 () Bool)

(assert (=> b!109548 m!162687))

(declare-fun m!162689 () Bool)

(assert (=> b!109548 m!162689))

(declare-fun m!162691 () Bool)

(assert (=> b!109548 m!162691))

(declare-fun m!162693 () Bool)

(assert (=> b!109548 m!162693))

(declare-fun m!162695 () Bool)

(assert (=> b!109548 m!162695))

(declare-fun m!162697 () Bool)

(assert (=> b!109548 m!162697))

(declare-fun m!162699 () Bool)

(assert (=> b!109548 m!162699))

(declare-fun m!162701 () Bool)

(assert (=> b!109548 m!162701))

(declare-fun m!162703 () Bool)

(assert (=> b!109548 m!162703))

(declare-fun m!162705 () Bool)

(assert (=> b!109548 m!162705))

(declare-fun m!162707 () Bool)

(assert (=> b!109548 m!162707))

(declare-fun m!162709 () Bool)

(assert (=> b!109548 m!162709))

(declare-fun m!162711 () Bool)

(assert (=> b!109548 m!162711))

(assert (=> b!109548 m!162669))

(declare-fun m!162713 () Bool)

(assert (=> b!109548 m!162713))

(declare-fun m!162715 () Bool)

(assert (=> b!109548 m!162715))

(declare-fun m!162717 () Bool)

(assert (=> b!109548 m!162717))

(declare-fun m!162719 () Bool)

(assert (=> b!109548 m!162719))

(assert (=> b!109548 m!162693))

(declare-fun m!162721 () Bool)

(assert (=> b!109548 m!162721))

(declare-fun m!162723 () Bool)

(assert (=> b!109548 m!162723))

(assert (=> b!109548 m!162323))

(declare-fun m!162725 () Bool)

(assert (=> b!109548 m!162725))

(declare-fun m!162727 () Bool)

(assert (=> b!109548 m!162727))

(assert (=> b!109349 d!34450))

(declare-fun b!109556 () Bool)

(declare-fun e!71793 () Unit!6681)

(declare-fun lt!165797 () Unit!6681)

(assert (=> b!109556 (= e!71793 lt!165797)))

(declare-fun lt!165790 () (_ BitVec 64))

(assert (=> b!109556 (= lt!165790 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165796 () (_ BitVec 64))

(assert (=> b!109556 (= lt!165796 (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)))))

(assert (=> b!109556 (= lt!165797 (arrayBitRangesEqSymmetric!0 (buf!2661 thiss!1305) (buf!2661 (_2!4803 lt!165259)) lt!165790 lt!165796))))

(assert (=> b!109556 (arrayBitRangesEq!0 (buf!2661 (_2!4803 lt!165259)) (buf!2661 thiss!1305) lt!165790 lt!165796)))

(declare-fun b!109557 () Bool)

(declare-fun Unit!6692 () Unit!6681)

(assert (=> b!109557 (= e!71793 Unit!6692)))

(declare-fun d!34532 () Bool)

(declare-fun e!71792 () Bool)

(assert (=> d!34532 e!71792))

(declare-fun res!90409 () Bool)

(assert (=> d!34532 (=> (not res!90409) (not e!71792))))

(declare-fun lt!165794 () tuple2!9094)

(assert (=> d!34532 (= res!90409 (isPrefixOf!0 (_1!4804 lt!165794) (_2!4804 lt!165794)))))

(declare-fun lt!165785 () BitStream!4014)

(assert (=> d!34532 (= lt!165794 (tuple2!9095 lt!165785 (_2!4803 lt!165259)))))

(declare-fun lt!165784 () Unit!6681)

(declare-fun lt!165803 () Unit!6681)

(assert (=> d!34532 (= lt!165784 lt!165803)))

(assert (=> d!34532 (isPrefixOf!0 lt!165785 (_2!4803 lt!165259))))

(assert (=> d!34532 (= lt!165803 (lemmaIsPrefixTransitive!0 lt!165785 (_2!4803 lt!165259) (_2!4803 lt!165259)))))

(declare-fun lt!165786 () Unit!6681)

(declare-fun lt!165798 () Unit!6681)

(assert (=> d!34532 (= lt!165786 lt!165798)))

(assert (=> d!34532 (isPrefixOf!0 lt!165785 (_2!4803 lt!165259))))

(assert (=> d!34532 (= lt!165798 (lemmaIsPrefixTransitive!0 lt!165785 thiss!1305 (_2!4803 lt!165259)))))

(declare-fun lt!165795 () Unit!6681)

(assert (=> d!34532 (= lt!165795 e!71793)))

(declare-fun c!6699 () Bool)

(assert (=> d!34532 (= c!6699 (not (= (size!2270 (buf!2661 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!165791 () Unit!6681)

(declare-fun lt!165800 () Unit!6681)

(assert (=> d!34532 (= lt!165791 lt!165800)))

(assert (=> d!34532 (isPrefixOf!0 (_2!4803 lt!165259) (_2!4803 lt!165259))))

(assert (=> d!34532 (= lt!165800 (lemmaIsPrefixRefl!0 (_2!4803 lt!165259)))))

(declare-fun lt!165793 () Unit!6681)

(declare-fun lt!165799 () Unit!6681)

(assert (=> d!34532 (= lt!165793 lt!165799)))

(assert (=> d!34532 (= lt!165799 (lemmaIsPrefixRefl!0 (_2!4803 lt!165259)))))

(declare-fun lt!165788 () Unit!6681)

(declare-fun lt!165792 () Unit!6681)

(assert (=> d!34532 (= lt!165788 lt!165792)))

(assert (=> d!34532 (isPrefixOf!0 lt!165785 lt!165785)))

(assert (=> d!34532 (= lt!165792 (lemmaIsPrefixRefl!0 lt!165785))))

(declare-fun lt!165802 () Unit!6681)

(declare-fun lt!165787 () Unit!6681)

(assert (=> d!34532 (= lt!165802 lt!165787)))

(assert (=> d!34532 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34532 (= lt!165787 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34532 (= lt!165785 (BitStream!4015 (buf!2661 (_2!4803 lt!165259)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)))))

(assert (=> d!34532 (isPrefixOf!0 thiss!1305 (_2!4803 lt!165259))))

(assert (=> d!34532 (= (reader!0 thiss!1305 (_2!4803 lt!165259)) lt!165794)))

(declare-fun lt!165789 () (_ BitVec 64))

(declare-fun lt!165801 () (_ BitVec 64))

(declare-fun b!109558 () Bool)

(assert (=> b!109558 (= e!71792 (= (_1!4804 lt!165794) (withMovedBitIndex!0 (_2!4804 lt!165794) (bvsub lt!165801 lt!165789))))))

(assert (=> b!109558 (or (= (bvand lt!165801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165789 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165801 lt!165789) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109558 (= lt!165789 (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165259))) (currentByte!5197 (_2!4803 lt!165259)) (currentBit!5192 (_2!4803 lt!165259))))))

(assert (=> b!109558 (= lt!165801 (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)))))

(declare-fun b!109559 () Bool)

(declare-fun res!90410 () Bool)

(assert (=> b!109559 (=> (not res!90410) (not e!71792))))

(assert (=> b!109559 (= res!90410 (isPrefixOf!0 (_2!4804 lt!165794) (_2!4803 lt!165259)))))

(declare-fun b!109560 () Bool)

(declare-fun res!90411 () Bool)

(assert (=> b!109560 (=> (not res!90411) (not e!71792))))

(assert (=> b!109560 (= res!90411 (isPrefixOf!0 (_1!4804 lt!165794) thiss!1305))))

(assert (= (and d!34532 c!6699) b!109556))

(assert (= (and d!34532 (not c!6699)) b!109557))

(assert (= (and d!34532 res!90409) b!109560))

(assert (= (and b!109560 res!90411) b!109559))

(assert (= (and b!109559 res!90410) b!109558))

(declare-fun m!162729 () Bool)

(assert (=> b!109558 m!162729))

(assert (=> b!109558 m!162345))

(assert (=> b!109558 m!162325))

(declare-fun m!162731 () Bool)

(assert (=> d!34532 m!162731))

(assert (=> d!34532 m!162481))

(declare-fun m!162733 () Bool)

(assert (=> d!34532 m!162733))

(declare-fun m!162735 () Bool)

(assert (=> d!34532 m!162735))

(declare-fun m!162737 () Bool)

(assert (=> d!34532 m!162737))

(assert (=> d!34532 m!162311))

(assert (=> d!34532 m!162491))

(declare-fun m!162739 () Bool)

(assert (=> d!34532 m!162739))

(declare-fun m!162741 () Bool)

(assert (=> d!34532 m!162741))

(declare-fun m!162743 () Bool)

(assert (=> d!34532 m!162743))

(declare-fun m!162745 () Bool)

(assert (=> d!34532 m!162745))

(declare-fun m!162747 () Bool)

(assert (=> b!109559 m!162747))

(assert (=> b!109556 m!162325))

(declare-fun m!162749 () Bool)

(assert (=> b!109556 m!162749))

(declare-fun m!162751 () Bool)

(assert (=> b!109556 m!162751))

(declare-fun m!162753 () Bool)

(assert (=> b!109560 m!162753))

(assert (=> b!109349 d!34532))

(declare-fun d!34534 () Bool)

(declare-fun lt!165804 () tuple2!9108)

(assert (=> d!34534 (= lt!165804 (readBit!0 (_1!4804 lt!165281)))))

(assert (=> d!34534 (= (readBitPure!0 (_1!4804 lt!165281)) (tuple2!9097 (_2!4811 lt!165804) (_1!4811 lt!165804)))))

(declare-fun bs!8430 () Bool)

(assert (= bs!8430 d!34534))

(declare-fun m!162755 () Bool)

(assert (=> bs!8430 m!162755))

(assert (=> b!109349 d!34534))

(declare-fun d!34536 () Bool)

(declare-fun lt!165805 () tuple2!9108)

(assert (=> d!34536 (= lt!165805 (readBit!0 (BitStream!4015 (buf!2661 (_2!4803 lt!165259)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305))))))

(assert (=> d!34536 (= (readBitPure!0 (BitStream!4015 (buf!2661 (_2!4803 lt!165259)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305))) (tuple2!9097 (_2!4811 lt!165805) (_1!4811 lt!165805)))))

(declare-fun bs!8431 () Bool)

(assert (= bs!8431 d!34536))

(declare-fun m!162757 () Bool)

(assert (=> bs!8431 m!162757))

(assert (=> b!109349 d!34536))

(declare-fun d!34538 () Bool)

(assert (=> d!34538 (isPrefixOf!0 thiss!1305 (_2!4803 lt!165259))))

(declare-fun lt!165808 () Unit!6681)

(declare-fun choose!30 (BitStream!4014 BitStream!4014 BitStream!4014) Unit!6681)

(assert (=> d!34538 (= lt!165808 (choose!30 thiss!1305 (_2!4803 lt!165278) (_2!4803 lt!165259)))))

(assert (=> d!34538 (isPrefixOf!0 thiss!1305 (_2!4803 lt!165278))))

(assert (=> d!34538 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4803 lt!165278) (_2!4803 lt!165259)) lt!165808)))

(declare-fun bs!8432 () Bool)

(assert (= bs!8432 d!34538))

(assert (=> bs!8432 m!162311))

(declare-fun m!162759 () Bool)

(assert (=> bs!8432 m!162759))

(assert (=> bs!8432 m!162355))

(assert (=> b!109349 d!34538))

(declare-fun b!109571 () Bool)

(declare-fun res!90420 () Bool)

(declare-fun e!71798 () Bool)

(assert (=> b!109571 (=> (not res!90420) (not e!71798))))

(declare-fun lt!165818 () tuple2!9092)

(assert (=> b!109571 (= res!90420 (isPrefixOf!0 thiss!1305 (_2!4803 lt!165818)))))

(declare-fun b!109573 () Bool)

(declare-fun e!71799 () Bool)

(declare-fun lt!165819 () tuple2!9096)

(assert (=> b!109573 (= e!71799 (= (bitIndex!0 (size!2270 (buf!2661 (_1!4805 lt!165819))) (currentByte!5197 (_1!4805 lt!165819)) (currentBit!5192 (_1!4805 lt!165819))) (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165818))) (currentByte!5197 (_2!4803 lt!165818)) (currentBit!5192 (_2!4803 lt!165818)))))))

(declare-fun d!34540 () Bool)

(assert (=> d!34540 e!71798))

(declare-fun res!90423 () Bool)

(assert (=> d!34540 (=> (not res!90423) (not e!71798))))

(assert (=> d!34540 (= res!90423 (= (size!2270 (buf!2661 thiss!1305)) (size!2270 (buf!2661 (_2!4803 lt!165818)))))))

(declare-fun choose!16 (BitStream!4014 Bool) tuple2!9092)

(assert (=> d!34540 (= lt!165818 (choose!16 thiss!1305 lt!165268))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34540 (validate_offset_bit!0 ((_ sign_extend 32) (size!2270 (buf!2661 thiss!1305))) ((_ sign_extend 32) (currentByte!5197 thiss!1305)) ((_ sign_extend 32) (currentBit!5192 thiss!1305)))))

(assert (=> d!34540 (= (appendBit!0 thiss!1305 lt!165268) lt!165818)))

(declare-fun b!109570 () Bool)

(declare-fun res!90421 () Bool)

(assert (=> b!109570 (=> (not res!90421) (not e!71798))))

(declare-fun lt!165817 () (_ BitVec 64))

(declare-fun lt!165820 () (_ BitVec 64))

(assert (=> b!109570 (= res!90421 (= (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165818))) (currentByte!5197 (_2!4803 lt!165818)) (currentBit!5192 (_2!4803 lt!165818))) (bvadd lt!165817 lt!165820)))))

(assert (=> b!109570 (or (not (= (bvand lt!165817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165820 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165817 lt!165820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109570 (= lt!165820 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!109570 (= lt!165817 (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)))))

(declare-fun b!109572 () Bool)

(assert (=> b!109572 (= e!71798 e!71799)))

(declare-fun res!90422 () Bool)

(assert (=> b!109572 (=> (not res!90422) (not e!71799))))

(assert (=> b!109572 (= res!90422 (and (= (_2!4805 lt!165819) lt!165268) (= (_1!4805 lt!165819) (_2!4803 lt!165818))))))

(assert (=> b!109572 (= lt!165819 (readBitPure!0 (readerFrom!0 (_2!4803 lt!165818) (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305))))))

(assert (= (and d!34540 res!90423) b!109570))

(assert (= (and b!109570 res!90421) b!109571))

(assert (= (and b!109571 res!90420) b!109572))

(assert (= (and b!109572 res!90422) b!109573))

(declare-fun m!162761 () Bool)

(assert (=> b!109571 m!162761))

(declare-fun m!162763 () Bool)

(assert (=> b!109573 m!162763))

(declare-fun m!162765 () Bool)

(assert (=> b!109573 m!162765))

(declare-fun m!162767 () Bool)

(assert (=> b!109572 m!162767))

(assert (=> b!109572 m!162767))

(declare-fun m!162769 () Bool)

(assert (=> b!109572 m!162769))

(assert (=> b!109570 m!162765))

(assert (=> b!109570 m!162325))

(declare-fun m!162771 () Bool)

(assert (=> d!34540 m!162771))

(declare-fun m!162773 () Bool)

(assert (=> d!34540 m!162773))

(assert (=> b!109349 d!34540))

(declare-fun d!34542 () Bool)

(declare-fun res!90432 () Bool)

(declare-fun e!71805 () Bool)

(assert (=> d!34542 (=> (not res!90432) (not e!71805))))

(assert (=> d!34542 (= res!90432 (= (size!2270 (buf!2661 thiss!1305)) (size!2270 (buf!2661 (_2!4803 lt!165259)))))))

(assert (=> d!34542 (= (isPrefixOf!0 thiss!1305 (_2!4803 lt!165259)) e!71805)))

(declare-fun b!109580 () Bool)

(declare-fun res!90430 () Bool)

(assert (=> b!109580 (=> (not res!90430) (not e!71805))))

(assert (=> b!109580 (= res!90430 (bvsle (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)) (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165259))) (currentByte!5197 (_2!4803 lt!165259)) (currentBit!5192 (_2!4803 lt!165259)))))))

(declare-fun b!109581 () Bool)

(declare-fun e!71804 () Bool)

(assert (=> b!109581 (= e!71805 e!71804)))

(declare-fun res!90431 () Bool)

(assert (=> b!109581 (=> res!90431 e!71804)))

(assert (=> b!109581 (= res!90431 (= (size!2270 (buf!2661 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!109582 () Bool)

(assert (=> b!109582 (= e!71804 (arrayBitRangesEq!0 (buf!2661 thiss!1305) (buf!2661 (_2!4803 lt!165259)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305))))))

(assert (= (and d!34542 res!90432) b!109580))

(assert (= (and b!109580 res!90430) b!109581))

(assert (= (and b!109581 (not res!90431)) b!109582))

(assert (=> b!109580 m!162325))

(assert (=> b!109580 m!162345))

(assert (=> b!109582 m!162325))

(assert (=> b!109582 m!162325))

(declare-fun m!162775 () Bool)

(assert (=> b!109582 m!162775))

(assert (=> b!109349 d!34542))

(declare-fun d!34544 () Bool)

(assert (=> d!34544 (= (array_inv!2072 (buf!2661 thiss!1305)) (bvsge (size!2270 (buf!2661 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!109353 d!34544))

(declare-fun d!34546 () Bool)

(assert (=> d!34546 (= (invariant!0 (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305) (size!2270 (buf!2661 (_2!4803 lt!165278)))) (and (bvsge (currentBit!5192 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5192 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5197 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5197 thiss!1305) (size!2270 (buf!2661 (_2!4803 lt!165278)))) (and (= (currentBit!5192 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5197 thiss!1305) (size!2270 (buf!2661 (_2!4803 lt!165278))))))))))

(assert (=> b!109351 d!34546))

(declare-fun d!34548 () Bool)

(declare-fun e!71808 () Bool)

(assert (=> d!34548 e!71808))

(declare-fun res!90435 () Bool)

(assert (=> d!34548 (=> (not res!90435) (not e!71808))))

(declare-fun lt!165825 () BitStream!4014)

(declare-fun lt!165826 () (_ BitVec 64))

(assert (=> d!34548 (= res!90435 (= (bvadd lt!165826 (bvsub lt!165265 lt!165280)) (bitIndex!0 (size!2270 (buf!2661 lt!165825)) (currentByte!5197 lt!165825) (currentBit!5192 lt!165825))))))

(assert (=> d!34548 (or (not (= (bvand lt!165826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165265 lt!165280) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165826 (bvsub lt!165265 lt!165280)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34548 (= lt!165826 (bitIndex!0 (size!2270 (buf!2661 (_2!4804 lt!165255))) (currentByte!5197 (_2!4804 lt!165255)) (currentBit!5192 (_2!4804 lt!165255))))))

(declare-fun moveBitIndex!0 (BitStream!4014 (_ BitVec 64)) tuple2!9092)

(assert (=> d!34548 (= lt!165825 (_2!4803 (moveBitIndex!0 (_2!4804 lt!165255) (bvsub lt!165265 lt!165280))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4014 (_ BitVec 64)) Bool)

(assert (=> d!34548 (moveBitIndexPrecond!0 (_2!4804 lt!165255) (bvsub lt!165265 lt!165280))))

(assert (=> d!34548 (= (withMovedBitIndex!0 (_2!4804 lt!165255) (bvsub lt!165265 lt!165280)) lt!165825)))

(declare-fun b!109585 () Bool)

(assert (=> b!109585 (= e!71808 (= (size!2270 (buf!2661 (_2!4804 lt!165255))) (size!2270 (buf!2661 lt!165825))))))

(assert (= (and d!34548 res!90435) b!109585))

(declare-fun m!162777 () Bool)

(assert (=> d!34548 m!162777))

(declare-fun m!162779 () Bool)

(assert (=> d!34548 m!162779))

(declare-fun m!162781 () Bool)

(assert (=> d!34548 m!162781))

(declare-fun m!162783 () Bool)

(assert (=> d!34548 m!162783))

(assert (=> b!109352 d!34548))

(declare-fun d!34550 () Bool)

(declare-fun e!71809 () Bool)

(assert (=> d!34550 e!71809))

(declare-fun res!90437 () Bool)

(assert (=> d!34550 (=> (not res!90437) (not e!71809))))

(declare-fun lt!165830 () (_ BitVec 64))

(declare-fun lt!165827 () (_ BitVec 64))

(declare-fun lt!165831 () (_ BitVec 64))

(assert (=> d!34550 (= res!90437 (= lt!165830 (bvsub lt!165827 lt!165831)))))

(assert (=> d!34550 (or (= (bvand lt!165827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165827 lt!165831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34550 (= lt!165831 (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165278)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165278))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165278)))))))

(declare-fun lt!165829 () (_ BitVec 64))

(declare-fun lt!165832 () (_ BitVec 64))

(assert (=> d!34550 (= lt!165827 (bvmul lt!165829 lt!165832))))

(assert (=> d!34550 (or (= lt!165829 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165832 (bvsdiv (bvmul lt!165829 lt!165832) lt!165829)))))

(assert (=> d!34550 (= lt!165832 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34550 (= lt!165829 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165278)))))))

(assert (=> d!34550 (= lt!165830 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165278))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165278)))))))

(assert (=> d!34550 (invariant!0 (currentBit!5192 (_2!4803 lt!165278)) (currentByte!5197 (_2!4803 lt!165278)) (size!2270 (buf!2661 (_2!4803 lt!165278))))))

(assert (=> d!34550 (= (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278))) lt!165830)))

(declare-fun b!109586 () Bool)

(declare-fun res!90436 () Bool)

(assert (=> b!109586 (=> (not res!90436) (not e!71809))))

(assert (=> b!109586 (= res!90436 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165830))))

(declare-fun b!109587 () Bool)

(declare-fun lt!165828 () (_ BitVec 64))

(assert (=> b!109587 (= e!71809 (bvsle lt!165830 (bvmul lt!165828 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109587 (or (= lt!165828 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165828 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165828)))))

(assert (=> b!109587 (= lt!165828 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165278)))))))

(assert (= (and d!34550 res!90437) b!109586))

(assert (= (and b!109586 res!90436) b!109587))

(declare-fun m!162785 () Bool)

(assert (=> d!34550 m!162785))

(assert (=> d!34550 m!162443))

(assert (=> b!109352 d!34550))

(declare-fun d!34552 () Bool)

(declare-fun e!71810 () Bool)

(assert (=> d!34552 e!71810))

(declare-fun res!90439 () Bool)

(assert (=> d!34552 (=> (not res!90439) (not e!71810))))

(declare-fun lt!165833 () (_ BitVec 64))

(declare-fun lt!165837 () (_ BitVec 64))

(declare-fun lt!165836 () (_ BitVec 64))

(assert (=> d!34552 (= res!90439 (= lt!165836 (bvsub lt!165833 lt!165837)))))

(assert (=> d!34552 (or (= (bvand lt!165833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165837 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165833 lt!165837) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34552 (= lt!165837 (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))) ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165259))) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165259)))))))

(declare-fun lt!165835 () (_ BitVec 64))

(declare-fun lt!165838 () (_ BitVec 64))

(assert (=> d!34552 (= lt!165833 (bvmul lt!165835 lt!165838))))

(assert (=> d!34552 (or (= lt!165835 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165838 (bvsdiv (bvmul lt!165835 lt!165838) lt!165835)))))

(assert (=> d!34552 (= lt!165838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34552 (= lt!165835 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))))))

(assert (=> d!34552 (= lt!165836 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5197 (_2!4803 lt!165259))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5192 (_2!4803 lt!165259)))))))

(assert (=> d!34552 (invariant!0 (currentBit!5192 (_2!4803 lt!165259)) (currentByte!5197 (_2!4803 lt!165259)) (size!2270 (buf!2661 (_2!4803 lt!165259))))))

(assert (=> d!34552 (= (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165259))) (currentByte!5197 (_2!4803 lt!165259)) (currentBit!5192 (_2!4803 lt!165259))) lt!165836)))

(declare-fun b!109588 () Bool)

(declare-fun res!90438 () Bool)

(assert (=> b!109588 (=> (not res!90438) (not e!71810))))

(assert (=> b!109588 (= res!90438 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165836))))

(declare-fun b!109589 () Bool)

(declare-fun lt!165834 () (_ BitVec 64))

(assert (=> b!109589 (= e!71810 (bvsle lt!165836 (bvmul lt!165834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109589 (or (= lt!165834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165834)))))

(assert (=> b!109589 (= lt!165834 ((_ sign_extend 32) (size!2270 (buf!2661 (_2!4803 lt!165259)))))))

(assert (= (and d!34552 res!90439) b!109588))

(assert (= (and b!109588 res!90438) b!109589))

(declare-fun m!162787 () Bool)

(assert (=> d!34552 m!162787))

(declare-fun m!162789 () Bool)

(assert (=> d!34552 m!162789))

(assert (=> b!109352 d!34552))

(declare-fun d!34554 () Bool)

(declare-fun e!71811 () Bool)

(assert (=> d!34554 e!71811))

(declare-fun res!90440 () Bool)

(assert (=> d!34554 (=> (not res!90440) (not e!71811))))

(declare-fun lt!165840 () (_ BitVec 64))

(declare-fun lt!165839 () BitStream!4014)

(assert (=> d!34554 (= res!90440 (= (bvadd lt!165840 (bvsub lt!165270 lt!165280)) (bitIndex!0 (size!2270 (buf!2661 lt!165839)) (currentByte!5197 lt!165839) (currentBit!5192 lt!165839))))))

(assert (=> d!34554 (or (not (= (bvand lt!165840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165270 lt!165280) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165840 (bvsub lt!165270 lt!165280)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34554 (= lt!165840 (bitIndex!0 (size!2270 (buf!2661 (_2!4804 lt!165281))) (currentByte!5197 (_2!4804 lt!165281)) (currentBit!5192 (_2!4804 lt!165281))))))

(assert (=> d!34554 (= lt!165839 (_2!4803 (moveBitIndex!0 (_2!4804 lt!165281) (bvsub lt!165270 lt!165280))))))

(assert (=> d!34554 (moveBitIndexPrecond!0 (_2!4804 lt!165281) (bvsub lt!165270 lt!165280))))

(assert (=> d!34554 (= (withMovedBitIndex!0 (_2!4804 lt!165281) (bvsub lt!165270 lt!165280)) lt!165839)))

(declare-fun b!109590 () Bool)

(assert (=> b!109590 (= e!71811 (= (size!2270 (buf!2661 (_2!4804 lt!165281))) (size!2270 (buf!2661 lt!165839))))))

(assert (= (and d!34554 res!90440) b!109590))

(declare-fun m!162791 () Bool)

(assert (=> d!34554 m!162791))

(declare-fun m!162793 () Bool)

(assert (=> d!34554 m!162793))

(declare-fun m!162795 () Bool)

(assert (=> d!34554 m!162795))

(declare-fun m!162797 () Bool)

(assert (=> d!34554 m!162797))

(assert (=> b!109352 d!34554))

(declare-fun d!34556 () Bool)

(declare-fun lt!165841 () tuple2!9110)

(assert (=> d!34556 (= lt!165841 (readNLeastSignificantBitsLoop!0 lt!165258 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165261))))

(assert (=> d!34556 (= (readNLeastSignificantBitsLoopPure!0 lt!165258 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!165261) (tuple2!9099 (_2!4812 lt!165841) (_1!4812 lt!165841)))))

(declare-fun bs!8433 () Bool)

(assert (= bs!8433 d!34556))

(declare-fun m!162799 () Bool)

(assert (=> bs!8433 m!162799))

(assert (=> b!109352 d!34556))

(declare-fun d!34558 () Bool)

(declare-fun e!71812 () Bool)

(assert (=> d!34558 e!71812))

(declare-fun res!90441 () Bool)

(assert (=> d!34558 (=> (not res!90441) (not e!71812))))

(declare-fun lt!165843 () (_ BitVec 64))

(declare-fun lt!165842 () BitStream!4014)

(assert (=> d!34558 (= res!90441 (= (bvadd lt!165843 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2270 (buf!2661 lt!165842)) (currentByte!5197 lt!165842) (currentBit!5192 lt!165842))))))

(assert (=> d!34558 (or (not (= (bvand lt!165843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!165843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!165843 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34558 (= lt!165843 (bitIndex!0 (size!2270 (buf!2661 (_1!4804 lt!165281))) (currentByte!5197 (_1!4804 lt!165281)) (currentBit!5192 (_1!4804 lt!165281))))))

(assert (=> d!34558 (= lt!165842 (_2!4803 (moveBitIndex!0 (_1!4804 lt!165281) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!34558 (moveBitIndexPrecond!0 (_1!4804 lt!165281) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!34558 (= (withMovedBitIndex!0 (_1!4804 lt!165281) #b0000000000000000000000000000000000000000000000000000000000000001) lt!165842)))

(declare-fun b!109591 () Bool)

(assert (=> b!109591 (= e!71812 (= (size!2270 (buf!2661 (_1!4804 lt!165281))) (size!2270 (buf!2661 lt!165842))))))

(assert (= (and d!34558 res!90441) b!109591))

(declare-fun m!162801 () Bool)

(assert (=> d!34558 m!162801))

(declare-fun m!162803 () Bool)

(assert (=> d!34558 m!162803))

(declare-fun m!162805 () Bool)

(assert (=> d!34558 m!162805))

(declare-fun m!162807 () Bool)

(assert (=> d!34558 m!162807))

(assert (=> b!109352 d!34558))

(declare-fun d!34560 () Bool)

(declare-fun lt!165856 () tuple2!9098)

(declare-fun lt!165860 () tuple2!9098)

(assert (=> d!34560 (and (= (_2!4806 lt!165856) (_2!4806 lt!165860)) (= (_1!4806 lt!165856) (_1!4806 lt!165860)))))

(declare-fun lt!165857 () Unit!6681)

(declare-fun lt!165859 () Bool)

(declare-fun lt!165858 () BitStream!4014)

(declare-fun lt!165861 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9098 tuple2!9098 BitStream!4014 (_ BitVec 64) Bool BitStream!4014 (_ BitVec 64) tuple2!9098 tuple2!9098 BitStream!4014 (_ BitVec 64)) Unit!6681)

(assert (=> d!34560 (= lt!165857 (choose!45 (_1!4804 lt!165281) nBits!396 i!615 lt!165253 lt!165856 (tuple2!9099 (_1!4806 lt!165856) (_2!4806 lt!165856)) (_1!4806 lt!165856) (_2!4806 lt!165856) lt!165859 lt!165858 lt!165861 lt!165860 (tuple2!9099 (_1!4806 lt!165860) (_2!4806 lt!165860)) (_1!4806 lt!165860) (_2!4806 lt!165860)))))

(assert (=> d!34560 (= lt!165860 (readNLeastSignificantBitsLoopPure!0 lt!165858 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!165861))))

(assert (=> d!34560 (= lt!165861 (bvor lt!165253 (ite lt!165859 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34560 (= lt!165858 (withMovedBitIndex!0 (_1!4804 lt!165281) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!34560 (= lt!165859 (_2!4805 (readBitPure!0 (_1!4804 lt!165281))))))

(assert (=> d!34560 (= lt!165856 (readNLeastSignificantBitsLoopPure!0 (_1!4804 lt!165281) nBits!396 i!615 lt!165253))))

(assert (=> d!34560 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4804 lt!165281) nBits!396 i!615 lt!165253) lt!165857)))

(declare-fun bs!8435 () Bool)

(assert (= bs!8435 d!34560))

(declare-fun m!162809 () Bool)

(assert (=> bs!8435 m!162809))

(assert (=> bs!8435 m!162351))

(assert (=> bs!8435 m!162315))

(assert (=> bs!8435 m!162305))

(declare-fun m!162811 () Bool)

(assert (=> bs!8435 m!162811))

(assert (=> b!109352 d!34560))

(declare-fun d!34562 () Bool)

(declare-fun e!71813 () Bool)

(assert (=> d!34562 e!71813))

(declare-fun res!90443 () Bool)

(assert (=> d!34562 (=> (not res!90443) (not e!71813))))

(declare-fun lt!165862 () (_ BitVec 64))

(declare-fun lt!165865 () (_ BitVec 64))

(declare-fun lt!165866 () (_ BitVec 64))

(assert (=> d!34562 (= res!90443 (= lt!165865 (bvsub lt!165862 lt!165866)))))

(assert (=> d!34562 (or (= (bvand lt!165862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!165866 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!165862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!165862 lt!165866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34562 (= lt!165866 (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 thiss!1305))) ((_ sign_extend 32) (currentByte!5197 thiss!1305)) ((_ sign_extend 32) (currentBit!5192 thiss!1305))))))

(declare-fun lt!165864 () (_ BitVec 64))

(declare-fun lt!165867 () (_ BitVec 64))

(assert (=> d!34562 (= lt!165862 (bvmul lt!165864 lt!165867))))

(assert (=> d!34562 (or (= lt!165864 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!165867 (bvsdiv (bvmul lt!165864 lt!165867) lt!165864)))))

(assert (=> d!34562 (= lt!165867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34562 (= lt!165864 ((_ sign_extend 32) (size!2270 (buf!2661 thiss!1305))))))

(assert (=> d!34562 (= lt!165865 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5197 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5192 thiss!1305))))))

(assert (=> d!34562 (invariant!0 (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305) (size!2270 (buf!2661 thiss!1305)))))

(assert (=> d!34562 (= (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)) lt!165865)))

(declare-fun b!109592 () Bool)

(declare-fun res!90442 () Bool)

(assert (=> b!109592 (=> (not res!90442) (not e!71813))))

(assert (=> b!109592 (= res!90442 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!165865))))

(declare-fun b!109593 () Bool)

(declare-fun lt!165863 () (_ BitVec 64))

(assert (=> b!109593 (= e!71813 (bvsle lt!165865 (bvmul lt!165863 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!109593 (or (= lt!165863 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165863 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165863)))))

(assert (=> b!109593 (= lt!165863 ((_ sign_extend 32) (size!2270 (buf!2661 thiss!1305))))))

(assert (= (and d!34562 res!90443) b!109592))

(assert (= (and b!109592 res!90442) b!109593))

(declare-fun m!162813 () Bool)

(assert (=> d!34562 m!162813))

(assert (=> d!34562 m!162445))

(assert (=> b!109352 d!34562))

(declare-fun d!34564 () Bool)

(assert (=> d!34564 (= (invariant!0 (currentBit!5192 thiss!1305) (currentByte!5197 thiss!1305) (size!2270 (buf!2661 (_2!4803 lt!165259)))) (and (bvsge (currentBit!5192 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5192 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5197 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5197 thiss!1305) (size!2270 (buf!2661 (_2!4803 lt!165259)))) (and (= (currentBit!5192 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5197 thiss!1305) (size!2270 (buf!2661 (_2!4803 lt!165259))))))))))

(assert (=> b!109355 d!34564))

(declare-fun d!34566 () Bool)

(assert (=> d!34566 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 thiss!1305))) ((_ sign_extend 32) (currentByte!5197 thiss!1305)) ((_ sign_extend 32) (currentBit!5192 thiss!1305)) lt!165269) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 thiss!1305))) ((_ sign_extend 32) (currentByte!5197 thiss!1305)) ((_ sign_extend 32) (currentBit!5192 thiss!1305))) lt!165269))))

(declare-fun bs!8436 () Bool)

(assert (= bs!8436 d!34566))

(assert (=> bs!8436 m!162813))

(assert (=> b!109356 d!34566))

(assert (=> b!109345 d!34550))

(assert (=> b!109345 d!34562))

(declare-fun d!34568 () Bool)

(declare-fun res!90446 () Bool)

(declare-fun e!71815 () Bool)

(assert (=> d!34568 (=> (not res!90446) (not e!71815))))

(assert (=> d!34568 (= res!90446 (= (size!2270 (buf!2661 thiss!1305)) (size!2270 (buf!2661 (_2!4803 lt!165278)))))))

(assert (=> d!34568 (= (isPrefixOf!0 thiss!1305 (_2!4803 lt!165278)) e!71815)))

(declare-fun b!109594 () Bool)

(declare-fun res!90444 () Bool)

(assert (=> b!109594 (=> (not res!90444) (not e!71815))))

(assert (=> b!109594 (= res!90444 (bvsle (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305)) (bitIndex!0 (size!2270 (buf!2661 (_2!4803 lt!165278))) (currentByte!5197 (_2!4803 lt!165278)) (currentBit!5192 (_2!4803 lt!165278)))))))

(declare-fun b!109595 () Bool)

(declare-fun e!71814 () Bool)

(assert (=> b!109595 (= e!71815 e!71814)))

(declare-fun res!90445 () Bool)

(assert (=> b!109595 (=> res!90445 e!71814)))

(assert (=> b!109595 (= res!90445 (= (size!2270 (buf!2661 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!109596 () Bool)

(assert (=> b!109596 (= e!71814 (arrayBitRangesEq!0 (buf!2661 thiss!1305) (buf!2661 (_2!4803 lt!165278)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2270 (buf!2661 thiss!1305)) (currentByte!5197 thiss!1305) (currentBit!5192 thiss!1305))))))

(assert (= (and d!34568 res!90446) b!109594))

(assert (= (and b!109594 res!90444) b!109595))

(assert (= (and b!109595 (not res!90445)) b!109596))

(assert (=> b!109594 m!162325))

(assert (=> b!109594 m!162323))

(assert (=> b!109596 m!162325))

(assert (=> b!109596 m!162325))

(declare-fun m!162815 () Bool)

(assert (=> b!109596 m!162815))

(assert (=> b!109343 d!34568))

(declare-fun d!34570 () Bool)

(assert (=> d!34570 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4804 lt!165281)))) ((_ sign_extend 32) (currentByte!5197 (_1!4804 lt!165281))) ((_ sign_extend 32) (currentBit!5192 (_1!4804 lt!165281))) lt!165269) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2270 (buf!2661 (_1!4804 lt!165281)))) ((_ sign_extend 32) (currentByte!5197 (_1!4804 lt!165281))) ((_ sign_extend 32) (currentBit!5192 (_1!4804 lt!165281)))) lt!165269))))

(declare-fun bs!8437 () Bool)

(assert (= bs!8437 d!34570))

(declare-fun m!162817 () Bool)

(assert (=> bs!8437 m!162817))

(assert (=> b!109344 d!34570))

(check-sat (not b!109580) (not b!109549) (not b!109550) (not d!34446) (not d!34434) (not b!109554) (not d!34438) (not d!34538) (not d!34418) (not d!34424) (not d!34432) (not d!34554) (not b!109433) (not b!109432) (not d!34430) (not d!34416) (not bm!1377) (not d!34428) (not b!109582) (not b!109570) (not b!109559) (not d!34436) (not b!109573) (not d!34548) (not d!34560) (not b!109545) (not b!109571) (not b!109547) (not b!109553) (not b!109572) (not d!34562) (not b!109555) (not d!34532) (not b!109558) (not b!109552) (not d!34552) (not d!34556) (not b!109411) (not b!109560) (not d!34570) (not d!34566) (not d!34536) (not d!34420) (not b!109429) (not b!109548) (not d!34448) (not b!109596) (not d!34440) (not d!34444) (not d!34534) (not d!34540) (not d!34550) (not d!34442) (not b!109594) (not d!34558) (not b!109556) (not b!109431))
(check-sat)
