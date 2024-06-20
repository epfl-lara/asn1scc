; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39370 () Bool)

(assert start!39370)

(declare-fun b!177095 () Bool)

(declare-fun res!146772 () Bool)

(declare-fun e!123420 () Bool)

(assert (=> b!177095 (=> (not res!146772) (not e!123420))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!177095 (= res!146772 (not (= i!590 nBits!348)))))

(declare-fun b!177096 () Bool)

(declare-fun res!146779 () Bool)

(declare-fun e!123415 () Bool)

(assert (=> b!177096 (=> (not res!146779) (not e!123415))))

(declare-datatypes ((array!9562 0))(
  ( (array!9563 (arr!5147 (Array (_ BitVec 32) (_ BitVec 8))) (size!4217 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7542 0))(
  ( (BitStream!7543 (buf!4660 array!9562) (currentByte!8831 (_ BitVec 32)) (currentBit!8826 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7542)

(declare-datatypes ((Unit!12748 0))(
  ( (Unit!12749) )
))
(declare-datatypes ((tuple2!15258 0))(
  ( (tuple2!15259 (_1!8274 Unit!12748) (_2!8274 BitStream!7542)) )
))
(declare-fun lt!272203 () tuple2!15258)

(declare-fun isPrefixOf!0 (BitStream!7542 BitStream!7542) Bool)

(assert (=> b!177096 (= res!146779 (isPrefixOf!0 thiss!1204 (_2!8274 lt!272203)))))

(declare-fun b!177097 () Bool)

(declare-fun res!146775 () Bool)

(assert (=> b!177097 (=> (not res!146775) (not e!123420))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177097 (= res!146775 (validate_offset_bits!1 ((_ sign_extend 32) (size!4217 (buf!4660 thiss!1204))) ((_ sign_extend 32) (currentByte!8831 thiss!1204)) ((_ sign_extend 32) (currentBit!8826 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177098 () Bool)

(declare-fun res!146778 () Bool)

(assert (=> b!177098 (=> (not res!146778) (not e!123420))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177098 (= res!146778 (invariant!0 (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204) (size!4217 (buf!4660 thiss!1204))))))

(declare-fun b!177099 () Bool)

(declare-fun e!123418 () Bool)

(declare-fun array_inv!3958 (array!9562) Bool)

(assert (=> b!177099 (= e!123418 (array_inv!3958 (buf!4660 thiss!1204)))))

(declare-fun res!146781 () Bool)

(assert (=> start!39370 (=> (not res!146781) (not e!123420))))

(assert (=> start!39370 (= res!146781 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39370 e!123420))

(assert (=> start!39370 true))

(declare-fun inv!12 (BitStream!7542) Bool)

(assert (=> start!39370 (and (inv!12 thiss!1204) e!123418)))

(declare-fun b!177100 () Bool)

(declare-fun e!123419 () Bool)

(assert (=> b!177100 (= e!123415 e!123419)))

(declare-fun res!146773 () Bool)

(assert (=> b!177100 (=> (not res!146773) (not e!123419))))

(declare-datatypes ((tuple2!15260 0))(
  ( (tuple2!15261 (_1!8275 BitStream!7542) (_2!8275 Bool)) )
))
(declare-fun lt!272200 () tuple2!15260)

(declare-fun lt!272201 () Bool)

(assert (=> b!177100 (= res!146773 (and (= (_2!8275 lt!272200) lt!272201) (= (_1!8275 lt!272200) (_2!8274 lt!272203))))))

(declare-fun readBitPure!0 (BitStream!7542) tuple2!15260)

(declare-fun readerFrom!0 (BitStream!7542 (_ BitVec 32) (_ BitVec 32)) BitStream!7542)

(assert (=> b!177100 (= lt!272200 (readBitPure!0 (readerFrom!0 (_2!8274 lt!272203) (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204))))))

(declare-fun b!177101 () Bool)

(declare-fun e!123417 () Bool)

(assert (=> b!177101 (= e!123417 e!123415)))

(declare-fun res!146780 () Bool)

(assert (=> b!177101 (=> (not res!146780) (not e!123415))))

(declare-fun lt!272204 () (_ BitVec 64))

(declare-fun lt!272202 () (_ BitVec 64))

(assert (=> b!177101 (= res!146780 (= lt!272204 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272202)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177101 (= lt!272204 (bitIndex!0 (size!4217 (buf!4660 (_2!8274 lt!272203))) (currentByte!8831 (_2!8274 lt!272203)) (currentBit!8826 (_2!8274 lt!272203))))))

(assert (=> b!177101 (= lt!272202 (bitIndex!0 (size!4217 (buf!4660 thiss!1204)) (currentByte!8831 thiss!1204) (currentBit!8826 thiss!1204)))))

(declare-fun e!123416 () Bool)

(declare-fun b!177102 () Bool)

(assert (=> b!177102 (= e!123416 (validate_offset_bits!1 ((_ sign_extend 32) (size!4217 (buf!4660 (_2!8274 lt!272203)))) ((_ sign_extend 32) (currentByte!8831 (_2!8274 lt!272203))) ((_ sign_extend 32) (currentBit!8826 (_2!8274 lt!272203))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!177103 () Bool)

(assert (=> b!177103 (= e!123420 (not e!123416))))

(declare-fun res!146774 () Bool)

(assert (=> b!177103 (=> res!146774 e!123416)))

(assert (=> b!177103 (= res!146774 (not (= (bitIndex!0 (size!4217 (buf!4660 (_2!8274 lt!272203))) (currentByte!8831 (_2!8274 lt!272203)) (currentBit!8826 (_2!8274 lt!272203))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4217 (buf!4660 thiss!1204)) (currentByte!8831 thiss!1204) (currentBit!8826 thiss!1204))))))))

(assert (=> b!177103 e!123417))

(declare-fun res!146776 () Bool)

(assert (=> b!177103 (=> (not res!146776) (not e!123417))))

(assert (=> b!177103 (= res!146776 (= (size!4217 (buf!4660 thiss!1204)) (size!4217 (buf!4660 (_2!8274 lt!272203)))))))

(declare-fun appendBit!0 (BitStream!7542 Bool) tuple2!15258)

(assert (=> b!177103 (= lt!272203 (appendBit!0 thiss!1204 lt!272201))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!177103 (= lt!272201 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177104 () Bool)

(assert (=> b!177104 (= e!123419 (= (bitIndex!0 (size!4217 (buf!4660 (_1!8275 lt!272200))) (currentByte!8831 (_1!8275 lt!272200)) (currentBit!8826 (_1!8275 lt!272200))) lt!272204))))

(declare-fun b!177105 () Bool)

(declare-fun res!146777 () Bool)

(assert (=> b!177105 (=> res!146777 e!123416)))

(assert (=> b!177105 (= res!146777 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(assert (= (and start!39370 res!146781) b!177097))

(assert (= (and b!177097 res!146775) b!177098))

(assert (= (and b!177098 res!146778) b!177095))

(assert (= (and b!177095 res!146772) b!177103))

(assert (= (and b!177103 res!146776) b!177101))

(assert (= (and b!177101 res!146780) b!177096))

(assert (= (and b!177096 res!146779) b!177100))

(assert (= (and b!177100 res!146773) b!177104))

(assert (= (and b!177103 (not res!146774)) b!177105))

(assert (= (and b!177105 (not res!146777)) b!177102))

(assert (= start!39370 b!177099))

(declare-fun m!277063 () Bool)

(assert (=> b!177096 m!277063))

(declare-fun m!277065 () Bool)

(assert (=> b!177102 m!277065))

(declare-fun m!277067 () Bool)

(assert (=> start!39370 m!277067))

(declare-fun m!277069 () Bool)

(assert (=> b!177099 m!277069))

(declare-fun m!277071 () Bool)

(assert (=> b!177097 m!277071))

(declare-fun m!277073 () Bool)

(assert (=> b!177101 m!277073))

(declare-fun m!277075 () Bool)

(assert (=> b!177101 m!277075))

(assert (=> b!177103 m!277073))

(assert (=> b!177103 m!277075))

(declare-fun m!277077 () Bool)

(assert (=> b!177103 m!277077))

(declare-fun m!277079 () Bool)

(assert (=> b!177098 m!277079))

(declare-fun m!277081 () Bool)

(assert (=> b!177104 m!277081))

(declare-fun m!277083 () Bool)

(assert (=> b!177100 m!277083))

(assert (=> b!177100 m!277083))

(declare-fun m!277085 () Bool)

(assert (=> b!177100 m!277085))

(check-sat (not b!177100) (not b!177098) (not b!177104) (not b!177103) (not start!39370) (not b!177101) (not b!177102) (not b!177097) (not b!177096) (not b!177099))
(check-sat)
(get-model)

(declare-fun d!62367 () Bool)

(declare-fun res!146818 () Bool)

(declare-fun e!123448 () Bool)

(assert (=> d!62367 (=> (not res!146818) (not e!123448))))

(assert (=> d!62367 (= res!146818 (= (size!4217 (buf!4660 thiss!1204)) (size!4217 (buf!4660 (_2!8274 lt!272203)))))))

(assert (=> d!62367 (= (isPrefixOf!0 thiss!1204 (_2!8274 lt!272203)) e!123448)))

(declare-fun b!177145 () Bool)

(declare-fun res!146819 () Bool)

(assert (=> b!177145 (=> (not res!146819) (not e!123448))))

(assert (=> b!177145 (= res!146819 (bvsle (bitIndex!0 (size!4217 (buf!4660 thiss!1204)) (currentByte!8831 thiss!1204) (currentBit!8826 thiss!1204)) (bitIndex!0 (size!4217 (buf!4660 (_2!8274 lt!272203))) (currentByte!8831 (_2!8274 lt!272203)) (currentBit!8826 (_2!8274 lt!272203)))))))

(declare-fun b!177146 () Bool)

(declare-fun e!123447 () Bool)

(assert (=> b!177146 (= e!123448 e!123447)))

(declare-fun res!146820 () Bool)

(assert (=> b!177146 (=> res!146820 e!123447)))

(assert (=> b!177146 (= res!146820 (= (size!4217 (buf!4660 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177147 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9562 array!9562 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177147 (= e!123447 (arrayBitRangesEq!0 (buf!4660 thiss!1204) (buf!4660 (_2!8274 lt!272203)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4217 (buf!4660 thiss!1204)) (currentByte!8831 thiss!1204) (currentBit!8826 thiss!1204))))))

(assert (= (and d!62367 res!146818) b!177145))

(assert (= (and b!177145 res!146819) b!177146))

(assert (= (and b!177146 (not res!146820)) b!177147))

(assert (=> b!177145 m!277075))

(assert (=> b!177145 m!277073))

(assert (=> b!177147 m!277075))

(assert (=> b!177147 m!277075))

(declare-fun m!277111 () Bool)

(assert (=> b!177147 m!277111))

(assert (=> b!177096 d!62367))

(declare-fun d!62369 () Bool)

(declare-fun e!123451 () Bool)

(assert (=> d!62369 e!123451))

(declare-fun res!146825 () Bool)

(assert (=> d!62369 (=> (not res!146825) (not e!123451))))

(declare-fun lt!272236 () (_ BitVec 64))

(declare-fun lt!272234 () (_ BitVec 64))

(declare-fun lt!272233 () (_ BitVec 64))

(assert (=> d!62369 (= res!146825 (= lt!272234 (bvsub lt!272233 lt!272236)))))

(assert (=> d!62369 (or (= (bvand lt!272233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272236 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272233 lt!272236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62369 (= lt!272236 (remainingBits!0 ((_ sign_extend 32) (size!4217 (buf!4660 (_2!8274 lt!272203)))) ((_ sign_extend 32) (currentByte!8831 (_2!8274 lt!272203))) ((_ sign_extend 32) (currentBit!8826 (_2!8274 lt!272203)))))))

(declare-fun lt!272235 () (_ BitVec 64))

(declare-fun lt!272232 () (_ BitVec 64))

(assert (=> d!62369 (= lt!272233 (bvmul lt!272235 lt!272232))))

(assert (=> d!62369 (or (= lt!272235 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272232 (bvsdiv (bvmul lt!272235 lt!272232) lt!272235)))))

(assert (=> d!62369 (= lt!272232 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62369 (= lt!272235 ((_ sign_extend 32) (size!4217 (buf!4660 (_2!8274 lt!272203)))))))

(assert (=> d!62369 (= lt!272234 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8831 (_2!8274 lt!272203))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8826 (_2!8274 lt!272203)))))))

(assert (=> d!62369 (invariant!0 (currentBit!8826 (_2!8274 lt!272203)) (currentByte!8831 (_2!8274 lt!272203)) (size!4217 (buf!4660 (_2!8274 lt!272203))))))

(assert (=> d!62369 (= (bitIndex!0 (size!4217 (buf!4660 (_2!8274 lt!272203))) (currentByte!8831 (_2!8274 lt!272203)) (currentBit!8826 (_2!8274 lt!272203))) lt!272234)))

(declare-fun b!177152 () Bool)

(declare-fun res!146826 () Bool)

(assert (=> b!177152 (=> (not res!146826) (not e!123451))))

(assert (=> b!177152 (= res!146826 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272234))))

(declare-fun b!177153 () Bool)

(declare-fun lt!272237 () (_ BitVec 64))

(assert (=> b!177153 (= e!123451 (bvsle lt!272234 (bvmul lt!272237 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177153 (or (= lt!272237 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272237 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272237)))))

(assert (=> b!177153 (= lt!272237 ((_ sign_extend 32) (size!4217 (buf!4660 (_2!8274 lt!272203)))))))

(assert (= (and d!62369 res!146825) b!177152))

(assert (= (and b!177152 res!146826) b!177153))

(declare-fun m!277113 () Bool)

(assert (=> d!62369 m!277113))

(declare-fun m!277115 () Bool)

(assert (=> d!62369 m!277115))

(assert (=> b!177101 d!62369))

(declare-fun d!62373 () Bool)

(declare-fun e!123452 () Bool)

(assert (=> d!62373 e!123452))

(declare-fun res!146827 () Bool)

(assert (=> d!62373 (=> (not res!146827) (not e!123452))))

(declare-fun lt!272239 () (_ BitVec 64))

(declare-fun lt!272242 () (_ BitVec 64))

(declare-fun lt!272240 () (_ BitVec 64))

(assert (=> d!62373 (= res!146827 (= lt!272240 (bvsub lt!272239 lt!272242)))))

(assert (=> d!62373 (or (= (bvand lt!272239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272242 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272239 lt!272242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62373 (= lt!272242 (remainingBits!0 ((_ sign_extend 32) (size!4217 (buf!4660 thiss!1204))) ((_ sign_extend 32) (currentByte!8831 thiss!1204)) ((_ sign_extend 32) (currentBit!8826 thiss!1204))))))

(declare-fun lt!272241 () (_ BitVec 64))

(declare-fun lt!272238 () (_ BitVec 64))

(assert (=> d!62373 (= lt!272239 (bvmul lt!272241 lt!272238))))

(assert (=> d!62373 (or (= lt!272241 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272238 (bvsdiv (bvmul lt!272241 lt!272238) lt!272241)))))

(assert (=> d!62373 (= lt!272238 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62373 (= lt!272241 ((_ sign_extend 32) (size!4217 (buf!4660 thiss!1204))))))

(assert (=> d!62373 (= lt!272240 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8831 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8826 thiss!1204))))))

(assert (=> d!62373 (invariant!0 (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204) (size!4217 (buf!4660 thiss!1204)))))

(assert (=> d!62373 (= (bitIndex!0 (size!4217 (buf!4660 thiss!1204)) (currentByte!8831 thiss!1204) (currentBit!8826 thiss!1204)) lt!272240)))

(declare-fun b!177154 () Bool)

(declare-fun res!146828 () Bool)

(assert (=> b!177154 (=> (not res!146828) (not e!123452))))

(assert (=> b!177154 (= res!146828 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272240))))

(declare-fun b!177155 () Bool)

(declare-fun lt!272243 () (_ BitVec 64))

(assert (=> b!177155 (= e!123452 (bvsle lt!272240 (bvmul lt!272243 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177155 (or (= lt!272243 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272243 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272243)))))

(assert (=> b!177155 (= lt!272243 ((_ sign_extend 32) (size!4217 (buf!4660 thiss!1204))))))

(assert (= (and d!62373 res!146827) b!177154))

(assert (= (and b!177154 res!146828) b!177155))

(declare-fun m!277119 () Bool)

(assert (=> d!62373 m!277119))

(assert (=> d!62373 m!277079))

(assert (=> b!177101 d!62373))

(declare-fun d!62377 () Bool)

(assert (=> d!62377 (= (array_inv!3958 (buf!4660 thiss!1204)) (bvsge (size!4217 (buf!4660 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!177099 d!62377))

(declare-fun d!62379 () Bool)

(declare-datatypes ((tuple2!15268 0))(
  ( (tuple2!15269 (_1!8279 Bool) (_2!8279 BitStream!7542)) )
))
(declare-fun lt!272249 () tuple2!15268)

(declare-fun readBit!0 (BitStream!7542) tuple2!15268)

(assert (=> d!62379 (= lt!272249 (readBit!0 (readerFrom!0 (_2!8274 lt!272203) (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204))))))

(assert (=> d!62379 (= (readBitPure!0 (readerFrom!0 (_2!8274 lt!272203) (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204))) (tuple2!15261 (_2!8279 lt!272249) (_1!8279 lt!272249)))))

(declare-fun bs!15557 () Bool)

(assert (= bs!15557 d!62379))

(assert (=> bs!15557 m!277083))

(declare-fun m!277125 () Bool)

(assert (=> bs!15557 m!277125))

(assert (=> b!177100 d!62379))

(declare-fun d!62383 () Bool)

(declare-fun e!123458 () Bool)

(assert (=> d!62383 e!123458))

(declare-fun res!146836 () Bool)

(assert (=> d!62383 (=> (not res!146836) (not e!123458))))

(assert (=> d!62383 (= res!146836 (invariant!0 (currentBit!8826 (_2!8274 lt!272203)) (currentByte!8831 (_2!8274 lt!272203)) (size!4217 (buf!4660 (_2!8274 lt!272203)))))))

(assert (=> d!62383 (= (readerFrom!0 (_2!8274 lt!272203) (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204)) (BitStream!7543 (buf!4660 (_2!8274 lt!272203)) (currentByte!8831 thiss!1204) (currentBit!8826 thiss!1204)))))

(declare-fun b!177161 () Bool)

(assert (=> b!177161 (= e!123458 (invariant!0 (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204) (size!4217 (buf!4660 (_2!8274 lt!272203)))))))

(assert (= (and d!62383 res!146836) b!177161))

(assert (=> d!62383 m!277115))

(declare-fun m!277127 () Bool)

(assert (=> b!177161 m!277127))

(assert (=> b!177100 d!62383))

(declare-fun d!62385 () Bool)

(assert (=> d!62385 (= (invariant!0 (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204) (size!4217 (buf!4660 thiss!1204))) (and (bvsge (currentBit!8826 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8826 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8831 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8831 thiss!1204) (size!4217 (buf!4660 thiss!1204))) (and (= (currentBit!8826 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8831 thiss!1204) (size!4217 (buf!4660 thiss!1204)))))))))

(assert (=> b!177098 d!62385))

(assert (=> b!177103 d!62369))

(assert (=> b!177103 d!62373))

(declare-fun b!177200 () Bool)

(declare-fun res!146874 () Bool)

(declare-fun e!123479 () Bool)

(assert (=> b!177200 (=> (not res!146874) (not e!123479))))

(declare-fun lt!272306 () (_ BitVec 64))

(declare-fun lt!272305 () (_ BitVec 64))

(declare-fun lt!272304 () tuple2!15258)

(assert (=> b!177200 (= res!146874 (= (bitIndex!0 (size!4217 (buf!4660 (_2!8274 lt!272304))) (currentByte!8831 (_2!8274 lt!272304)) (currentBit!8826 (_2!8274 lt!272304))) (bvadd lt!272306 lt!272305)))))

(assert (=> b!177200 (or (not (= (bvand lt!272306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272305 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!272306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!272306 lt!272305) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177200 (= lt!272305 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!177200 (= lt!272306 (bitIndex!0 (size!4217 (buf!4660 thiss!1204)) (currentByte!8831 thiss!1204) (currentBit!8826 thiss!1204)))))

(declare-fun b!177201 () Bool)

(declare-fun res!146876 () Bool)

(assert (=> b!177201 (=> (not res!146876) (not e!123479))))

(assert (=> b!177201 (= res!146876 (isPrefixOf!0 thiss!1204 (_2!8274 lt!272304)))))

(declare-fun b!177203 () Bool)

(declare-fun e!123478 () Bool)

(declare-fun lt!272303 () tuple2!15260)

(assert (=> b!177203 (= e!123478 (= (bitIndex!0 (size!4217 (buf!4660 (_1!8275 lt!272303))) (currentByte!8831 (_1!8275 lt!272303)) (currentBit!8826 (_1!8275 lt!272303))) (bitIndex!0 (size!4217 (buf!4660 (_2!8274 lt!272304))) (currentByte!8831 (_2!8274 lt!272304)) (currentBit!8826 (_2!8274 lt!272304)))))))

(declare-fun d!62387 () Bool)

(assert (=> d!62387 e!123479))

(declare-fun res!146875 () Bool)

(assert (=> d!62387 (=> (not res!146875) (not e!123479))))

(assert (=> d!62387 (= res!146875 (= (size!4217 (buf!4660 thiss!1204)) (size!4217 (buf!4660 (_2!8274 lt!272304)))))))

(declare-fun choose!16 (BitStream!7542 Bool) tuple2!15258)

(assert (=> d!62387 (= lt!272304 (choose!16 thiss!1204 lt!272201))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62387 (validate_offset_bit!0 ((_ sign_extend 32) (size!4217 (buf!4660 thiss!1204))) ((_ sign_extend 32) (currentByte!8831 thiss!1204)) ((_ sign_extend 32) (currentBit!8826 thiss!1204)))))

(assert (=> d!62387 (= (appendBit!0 thiss!1204 lt!272201) lt!272304)))

(declare-fun b!177202 () Bool)

(assert (=> b!177202 (= e!123479 e!123478)))

(declare-fun res!146877 () Bool)

(assert (=> b!177202 (=> (not res!146877) (not e!123478))))

(assert (=> b!177202 (= res!146877 (and (= (_2!8275 lt!272303) lt!272201) (= (_1!8275 lt!272303) (_2!8274 lt!272304))))))

(assert (=> b!177202 (= lt!272303 (readBitPure!0 (readerFrom!0 (_2!8274 lt!272304) (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204))))))

(assert (= (and d!62387 res!146875) b!177200))

(assert (= (and b!177200 res!146874) b!177201))

(assert (= (and b!177201 res!146876) b!177202))

(assert (= (and b!177202 res!146877) b!177203))

(declare-fun m!277157 () Bool)

(assert (=> b!177203 m!277157))

(declare-fun m!277159 () Bool)

(assert (=> b!177203 m!277159))

(declare-fun m!277161 () Bool)

(assert (=> b!177202 m!277161))

(assert (=> b!177202 m!277161))

(declare-fun m!277163 () Bool)

(assert (=> b!177202 m!277163))

(declare-fun m!277165 () Bool)

(assert (=> d!62387 m!277165))

(declare-fun m!277167 () Bool)

(assert (=> d!62387 m!277167))

(assert (=> b!177200 m!277159))

(assert (=> b!177200 m!277075))

(declare-fun m!277169 () Bool)

(assert (=> b!177201 m!277169))

(assert (=> b!177103 d!62387))

(declare-fun d!62409 () Bool)

(declare-fun e!123485 () Bool)

(assert (=> d!62409 e!123485))

(declare-fun res!146883 () Bool)

(assert (=> d!62409 (=> (not res!146883) (not e!123485))))

(declare-fun lt!272311 () (_ BitVec 64))

(declare-fun lt!272308 () (_ BitVec 64))

(declare-fun lt!272309 () (_ BitVec 64))

(assert (=> d!62409 (= res!146883 (= lt!272309 (bvsub lt!272308 lt!272311)))))

(assert (=> d!62409 (or (= (bvand lt!272308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272311 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272308 lt!272311) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62409 (= lt!272311 (remainingBits!0 ((_ sign_extend 32) (size!4217 (buf!4660 (_1!8275 lt!272200)))) ((_ sign_extend 32) (currentByte!8831 (_1!8275 lt!272200))) ((_ sign_extend 32) (currentBit!8826 (_1!8275 lt!272200)))))))

(declare-fun lt!272310 () (_ BitVec 64))

(declare-fun lt!272307 () (_ BitVec 64))

(assert (=> d!62409 (= lt!272308 (bvmul lt!272310 lt!272307))))

(assert (=> d!62409 (or (= lt!272310 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272307 (bvsdiv (bvmul lt!272310 lt!272307) lt!272310)))))

(assert (=> d!62409 (= lt!272307 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62409 (= lt!272310 ((_ sign_extend 32) (size!4217 (buf!4660 (_1!8275 lt!272200)))))))

(assert (=> d!62409 (= lt!272309 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8831 (_1!8275 lt!272200))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8826 (_1!8275 lt!272200)))))))

(assert (=> d!62409 (invariant!0 (currentBit!8826 (_1!8275 lt!272200)) (currentByte!8831 (_1!8275 lt!272200)) (size!4217 (buf!4660 (_1!8275 lt!272200))))))

(assert (=> d!62409 (= (bitIndex!0 (size!4217 (buf!4660 (_1!8275 lt!272200))) (currentByte!8831 (_1!8275 lt!272200)) (currentBit!8826 (_1!8275 lt!272200))) lt!272309)))

(declare-fun b!177210 () Bool)

(declare-fun res!146884 () Bool)

(assert (=> b!177210 (=> (not res!146884) (not e!123485))))

(assert (=> b!177210 (= res!146884 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272309))))

(declare-fun b!177211 () Bool)

(declare-fun lt!272312 () (_ BitVec 64))

(assert (=> b!177211 (= e!123485 (bvsle lt!272309 (bvmul lt!272312 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177211 (or (= lt!272312 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272312 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272312)))))

(assert (=> b!177211 (= lt!272312 ((_ sign_extend 32) (size!4217 (buf!4660 (_1!8275 lt!272200)))))))

(assert (= (and d!62409 res!146883) b!177210))

(assert (= (and b!177210 res!146884) b!177211))

(declare-fun m!277175 () Bool)

(assert (=> d!62409 m!277175))

(declare-fun m!277177 () Bool)

(assert (=> d!62409 m!277177))

(assert (=> b!177104 d!62409))

(declare-fun d!62417 () Bool)

(assert (=> d!62417 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4217 (buf!4660 (_2!8274 lt!272203)))) ((_ sign_extend 32) (currentByte!8831 (_2!8274 lt!272203))) ((_ sign_extend 32) (currentBit!8826 (_2!8274 lt!272203))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4217 (buf!4660 (_2!8274 lt!272203)))) ((_ sign_extend 32) (currentByte!8831 (_2!8274 lt!272203))) ((_ sign_extend 32) (currentBit!8826 (_2!8274 lt!272203)))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun bs!15564 () Bool)

(assert (= bs!15564 d!62417))

(assert (=> bs!15564 m!277113))

(assert (=> b!177102 d!62417))

(declare-fun d!62423 () Bool)

(assert (=> d!62423 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8826 thiss!1204) (currentByte!8831 thiss!1204) (size!4217 (buf!4660 thiss!1204))))))

(declare-fun bs!15565 () Bool)

(assert (= bs!15565 d!62423))

(assert (=> bs!15565 m!277079))

(assert (=> start!39370 d!62423))

(declare-fun d!62425 () Bool)

(assert (=> d!62425 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4217 (buf!4660 thiss!1204))) ((_ sign_extend 32) (currentByte!8831 thiss!1204)) ((_ sign_extend 32) (currentBit!8826 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4217 (buf!4660 thiss!1204))) ((_ sign_extend 32) (currentByte!8831 thiss!1204)) ((_ sign_extend 32) (currentBit!8826 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15566 () Bool)

(assert (= bs!15566 d!62425))

(assert (=> bs!15566 m!277119))

(assert (=> b!177097 d!62425))

(check-sat (not d!62425) (not b!177161) (not b!177203) (not b!177202) (not d!62387) (not d!62423) (not d!62379) (not b!177201) (not b!177145) (not d!62383) (not b!177200) (not d!62369) (not d!62373) (not b!177147) (not d!62417) (not d!62409))
(check-sat)
