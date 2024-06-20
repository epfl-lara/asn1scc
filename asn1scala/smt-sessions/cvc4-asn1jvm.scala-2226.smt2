; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56588 () Bool)

(assert start!56588)

(declare-fun res!218698 () Bool)

(declare-fun e!181555 () Bool)

(assert (=> start!56588 (=> (not res!218698) (not e!181555))))

(declare-datatypes ((array!14383 0))(
  ( (array!14384 (arr!7272 (Array (_ BitVec 32) (_ BitVec 8))) (size!6285 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11492 0))(
  ( (BitStream!11493 (buf!6807 array!14383) (currentByte!12548 (_ BitVec 32)) (currentBit!12543 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11492)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56588 (= res!218698 (validate_offset_bit!0 ((_ sign_extend 32) (size!6285 (buf!6807 thiss!914))) ((_ sign_extend 32) (currentByte!12548 thiss!914)) ((_ sign_extend 32) (currentBit!12543 thiss!914))))))

(assert (=> start!56588 e!181555))

(declare-fun e!181553 () Bool)

(declare-fun inv!12 (BitStream!11492) Bool)

(assert (=> start!56588 (and (inv!12 thiss!914) e!181553)))

(assert (=> start!56588 true))

(declare-fun b!261195 () Bool)

(declare-fun res!218699 () Bool)

(assert (=> b!261195 (=> (not res!218699) (not e!181555))))

(declare-fun b!187 () Bool)

(assert (=> b!261195 (= res!218699 b!187)))

(declare-fun b!261196 () Bool)

(assert (=> b!261196 (= e!181555 (not (inv!12 (BitStream!11493 (array!14384 (store (arr!7272 (buf!6807 thiss!914)) (currentByte!12548 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7272 (buf!6807 thiss!914)) (currentByte!12548 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12543 thiss!914)))))) (size!6285 (buf!6807 thiss!914))) (currentByte!12548 thiss!914) (currentBit!12543 thiss!914)))))))

(declare-fun b!261197 () Bool)

(declare-fun array_inv!6026 (array!14383) Bool)

(assert (=> b!261197 (= e!181553 (array_inv!6026 (buf!6807 thiss!914)))))

(assert (= (and start!56588 res!218698) b!261195))

(assert (= (and b!261195 res!218699) b!261196))

(assert (= start!56588 b!261197))

(declare-fun m!390803 () Bool)

(assert (=> start!56588 m!390803))

(declare-fun m!390805 () Bool)

(assert (=> start!56588 m!390805))

(declare-fun m!390807 () Bool)

(assert (=> b!261196 m!390807))

(declare-fun m!390809 () Bool)

(assert (=> b!261196 m!390809))

(declare-fun m!390811 () Bool)

(assert (=> b!261196 m!390811))

(declare-fun m!390813 () Bool)

(assert (=> b!261196 m!390813))

(declare-fun m!390815 () Bool)

(assert (=> b!261197 m!390815))

(push 1)

(assert (not start!56588))

(assert (not b!261197))

(assert (not b!261196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87832 () Bool)

