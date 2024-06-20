; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14872 () Bool)

(assert start!14872)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((array!3164 0))(
  ( (array!3165 (arr!2075 (Array (_ BitVec 32) (_ BitVec 8))) (size!1474 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2522 0))(
  ( (BitStream!2523 (buf!1858 array!3164) (currentByte!3655 (_ BitVec 32)) (currentBit!3650 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2522)

(assert (=> start!14872 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!1474 (buf!1858 thiss!1090))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3655 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3650 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!14872 true))

(declare-fun e!50210 () Bool)

(declare-fun inv!12 (BitStream!2522) Bool)

(assert (=> start!14872 (and (inv!12 thiss!1090) e!50210)))

(declare-fun b!76533 () Bool)

(declare-fun array_inv!1320 (array!3164) Bool)

(assert (=> b!76533 (= e!50210 (array_inv!1320 (buf!1858 thiss!1090)))))

(assert (= start!14872 b!76533))

(declare-fun m!121771 () Bool)

(assert (=> start!14872 m!121771))

(declare-fun m!121773 () Bool)

(assert (=> b!76533 m!121773))

(push 1)

