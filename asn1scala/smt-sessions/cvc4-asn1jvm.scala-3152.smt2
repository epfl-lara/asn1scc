; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72354 () Bool)

(assert start!72354)

(declare-datatypes ((array!20735 0))(
  ( (array!20736 (arr!10116 (Array (_ BitVec 32) (_ BitVec 8))) (size!9024 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14210 0))(
  ( (BitStream!14211 (buf!8166 array!20735) (currentByte!15061 (_ BitVec 32)) (currentBit!15056 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14210)

(assert (=> start!72354 (and (bvsle ((_ sign_extend 32) (size!9024 (buf!8166 thiss!1702))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15061 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15056 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9024 (buf!8166 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15061 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15056 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!233453 () Bool)

(declare-fun inv!12 (BitStream!14210) Bool)

(assert (=> start!72354 (and (inv!12 thiss!1702) e!233453)))

(declare-fun b!324019 () Bool)

(declare-fun array_inv!8576 (array!20735) Bool)

(assert (=> b!324019 (= e!233453 (array_inv!8576 (buf!8166 thiss!1702)))))

(assert (= start!72354 b!324019))

(declare-fun m!462087 () Bool)

(assert (=> start!72354 m!462087))

(declare-fun m!462089 () Bool)

(assert (=> b!324019 m!462089))

(push 1)

(assert (not start!72354))

(assert (not b!324019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

