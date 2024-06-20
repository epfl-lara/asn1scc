; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70958 () Bool)

(assert start!70958)

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20229 0))(
  ( (array!20230 (arr!9910 (Array (_ BitVec 32) (_ BitVec 8))) (size!8818 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13798 0))(
  ( (BitStream!13799 (buf!7960 array!20229) (currentByte!14688 (_ BitVec 32)) (currentBit!14683 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13798)

(assert (=> start!70958 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8818 (buf!7960 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14688 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14683 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8818 (buf!7960 thiss!1788))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14688 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14683 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!70958 true))

(declare-fun e!230858 () Bool)

(declare-fun inv!12 (BitStream!13798) Bool)

(assert (=> start!70958 (and (inv!12 thiss!1788) e!230858)))

(declare-fun b!320710 () Bool)

(declare-fun array_inv!8370 (array!20229) Bool)

(assert (=> b!320710 (= e!230858 (array_inv!8370 (buf!7960 thiss!1788)))))

(assert (= start!70958 b!320710))

(declare-fun m!459073 () Bool)

(assert (=> start!70958 m!459073))

(declare-fun m!459075 () Bool)

(assert (=> b!320710 m!459075))

(push 1)

(assert (not start!70958))

(assert (not b!320710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105004 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105004 (= (inv!12 thiss!1788) (invariant!0 (currentBit!14683 thiss!1788) (currentByte!14688 thiss!1788) (size!8818 (buf!7960 thiss!1788))))))

(declare-fun bs!27609 () Bool)

(assert (= bs!27609 d!105004))

(declare-fun m!459087 () Bool)

(assert (=> bs!27609 m!459087))

(assert (=> start!70958 d!105004))

(declare-fun d!105006 () Bool)

(assert (=> d!105006 (= (array_inv!8370 (buf!7960 thiss!1788)) (bvsge (size!8818 (buf!7960 thiss!1788)) #b00000000000000000000000000000000))))

(assert (=> b!320710 d!105006))

(push 1)

(assert (not d!105004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

