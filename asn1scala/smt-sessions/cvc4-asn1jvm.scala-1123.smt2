; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31976 () Bool)

(assert start!31976)

(declare-datatypes ((array!7465 0))(
  ( (array!7466 (arr!4305 (Array (_ BitVec 32) (_ BitVec 8))) (size!3384 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5936 0))(
  ( (BitStream!5937 (buf!3842 array!7465) (currentByte!7052 (_ BitVec 32)) (currentBit!7047 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5936)

(assert (=> start!31976 (or (bvsgt ((_ sign_extend 32) (size!3384 (buf!3842 thiss!1602))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7052 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7047 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!108080 () Bool)

(declare-fun inv!12 (BitStream!5936) Bool)

(assert (=> start!31976 (and (inv!12 thiss!1602) e!108080)))

(declare-fun b!158721 () Bool)

(declare-fun array_inv!3131 (array!7465) Bool)

(assert (=> b!158721 (= e!108080 (array_inv!3131 (buf!3842 thiss!1602)))))

(assert (= start!31976 b!158721))

(declare-fun m!249273 () Bool)

(assert (=> start!31976 m!249273))

(declare-fun m!249275 () Bool)

(assert (=> b!158721 m!249275))

(push 1)

(assert (not start!31976))

(assert (not b!158721))

(check-sat)

(pop 1)

(push 1)

(check-sat)

