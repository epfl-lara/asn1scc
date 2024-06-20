; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10446 () Bool)

(assert start!10446)

(declare-fun b!52472 () Bool)

(declare-fun e!34888 () Bool)

(declare-fun e!34886 () Bool)

(assert (=> b!52472 (= e!34888 (not e!34886))))

(declare-fun res!43803 () Bool)

(assert (=> b!52472 (=> res!43803 e!34886)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!52472 (= res!43803 (bvsge i!635 to!314))))

(declare-datatypes ((array!2467 0))(
  ( (array!2468 (arr!1664 (Array (_ BitVec 32) (_ BitVec 8))) (size!1128 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1948 0))(
  ( (BitStream!1949 (buf!1478 array!2467) (currentByte!3021 (_ BitVec 32)) (currentBit!3016 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1948)

(declare-fun isPrefixOf!0 (BitStream!1948 BitStream!1948) Bool)

(assert (=> b!52472 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3660 0))(
  ( (Unit!3661) )
))
(declare-fun lt!81452 () Unit!3660)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1948) Unit!3660)

(assert (=> b!52472 (= lt!81452 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81453 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52472 (= lt!81453 (bitIndex!0 (size!1128 (buf!1478 thiss!1379)) (currentByte!3021 thiss!1379) (currentBit!3016 thiss!1379)))))

(declare-fun b!52473 () Bool)

(assert (=> b!52473 (= e!34886 true)))

(declare-fun srcBuffer!2 () array!2467)

(declare-datatypes ((tuple2!4766 0))(
  ( (tuple2!4767 (_1!2488 Unit!3660) (_2!2488 BitStream!1948)) )
))
(declare-fun lt!81454 () tuple2!4766)

(declare-fun appendBitFromByte!0 (BitStream!1948 (_ BitVec 8) (_ BitVec 32)) tuple2!4766)

(assert (=> b!52473 (= lt!81454 (appendBitFromByte!0 thiss!1379 (select (arr!1664 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!43801 () Bool)

(assert (=> start!10446 (=> (not res!43801) (not e!34888))))

(assert (=> start!10446 (= res!43801 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1128 srcBuffer!2))))))))

(assert (=> start!10446 e!34888))

(assert (=> start!10446 true))

(declare-fun array_inv!1033 (array!2467) Bool)

(assert (=> start!10446 (array_inv!1033 srcBuffer!2)))

(declare-fun e!34885 () Bool)

(declare-fun inv!12 (BitStream!1948) Bool)

(assert (=> start!10446 (and (inv!12 thiss!1379) e!34885)))

(declare-fun b!52474 () Bool)

(assert (=> b!52474 (= e!34885 (array_inv!1033 (buf!1478 thiss!1379)))))

(declare-fun b!52471 () Bool)

(declare-fun res!43802 () Bool)

(assert (=> b!52471 (=> (not res!43802) (not e!34888))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52471 (= res!43802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1128 (buf!1478 thiss!1379))) ((_ sign_extend 32) (currentByte!3021 thiss!1379)) ((_ sign_extend 32) (currentBit!3016 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!10446 res!43801) b!52471))

(assert (= (and b!52471 res!43802) b!52472))

(assert (= (and b!52472 (not res!43803)) b!52473))

(assert (= start!10446 b!52474))

(declare-fun m!82831 () Bool)

(assert (=> b!52473 m!82831))

(assert (=> b!52473 m!82831))

(declare-fun m!82833 () Bool)

(assert (=> b!52473 m!82833))

(declare-fun m!82835 () Bool)

(assert (=> b!52474 m!82835))

(declare-fun m!82837 () Bool)

(assert (=> b!52472 m!82837))

(declare-fun m!82839 () Bool)

(assert (=> b!52472 m!82839))

(declare-fun m!82841 () Bool)

(assert (=> b!52472 m!82841))

(declare-fun m!82843 () Bool)

(assert (=> start!10446 m!82843))

(declare-fun m!82845 () Bool)

(assert (=> start!10446 m!82845))

(declare-fun m!82847 () Bool)

(assert (=> b!52471 m!82847))

(push 1)

(assert (not b!52472))

(assert (not b!52471))

(assert (not b!52474))

(assert (not start!10446))

(assert (not b!52473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

