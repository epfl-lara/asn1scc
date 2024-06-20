; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56684 () Bool)

(assert start!56684)

(declare-fun res!218729 () Bool)

(declare-fun e!181643 () Bool)

(assert (=> start!56684 (=> (not res!218729) (not e!181643))))

(declare-datatypes ((array!14412 0))(
  ( (array!14413 (arr!7282 (Array (_ BitVec 32) (_ BitVec 8))) (size!6295 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11512 0))(
  ( (BitStream!11513 (buf!6817 array!14412) (currentByte!12578 (_ BitVec 32)) (currentBit!12573 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11512)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56684 (= res!218729 (validate_offset_bit!0 ((_ sign_extend 32) (size!6295 (buf!6817 thiss!914))) ((_ sign_extend 32) (currentByte!12578 thiss!914)) ((_ sign_extend 32) (currentBit!12573 thiss!914))))))

(assert (=> start!56684 e!181643))

(declare-fun e!181644 () Bool)

(declare-fun inv!12 (BitStream!11512) Bool)

(assert (=> start!56684 (and (inv!12 thiss!914) e!181644)))

(assert (=> start!56684 true))

(declare-fun b!261256 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261256 (= e!181643 (and b!187 (let ((bdg!16232 (bvor ((_ sign_extend 24) (select (arr!7282 (buf!6817 thiss!914)) (currentByte!12578 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12573 thiss!914)))))) (and (bvslt bdg!16232 #b00000000000000000000000010000000) (bvslt bdg!16232 #b11111111111111111111111110000000)))))))

(declare-fun b!261257 () Bool)

(declare-fun array_inv!6036 (array!14412) Bool)

(assert (=> b!261257 (= e!181644 (array_inv!6036 (buf!6817 thiss!914)))))

(assert (= (and start!56684 res!218729) b!261256))

(assert (= start!56684 b!261257))

(declare-fun m!390919 () Bool)

(assert (=> start!56684 m!390919))

(declare-fun m!390921 () Bool)

(assert (=> start!56684 m!390921))

(declare-fun m!390923 () Bool)

(assert (=> b!261256 m!390923))

(declare-fun m!390925 () Bool)

(assert (=> b!261256 m!390925))

(declare-fun m!390927 () Bool)

(assert (=> b!261257 m!390927))

(push 1)

(assert (not b!261257))

(assert (not start!56684))

(check-sat)

