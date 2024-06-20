; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71012 () Bool)

(assert start!71012)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20262 0))(
  ( (array!20263 (arr!9924 (Array (_ BitVec 32) (_ BitVec 8))) (size!8832 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13826 0))(
  ( (BitStream!13827 (buf!7974 array!20262) (currentByte!14705 (_ BitVec 32)) (currentBit!14700 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13826)

(assert (=> start!71012 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8832 (buf!7974 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14705 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14700 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8832 (buf!7974 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14705 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14700 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71012 true))

(declare-fun e!230960 () Bool)

(declare-fun inv!12 (BitStream!13826) Bool)

(assert (=> start!71012 (and (inv!12 thiss!1780) e!230960)))

(declare-fun b!320779 () Bool)

(declare-fun array_inv!8384 (array!20262) Bool)

(assert (=> b!320779 (= e!230960 (array_inv!8384 (buf!7974 thiss!1780)))))

(assert (= start!71012 b!320779))

(declare-fun m!459149 () Bool)

(assert (=> start!71012 m!459149))

(declare-fun m!459151 () Bool)

(assert (=> b!320779 m!459151))

(push 1)

(assert (not start!71012))

(assert (not b!320779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

