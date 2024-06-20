; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73144 () Bool)

(assert start!73144)

(declare-fun res!266878 () Bool)

(declare-fun e!234436 () Bool)

(assert (=> start!73144 (=> (not res!266878) (not e!234436))))

(declare-datatypes ((array!20983 0))(
  ( (array!20984 (arr!10205 (Array (_ BitVec 32) (_ BitVec 8))) (size!9113 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14388 0))(
  ( (BitStream!14389 (buf!8255 array!20983) (currentByte!15302 (_ BitVec 32)) (currentBit!15297 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14388)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73144 (= res!266878 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9113 (buf!8255 thiss!877))) ((_ sign_extend 32) (currentByte!15302 thiss!877)) ((_ sign_extend 32) (currentBit!15297 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73144 e!234436))

(declare-fun e!234437 () Bool)

(declare-fun inv!12 (BitStream!14388) Bool)

(assert (=> start!73144 (and (inv!12 thiss!877) e!234437)))

(declare-fun b!325197 () Bool)

(assert (=> b!325197 (= e!234436 (and (bvslt (currentBit!15297 thiss!877) #b00000000000000000000000000000111) (= (bvand (currentBit!15297 thiss!877) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentBit!15297 thiss!877) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentBit!15297 thiss!877)) #b10000000000000000000000000000000)))))))

(declare-fun b!325198 () Bool)

(declare-fun array_inv!8665 (array!20983) Bool)

(assert (=> b!325198 (= e!234437 (array_inv!8665 (buf!8255 thiss!877)))))

(assert (= (and start!73144 res!266878) b!325197))

(assert (= start!73144 b!325198))

(declare-fun m!463201 () Bool)

(assert (=> start!73144 m!463201))

(declare-fun m!463203 () Bool)

(assert (=> start!73144 m!463203))

(declare-fun m!463205 () Bool)

(assert (=> b!325198 m!463205))

(check-sat (not start!73144) (not b!325198))
(check-sat)
