; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71332 () Bool)

(assert start!71332)

(declare-datatypes ((array!20358 0))(
  ( (array!20359 (arr!9958 (Array (_ BitVec 32) (_ BitVec 8))) (size!8866 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13894 0))(
  ( (BitStream!13895 (buf!8008 array!20358) (currentByte!14779 (_ BitVec 32)) (currentBit!14774 (_ BitVec 32))) )
))
(declare-fun b!176 () BitStream!13894)

(assert (=> start!71332 (= (size!8866 (buf!8008 b!176)) #b10000000000000000000000000000000)))

(declare-fun e!231443 () Bool)

(declare-fun inv!12 (BitStream!13894) Bool)

(assert (=> start!71332 (and (inv!12 b!176) e!231443)))

(declare-fun b!321418 () Bool)

(declare-fun array_inv!8418 (array!20358) Bool)

(assert (=> b!321418 (= e!231443 (array_inv!8418 (buf!8008 b!176)))))

(assert (= start!71332 b!321418))

(declare-fun m!459729 () Bool)

(assert (=> start!71332 m!459729))

(declare-fun m!459731 () Bool)

(assert (=> b!321418 m!459731))

(push 1)

(assert (not start!71332))

(assert (not b!321418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105352 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105352 (= (inv!12 b!176) (invariant!0 (currentBit!14774 b!176) (currentByte!14779 b!176) (size!8866 (buf!8008 b!176))))))

(declare-fun bs!27705 () Bool)

(assert (= bs!27705 d!105352))

(declare-fun m!459741 () Bool)

(assert (=> bs!27705 m!459741))

(assert (=> start!71332 d!105352))

(declare-fun d!105362 () Bool)

(assert (=> d!105362 (= (array_inv!8418 (buf!8008 b!176)) (bvsge (size!8866 (buf!8008 b!176)) #b00000000000000000000000000000000))))

(assert (=> b!321418 d!105362))

(push 1)

