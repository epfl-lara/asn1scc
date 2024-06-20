; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10616 () Bool)

(assert start!10616)

(declare-fun b!53115 () Bool)

(declare-fun e!35375 () Bool)

(declare-fun e!35377 () Bool)

(assert (=> b!53115 (= e!35375 (not e!35377))))

(declare-fun res!44373 () Bool)

(assert (=> b!53115 (=> res!44373 e!35377)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!53115 (= res!44373 (bvsge i!635 to!314))))

(declare-datatypes ((array!2508 0))(
  ( (array!2509 (arr!1680 (Array (_ BitVec 32) (_ BitVec 8))) (size!1144 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1980 0))(
  ( (BitStream!1981 (buf!1494 array!2508) (currentByte!3055 (_ BitVec 32)) (currentBit!3050 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1980)

(declare-fun isPrefixOf!0 (BitStream!1980 BitStream!1980) Bool)

(assert (=> b!53115 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3695 0))(
  ( (Unit!3696) )
))
(declare-fun lt!82336 () Unit!3695)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1980) Unit!3695)

(assert (=> b!53115 (= lt!82336 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!82339 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!53115 (= lt!82339 (bitIndex!0 (size!1144 (buf!1494 thiss!1379)) (currentByte!3055 thiss!1379) (currentBit!3050 thiss!1379)))))

(declare-fun b!53116 () Bool)

(declare-fun e!35378 () Bool)

(assert (=> b!53116 (= e!35377 e!35378)))

(declare-fun res!44372 () Bool)

(assert (=> b!53116 (=> res!44372 e!35378)))

(declare-datatypes ((tuple2!4834 0))(
  ( (tuple2!4835 (_1!2522 Unit!3695) (_2!2522 BitStream!1980)) )
))
(declare-fun lt!82338 () tuple2!4834)

(assert (=> b!53116 (= res!44372 (not (isPrefixOf!0 thiss!1379 (_2!2522 lt!82338))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53116 (validate_offset_bits!1 ((_ sign_extend 32) (size!1144 (buf!1494 (_2!2522 lt!82338)))) ((_ sign_extend 32) (currentByte!3055 (_2!2522 lt!82338))) ((_ sign_extend 32) (currentBit!3050 (_2!2522 lt!82338))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!82335 () Unit!3695)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1980 BitStream!1980 (_ BitVec 64) (_ BitVec 64)) Unit!3695)

(assert (=> b!53116 (= lt!82335 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2522 lt!82338) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2508)

(declare-fun appendBitFromByte!0 (BitStream!1980 (_ BitVec 8) (_ BitVec 32)) tuple2!4834)

(assert (=> b!53116 (= lt!82338 (appendBitFromByte!0 thiss!1379 (select (arr!1680 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!53117 () Bool)

(assert (=> b!53117 (= e!35378 true)))

(declare-datatypes ((tuple2!4836 0))(
  ( (tuple2!4837 (_1!2523 BitStream!1980) (_2!2523 BitStream!1980)) )
))
(declare-fun lt!82337 () tuple2!4836)

(declare-fun reader!0 (BitStream!1980 BitStream!1980) tuple2!4836)

(assert (=> b!53117 (= lt!82337 (reader!0 thiss!1379 (_2!2522 lt!82338)))))

(declare-fun b!53118 () Bool)

(declare-fun res!44370 () Bool)

(assert (=> b!53118 (=> (not res!44370) (not e!35375))))

(assert (=> b!53118 (= res!44370 (validate_offset_bits!1 ((_ sign_extend 32) (size!1144 (buf!1494 thiss!1379))) ((_ sign_extend 32) (currentByte!3055 thiss!1379)) ((_ sign_extend 32) (currentBit!3050 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!53119 () Bool)

(declare-fun e!35373 () Bool)

(declare-fun array_inv!1049 (array!2508) Bool)

(assert (=> b!53119 (= e!35373 (array_inv!1049 (buf!1494 thiss!1379)))))

(declare-fun res!44371 () Bool)

(assert (=> start!10616 (=> (not res!44371) (not e!35375))))

(assert (=> start!10616 (= res!44371 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1144 srcBuffer!2))))))))

(assert (=> start!10616 e!35375))

(assert (=> start!10616 true))

(assert (=> start!10616 (array_inv!1049 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1980) Bool)

(assert (=> start!10616 (and (inv!12 thiss!1379) e!35373)))

(assert (= (and start!10616 res!44371) b!53118))

(assert (= (and b!53118 res!44370) b!53115))

(assert (= (and b!53115 (not res!44373)) b!53116))

(assert (= (and b!53116 (not res!44372)) b!53117))

(assert (= start!10616 b!53119))

(declare-fun m!83595 () Bool)

(assert (=> b!53116 m!83595))

(declare-fun m!83597 () Bool)

(assert (=> b!53116 m!83597))

(assert (=> b!53116 m!83595))

(declare-fun m!83599 () Bool)

(assert (=> b!53116 m!83599))

(declare-fun m!83601 () Bool)

(assert (=> b!53116 m!83601))

(declare-fun m!83603 () Bool)

(assert (=> b!53116 m!83603))

(declare-fun m!83605 () Bool)

(assert (=> b!53117 m!83605))

(declare-fun m!83607 () Bool)

(assert (=> start!10616 m!83607))

(declare-fun m!83609 () Bool)

(assert (=> start!10616 m!83609))

(declare-fun m!83611 () Bool)

(assert (=> b!53119 m!83611))

(declare-fun m!83613 () Bool)

(assert (=> b!53118 m!83613))

(declare-fun m!83615 () Bool)

(assert (=> b!53115 m!83615))

(declare-fun m!83617 () Bool)

(assert (=> b!53115 m!83617))

(declare-fun m!83619 () Bool)

(assert (=> b!53115 m!83619))

(check-sat (not b!53117) (not b!53115) (not b!53119) (not start!10616) (not b!53116) (not b!53118))
