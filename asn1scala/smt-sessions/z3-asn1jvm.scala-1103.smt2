; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31724 () Bool)

(assert start!31724)

(declare-datatypes ((array!7373 0))(
  ( (array!7374 (arr!4268 (Array (_ BitVec 32) (_ BitVec 8))) (size!3347 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5862 0))(
  ( (BitStream!5863 (buf!3805 array!7373) (currentByte!6993 (_ BitVec 32)) (currentBit!6988 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5862)

(declare-fun buf!77 () array!7373)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31724 (and (= (size!3347 (buf!3805 b1!99)) (size!3347 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!3347 (buf!3805 b1!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!6993 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!6988 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!107719 () Bool)

(declare-fun inv!12 (BitStream!5862) Bool)

(assert (=> start!31724 (and (inv!12 b1!99) e!107719)))

(declare-fun array_inv!3094 (array!7373) Bool)

(assert (=> start!31724 (array_inv!3094 buf!77)))

(assert (=> start!31724 true))

(declare-fun b!158475 () Bool)

(assert (=> b!158475 (= e!107719 (array_inv!3094 (buf!3805 b1!99)))))

(assert (= start!31724 b!158475))

(declare-fun m!248941 () Bool)

(assert (=> start!31724 m!248941))

(declare-fun m!248943 () Bool)

(assert (=> start!31724 m!248943))

(declare-fun m!248945 () Bool)

(assert (=> b!158475 m!248945))

(check-sat (not b!158475) (not start!31724))
(check-sat)
