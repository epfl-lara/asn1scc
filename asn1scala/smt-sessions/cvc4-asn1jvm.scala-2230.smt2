; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56688 () Bool)

(assert start!56688)

(declare-fun res!218735 () Bool)

(declare-fun e!181661 () Bool)

(assert (=> start!56688 (=> (not res!218735) (not e!181661))))

(declare-datatypes ((array!14416 0))(
  ( (array!14417 (arr!7284 (Array (_ BitVec 32) (_ BitVec 8))) (size!6297 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11516 0))(
  ( (BitStream!11517 (buf!6819 array!14416) (currentByte!12580 (_ BitVec 32)) (currentBit!12575 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11516)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56688 (= res!218735 (validate_offset_bit!0 ((_ sign_extend 32) (size!6297 (buf!6819 thiss!914))) ((_ sign_extend 32) (currentByte!12580 thiss!914)) ((_ sign_extend 32) (currentBit!12575 thiss!914))))))

(assert (=> start!56688 e!181661))

(declare-fun e!181662 () Bool)

(declare-fun inv!12 (BitStream!11516) Bool)

(assert (=> start!56688 (and (inv!12 thiss!914) e!181662)))

(assert (=> start!56688 true))

(declare-fun b!261268 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261268 (= e!181661 (and b!187 (let ((bdg!16232 (bvor ((_ sign_extend 24) (select (arr!7284 (buf!6819 thiss!914)) (currentByte!12580 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12575 thiss!914)))))) (and (bvslt bdg!16232 #b00000000000000000000000010000000) (bvslt bdg!16232 #b11111111111111111111111110000000)))))))

(declare-fun b!261269 () Bool)

(declare-fun array_inv!6038 (array!14416) Bool)

(assert (=> b!261269 (= e!181662 (array_inv!6038 (buf!6819 thiss!914)))))

(assert (= (and start!56688 res!218735) b!261268))

(assert (= start!56688 b!261269))

(declare-fun m!390939 () Bool)

(assert (=> start!56688 m!390939))

(declare-fun m!390941 () Bool)

(assert (=> start!56688 m!390941))

(declare-fun m!390943 () Bool)

(assert (=> b!261268 m!390943))

(declare-fun m!390945 () Bool)

(assert (=> b!261268 m!390945))

(declare-fun m!390947 () Bool)

(assert (=> b!261269 m!390947))

(push 1)

(assert (not b!261269))

(assert (not start!56688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

