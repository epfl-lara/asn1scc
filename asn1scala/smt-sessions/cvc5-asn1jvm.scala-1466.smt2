; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40208 () Bool)

(assert start!40208)

(declare-fun b!184237 () Bool)

(declare-fun res!153268 () Bool)

(declare-fun e!127634 () Bool)

(assert (=> b!184237 (=> (not res!153268) (not e!127634))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!184237 (= res!153268 (not (= i!590 nBits!348)))))

(declare-fun b!184238 () Bool)

(declare-fun e!127638 () Bool)

(assert (=> b!184238 (= e!127638 true)))

(declare-datatypes ((array!9776 0))(
  ( (array!9777 (arr!5242 (Array (_ BitVec 32) (_ BitVec 8))) (size!4312 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7732 0))(
  ( (BitStream!7733 (buf!4767 array!9776) (currentByte!9001 (_ BitVec 32)) (currentBit!8996 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15932 0))(
  ( (tuple2!15933 (_1!8611 BitStream!7732) (_2!8611 (_ BitVec 64))) )
))
(declare-fun lt!283342 () tuple2!15932)

(declare-fun lt!283345 () tuple2!15932)

(assert (=> b!184238 (and (= (_2!8611 lt!283342) (_2!8611 lt!283345)) (= (_1!8611 lt!283342) (_1!8611 lt!283345)))))

(declare-datatypes ((tuple2!15934 0))(
  ( (tuple2!15935 (_1!8612 BitStream!7732) (_2!8612 BitStream!7732)) )
))
(declare-fun lt!283331 () tuple2!15934)

(declare-datatypes ((Unit!13199 0))(
  ( (Unit!13200) )
))
(declare-fun lt!283349 () Unit!13199)

(declare-fun lt!283328 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13199)

(assert (=> b!184238 (= lt!283349 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8612 lt!283331) nBits!348 i!590 lt!283328))))

(declare-fun lt!283338 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15932)

(declare-fun withMovedBitIndex!0 (BitStream!7732 (_ BitVec 64)) BitStream!7732)

(assert (=> b!184238 (= lt!283345 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8612 lt!283331) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283338))))

(declare-fun b!184239 () Bool)

(declare-fun e!127639 () Bool)

(assert (=> b!184239 (= e!127639 e!127638)))

(declare-fun res!153259 () Bool)

(assert (=> b!184239 (=> res!153259 e!127638)))

(declare-fun lt!283340 () tuple2!15934)

(assert (=> b!184239 (= res!153259 (not (= (_1!8611 (readNBitsLSBFirstsLoopPure!0 (_1!8612 lt!283340) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283338)) (_2!8612 lt!283340))))))

(declare-datatypes ((tuple2!15936 0))(
  ( (tuple2!15937 (_1!8613 Unit!13199) (_2!8613 BitStream!7732)) )
))
(declare-fun lt!283337 () tuple2!15936)

(declare-fun lt!283323 () tuple2!15936)

(declare-fun lt!283348 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184239 (validate_offset_bits!1 ((_ sign_extend 32) (size!4312 (buf!4767 (_2!8613 lt!283337)))) ((_ sign_extend 32) (currentByte!9001 (_2!8613 lt!283323))) ((_ sign_extend 32) (currentBit!8996 (_2!8613 lt!283323))) lt!283348)))

(declare-fun lt!283334 () Unit!13199)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7732 array!9776 (_ BitVec 64)) Unit!13199)

(assert (=> b!184239 (= lt!283334 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8613 lt!283323) (buf!4767 (_2!8613 lt!283337)) lt!283348))))

