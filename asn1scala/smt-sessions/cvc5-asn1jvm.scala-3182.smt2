; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73142 () Bool)

(assert start!73142)

(declare-fun res!266875 () Bool)

(declare-fun e!234427 () Bool)

(assert (=> start!73142 (=> (not res!266875) (not e!234427))))

(declare-datatypes ((array!20981 0))(
  ( (array!20982 (arr!10204 (Array (_ BitVec 32) (_ BitVec 8))) (size!9112 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14386 0))(
  ( (BitStream!14387 (buf!8254 array!20981) (currentByte!15301 (_ BitVec 32)) (currentBit!15296 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14386)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73142 (= res!266875 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9112 (buf!8254 thiss!877))) ((_ sign_extend 32) (currentByte!15301 thiss!877)) ((_ sign_extend 32) (currentBit!15296 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73142 e!234427))

(declare-fun e!234428 () Bool)

(declare-fun inv!12 (BitStream!14386) Bool)

(assert (=> start!73142 (and (inv!12 thiss!877) e!234428)))

(declare-fun b!325191 () Bool)

(assert (=> b!325191 (= e!234427 (and (bvslt (currentBit!15296 thiss!877) #b00000000000000000000000000000111) (= (bvand (currentBit!15296 thiss!877) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentBit!15296 thiss!877) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentBit!15296 thiss!877)) #b10000000000000000000000000000000)))))))

(declare-fun b!325192 () Bool)

(declare-fun array_inv!8664 (array!20981) Bool)

(assert (=> b!325192 (= e!234428 (array_inv!8664 (buf!8254 thiss!877)))))

(assert (= (and start!73142 res!266875) b!325191))

(assert (= start!73142 b!325192))

(declare-fun m!463195 () Bool)

(assert (=> start!73142 m!463195))

(declare-fun m!463197 () Bool)

(assert (=> start!73142 m!463197))

(declare-fun m!463199 () Bool)

(assert (=> b!325192 m!463199))

(push 1)

(assert (not start!73142))

(assert (not b!325192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

