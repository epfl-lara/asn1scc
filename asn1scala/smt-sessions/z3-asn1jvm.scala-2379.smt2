; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60734 () Bool)

(assert start!60734)

(declare-fun res!228409 () Bool)

(declare-fun e!194441 () Bool)

(assert (=> start!60734 (=> (not res!228409) (not e!194441))))

(declare-datatypes ((array!15554 0))(
  ( (array!15555 (arr!7730 (Array (_ BitVec 32) (_ BitVec 8))) (size!6743 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12300 0))(
  ( (BitStream!12301 (buf!7211 array!15554) (currentByte!13332 (_ BitVec 32)) (currentBit!13327 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12300)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12300 (_ BitVec 64)) Bool)

(assert (=> start!60734 (= res!228409 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60734 e!194441))

(declare-fun e!194443 () Bool)

(declare-fun inv!12 (BitStream!12300) Bool)

(assert (=> start!60734 (and (inv!12 thiss!882) e!194443)))

(assert (=> start!60734 true))

(declare-fun b!274556 () Bool)

(declare-fun lt!412778 () (_ BitVec 32))

(assert (=> b!274556 (= e!194441 (and (bvsge lt!412778 #b00000000000000000000000000000000) (bvsge lt!412778 #b00000000000000000000000000001000) (let ((bdg!16597 (bvand lt!412778 #b10000000000000000000000000000000))) (and (not (= bdg!16597 #b00000000000000000000000000000000)) (not (= bdg!16597 (bvand (bvsub lt!412778 #b00000000000000000000000000001000) #b10000000000000000000000000000000)))))))))

(assert (=> b!274556 (= lt!412778 (bvadd (currentBit!13327 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274557 () Bool)

(declare-fun array_inv!6467 (array!15554) Bool)

(assert (=> b!274557 (= e!194443 (array_inv!6467 (buf!7211 thiss!882)))))

(assert (= (and start!60734 res!228409) b!274556))

(assert (= start!60734 b!274557))

(declare-fun m!407213 () Bool)

(assert (=> start!60734 m!407213))

(declare-fun m!407215 () Bool)

(assert (=> start!60734 m!407215))

(declare-fun m!407217 () Bool)

(assert (=> b!274557 m!407217))

(check-sat (not b!274557) (not start!60734))
(check-sat)
