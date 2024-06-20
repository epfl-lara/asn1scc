; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51776 () Bool)

(assert start!51776)

(declare-datatypes ((array!12985 0))(
  ( (array!12986 (arr!6678 (Array (_ BitVec 32) (_ BitVec 8))) (size!5691 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10304 0))(
  ( (BitStream!10305 (buf!6145 array!12985) (currentByte!11451 (_ BitVec 32)) (currentBit!11446 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10304)

(assert (=> start!51776 (or (bvsgt ((_ sign_extend 32) (size!5691 (buf!6145 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11451 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11446 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!165853 () Bool)

(declare-fun inv!12 (BitStream!10304) Bool)

(assert (=> start!51776 (and (inv!12 thiss!1948) e!165853)))

(declare-fun b!239504 () Bool)

(declare-fun array_inv!5432 (array!12985) Bool)

(assert (=> b!239504 (= e!165853 (array_inv!5432 (buf!6145 thiss!1948)))))

(assert (= start!51776 b!239504))

(declare-fun m!361725 () Bool)

(assert (=> start!51776 m!361725))

(declare-fun m!361727 () Bool)

(assert (=> b!239504 m!361727))

(push 1)

(assert (not b!239504))

(assert (not start!51776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

