; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17628 () Bool)

(assert start!17628)

(declare-fun res!69723 () Bool)

(declare-fun e!56655 () Bool)

(assert (=> start!17628 (=> (not res!69723) (not e!56655))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17628 (= res!69723 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17628 e!56655))

(assert (=> start!17628 true))

(declare-datatypes ((array!4031 0))(
  ( (array!4032 (arr!2458 (Array (_ BitVec 32) (_ BitVec 8))) (size!1821 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3204 0))(
  ( (BitStream!3205 (buf!2211 array!4031) (currentByte!4399 (_ BitVec 32)) (currentBit!4394 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3204)

(declare-fun e!56656 () Bool)

(declare-fun inv!12 (BitStream!3204) Bool)

(assert (=> start!17628 (and (inv!12 thiss!1151) e!56656)))

(declare-fun thiss!1152 () BitStream!3204)

(declare-fun e!56657 () Bool)

(assert (=> start!17628 (and (inv!12 thiss!1152) e!56657)))

(declare-fun b!84974 () Bool)

(declare-fun res!69721 () Bool)

(assert (=> b!84974 (=> (not res!69721) (not e!56655))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84974 (= res!69721 (invariant!0 (currentBit!4394 thiss!1151) (currentByte!4399 thiss!1151) (size!1821 (buf!2211 thiss!1151))))))

(declare-fun b!84975 () Bool)

(declare-fun res!69722 () Bool)

(assert (=> b!84975 (=> (not res!69722) (not e!56655))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84975 (= res!69722 (= (bitIndex!0 (size!1821 (buf!2211 thiss!1152)) (currentByte!4399 thiss!1152) (currentBit!4394 thiss!1152)) (bvadd (bitIndex!0 (size!1821 (buf!2211 thiss!1151)) (currentByte!4399 thiss!1151) (currentBit!4394 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!84976 () Bool)

(assert (=> b!84976 (= e!56655 (or (bvsgt ((_ sign_extend 32) (size!1821 (buf!2211 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4399 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4394 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!84977 () Bool)

(declare-fun res!69725 () Bool)

(assert (=> b!84977 (=> (not res!69725) (not e!56655))))

(assert (=> b!84977 (= res!69725 (invariant!0 (currentBit!4394 thiss!1152) (currentByte!4399 thiss!1152) (size!1821 (buf!2211 thiss!1152))))))

(declare-fun b!84978 () Bool)

(declare-fun array_inv!1667 (array!4031) Bool)

(assert (=> b!84978 (= e!56657 (array_inv!1667 (buf!2211 thiss!1152)))))

(declare-fun b!84979 () Bool)

(declare-fun res!69727 () Bool)

(assert (=> b!84979 (=> (not res!69727) (not e!56655))))

(assert (=> b!84979 (= res!69727 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!84980 () Bool)

(declare-fun res!69726 () Bool)

(assert (=> b!84980 (=> (not res!69726) (not e!56655))))

(assert (=> b!84980 (= res!69726 (and (bvsle i!576 nBits!336) (= (size!1821 (buf!2211 thiss!1152)) (size!1821 (buf!2211 thiss!1151)))))))

(declare-fun b!84981 () Bool)

(assert (=> b!84981 (= e!56656 (array_inv!1667 (buf!2211 thiss!1151)))))

(declare-fun b!84982 () Bool)

(declare-fun res!69724 () Bool)

(assert (=> b!84982 (=> (not res!69724) (not e!56655))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84982 (= res!69724 (validate_offset_bits!1 ((_ sign_extend 32) (size!1821 (buf!2211 thiss!1151))) ((_ sign_extend 32) (currentByte!4399 thiss!1151)) ((_ sign_extend 32) (currentBit!4394 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(assert (= (and start!17628 res!69723) b!84982))

(assert (= (and b!84982 res!69724) b!84974))

(assert (= (and b!84974 res!69721) b!84979))

(assert (= (and b!84979 res!69727) b!84977))

(assert (= (and b!84977 res!69725) b!84980))

(assert (= (and b!84980 res!69726) b!84975))

(assert (= (and b!84975 res!69722) b!84976))

(assert (= start!17628 b!84981))

(assert (= start!17628 b!84978))

(declare-fun m!131303 () Bool)

(assert (=> start!17628 m!131303))

(declare-fun m!131305 () Bool)

(assert (=> start!17628 m!131305))

(declare-fun m!131307 () Bool)

(assert (=> b!84974 m!131307))

(declare-fun m!131309 () Bool)

(assert (=> b!84975 m!131309))

(declare-fun m!131311 () Bool)

(assert (=> b!84975 m!131311))

(declare-fun m!131313 () Bool)

(assert (=> b!84978 m!131313))

(declare-fun m!131315 () Bool)

(assert (=> b!84977 m!131315))

(declare-fun m!131317 () Bool)

(assert (=> b!84981 m!131317))

(declare-fun m!131319 () Bool)

(assert (=> b!84982 m!131319))

(check-sat (not b!84981) (not b!84982) (not start!17628) (not b!84975) (not b!84978) (not b!84974) (not b!84977))
(check-sat)
