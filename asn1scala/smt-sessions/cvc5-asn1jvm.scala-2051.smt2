; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52288 () Bool)

(assert start!52288)

(declare-fun res!200958 () Bool)

(declare-fun e!166823 () Bool)

(assert (=> start!52288 (=> (not res!200958) (not e!166823))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52288 (= res!200958 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52288 e!166823))

(assert (=> start!52288 true))

(declare-datatypes ((array!13168 0))(
  ( (array!13169 (arr!6754 (Array (_ BitVec 32) (_ BitVec 8))) (size!5767 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10456 0))(
  ( (BitStream!10457 (buf!6230 array!13168) (currentByte!11587 (_ BitVec 32)) (currentBit!11582 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10456)

(declare-fun e!166822 () Bool)

(declare-fun inv!12 (BitStream!10456) Bool)

(assert (=> start!52288 (and (inv!12 thiss!982) e!166822)))

(declare-fun b!240720 () Bool)

(declare-fun res!200957 () Bool)

(assert (=> b!240720 (=> (not res!200957) (not e!166823))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240720 (= res!200957 (validate_offset_bits!1 ((_ sign_extend 32) (size!5767 (buf!6230 thiss!982))) ((_ sign_extend 32) (currentByte!11587 thiss!982)) ((_ sign_extend 32) (currentBit!11582 thiss!982)) nBits!288))))

(declare-fun b!240721 () Bool)

(assert (=> b!240721 (= e!166823 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5767 (buf!6230 thiss!982))) ((_ sign_extend 32) (currentByte!11587 thiss!982)) ((_ sign_extend 32) (currentBit!11582 thiss!982)) nBits!288)))))

(declare-fun b!240722 () Bool)

(declare-fun array_inv!5508 (array!13168) Bool)

(assert (=> b!240722 (= e!166822 (array_inv!5508 (buf!6230 thiss!982)))))

(assert (= (and start!52288 res!200958) b!240720))

(assert (= (and b!240720 res!200957) b!240721))

(assert (= start!52288 b!240722))

(declare-fun m!363321 () Bool)

(assert (=> start!52288 m!363321))

(declare-fun m!363323 () Bool)

(assert (=> b!240720 m!363323))

(assert (=> b!240721 m!363323))

(declare-fun m!363325 () Bool)

(assert (=> b!240722 m!363325))

(push 1)

(assert (not b!240722))

(assert (not start!52288))

(assert (not b!240721))

(assert (not b!240720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

