; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56680 () Bool)

(assert start!56680)

(declare-fun res!218723 () Bool)

(declare-fun e!181625 () Bool)

(assert (=> start!56680 (=> (not res!218723) (not e!181625))))

(declare-datatypes ((array!14408 0))(
  ( (array!14409 (arr!7280 (Array (_ BitVec 32) (_ BitVec 8))) (size!6293 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11508 0))(
  ( (BitStream!11509 (buf!6815 array!14408) (currentByte!12576 (_ BitVec 32)) (currentBit!12571 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11508)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56680 (= res!218723 (validate_offset_bit!0 ((_ sign_extend 32) (size!6293 (buf!6815 thiss!914))) ((_ sign_extend 32) (currentByte!12576 thiss!914)) ((_ sign_extend 32) (currentBit!12571 thiss!914))))))

(assert (=> start!56680 e!181625))

(declare-fun e!181626 () Bool)

(declare-fun inv!12 (BitStream!11508) Bool)

(assert (=> start!56680 (and (inv!12 thiss!914) e!181626)))

(assert (=> start!56680 true))

(declare-fun b!261244 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261244 (= e!181625 (and b!187 (bvsge (bvor ((_ sign_extend 24) (select (arr!7280 (buf!6815 thiss!914)) (currentByte!12576 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12571 thiss!914)))) #b00000000000000000000000010000000)))))

(declare-fun b!261245 () Bool)

(declare-fun array_inv!6034 (array!14408) Bool)

(assert (=> b!261245 (= e!181626 (array_inv!6034 (buf!6815 thiss!914)))))

(assert (= (and start!56680 res!218723) b!261244))

(assert (= start!56680 b!261245))

(declare-fun m!390899 () Bool)

(assert (=> start!56680 m!390899))

(declare-fun m!390901 () Bool)

(assert (=> start!56680 m!390901))

(declare-fun m!390903 () Bool)

(assert (=> b!261244 m!390903))

(declare-fun m!390905 () Bool)

(assert (=> b!261244 m!390905))

(declare-fun m!390907 () Bool)

(assert (=> b!261245 m!390907))

(check-sat (not b!261245) (not start!56680))
(check-sat)
