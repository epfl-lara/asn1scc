; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10504 () Bool)

(assert start!10504)

(declare-fun b!52690 () Bool)

(declare-fun e!35069 () Bool)

(declare-datatypes ((array!2486 0))(
  ( (array!2487 (arr!1672 (Array (_ BitVec 32) (_ BitVec 8))) (size!1136 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1964 0))(
  ( (BitStream!1965 (buf!1486 array!2486) (currentByte!3035 (_ BitVec 32)) (currentBit!3030 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1964)

(declare-fun array_inv!1041 (array!2486) Bool)

(assert (=> b!52690 (= e!35069 (array_inv!1041 (buf!1486 thiss!1379)))))

(declare-fun b!52688 () Bool)

(declare-fun e!35072 () Bool)

(declare-fun e!35071 () Bool)

(assert (=> b!52688 (= e!35072 (not e!35071))))

(declare-fun res!43991 () Bool)

(assert (=> b!52688 (=> res!43991 e!35071)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!52688 (= res!43991 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1964 BitStream!1964) Bool)

(assert (=> b!52688 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3676 0))(
  ( (Unit!3677) )
))
(declare-fun lt!81686 () Unit!3676)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1964) Unit!3676)

(assert (=> b!52688 (= lt!81686 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81687 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52688 (= lt!81687 (bitIndex!0 (size!1136 (buf!1486 thiss!1379)) (currentByte!3035 thiss!1379) (currentBit!3030 thiss!1379)))))

(declare-fun b!52689 () Bool)

(assert (=> b!52689 (= e!35071 true)))

(declare-fun srcBuffer!2 () array!2486)

(declare-datatypes ((tuple2!4790 0))(
  ( (tuple2!4791 (_1!2500 Unit!3676) (_2!2500 BitStream!1964)) )
))
(declare-fun lt!81688 () tuple2!4790)

(declare-fun appendBitFromByte!0 (BitStream!1964 (_ BitVec 8) (_ BitVec 32)) tuple2!4790)

(assert (=> b!52689 (= lt!81688 (appendBitFromByte!0 thiss!1379 (select (arr!1672 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!43992 () Bool)

(assert (=> start!10504 (=> (not res!43992) (not e!35072))))

(assert (=> start!10504 (= res!43992 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1136 srcBuffer!2))))))))

(assert (=> start!10504 e!35072))

(assert (=> start!10504 true))

(assert (=> start!10504 (array_inv!1041 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1964) Bool)

(assert (=> start!10504 (and (inv!12 thiss!1379) e!35069)))

(declare-fun b!52687 () Bool)

(declare-fun res!43990 () Bool)

(assert (=> b!52687 (=> (not res!43990) (not e!35072))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52687 (= res!43990 (validate_offset_bits!1 ((_ sign_extend 32) (size!1136 (buf!1486 thiss!1379))) ((_ sign_extend 32) (currentByte!3035 thiss!1379)) ((_ sign_extend 32) (currentBit!3030 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!10504 res!43992) b!52687))

(assert (= (and b!52687 res!43990) b!52688))

(assert (= (and b!52688 (not res!43991)) b!52689))

(assert (= start!10504 b!52690))

(declare-fun m!83083 () Bool)

(assert (=> b!52687 m!83083))

(declare-fun m!83085 () Bool)

(assert (=> start!10504 m!83085))

(declare-fun m!83087 () Bool)

(assert (=> start!10504 m!83087))

(declare-fun m!83089 () Bool)

(assert (=> b!52688 m!83089))

(declare-fun m!83091 () Bool)

(assert (=> b!52688 m!83091))

(declare-fun m!83093 () Bool)

(assert (=> b!52688 m!83093))

(declare-fun m!83095 () Bool)

(assert (=> b!52690 m!83095))

(declare-fun m!83097 () Bool)

(assert (=> b!52689 m!83097))

(assert (=> b!52689 m!83097))

(declare-fun m!83099 () Bool)

(assert (=> b!52689 m!83099))

(push 1)

(assert (not start!10504))

(assert (not b!52689))

(assert (not b!52688))

(assert (not b!52690))

(assert (not b!52687))

(check-sat)

