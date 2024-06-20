; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69044 () Bool)

(assert start!69044)

(declare-fun b!311112 () Bool)

(declare-fun e!223618 () Bool)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> b!311112 (= e!223618 (bvslt b1ValidateOffsetBits!10 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!311113 () Bool)

(declare-fun e!223617 () Bool)

(declare-datatypes ((array!18981 0))(
  ( (array!18982 (arr!9317 (Array (_ BitVec 32) (_ BitVec 8))) (size!8237 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13578 0))(
  ( (BitStream!13579 (buf!7850 array!18981) (currentByte!14457 (_ BitVec 32)) (currentBit!14452 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13578)

(declare-fun array_inv!7789 (array!18981) Bool)

(assert (=> b!311113 (= e!223617 (array_inv!7789 (buf!7850 b1!97)))))

(declare-fun res!254926 () Bool)

(assert (=> start!69044 (=> (not res!254926) (not e!223618))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13578)

(assert (=> start!69044 (= res!254926 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8237 (buf!7850 b1!97)) (size!8237 (buf!7850 b2!97))) (bvsle ((_ sign_extend 32) (size!8237 (buf!7850 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14457 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14452 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8237 (buf!7850 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14457 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14452 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!69044 e!223618))

(assert (=> start!69044 true))

(declare-fun inv!12 (BitStream!13578) Bool)

(assert (=> start!69044 (and (inv!12 b1!97) e!223617)))

(declare-fun e!223619 () Bool)

(assert (=> start!69044 (and (inv!12 b2!97) e!223619)))

(declare-fun b!311114 () Bool)

(assert (=> b!311114 (= e!223619 (array_inv!7789 (buf!7850 b2!97)))))

(declare-fun b!311111 () Bool)

(declare-fun res!254925 () Bool)

(assert (=> b!311111 (=> (not res!254925) (not e!223618))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311111 (= res!254925 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14452 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14457 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8237 (buf!7850 b1!97))))))))

(assert (= (and start!69044 res!254926) b!311111))

(assert (= (and b!311111 res!254925) b!311112))

(assert (= start!69044 b!311113))

(assert (= start!69044 b!311114))

(declare-fun m!448991 () Bool)

(assert (=> b!311113 m!448991))

(declare-fun m!448993 () Bool)

(assert (=> start!69044 m!448993))

(declare-fun m!448995 () Bool)

(assert (=> start!69044 m!448995))

(declare-fun m!448997 () Bool)

(assert (=> b!311114 m!448997))

(declare-fun m!448999 () Bool)

(assert (=> b!311111 m!448999))

(check-sat (not b!311111) (not b!311114) (not start!69044) (not b!311113))
(check-sat)
