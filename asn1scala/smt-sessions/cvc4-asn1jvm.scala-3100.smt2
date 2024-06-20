; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71386 () Bool)

(assert start!71386)

(declare-fun res!263950 () Bool)

(declare-fun e!231535 () Bool)

(assert (=> start!71386 (=> (not res!263950) (not e!231535))))

(declare-datatypes ((array!20392 0))(
  ( (array!20393 (arr!9972 (Array (_ BitVec 32) (_ BitVec 8))) (size!8880 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13922 0))(
  ( (BitStream!13923 (buf!8022 array!20392) (currentByte!14795 (_ BitVec 32)) (currentBit!14790 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13922)

(assert (=> start!71386 (= res!263950 (and (bvsle ((_ sign_extend 32) (size!8880 (buf!8022 thiss!1701))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14795 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14790 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8880 (buf!8022 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14795 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14790 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71386 e!231535))

(declare-fun e!231536 () Bool)

(declare-fun inv!12 (BitStream!13922) Bool)

(assert (=> start!71386 (and (inv!12 thiss!1701) e!231536)))

(declare-fun b!321468 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321468 (= e!231535 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14790 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14795 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (size!8880 (buf!8022 thiss!1701)))))))))

(declare-fun b!321469 () Bool)

(declare-fun array_inv!8432 (array!20392) Bool)

(assert (=> b!321469 (= e!231536 (array_inv!8432 (buf!8022 thiss!1701)))))

(assert (= (and start!71386 res!263950) b!321468))

(assert (= start!71386 b!321469))

(declare-fun m!459799 () Bool)

(assert (=> start!71386 m!459799))

(declare-fun m!459801 () Bool)

(assert (=> b!321468 m!459801))

(declare-fun m!459803 () Bool)

(assert (=> b!321469 m!459803))

(push 1)

(assert (not start!71386))

(assert (not b!321468))

(assert (not b!321469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

