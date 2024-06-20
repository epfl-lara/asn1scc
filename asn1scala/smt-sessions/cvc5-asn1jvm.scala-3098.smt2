; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71356 () Bool)

(assert start!71356)

(declare-datatypes ((array!20373 0))(
  ( (array!20374 (arr!9964 (Array (_ BitVec 32) (_ BitVec 8))) (size!8872 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13906 0))(
  ( (BitStream!13907 (buf!8014 array!20373) (currentByte!14785 (_ BitVec 32)) (currentBit!14780 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13906)

(assert (=> start!71356 (or (bvsgt ((_ sign_extend 32) (size!8872 (buf!8014 thiss!1701))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14785 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14780 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!231479 () Bool)

(declare-fun inv!12 (BitStream!13906) Bool)

(assert (=> start!71356 (and (inv!12 thiss!1701) e!231479)))

(declare-fun b!321436 () Bool)

(declare-fun array_inv!8424 (array!20373) Bool)

(assert (=> b!321436 (= e!231479 (array_inv!8424 (buf!8014 thiss!1701)))))

(assert (= start!71356 b!321436))

(declare-fun m!459759 () Bool)

(assert (=> start!71356 m!459759))

(declare-fun m!459761 () Bool)

(assert (=> b!321436 m!459761))

(push 1)

(assert (not b!321436))

(assert (not start!71356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

