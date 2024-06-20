; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17670 () Bool)

(assert start!17670)

(declare-fun b!85165 () Bool)

(declare-fun res!69881 () Bool)

(declare-fun e!56760 () Bool)

(assert (=> b!85165 (=> (not res!69881) (not e!56760))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85165 (= res!69881 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun res!69882 () Bool)

(assert (=> start!17670 (=> (not res!69882) (not e!56760))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17670 (= res!69882 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17670 e!56760))

(assert (=> start!17670 true))

(declare-datatypes ((array!4046 0))(
  ( (array!4047 (arr!2464 (Array (_ BitVec 32) (_ BitVec 8))) (size!1827 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3216 0))(
  ( (BitStream!3217 (buf!2217 array!4046) (currentByte!4414 (_ BitVec 32)) (currentBit!4409 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3216)

(declare-fun e!56759 () Bool)

(declare-fun inv!12 (BitStream!3216) Bool)

(assert (=> start!17670 (and (inv!12 thiss!1151) e!56759)))

(declare-fun thiss!1152 () BitStream!3216)

(declare-fun e!56756 () Bool)

(assert (=> start!17670 (and (inv!12 thiss!1152) e!56756)))

(declare-fun b!85166 () Bool)

(declare-fun array_inv!1673 (array!4046) Bool)

(assert (=> b!85166 (= e!56759 (array_inv!1673 (buf!2217 thiss!1151)))))

(declare-fun b!85167 () Bool)

(assert (=> b!85167 (= e!56756 (array_inv!1673 (buf!2217 thiss!1152)))))

(declare-fun b!85168 () Bool)

(declare-fun res!69878 () Bool)

(assert (=> b!85168 (=> (not res!69878) (not e!56760))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85168 (= res!69878 (invariant!0 (currentBit!4409 thiss!1151) (currentByte!4414 thiss!1151) (size!1827 (buf!2217 thiss!1151))))))

(declare-fun b!85169 () Bool)

(declare-fun res!69879 () Bool)

(assert (=> b!85169 (=> (not res!69879) (not e!56760))))

(assert (=> b!85169 (= res!69879 (and (bvsle ((_ sign_extend 32) (size!1827 (buf!2217 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4414 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4409 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1827 (buf!2217 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4414 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4409 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85170 () Bool)

(assert (=> b!85170 (= e!56760 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4409 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4414 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (size!1827 (buf!2217 thiss!1152)))))))))

(declare-fun b!85171 () Bool)

(declare-fun res!69880 () Bool)

(assert (=> b!85171 (=> (not res!69880) (not e!56760))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85171 (= res!69880 (validate_offset_bits!1 ((_ sign_extend 32) (size!1827 (buf!2217 thiss!1151))) ((_ sign_extend 32) (currentByte!4414 thiss!1151)) ((_ sign_extend 32) (currentBit!4409 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85172 () Bool)

(declare-fun res!69877 () Bool)

(assert (=> b!85172 (=> (not res!69877) (not e!56760))))

(assert (=> b!85172 (= res!69877 (invariant!0 (currentBit!4409 thiss!1152) (currentByte!4414 thiss!1152) (size!1827 (buf!2217 thiss!1152))))))

(declare-fun b!85173 () Bool)

(declare-fun res!69883 () Bool)

(assert (=> b!85173 (=> (not res!69883) (not e!56760))))

(assert (=> b!85173 (= res!69883 (and (bvsle i!576 nBits!336) (= (size!1827 (buf!2217 thiss!1152)) (size!1827 (buf!2217 thiss!1151)))))))

(declare-fun b!85174 () Bool)

(declare-fun res!69876 () Bool)

(assert (=> b!85174 (=> (not res!69876) (not e!56760))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85174 (= res!69876 (= (bitIndex!0 (size!1827 (buf!2217 thiss!1152)) (currentByte!4414 thiss!1152) (currentBit!4409 thiss!1152)) (bvadd (bitIndex!0 (size!1827 (buf!2217 thiss!1151)) (currentByte!4414 thiss!1151) (currentBit!4409 thiss!1151)) ((_ sign_extend 32) i!576))))))

(assert (= (and start!17670 res!69882) b!85171))

(assert (= (and b!85171 res!69880) b!85168))

(assert (= (and b!85168 res!69878) b!85165))

(assert (= (and b!85165 res!69881) b!85172))

(assert (= (and b!85172 res!69877) b!85173))

(assert (= (and b!85173 res!69883) b!85174))

(assert (= (and b!85174 res!69876) b!85169))

(assert (= (and b!85169 res!69879) b!85170))

(assert (= start!17670 b!85166))

(assert (= start!17670 b!85167))

(declare-fun m!131425 () Bool)

(assert (=> start!17670 m!131425))

(declare-fun m!131427 () Bool)

(assert (=> start!17670 m!131427))

(declare-fun m!131429 () Bool)

(assert (=> b!85170 m!131429))

(declare-fun m!131431 () Bool)

(assert (=> b!85166 m!131431))

(declare-fun m!131433 () Bool)

(assert (=> b!85172 m!131433))

(declare-fun m!131435 () Bool)

(assert (=> b!85171 m!131435))

(declare-fun m!131437 () Bool)

(assert (=> b!85174 m!131437))

(declare-fun m!131439 () Bool)

(assert (=> b!85174 m!131439))

(declare-fun m!131441 () Bool)

(assert (=> b!85168 m!131441))

(declare-fun m!131443 () Bool)

(assert (=> b!85167 m!131443))

(check-sat (not b!85172) (not b!85170) (not b!85171) (not start!17670) (not b!85167) (not b!85174) (not b!85168) (not b!85166))
