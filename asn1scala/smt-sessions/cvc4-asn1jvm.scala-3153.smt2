; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72374 () Bool)

(assert start!72374)

(declare-fun res!265975 () Bool)

(declare-fun e!233479 () Bool)

(assert (=> start!72374 (=> (not res!265975) (not e!233479))))

(declare-datatypes ((array!20744 0))(
  ( (array!20745 (arr!10119 (Array (_ BitVec 32) (_ BitVec 8))) (size!9027 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14216 0))(
  ( (BitStream!14217 (buf!8169 array!20744) (currentByte!15065 (_ BitVec 32)) (currentBit!15060 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14216)

(assert (=> start!72374 (= res!265975 (and (bvsle ((_ sign_extend 32) (size!9027 (buf!8169 thiss!1702))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15065 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15060 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9027 (buf!8169 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15065 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15060 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!72374 e!233479))

(declare-fun e!233480 () Bool)

(declare-fun inv!12 (BitStream!14216) Bool)

(assert (=> start!72374 (and (inv!12 thiss!1702) e!233480)))

(declare-fun b!324036 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324036 (= e!233479 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15060 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15065 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (size!9027 (buf!8169 thiss!1702)))))))))

(declare-fun b!324037 () Bool)

(declare-fun array_inv!8579 (array!20744) Bool)

(assert (=> b!324037 (= e!233480 (array_inv!8579 (buf!8169 thiss!1702)))))

(assert (= (and start!72374 res!265975) b!324036))

(assert (= start!72374 b!324037))

(declare-fun m!462109 () Bool)

(assert (=> start!72374 m!462109))

(declare-fun m!462111 () Bool)

(assert (=> b!324036 m!462111))

(declare-fun m!462113 () Bool)

(assert (=> b!324037 m!462113))

(push 1)

(assert (not b!324037))

(assert (not start!72374))

(assert (not b!324036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106322 () Bool)

