; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21876 () Bool)

(assert start!21876)

(declare-fun b!110450 () Bool)

(declare-fun e!72442 () Bool)

(assert (=> b!110450 (= e!72442 true)))

(declare-datatypes ((Unit!6765 0))(
  ( (Unit!6766) )
))
(declare-fun lt!167140 () Unit!6765)

(declare-datatypes ((array!5056 0))(
  ( (array!5057 (arr!2893 (Array (_ BitVec 32) (_ BitVec 8))) (size!2300 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4074 0))(
  ( (BitStream!4075 (buf!2694 array!5056) (currentByte!5248 (_ BitVec 32)) (currentBit!5243 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4074)

(declare-fun lt!167143 () (_ BitVec 64))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4074 array!5056 (_ BitVec 64)) Unit!6765)

(assert (=> b!110450 (= lt!167140 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2694 thiss!1305) lt!167143))))

(declare-datatypes ((tuple2!9194 0))(
  ( (tuple2!9195 (_1!4854 BitStream!4074) (_2!4854 BitStream!4074)) )
))
(declare-fun lt!167144 () tuple2!9194)

(declare-fun reader!0 (BitStream!4074 BitStream!4074) tuple2!9194)

(assert (=> b!110450 (= lt!167144 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110451 () Bool)

(declare-fun e!72443 () Bool)

(declare-fun e!72441 () Bool)

(assert (=> b!110451 (= e!72443 e!72441)))

(declare-fun res!91180 () Bool)

(assert (=> b!110451 (=> (not res!91180) (not e!72441))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110451 (= res!91180 (validate_offset_bits!1 ((_ sign_extend 32) (size!2300 (buf!2694 thiss!1305))) ((_ sign_extend 32) (currentByte!5248 thiss!1305)) ((_ sign_extend 32) (currentBit!5243 thiss!1305)) lt!167143))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110451 (= lt!167143 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!91178 () Bool)

(assert (=> start!21876 (=> (not res!91178) (not e!72443))))

(assert (=> start!21876 (= res!91178 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21876 e!72443))

(assert (=> start!21876 true))

(declare-fun e!72440 () Bool)

(declare-fun inv!12 (BitStream!4074) Bool)

(assert (=> start!21876 (and (inv!12 thiss!1305) e!72440)))

(declare-fun b!110452 () Bool)

(declare-fun array_inv!2102 (array!5056) Bool)

(assert (=> b!110452 (= e!72440 (array_inv!2102 (buf!2694 thiss!1305)))))

(declare-fun b!110453 () Bool)

(declare-fun res!91176 () Bool)

(assert (=> b!110453 (=> (not res!91176) (not e!72441))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110453 (= res!91176 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110454 () Bool)

(declare-fun res!91177 () Bool)

(assert (=> b!110454 (=> (not res!91177) (not e!72441))))

(assert (=> b!110454 (= res!91177 (bvsge i!615 nBits!396))))

(declare-fun b!110455 () Bool)

(assert (=> b!110455 (= e!72441 (not e!72442))))

(declare-fun res!91179 () Bool)

(assert (=> b!110455 (=> res!91179 e!72442)))

(declare-fun lt!167141 () (_ BitVec 64))

(assert (=> b!110455 (= res!91179 (not (= lt!167141 (bvadd lt!167141 lt!167143))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110455 (= lt!167141 (bitIndex!0 (size!2300 (buf!2694 thiss!1305)) (currentByte!5248 thiss!1305) (currentBit!5243 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4074 BitStream!4074) Bool)

(assert (=> b!110455 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167142 () Unit!6765)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4074) Unit!6765)

(assert (=> b!110455 (= lt!167142 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (= (and start!21876 res!91178) b!110451))

(assert (= (and b!110451 res!91180) b!110453))

(assert (= (and b!110453 res!91176) b!110454))

(assert (= (and b!110454 res!91177) b!110455))

(assert (= (and b!110455 (not res!91179)) b!110450))

(assert (= start!21876 b!110452))

(declare-fun m!164015 () Bool)

(assert (=> b!110453 m!164015))

(declare-fun m!164017 () Bool)

(assert (=> start!21876 m!164017))

(declare-fun m!164019 () Bool)

(assert (=> b!110455 m!164019))

(declare-fun m!164021 () Bool)

(assert (=> b!110455 m!164021))

(declare-fun m!164023 () Bool)

(assert (=> b!110455 m!164023))

(declare-fun m!164025 () Bool)

(assert (=> b!110451 m!164025))

(declare-fun m!164027 () Bool)

(assert (=> b!110452 m!164027))

(declare-fun m!164029 () Bool)

(assert (=> b!110450 m!164029))

(declare-fun m!164031 () Bool)

(assert (=> b!110450 m!164031))

(check-sat (not b!110455) (not b!110453) (not start!21876) (not b!110450) (not b!110451) (not b!110452))
