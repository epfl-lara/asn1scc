; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54790 () Bool)

(assert start!54790)

(declare-fun nBits!539 () (_ BitVec 64))

(declare-fun from!530 () (_ BitVec 64))

(declare-datatypes ((array!13850 0))(
  ( (array!13851 (arr!7065 (Array (_ BitVec 32) (_ BitVec 8))) (size!6078 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11078 0))(
  ( (BitStream!11079 (buf!6600 array!13850) (currentByte!12084 (_ BitVec 32)) (currentBit!12079 (_ BitVec 32))) )
))
(declare-fun thiss!1774 () BitStream!11078)

(assert (=> start!54790 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!539) (bvsle nBits!539 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!530) (bvsle from!530 nBits!539) (or (bvsgt ((_ sign_extend 32) (size!6078 (buf!6600 thiss!1774))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12084 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12079 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!54790 true))

(declare-fun e!177849 () Bool)

(declare-fun inv!12 (BitStream!11078) Bool)

(assert (=> start!54790 (and (inv!12 thiss!1774) e!177849)))

(declare-fun b!256663 () Bool)

(declare-fun array_inv!5819 (array!13850) Bool)

(assert (=> b!256663 (= e!177849 (array_inv!5819 (buf!6600 thiss!1774)))))

(assert (= start!54790 b!256663))

(declare-fun m!386255 () Bool)

(assert (=> start!54790 m!386255))

(declare-fun m!386257 () Bool)

(assert (=> b!256663 m!386257))

(push 1)

(assert (not start!54790))

(assert (not b!256663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

