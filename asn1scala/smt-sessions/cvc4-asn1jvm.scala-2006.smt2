; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51304 () Bool)

(assert start!51304)

(declare-datatypes ((array!12842 0))(
  ( (array!12843 (arr!6627 (Array (_ BitVec 32) (_ BitVec 8))) (size!5640 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10202 0))(
  ( (BitStream!10203 (buf!6094 array!12842) (currentByte!11297 (_ BitVec 32)) (currentBit!11292 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10202)

(assert (=> start!51304 (and (bvsle ((_ sign_extend 32) (size!5640 (buf!6094 thiss!1854))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11297 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11292 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5640 (buf!6094 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11297 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11292 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!165382 () Bool)

(declare-fun inv!12 (BitStream!10202) Bool)

(assert (=> start!51304 (and (inv!12 thiss!1854) e!165382)))

(declare-fun b!239165 () Bool)

(declare-fun array_inv!5381 (array!12842) Bool)

(assert (=> b!239165 (= e!165382 (array_inv!5381 (buf!6094 thiss!1854)))))

(assert (= start!51304 b!239165))

(declare-fun m!361223 () Bool)

(assert (=> start!51304 m!361223))

(declare-fun m!361225 () Bool)

(assert (=> b!239165 m!361225))

(push 1)

(assert (not start!51304))

(assert (not b!239165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

