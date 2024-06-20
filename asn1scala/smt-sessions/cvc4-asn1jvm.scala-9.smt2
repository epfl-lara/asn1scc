; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!158 () Bool)

(assert start!158)

(declare-fun res!2518 () Bool)

(declare-fun e!168 () Bool)

(assert (=> start!158 (=> (not res!2518) (not e!168))))

(declare-datatypes ((array!67 0))(
  ( (array!68 (arr!414 (Array (_ BitVec 32) (_ BitVec 8))) (size!27 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!38 0))(
  ( (BitStream!39 (buf!339 array!67) (currentByte!1234 (_ BitVec 32)) (currentBit!1229 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!38)

(assert (=> start!158 (= res!2518 (and (bvsle ((_ sign_extend 32) (size!27 (buf!339 thiss!932))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1234 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1229 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!27 (buf!339 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1234 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1229 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!158 e!168))

(declare-fun e!169 () Bool)

(declare-fun inv!12 (BitStream!38) Bool)

(assert (=> start!158 (and (inv!12 thiss!932) e!169)))

(declare-fun b!411 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!411 (= e!168 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1229 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1234 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (size!27 (buf!339 thiss!932)))))))))

(declare-fun b!412 () Bool)

(declare-fun array_inv!24 (array!67) Bool)

(assert (=> b!412 (= e!169 (array_inv!24 (buf!339 thiss!932)))))

(assert (= (and start!158 res!2518) b!411))

(assert (= start!158 b!412))

(declare-fun m!163 () Bool)

(assert (=> start!158 m!163))

(declare-fun m!165 () Bool)

(assert (=> b!411 m!165))

(declare-fun m!167 () Bool)

(assert (=> b!412 m!167))

(push 1)

(assert (not b!412))

(assert (not start!158))

(assert (not b!411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!828 () Bool)

(assert (=> d!828 (= (array_inv!24 (buf!339 thiss!932)) (bvsge (size!27 (buf!339 thiss!932)) #b00000000000000000000000000000000))))

