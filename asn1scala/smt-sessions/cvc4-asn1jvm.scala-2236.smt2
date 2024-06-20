; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56828 () Bool)

(assert start!56828)

(declare-fun res!218798 () Bool)

(declare-fun e!181823 () Bool)

(assert (=> start!56828 (=> (not res!218798) (not e!181823))))

(declare-datatypes ((array!14464 0))(
  ( (array!14465 (arr!7302 (Array (_ BitVec 32) (_ BitVec 8))) (size!6315 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11552 0))(
  ( (BitStream!11553 (buf!6837 array!14464) (currentByte!12626 (_ BitVec 32)) (currentBit!12621 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11552)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56828 (= res!218798 (validate_offset_bit!0 ((_ sign_extend 32) (size!6315 (buf!6837 thiss!914))) ((_ sign_extend 32) (currentByte!12626 thiss!914)) ((_ sign_extend 32) (currentBit!12621 thiss!914))))))

(assert (=> start!56828 e!181823))

(declare-fun e!181824 () Bool)

(declare-fun inv!12 (BitStream!11552) Bool)

(assert (=> start!56828 (and (inv!12 thiss!914) e!181824)))

(assert (=> start!56828 true))

(declare-fun b!261385 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261385 (= e!181823 (and (not b!187) (let ((bdg!16233 (bvand ((_ sign_extend 24) (select (arr!7302 (buf!6837 thiss!914)) (currentByte!12626 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12621 thiss!914))))))) (and (bvslt bdg!16233 #b00000000000000000000000010000000) (bvslt bdg!16233 #b11111111111111111111111110000000)))))))

(declare-fun b!261386 () Bool)

(declare-fun array_inv!6056 (array!14464) Bool)

(assert (=> b!261386 (= e!181824 (array_inv!6056 (buf!6837 thiss!914)))))

(assert (= (and start!56828 res!218798) b!261385))

(assert (= start!56828 b!261386))

(declare-fun m!391149 () Bool)

(assert (=> start!56828 m!391149))

(declare-fun m!391151 () Bool)

(assert (=> start!56828 m!391151))

(declare-fun m!391153 () Bool)

(assert (=> b!261385 m!391153))

(declare-fun m!391155 () Bool)

(assert (=> b!261385 m!391155))

(declare-fun m!391157 () Bool)

(assert (=> b!261386 m!391157))

(push 1)

(assert (not b!261386))

(assert (not start!56828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

