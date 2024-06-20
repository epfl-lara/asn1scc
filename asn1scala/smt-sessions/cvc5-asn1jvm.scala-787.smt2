; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22856 () Bool)

(assert start!22856)

(declare-fun b!115346 () Bool)

(declare-fun e!75603 () Bool)

(declare-datatypes ((array!5201 0))(
  ( (array!5202 (arr!2952 (Array (_ BitVec 32) (_ BitVec 8))) (size!2359 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4192 0))(
  ( (BitStream!4193 (buf!2769 array!5201) (currentByte!5397 (_ BitVec 32)) (currentBit!5392 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4192)

(declare-datatypes ((Unit!7099 0))(
  ( (Unit!7100) )
))
(declare-datatypes ((tuple2!9490 0))(
  ( (tuple2!9491 (_1!5010 Unit!7099) (_2!5010 BitStream!4192)) )
))
(declare-fun lt!176119 () tuple2!9490)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115346 (= e!75603 (invariant!0 (currentBit!5392 thiss!1305) (currentByte!5397 thiss!1305) (size!2359 (buf!2769 (_2!5010 lt!176119)))))))

(declare-fun b!115347 () Bool)

(declare-fun e!75597 () Bool)

(declare-datatypes ((tuple2!9492 0))(
  ( (tuple2!9493 (_1!5011 BitStream!4192) (_2!5011 Bool)) )
))
(declare-fun lt!176126 () tuple2!9492)

(declare-fun lt!176122 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115347 (= e!75597 (= (bitIndex!0 (size!2359 (buf!2769 (_1!5011 lt!176126))) (currentByte!5397 (_1!5011 lt!176126)) (currentBit!5392 (_1!5011 lt!176126))) lt!176122))))

(declare-fun b!115348 () Bool)

(declare-fun res!95305 () Bool)

(assert (=> b!115348 (=> (not res!95305) (not e!75603))))

(declare-fun lt!176120 () tuple2!9490)

(assert (=> b!115348 (= res!95305 (invariant!0 (currentBit!5392 thiss!1305) (currentByte!5397 thiss!1305) (size!2359 (buf!2769 (_2!5010 lt!176120)))))))

(declare-fun b!115349 () Bool)

(declare-fun e!75596 () Bool)

(declare-fun lt!176116 () tuple2!9492)

(declare-fun lt!176115 () tuple2!9492)

(assert (=> b!115349 (= e!75596 (= (_2!5011 lt!176116) (_2!5011 lt!176115)))))

(declare-fun b!115350 () Bool)

(declare-fun res!95307 () Bool)

(declare-fun e!75601 () Bool)

(assert (=> b!115350 (=> (not res!95307) (not e!75601))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115350 (= res!95307 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115351 () Bool)

(declare-fun res!95308 () Bool)

(assert (=> b!115351 (=> (not res!95308) (not e!75601))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115351 (= res!95308 (validate_offset_bits!1 ((_ sign_extend 32) (size!2359 (buf!2769 thiss!1305))) ((_ sign_extend 32) (currentByte!5397 thiss!1305)) ((_ sign_extend 32) (currentBit!5392 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!115352 () Bool)

(assert (=> b!115352 (= e!75601 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!9494 0))(
  ( (tuple2!9495 (_1!5012 BitStream!4192) (_2!5012 BitStream!4192)) )
))
(declare-fun lt!176124 () tuple2!9494)

(declare-fun lt!176127 () Bool)

(declare-fun readBitPure!0 (BitStream!4192) tuple2!9492)

(assert (=> b!115352 (= (_2!5011 (readBitPure!0 (_1!5012 lt!176124))) lt!176127)))

(declare-fun lt!176117 () tuple2!9494)

(declare-fun reader!0 (BitStream!4192 BitStream!4192) tuple2!9494)

(assert (=> b!115352 (= lt!176117 (reader!0 (_2!5010 lt!176120) (_2!5010 lt!176119)))))

(assert (=> b!115352 (= lt!176124 (reader!0 thiss!1305 (_2!5010 lt!176119)))))

(assert (=> b!115352 e!75596))

(declare-fun res!95304 () Bool)

(assert (=> b!115352 (=> (not res!95304) (not e!75596))))

(assert (=> b!115352 (= res!95304 (= (bitIndex!0 (size!2359 (buf!2769 (_1!5011 lt!176116))) (currentByte!5397 (_1!5011 lt!176116)) (currentBit!5392 (_1!5011 lt!176116))) (bitIndex!0 (size!2359 (buf!2769 (_1!5011 lt!176115))) (currentByte!5397 (_1!5011 lt!176115)) (currentBit!5392 (_1!5011 lt!176115)))))))

(declare-fun lt!176121 () Unit!7099)

(declare-fun lt!176118 () BitStream!4192)

(declare-fun readBitPrefixLemma!0 (BitStream!4192 BitStream!4192) Unit!7099)

(assert (=> b!115352 (= lt!176121 (readBitPrefixLemma!0 lt!176118 (_2!5010 lt!176119)))))

(assert (=> b!115352 (= lt!176115 (readBitPure!0 (BitStream!4193 (buf!2769 (_2!5010 lt!176119)) (currentByte!5397 thiss!1305) (currentBit!5392 thiss!1305))))))

(assert (=> b!115352 (= lt!176116 (readBitPure!0 lt!176118))))

(assert (=> b!115352 (= lt!176118 (BitStream!4193 (buf!2769 (_2!5010 lt!176120)) (currentByte!5397 thiss!1305) (currentBit!5392 thiss!1305)))))

(assert (=> b!115352 e!75603))

(declare-fun res!95313 () Bool)

(assert (=> b!115352 (=> (not res!95313) (not e!75603))))

(declare-fun isPrefixOf!0 (BitStream!4192 BitStream!4192) Bool)

(assert (=> b!115352 (= res!95313 (isPrefixOf!0 thiss!1305 (_2!5010 lt!176119)))))

(declare-fun lt!176125 () Unit!7099)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4192 BitStream!4192 BitStream!4192) Unit!7099)

(assert (=> b!115352 (= lt!176125 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5010 lt!176120) (_2!5010 lt!176119)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4192 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9490)

(assert (=> b!115352 (= lt!176119 (appendNLeastSignificantBitsLoop!0 (_2!5010 lt!176120) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!75599 () Bool)

(assert (=> b!115352 e!75599))

(declare-fun res!95312 () Bool)

(assert (=> b!115352 (=> (not res!95312) (not e!75599))))

(assert (=> b!115352 (= res!95312 (= (size!2359 (buf!2769 thiss!1305)) (size!2359 (buf!2769 (_2!5010 lt!176120)))))))

(declare-fun appendBit!0 (BitStream!4192 Bool) tuple2!9490)

(assert (=> b!115352 (= lt!176120 (appendBit!0 thiss!1305 lt!176127))))

(assert (=> b!115352 (= lt!176127 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115353 () Bool)

(declare-fun res!95306 () Bool)

(declare-fun e!75598 () Bool)

(assert (=> b!115353 (=> (not res!95306) (not e!75598))))

(assert (=> b!115353 (= res!95306 (isPrefixOf!0 thiss!1305 (_2!5010 lt!176120)))))

(declare-fun b!115354 () Bool)

(assert (=> b!115354 (= e!75599 e!75598)))

(declare-fun res!95310 () Bool)

(assert (=> b!115354 (=> (not res!95310) (not e!75598))))

(declare-fun lt!176123 () (_ BitVec 64))

(assert (=> b!115354 (= res!95310 (= lt!176122 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!176123)))))

(assert (=> b!115354 (= lt!176122 (bitIndex!0 (size!2359 (buf!2769 (_2!5010 lt!176120))) (currentByte!5397 (_2!5010 lt!176120)) (currentBit!5392 (_2!5010 lt!176120))))))

(assert (=> b!115354 (= lt!176123 (bitIndex!0 (size!2359 (buf!2769 thiss!1305)) (currentByte!5397 thiss!1305) (currentBit!5392 thiss!1305)))))

(declare-fun b!115355 () Bool)

(assert (=> b!115355 (= e!75598 e!75597)))

(declare-fun res!95309 () Bool)

(assert (=> b!115355 (=> (not res!95309) (not e!75597))))

(assert (=> b!115355 (= res!95309 (and (= (_2!5011 lt!176126) lt!176127) (= (_1!5011 lt!176126) (_2!5010 lt!176120))))))

(declare-fun readerFrom!0 (BitStream!4192 (_ BitVec 32) (_ BitVec 32)) BitStream!4192)

(assert (=> b!115355 (= lt!176126 (readBitPure!0 (readerFrom!0 (_2!5010 lt!176120) (currentBit!5392 thiss!1305) (currentByte!5397 thiss!1305))))))

(declare-fun res!95303 () Bool)

(assert (=> start!22856 (=> (not res!95303) (not e!75601))))

(assert (=> start!22856 (= res!95303 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22856 e!75601))

(assert (=> start!22856 true))

(declare-fun e!75600 () Bool)

(declare-fun inv!12 (BitStream!4192) Bool)

(assert (=> start!22856 (and (inv!12 thiss!1305) e!75600)))

(declare-fun b!115356 () Bool)

(declare-fun res!95311 () Bool)

(assert (=> b!115356 (=> (not res!95311) (not e!75601))))

(assert (=> b!115356 (= res!95311 (bvslt i!615 nBits!396))))

(declare-fun b!115357 () Bool)

(declare-fun array_inv!2161 (array!5201) Bool)

(assert (=> b!115357 (= e!75600 (array_inv!2161 (buf!2769 thiss!1305)))))

(assert (= (and start!22856 res!95303) b!115351))

(assert (= (and b!115351 res!95308) b!115350))

(assert (= (and b!115350 res!95307) b!115356))

(assert (= (and b!115356 res!95311) b!115352))

(assert (= (and b!115352 res!95312) b!115354))

(assert (= (and b!115354 res!95310) b!115353))

(assert (= (and b!115353 res!95306) b!115355))

(assert (= (and b!115355 res!95309) b!115347))

(assert (= (and b!115352 res!95313) b!115348))

(assert (= (and b!115348 res!95305) b!115346))

(assert (= (and b!115352 res!95304) b!115349))

(assert (= start!22856 b!115357))

(declare-fun m!172667 () Bool)

(assert (=> b!115351 m!172667))

(declare-fun m!172669 () Bool)

(assert (=> start!22856 m!172669))

(declare-fun m!172671 () Bool)

(assert (=> b!115348 m!172671))

(declare-fun m!172673 () Bool)

(assert (=> b!115357 m!172673))

(declare-fun m!172675 () Bool)

(assert (=> b!115353 m!172675))

(declare-fun m!172677 () Bool)

(assert (=> b!115350 m!172677))

(declare-fun m!172679 () Bool)

(assert (=> b!115346 m!172679))

(declare-fun m!172681 () Bool)

(assert (=> b!115352 m!172681))

(declare-fun m!172683 () Bool)

(assert (=> b!115352 m!172683))

(declare-fun m!172685 () Bool)

(assert (=> b!115352 m!172685))

(declare-fun m!172687 () Bool)

(assert (=> b!115352 m!172687))

(declare-fun m!172689 () Bool)

(assert (=> b!115352 m!172689))

(declare-fun m!172691 () Bool)

(assert (=> b!115352 m!172691))

(declare-fun m!172693 () Bool)

(assert (=> b!115352 m!172693))

(declare-fun m!172695 () Bool)

(assert (=> b!115352 m!172695))

(declare-fun m!172697 () Bool)

(assert (=> b!115352 m!172697))

(declare-fun m!172699 () Bool)

(assert (=> b!115352 m!172699))

(declare-fun m!172701 () Bool)

(assert (=> b!115352 m!172701))

(declare-fun m!172703 () Bool)

(assert (=> b!115352 m!172703))

(declare-fun m!172705 () Bool)

(assert (=> b!115355 m!172705))

(assert (=> b!115355 m!172705))

(declare-fun m!172707 () Bool)

(assert (=> b!115355 m!172707))

(declare-fun m!172709 () Bool)

(assert (=> b!115347 m!172709))

(declare-fun m!172711 () Bool)

(assert (=> b!115354 m!172711))

(declare-fun m!172713 () Bool)

(assert (=> b!115354 m!172713))

(push 1)

(assert (not b!115354))

(assert (not b!115351))

(assert (not b!115355))

(assert (not b!115353))

(assert (not start!22856))

(assert (not b!115350))

(assert (not b!115352))

(assert (not b!115348))

(assert (not b!115346))

(assert (not b!115357))

(assert (not b!115347))

(check-sat)

(pop 1)

(push 1)

(check-sat)

