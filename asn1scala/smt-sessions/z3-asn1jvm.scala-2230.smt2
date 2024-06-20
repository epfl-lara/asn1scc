; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56686 () Bool)

(assert start!56686)

(declare-fun res!218732 () Bool)

(declare-fun e!181652 () Bool)

(assert (=> start!56686 (=> (not res!218732) (not e!181652))))

(declare-datatypes ((array!14414 0))(
  ( (array!14415 (arr!7283 (Array (_ BitVec 32) (_ BitVec 8))) (size!6296 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11514 0))(
  ( (BitStream!11515 (buf!6818 array!14414) (currentByte!12579 (_ BitVec 32)) (currentBit!12574 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11514)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56686 (= res!218732 (validate_offset_bit!0 ((_ sign_extend 32) (size!6296 (buf!6818 thiss!914))) ((_ sign_extend 32) (currentByte!12579 thiss!914)) ((_ sign_extend 32) (currentBit!12574 thiss!914))))))

(assert (=> start!56686 e!181652))

(declare-fun e!181653 () Bool)

(declare-fun inv!12 (BitStream!11514) Bool)

(assert (=> start!56686 (and (inv!12 thiss!914) e!181653)))

(assert (=> start!56686 true))

(declare-fun b!261262 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261262 (= e!181652 (and b!187 (let ((bdg!16232 (bvor ((_ sign_extend 24) (select (arr!7283 (buf!6818 thiss!914)) (currentByte!12579 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12574 thiss!914)))))) (and (bvslt bdg!16232 #b00000000000000000000000010000000) (bvslt bdg!16232 #b11111111111111111111111110000000)))))))

(declare-fun b!261263 () Bool)

(declare-fun array_inv!6037 (array!14414) Bool)

(assert (=> b!261263 (= e!181653 (array_inv!6037 (buf!6818 thiss!914)))))

(assert (= (and start!56686 res!218732) b!261262))

(assert (= start!56686 b!261263))

(declare-fun m!390929 () Bool)

(assert (=> start!56686 m!390929))

(declare-fun m!390931 () Bool)

(assert (=> start!56686 m!390931))

(declare-fun m!390933 () Bool)

(assert (=> b!261262 m!390933))

(declare-fun m!390935 () Bool)

(assert (=> b!261262 m!390935))

(declare-fun m!390937 () Bool)

(assert (=> b!261263 m!390937))

(check-sat (not b!261263) (not start!56686))
(check-sat)
