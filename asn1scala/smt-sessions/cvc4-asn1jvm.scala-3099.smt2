; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71366 () Bool)

(assert start!71366)

(declare-datatypes ((array!20383 0))(
  ( (array!20384 (arr!9969 (Array (_ BitVec 32) (_ BitVec 8))) (size!8877 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13916 0))(
  ( (BitStream!13917 (buf!8019 array!20383) (currentByte!14790 (_ BitVec 32)) (currentBit!14785 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13916)

(assert (=> start!71366 (and (bvsle ((_ sign_extend 32) (size!8877 (buf!8019 thiss!1701))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14790 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14785 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8877 (buf!8019 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14790 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14785 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!231509 () Bool)

(declare-fun inv!12 (BitStream!13916) Bool)

(assert (=> start!71366 (and (inv!12 thiss!1701) e!231509)))

(declare-fun b!321451 () Bool)

(declare-fun array_inv!8429 (array!20383) Bool)

(assert (=> b!321451 (= e!231509 (array_inv!8429 (buf!8019 thiss!1701)))))

(assert (= start!71366 b!321451))

(declare-fun m!459779 () Bool)

(assert (=> start!71366 m!459779))

(declare-fun m!459781 () Bool)

(assert (=> b!321451 m!459781))

(push 1)

(assert (not b!321451))

(assert (not start!71366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

