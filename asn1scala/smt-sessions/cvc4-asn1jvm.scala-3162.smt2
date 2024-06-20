; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72660 () Bool)

(assert start!72660)

(declare-datatypes ((array!20822 0))(
  ( (array!20823 (arr!10146 (Array (_ BitVec 32) (_ BitVec 8))) (size!9054 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14270 0))(
  ( (BitStream!14271 (buf!8196 array!20822) (currentByte!15148 (_ BitVec 32)) (currentBit!15143 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14270)

(assert (=> start!72660 (and (bvsle ((_ sign_extend 32) (size!9054 (buf!8196 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15148 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15143 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9054 (buf!8196 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15148 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15143 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!233792 () Bool)

(declare-fun inv!12 (BitStream!14270) Bool)

(assert (=> start!72660 (and (inv!12 thiss!877) e!233792)))

(declare-fun b!324355 () Bool)

(declare-fun array_inv!8606 (array!20822) Bool)

(assert (=> b!324355 (= e!233792 (array_inv!8606 (buf!8196 thiss!877)))))

(assert (= start!72660 b!324355))

(declare-fun m!462475 () Bool)

(assert (=> start!72660 m!462475))

(declare-fun m!462477 () Bool)

(assert (=> b!324355 m!462477))

(push 1)

(assert (not b!324355))

(assert (not start!72660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106596 () Bool)

