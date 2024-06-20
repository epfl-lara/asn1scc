; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4764 () Bool)

(assert start!4764)

(declare-fun res!16481 () Bool)

(declare-fun e!12249 () Bool)

(assert (=> start!4764 (=> (not res!16481) (not e!12249))))

(declare-datatypes ((array!1327 0))(
  ( (array!1328 (arr!1001 (Array (_ BitVec 32) (_ BitVec 8))) (size!560 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1327)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4764 (= res!16481 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!560 srcBuffer!2))))))))

(assert (=> start!4764 e!12249))

(assert (=> start!4764 true))

(declare-fun array_inv!530 (array!1327) Bool)

(assert (=> start!4764 (array_inv!530 srcBuffer!2)))

(declare-datatypes ((BitStream!954 0))(
  ( (BitStream!955 (buf!860 array!1327) (currentByte!2131 (_ BitVec 32)) (currentBit!2126 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!954)

(declare-fun e!12252 () Bool)

(declare-fun inv!12 (BitStream!954) Bool)

(assert (=> start!4764 (and (inv!12 thiss!1379) e!12252)))

(declare-fun b!18831 () Bool)

(declare-fun res!16480 () Bool)

(assert (=> b!18831 (=> (not res!16480) (not e!12249))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18831 (= res!16480 (validate_offset_bits!1 ((_ sign_extend 32) (size!560 (buf!860 thiss!1379))) ((_ sign_extend 32) (currentByte!2131 thiss!1379)) ((_ sign_extend 32) (currentBit!2126 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18832 () Bool)

(assert (=> b!18832 (= e!12249 (not (or (bvsge i!635 to!314) (let ((bdg!598 ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and (bvsge bdg!598 #b00000000000000000000000000000000) (bvslt bdg!598 #b00000000000000000000000000001000))))))))

(declare-fun isPrefixOf!0 (BitStream!954 BitStream!954) Bool)

(assert (=> b!18832 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1664 0))(
  ( (Unit!1665) )
))
(declare-fun lt!26926 () Unit!1664)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!954) Unit!1664)

(assert (=> b!18832 (= lt!26926 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!26925 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18832 (= lt!26925 (bitIndex!0 (size!560 (buf!860 thiss!1379)) (currentByte!2131 thiss!1379) (currentBit!2126 thiss!1379)))))

(declare-fun b!18833 () Bool)

(assert (=> b!18833 (= e!12252 (array_inv!530 (buf!860 thiss!1379)))))

(assert (= (and start!4764 res!16481) b!18831))

(assert (= (and b!18831 res!16480) b!18832))

(assert (= start!4764 b!18833))

(declare-fun m!25295 () Bool)

(assert (=> start!4764 m!25295))

(declare-fun m!25297 () Bool)

(assert (=> start!4764 m!25297))

(declare-fun m!25299 () Bool)

(assert (=> b!18831 m!25299))

(declare-fun m!25301 () Bool)

(assert (=> b!18832 m!25301))

(declare-fun m!25303 () Bool)

(assert (=> b!18832 m!25303))

(declare-fun m!25305 () Bool)

(assert (=> b!18832 m!25305))

(declare-fun m!25307 () Bool)

(assert (=> b!18833 m!25307))

(check-sat (not b!18831) (not b!18833) (not b!18832) (not start!4764))
(check-sat)
