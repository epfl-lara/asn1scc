; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14892 () Bool)

(assert start!14892)

(declare-fun res!63241 () Bool)

(declare-fun e!50236 () Bool)

(assert (=> start!14892 (=> (not res!63241) (not e!50236))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((array!3174 0))(
  ( (array!3175 (arr!2079 (Array (_ BitVec 32) (_ BitVec 8))) (size!1478 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2530 0))(
  ( (BitStream!2531 (buf!1862 array!3174) (currentByte!3660 (_ BitVec 32)) (currentBit!3655 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2530)

(assert (=> start!14892 (= res!63241 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1478 (buf!1862 thiss!1090))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3660 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3655 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1478 (buf!1862 thiss!1090))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3660 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3655 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!14892 e!50236))

(assert (=> start!14892 true))

(declare-fun e!50237 () Bool)

(declare-fun inv!12 (BitStream!2530) Bool)

(assert (=> start!14892 (and (inv!12 thiss!1090) e!50237)))

(declare-fun b!76547 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76547 (= e!50236 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3655 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3660 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (size!1478 (buf!1862 thiss!1090)))))))))

(declare-fun b!76548 () Bool)

(declare-fun array_inv!1324 (array!3174) Bool)

(assert (=> b!76548 (= e!50237 (array_inv!1324 (buf!1862 thiss!1090)))))

(assert (= (and start!14892 res!63241) b!76547))

(assert (= start!14892 b!76548))

(declare-fun m!121791 () Bool)

(assert (=> start!14892 m!121791))

(declare-fun m!121793 () Bool)

(assert (=> b!76547 m!121793))

(declare-fun m!121795 () Bool)

(assert (=> b!76548 m!121795))

(push 1)

(assert (not b!76548))

(assert (not b!76547))

(assert (not start!14892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24216 () Bool)

