; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31972 () Bool)

(assert start!31972)

(declare-datatypes ((array!7461 0))(
  ( (array!7462 (arr!4303 (Array (_ BitVec 32) (_ BitVec 8))) (size!3382 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5932 0))(
  ( (BitStream!5933 (buf!3840 array!7461) (currentByte!7050 (_ BitVec 32)) (currentBit!7045 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5932)

(assert (=> start!31972 (or (bvsgt ((_ sign_extend 32) (size!3382 (buf!3840 thiss!1602))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7050 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7045 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!108068 () Bool)

(declare-fun inv!12 (BitStream!5932) Bool)

(assert (=> start!31972 (and (inv!12 thiss!1602) e!108068)))

(declare-fun b!158715 () Bool)

(declare-fun array_inv!3129 (array!7461) Bool)

(assert (=> b!158715 (= e!108068 (array_inv!3129 (buf!3840 thiss!1602)))))

(assert (= start!31972 b!158715))

(declare-fun m!249265 () Bool)

(assert (=> start!31972 m!249265))

(declare-fun m!249267 () Bool)

(assert (=> b!158715 m!249267))

(push 1)

(assert (not b!158715))

(assert (not start!31972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

