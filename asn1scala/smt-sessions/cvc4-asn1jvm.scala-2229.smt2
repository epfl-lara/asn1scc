; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56682 () Bool)

(assert start!56682)

(declare-fun res!218726 () Bool)

(declare-fun e!181634 () Bool)

(assert (=> start!56682 (=> (not res!218726) (not e!181634))))

(declare-datatypes ((array!14410 0))(
  ( (array!14411 (arr!7281 (Array (_ BitVec 32) (_ BitVec 8))) (size!6294 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11510 0))(
  ( (BitStream!11511 (buf!6816 array!14410) (currentByte!12577 (_ BitVec 32)) (currentBit!12572 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11510)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56682 (= res!218726 (validate_offset_bit!0 ((_ sign_extend 32) (size!6294 (buf!6816 thiss!914))) ((_ sign_extend 32) (currentByte!12577 thiss!914)) ((_ sign_extend 32) (currentBit!12572 thiss!914))))))

(assert (=> start!56682 e!181634))

(declare-fun e!181635 () Bool)

(declare-fun inv!12 (BitStream!11510) Bool)

(assert (=> start!56682 (and (inv!12 thiss!914) e!181635)))

(assert (=> start!56682 true))

(declare-fun b!261250 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261250 (= e!181634 (and b!187 (bvsge (bvor ((_ sign_extend 24) (select (arr!7281 (buf!6816 thiss!914)) (currentByte!12577 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12572 thiss!914)))) #b00000000000000000000000010000000)))))

(declare-fun b!261251 () Bool)

(declare-fun array_inv!6035 (array!14410) Bool)

(assert (=> b!261251 (= e!181635 (array_inv!6035 (buf!6816 thiss!914)))))

(assert (= (and start!56682 res!218726) b!261250))

(assert (= start!56682 b!261251))

(declare-fun m!390909 () Bool)

(assert (=> start!56682 m!390909))

(declare-fun m!390911 () Bool)

(assert (=> start!56682 m!390911))

(declare-fun m!390913 () Bool)

(assert (=> b!261250 m!390913))

(declare-fun m!390915 () Bool)

(assert (=> b!261250 m!390915))

(declare-fun m!390917 () Bool)

(assert (=> b!261251 m!390917))

(push 1)

(assert (not b!261251))

(assert (not start!56682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

