; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17936 () Bool)

(assert start!17936)

(declare-fun b!88188 () Bool)

(declare-fun e!58385 () Bool)

(declare-fun e!58389 () Bool)

(assert (=> b!88188 (= e!58385 e!58389)))

(declare-fun res!72602 () Bool)

(assert (=> b!88188 (=> (not res!72602) (not e!58389))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun lt!135995 () (_ BitVec 64))

(declare-fun lt!135993 () (_ BitVec 64))

(assert (=> b!88188 (= res!72602 (= lt!135995 (bvadd lt!135993 ((_ sign_extend 32) i!576))))))

(declare-datatypes ((array!4153 0))(
  ( (array!4154 (arr!2513 (Array (_ BitVec 32) (_ BitVec 8))) (size!1876 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3314 0))(
  ( (BitStream!3315 (buf!2266 array!4153) (currentByte!4490 (_ BitVec 32)) (currentBit!4485 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3314)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88188 (= lt!135995 (bitIndex!0 (size!1876 (buf!2266 thiss!1152)) (currentByte!4490 thiss!1152) (currentBit!4485 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3314)

(assert (=> b!88188 (= lt!135993 (bitIndex!0 (size!1876 (buf!2266 thiss!1151)) (currentByte!4490 thiss!1151) (currentBit!4485 thiss!1151)))))

(declare-fun b!88189 () Bool)

(declare-fun res!72593 () Bool)

(assert (=> b!88189 (=> (not res!72593) (not e!58385))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88189 (= res!72593 (validate_offset_bits!1 ((_ sign_extend 32) (size!1876 (buf!2266 thiss!1151))) ((_ sign_extend 32) (currentByte!4490 thiss!1151)) ((_ sign_extend 32) (currentBit!4485 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88190 () Bool)

(declare-fun e!58380 () Bool)

(declare-fun e!58388 () Bool)

(assert (=> b!88190 (= e!58380 e!58388)))

(declare-fun res!72601 () Bool)

(assert (=> b!88190 (=> (not res!72601) (not e!58388))))

(declare-fun lt!135991 () (_ BitVec 64))

(assert (=> b!88190 (= res!72601 (= lt!135991 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135995)))))

(declare-datatypes ((Unit!5771 0))(
  ( (Unit!5772) )
))
(declare-datatypes ((tuple2!7446 0))(
  ( (tuple2!7447 (_1!3956 Unit!5771) (_2!3956 BitStream!3314)) )
))
(declare-fun lt!135996 () tuple2!7446)

(assert (=> b!88190 (= lt!135991 (bitIndex!0 (size!1876 (buf!2266 (_2!3956 lt!135996))) (currentByte!4490 (_2!3956 lt!135996)) (currentBit!4485 (_2!3956 lt!135996))))))

(declare-fun b!88191 () Bool)

(declare-fun e!58383 () Bool)

(declare-datatypes ((tuple2!7448 0))(
  ( (tuple2!7449 (_1!3957 BitStream!3314) (_2!3957 Bool)) )
))
(declare-fun lt!135994 () tuple2!7448)

(assert (=> b!88191 (= e!58383 (= (bitIndex!0 (size!1876 (buf!2266 (_1!3957 lt!135994))) (currentByte!4490 (_1!3957 lt!135994)) (currentBit!4485 (_1!3957 lt!135994))) lt!135991))))

(declare-fun b!88192 () Bool)

(declare-fun e!58382 () Bool)

(assert (=> b!88192 (= e!58389 (not e!58382))))

(declare-fun res!72596 () Bool)

(assert (=> b!88192 (=> res!72596 e!58382)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88192 (= res!72596 (not (invariant!0 (currentBit!4485 (_2!3956 lt!135996)) (currentByte!4490 (_2!3956 lt!135996)) (size!1876 (buf!2266 (_2!3956 lt!135996))))))))

(assert (=> b!88192 e!58380))

(declare-fun res!72603 () Bool)

(assert (=> b!88192 (=> (not res!72603) (not e!58380))))

(assert (=> b!88192 (= res!72603 (= (size!1876 (buf!2266 thiss!1152)) (size!1876 (buf!2266 (_2!3956 lt!135996)))))))

(declare-fun lt!135992 () Bool)

(declare-fun appendBit!0 (BitStream!3314 Bool) tuple2!7446)

(assert (=> b!88192 (= lt!135996 (appendBit!0 thiss!1152 lt!135992))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!88192 (= lt!135992 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88193 () Bool)

(declare-fun res!72590 () Bool)

(assert (=> b!88193 (=> (not res!72590) (not e!58385))))

(assert (=> b!88193 (= res!72590 (and (bvsle i!576 nBits!336) (= (size!1876 (buf!2266 thiss!1152)) (size!1876 (buf!2266 thiss!1151)))))))

(declare-fun b!88194 () Bool)

(declare-fun res!72604 () Bool)

(assert (=> b!88194 (=> res!72604 e!58382)))

(assert (=> b!88194 (= res!72604 (not (= (bitIndex!0 (size!1876 (buf!2266 (_2!3956 lt!135996))) (currentByte!4490 (_2!3956 lt!135996)) (currentBit!4485 (_2!3956 lt!135996))) (bvadd lt!135993 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!88195 () Bool)

(declare-fun res!72594 () Bool)

(assert (=> b!88195 (=> res!72594 e!58382)))

(assert (=> b!88195 (= res!72594 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1876 (buf!2266 (_2!3956 lt!135996))) (size!1876 (buf!2266 thiss!1151))))))))

(declare-fun b!88196 () Bool)

(declare-fun res!72600 () Bool)

(assert (=> b!88196 (=> (not res!72600) (not e!58389))))

(assert (=> b!88196 (= res!72600 (bvslt i!576 nBits!336))))

(declare-fun b!88197 () Bool)

(declare-fun e!58387 () Bool)

(declare-fun array_inv!1722 (array!4153) Bool)

(assert (=> b!88197 (= e!58387 (array_inv!1722 (buf!2266 thiss!1152)))))

(declare-fun b!88198 () Bool)

(assert (=> b!88198 (= e!58382 (bvsge ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88199 () Bool)

(declare-fun res!72599 () Bool)

(assert (=> b!88199 (=> (not res!72599) (not e!58388))))

(declare-fun isPrefixOf!0 (BitStream!3314 BitStream!3314) Bool)

(assert (=> b!88199 (= res!72599 (isPrefixOf!0 thiss!1152 (_2!3956 lt!135996)))))

(declare-fun res!72595 () Bool)

(assert (=> start!17936 (=> (not res!72595) (not e!58385))))

(assert (=> start!17936 (= res!72595 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17936 e!58385))

(declare-fun inv!12 (BitStream!3314) Bool)

(assert (=> start!17936 (and (inv!12 thiss!1152) e!58387)))

(declare-fun e!58381 () Bool)

(assert (=> start!17936 (and (inv!12 thiss!1151) e!58381)))

(assert (=> start!17936 true))

(declare-fun b!88200 () Bool)

(declare-fun res!72588 () Bool)

(assert (=> b!88200 (=> (not res!72588) (not e!58385))))

(assert (=> b!88200 (= res!72588 (invariant!0 (currentBit!4485 thiss!1152) (currentByte!4490 thiss!1152) (size!1876 (buf!2266 thiss!1152))))))

(declare-fun b!88201 () Bool)

(declare-fun res!72592 () Bool)

(assert (=> b!88201 (=> (not res!72592) (not e!58385))))

(assert (=> b!88201 (= res!72592 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88202 () Bool)

(declare-fun res!72587 () Bool)

(assert (=> b!88202 (=> (not res!72587) (not e!58389))))

(assert (=> b!88202 (= res!72587 (validate_offset_bits!1 ((_ sign_extend 32) (size!1876 (buf!2266 thiss!1152))) ((_ sign_extend 32) (currentByte!4490 thiss!1152)) ((_ sign_extend 32) (currentBit!4485 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88203 () Bool)

(assert (=> b!88203 (= e!58388 e!58383)))

(declare-fun res!72598 () Bool)

(assert (=> b!88203 (=> (not res!72598) (not e!58383))))

(assert (=> b!88203 (= res!72598 (and (= (_2!3957 lt!135994) lt!135992) (= (_1!3957 lt!135994) (_2!3956 lt!135996))))))

(declare-fun readBitPure!0 (BitStream!3314) tuple2!7448)

(declare-fun readerFrom!0 (BitStream!3314 (_ BitVec 32) (_ BitVec 32)) BitStream!3314)

(assert (=> b!88203 (= lt!135994 (readBitPure!0 (readerFrom!0 (_2!3956 lt!135996) (currentBit!4485 thiss!1152) (currentByte!4490 thiss!1152))))))

(declare-fun b!88204 () Bool)

(declare-fun res!72589 () Bool)

(assert (=> b!88204 (=> res!72589 e!58382)))

(assert (=> b!88204 (= res!72589 (or (bvsgt ((_ sign_extend 32) (size!1876 (buf!2266 (_2!3956 lt!135996)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4490 (_2!3956 lt!135996))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4485 (_2!3956 lt!135996))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1876 (buf!2266 (_2!3956 lt!135996)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4490 (_2!3956 lt!135996))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4485 (_2!3956 lt!135996))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88205 () Bool)

(declare-fun res!72591 () Bool)

(assert (=> b!88205 (=> (not res!72591) (not e!58385))))

(assert (=> b!88205 (= res!72591 (invariant!0 (currentBit!4485 thiss!1151) (currentByte!4490 thiss!1151) (size!1876 (buf!2266 thiss!1151))))))

(declare-fun b!88206 () Bool)

(declare-fun res!72597 () Bool)

(assert (=> b!88206 (=> res!72597 e!58382)))

(assert (=> b!88206 (= res!72597 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4485 (_2!3956 lt!135996)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4490 (_2!3956 lt!135996)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1876 (buf!2266 (_2!3956 lt!135996))))))))))

(declare-fun b!88207 () Bool)

(assert (=> b!88207 (= e!58381 (array_inv!1722 (buf!2266 thiss!1151)))))

(assert (= (and start!17936 res!72595) b!88189))

(assert (= (and b!88189 res!72593) b!88205))

(assert (= (and b!88205 res!72591) b!88201))

(assert (= (and b!88201 res!72592) b!88200))

(assert (= (and b!88200 res!72588) b!88193))

(assert (= (and b!88193 res!72590) b!88188))

(assert (= (and b!88188 res!72602) b!88202))

(assert (= (and b!88202 res!72587) b!88196))

(assert (= (and b!88196 res!72600) b!88192))

(assert (= (and b!88192 res!72603) b!88190))

(assert (= (and b!88190 res!72601) b!88199))

(assert (= (and b!88199 res!72599) b!88203))

(assert (= (and b!88203 res!72598) b!88191))

(assert (= (and b!88192 (not res!72596)) b!88195))

(assert (= (and b!88195 (not res!72594)) b!88194))

(assert (= (and b!88194 (not res!72604)) b!88204))

(assert (= (and b!88204 (not res!72589)) b!88206))

(assert (= (and b!88206 (not res!72597)) b!88198))

(assert (= start!17936 b!88197))

(assert (= start!17936 b!88207))

(declare-fun m!133409 () Bool)

(assert (=> b!88194 m!133409))

(declare-fun m!133411 () Bool)

(assert (=> b!88205 m!133411))

(declare-fun m!133413 () Bool)

(assert (=> b!88200 m!133413))

(declare-fun m!133415 () Bool)

(assert (=> b!88188 m!133415))

(declare-fun m!133417 () Bool)

(assert (=> b!88188 m!133417))

(declare-fun m!133419 () Bool)

(assert (=> b!88199 m!133419))

(declare-fun m!133421 () Bool)

(assert (=> b!88192 m!133421))

(declare-fun m!133423 () Bool)

(assert (=> b!88192 m!133423))

(declare-fun m!133425 () Bool)

(assert (=> start!17936 m!133425))

(declare-fun m!133427 () Bool)

(assert (=> start!17936 m!133427))

(declare-fun m!133429 () Bool)

(assert (=> b!88191 m!133429))

(declare-fun m!133431 () Bool)

(assert (=> b!88189 m!133431))

(declare-fun m!133433 () Bool)

(assert (=> b!88203 m!133433))

(assert (=> b!88203 m!133433))

(declare-fun m!133435 () Bool)

(assert (=> b!88203 m!133435))

(declare-fun m!133437 () Bool)

(assert (=> b!88206 m!133437))

(declare-fun m!133439 () Bool)

(assert (=> b!88207 m!133439))

(declare-fun m!133441 () Bool)

(assert (=> b!88197 m!133441))

(assert (=> b!88190 m!133409))

(declare-fun m!133443 () Bool)

(assert (=> b!88202 m!133443))

(push 1)

(assert (not b!88189))

(assert (not b!88206))

(assert (not b!88200))

(assert (not b!88205))

(assert (not b!88197))

(assert (not b!88207))

(assert (not start!17936))

(assert (not b!88194))

(assert (not b!88188))

(assert (not b!88191))

(assert (not b!88199))

(assert (not b!88203))

(assert (not b!88190))

(assert (not b!88192))

(assert (not b!88202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

