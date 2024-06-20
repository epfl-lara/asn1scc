; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71006 () Bool)

(assert start!71006)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20256 0))(
  ( (array!20257 (arr!9921 (Array (_ BitVec 32) (_ BitVec 8))) (size!8829 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13820 0))(
  ( (BitStream!13821 (buf!7971 array!20256) (currentByte!14702 (_ BitVec 32)) (currentBit!14697 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13820)

(assert (=> start!71006 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8829 (buf!7971 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14702 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14697 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!71006 true))

(declare-fun e!230942 () Bool)

(declare-fun inv!12 (BitStream!13820) Bool)

(assert (=> start!71006 (and (inv!12 thiss!1780) e!230942)))

(declare-fun b!320770 () Bool)

(declare-fun array_inv!8381 (array!20256) Bool)

(assert (=> b!320770 (= e!230942 (array_inv!8381 (buf!7971 thiss!1780)))))

(assert (= start!71006 b!320770))

(declare-fun m!459137 () Bool)

(assert (=> start!71006 m!459137))

(declare-fun m!459139 () Bool)

(assert (=> b!320770 m!459139))

(push 1)

(assert (not start!71006))

(assert (not b!320770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

