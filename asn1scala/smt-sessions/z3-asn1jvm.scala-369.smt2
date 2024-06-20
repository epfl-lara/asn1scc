; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8544 () Bool)

(assert start!8544)

(declare-fun b!42618 () Bool)

(declare-fun e!28461 () Bool)

(assert (=> b!42618 (= e!28461 true)))

(declare-fun lt!64014 () Bool)

(declare-datatypes ((array!2188 0))(
  ( (array!2189 (arr!1488 (Array (_ BitVec 32) (_ BitVec 8))) (size!989 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1722 0))(
  ( (BitStream!1723 (buf!1320 array!2188) (currentByte!2784 (_ BitVec 32)) (currentBit!2779 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1722)

(declare-datatypes ((Unit!3032 0))(
  ( (Unit!3033) )
))
(declare-datatypes ((tuple2!4182 0))(
  ( (tuple2!4183 (_1!2184 Unit!3032) (_2!2184 BitStream!1722)) )
))
(declare-fun lt!64011 () tuple2!4182)

(declare-fun isPrefixOf!0 (BitStream!1722 BitStream!1722) Bool)

(assert (=> b!42618 (= lt!64014 (isPrefixOf!0 thiss!1379 (_2!2184 lt!64011)))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42618 (validate_offset_bits!1 ((_ sign_extend 32) (size!989 (buf!1320 (_2!2184 lt!64011)))) ((_ sign_extend 32) (currentByte!2784 (_2!2184 lt!64011))) ((_ sign_extend 32) (currentBit!2779 (_2!2184 lt!64011))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64015 () Unit!3032)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1722 BitStream!1722 (_ BitVec 64) (_ BitVec 64)) Unit!3032)

(assert (=> b!42618 (= lt!64015 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2184 lt!64011) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2188)

(declare-fun appendBitFromByte!0 (BitStream!1722 (_ BitVec 8) (_ BitVec 32)) tuple2!4182)

(assert (=> b!42618 (= lt!64011 (appendBitFromByte!0 thiss!1379 (select (arr!1488 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!42617 () Bool)

(declare-fun e!28459 () Bool)

(assert (=> b!42617 (= e!28459 (not e!28461))))

(declare-fun res!36256 () Bool)

(assert (=> b!42617 (=> res!36256 e!28461)))

(assert (=> b!42617 (= res!36256 (bvsge i!635 to!314))))

(assert (=> b!42617 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!64012 () Unit!3032)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1722) Unit!3032)

(assert (=> b!42617 (= lt!64012 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!64013 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42617 (= lt!64013 (bitIndex!0 (size!989 (buf!1320 thiss!1379)) (currentByte!2784 thiss!1379) (currentBit!2779 thiss!1379)))))

(declare-fun b!42616 () Bool)

(declare-fun res!36257 () Bool)

(assert (=> b!42616 (=> (not res!36257) (not e!28459))))

(assert (=> b!42616 (= res!36257 (validate_offset_bits!1 ((_ sign_extend 32) (size!989 (buf!1320 thiss!1379))) ((_ sign_extend 32) (currentByte!2784 thiss!1379)) ((_ sign_extend 32) (currentBit!2779 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!36258 () Bool)

(assert (=> start!8544 (=> (not res!36258) (not e!28459))))

(assert (=> start!8544 (= res!36258 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!989 srcBuffer!2))))))))

(assert (=> start!8544 e!28459))

(assert (=> start!8544 true))

(declare-fun array_inv!914 (array!2188) Bool)

(assert (=> start!8544 (array_inv!914 srcBuffer!2)))

(declare-fun e!28460 () Bool)

(declare-fun inv!12 (BitStream!1722) Bool)

(assert (=> start!8544 (and (inv!12 thiss!1379) e!28460)))

(declare-fun b!42619 () Bool)

(assert (=> b!42619 (= e!28460 (array_inv!914 (buf!1320 thiss!1379)))))

(assert (= (and start!8544 res!36258) b!42616))

(assert (= (and b!42616 res!36257) b!42617))

(assert (= (and b!42617 (not res!36256)) b!42618))

(assert (= start!8544 b!42619))

(declare-fun m!64603 () Bool)

(assert (=> start!8544 m!64603))

(declare-fun m!64605 () Bool)

(assert (=> start!8544 m!64605))

(declare-fun m!64607 () Bool)

(assert (=> b!42619 m!64607))

(declare-fun m!64609 () Bool)

(assert (=> b!42616 m!64609))

(declare-fun m!64611 () Bool)

(assert (=> b!42618 m!64611))

(declare-fun m!64613 () Bool)

(assert (=> b!42618 m!64613))

(declare-fun m!64615 () Bool)

(assert (=> b!42618 m!64615))

(assert (=> b!42618 m!64615))

(declare-fun m!64617 () Bool)

(assert (=> b!42618 m!64617))

(declare-fun m!64619 () Bool)

(assert (=> b!42618 m!64619))

(declare-fun m!64621 () Bool)

(assert (=> b!42617 m!64621))

(declare-fun m!64623 () Bool)

(assert (=> b!42617 m!64623))

(declare-fun m!64625 () Bool)

(assert (=> b!42617 m!64625))

(check-sat (not b!42618) (not b!42619) (not b!42616) (not start!8544) (not b!42617))
