; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70976 () Bool)

(assert start!70976)

(declare-fun res!263467 () Bool)

(declare-fun e!230878 () Bool)

(assert (=> start!70976 (=> (not res!263467) (not e!230878))))

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20238 0))(
  ( (array!20239 (arr!9913 (Array (_ BitVec 32) (_ BitVec 8))) (size!8821 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13804 0))(
  ( (BitStream!13805 (buf!7963 array!20238) (currentByte!14692 (_ BitVec 32)) (currentBit!14687 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13804)

(assert (=> start!70976 (= res!263467 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8821 (buf!7963 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14692 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14687 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8821 (buf!7963 thiss!1788))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14692 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14687 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!70976 e!230878))

(assert (=> start!70976 true))

(declare-fun e!230879 () Bool)

(declare-fun inv!12 (BitStream!13804) Bool)

(assert (=> start!70976 (and (inv!12 thiss!1788) e!230879)))

(declare-fun b!320721 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320721 (= e!230878 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14687 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14692 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (size!8821 (buf!7963 thiss!1788)))))))))

(declare-fun b!320722 () Bool)

(declare-fun array_inv!8373 (array!20238) Bool)

(assert (=> b!320722 (= e!230879 (array_inv!8373 (buf!7963 thiss!1788)))))

(assert (= (and start!70976 res!263467) b!320721))

(assert (= start!70976 b!320722))

(declare-fun m!459089 () Bool)

(assert (=> start!70976 m!459089))

(declare-fun m!459091 () Bool)

(assert (=> b!320721 m!459091))

(declare-fun m!459093 () Bool)

(assert (=> b!320722 m!459093))

(push 1)

(assert (not start!70976))

(assert (not b!320721))

(assert (not b!320722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

