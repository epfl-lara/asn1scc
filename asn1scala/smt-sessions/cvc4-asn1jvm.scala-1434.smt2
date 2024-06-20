; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39372 () Bool)

(assert start!39372)

(declare-fun res!146807 () Bool)

(declare-fun e!123439 () Bool)

(assert (=> start!39372 (=> (not res!146807) (not e!123439))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39372 (= res!146807 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39372 e!123439))

(assert (=> start!39372 true))

(declare-datatypes ((array!9564 0))(
  ( (array!9565 (arr!5148 (Array (_ BitVec 32) (_ BitVec 8))) (size!4218 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7544 0))(
  ( (BitStream!7545 (buf!4661 array!9564) (currentByte!8832 (_ BitVec 32)) (currentBit!8827 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7544)

(declare-fun e!123437 () Bool)

(declare-fun inv!12 (BitStream!7544) Bool)

(assert (=> start!39372 (and (inv!12 thiss!1204) e!123437)))

(declare-fun b!177128 () Bool)

(declare-fun e!123440 () Bool)

(declare-fun e!123442 () Bool)

(assert (=> b!177128 (= e!123440 e!123442)))

(declare-fun res!146808 () Bool)

(assert (=> b!177128 (=> (not res!146808) (not e!123442))))

(declare-datatypes ((tuple2!15262 0))(
  ( (tuple2!15263 (_1!8276 BitStream!7544) (_2!8276 Bool)) )
))
(declare-fun lt!272216 () tuple2!15262)

(declare-fun lt!272215 () Bool)

(declare-datatypes ((Unit!12750 0))(
  ( (Unit!12751) )
))
(declare-datatypes ((tuple2!15264 0))(
  ( (tuple2!15265 (_1!8277 Unit!12750) (_2!8277 BitStream!7544)) )
))
(declare-fun lt!272219 () tuple2!15264)

(assert (=> b!177128 (= res!146808 (and (= (_2!8276 lt!272216) lt!272215) (= (_1!8276 lt!272216) (_2!8277 lt!272219))))))

(declare-fun readBitPure!0 (BitStream!7544) tuple2!15262)

(declare-fun readerFrom!0 (BitStream!7544 (_ BitVec 32) (_ BitVec 32)) BitStream!7544)

(assert (=> b!177128 (= lt!272216 (readBitPure!0 (readerFrom!0 (_2!8277 lt!272219) (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204))))))

(declare-fun b!177129 () Bool)

(declare-fun e!123441 () Bool)

(assert (=> b!177129 (= e!123441 e!123440)))

(declare-fun res!146804 () Bool)

(assert (=> b!177129 (=> (not res!146804) (not e!123440))))

(declare-fun lt!272218 () (_ BitVec 64))

(declare-fun lt!272217 () (_ BitVec 64))

(assert (=> b!177129 (= res!146804 (= lt!272218 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272217)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177129 (= lt!272218 (bitIndex!0 (size!4218 (buf!4661 (_2!8277 lt!272219))) (currentByte!8832 (_2!8277 lt!272219)) (currentBit!8827 (_2!8277 lt!272219))))))

(assert (=> b!177129 (= lt!272217 (bitIndex!0 (size!4218 (buf!4661 thiss!1204)) (currentByte!8832 thiss!1204) (currentBit!8827 thiss!1204)))))

(declare-fun b!177130 () Bool)

(assert (=> b!177130 (= e!123442 (= (bitIndex!0 (size!4218 (buf!4661 (_1!8276 lt!272216))) (currentByte!8832 (_1!8276 lt!272216)) (currentBit!8827 (_1!8276 lt!272216))) lt!272218))))

(declare-fun b!177131 () Bool)

(declare-fun res!146810 () Bool)

(assert (=> b!177131 (=> (not res!146810) (not e!123439))))

(assert (=> b!177131 (= res!146810 (not (= i!590 nBits!348)))))

(declare-fun b!177132 () Bool)

(declare-fun array_inv!3959 (array!9564) Bool)

(assert (=> b!177132 (= e!123437 (array_inv!3959 (buf!4661 thiss!1204)))))

(declare-fun e!123438 () Bool)

(declare-fun b!177133 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177133 (= e!123438 (validate_offset_bits!1 ((_ sign_extend 32) (size!4218 (buf!4661 (_2!8277 lt!272219)))) ((_ sign_extend 32) (currentByte!8832 (_2!8277 lt!272219))) ((_ sign_extend 32) (currentBit!8827 (_2!8277 lt!272219))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!177134 () Bool)

(declare-fun res!146805 () Bool)

(assert (=> b!177134 (=> (not res!146805) (not e!123439))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177134 (= res!146805 (invariant!0 (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204) (size!4218 (buf!4661 thiss!1204))))))

(declare-fun b!177135 () Bool)

(declare-fun res!146802 () Bool)

(assert (=> b!177135 (=> (not res!146802) (not e!123440))))

(declare-fun isPrefixOf!0 (BitStream!7544 BitStream!7544) Bool)

(assert (=> b!177135 (= res!146802 (isPrefixOf!0 thiss!1204 (_2!8277 lt!272219)))))

(declare-fun b!177136 () Bool)

(assert (=> b!177136 (= e!123439 (not e!123438))))

(declare-fun res!146806 () Bool)

(assert (=> b!177136 (=> res!146806 e!123438)))

(assert (=> b!177136 (= res!146806 (not (= (bitIndex!0 (size!4218 (buf!4661 (_2!8277 lt!272219))) (currentByte!8832 (_2!8277 lt!272219)) (currentBit!8827 (_2!8277 lt!272219))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4218 (buf!4661 thiss!1204)) (currentByte!8832 thiss!1204) (currentBit!8827 thiss!1204))))))))

(assert (=> b!177136 e!123441))

(declare-fun res!146809 () Bool)

(assert (=> b!177136 (=> (not res!146809) (not e!123441))))

(assert (=> b!177136 (= res!146809 (= (size!4218 (buf!4661 thiss!1204)) (size!4218 (buf!4661 (_2!8277 lt!272219)))))))

(declare-fun appendBit!0 (BitStream!7544 Bool) tuple2!15264)

(assert (=> b!177136 (= lt!272219 (appendBit!0 thiss!1204 lt!272215))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!177136 (= lt!272215 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177137 () Bool)

(declare-fun res!146803 () Bool)

(assert (=> b!177137 (=> res!146803 e!123438)))

(assert (=> b!177137 (= res!146803 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!177138 () Bool)

(declare-fun res!146811 () Bool)

(assert (=> b!177138 (=> (not res!146811) (not e!123439))))

(assert (=> b!177138 (= res!146811 (validate_offset_bits!1 ((_ sign_extend 32) (size!4218 (buf!4661 thiss!1204))) ((_ sign_extend 32) (currentByte!8832 thiss!1204)) ((_ sign_extend 32) (currentBit!8827 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!39372 res!146807) b!177138))

(assert (= (and b!177138 res!146811) b!177134))

(assert (= (and b!177134 res!146805) b!177131))

(assert (= (and b!177131 res!146810) b!177136))

(assert (= (and b!177136 res!146809) b!177129))

(assert (= (and b!177129 res!146804) b!177135))

(assert (= (and b!177135 res!146802) b!177128))

(assert (= (and b!177128 res!146808) b!177130))

(assert (= (and b!177136 (not res!146806)) b!177137))

(assert (= (and b!177137 (not res!146803)) b!177133))

(assert (= start!39372 b!177132))

(declare-fun m!277087 () Bool)

(assert (=> b!177136 m!277087))

(declare-fun m!277089 () Bool)

(assert (=> b!177136 m!277089))

(declare-fun m!277091 () Bool)

(assert (=> b!177136 m!277091))

(declare-fun m!277093 () Bool)

(assert (=> b!177130 m!277093))

(declare-fun m!277095 () Bool)

(assert (=> b!177138 m!277095))

(declare-fun m!277097 () Bool)

(assert (=> b!177128 m!277097))

(assert (=> b!177128 m!277097))

(declare-fun m!277099 () Bool)

(assert (=> b!177128 m!277099))

(declare-fun m!277101 () Bool)

(assert (=> b!177135 m!277101))

(assert (=> b!177129 m!277087))

(assert (=> b!177129 m!277089))

(declare-fun m!277103 () Bool)

(assert (=> b!177134 m!277103))

(declare-fun m!277105 () Bool)

(assert (=> b!177133 m!277105))

(declare-fun m!277107 () Bool)

(assert (=> start!39372 m!277107))

(declare-fun m!277109 () Bool)

(assert (=> b!177132 m!277109))

(push 1)

(assert (not start!39372))

(assert (not b!177133))

(assert (not b!177134))

(assert (not b!177129))

(assert (not b!177136))

(assert (not b!177128))

(assert (not b!177135))

(assert (not b!177130))

(assert (not b!177132))

(assert (not b!177138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62397 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62397 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4218 (buf!4661 thiss!1204))) ((_ sign_extend 32) (currentByte!8832 thiss!1204)) ((_ sign_extend 32) (currentBit!8827 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4218 (buf!4661 thiss!1204))) ((_ sign_extend 32) (currentByte!8832 thiss!1204)) ((_ sign_extend 32) (currentBit!8827 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15559 () Bool)

(assert (= bs!15559 d!62397))

(declare-fun m!277151 () Bool)

(assert (=> bs!15559 m!277151))

(assert (=> b!177138 d!62397))

(declare-fun d!62403 () Bool)

(declare-datatypes ((tuple2!15270 0))(
  ( (tuple2!15271 (_1!8280 Bool) (_2!8280 BitStream!7544)) )
))
(declare-fun lt!272302 () tuple2!15270)

(declare-fun readBit!0 (BitStream!7544) tuple2!15270)

(assert (=> d!62403 (= lt!272302 (readBit!0 (readerFrom!0 (_2!8277 lt!272219) (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204))))))

(assert (=> d!62403 (= (readBitPure!0 (readerFrom!0 (_2!8277 lt!272219) (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204))) (tuple2!15263 (_2!8280 lt!272302) (_1!8280 lt!272302)))))

(declare-fun bs!15561 () Bool)

(assert (= bs!15561 d!62403))

(assert (=> bs!15561 m!277097))

(declare-fun m!277153 () Bool)

(assert (=> bs!15561 m!277153))

(assert (=> b!177128 d!62403))

(declare-fun d!62405 () Bool)

(declare-fun e!123484 () Bool)

(assert (=> d!62405 e!123484))

(declare-fun res!146885 () Bool)

(assert (=> d!62405 (=> (not res!146885) (not e!123484))))

(assert (=> d!62405 (= res!146885 (invariant!0 (currentBit!8827 (_2!8277 lt!272219)) (currentByte!8832 (_2!8277 lt!272219)) (size!4218 (buf!4661 (_2!8277 lt!272219)))))))

(assert (=> d!62405 (= (readerFrom!0 (_2!8277 lt!272219) (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204)) (BitStream!7545 (buf!4661 (_2!8277 lt!272219)) (currentByte!8832 thiss!1204) (currentBit!8827 thiss!1204)))))

(declare-fun b!177209 () Bool)

(assert (=> b!177209 (= e!123484 (invariant!0 (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204) (size!4218 (buf!4661 (_2!8277 lt!272219)))))))

(assert (= (and d!62405 res!146885) b!177209))

(declare-fun m!277171 () Bool)

(assert (=> d!62405 m!277171))

(declare-fun m!277173 () Bool)

(assert (=> b!177209 m!277173))

(assert (=> b!177128 d!62405))

(declare-fun d!62413 () Bool)

(assert (=> d!62413 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4218 (buf!4661 (_2!8277 lt!272219)))) ((_ sign_extend 32) (currentByte!8832 (_2!8277 lt!272219))) ((_ sign_extend 32) (currentBit!8827 (_2!8277 lt!272219))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4218 (buf!4661 (_2!8277 lt!272219)))) ((_ sign_extend 32) (currentByte!8832 (_2!8277 lt!272219))) ((_ sign_extend 32) (currentBit!8827 (_2!8277 lt!272219)))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun bs!15563 () Bool)

(assert (= bs!15563 d!62413))

(declare-fun m!277179 () Bool)

(assert (=> bs!15563 m!277179))

(assert (=> b!177133 d!62413))

(declare-fun d!62419 () Bool)

(assert (=> d!62419 (= (array_inv!3959 (buf!4661 thiss!1204)) (bvsge (size!4218 (buf!4661 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!177132 d!62419))

(declare-fun d!62421 () Bool)

(declare-fun e!123488 () Bool)

(assert (=> d!62421 e!123488))

(declare-fun res!146891 () Bool)

(assert (=> d!62421 (=> (not res!146891) (not e!123488))))

(declare-fun lt!272326 () (_ BitVec 64))

(declare-fun lt!272327 () (_ BitVec 64))

(declare-fun lt!272325 () (_ BitVec 64))

(assert (=> d!62421 (= res!146891 (= lt!272326 (bvsub lt!272327 lt!272325)))))

(assert (=> d!62421 (or (= (bvand lt!272327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272327 lt!272325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62421 (= lt!272325 (remainingBits!0 ((_ sign_extend 32) (size!4218 (buf!4661 (_1!8276 lt!272216)))) ((_ sign_extend 32) (currentByte!8832 (_1!8276 lt!272216))) ((_ sign_extend 32) (currentBit!8827 (_1!8276 lt!272216)))))))

(declare-fun lt!272330 () (_ BitVec 64))

(declare-fun lt!272328 () (_ BitVec 64))

(assert (=> d!62421 (= lt!272327 (bvmul lt!272330 lt!272328))))

(assert (=> d!62421 (or (= lt!272330 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272328 (bvsdiv (bvmul lt!272330 lt!272328) lt!272330)))))

(assert (=> d!62421 (= lt!272328 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62421 (= lt!272330 ((_ sign_extend 32) (size!4218 (buf!4661 (_1!8276 lt!272216)))))))

(assert (=> d!62421 (= lt!272326 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8832 (_1!8276 lt!272216))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8827 (_1!8276 lt!272216)))))))

(assert (=> d!62421 (invariant!0 (currentBit!8827 (_1!8276 lt!272216)) (currentByte!8832 (_1!8276 lt!272216)) (size!4218 (buf!4661 (_1!8276 lt!272216))))))

(assert (=> d!62421 (= (bitIndex!0 (size!4218 (buf!4661 (_1!8276 lt!272216))) (currentByte!8832 (_1!8276 lt!272216)) (currentBit!8827 (_1!8276 lt!272216))) lt!272326)))

(declare-fun b!177216 () Bool)

(declare-fun res!146890 () Bool)

(assert (=> b!177216 (=> (not res!146890) (not e!123488))))

(assert (=> b!177216 (= res!146890 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272326))))

(declare-fun b!177217 () Bool)

(declare-fun lt!272329 () (_ BitVec 64))

(assert (=> b!177217 (= e!123488 (bvsle lt!272326 (bvmul lt!272329 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177217 (or (= lt!272329 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272329 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272329)))))

(assert (=> b!177217 (= lt!272329 ((_ sign_extend 32) (size!4218 (buf!4661 (_1!8276 lt!272216)))))))

(assert (= (and d!62421 res!146891) b!177216))

(assert (= (and b!177216 res!146890) b!177217))

(declare-fun m!277181 () Bool)

(assert (=> d!62421 m!277181))

(declare-fun m!277183 () Bool)

(assert (=> d!62421 m!277183))

(assert (=> b!177130 d!62421))

(declare-fun d!62427 () Bool)

(declare-fun res!146898 () Bool)

(declare-fun e!123494 () Bool)

(assert (=> d!62427 (=> (not res!146898) (not e!123494))))

(assert (=> d!62427 (= res!146898 (= (size!4218 (buf!4661 thiss!1204)) (size!4218 (buf!4661 (_2!8277 lt!272219)))))))

(assert (=> d!62427 (= (isPrefixOf!0 thiss!1204 (_2!8277 lt!272219)) e!123494)))

(declare-fun b!177224 () Bool)

(declare-fun res!146899 () Bool)

(assert (=> b!177224 (=> (not res!146899) (not e!123494))))

(assert (=> b!177224 (= res!146899 (bvsle (bitIndex!0 (size!4218 (buf!4661 thiss!1204)) (currentByte!8832 thiss!1204) (currentBit!8827 thiss!1204)) (bitIndex!0 (size!4218 (buf!4661 (_2!8277 lt!272219))) (currentByte!8832 (_2!8277 lt!272219)) (currentBit!8827 (_2!8277 lt!272219)))))))

(declare-fun b!177225 () Bool)

(declare-fun e!123493 () Bool)

(assert (=> b!177225 (= e!123494 e!123493)))

(declare-fun res!146900 () Bool)

(assert (=> b!177225 (=> res!146900 e!123493)))

(assert (=> b!177225 (= res!146900 (= (size!4218 (buf!4661 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177226 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9564 array!9564 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177226 (= e!123493 (arrayBitRangesEq!0 (buf!4661 thiss!1204) (buf!4661 (_2!8277 lt!272219)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4218 (buf!4661 thiss!1204)) (currentByte!8832 thiss!1204) (currentBit!8827 thiss!1204))))))

(assert (= (and d!62427 res!146898) b!177224))

(assert (= (and b!177224 res!146899) b!177225))

(assert (= (and b!177225 (not res!146900)) b!177226))

(assert (=> b!177224 m!277089))

(assert (=> b!177224 m!277087))

(assert (=> b!177226 m!277089))

(assert (=> b!177226 m!277089))

(declare-fun m!277185 () Bool)

(assert (=> b!177226 m!277185))

(assert (=> b!177135 d!62427))

(declare-fun d!62429 () Bool)

(assert (=> d!62429 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204) (size!4218 (buf!4661 thiss!1204))))))

(declare-fun bs!15567 () Bool)

(assert (= bs!15567 d!62429))

(assert (=> bs!15567 m!277103))

(assert (=> start!39372 d!62429))

(declare-fun d!62431 () Bool)

(declare-fun e!123495 () Bool)

(assert (=> d!62431 e!123495))

(declare-fun res!146902 () Bool)

(assert (=> d!62431 (=> (not res!146902) (not e!123495))))

(declare-fun lt!272333 () (_ BitVec 64))

(declare-fun lt!272332 () (_ BitVec 64))

(declare-fun lt!272331 () (_ BitVec 64))

(assert (=> d!62431 (= res!146902 (= lt!272332 (bvsub lt!272333 lt!272331)))))

(assert (=> d!62431 (or (= (bvand lt!272333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272331 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272333 lt!272331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62431 (= lt!272331 (remainingBits!0 ((_ sign_extend 32) (size!4218 (buf!4661 (_2!8277 lt!272219)))) ((_ sign_extend 32) (currentByte!8832 (_2!8277 lt!272219))) ((_ sign_extend 32) (currentBit!8827 (_2!8277 lt!272219)))))))

(declare-fun lt!272336 () (_ BitVec 64))

(declare-fun lt!272334 () (_ BitVec 64))

(assert (=> d!62431 (= lt!272333 (bvmul lt!272336 lt!272334))))

(assert (=> d!62431 (or (= lt!272336 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272334 (bvsdiv (bvmul lt!272336 lt!272334) lt!272336)))))

(assert (=> d!62431 (= lt!272334 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62431 (= lt!272336 ((_ sign_extend 32) (size!4218 (buf!4661 (_2!8277 lt!272219)))))))

(assert (=> d!62431 (= lt!272332 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8832 (_2!8277 lt!272219))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8827 (_2!8277 lt!272219)))))))

(assert (=> d!62431 (invariant!0 (currentBit!8827 (_2!8277 lt!272219)) (currentByte!8832 (_2!8277 lt!272219)) (size!4218 (buf!4661 (_2!8277 lt!272219))))))

(assert (=> d!62431 (= (bitIndex!0 (size!4218 (buf!4661 (_2!8277 lt!272219))) (currentByte!8832 (_2!8277 lt!272219)) (currentBit!8827 (_2!8277 lt!272219))) lt!272332)))

(declare-fun b!177227 () Bool)

(declare-fun res!146901 () Bool)

(assert (=> b!177227 (=> (not res!146901) (not e!123495))))

(assert (=> b!177227 (= res!146901 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272332))))

(declare-fun b!177228 () Bool)

(declare-fun lt!272335 () (_ BitVec 64))

(assert (=> b!177228 (= e!123495 (bvsle lt!272332 (bvmul lt!272335 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177228 (or (= lt!272335 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272335 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272335)))))

(assert (=> b!177228 (= lt!272335 ((_ sign_extend 32) (size!4218 (buf!4661 (_2!8277 lt!272219)))))))

(assert (= (and d!62431 res!146902) b!177227))

(assert (= (and b!177227 res!146901) b!177228))

(assert (=> d!62431 m!277179))

(assert (=> d!62431 m!277171))

(assert (=> b!177136 d!62431))

(declare-fun d!62433 () Bool)

(declare-fun e!123496 () Bool)

(assert (=> d!62433 e!123496))

(declare-fun res!146904 () Bool)

(assert (=> d!62433 (=> (not res!146904) (not e!123496))))

(declare-fun lt!272338 () (_ BitVec 64))

(declare-fun lt!272337 () (_ BitVec 64))

(declare-fun lt!272339 () (_ BitVec 64))

(assert (=> d!62433 (= res!146904 (= lt!272338 (bvsub lt!272339 lt!272337)))))

(assert (=> d!62433 (or (= (bvand lt!272339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272337 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272339 lt!272337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62433 (= lt!272337 (remainingBits!0 ((_ sign_extend 32) (size!4218 (buf!4661 thiss!1204))) ((_ sign_extend 32) (currentByte!8832 thiss!1204)) ((_ sign_extend 32) (currentBit!8827 thiss!1204))))))

(declare-fun lt!272342 () (_ BitVec 64))

(declare-fun lt!272340 () (_ BitVec 64))

(assert (=> d!62433 (= lt!272339 (bvmul lt!272342 lt!272340))))

(assert (=> d!62433 (or (= lt!272342 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272340 (bvsdiv (bvmul lt!272342 lt!272340) lt!272342)))))

(assert (=> d!62433 (= lt!272340 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62433 (= lt!272342 ((_ sign_extend 32) (size!4218 (buf!4661 thiss!1204))))))

(assert (=> d!62433 (= lt!272338 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8832 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8827 thiss!1204))))))

(assert (=> d!62433 (invariant!0 (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204) (size!4218 (buf!4661 thiss!1204)))))

(assert (=> d!62433 (= (bitIndex!0 (size!4218 (buf!4661 thiss!1204)) (currentByte!8832 thiss!1204) (currentBit!8827 thiss!1204)) lt!272338)))

(declare-fun b!177229 () Bool)

(declare-fun res!146903 () Bool)

(assert (=> b!177229 (=> (not res!146903) (not e!123496))))

(assert (=> b!177229 (= res!146903 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272338))))

(declare-fun b!177230 () Bool)

(declare-fun lt!272341 () (_ BitVec 64))

(assert (=> b!177230 (= e!123496 (bvsle lt!272338 (bvmul lt!272341 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177230 (or (= lt!272341 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272341 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272341)))))

(assert (=> b!177230 (= lt!272341 ((_ sign_extend 32) (size!4218 (buf!4661 thiss!1204))))))

(assert (= (and d!62433 res!146904) b!177229))

(assert (= (and b!177229 res!146903) b!177230))

(assert (=> d!62433 m!277151))

(assert (=> d!62433 m!277103))

(assert (=> b!177136 d!62433))

(declare-fun b!177243 () Bool)

(declare-fun e!123501 () Bool)

(declare-fun lt!272354 () tuple2!15262)

(declare-fun lt!272351 () tuple2!15264)

(assert (=> b!177243 (= e!123501 (= (bitIndex!0 (size!4218 (buf!4661 (_1!8276 lt!272354))) (currentByte!8832 (_1!8276 lt!272354)) (currentBit!8827 (_1!8276 lt!272354))) (bitIndex!0 (size!4218 (buf!4661 (_2!8277 lt!272351))) (currentByte!8832 (_2!8277 lt!272351)) (currentBit!8827 (_2!8277 lt!272351)))))))

(declare-fun b!177240 () Bool)

(declare-fun res!146916 () Bool)

(declare-fun e!123502 () Bool)

(assert (=> b!177240 (=> (not res!146916) (not e!123502))))

(declare-fun lt!272353 () (_ BitVec 64))

(declare-fun lt!272352 () (_ BitVec 64))

(assert (=> b!177240 (= res!146916 (= (bitIndex!0 (size!4218 (buf!4661 (_2!8277 lt!272351))) (currentByte!8832 (_2!8277 lt!272351)) (currentBit!8827 (_2!8277 lt!272351))) (bvadd lt!272352 lt!272353)))))

(assert (=> b!177240 (or (not (= (bvand lt!272352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272353 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!272352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!272352 lt!272353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177240 (= lt!272353 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!177240 (= lt!272352 (bitIndex!0 (size!4218 (buf!4661 thiss!1204)) (currentByte!8832 thiss!1204) (currentBit!8827 thiss!1204)))))

(declare-fun d!62435 () Bool)

(assert (=> d!62435 e!123502))

(declare-fun res!146913 () Bool)

(assert (=> d!62435 (=> (not res!146913) (not e!123502))))

(assert (=> d!62435 (= res!146913 (= (size!4218 (buf!4661 thiss!1204)) (size!4218 (buf!4661 (_2!8277 lt!272351)))))))

(declare-fun choose!16 (BitStream!7544 Bool) tuple2!15264)

(assert (=> d!62435 (= lt!272351 (choose!16 thiss!1204 lt!272215))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62435 (validate_offset_bit!0 ((_ sign_extend 32) (size!4218 (buf!4661 thiss!1204))) ((_ sign_extend 32) (currentByte!8832 thiss!1204)) ((_ sign_extend 32) (currentBit!8827 thiss!1204)))))

(assert (=> d!62435 (= (appendBit!0 thiss!1204 lt!272215) lt!272351)))

(declare-fun b!177242 () Bool)

(assert (=> b!177242 (= e!123502 e!123501)))

(declare-fun res!146914 () Bool)

(assert (=> b!177242 (=> (not res!146914) (not e!123501))))

(assert (=> b!177242 (= res!146914 (and (= (_2!8276 lt!272354) lt!272215) (= (_1!8276 lt!272354) (_2!8277 lt!272351))))))

(assert (=> b!177242 (= lt!272354 (readBitPure!0 (readerFrom!0 (_2!8277 lt!272351) (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204))))))

(declare-fun b!177241 () Bool)

(declare-fun res!146915 () Bool)

(assert (=> b!177241 (=> (not res!146915) (not e!123502))))

(assert (=> b!177241 (= res!146915 (isPrefixOf!0 thiss!1204 (_2!8277 lt!272351)))))

(assert (= (and d!62435 res!146913) b!177240))

(assert (= (and b!177240 res!146916) b!177241))

(assert (= (and b!177241 res!146915) b!177242))

(assert (= (and b!177242 res!146914) b!177243))

(declare-fun m!277187 () Bool)

(assert (=> b!177242 m!277187))

(assert (=> b!177242 m!277187))

(declare-fun m!277189 () Bool)

(assert (=> b!177242 m!277189))

(declare-fun m!277191 () Bool)

(assert (=> b!177240 m!277191))

(assert (=> b!177240 m!277089))

(declare-fun m!277193 () Bool)

(assert (=> b!177243 m!277193))

(assert (=> b!177243 m!277191))

(declare-fun m!277195 () Bool)

(assert (=> d!62435 m!277195))

(declare-fun m!277197 () Bool)

(assert (=> d!62435 m!277197))

(declare-fun m!277199 () Bool)

(assert (=> b!177241 m!277199))

(assert (=> b!177136 d!62435))

(declare-fun d!62437 () Bool)

(assert (=> d!62437 (= (invariant!0 (currentBit!8827 thiss!1204) (currentByte!8832 thiss!1204) (size!4218 (buf!4661 thiss!1204))) (and (bvsge (currentBit!8827 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8827 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8832 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8832 thiss!1204) (size!4218 (buf!4661 thiss!1204))) (and (= (currentBit!8827 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8832 thiss!1204) (size!4218 (buf!4661 thiss!1204)))))))))

(assert (=> b!177134 d!62437))

(assert (=> b!177129 d!62431))

(assert (=> b!177129 d!62433))

(push 1)

(assert (not d!62421))

(assert (not d!62429))

(assert (not b!177224))

(assert (not b!177240))

(assert (not d!62405))

(assert (not d!62433))

(assert (not b!177241))

(assert (not b!177242))

(assert (not d!62397))

(assert (not d!62431))

(assert (not d!62403))

(assert (not d!62413))

(assert (not b!177243))

(assert (not b!177226))

(assert (not b!177209))

(assert (not d!62435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

