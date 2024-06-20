; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56584 () Bool)

(assert start!56584)

(declare-fun res!218686 () Bool)

(declare-fun e!181537 () Bool)

(assert (=> start!56584 (=> (not res!218686) (not e!181537))))

(declare-datatypes ((array!14379 0))(
  ( (array!14380 (arr!7270 (Array (_ BitVec 32) (_ BitVec 8))) (size!6283 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11488 0))(
  ( (BitStream!11489 (buf!6805 array!14379) (currentByte!12546 (_ BitVec 32)) (currentBit!12541 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11488)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56584 (= res!218686 (validate_offset_bit!0 ((_ sign_extend 32) (size!6283 (buf!6805 thiss!914))) ((_ sign_extend 32) (currentByte!12546 thiss!914)) ((_ sign_extend 32) (currentBit!12541 thiss!914))))))

(assert (=> start!56584 e!181537))

(declare-fun e!181536 () Bool)

(declare-fun inv!12 (BitStream!11488) Bool)

(assert (=> start!56584 (and (inv!12 thiss!914) e!181536)))

(assert (=> start!56584 true))

(declare-fun b!261177 () Bool)

(declare-fun res!218687 () Bool)

(assert (=> b!261177 (=> (not res!218687) (not e!181537))))

(declare-fun b!187 () Bool)

(assert (=> b!261177 (= res!218687 b!187)))

(declare-fun b!261178 () Bool)

(assert (=> b!261178 (= e!181537 (not (inv!12 (BitStream!11489 (array!14380 (store (arr!7270 (buf!6805 thiss!914)) (currentByte!12546 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7270 (buf!6805 thiss!914)) (currentByte!12546 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12541 thiss!914)))))) (size!6283 (buf!6805 thiss!914))) (currentByte!12546 thiss!914) (currentBit!12541 thiss!914)))))))

(declare-fun b!261179 () Bool)

(declare-fun array_inv!6024 (array!14379) Bool)

(assert (=> b!261179 (= e!181536 (array_inv!6024 (buf!6805 thiss!914)))))

(assert (= (and start!56584 res!218686) b!261177))

(assert (= (and b!261177 res!218687) b!261178))

(assert (= start!56584 b!261179))

(declare-fun m!390775 () Bool)

(assert (=> start!56584 m!390775))

(declare-fun m!390777 () Bool)

(assert (=> start!56584 m!390777))

(declare-fun m!390779 () Bool)

(assert (=> b!261178 m!390779))

(declare-fun m!390781 () Bool)

(assert (=> b!261178 m!390781))

(declare-fun m!390783 () Bool)

(assert (=> b!261178 m!390783))

(declare-fun m!390785 () Bool)

(assert (=> b!261178 m!390785))

(declare-fun m!390787 () Bool)

(assert (=> b!261179 m!390787))

(push 1)

(assert (not b!261179))

(assert (not b!261178))

(assert (not start!56584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87830 () Bool)

