; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15252 () Bool)

(assert start!15252)

(declare-fun bitNr!1 () (_ BitVec 32))

(declare-datatypes ((array!3303 0))(
  ( (array!3304 (arr!2135 (Array (_ BitVec 32) (_ BitVec 8))) (size!1534 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2630 0))(
  ( (BitStream!2631 (buf!1924 array!3303) (currentByte!3741 (_ BitVec 32)) (currentBit!3736 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2630)

(assert (=> start!15252 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!1534 (buf!1924 thiss!1107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3741 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3736 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1534 (buf!1924 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3741 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3736 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15252 true))

(declare-fun e!51095 () Bool)

(declare-fun inv!12 (BitStream!2630) Bool)

(assert (=> start!15252 (and (inv!12 thiss!1107) e!51095)))

(declare-fun b!77898 () Bool)

(declare-fun array_inv!1380 (array!3303) Bool)

(assert (=> b!77898 (= e!51095 (array_inv!1380 (buf!1924 thiss!1107)))))

(assert (= start!15252 b!77898))

(declare-fun m!123523 () Bool)

(assert (=> start!15252 m!123523))

(declare-fun m!123525 () Bool)

(assert (=> b!77898 m!123525))

(push 1)

(assert (not start!15252))

(assert (not b!77898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24558 () Bool)

