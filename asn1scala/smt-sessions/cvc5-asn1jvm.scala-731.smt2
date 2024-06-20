; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20362 () Bool)

(assert start!20362)

(declare-fun b!102498 () Bool)

(declare-fun res!84286 () Bool)

(declare-fun e!67078 () Bool)

(assert (=> b!102498 (=> (not res!84286) (not e!67078))))

(declare-datatypes ((array!4806 0))(
  ( (array!4807 (arr!2787 (Array (_ BitVec 32) (_ BitVec 8))) (size!2194 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3862 0))(
  ( (BitStream!3863 (buf!2554 array!4806) (currentByte!5027 (_ BitVec 32)) (currentBit!5022 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3862)

(declare-datatypes ((Unit!6284 0))(
  ( (Unit!6285) )
))
(declare-datatypes ((tuple2!8374 0))(
  ( (tuple2!8375 (_1!4442 Unit!6284) (_2!4442 BitStream!3862)) )
))
(declare-fun lt!149083 () tuple2!8374)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102498 (= res!84286 (invariant!0 (currentBit!5022 thiss!1305) (currentByte!5027 thiss!1305) (size!2194 (buf!2554 (_2!4442 lt!149083)))))))

(declare-fun res!84293 () Bool)

(declare-fun e!67076 () Bool)

(assert (=> start!20362 (=> (not res!84293) (not e!67076))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20362 (= res!84293 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20362 e!67076))

(assert (=> start!20362 true))

(declare-fun e!67077 () Bool)

(declare-fun inv!12 (BitStream!3862) Bool)

(assert (=> start!20362 (and (inv!12 thiss!1305) e!67077)))

(declare-fun b!102499 () Bool)

(declare-fun res!84294 () Bool)

(declare-fun e!67081 () Bool)

(assert (=> b!102499 (=> (not res!84294) (not e!67081))))

(assert (=> b!102499 (= res!84294 (bvslt i!615 nBits!396))))

(declare-fun b!102500 () Bool)

(assert (=> b!102500 (= e!67076 e!67081)))

(declare-fun res!84287 () Bool)

(assert (=> b!102500 (=> (not res!84287) (not e!67081))))

(declare-fun lt!149097 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102500 (= res!84287 (validate_offset_bits!1 ((_ sign_extend 32) (size!2194 (buf!2554 thiss!1305))) ((_ sign_extend 32) (currentByte!5027 thiss!1305)) ((_ sign_extend 32) (currentBit!5022 thiss!1305)) lt!149097))))

(assert (=> b!102500 (= lt!149097 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102501 () Bool)

(declare-fun e!67075 () Bool)

(declare-fun e!67082 () Bool)

(assert (=> b!102501 (= e!67075 e!67082)))

(declare-fun res!84292 () Bool)

(assert (=> b!102501 (=> (not res!84292) (not e!67082))))

(declare-fun lt!149096 () (_ BitVec 64))

(declare-fun lt!149091 () (_ BitVec 64))

(assert (=> b!102501 (= res!84292 (= lt!149096 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!149091)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102501 (= lt!149096 (bitIndex!0 (size!2194 (buf!2554 (_2!4442 lt!149083))) (currentByte!5027 (_2!4442 lt!149083)) (currentBit!5022 (_2!4442 lt!149083))))))

(assert (=> b!102501 (= lt!149091 (bitIndex!0 (size!2194 (buf!2554 thiss!1305)) (currentByte!5027 thiss!1305) (currentBit!5022 thiss!1305)))))

(declare-fun b!102502 () Bool)

(declare-fun res!84290 () Bool)

(assert (=> b!102502 (=> (not res!84290) (not e!67082))))

(declare-fun isPrefixOf!0 (BitStream!3862 BitStream!3862) Bool)

(assert (=> b!102502 (= res!84290 (isPrefixOf!0 thiss!1305 (_2!4442 lt!149083)))))

(declare-fun b!102503 () Bool)

(declare-fun e!67083 () Bool)

(assert (=> b!102503 (= e!67082 e!67083)))

(declare-fun res!84289 () Bool)

(assert (=> b!102503 (=> (not res!84289) (not e!67083))))

(declare-datatypes ((tuple2!8376 0))(
  ( (tuple2!8377 (_1!4443 BitStream!3862) (_2!4443 Bool)) )
))
(declare-fun lt!149094 () tuple2!8376)

(declare-fun lt!149084 () Bool)

(assert (=> b!102503 (= res!84289 (and (= (_2!4443 lt!149094) lt!149084) (= (_1!4443 lt!149094) (_2!4442 lt!149083))))))

(declare-fun readBitPure!0 (BitStream!3862) tuple2!8376)

(declare-fun readerFrom!0 (BitStream!3862 (_ BitVec 32) (_ BitVec 32)) BitStream!3862)

(assert (=> b!102503 (= lt!149094 (readBitPure!0 (readerFrom!0 (_2!4442 lt!149083) (currentBit!5022 thiss!1305) (currentByte!5027 thiss!1305))))))

(declare-fun b!102504 () Bool)

(declare-fun array_inv!1996 (array!4806) Bool)

(assert (=> b!102504 (= e!67077 (array_inv!1996 (buf!2554 thiss!1305)))))

(declare-fun b!102505 () Bool)

(declare-fun res!84288 () Bool)

(assert (=> b!102505 (=> (not res!84288) (not e!67081))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102505 (= res!84288 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102506 () Bool)

(declare-fun e!67080 () Bool)

(declare-fun lt!149088 () tuple2!8376)

(declare-fun lt!149081 () tuple2!8376)

(assert (=> b!102506 (= e!67080 (= (_2!4443 lt!149088) (_2!4443 lt!149081)))))

(declare-fun b!102507 () Bool)

(assert (=> b!102507 (= e!67081 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!149095 () tuple2!8374)

(declare-fun lt!149086 () (_ BitVec 64))

(assert (=> b!102507 (validate_offset_bits!1 ((_ sign_extend 32) (size!2194 (buf!2554 (_2!4442 lt!149095)))) ((_ sign_extend 32) (currentByte!5027 (_2!4442 lt!149083))) ((_ sign_extend 32) (currentBit!5022 (_2!4442 lt!149083))) lt!149086)))

(declare-fun lt!149092 () Unit!6284)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3862 array!4806 (_ BitVec 64)) Unit!6284)

(assert (=> b!102507 (= lt!149092 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4442 lt!149083) (buf!2554 (_2!4442 lt!149095)) lt!149086))))

(assert (=> b!102507 (= lt!149086 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!8378 0))(
  ( (tuple2!8379 (_1!4444 BitStream!3862) (_2!4444 (_ BitVec 64))) )
))
(declare-fun lt!149093 () tuple2!8378)

(declare-datatypes ((tuple2!8380 0))(
  ( (tuple2!8381 (_1!4445 BitStream!3862) (_2!4445 BitStream!3862)) )
))
(declare-fun lt!149082 () tuple2!8380)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8378)

(assert (=> b!102507 (= lt!149093 (readNLeastSignificantBitsLoopPure!0 (_1!4445 lt!149082) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!102507 (validate_offset_bits!1 ((_ sign_extend 32) (size!2194 (buf!2554 (_2!4442 lt!149095)))) ((_ sign_extend 32) (currentByte!5027 thiss!1305)) ((_ sign_extend 32) (currentBit!5022 thiss!1305)) lt!149097)))

(declare-fun lt!149090 () Unit!6284)

(assert (=> b!102507 (= lt!149090 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2554 (_2!4442 lt!149095)) lt!149097))))

(assert (=> b!102507 (= (_2!4443 (readBitPure!0 (_1!4445 lt!149082))) lt!149084)))

(declare-fun lt!149087 () tuple2!8380)

(declare-fun reader!0 (BitStream!3862 BitStream!3862) tuple2!8380)

(assert (=> b!102507 (= lt!149087 (reader!0 (_2!4442 lt!149083) (_2!4442 lt!149095)))))

(assert (=> b!102507 (= lt!149082 (reader!0 thiss!1305 (_2!4442 lt!149095)))))

(assert (=> b!102507 e!67080))

(declare-fun res!84295 () Bool)

(assert (=> b!102507 (=> (not res!84295) (not e!67080))))

(assert (=> b!102507 (= res!84295 (= (bitIndex!0 (size!2194 (buf!2554 (_1!4443 lt!149088))) (currentByte!5027 (_1!4443 lt!149088)) (currentBit!5022 (_1!4443 lt!149088))) (bitIndex!0 (size!2194 (buf!2554 (_1!4443 lt!149081))) (currentByte!5027 (_1!4443 lt!149081)) (currentBit!5022 (_1!4443 lt!149081)))))))

(declare-fun lt!149089 () Unit!6284)

(declare-fun lt!149085 () BitStream!3862)

(declare-fun readBitPrefixLemma!0 (BitStream!3862 BitStream!3862) Unit!6284)

(assert (=> b!102507 (= lt!149089 (readBitPrefixLemma!0 lt!149085 (_2!4442 lt!149095)))))

(assert (=> b!102507 (= lt!149081 (readBitPure!0 (BitStream!3863 (buf!2554 (_2!4442 lt!149095)) (currentByte!5027 thiss!1305) (currentBit!5022 thiss!1305))))))

(assert (=> b!102507 (= lt!149088 (readBitPure!0 lt!149085))))

(assert (=> b!102507 (= lt!149085 (BitStream!3863 (buf!2554 (_2!4442 lt!149083)) (currentByte!5027 thiss!1305) (currentBit!5022 thiss!1305)))))

(assert (=> b!102507 e!67078))

(declare-fun res!84291 () Bool)

(assert (=> b!102507 (=> (not res!84291) (not e!67078))))

(assert (=> b!102507 (= res!84291 (isPrefixOf!0 thiss!1305 (_2!4442 lt!149095)))))

(declare-fun lt!149098 () Unit!6284)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3862 BitStream!3862 BitStream!3862) Unit!6284)

(assert (=> b!102507 (= lt!149098 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4442 lt!149083) (_2!4442 lt!149095)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3862 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8374)

(assert (=> b!102507 (= lt!149095 (appendNLeastSignificantBitsLoop!0 (_2!4442 lt!149083) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!102507 e!67075))

(declare-fun res!84296 () Bool)

(assert (=> b!102507 (=> (not res!84296) (not e!67075))))

(assert (=> b!102507 (= res!84296 (= (size!2194 (buf!2554 thiss!1305)) (size!2194 (buf!2554 (_2!4442 lt!149083)))))))

(declare-fun appendBit!0 (BitStream!3862 Bool) tuple2!8374)

(assert (=> b!102507 (= lt!149083 (appendBit!0 thiss!1305 lt!149084))))

(assert (=> b!102507 (= lt!149084 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102508 () Bool)

(assert (=> b!102508 (= e!67078 (invariant!0 (currentBit!5022 thiss!1305) (currentByte!5027 thiss!1305) (size!2194 (buf!2554 (_2!4442 lt!149095)))))))

(declare-fun b!102509 () Bool)

(assert (=> b!102509 (= e!67083 (= (bitIndex!0 (size!2194 (buf!2554 (_1!4443 lt!149094))) (currentByte!5027 (_1!4443 lt!149094)) (currentBit!5022 (_1!4443 lt!149094))) lt!149096))))

(assert (= (and start!20362 res!84293) b!102500))

(assert (= (and b!102500 res!84287) b!102505))

(assert (= (and b!102505 res!84288) b!102499))

(assert (= (and b!102499 res!84294) b!102507))

(assert (= (and b!102507 res!84296) b!102501))

(assert (= (and b!102501 res!84292) b!102502))

(assert (= (and b!102502 res!84290) b!102503))

(assert (= (and b!102503 res!84289) b!102509))

(assert (= (and b!102507 res!84291) b!102498))

(assert (= (and b!102498 res!84286) b!102508))

(assert (= (and b!102507 res!84295) b!102506))

(assert (= start!20362 b!102504))

(declare-fun m!149275 () Bool)

(assert (=> start!20362 m!149275))

(declare-fun m!149277 () Bool)

(assert (=> b!102503 m!149277))

(assert (=> b!102503 m!149277))

(declare-fun m!149279 () Bool)

(assert (=> b!102503 m!149279))

(declare-fun m!149281 () Bool)

(assert (=> b!102498 m!149281))

(declare-fun m!149283 () Bool)

(assert (=> b!102508 m!149283))

(declare-fun m!149285 () Bool)

(assert (=> b!102502 m!149285))

(declare-fun m!149287 () Bool)

(assert (=> b!102509 m!149287))

(declare-fun m!149289 () Bool)

(assert (=> b!102505 m!149289))

(declare-fun m!149291 () Bool)

(assert (=> b!102507 m!149291))

(declare-fun m!149293 () Bool)

(assert (=> b!102507 m!149293))

(declare-fun m!149295 () Bool)

(assert (=> b!102507 m!149295))

(declare-fun m!149297 () Bool)

(assert (=> b!102507 m!149297))

(declare-fun m!149299 () Bool)

(assert (=> b!102507 m!149299))

(declare-fun m!149301 () Bool)

(assert (=> b!102507 m!149301))

(declare-fun m!149303 () Bool)

(assert (=> b!102507 m!149303))

(declare-fun m!149305 () Bool)

(assert (=> b!102507 m!149305))

(declare-fun m!149307 () Bool)

(assert (=> b!102507 m!149307))

(declare-fun m!149309 () Bool)

(assert (=> b!102507 m!149309))

(declare-fun m!149311 () Bool)

(assert (=> b!102507 m!149311))

(declare-fun m!149313 () Bool)

(assert (=> b!102507 m!149313))

(declare-fun m!149315 () Bool)

(assert (=> b!102507 m!149315))

(declare-fun m!149317 () Bool)

(assert (=> b!102507 m!149317))

(declare-fun m!149319 () Bool)

(assert (=> b!102507 m!149319))

(declare-fun m!149321 () Bool)

(assert (=> b!102507 m!149321))

(declare-fun m!149323 () Bool)

(assert (=> b!102507 m!149323))

(declare-fun m!149325 () Bool)

(assert (=> b!102507 m!149325))

(declare-fun m!149327 () Bool)

(assert (=> b!102504 m!149327))

(declare-fun m!149329 () Bool)

(assert (=> b!102500 m!149329))

(declare-fun m!149331 () Bool)

(assert (=> b!102501 m!149331))

(declare-fun m!149333 () Bool)

(assert (=> b!102501 m!149333))

(push 1)

(assert (not b!102500))

(assert (not b!102503))

(assert (not b!102507))

(assert (not b!102504))

(assert (not b!102509))

(assert (not start!20362))

(assert (not b!102508))

(assert (not b!102502))

(assert (not b!102498))

(assert (not b!102501))

(assert (not b!102505))

(check-sat)

(pop 1)

(push 1)

(check-sat)

