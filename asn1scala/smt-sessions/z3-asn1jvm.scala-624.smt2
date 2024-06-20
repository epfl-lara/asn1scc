; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17676 () Bool)

(assert start!17676)

(declare-fun b!85260 () Bool)

(declare-fun e!56802 () Bool)

(declare-datatypes ((array!4052 0))(
  ( (array!4053 (arr!2467 (Array (_ BitVec 32) (_ BitVec 8))) (size!1830 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3222 0))(
  ( (BitStream!3223 (buf!2220 array!4052) (currentByte!4417 (_ BitVec 32)) (currentBit!4412 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3222)

(declare-fun array_inv!1676 (array!4052) Bool)

(assert (=> b!85260 (= e!56802 (array_inv!1676 (buf!2220 thiss!1151)))))

(declare-fun b!85261 () Bool)

(declare-fun res!69957 () Bool)

(declare-fun e!56804 () Bool)

(assert (=> b!85261 (=> (not res!69957) (not e!56804))))

(declare-fun thiss!1152 () BitStream!3222)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85261 (= res!69957 (= (bitIndex!0 (size!1830 (buf!2220 thiss!1152)) (currentByte!4417 thiss!1152) (currentBit!4412 thiss!1152)) (bvadd (bitIndex!0 (size!1830 (buf!2220 thiss!1151)) (currentByte!4417 thiss!1151) (currentBit!4412 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!85262 () Bool)

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85262 (= e!56804 (bvslt ((_ sign_extend 32) (bvsub nBits!336 i!576)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!85263 () Bool)

(declare-fun res!69961 () Bool)

(assert (=> b!85263 (=> (not res!69961) (not e!56804))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85263 (= res!69961 (invariant!0 (currentBit!4412 thiss!1152) (currentByte!4417 thiss!1152) (size!1830 (buf!2220 thiss!1152))))))

(declare-fun b!85264 () Bool)

(declare-fun e!56803 () Bool)

(assert (=> b!85264 (= e!56803 (array_inv!1676 (buf!2220 thiss!1152)))))

(declare-fun b!85265 () Bool)

(declare-fun res!69953 () Bool)

(assert (=> b!85265 (=> (not res!69953) (not e!56804))))

(assert (=> b!85265 (= res!69953 (and (bvsle ((_ sign_extend 32) (size!1830 (buf!2220 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4417 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4412 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1830 (buf!2220 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4417 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4412 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!69959 () Bool)

(assert (=> start!17676 (=> (not res!69959) (not e!56804))))

(assert (=> start!17676 (= res!69959 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17676 e!56804))

(assert (=> start!17676 true))

(declare-fun inv!12 (BitStream!3222) Bool)

(assert (=> start!17676 (and (inv!12 thiss!1151) e!56802)))

(assert (=> start!17676 (and (inv!12 thiss!1152) e!56803)))

(declare-fun b!85266 () Bool)

(declare-fun res!69960 () Bool)

(assert (=> b!85266 (=> (not res!69960) (not e!56804))))

(assert (=> b!85266 (= res!69960 (invariant!0 (currentBit!4412 thiss!1151) (currentByte!4417 thiss!1151) (size!1830 (buf!2220 thiss!1151))))))

(declare-fun b!85267 () Bool)

(declare-fun res!69954 () Bool)

(assert (=> b!85267 (=> (not res!69954) (not e!56804))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85267 (= res!69954 (validate_offset_bits!1 ((_ sign_extend 32) (size!1830 (buf!2220 thiss!1151))) ((_ sign_extend 32) (currentByte!4417 thiss!1151)) ((_ sign_extend 32) (currentBit!4412 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85268 () Bool)

(declare-fun res!69958 () Bool)

(assert (=> b!85268 (=> (not res!69958) (not e!56804))))

(assert (=> b!85268 (= res!69958 (and (bvsle i!576 nBits!336) (= (size!1830 (buf!2220 thiss!1152)) (size!1830 (buf!2220 thiss!1151)))))))

(declare-fun b!85269 () Bool)

(declare-fun res!69956 () Bool)

(assert (=> b!85269 (=> (not res!69956) (not e!56804))))

(assert (=> b!85269 (= res!69956 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4412 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4417 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (size!1830 (buf!2220 thiss!1152))))))))

(declare-fun b!85270 () Bool)

(declare-fun res!69955 () Bool)

(assert (=> b!85270 (=> (not res!69955) (not e!56804))))

(assert (=> b!85270 (= res!69955 (bvsge i!576 #b00000000000000000000000000000000))))

(assert (= (and start!17676 res!69959) b!85267))

(assert (= (and b!85267 res!69954) b!85266))

(assert (= (and b!85266 res!69960) b!85270))

(assert (= (and b!85270 res!69955) b!85263))

(assert (= (and b!85263 res!69961) b!85268))

(assert (= (and b!85268 res!69958) b!85261))

(assert (= (and b!85261 res!69957) b!85265))

(assert (= (and b!85265 res!69953) b!85269))

(assert (= (and b!85269 res!69956) b!85262))

(assert (= start!17676 b!85260))

(assert (= start!17676 b!85264))

(declare-fun m!131485 () Bool)

(assert (=> b!85269 m!131485))

(declare-fun m!131487 () Bool)

(assert (=> b!85263 m!131487))

(declare-fun m!131489 () Bool)

(assert (=> b!85261 m!131489))

(declare-fun m!131491 () Bool)

(assert (=> b!85261 m!131491))

(declare-fun m!131493 () Bool)

(assert (=> b!85260 m!131493))

(declare-fun m!131495 () Bool)

(assert (=> b!85264 m!131495))

(declare-fun m!131497 () Bool)

(assert (=> b!85266 m!131497))

(declare-fun m!131499 () Bool)

(assert (=> b!85267 m!131499))

(declare-fun m!131501 () Bool)

(assert (=> start!17676 m!131501))

(declare-fun m!131503 () Bool)

(assert (=> start!17676 m!131503))

(check-sat (not b!85266) (not b!85264) (not b!85260) (not start!17676) (not b!85267) (not b!85263) (not b!85261) (not b!85269))
(check-sat)
