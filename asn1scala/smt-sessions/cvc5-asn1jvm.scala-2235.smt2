; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56818 () Bool)

(assert start!56818)

(declare-fun res!218783 () Bool)

(declare-fun e!181778 () Bool)

(assert (=> start!56818 (=> (not res!218783) (not e!181778))))

(declare-datatypes ((array!14454 0))(
  ( (array!14455 (arr!7297 (Array (_ BitVec 32) (_ BitVec 8))) (size!6310 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11542 0))(
  ( (BitStream!11543 (buf!6832 array!14454) (currentByte!12621 (_ BitVec 32)) (currentBit!12616 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11542)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56818 (= res!218783 (validate_offset_bit!0 ((_ sign_extend 32) (size!6310 (buf!6832 thiss!914))) ((_ sign_extend 32) (currentByte!12621 thiss!914)) ((_ sign_extend 32) (currentBit!12616 thiss!914))))))

(assert (=> start!56818 e!181778))

(declare-fun e!181779 () Bool)

(declare-fun inv!12 (BitStream!11542) Bool)

(assert (=> start!56818 (and (inv!12 thiss!914) e!181779)))

(assert (=> start!56818 true))

(declare-fun b!261355 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261355 (= e!181778 (and (not b!187) (bvsge (bvand ((_ sign_extend 24) (select (arr!7297 (buf!6832 thiss!914)) (currentByte!12621 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12616 thiss!914))))) #b00000000000000000000000010000000)))))

(declare-fun b!261356 () Bool)

(declare-fun array_inv!6051 (array!14454) Bool)

(assert (=> b!261356 (= e!181779 (array_inv!6051 (buf!6832 thiss!914)))))

(assert (= (and start!56818 res!218783) b!261355))

(assert (= start!56818 b!261356))

(declare-fun m!391099 () Bool)

(assert (=> start!56818 m!391099))

(declare-fun m!391101 () Bool)

(assert (=> start!56818 m!391101))

(declare-fun m!391103 () Bool)

(assert (=> b!261355 m!391103))

(declare-fun m!391105 () Bool)

(assert (=> b!261355 m!391105))

(declare-fun m!391107 () Bool)

(assert (=> b!261356 m!391107))

(push 1)

