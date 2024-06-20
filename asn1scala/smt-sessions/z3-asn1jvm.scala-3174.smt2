; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72964 () Bool)

(assert start!72964)

(declare-fun res!266587 () Bool)

(declare-fun e!234163 () Bool)

(assert (=> start!72964 (=> (not res!266587) (not e!234163))))

(declare-datatypes ((array!20920 0))(
  ( (array!20921 (arr!10181 (Array (_ BitVec 32) (_ BitVec 8))) (size!9089 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14340 0))(
  ( (BitStream!14341 (buf!8231 array!20920) (currentByte!15242 (_ BitVec 32)) (currentBit!15237 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14340)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72964 (= res!266587 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9089 (buf!8231 thiss!877))) ((_ sign_extend 32) (currentByte!15242 thiss!877)) ((_ sign_extend 32) (currentBit!15237 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72964 e!234163))

(declare-fun e!234165 () Bool)

(declare-fun inv!12 (BitStream!14340) Bool)

(assert (=> start!72964 (and (inv!12 thiss!877) e!234165)))

(declare-fun b!324834 () Bool)

(assert (=> b!324834 (= e!234163 (or (bvsgt ((_ sign_extend 32) (size!9089 (buf!8231 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15242 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15237 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!324835 () Bool)

(declare-fun array_inv!8641 (array!20920) Bool)

(assert (=> b!324835 (= e!234165 (array_inv!8641 (buf!8231 thiss!877)))))

(declare-fun b!324833 () Bool)

(declare-fun res!266586 () Bool)

(assert (=> b!324833 (=> (not res!266586) (not e!234163))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324833 (= res!266586 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9089 (buf!8231 thiss!877)) (currentByte!15242 thiss!877) (currentBit!15237 thiss!877))) (bitIndex!0 (size!9089 (buf!8231 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15242 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!324832 () Bool)

(declare-fun res!266585 () Bool)

(assert (=> b!324832 (=> (not res!266585) (not e!234163))))

(assert (=> b!324832 (= res!266585 (bvsge (currentBit!15237 thiss!877) #b00000000000000000000000000000111))))

(assert (= (and start!72964 res!266587) b!324832))

(assert (= (and b!324832 res!266585) b!324833))

(assert (= (and b!324833 res!266586) b!324834))

(assert (= start!72964 b!324835))

(declare-fun m!462887 () Bool)

(assert (=> start!72964 m!462887))

(declare-fun m!462889 () Bool)

(assert (=> start!72964 m!462889))

(declare-fun m!462891 () Bool)

(assert (=> b!324835 m!462891))

(declare-fun m!462893 () Bool)

(assert (=> b!324833 m!462893))

(declare-fun m!462895 () Bool)

(assert (=> b!324833 m!462895))

(check-sat (not start!72964) (not b!324833) (not b!324835))
(check-sat)
