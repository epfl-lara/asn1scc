; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18376 () Bool)

(assert start!18376)

(declare-fun b!91052 () Bool)

(declare-fun e!59896 () Bool)

(declare-datatypes ((array!4260 0))(
  ( (array!4261 (arr!2556 (Array (_ BitVec 32) (_ BitVec 8))) (size!1919 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3400 0))(
  ( (BitStream!3401 (buf!2309 array!4260) (currentByte!4599 (_ BitVec 32)) (currentBit!4594 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3400)

(declare-fun array_inv!1765 (array!4260) Bool)

(assert (=> b!91052 (= e!59896 (array_inv!1765 (buf!2309 thiss!1151)))))

(declare-fun b!91053 () Bool)

(declare-fun e!59897 () Bool)

(declare-fun e!59893 () Bool)

(assert (=> b!91053 (= e!59897 e!59893)))

(declare-fun res!75144 () Bool)

(assert (=> b!91053 (=> (not res!75144) (not e!59893))))

(declare-datatypes ((Unit!5830 0))(
  ( (Unit!5831) )
))
(declare-datatypes ((tuple2!7576 0))(
  ( (tuple2!7577 (_1!4033 Unit!5830) (_2!4033 BitStream!3400)) )
))
(declare-fun lt!137621 () tuple2!7576)

(declare-datatypes ((tuple2!7578 0))(
  ( (tuple2!7579 (_1!4034 BitStream!3400) (_2!4034 Bool)) )
))
(declare-fun lt!137624 () tuple2!7578)

(declare-fun lt!137622 () Bool)

(assert (=> b!91053 (= res!75144 (and (= (_2!4034 lt!137624) lt!137622) (= (_1!4034 lt!137624) (_2!4033 lt!137621))))))

(declare-fun thiss!1152 () BitStream!3400)

(declare-fun readBitPure!0 (BitStream!3400) tuple2!7578)

(declare-fun readerFrom!0 (BitStream!3400 (_ BitVec 32) (_ BitVec 32)) BitStream!3400)

(assert (=> b!91053 (= lt!137624 (readBitPure!0 (readerFrom!0 (_2!4033 lt!137621) (currentBit!4594 thiss!1152) (currentByte!4599 thiss!1152))))))

(declare-fun b!91054 () Bool)

(declare-fun res!75151 () Bool)

(declare-fun e!59892 () Bool)

(assert (=> b!91054 (=> (not res!75151) (not e!59892))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91054 (= res!75151 (invariant!0 (currentBit!4594 thiss!1151) (currentByte!4599 thiss!1151) (size!1919 (buf!2309 thiss!1151))))))

(declare-fun b!91055 () Bool)

(declare-fun lt!137620 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91055 (= e!59893 (= (bitIndex!0 (size!1919 (buf!2309 (_1!4034 lt!137624))) (currentByte!4599 (_1!4034 lt!137624)) (currentBit!4594 (_1!4034 lt!137624))) lt!137620))))

(declare-fun res!75147 () Bool)

(assert (=> start!18376 (=> (not res!75147) (not e!59892))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!18376 (= res!75147 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18376 e!59892))

(declare-fun e!59898 () Bool)

(declare-fun inv!12 (BitStream!3400) Bool)

(assert (=> start!18376 (and (inv!12 thiss!1152) e!59898)))

(assert (=> start!18376 (and (inv!12 thiss!1151) e!59896)))

(assert (=> start!18376 true))

(declare-fun b!91056 () Bool)

(declare-fun res!75140 () Bool)

(declare-fun e!59895 () Bool)

(assert (=> b!91056 (=> res!75140 e!59895)))

(declare-fun lt!137623 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!91056 (= res!75140 (not (= (bitIndex!0 (size!1919 (buf!2309 (_2!4033 lt!137621))) (currentByte!4599 (_2!4033 lt!137621)) (currentBit!4594 (_2!4033 lt!137621))) (bvadd lt!137623 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!91057 () Bool)

(declare-fun e!59901 () Bool)

(assert (=> b!91057 (= e!59901 e!59897)))

(declare-fun res!75142 () Bool)

(assert (=> b!91057 (=> (not res!75142) (not e!59897))))

(declare-fun lt!137625 () (_ BitVec 64))

(assert (=> b!91057 (= res!75142 (= lt!137620 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137625)))))

(assert (=> b!91057 (= lt!137620 (bitIndex!0 (size!1919 (buf!2309 (_2!4033 lt!137621))) (currentByte!4599 (_2!4033 lt!137621)) (currentBit!4594 (_2!4033 lt!137621))))))

(declare-fun b!91058 () Bool)

(declare-fun res!75154 () Bool)

(assert (=> b!91058 (=> res!75154 e!59895)))

(assert (=> b!91058 (= res!75154 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1919 (buf!2309 (_2!4033 lt!137621))) (size!1919 (buf!2309 thiss!1151))))))))

(declare-fun b!91059 () Bool)

(declare-fun res!75143 () Bool)

(assert (=> b!91059 (=> (not res!75143) (not e!59892))))

(assert (=> b!91059 (= res!75143 (invariant!0 (currentBit!4594 thiss!1152) (currentByte!4599 thiss!1152) (size!1919 (buf!2309 thiss!1152))))))

(declare-fun b!91060 () Bool)

(declare-fun e!59899 () Bool)

(assert (=> b!91060 (= e!59899 (not e!59895))))

(declare-fun res!75150 () Bool)

(assert (=> b!91060 (=> res!75150 e!59895)))

(assert (=> b!91060 (= res!75150 (not (invariant!0 (currentBit!4594 (_2!4033 lt!137621)) (currentByte!4599 (_2!4033 lt!137621)) (size!1919 (buf!2309 (_2!4033 lt!137621))))))))

(assert (=> b!91060 e!59901))

(declare-fun res!75145 () Bool)

(assert (=> b!91060 (=> (not res!75145) (not e!59901))))

(assert (=> b!91060 (= res!75145 (= (size!1919 (buf!2309 thiss!1152)) (size!1919 (buf!2309 (_2!4033 lt!137621)))))))

(declare-fun appendBit!0 (BitStream!3400 Bool) tuple2!7576)

(assert (=> b!91060 (= lt!137621 (appendBit!0 thiss!1152 lt!137622))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!91060 (= lt!137622 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91061 () Bool)

(declare-fun res!75146 () Bool)

(assert (=> b!91061 (=> (not res!75146) (not e!59897))))

(declare-fun isPrefixOf!0 (BitStream!3400 BitStream!3400) Bool)

(assert (=> b!91061 (= res!75146 (isPrefixOf!0 thiss!1152 (_2!4033 lt!137621)))))

(declare-fun b!91062 () Bool)

(assert (=> b!91062 (= e!59895 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!576) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)) #b10000000000000000000000000000000))))))

(declare-fun b!91063 () Bool)

(declare-fun res!75148 () Bool)

(assert (=> b!91063 (=> (not res!75148) (not e!59899))))

(assert (=> b!91063 (= res!75148 (bvslt i!576 nBits!336))))

(declare-fun b!91064 () Bool)

(declare-fun res!75149 () Bool)

(assert (=> b!91064 (=> (not res!75149) (not e!59892))))

(assert (=> b!91064 (= res!75149 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!91065 () Bool)

(assert (=> b!91065 (= e!59898 (array_inv!1765 (buf!2309 thiss!1152)))))

(declare-fun b!91066 () Bool)

(assert (=> b!91066 (= e!59892 e!59899)))

(declare-fun res!75139 () Bool)

(assert (=> b!91066 (=> (not res!75139) (not e!59899))))

(assert (=> b!91066 (= res!75139 (= lt!137625 (bvadd lt!137623 ((_ sign_extend 32) i!576))))))

(assert (=> b!91066 (= lt!137625 (bitIndex!0 (size!1919 (buf!2309 thiss!1152)) (currentByte!4599 thiss!1152) (currentBit!4594 thiss!1152)))))

(assert (=> b!91066 (= lt!137623 (bitIndex!0 (size!1919 (buf!2309 thiss!1151)) (currentByte!4599 thiss!1151) (currentBit!4594 thiss!1151)))))

(declare-fun b!91067 () Bool)

(declare-fun res!75141 () Bool)

(assert (=> b!91067 (=> (not res!75141) (not e!59892))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91067 (= res!75141 (validate_offset_bits!1 ((_ sign_extend 32) (size!1919 (buf!2309 thiss!1151))) ((_ sign_extend 32) (currentByte!4599 thiss!1151)) ((_ sign_extend 32) (currentBit!4594 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!91068 () Bool)

(declare-fun res!75153 () Bool)

(assert (=> b!91068 (=> (not res!75153) (not e!59899))))

(assert (=> b!91068 (= res!75153 (validate_offset_bits!1 ((_ sign_extend 32) (size!1919 (buf!2309 thiss!1152))) ((_ sign_extend 32) (currentByte!4599 thiss!1152)) ((_ sign_extend 32) (currentBit!4594 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!91069 () Bool)

(declare-fun res!75152 () Bool)

(assert (=> b!91069 (=> (not res!75152) (not e!59892))))

(assert (=> b!91069 (= res!75152 (and (bvsle i!576 nBits!336) (= (size!1919 (buf!2309 thiss!1152)) (size!1919 (buf!2309 thiss!1151)))))))

(assert (= (and start!18376 res!75147) b!91067))

(assert (= (and b!91067 res!75141) b!91054))

(assert (= (and b!91054 res!75151) b!91064))

(assert (= (and b!91064 res!75149) b!91059))

(assert (= (and b!91059 res!75143) b!91069))

(assert (= (and b!91069 res!75152) b!91066))

(assert (= (and b!91066 res!75139) b!91068))

(assert (= (and b!91068 res!75153) b!91063))

(assert (= (and b!91063 res!75148) b!91060))

(assert (= (and b!91060 res!75145) b!91057))

(assert (= (and b!91057 res!75142) b!91061))

(assert (= (and b!91061 res!75146) b!91053))

(assert (= (and b!91053 res!75144) b!91055))

(assert (= (and b!91060 (not res!75150)) b!91058))

(assert (= (and b!91058 (not res!75154)) b!91056))

(assert (= (and b!91056 (not res!75140)) b!91062))

(assert (= start!18376 b!91065))

(assert (= start!18376 b!91052))

(declare-fun m!135329 () Bool)

(assert (=> b!91060 m!135329))

(declare-fun m!135331 () Bool)

(assert (=> b!91060 m!135331))

(declare-fun m!135333 () Bool)

(assert (=> b!91066 m!135333))

(declare-fun m!135335 () Bool)

(assert (=> b!91066 m!135335))

(declare-fun m!135337 () Bool)

(assert (=> b!91067 m!135337))

(declare-fun m!135339 () Bool)

(assert (=> b!91052 m!135339))

(declare-fun m!135341 () Bool)

(assert (=> b!91056 m!135341))

(declare-fun m!135343 () Bool)

(assert (=> b!91053 m!135343))

(assert (=> b!91053 m!135343))

(declare-fun m!135345 () Bool)

(assert (=> b!91053 m!135345))

(assert (=> b!91057 m!135341))

(declare-fun m!135347 () Bool)

(assert (=> b!91054 m!135347))

(declare-fun m!135349 () Bool)

(assert (=> b!91061 m!135349))

(declare-fun m!135351 () Bool)

(assert (=> b!91068 m!135351))

(declare-fun m!135353 () Bool)

(assert (=> start!18376 m!135353))

(declare-fun m!135355 () Bool)

(assert (=> start!18376 m!135355))

(declare-fun m!135357 () Bool)

(assert (=> b!91059 m!135357))

(declare-fun m!135359 () Bool)

(assert (=> b!91065 m!135359))

(declare-fun m!135361 () Bool)

(assert (=> b!91055 m!135361))

(push 1)

(assert (not b!91056))

(assert (not b!91065))

(assert (not b!91059))

(assert (not b!91061))

(assert (not b!91053))

(assert (not b!91067))

(assert (not b!91055))

(assert (not b!91052))

(assert (not b!91066))

(assert (not b!91060))

(assert (not start!18376))

(assert (not b!91057))

(assert (not b!91054))

(assert (not b!91068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

