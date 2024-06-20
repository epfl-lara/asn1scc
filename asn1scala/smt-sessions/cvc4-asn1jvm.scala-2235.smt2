; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56822 () Bool)

(assert start!56822)

(declare-fun res!218789 () Bool)

(declare-fun e!181796 () Bool)

(assert (=> start!56822 (=> (not res!218789) (not e!181796))))

(declare-datatypes ((array!14458 0))(
  ( (array!14459 (arr!7299 (Array (_ BitVec 32) (_ BitVec 8))) (size!6312 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11546 0))(
  ( (BitStream!11547 (buf!6834 array!14458) (currentByte!12623 (_ BitVec 32)) (currentBit!12618 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11546)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56822 (= res!218789 (validate_offset_bit!0 ((_ sign_extend 32) (size!6312 (buf!6834 thiss!914))) ((_ sign_extend 32) (currentByte!12623 thiss!914)) ((_ sign_extend 32) (currentBit!12618 thiss!914))))))

(assert (=> start!56822 e!181796))

(declare-fun e!181797 () Bool)

(declare-fun inv!12 (BitStream!11546) Bool)

(assert (=> start!56822 (and (inv!12 thiss!914) e!181797)))

(assert (=> start!56822 true))

(declare-fun b!261367 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261367 (= e!181796 (and (not b!187) (bvsge (bvand ((_ sign_extend 24) (select (arr!7299 (buf!6834 thiss!914)) (currentByte!12623 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12618 thiss!914))))) #b00000000000000000000000010000000)))))

(declare-fun b!261368 () Bool)

(declare-fun array_inv!6053 (array!14458) Bool)

(assert (=> b!261368 (= e!181797 (array_inv!6053 (buf!6834 thiss!914)))))

(assert (= (and start!56822 res!218789) b!261367))

(assert (= start!56822 b!261368))

(declare-fun m!391119 () Bool)

(assert (=> start!56822 m!391119))

(declare-fun m!391121 () Bool)

(assert (=> start!56822 m!391121))

(declare-fun m!391123 () Bool)

(assert (=> b!261367 m!391123))

(declare-fun m!391125 () Bool)

(assert (=> b!261367 m!391125))

(declare-fun m!391127 () Bool)

(assert (=> b!261368 m!391127))

(push 1)

(assert (not start!56822))

