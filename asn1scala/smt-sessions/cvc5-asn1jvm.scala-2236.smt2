; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56824 () Bool)

(assert start!56824)

(declare-fun res!218792 () Bool)

(declare-fun e!181805 () Bool)

(assert (=> start!56824 (=> (not res!218792) (not e!181805))))

(declare-datatypes ((array!14460 0))(
  ( (array!14461 (arr!7300 (Array (_ BitVec 32) (_ BitVec 8))) (size!6313 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11548 0))(
  ( (BitStream!11549 (buf!6835 array!14460) (currentByte!12624 (_ BitVec 32)) (currentBit!12619 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11548)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56824 (= res!218792 (validate_offset_bit!0 ((_ sign_extend 32) (size!6313 (buf!6835 thiss!914))) ((_ sign_extend 32) (currentByte!12624 thiss!914)) ((_ sign_extend 32) (currentBit!12619 thiss!914))))))

(assert (=> start!56824 e!181805))

(declare-fun e!181806 () Bool)

(declare-fun inv!12 (BitStream!11548) Bool)

(assert (=> start!56824 (and (inv!12 thiss!914) e!181806)))

(assert (=> start!56824 true))

(declare-fun b!261373 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261373 (= e!181805 (and (not b!187) (let ((bdg!16233 (bvand ((_ sign_extend 24) (select (arr!7300 (buf!6835 thiss!914)) (currentByte!12624 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12619 thiss!914))))))) (and (bvslt bdg!16233 #b00000000000000000000000010000000) (bvslt bdg!16233 #b11111111111111111111111110000000)))))))

(declare-fun b!261374 () Bool)

(declare-fun array_inv!6054 (array!14460) Bool)

(assert (=> b!261374 (= e!181806 (array_inv!6054 (buf!6835 thiss!914)))))

(assert (= (and start!56824 res!218792) b!261373))

(assert (= start!56824 b!261374))

(declare-fun m!391129 () Bool)

(assert (=> start!56824 m!391129))

(declare-fun m!391131 () Bool)

(assert (=> start!56824 m!391131))

(declare-fun m!391133 () Bool)

(assert (=> b!261373 m!391133))

(declare-fun m!391135 () Bool)

(assert (=> b!261373 m!391135))

(declare-fun m!391137 () Bool)

(assert (=> b!261374 m!391137))

(push 1)

(assert (not b!261374))

(assert (not start!56824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

