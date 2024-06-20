; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17682 () Bool)

(assert start!17682)

(declare-fun b!85349 () Bool)

(declare-fun e!56851 () Bool)

(assert (=> b!85349 (= e!56851 false)))

(declare-fun lt!134634 () Bool)

(declare-fun e!56856 () Bool)

(assert (=> b!85349 (= lt!134634 e!56856)))

(declare-fun res!70029 () Bool)

(assert (=> b!85349 (=> res!70029 e!56856)))

(declare-datatypes ((array!4058 0))(
  ( (array!4059 (arr!2470 (Array (_ BitVec 32) (_ BitVec 8))) (size!1833 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3228 0))(
  ( (BitStream!3229 (buf!2223 array!4058) (currentByte!4420 (_ BitVec 32)) (currentBit!4415 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3228)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85349 (= res!70029 (not (invariant!0 (currentBit!4415 thiss!1151) (currentByte!4420 thiss!1151) (size!1833 (buf!2223 thiss!1151)))))))

(declare-fun b!85350 () Bool)

(assert (=> b!85350 (= e!56856 true)))

(declare-fun b!85352 () Bool)

(declare-fun res!70028 () Bool)

(assert (=> b!85352 (=> res!70028 e!56856)))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85352 (= res!70028 (bvslt i!576 #b00000000000000000000000000000000))))

(declare-fun b!85353 () Bool)

(declare-fun e!56855 () Bool)

(declare-fun array_inv!1679 (array!4058) Bool)

(assert (=> b!85353 (= e!56855 (array_inv!1679 (buf!2223 thiss!1151)))))

(declare-fun b!85354 () Bool)

(declare-fun res!70026 () Bool)

(assert (=> b!85354 (=> res!70026 e!56856)))

(declare-fun thiss!1152 () BitStream!3228)

(assert (=> b!85354 (= res!70026 (not (invariant!0 (currentBit!4415 thiss!1152) (currentByte!4420 thiss!1152) (size!1833 (buf!2223 thiss!1152)))))))

(declare-fun b!85351 () Bool)

(declare-fun e!56854 () Bool)

(assert (=> b!85351 (= e!56854 (array_inv!1679 (buf!2223 thiss!1152)))))

(declare-fun res!70025 () Bool)

(assert (=> start!17682 (=> (not res!70025) (not e!56851))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17682 (= res!70025 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17682 e!56851))

(assert (=> start!17682 true))

(declare-fun inv!12 (BitStream!3228) Bool)

(assert (=> start!17682 (and (inv!12 thiss!1151) e!56855)))

(assert (=> start!17682 (and (inv!12 thiss!1152) e!56854)))

(declare-fun b!85355 () Bool)

(declare-fun res!70027 () Bool)

(assert (=> b!85355 (=> res!70027 e!56856)))

(assert (=> b!85355 (= res!70027 (or (bvsgt i!576 nBits!336) (not (= (size!1833 (buf!2223 thiss!1152)) (size!1833 (buf!2223 thiss!1151))))))))

(declare-fun b!85356 () Bool)

(declare-fun res!70024 () Bool)

(assert (=> b!85356 (=> (not res!70024) (not e!56851))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85356 (= res!70024 (validate_offset_bits!1 ((_ sign_extend 32) (size!1833 (buf!2223 thiss!1151))) ((_ sign_extend 32) (currentByte!4420 thiss!1151)) ((_ sign_extend 32) (currentBit!4415 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85357 () Bool)

(declare-fun res!70030 () Bool)

(assert (=> b!85357 (=> res!70030 e!56856)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85357 (= res!70030 (not (= (bitIndex!0 (size!1833 (buf!2223 thiss!1152)) (currentByte!4420 thiss!1152) (currentBit!4415 thiss!1152)) (bvadd (bitIndex!0 (size!1833 (buf!2223 thiss!1151)) (currentByte!4420 thiss!1151) (currentBit!4415 thiss!1151)) ((_ sign_extend 32) i!576)))))))

(assert (= (and start!17682 res!70025) b!85356))

(assert (= (and b!85356 res!70024) b!85349))

(assert (= (and b!85349 (not res!70029)) b!85352))

(assert (= (and b!85352 (not res!70028)) b!85354))

(assert (= (and b!85354 (not res!70026)) b!85355))

(assert (= (and b!85355 (not res!70027)) b!85357))

(assert (= (and b!85357 (not res!70030)) b!85350))

(assert (= start!17682 b!85353))

(assert (= start!17682 b!85351))

(declare-fun m!131543 () Bool)

(assert (=> b!85357 m!131543))

(declare-fun m!131545 () Bool)

(assert (=> b!85357 m!131545))

(declare-fun m!131547 () Bool)

(assert (=> b!85356 m!131547))

(declare-fun m!131549 () Bool)

(assert (=> b!85351 m!131549))

(declare-fun m!131551 () Bool)

(assert (=> b!85353 m!131551))

(declare-fun m!131553 () Bool)

(assert (=> start!17682 m!131553))

(declare-fun m!131555 () Bool)

(assert (=> start!17682 m!131555))

(declare-fun m!131557 () Bool)

(assert (=> b!85354 m!131557))

(declare-fun m!131559 () Bool)

(assert (=> b!85349 m!131559))

(check-sat (not b!85353) (not b!85351) (not start!17682) (not b!85356) (not b!85349) (not b!85354) (not b!85357))
