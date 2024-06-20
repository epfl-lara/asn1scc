; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54806 () Bool)

(assert start!54806)

(declare-fun res!215158 () Bool)

(declare-fun e!177875 () Bool)

(assert (=> start!54806 (=> (not res!215158) (not e!177875))))

(declare-fun nBits!539 () (_ BitVec 64))

(declare-datatypes ((array!13860 0))(
  ( (array!13861 (arr!7069 (Array (_ BitVec 32) (_ BitVec 8))) (size!6082 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11086 0))(
  ( (BitStream!11087 (buf!6604 array!13860) (currentByte!12089 (_ BitVec 32)) (currentBit!12084 (_ BitVec 32))) )
))
(declare-fun thiss!1774 () BitStream!11086)

(declare-fun from!530 () (_ BitVec 64))

(assert (=> start!54806 (= res!215158 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!539) (bvsle nBits!539 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!530) (bvsle from!530 nBits!539) (bvsle ((_ sign_extend 32) (size!6082 (buf!6604 thiss!1774))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12089 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12084 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6082 (buf!6604 thiss!1774))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12089 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12084 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54806 e!177875))

(assert (=> start!54806 true))

(declare-fun e!177876 () Bool)

(declare-fun inv!12 (BitStream!11086) Bool)

(assert (=> start!54806 (and (inv!12 thiss!1774) e!177876)))

(declare-fun b!256677 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256677 (= e!177875 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12084 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12089 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (size!6082 (buf!6604 thiss!1774)))))))))

(declare-fun b!256678 () Bool)

(declare-fun array_inv!5823 (array!13860) Bool)

(assert (=> b!256678 (= e!177876 (array_inv!5823 (buf!6604 thiss!1774)))))

(assert (= (and start!54806 res!215158) b!256677))

(assert (= start!54806 b!256678))

(declare-fun m!386273 () Bool)

(assert (=> start!54806 m!386273))

(declare-fun m!386275 () Bool)

(assert (=> b!256677 m!386275))

(declare-fun m!386277 () Bool)

(assert (=> b!256678 m!386277))

(push 1)

(assert (not start!54806))

(assert (not b!256677))

(assert (not b!256678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

