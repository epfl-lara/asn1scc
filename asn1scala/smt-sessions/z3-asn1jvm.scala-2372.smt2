; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60520 () Bool)

(assert start!60520)

(declare-fun res!228151 () Bool)

(declare-fun e!194125 () Bool)

(assert (=> start!60520 (=> (not res!228151) (not e!194125))))

(declare-datatypes ((array!15494 0))(
  ( (array!15495 (arr!7709 (Array (_ BitVec 32) (_ BitVec 8))) (size!6722 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12258 0))(
  ( (BitStream!12259 (buf!7190 array!15494) (currentByte!13279 (_ BitVec 32)) (currentBit!13274 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12258)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12258 (_ BitVec 64)) Bool)

(assert (=> start!60520 (= res!228151 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60520 e!194125))

(declare-fun e!194123 () Bool)

(declare-fun inv!12 (BitStream!12258) Bool)

(assert (=> start!60520 (and (inv!12 thiss!882) e!194123)))

(assert (=> start!60520 true))

(declare-fun b!274217 () Bool)

(declare-fun lt!412292 () (_ BitVec 32))

(assert (=> b!274217 (= e!194125 (and (bvslt (bvadd (currentBit!13274 thiss!882) lt!412292) #b00000000000000000000000000000000) (= #b00000000000000000000000000000000 (bvand lt!412292 #b10000000000000000000000000000000)) (not (= #b00000000000000000000000000000000 (bvand (bvadd #b00000000000000000000000000001000 lt!412292) #b10000000000000000000000000000000)))))))

(assert (=> b!274217 (= lt!412292 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274218 () Bool)

(declare-fun array_inv!6446 (array!15494) Bool)

(assert (=> b!274218 (= e!194123 (array_inv!6446 (buf!7190 thiss!882)))))

(assert (= (and start!60520 res!228151) b!274217))

(assert (= start!60520 b!274218))

(declare-fun m!406949 () Bool)

(assert (=> start!60520 m!406949))

(declare-fun m!406951 () Bool)

(assert (=> start!60520 m!406951))

(declare-fun m!406953 () Bool)

(assert (=> b!274218 m!406953))

(check-sat (not start!60520) (not b!274218))
(check-sat)
