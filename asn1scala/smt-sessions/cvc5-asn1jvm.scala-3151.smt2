; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72344 () Bool)

(assert start!72344)

(declare-datatypes ((array!20725 0))(
  ( (array!20726 (arr!10111 (Array (_ BitVec 32) (_ BitVec 8))) (size!9019 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14200 0))(
  ( (BitStream!14201 (buf!8161 array!20725) (currentByte!15056 (_ BitVec 32)) (currentBit!15051 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14200)

(assert (=> start!72344 (or (bvsgt ((_ sign_extend 32) (size!9019 (buf!8161 thiss!1702))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15056 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15051 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!233423 () Bool)

(declare-fun inv!12 (BitStream!14200) Bool)

(assert (=> start!72344 (and (inv!12 thiss!1702) e!233423)))

(declare-fun b!324004 () Bool)

(declare-fun array_inv!8571 (array!20725) Bool)

(assert (=> b!324004 (= e!233423 (array_inv!8571 (buf!8161 thiss!1702)))))

(assert (= start!72344 b!324004))

(declare-fun m!462067 () Bool)

(assert (=> start!72344 m!462067))

(declare-fun m!462069 () Bool)

(assert (=> b!324004 m!462069))

(push 1)

(assert (not b!324004))

(assert (not start!72344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

