; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52020 () Bool)

(assert start!52020)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13083 0))(
  ( (array!13084 (arr!6718 (Array (_ BitVec 32) (_ BitVec 8))) (size!5731 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10384 0))(
  ( (BitStream!10385 (buf!6185 array!13083) (currentByte!11524 (_ BitVec 32)) (currentBit!11519 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10384)

(assert (=> start!52020 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!5731 (buf!6185 thiss!982))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11524 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11519 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!52020 true))

(declare-fun e!166234 () Bool)

(declare-fun inv!12 (BitStream!10384) Bool)

(assert (=> start!52020 (and (inv!12 thiss!982) e!166234)))

(declare-fun b!239798 () Bool)

(declare-fun array_inv!5472 (array!13083) Bool)

(assert (=> b!239798 (= e!166234 (array_inv!5472 (buf!6185 thiss!982)))))

(assert (= start!52020 b!239798))

(declare-fun m!362107 () Bool)

(assert (=> start!52020 m!362107))

(declare-fun m!362109 () Bool)

(assert (=> b!239798 m!362109))

(push 1)

(assert (not b!239798))

(assert (not start!52020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

