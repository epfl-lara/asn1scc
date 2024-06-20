; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51212 () Bool)

(assert start!51212)

(declare-datatypes ((array!12799 0))(
  ( (array!12800 (arr!6610 (Array (_ BitVec 32) (_ BitVec 8))) (size!5623 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10168 0))(
  ( (BitStream!10169 (buf!6077 array!12799) (currentByte!11269 (_ BitVec 32)) (currentBit!11264 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10168)

(assert (=> start!51212 (or (bvsgt ((_ sign_extend 32) (size!5623 (buf!6077 thiss!1857))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11269 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11264 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!165262 () Bool)

(declare-fun inv!12 (BitStream!10168) Bool)

(assert (=> start!51212 (and (inv!12 thiss!1857) e!165262)))

(declare-fun b!239096 () Bool)

(declare-fun array_inv!5364 (array!12799) Bool)

(assert (=> b!239096 (= e!165262 (array_inv!5364 (buf!6077 thiss!1857)))))

(assert (= start!51212 b!239096))

(declare-fun m!361113 () Bool)

(assert (=> start!51212 m!361113))

(declare-fun m!361115 () Bool)

(assert (=> b!239096 m!361115))

(push 1)

(assert (not b!239096))

(assert (not start!51212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

