; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10450 () Bool)

(assert start!10450)

(declare-fun b!52496 () Bool)

(declare-fun e!34918 () Bool)

(declare-fun e!34915 () Bool)

(assert (=> b!52496 (= e!34918 (not e!34915))))

(declare-fun res!43819 () Bool)

(assert (=> b!52496 (=> res!43819 e!34915)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!52496 (= res!43819 (bvsge i!635 to!314))))

(declare-datatypes ((array!2471 0))(
  ( (array!2472 (arr!1666 (Array (_ BitVec 32) (_ BitVec 8))) (size!1130 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1952 0))(
  ( (BitStream!1953 (buf!1480 array!2471) (currentByte!3023 (_ BitVec 32)) (currentBit!3018 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1952)

(declare-fun isPrefixOf!0 (BitStream!1952 BitStream!1952) Bool)

(assert (=> b!52496 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3664 0))(
  ( (Unit!3665) )
))
(declare-fun lt!81471 () Unit!3664)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1952) Unit!3664)

(assert (=> b!52496 (= lt!81471 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81472 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52496 (= lt!81472 (bitIndex!0 (size!1130 (buf!1480 thiss!1379)) (currentByte!3023 thiss!1379) (currentBit!3018 thiss!1379)))))

(declare-fun b!52498 () Bool)

(declare-fun e!34916 () Bool)

(declare-fun array_inv!1035 (array!2471) Bool)

(assert (=> b!52498 (= e!34916 (array_inv!1035 (buf!1480 thiss!1379)))))

(declare-fun b!52495 () Bool)

(declare-fun res!43821 () Bool)

(assert (=> b!52495 (=> (not res!43821) (not e!34918))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52495 (= res!43821 (validate_offset_bits!1 ((_ sign_extend 32) (size!1130 (buf!1480 thiss!1379))) ((_ sign_extend 32) (currentByte!3023 thiss!1379)) ((_ sign_extend 32) (currentBit!3018 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52497 () Bool)

(assert (=> b!52497 (= e!34915 true)))

(declare-fun srcBuffer!2 () array!2471)

(declare-datatypes ((tuple2!4770 0))(
  ( (tuple2!4771 (_1!2490 Unit!3664) (_2!2490 BitStream!1952)) )
))
(declare-fun lt!81470 () tuple2!4770)

(declare-fun appendBitFromByte!0 (BitStream!1952 (_ BitVec 8) (_ BitVec 32)) tuple2!4770)

(assert (=> b!52497 (= lt!81470 (appendBitFromByte!0 thiss!1379 (select (arr!1666 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!43820 () Bool)

(assert (=> start!10450 (=> (not res!43820) (not e!34918))))

(assert (=> start!10450 (= res!43820 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1130 srcBuffer!2))))))))

(assert (=> start!10450 e!34918))

(assert (=> start!10450 true))

(assert (=> start!10450 (array_inv!1035 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1952) Bool)

(assert (=> start!10450 (and (inv!12 thiss!1379) e!34916)))

(assert (= (and start!10450 res!43820) b!52495))

(assert (= (and b!52495 res!43821) b!52496))

(assert (= (and b!52496 (not res!43819)) b!52497))

(assert (= start!10450 b!52498))

(declare-fun m!82867 () Bool)

(assert (=> b!52497 m!82867))

(assert (=> b!52497 m!82867))

(declare-fun m!82869 () Bool)

(assert (=> b!52497 m!82869))

(declare-fun m!82871 () Bool)

(assert (=> start!10450 m!82871))

(declare-fun m!82873 () Bool)

(assert (=> start!10450 m!82873))

(declare-fun m!82875 () Bool)

(assert (=> b!52496 m!82875))

(declare-fun m!82877 () Bool)

(assert (=> b!52496 m!82877))

(declare-fun m!82879 () Bool)

(assert (=> b!52496 m!82879))

(declare-fun m!82881 () Bool)

(assert (=> b!52498 m!82881))

(declare-fun m!82883 () Bool)

(assert (=> b!52495 m!82883))

(push 1)

(assert (not start!10450))

(assert (not b!52497))

(assert (not b!52495))

(assert (not b!52498))

(assert (not b!52496))

(check-sat)

(pop 1)

