; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39094 () Bool)

(assert start!39094)

(declare-fun b!175850 () Bool)

(declare-fun res!145618 () Bool)

(declare-fun e!122606 () Bool)

(assert (=> b!175850 (=> (not res!145618) (not e!122606))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175850 (= res!145618 (= i!590 nBits!348))))

(declare-fun b!175851 () Bool)

(declare-fun e!122604 () Bool)

(assert (=> b!175851 (= e!122604 e!122606)))

(declare-fun res!145617 () Bool)

(assert (=> b!175851 (=> (not res!145617) (not e!122606))))

(declare-datatypes ((array!9490 0))(
  ( (array!9491 (arr!5117 (Array (_ BitVec 32) (_ BitVec 8))) (size!4187 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7482 0))(
  ( (BitStream!7483 (buf!4630 array!9490) (currentByte!8765 (_ BitVec 32)) (currentBit!8760 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7482)

(declare-fun lt!271165 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175851 (= res!145617 (validate_offset_bits!1 ((_ sign_extend 32) (size!4187 (buf!4630 thiss!1204))) ((_ sign_extend 32) (currentByte!8765 thiss!1204)) ((_ sign_extend 32) (currentBit!8760 thiss!1204)) lt!271165))))

(assert (=> b!175851 (= lt!271165 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!175852 () Bool)

(declare-fun e!122608 () Bool)

(declare-fun lt!271163 () (_ BitVec 64))

(assert (=> b!175852 (= e!122608 (= (bvand lt!271163 #b1111111111111111111111111111111111111111111111111111111111111111) lt!271163))))

(declare-fun res!145621 () Bool)

(assert (=> start!39094 (=> (not res!145621) (not e!122604))))

(assert (=> start!39094 (= res!145621 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39094 e!122604))

(assert (=> start!39094 true))

(declare-fun e!122605 () Bool)

(declare-fun inv!12 (BitStream!7482) Bool)

(assert (=> start!39094 (and (inv!12 thiss!1204) e!122605)))

(declare-fun b!175853 () Bool)

(declare-fun array_inv!3928 (array!9490) Bool)

(assert (=> b!175853 (= e!122605 (array_inv!3928 (buf!4630 thiss!1204)))))

(declare-fun b!175854 () Bool)

(declare-fun e!122607 () Bool)

(assert (=> b!175854 (= e!122607 (not e!122608))))

(declare-fun res!145619 () Bool)

(assert (=> b!175854 (=> res!145619 e!122608)))

(declare-datatypes ((tuple2!15120 0))(
  ( (tuple2!15121 (_1!8205 BitStream!7482) (_2!8205 BitStream!7482)) )
))
(declare-fun lt!271164 () tuple2!15120)

(assert (=> b!175854 (= res!145619 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4187 (buf!4630 (_1!8205 lt!271164)))) ((_ sign_extend 32) (currentByte!8765 (_1!8205 lt!271164))) ((_ sign_extend 32) (currentBit!8760 (_1!8205 lt!271164))) lt!271165)))))

(declare-datatypes ((Unit!12688 0))(
  ( (Unit!12689) )
))
(declare-fun lt!271161 () Unit!12688)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7482 array!9490 (_ BitVec 64)) Unit!12688)

(assert (=> b!175854 (= lt!271161 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4630 thiss!1204) lt!271165))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175854 (= lt!271163 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun reader!0 (BitStream!7482 BitStream!7482) tuple2!15120)

(assert (=> b!175854 (= lt!271164 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7482 BitStream!7482) Bool)

(assert (=> b!175854 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!271162 () Unit!12688)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7482) Unit!12688)

(assert (=> b!175854 (= lt!271162 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175855 () Bool)

(assert (=> b!175855 (= e!122606 e!122607)))

(declare-fun res!145620 () Bool)

(assert (=> b!175855 (=> (not res!145620) (not e!122607))))

(declare-fun lt!271166 () (_ BitVec 64))

(assert (=> b!175855 (= res!145620 (= lt!271166 (bvsub (bvadd lt!271166 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175855 (= lt!271166 (bitIndex!0 (size!4187 (buf!4630 thiss!1204)) (currentByte!8765 thiss!1204) (currentBit!8760 thiss!1204)))))

(declare-fun b!175856 () Bool)

(declare-fun res!145623 () Bool)

(assert (=> b!175856 (=> res!145623 e!122608)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175856 (= res!145623 (not (= (bvand lt!271163 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175857 () Bool)

(declare-fun res!145622 () Bool)

(assert (=> b!175857 (=> (not res!145622) (not e!122606))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175857 (= res!145622 (invariant!0 (currentBit!8760 thiss!1204) (currentByte!8765 thiss!1204) (size!4187 (buf!4630 thiss!1204))))))

(assert (= (and start!39094 res!145621) b!175851))

(assert (= (and b!175851 res!145617) b!175857))

(assert (= (and b!175857 res!145622) b!175850))

(assert (= (and b!175850 res!145618) b!175855))

(assert (= (and b!175855 res!145620) b!175854))

(assert (= (and b!175854 (not res!145619)) b!175856))

(assert (= (and b!175856 (not res!145623)) b!175852))

(assert (= start!39094 b!175853))

(declare-fun m!276037 () Bool)

(assert (=> b!175857 m!276037))

(declare-fun m!276039 () Bool)

(assert (=> b!175854 m!276039))

(declare-fun m!276041 () Bool)

(assert (=> b!175854 m!276041))

(declare-fun m!276043 () Bool)

(assert (=> b!175854 m!276043))

(declare-fun m!276045 () Bool)

(assert (=> b!175854 m!276045))

(declare-fun m!276047 () Bool)

(assert (=> b!175854 m!276047))

(declare-fun m!276049 () Bool)

(assert (=> b!175854 m!276049))

(declare-fun m!276051 () Bool)

(assert (=> b!175856 m!276051))

(declare-fun m!276053 () Bool)

(assert (=> b!175855 m!276053))

(declare-fun m!276055 () Bool)

(assert (=> start!39094 m!276055))

(declare-fun m!276057 () Bool)

(assert (=> b!175853 m!276057))

(declare-fun m!276059 () Bool)

(assert (=> b!175851 m!276059))

(check-sat (not b!175854) (not b!175853) (not b!175855) (not b!175851) (not b!175856) (not start!39094) (not b!175857))
