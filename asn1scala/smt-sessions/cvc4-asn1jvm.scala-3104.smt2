; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71486 () Bool)

(assert start!71486)

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20424 0))(
  ( (array!20425 (arr!9984 (Array (_ BitVec 32) (_ BitVec 8))) (size!8892 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13946 0))(
  ( (BitStream!13947 (buf!8034 array!20424) (currentByte!14828 (_ BitVec 32)) (currentBit!14823 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13946)

(assert (=> start!71486 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8892 (buf!8034 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14828 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14823 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8892 (buf!8034 thiss!1811))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14828 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14823 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71486 true))

(declare-fun e!231626 () Bool)

(declare-fun inv!12 (BitStream!13946) Bool)

(assert (=> start!71486 (and (inv!12 thiss!1811) e!231626)))

(declare-fun b!321523 () Bool)

(declare-fun array_inv!8444 (array!20424) Bool)

(assert (=> b!321523 (= e!231626 (array_inv!8444 (buf!8034 thiss!1811)))))

(assert (= start!71486 b!321523))

(declare-fun m!459891 () Bool)

(assert (=> start!71486 m!459891))

(declare-fun m!459893 () Bool)

(assert (=> b!321523 m!459893))

(push 1)

(assert (not b!321523))

(assert (not start!71486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

