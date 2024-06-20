; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3256 () Bool)

(assert start!3256)

(declare-fun nBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!829 0))(
  ( (array!830 (arr!783 (Array (_ BitVec 32) (_ BitVec 8))) (size!354 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!668 0))(
  ( (BitStream!669 (buf!705 array!829) (currentByte!1846 (_ BitVec 32)) (currentBit!1841 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!668)

(assert (=> start!3256 (and (bvsge nBytes!1 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!354 (buf!705 thiss!1862))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1846 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1841 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!354 (buf!705 thiss!1862))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1846 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1841 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3256 true))

(declare-fun e!9080 () Bool)

(declare-fun inv!12 (BitStream!668) Bool)

(assert (=> start!3256 (and (inv!12 thiss!1862) e!9080)))

(declare-fun b!14597 () Bool)

(declare-fun array_inv!343 (array!829) Bool)

(assert (=> b!14597 (= e!9080 (array_inv!343 (buf!705 thiss!1862)))))

(assert (= start!3256 b!14597))

(declare-fun m!21027 () Bool)

(assert (=> start!3256 m!21027))

(declare-fun m!21029 () Bool)

(assert (=> b!14597 m!21029))

(push 1)

(assert (not b!14597))

(assert (not start!3256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4780 () Bool)

(assert (=> d!4780 (= (array_inv!343 (buf!705 thiss!1862)) (bvsge (size!354 (buf!705 thiss!1862)) #b00000000000000000000000000000000))))

(assert (=> b!14597 d!4780))

(declare-fun d!4782 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4782 (= (inv!12 thiss!1862) (invariant!0 (currentBit!1841 thiss!1862) (currentByte!1846 thiss!1862) (size!354 (buf!705 thiss!1862))))))

(declare-fun bs!1315 () Bool)

(assert (= bs!1315 d!4782))

(declare-fun m!21035 () Bool)

