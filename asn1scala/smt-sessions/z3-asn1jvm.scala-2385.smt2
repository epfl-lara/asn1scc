; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60912 () Bool)

(assert start!60912)

(declare-fun res!228640 () Bool)

(declare-fun e!194733 () Bool)

(assert (=> start!60912 (=> (not res!228640) (not e!194733))))

(declare-datatypes ((array!15605 0))(
  ( (array!15606 (arr!7748 (Array (_ BitVec 32) (_ BitVec 8))) (size!6761 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12336 0))(
  ( (BitStream!12337 (buf!7229 array!15605) (currentByte!13376 (_ BitVec 32)) (currentBit!13371 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12336)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12336 (_ BitVec 64)) Bool)

(assert (=> start!60912 (= res!228640 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60912 e!194733))

(declare-fun e!194734 () Bool)

(declare-fun inv!12 (BitStream!12336) Bool)

(assert (=> start!60912 (and (inv!12 thiss!882) e!194734)))

(assert (=> start!60912 true))

(declare-fun lt!413198 () (_ BitVec 32))

(declare-fun b!274856 () Bool)

(declare-fun lt!413197 () (_ BitVec 32))

(assert (=> b!274856 (= e!194733 (and (bvsge lt!413198 #b00000000000000000000000000000000) (bvslt lt!413198 #b00000000000000000000000000001000) (= (bvand (currentBit!13371 thiss!882) #b10000000000000000000000000000000) (bvand lt!413197 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13371 thiss!882) #b10000000000000000000000000000000) (bvand lt!413198 #b10000000000000000000000000000000)))))))

(assert (=> b!274856 (= lt!413198 (bvadd (currentBit!13371 thiss!882) lt!413197))))

(assert (=> b!274856 (= lt!413197 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274857 () Bool)

(declare-fun array_inv!6485 (array!15605) Bool)

(assert (=> b!274857 (= e!194734 (array_inv!6485 (buf!7229 thiss!882)))))

(assert (= (and start!60912 res!228640) b!274856))

(assert (= start!60912 b!274857))

(declare-fun m!407453 () Bool)

(assert (=> start!60912 m!407453))

(declare-fun m!407455 () Bool)

(assert (=> start!60912 m!407455))

(declare-fun m!407457 () Bool)

(assert (=> b!274857 m!407457))

(check-sat (not start!60912) (not b!274857))
(check-sat)
