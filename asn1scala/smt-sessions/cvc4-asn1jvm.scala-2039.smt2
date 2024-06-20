; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52024 () Bool)

(assert start!52024)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13087 0))(
  ( (array!13088 (arr!6720 (Array (_ BitVec 32) (_ BitVec 8))) (size!5733 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10388 0))(
  ( (BitStream!10389 (buf!6187 array!13087) (currentByte!11526 (_ BitVec 32)) (currentBit!11521 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10388)

(assert (=> start!52024 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!5733 (buf!6187 thiss!982))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11526 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11521 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!52024 true))

(declare-fun e!166246 () Bool)

(declare-fun inv!12 (BitStream!10388) Bool)

(assert (=> start!52024 (and (inv!12 thiss!982) e!166246)))

(declare-fun b!239804 () Bool)

(declare-fun array_inv!5474 (array!13087) Bool)

(assert (=> b!239804 (= e!166246 (array_inv!5474 (buf!6187 thiss!982)))))

(assert (= start!52024 b!239804))

(declare-fun m!362115 () Bool)

(assert (=> start!52024 m!362115))

(declare-fun m!362117 () Bool)

(assert (=> b!239804 m!362117))

(push 1)

(assert (not start!52024))

(assert (not b!239804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

