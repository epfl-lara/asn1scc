; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73146 () Bool)

(assert start!73146)

(declare-fun res!266881 () Bool)

(declare-fun e!234445 () Bool)

(assert (=> start!73146 (=> (not res!266881) (not e!234445))))

(declare-datatypes ((array!20985 0))(
  ( (array!20986 (arr!10206 (Array (_ BitVec 32) (_ BitVec 8))) (size!9114 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14390 0))(
  ( (BitStream!14391 (buf!8256 array!20985) (currentByte!15303 (_ BitVec 32)) (currentBit!15298 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14390)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73146 (= res!266881 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9114 (buf!8256 thiss!877))) ((_ sign_extend 32) (currentByte!15303 thiss!877)) ((_ sign_extend 32) (currentBit!15298 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73146 e!234445))

(declare-fun e!234446 () Bool)

(declare-fun inv!12 (BitStream!14390) Bool)

(assert (=> start!73146 (and (inv!12 thiss!877) e!234446)))

(declare-fun b!325203 () Bool)

(assert (=> b!325203 (= e!234445 (and (bvslt (currentBit!15298 thiss!877) #b00000000000000000000000000000111) (= (bvand (currentBit!15298 thiss!877) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentBit!15298 thiss!877) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentBit!15298 thiss!877)) #b10000000000000000000000000000000)))))))

(declare-fun b!325204 () Bool)

(declare-fun array_inv!8666 (array!20985) Bool)

(assert (=> b!325204 (= e!234446 (array_inv!8666 (buf!8256 thiss!877)))))

(assert (= (and start!73146 res!266881) b!325203))

(assert (= start!73146 b!325204))

(declare-fun m!463207 () Bool)

(assert (=> start!73146 m!463207))

(declare-fun m!463209 () Bool)

(assert (=> start!73146 m!463209))

(declare-fun m!463211 () Bool)

(assert (=> b!325204 m!463211))

(push 1)

(assert (not start!73146))

(assert (not b!325204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