(assert (=> b!184239 (= lt!283348 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283326 () (_ BitVec 64))

(declare-datatypes ((tuple2!15938 0))(
  ( (tuple2!15939 (_1!8614 BitStream!7732) (_2!8614 Bool)) )
))
(declare-fun lt!283343 () tuple2!15938)

(assert (=> b!184239 (= lt!283338 (bvor lt!283328 (ite (_2!8614 lt!283343) lt!283326 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184239 (= lt!283342 (readNBitsLSBFirstsLoopPure!0 (_1!8612 lt!283331) nBits!348 i!590 lt!283328))))

(declare-fun thiss!1204 () BitStream!7732)

(declare-fun lt!283336 () (_ BitVec 64))

(assert (=> b!184239 (validate_offset_bits!1 ((_ sign_extend 32) (size!4312 (buf!4767 (_2!8613 lt!283337)))) ((_ sign_extend 32) (currentByte!9001 thiss!1204)) ((_ sign_extend 32) (currentBit!8996 thiss!1204)) lt!283336)))

(declare-fun lt!283324 () Unit!13199)

(assert (=> b!184239 (= lt!283324 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4767 (_2!8613 lt!283337)) lt!283336))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184239 (= lt!283328 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!283347 () Bool)

(assert (=> b!184239 (= (_2!8614 lt!283343) lt!283347)))

(declare-fun readBitPure!0 (BitStream!7732) tuple2!15938)

(assert (=> b!184239 (= lt!283343 (readBitPure!0 (_1!8612 lt!283331)))))

(declare-fun reader!0 (BitStream!7732 BitStream!7732) tuple2!15934)

(assert (=> b!184239 (= lt!283340 (reader!0 (_2!8613 lt!283323) (_2!8613 lt!283337)))))

(assert (=> b!184239 (= lt!283331 (reader!0 thiss!1204 (_2!8613 lt!283337)))))

(declare-fun e!127635 () Bool)

(assert (=> b!184239 e!127635))

(declare-fun res!153267 () Bool)

(assert (=> b!184239 (=> (not res!153267) (not e!127635))))

(declare-fun lt!283330 () tuple2!15938)

(declare-fun lt!283327 () tuple2!15938)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184239 (= res!153267 (= (bitIndex!0 (size!4312 (buf!4767 (_1!8614 lt!283330))) (currentByte!9001 (_1!8614 lt!283330)) (currentBit!8996 (_1!8614 lt!283330))) (bitIndex!0 (size!4312 (buf!4767 (_1!8614 lt!283327))) (currentByte!9001 (_1!8614 lt!283327)) (currentBit!8996 (_1!8614 lt!283327)))))))

(declare-fun lt!283344 () Unit!13199)

(declare-fun lt!283341 () BitStream!7732)

(declare-fun readBitPrefixLemma!0 (BitStream!7732 BitStream!7732) Unit!13199)

(assert (=> b!184239 (= lt!283344 (readBitPrefixLemma!0 lt!283341 (_2!8613 lt!283337)))))

(assert (=> b!184239 (= lt!283327 (readBitPure!0 (BitStream!7733 (buf!4767 (_2!8613 lt!283337)) (currentByte!9001 thiss!1204) (currentBit!8996 thiss!1204))))))

(assert (=> b!184239 (= lt!283330 (readBitPure!0 lt!283341))))

(declare-fun e!127632 () Bool)

(assert (=> b!184239 e!127632))

(declare-fun res!153261 () Bool)

(assert (=> b!184239 (=> (not res!153261) (not e!127632))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184239 (= res!153261 (invariant!0 (currentBit!8996 thiss!1204) (currentByte!9001 thiss!1204) (size!4312 (buf!4767 (_2!8613 lt!283323)))))))

(assert (=> b!184239 (= lt!283341 (BitStream!7733 (buf!4767 (_2!8613 lt!283323)) (currentByte!9001 thiss!1204) (currentBit!8996 thiss!1204)))))

(declare-fun b!184240 () Bool)

(assert (=> b!184240 (= e!127632 (invariant!0 (currentBit!8996 thiss!1204) (currentByte!9001 thiss!1204) (size!4312 (buf!4767 (_2!8613 lt!283337)))))))

(declare-fun b!184241 () Bool)

(declare-fun res!153270 () Bool)

(assert (=> b!184241 (=> res!153270 e!127639)))

(assert (=> b!184241 (= res!153270 (not (invariant!0 (currentBit!8996 (_2!8613 lt!283337)) (currentByte!9001 (_2!8613 lt!283337)) (size!4312 (buf!4767 (_2!8613 lt!283337))))))))

(declare-fun b!184242 () Bool)

(declare-fun e!127633 () Bool)

(declare-fun lt!283332 () tuple2!15938)

(declare-fun lt!283333 () (_ BitVec 64))

(assert (=> b!184242 (= e!127633 (= (bitIndex!0 (size!4312 (buf!4767 (_1!8614 lt!283332))) (currentByte!9001 (_1!8614 lt!283332)) (currentBit!8996 (_1!8614 lt!283332))) lt!283333))))

(declare-fun b!184243 () Bool)

(declare-fun res!153265 () Bool)

(assert (=> b!184243 (=> res!153265 e!127639)))

(declare-fun lt!283335 () (_ BitVec 64))

(declare-fun lt!283346 () (_ BitVec 64))

(assert (=> b!184243 (= res!153265 (or (not (= (size!4312 (buf!4767 (_2!8613 lt!283337))) (size!4312 (buf!4767 thiss!1204)))) (not (= lt!283346 (bvsub (bvadd lt!283335 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184244 () Bool)

(assert (=> b!184244 (= e!127635 (= (_2!8614 lt!283330) (_2!8614 lt!283327)))))

(declare-fun b!184245 () Bool)

(declare-fun e!127636 () Bool)

(assert (=> b!184245 (= e!127636 e!127633)))

(declare-fun res!153263 () Bool)

(assert (=> b!184245 (=> (not res!153263) (not e!127633))))

(assert (=> b!184245 (= res!153263 (and (= (_2!8614 lt!283332) lt!283347) (= (_1!8614 lt!283332) (_2!8613 lt!283323))))))

(declare-fun readerFrom!0 (BitStream!7732 (_ BitVec 32) (_ BitVec 32)) BitStream!7732)

(assert (=> b!184245 (= lt!283332 (readBitPure!0 (readerFrom!0 (_2!8613 lt!283323) (currentBit!8996 thiss!1204) (currentByte!9001 thiss!1204))))))

(declare-fun b!184246 () Bool)

(declare-fun e!127642 () Bool)

(assert (=> b!184246 (= e!127642 e!127636)))

(declare-fun res!153258 () Bool)

(assert (=> b!184246 (=> (not res!153258) (not e!127636))))

(declare-fun lt!283329 () (_ BitVec 64))

(assert (=> b!184246 (= res!153258 (= lt!283333 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283329)))))

(assert (=> b!184246 (= lt!283333 (bitIndex!0 (size!4312 (buf!4767 (_2!8613 lt!283323))) (currentByte!9001 (_2!8613 lt!283323)) (currentBit!8996 (_2!8613 lt!283323))))))

(assert (=> b!184246 (= lt!283329 (bitIndex!0 (size!4312 (buf!4767 thiss!1204)) (currentByte!9001 thiss!1204) (currentBit!8996 thiss!1204)))))

(declare-fun b!184247 () Bool)

(declare-fun res!153273 () Bool)

(assert (=> b!184247 (=> (not res!153273) (not e!127634))))

(assert (=> b!184247 (= res!153273 (invariant!0 (currentBit!8996 thiss!1204) (currentByte!9001 thiss!1204) (size!4312 (buf!4767 thiss!1204))))))

(declare-fun b!184249 () Bool)

(declare-fun res!153272 () Bool)

(assert (=> b!184249 (=> res!153272 e!127639)))

(declare-fun isPrefixOf!0 (BitStream!7732 BitStream!7732) Bool)

(assert (=> b!184249 (= res!153272 (not (isPrefixOf!0 thiss!1204 (_2!8613 lt!283323))))))

(declare-fun b!184250 () Bool)

(declare-fun e!127641 () Bool)

(assert (=> b!184250 (= e!127641 e!127634)))

(declare-fun res!153264 () Bool)

(assert (=> b!184250 (=> (not res!153264) (not e!127634))))

(assert (=> b!184250 (= res!153264 (validate_offset_bits!1 ((_ sign_extend 32) (size!4312 (buf!4767 thiss!1204))) ((_ sign_extend 32) (currentByte!9001 thiss!1204)) ((_ sign_extend 32) (currentBit!8996 thiss!1204)) lt!283336))))

(assert (=> b!184250 (= lt!283336 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184251 () Bool)

(declare-fun e!127640 () Bool)

(assert (=> b!184251 (= e!127634 (not e!127640))))

(declare-fun res!153271 () Bool)

(assert (=> b!184251 (=> res!153271 e!127640)))

(declare-fun lt!283325 () (_ BitVec 64))

(assert (=> b!184251 (= res!153271 (not (= lt!283325 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283335))))))

(assert (=> b!184251 (= lt!283325 (bitIndex!0 (size!4312 (buf!4767 (_2!8613 lt!283323))) (currentByte!9001 (_2!8613 lt!283323)) (currentBit!8996 (_2!8613 lt!283323))))))

(assert (=> b!184251 (= lt!283335 (bitIndex!0 (size!4312 (buf!4767 thiss!1204)) (currentByte!9001 thiss!1204) (currentBit!8996 thiss!1204)))))

(assert (=> b!184251 e!127642))

(declare-fun res!153260 () Bool)

(assert (=> b!184251 (=> (not res!153260) (not e!127642))))

(assert (=> b!184251 (= res!153260 (= (size!4312 (buf!4767 thiss!1204)) (size!4312 (buf!4767 (_2!8613 lt!283323)))))))

(declare-fun appendBit!0 (BitStream!7732 Bool) tuple2!15936)

(assert (=> b!184251 (= lt!283323 (appendBit!0 thiss!1204 lt!283347))))

(assert (=> b!184251 (= lt!283347 (not (= (bvand v!189 lt!283326) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184251 (= lt!283326 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184252 () Bool)

(declare-fun res!153257 () Bool)

(assert (=> b!184252 (=> (not res!153257) (not e!127636))))

(assert (=> b!184252 (= res!153257 (isPrefixOf!0 thiss!1204 (_2!8613 lt!283323)))))

(declare-fun b!184253 () Bool)

(assert (=> b!184253 (= e!127640 e!127639)))

(declare-fun res!153266 () Bool)

(assert (=> b!184253 (=> res!153266 e!127639)))

(assert (=> b!184253 (= res!153266 (not (= lt!283346 (bvsub (bvsub (bvadd lt!283325 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!184253 (= lt!283346 (bitIndex!0 (size!4312 (buf!4767 (_2!8613 lt!283337))) (currentByte!9001 (_2!8613 lt!283337)) (currentBit!8996 (_2!8613 lt!283337))))))

(assert (=> b!184253 (isPrefixOf!0 thiss!1204 (_2!8613 lt!283337))))

(declare-fun lt!283339 () Unit!13199)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7732 BitStream!7732 BitStream!7732) Unit!13199)

(assert (=> b!184253 (= lt!283339 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8613 lt!283323) (_2!8613 lt!283337)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7732 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15936)

(assert (=> b!184253 (= lt!283337 (appendBitsLSBFirstLoopTR!0 (_2!8613 lt!283323) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184254 () Bool)

(declare-fun res!153262 () Bool)

(assert (=> b!184254 (=> res!153262 e!127639)))

(assert (=> b!184254 (= res!153262 (not (isPrefixOf!0 (_2!8613 lt!283323) (_2!8613 lt!283337))))))

(declare-fun b!184248 () Bool)

(declare-fun e!127631 () Bool)

(declare-fun array_inv!4053 (array!9776) Bool)

(assert (=> b!184248 (= e!127631 (array_inv!4053 (buf!4767 thiss!1204)))))

(declare-fun res!153269 () Bool)

(assert (=> start!40208 (=> (not res!153269) (not e!127641))))

(assert (=> start!40208 (= res!153269 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40208 e!127641))

(assert (=> start!40208 true))

(declare-fun inv!12 (BitStream!7732) Bool)

(assert (=> start!40208 (and (inv!12 thiss!1204) e!127631)))

(assert (= (and start!40208 res!153269) b!184250))

(assert (= (and b!184250 res!153264) b!184247))

(assert (= (and b!184247 res!153273) b!184237))

(assert (= (and b!184237 res!153268) b!184251))

(assert (= (and b!184251 res!153260) b!184246))

(assert (= (and b!184246 res!153258) b!184252))

(assert (= (and b!184252 res!153257) b!184245))

(assert (= (and b!184245 res!153263) b!184242))

(assert (= (and b!184251 (not res!153271)) b!184253))

(assert (= (and b!184253 (not res!153266)) b!184241))

(assert (= (and b!184241 (not res!153270)) b!184243))

(assert (= (and b!184243 (not res!153265)) b!184254))

(assert (= (and b!184254 (not res!153262)) b!184249))

(assert (= (and b!184249 (not res!153272)) b!184239))

(assert (= (and b!184239 res!153261) b!184240))

(assert (= (and b!184239 res!153267) b!184244))

(assert (= (and b!184239 (not res!153259)) b!184238))

(assert (= start!40208 b!184248))

(declare-fun m!286285 () Bool)

(assert (=> b!184253 m!286285))

(declare-fun m!286287 () Bool)

(assert (=> b!184253 m!286287))

(declare-fun m!286289 () Bool)

(assert (=> b!184253 m!286289))

(declare-fun m!286291 () Bool)

(assert (=> b!184253 m!286291))

(declare-fun m!286293 () Bool)

(assert (=> b!184249 m!286293))

(declare-fun m!286295 () Bool)

(assert (=> b!184248 m!286295))

(declare-fun m!286297 () Bool)

(assert (=> b!184251 m!286297))

(declare-fun m!286299 () Bool)

(assert (=> b!184251 m!286299))

(declare-fun m!286301 () Bool)

(assert (=> b!184251 m!286301))

(declare-fun m!286303 () Bool)

(assert (=> b!184241 m!286303))

(declare-fun m!286305 () Bool)

(assert (=> b!184238 m!286305))

(declare-fun m!286307 () Bool)

(assert (=> b!184238 m!286307))

(assert (=> b!184238 m!286307))

(declare-fun m!286309 () Bool)

(assert (=> b!184238 m!286309))

(assert (=> b!184252 m!286293))

(assert (=> b!184246 m!286297))

(assert (=> b!184246 m!286299))

(declare-fun m!286311 () Bool)

(assert (=> b!184245 m!286311))

(assert (=> b!184245 m!286311))

(declare-fun m!286313 () Bool)

(assert (=> b!184245 m!286313))

(declare-fun m!286315 () Bool)

(assert (=> b!184239 m!286315))

(declare-fun m!286317 () Bool)

(assert (=> b!184239 m!286317))

(declare-fun m!286319 () Bool)

(assert (=> b!184239 m!286319))

(declare-fun m!286321 () Bool)

(assert (=> b!184239 m!286321))

(declare-fun m!286323 () Bool)

(assert (=> b!184239 m!286323))

(declare-fun m!286325 () Bool)

(assert (=> b!184239 m!286325))

(declare-fun m!286327 () Bool)

(assert (=> b!184239 m!286327))

(declare-fun m!286329 () Bool)

(assert (=> b!184239 m!286329))

(declare-fun m!286331 () Bool)

(assert (=> b!184239 m!286331))

(declare-fun m!286333 () Bool)

(assert (=> b!184239 m!286333))

(declare-fun m!286335 () Bool)

(assert (=> b!184239 m!286335))

(declare-fun m!286337 () Bool)

(assert (=> b!184239 m!286337))

(declare-fun m!286339 () Bool)

(assert (=> b!184239 m!286339))

(declare-fun m!286341 () Bool)

(assert (=> b!184239 m!286341))

(declare-fun m!286343 () Bool)

(assert (=> b!184239 m!286343))

(declare-fun m!286345 () Bool)

(assert (=> b!184239 m!286345))

(declare-fun m!286347 () Bool)

(assert (=> b!184247 m!286347))

(declare-fun m!286349 () Bool)

(assert (=> b!184240 m!286349))

(declare-fun m!286351 () Bool)

(assert (=> b!184242 m!286351))

(declare-fun m!286353 () Bool)

(assert (=> b!184254 m!286353))

(declare-fun m!286355 () Bool)

(assert (=> b!184250 m!286355))

(declare-fun m!286357 () Bool)

(assert (=> start!40208 m!286357))

(push 1)

