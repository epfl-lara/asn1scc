; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15244 () Bool)

(assert start!15244)

(declare-fun bitNr!1 () (_ BitVec 32))

(declare-datatypes ((array!3295 0))(
  ( (array!3296 (arr!2131 (Array (_ BitVec 32) (_ BitVec 8))) (size!1530 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2622 0))(
  ( (BitStream!2623 (buf!1920 array!3295) (currentByte!3737 (_ BitVec 32)) (currentBit!3732 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2622)

(assert (=> start!15244 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!1530 (buf!1920 thiss!1107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3737 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3732 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!15244 true))

(declare-fun e!51071 () Bool)

(declare-fun inv!12 (BitStream!2622) Bool)

(assert (=> start!15244 (and (inv!12 thiss!1107) e!51071)))

(declare-fun b!77886 () Bool)

(declare-fun array_inv!1376 (array!3295) Bool)

(assert (=> b!77886 (= e!51071 (array_inv!1376 (buf!1920 thiss!1107)))))

(assert (= start!15244 b!77886))

(declare-fun m!123507 () Bool)

(assert (=> start!15244 m!123507))

(declare-fun m!123509 () Bool)

(assert (=> b!77886 m!123509))

(check-sat (not b!77886) (not start!15244))
(check-sat)
