; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17678 () Bool)

(assert start!17678)

(declare-fun b!85293 () Bool)

(declare-fun res!69980 () Bool)

(declare-fun e!56818 () Bool)

(assert (=> b!85293 (=> (not res!69980) (not e!56818))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85293 (= res!69980 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85294 () Bool)

(declare-fun res!69983 () Bool)

(assert (=> b!85294 (=> (not res!69983) (not e!56818))))

(declare-datatypes ((array!4054 0))(
  ( (array!4055 (arr!2468 (Array (_ BitVec 32) (_ BitVec 8))) (size!1831 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3224 0))(
  ( (BitStream!3225 (buf!2221 array!4054) (currentByte!4418 (_ BitVec 32)) (currentBit!4413 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3224)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85294 (= res!69983 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4413 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4418 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (size!1831 (buf!2221 thiss!1152))))))))

(declare-fun b!85295 () Bool)

(declare-fun res!69988 () Bool)

(assert (=> b!85295 (=> (not res!69988) (not e!56818))))

(declare-fun thiss!1151 () BitStream!3224)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85295 (= res!69988 (validate_offset_bits!1 ((_ sign_extend 32) (size!1831 (buf!2221 thiss!1151))) ((_ sign_extend 32) (currentByte!4418 thiss!1151)) ((_ sign_extend 32) (currentBit!4413 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85296 () Bool)

(declare-fun e!56817 () Bool)

(declare-fun array_inv!1677 (array!4054) Bool)

(assert (=> b!85296 (= e!56817 (array_inv!1677 (buf!2221 thiss!1152)))))

(declare-fun b!85297 () Bool)

(declare-fun res!69982 () Bool)

(assert (=> b!85297 (=> (not res!69982) (not e!56818))))

(assert (=> b!85297 (= res!69982 (invariant!0 (currentBit!4413 thiss!1152) (currentByte!4418 thiss!1152) (size!1831 (buf!2221 thiss!1152))))))

(declare-fun b!85298 () Bool)

(declare-fun res!69985 () Bool)

(assert (=> b!85298 (=> (not res!69985) (not e!56818))))

(assert (=> b!85298 (= res!69985 (and (bvsle i!576 nBits!336) (= (size!1831 (buf!2221 thiss!1152)) (size!1831 (buf!2221 thiss!1151)))))))

(declare-fun b!85300 () Bool)

(declare-fun e!56816 () Bool)

(assert (=> b!85300 (= e!56816 (array_inv!1677 (buf!2221 thiss!1151)))))

(declare-fun b!85301 () Bool)

(assert (=> b!85301 (= e!56818 (bvslt ((_ sign_extend 32) (bvsub nBits!336 i!576)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!85302 () Bool)

(declare-fun res!69986 () Bool)

(assert (=> b!85302 (=> (not res!69986) (not e!56818))))

(assert (=> b!85302 (= res!69986 (and (bvsle ((_ sign_extend 32) (size!1831 (buf!2221 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4418 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4413 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1831 (buf!2221 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4418 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4413 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85303 () Bool)

(declare-fun res!69984 () Bool)

(assert (=> b!85303 (=> (not res!69984) (not e!56818))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85303 (= res!69984 (= (bitIndex!0 (size!1831 (buf!2221 thiss!1152)) (currentByte!4418 thiss!1152) (currentBit!4413 thiss!1152)) (bvadd (bitIndex!0 (size!1831 (buf!2221 thiss!1151)) (currentByte!4418 thiss!1151) (currentBit!4413 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun res!69981 () Bool)

(assert (=> start!17678 (=> (not res!69981) (not e!56818))))

(assert (=> start!17678 (= res!69981 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17678 e!56818))

(assert (=> start!17678 true))

(declare-fun inv!12 (BitStream!3224) Bool)

(assert (=> start!17678 (and (inv!12 thiss!1151) e!56816)))

(assert (=> start!17678 (and (inv!12 thiss!1152) e!56817)))

(declare-fun b!85299 () Bool)

(declare-fun res!69987 () Bool)

(assert (=> b!85299 (=> (not res!69987) (not e!56818))))

(assert (=> b!85299 (= res!69987 (invariant!0 (currentBit!4413 thiss!1151) (currentByte!4418 thiss!1151) (size!1831 (buf!2221 thiss!1151))))))

(assert (= (and start!17678 res!69981) b!85295))

(assert (= (and b!85295 res!69988) b!85299))

(assert (= (and b!85299 res!69987) b!85293))

(assert (= (and b!85293 res!69980) b!85297))

(assert (= (and b!85297 res!69982) b!85298))

(assert (= (and b!85298 res!69985) b!85303))

(assert (= (and b!85303 res!69984) b!85302))

(assert (= (and b!85302 res!69986) b!85294))

(assert (= (and b!85294 res!69983) b!85301))

(assert (= start!17678 b!85300))

(assert (= start!17678 b!85296))

(declare-fun m!131505 () Bool)

(assert (=> b!85297 m!131505))

(declare-fun m!131507 () Bool)

(assert (=> b!85303 m!131507))

(declare-fun m!131509 () Bool)

(assert (=> b!85303 m!131509))

(declare-fun m!131511 () Bool)

(assert (=> start!17678 m!131511))

(declare-fun m!131513 () Bool)

(assert (=> start!17678 m!131513))

(declare-fun m!131515 () Bool)

(assert (=> b!85299 m!131515))

(declare-fun m!131517 () Bool)

(assert (=> b!85296 m!131517))

(declare-fun m!131519 () Bool)

(assert (=> b!85295 m!131519))

(declare-fun m!131521 () Bool)

(assert (=> b!85294 m!131521))

(declare-fun m!131523 () Bool)

(assert (=> b!85300 m!131523))

(push 1)

(assert (not b!85296))

(assert (not b!85300))

(assert (not b!85294))

(assert (not b!85297))

(assert (not b!85295))

(assert (not start!17678))

(assert (not b!85299))

(assert (not b!85303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

