; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51778 () Bool)

(assert start!51778)

(declare-datatypes ((array!12987 0))(
  ( (array!12988 (arr!6679 (Array (_ BitVec 32) (_ BitVec 8))) (size!5692 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10306 0))(
  ( (BitStream!10307 (buf!6146 array!12987) (currentByte!11452 (_ BitVec 32)) (currentBit!11447 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10306)

(assert (=> start!51778 (and (bvsle ((_ sign_extend 32) (size!5692 (buf!6146 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11452 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11447 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5692 (buf!6146 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11452 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11447 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!165859 () Bool)

(declare-fun inv!12 (BitStream!10306) Bool)

(assert (=> start!51778 (and (inv!12 thiss!1948) e!165859)))

(declare-fun b!239507 () Bool)

(declare-fun array_inv!5433 (array!12987) Bool)

(assert (=> b!239507 (= e!165859 (array_inv!5433 (buf!6146 thiss!1948)))))

(assert (= start!51778 b!239507))

(declare-fun m!361729 () Bool)

(assert (=> start!51778 m!361729))

(declare-fun m!361731 () Bool)

(assert (=> b!239507 m!361731))

(push 1)

(assert (not start!51778))

(assert (not b!239507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80906 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80906 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11447 thiss!1948) (currentByte!11452 thiss!1948) (size!5692 (buf!6146 thiss!1948))))))

(declare-fun bs!20363 () Bool)

(assert (= bs!20363 d!80906))

(declare-fun m!361743 () Bool)

(assert (=> bs!20363 m!361743))

(assert (=> start!51778 d!80906))

(declare-fun d!80910 () Bool)

(assert (=> d!80910 (= (array_inv!5433 (buf!6146 thiss!1948)) (bvsge (size!5692 (buf!6146 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239507 d!80910))

(push 1)

(assert (not d!80906))

(check-sat)

(pop 1)

