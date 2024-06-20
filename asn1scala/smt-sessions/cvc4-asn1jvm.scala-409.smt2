; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10444 () Bool)

(assert start!10444)

(declare-fun b!52462 () Bool)

(declare-fun e!34871 () Bool)

(declare-datatypes ((array!2465 0))(
  ( (array!2466 (arr!1663 (Array (_ BitVec 32) (_ BitVec 8))) (size!1127 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1946 0))(
  ( (BitStream!1947 (buf!1477 array!2465) (currentByte!3020 (_ BitVec 32)) (currentBit!3015 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1946)

(declare-fun array_inv!1032 (array!2465) Bool)

(assert (=> b!52462 (= e!34871 (array_inv!1032 (buf!1477 thiss!1379)))))

(declare-fun b!52459 () Bool)

(declare-fun res!43792 () Bool)

(declare-fun e!34872 () Bool)

(assert (=> b!52459 (=> (not res!43792) (not e!34872))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52459 (= res!43792 (validate_offset_bits!1 ((_ sign_extend 32) (size!1127 (buf!1477 thiss!1379))) ((_ sign_extend 32) (currentByte!3020 thiss!1379)) ((_ sign_extend 32) (currentBit!3015 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52461 () Bool)

(declare-fun e!34874 () Bool)

(assert (=> b!52461 (= e!34874 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun srcBuffer!2 () array!2465)

(declare-datatypes ((Unit!3658 0))(
  ( (Unit!3659) )
))
(declare-datatypes ((tuple2!4764 0))(
  ( (tuple2!4765 (_1!2487 Unit!3658) (_2!2487 BitStream!1946)) )
))
(declare-fun lt!81445 () tuple2!4764)

(declare-fun appendBitFromByte!0 (BitStream!1946 (_ BitVec 8) (_ BitVec 32)) tuple2!4764)

(assert (=> b!52461 (= lt!81445 (appendBitFromByte!0 thiss!1379 (select (arr!1663 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!43794 () Bool)

(assert (=> start!10444 (=> (not res!43794) (not e!34872))))

(assert (=> start!10444 (= res!43794 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1127 srcBuffer!2))))))))

(assert (=> start!10444 e!34872))

(assert (=> start!10444 true))

(assert (=> start!10444 (array_inv!1032 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1946) Bool)

(assert (=> start!10444 (and (inv!12 thiss!1379) e!34871)))

(declare-fun b!52460 () Bool)

(assert (=> b!52460 (= e!34872 (not e!34874))))

(declare-fun res!43793 () Bool)

(assert (=> b!52460 (=> res!43793 e!34874)))

(assert (=> b!52460 (= res!43793 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1946 BitStream!1946) Bool)

(assert (=> b!52460 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81443 () Unit!3658)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1946) Unit!3658)

(assert (=> b!52460 (= lt!81443 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81444 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52460 (= lt!81444 (bitIndex!0 (size!1127 (buf!1477 thiss!1379)) (currentByte!3020 thiss!1379) (currentBit!3015 thiss!1379)))))

(assert (= (and start!10444 res!43794) b!52459))

(assert (= (and b!52459 res!43792) b!52460))

(assert (= (and b!52460 (not res!43793)) b!52461))

(assert (= start!10444 b!52462))

(declare-fun m!82813 () Bool)

(assert (=> start!10444 m!82813))

(declare-fun m!82815 () Bool)

(assert (=> start!10444 m!82815))

(declare-fun m!82817 () Bool)

(assert (=> b!52459 m!82817))

(declare-fun m!82819 () Bool)

(assert (=> b!52461 m!82819))

(assert (=> b!52461 m!82819))

(declare-fun m!82821 () Bool)

(assert (=> b!52461 m!82821))

(declare-fun m!82823 () Bool)

(assert (=> b!52460 m!82823))

(declare-fun m!82825 () Bool)

(assert (=> b!52460 m!82825))

(declare-fun m!82827 () Bool)

(assert (=> b!52460 m!82827))

(declare-fun m!82829 () Bool)

(assert (=> b!52462 m!82829))

(push 1)

(assert (not b!52459))

(assert (not b!52461))

(assert (not start!10444))

(assert (not b!52462))

(assert (not b!52460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

