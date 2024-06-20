; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3304 () Bool)

(assert start!3304)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((array!851 0))(
  ( (array!852 (arr!791 (Array (_ BitVec 32) (_ BitVec 8))) (size!362 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!684 0))(
  ( (BitStream!685 (buf!713 array!851) (currentByte!1859 (_ BitVec 32)) (currentBit!1854 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!684)

(assert (=> start!3304 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!362 (buf!713 thiss!1073))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1859 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1854 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!3304 true))

(declare-fun e!9146 () Bool)

(declare-fun inv!12 (BitStream!684) Bool)

(assert (=> start!3304 (and (inv!12 thiss!1073) e!9146)))

(declare-fun b!14648 () Bool)

(declare-fun array_inv!351 (array!851) Bool)

(assert (=> b!14648 (= e!9146 (array_inv!351 (buf!713 thiss!1073)))))

(assert (= start!3304 b!14648))

(declare-fun m!21081 () Bool)

(assert (=> start!3304 m!21081))

(declare-fun m!21083 () Bool)

(assert (=> b!14648 m!21083))

(check-sat (not start!3304) (not b!14648))
(check-sat)
