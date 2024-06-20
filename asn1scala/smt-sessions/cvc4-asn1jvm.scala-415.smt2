; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10618 () Bool)

(assert start!10618)

(declare-fun b!53130 () Bool)

(declare-fun res!44383 () Bool)

(declare-fun e!35392 () Bool)

(assert (=> b!53130 (=> (not res!44383) (not e!35392))))

(declare-datatypes ((array!2510 0))(
  ( (array!2511 (arr!1681 (Array (_ BitVec 32) (_ BitVec 8))) (size!1145 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1982 0))(
  ( (BitStream!1983 (buf!1495 array!2510) (currentByte!3056 (_ BitVec 32)) (currentBit!3051 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1982)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53130 (= res!44383 (validate_offset_bits!1 ((_ sign_extend 32) (size!1145 (buf!1495 thiss!1379))) ((_ sign_extend 32) (currentByte!3056 thiss!1379)) ((_ sign_extend 32) (currentBit!3051 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!53131 () Bool)

(declare-fun e!35391 () Bool)

(assert (=> b!53131 (= e!35391 true)))

(declare-datatypes ((tuple2!4838 0))(
  ( (tuple2!4839 (_1!2524 BitStream!1982) (_2!2524 BitStream!1982)) )
))
(declare-fun lt!82353 () tuple2!4838)

(declare-datatypes ((Unit!3697 0))(
  ( (Unit!3698) )
))
(declare-datatypes ((tuple2!4840 0))(
  ( (tuple2!4841 (_1!2525 Unit!3697) (_2!2525 BitStream!1982)) )
))
(declare-fun lt!82354 () tuple2!4840)

(declare-fun reader!0 (BitStream!1982 BitStream!1982) tuple2!4838)

(assert (=> b!53131 (= lt!82353 (reader!0 thiss!1379 (_2!2525 lt!82354)))))

(declare-fun b!53132 () Bool)

(declare-fun e!35395 () Bool)

(assert (=> b!53132 (= e!35392 (not e!35395))))

(declare-fun res!44385 () Bool)

(assert (=> b!53132 (=> res!44385 e!35395)))

(assert (=> b!53132 (= res!44385 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1982 BitStream!1982) Bool)

(assert (=> b!53132 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82350 () Unit!3697)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1982) Unit!3697)

(assert (=> b!53132 (= lt!82350 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!82352 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!53132 (= lt!82352 (bitIndex!0 (size!1145 (buf!1495 thiss!1379)) (currentByte!3056 thiss!1379) (currentBit!3051 thiss!1379)))))

(declare-fun res!44384 () Bool)

(assert (=> start!10618 (=> (not res!44384) (not e!35392))))

(declare-fun srcBuffer!2 () array!2510)

(assert (=> start!10618 (= res!44384 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1145 srcBuffer!2))))))))

(assert (=> start!10618 e!35392))

(assert (=> start!10618 true))

(declare-fun array_inv!1050 (array!2510) Bool)

(assert (=> start!10618 (array_inv!1050 srcBuffer!2)))

(declare-fun e!35394 () Bool)

(declare-fun inv!12 (BitStream!1982) Bool)

(assert (=> start!10618 (and (inv!12 thiss!1379) e!35394)))

(declare-fun b!53133 () Bool)

(assert (=> b!53133 (= e!35394 (array_inv!1050 (buf!1495 thiss!1379)))))

(declare-fun b!53134 () Bool)

(assert (=> b!53134 (= e!35395 e!35391)))

(declare-fun res!44382 () Bool)

(assert (=> b!53134 (=> res!44382 e!35391)))

(assert (=> b!53134 (= res!44382 (not (isPrefixOf!0 thiss!1379 (_2!2525 lt!82354))))))

(assert (=> b!53134 (validate_offset_bits!1 ((_ sign_extend 32) (size!1145 (buf!1495 (_2!2525 lt!82354)))) ((_ sign_extend 32) (currentByte!3056 (_2!2525 lt!82354))) ((_ sign_extend 32) (currentBit!3051 (_2!2525 lt!82354))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!82351 () Unit!3697)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1982 BitStream!1982 (_ BitVec 64) (_ BitVec 64)) Unit!3697)

(assert (=> b!53134 (= lt!82351 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2525 lt!82354) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1982 (_ BitVec 8) (_ BitVec 32)) tuple2!4840)

(assert (=> b!53134 (= lt!82354 (appendBitFromByte!0 thiss!1379 (select (arr!1681 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!10618 res!44384) b!53130))

(assert (= (and b!53130 res!44383) b!53132))

(assert (= (and b!53132 (not res!44385)) b!53134))

(assert (= (and b!53134 (not res!44382)) b!53131))

(assert (= start!10618 b!53133))

(declare-fun m!83621 () Bool)

(assert (=> start!10618 m!83621))

(declare-fun m!83623 () Bool)

(assert (=> start!10618 m!83623))

(declare-fun m!83625 () Bool)

(assert (=> b!53134 m!83625))

(declare-fun m!83627 () Bool)

(assert (=> b!53134 m!83627))

(declare-fun m!83629 () Bool)

(assert (=> b!53134 m!83629))

(declare-fun m!83631 () Bool)

(assert (=> b!53134 m!83631))

(assert (=> b!53134 m!83627))

(declare-fun m!83633 () Bool)

(assert (=> b!53134 m!83633))

(declare-fun m!83635 () Bool)

(assert (=> b!53133 m!83635))

(declare-fun m!83637 () Bool)

(assert (=> b!53131 m!83637))

(declare-fun m!83639 () Bool)

(assert (=> b!53132 m!83639))

(declare-fun m!83641 () Bool)

(assert (=> b!53132 m!83641))

(declare-fun m!83643 () Bool)

(assert (=> b!53132 m!83643))

(declare-fun m!83645 () Bool)

(assert (=> b!53130 m!83645))

(push 1)

(assert (not start!10618))

(assert (not b!53132))

(assert (not b!53131))

(assert (not b!53130))

(assert (not b!53134))

(assert (not b!53133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

