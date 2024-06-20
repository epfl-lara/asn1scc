; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39096 () Bool)

(assert start!39096)

(declare-fun b!175874 () Bool)

(declare-fun e!122625 () Bool)

(declare-fun e!122626 () Bool)

(assert (=> b!175874 (= e!122625 (not e!122626))))

(declare-fun res!145638 () Bool)

(assert (=> b!175874 (=> res!145638 e!122626)))

(declare-datatypes ((array!9492 0))(
  ( (array!9493 (arr!5118 (Array (_ BitVec 32) (_ BitVec 8))) (size!4188 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7484 0))(
  ( (BitStream!7485 (buf!4631 array!9492) (currentByte!8766 (_ BitVec 32)) (currentBit!8761 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15122 0))(
  ( (tuple2!15123 (_1!8206 BitStream!7484) (_2!8206 BitStream!7484)) )
))
(declare-fun lt!271180 () tuple2!15122)

(declare-fun lt!271181 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175874 (= res!145638 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4188 (buf!4631 (_1!8206 lt!271180)))) ((_ sign_extend 32) (currentByte!8766 (_1!8206 lt!271180))) ((_ sign_extend 32) (currentBit!8761 (_1!8206 lt!271180))) lt!271181)))))

(declare-datatypes ((Unit!12690 0))(
  ( (Unit!12691) )
))
(declare-fun lt!271182 () Unit!12690)

(declare-fun thiss!1204 () BitStream!7484)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7484 array!9492 (_ BitVec 64)) Unit!12690)

(assert (=> b!175874 (= lt!271182 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4631 thiss!1204) lt!271181))))

(declare-fun lt!271183 () (_ BitVec 64))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175874 (= lt!271183 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun reader!0 (BitStream!7484 BitStream!7484) tuple2!15122)

(assert (=> b!175874 (= lt!271180 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7484 BitStream!7484) Bool)

(assert (=> b!175874 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!271184 () Unit!12690)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7484) Unit!12690)

(assert (=> b!175874 (= lt!271184 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175875 () Bool)

(declare-fun res!145642 () Bool)

(declare-fun e!122621 () Bool)

(assert (=> b!175875 (=> (not res!145642) (not e!122621))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175875 (= res!145642 (invariant!0 (currentBit!8761 thiss!1204) (currentByte!8766 thiss!1204) (size!4188 (buf!4631 thiss!1204))))))

(declare-fun b!175876 () Bool)

(declare-fun e!122623 () Bool)

(assert (=> b!175876 (= e!122623 e!122621)))

(declare-fun res!145639 () Bool)

(assert (=> b!175876 (=> (not res!145639) (not e!122621))))

(assert (=> b!175876 (= res!145639 (validate_offset_bits!1 ((_ sign_extend 32) (size!4188 (buf!4631 thiss!1204))) ((_ sign_extend 32) (currentByte!8766 thiss!1204)) ((_ sign_extend 32) (currentBit!8761 thiss!1204)) lt!271181))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175876 (= lt!271181 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!175877 () Bool)

(declare-fun res!145641 () Bool)

(assert (=> b!175877 (=> (not res!145641) (not e!122621))))

(assert (=> b!175877 (= res!145641 (= i!590 nBits!348))))

(declare-fun res!145644 () Bool)

(assert (=> start!39096 (=> (not res!145644) (not e!122623))))

(assert (=> start!39096 (= res!145644 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39096 e!122623))

(assert (=> start!39096 true))

(declare-fun e!122622 () Bool)

(declare-fun inv!12 (BitStream!7484) Bool)

(assert (=> start!39096 (and (inv!12 thiss!1204) e!122622)))

(declare-fun b!175878 () Bool)

(declare-fun array_inv!3929 (array!9492) Bool)

(assert (=> b!175878 (= e!122622 (array_inv!3929 (buf!4631 thiss!1204)))))

(declare-fun b!175879 () Bool)

(declare-fun res!145640 () Bool)

(assert (=> b!175879 (=> res!145640 e!122626)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175879 (= res!145640 (not (= (bvand lt!271183 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175880 () Bool)

(assert (=> b!175880 (= e!122626 (= (bvand lt!271183 #b1111111111111111111111111111111111111111111111111111111111111111) lt!271183))))

(declare-fun b!175881 () Bool)

(assert (=> b!175881 (= e!122621 e!122625)))

(declare-fun res!145643 () Bool)

(assert (=> b!175881 (=> (not res!145643) (not e!122625))))

(declare-fun lt!271179 () (_ BitVec 64))

(assert (=> b!175881 (= res!145643 (= lt!271179 (bvsub (bvadd lt!271179 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175881 (= lt!271179 (bitIndex!0 (size!4188 (buf!4631 thiss!1204)) (currentByte!8766 thiss!1204) (currentBit!8761 thiss!1204)))))

(assert (= (and start!39096 res!145644) b!175876))

(assert (= (and b!175876 res!145639) b!175875))

(assert (= (and b!175875 res!145642) b!175877))

(assert (= (and b!175877 res!145641) b!175881))

(assert (= (and b!175881 res!145643) b!175874))

(assert (= (and b!175874 (not res!145638)) b!175879))

(assert (= (and b!175879 (not res!145640)) b!175880))

(assert (= start!39096 b!175878))

(declare-fun m!276061 () Bool)

(assert (=> b!175875 m!276061))

(declare-fun m!276063 () Bool)

(assert (=> start!39096 m!276063))

(declare-fun m!276065 () Bool)

(assert (=> b!175881 m!276065))

(declare-fun m!276067 () Bool)

(assert (=> b!175879 m!276067))

(declare-fun m!276069 () Bool)

(assert (=> b!175874 m!276069))

(declare-fun m!276071 () Bool)

(assert (=> b!175874 m!276071))

(declare-fun m!276073 () Bool)

(assert (=> b!175874 m!276073))

(declare-fun m!276075 () Bool)

(assert (=> b!175874 m!276075))

(declare-fun m!276077 () Bool)

(assert (=> b!175874 m!276077))

(declare-fun m!276079 () Bool)

(assert (=> b!175874 m!276079))

(declare-fun m!276081 () Bool)

(assert (=> b!175878 m!276081))

(declare-fun m!276083 () Bool)

(assert (=> b!175876 m!276083))

(push 1)

(assert (not b!175881))

(assert (not b!175874))

(assert (not b!175875))

(assert (not b!175879))

(assert (not b!175878))

(assert (not b!175876))

(assert (not start!39096))

(check-sat)

(pop 1)

