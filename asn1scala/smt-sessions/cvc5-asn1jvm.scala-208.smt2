; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4144 () Bool)

(assert start!4144)

(declare-fun nBits!604 () (_ BitVec 64))

(declare-datatypes ((array!1127 0))(
  ( (array!1128 (arr!910 (Array (_ BitVec 32) (_ BitVec 8))) (size!481 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!832 0))(
  ( (BitStream!833 (buf!799 array!1127) (currentByte!1987 (_ BitVec 32)) (currentBit!1982 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!832)

(assert (=> start!4144 (and (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!481 (buf!799 thiss!1917))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1987 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1982 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!4144 true))

(declare-fun e!11165 () Bool)

(declare-fun inv!12 (BitStream!832) Bool)

(assert (=> start!4144 (and (inv!12 thiss!1917) e!11165)))

(declare-fun b!17456 () Bool)

(declare-fun array_inv!451 (array!1127) Bool)

(assert (=> b!17456 (= e!11165 (array_inv!451 (buf!799 thiss!1917)))))

(assert (= start!4144 b!17456))

(declare-fun m!23755 () Bool)

(assert (=> start!4144 m!23755))

(declare-fun m!23757 () Bool)

(assert (=> b!17456 m!23757))

(push 1)

(assert (not start!4144))

(assert (not b!17456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

