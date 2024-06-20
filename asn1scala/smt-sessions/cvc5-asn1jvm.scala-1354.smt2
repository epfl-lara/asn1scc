; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37592 () Bool)

(assert start!37592)

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(declare-datatypes ((array!9021 0))(
  ( (array!9022 (arr!4924 (Array (_ BitVec 32) (_ BitVec 8))) (size!3994 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7126 0))(
  ( (BitStream!7127 (buf!4437 array!9021) (currentByte!8421 (_ BitVec 32)) (currentBit!8416 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7126)

(assert (=> start!37592 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (or (bvsgt ((_ sign_extend 32) (size!3994 (buf!4437 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8421 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8416 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!37592 true))

(declare-fun e!119067 () Bool)

(declare-fun inv!12 (BitStream!7126) Bool)

(assert (=> start!37592 (and (inv!12 bs!64) e!119067)))

(declare-fun b!170703 () Bool)

(declare-fun array_inv!3735 (array!9021) Bool)

(assert (=> b!170703 (= e!119067 (array_inv!3735 (buf!4437 bs!64)))))

(assert (= start!37592 b!170703))

(declare-fun m!269855 () Bool)

(assert (=> start!37592 m!269855))

(declare-fun m!269857 () Bool)

(assert (=> b!170703 m!269857))

(push 1)

(assert (not start!37592))

(assert (not b!170703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

