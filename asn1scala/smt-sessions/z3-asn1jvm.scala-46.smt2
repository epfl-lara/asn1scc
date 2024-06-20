; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!964 () Bool)

(assert start!964)

(declare-fun b!3618 () Bool)

(declare-fun e!2393 () Bool)

(declare-fun e!2396 () Bool)

(assert (=> b!3618 (= e!2393 e!2396)))

(declare-fun res!5143 () Bool)

(assert (=> b!3618 (=> (not res!5143) (not e!2396))))

(declare-datatypes ((array!296 0))(
  ( (array!297 (arr!509 (Array (_ BitVec 32) (_ BitVec 8))) (size!122 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!222 0))(
  ( (BitStream!223 (buf!440 array!296) (currentByte!1413 (_ BitVec 32)) (currentBit!1408 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!270 0))(
  ( (Unit!271) )
))
(declare-datatypes ((tuple2!364 0))(
  ( (tuple2!365 (_1!195 Unit!270) (_2!195 BitStream!222)) )
))
(declare-fun lt!4309 () tuple2!364)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3618 (= res!5143 (invariant!0 (currentBit!1408 (_2!195 lt!4309)) (currentByte!1413 (_2!195 lt!4309)) (size!122 (buf!440 (_2!195 lt!4309)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!296)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!222)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!222 array!296 (_ BitVec 64) (_ BitVec 64)) tuple2!364)

(assert (=> b!3618 (= lt!4309 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3619 () Bool)

(declare-fun res!5146 () Bool)

(assert (=> b!3619 (=> (not res!5146) (not e!2393))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3619 (= res!5146 (validate_offset_bits!1 ((_ sign_extend 32) (size!122 (buf!440 thiss!1486))) ((_ sign_extend 32) (currentByte!1413 thiss!1486)) ((_ sign_extend 32) (currentBit!1408 thiss!1486)) nBits!460))))

(declare-fun b!3620 () Bool)

(declare-fun res!5142 () Bool)

(assert (=> b!3620 (=> (not res!5142) (not e!2396))))

(declare-fun isPrefixOf!0 (BitStream!222 BitStream!222) Bool)

(assert (=> b!3620 (= res!5142 (isPrefixOf!0 thiss!1486 (_2!195 lt!4309)))))

(declare-fun b!3621 () Bool)

(declare-fun res!5145 () Bool)

(assert (=> b!3621 (=> (not res!5145) (not e!2396))))

(assert (=> b!3621 (= res!5145 (= (size!122 (buf!440 thiss!1486)) (size!122 (buf!440 (_2!195 lt!4309)))))))

(declare-fun b!3623 () Bool)

(declare-fun e!2395 () Bool)

(declare-fun array_inv!117 (array!296) Bool)

(assert (=> b!3623 (= e!2395 (array_inv!117 (buf!440 thiss!1486)))))

(declare-fun b!3624 () Bool)

(declare-fun res!5144 () Bool)

(assert (=> b!3624 (=> (not res!5144) (not e!2396))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3624 (= res!5144 (= (bitIndex!0 (size!122 (buf!440 (_2!195 lt!4309))) (currentByte!1413 (_2!195 lt!4309)) (currentBit!1408 (_2!195 lt!4309))) (bvadd (bitIndex!0 (size!122 (buf!440 thiss!1486)) (currentByte!1413 thiss!1486) (currentBit!1408 thiss!1486)) nBits!460)))))

(declare-fun res!5141 () Bool)

(assert (=> start!964 (=> (not res!5141) (not e!2393))))

(assert (=> start!964 (= res!5141 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!122 srcBuffer!6))))))))

(assert (=> start!964 e!2393))

(assert (=> start!964 true))

(assert (=> start!964 (array_inv!117 srcBuffer!6)))

(declare-fun inv!12 (BitStream!222) Bool)

(assert (=> start!964 (and (inv!12 thiss!1486) e!2395)))

(declare-fun b!3622 () Bool)

(assert (=> b!3622 (= e!2396 (not true))))

(declare-datatypes ((tuple2!366 0))(
  ( (tuple2!367 (_1!196 BitStream!222) (_2!196 BitStream!222)) )
))
(declare-fun lt!4312 () tuple2!366)

(declare-datatypes ((List!22 0))(
  ( (Nil!19) (Cons!18 (h!137 Bool) (t!772 List!22)) )
))
(declare-fun lt!4311 () List!22)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!222 BitStream!222 (_ BitVec 64)) List!22)

(assert (=> b!3622 (= lt!4311 (bitStreamReadBitsIntoList!0 (_2!195 lt!4309) (_1!196 lt!4312) nBits!460))))

(declare-datatypes ((tuple2!368 0))(
  ( (tuple2!369 (_1!197 array!296) (_2!197 BitStream!222)) )
))
(declare-fun lt!4310 () tuple2!368)

(declare-fun readBits!0 (BitStream!222 (_ BitVec 64)) tuple2!368)

(assert (=> b!3622 (= lt!4310 (readBits!0 (_1!196 lt!4312) nBits!460))))

(assert (=> b!3622 (validate_offset_bits!1 ((_ sign_extend 32) (size!122 (buf!440 (_2!195 lt!4309)))) ((_ sign_extend 32) (currentByte!1413 thiss!1486)) ((_ sign_extend 32) (currentBit!1408 thiss!1486)) nBits!460)))

(declare-fun lt!4313 () Unit!270)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!222 array!296 (_ BitVec 64)) Unit!270)

(assert (=> b!3622 (= lt!4313 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!440 (_2!195 lt!4309)) nBits!460))))

(declare-fun reader!0 (BitStream!222 BitStream!222) tuple2!366)

(assert (=> b!3622 (= lt!4312 (reader!0 thiss!1486 (_2!195 lt!4309)))))

(assert (= (and start!964 res!5141) b!3619))

(assert (= (and b!3619 res!5146) b!3618))

(assert (= (and b!3618 res!5143) b!3621))

(assert (= (and b!3621 res!5145) b!3624))

(assert (= (and b!3624 res!5144) b!3620))

(assert (= (and b!3620 res!5142) b!3622))

(assert (= start!964 b!3623))

(declare-fun m!4045 () Bool)

(assert (=> start!964 m!4045))

(declare-fun m!4047 () Bool)

(assert (=> start!964 m!4047))

(declare-fun m!4049 () Bool)

(assert (=> b!3624 m!4049))

(declare-fun m!4051 () Bool)

(assert (=> b!3624 m!4051))

(declare-fun m!4053 () Bool)

(assert (=> b!3623 m!4053))

(declare-fun m!4055 () Bool)

(assert (=> b!3620 m!4055))

(declare-fun m!4057 () Bool)

(assert (=> b!3618 m!4057))

(declare-fun m!4059 () Bool)

(assert (=> b!3618 m!4059))

(declare-fun m!4061 () Bool)

(assert (=> b!3619 m!4061))

(declare-fun m!4063 () Bool)

(assert (=> b!3622 m!4063))

(declare-fun m!4065 () Bool)

(assert (=> b!3622 m!4065))

(declare-fun m!4067 () Bool)

(assert (=> b!3622 m!4067))

(declare-fun m!4069 () Bool)

(assert (=> b!3622 m!4069))

(declare-fun m!4071 () Bool)

(assert (=> b!3622 m!4071))

(check-sat (not start!964) (not b!3618) (not b!3624) (not b!3620) (not b!3619) (not b!3622) (not b!3623))
