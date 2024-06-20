; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54796 () Bool)

(assert start!54796)

(declare-fun nBits!539 () (_ BitVec 64))

(declare-fun from!530 () (_ BitVec 64))

(declare-datatypes ((array!13856 0))(
  ( (array!13857 (arr!7068 (Array (_ BitVec 32) (_ BitVec 8))) (size!6081 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11084 0))(
  ( (BitStream!11085 (buf!6603 array!13856) (currentByte!12087 (_ BitVec 32)) (currentBit!12082 (_ BitVec 32))) )
))
(declare-fun thiss!1774 () BitStream!11084)

(assert (=> start!54796 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!539) (bvsle nBits!539 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!530) (bvsle from!530 nBits!539) (bvsle ((_ sign_extend 32) (size!6081 (buf!6603 thiss!1774))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12087 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12082 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6081 (buf!6603 thiss!1774))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12087 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12082 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54796 true))

(declare-fun e!177867 () Bool)

(declare-fun inv!12 (BitStream!11084) Bool)

(assert (=> start!54796 (and (inv!12 thiss!1774) e!177867)))

(declare-fun b!256672 () Bool)

(declare-fun array_inv!5822 (array!13856) Bool)

(assert (=> b!256672 (= e!177867 (array_inv!5822 (buf!6603 thiss!1774)))))

(assert (= start!54796 b!256672))

(declare-fun m!386267 () Bool)

(assert (=> start!54796 m!386267))

(declare-fun m!386269 () Bool)

(assert (=> b!256672 m!386269))

(push 1)

(assert (not start!54796))

(assert (not b!256672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

