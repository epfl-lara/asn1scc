; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56820 () Bool)

(assert start!56820)

(declare-fun res!218786 () Bool)

(declare-fun e!181787 () Bool)

(assert (=> start!56820 (=> (not res!218786) (not e!181787))))

(declare-datatypes ((array!14456 0))(
  ( (array!14457 (arr!7298 (Array (_ BitVec 32) (_ BitVec 8))) (size!6311 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11544 0))(
  ( (BitStream!11545 (buf!6833 array!14456) (currentByte!12622 (_ BitVec 32)) (currentBit!12617 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11544)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56820 (= res!218786 (validate_offset_bit!0 ((_ sign_extend 32) (size!6311 (buf!6833 thiss!914))) ((_ sign_extend 32) (currentByte!12622 thiss!914)) ((_ sign_extend 32) (currentBit!12617 thiss!914))))))

(assert (=> start!56820 e!181787))

(declare-fun e!181788 () Bool)

(declare-fun inv!12 (BitStream!11544) Bool)

(assert (=> start!56820 (and (inv!12 thiss!914) e!181788)))

(assert (=> start!56820 true))

(declare-fun b!261361 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261361 (= e!181787 (and (not b!187) (bvsge (bvand ((_ sign_extend 24) (select (arr!7298 (buf!6833 thiss!914)) (currentByte!12622 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12617 thiss!914))))) #b00000000000000000000000010000000)))))

(declare-fun b!261362 () Bool)

(declare-fun array_inv!6052 (array!14456) Bool)

(assert (=> b!261362 (= e!181788 (array_inv!6052 (buf!6833 thiss!914)))))

(assert (= (and start!56820 res!218786) b!261361))

(assert (= start!56820 b!261362))

(declare-fun m!391109 () Bool)

(assert (=> start!56820 m!391109))

(declare-fun m!391111 () Bool)

(assert (=> start!56820 m!391111))

(declare-fun m!391113 () Bool)

(assert (=> b!261361 m!391113))

(declare-fun m!391115 () Bool)

(assert (=> b!261361 m!391115))

(declare-fun m!391117 () Bool)

(assert (=> b!261362 m!391117))

(check-sat (not b!261362) (not start!56820))
(check-sat)
