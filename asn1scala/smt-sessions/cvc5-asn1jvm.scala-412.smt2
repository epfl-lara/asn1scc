; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10500 () Bool)

(assert start!10500)

(declare-fun b!52663 () Bool)

(declare-fun res!43972 () Bool)

(declare-fun e!35038 () Bool)

(assert (=> b!52663 (=> (not res!43972) (not e!35038))))

(declare-datatypes ((array!2482 0))(
  ( (array!2483 (arr!1670 (Array (_ BitVec 32) (_ BitVec 8))) (size!1134 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1960 0))(
  ( (BitStream!1961 (buf!1484 array!2482) (currentByte!3033 (_ BitVec 32)) (currentBit!3028 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1960)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52663 (= res!43972 (validate_offset_bits!1 ((_ sign_extend 32) (size!1134 (buf!1484 thiss!1379))) ((_ sign_extend 32) (currentByte!3033 thiss!1379)) ((_ sign_extend 32) (currentBit!3028 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52666 () Bool)

(declare-fun e!35042 () Bool)

(declare-fun array_inv!1039 (array!2482) Bool)

(assert (=> b!52666 (= e!35042 (array_inv!1039 (buf!1484 thiss!1379)))))

(declare-fun res!43973 () Bool)

(assert (=> start!10500 (=> (not res!43973) (not e!35038))))

(declare-fun srcBuffer!2 () array!2482)

(assert (=> start!10500 (= res!43973 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1134 srcBuffer!2))))))))

(assert (=> start!10500 e!35038))

(assert (=> start!10500 true))

(assert (=> start!10500 (array_inv!1039 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1960) Bool)

(assert (=> start!10500 (and (inv!12 thiss!1379) e!35042)))

(declare-fun b!52665 () Bool)

(declare-fun e!35041 () Bool)

(assert (=> b!52665 (= e!35041 true)))

(declare-datatypes ((Unit!3672 0))(
  ( (Unit!3673) )
))
(declare-datatypes ((tuple2!4786 0))(
  ( (tuple2!4787 (_1!2498 Unit!3672) (_2!2498 BitStream!1960)) )
))
(declare-fun lt!81669 () tuple2!4786)

(declare-fun appendBitFromByte!0 (BitStream!1960 (_ BitVec 8) (_ BitVec 32)) tuple2!4786)

(assert (=> b!52665 (= lt!81669 (appendBitFromByte!0 thiss!1379 (select (arr!1670 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!52664 () Bool)

(assert (=> b!52664 (= e!35038 (not e!35041))))

(declare-fun res!43974 () Bool)

(assert (=> b!52664 (=> res!43974 e!35041)))

(assert (=> b!52664 (= res!43974 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1960 BitStream!1960) Bool)

(assert (=> b!52664 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81668 () Unit!3672)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1960) Unit!3672)

(assert (=> b!52664 (= lt!81668 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81670 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52664 (= lt!81670 (bitIndex!0 (size!1134 (buf!1484 thiss!1379)) (currentByte!3033 thiss!1379) (currentBit!3028 thiss!1379)))))

(assert (= (and start!10500 res!43973) b!52663))

(assert (= (and b!52663 res!43972) b!52664))

(assert (= (and b!52664 (not res!43974)) b!52665))

(assert (= start!10500 b!52666))

(declare-fun m!83047 () Bool)

(assert (=> b!52666 m!83047))

(declare-fun m!83049 () Bool)

(assert (=> b!52665 m!83049))

(assert (=> b!52665 m!83049))

(declare-fun m!83051 () Bool)

(assert (=> b!52665 m!83051))

(declare-fun m!83053 () Bool)

(assert (=> start!10500 m!83053))

(declare-fun m!83055 () Bool)

(assert (=> start!10500 m!83055))

(declare-fun m!83057 () Bool)

(assert (=> b!52664 m!83057))

(declare-fun m!83059 () Bool)

(assert (=> b!52664 m!83059))

(declare-fun m!83061 () Bool)

(assert (=> b!52664 m!83061))

(declare-fun m!83063 () Bool)

(assert (=> b!52663 m!83063))

(push 1)

(assert (not start!10500))

(assert (not b!52663))

(assert (not b!52664))

(assert (not b!52665))

(assert (not b!52666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

