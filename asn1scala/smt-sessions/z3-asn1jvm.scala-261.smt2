; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5124 () Bool)

(assert start!5124)

(declare-fun b!20430 () Bool)

(declare-fun res!17747 () Bool)

(declare-fun e!13710 () Bool)

(assert (=> b!20430 (=> (not res!17747) (not e!13710))))

(declare-datatypes ((array!1459 0))(
  ( (array!1460 (arr!1064 (Array (_ BitVec 32) (_ BitVec 8))) (size!620 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1074 0))(
  ( (BitStream!1075 (buf!929 array!1459) (currentByte!2218 (_ BitVec 32)) (currentBit!2213 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1074)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20430 (= res!17747 (validate_offset_bits!1 ((_ sign_extend 32) (size!620 (buf!929 thiss!1379))) ((_ sign_extend 32) (currentByte!2218 thiss!1379)) ((_ sign_extend 32) (currentBit!2213 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!17749 () Bool)

(assert (=> start!5124 (=> (not res!17749) (not e!13710))))

(declare-fun srcBuffer!2 () array!1459)

(assert (=> start!5124 (= res!17749 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!620 srcBuffer!2))))))))

(assert (=> start!5124 e!13710))

(assert (=> start!5124 true))

(declare-fun array_inv!590 (array!1459) Bool)

(assert (=> start!5124 (array_inv!590 srcBuffer!2)))

(declare-fun e!13707 () Bool)

(declare-fun inv!12 (BitStream!1074) Bool)

(assert (=> start!5124 (and (inv!12 thiss!1379) e!13707)))

(declare-fun b!20431 () Bool)

(declare-fun e!13708 () Bool)

(assert (=> b!20431 (= e!13710 (not e!13708))))

(declare-fun res!17750 () Bool)

(assert (=> b!20431 (=> res!17750 e!13708)))

(assert (=> b!20431 (= res!17750 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1074 BitStream!1074) Bool)

(assert (=> b!20431 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1793 0))(
  ( (Unit!1794) )
))
(declare-fun lt!29132 () Unit!1793)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1074) Unit!1793)

(assert (=> b!20431 (= lt!29132 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29135 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20431 (= lt!29135 (bitIndex!0 (size!620 (buf!929 thiss!1379)) (currentByte!2218 thiss!1379) (currentBit!2213 thiss!1379)))))

(declare-fun b!20432 () Bool)

(declare-fun e!13705 () Bool)

(assert (=> b!20432 (= e!13705 true)))

(declare-fun e!13704 () Bool)

(assert (=> b!20432 e!13704))

(declare-fun res!17746 () Bool)

(assert (=> b!20432 (=> (not res!17746) (not e!13704))))

(declare-datatypes ((tuple2!2388 0))(
  ( (tuple2!2389 (_1!1279 Unit!1793) (_2!1279 BitStream!1074)) )
))
(declare-fun lt!29134 () tuple2!2388)

(assert (=> b!20432 (= res!17746 (validate_offset_bits!1 ((_ sign_extend 32) (size!620 (buf!929 (_2!1279 lt!29134)))) ((_ sign_extend 32) (currentByte!2218 thiss!1379)) ((_ sign_extend 32) (currentBit!2213 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29136 () Unit!1793)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1074 array!1459 (_ BitVec 64)) Unit!1793)

(assert (=> b!20432 (= lt!29136 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!929 (_2!1279 lt!29134)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2390 0))(
  ( (tuple2!2391 (_1!1280 BitStream!1074) (_2!1280 BitStream!1074)) )
))
(declare-fun lt!29137 () tuple2!2390)

(declare-fun reader!0 (BitStream!1074 BitStream!1074) tuple2!2390)

(assert (=> b!20432 (= lt!29137 (reader!0 thiss!1379 (_2!1279 lt!29134)))))

(declare-fun b!20433 () Bool)

(declare-datatypes ((List!238 0))(
  ( (Nil!235) (Cons!234 (h!353 Bool) (t!988 List!238)) )
))
(declare-fun head!75 (List!238) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1074 array!1459 (_ BitVec 64) (_ BitVec 64)) List!238)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1074 BitStream!1074 (_ BitVec 64)) List!238)

(assert (=> b!20433 (= e!13704 (= (head!75 (byteArrayBitContentToList!0 (_2!1279 lt!29134) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!75 (bitStreamReadBitsIntoList!0 (_2!1279 lt!29134) (_1!1280 lt!29137) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20434 () Bool)

(assert (=> b!20434 (= e!13707 (array_inv!590 (buf!929 thiss!1379)))))

(declare-fun b!20435 () Bool)

(assert (=> b!20435 (= e!13708 e!13705)))

(declare-fun res!17748 () Bool)

(assert (=> b!20435 (=> res!17748 e!13705)))

(assert (=> b!20435 (= res!17748 (not (isPrefixOf!0 thiss!1379 (_2!1279 lt!29134))))))

(assert (=> b!20435 (validate_offset_bits!1 ((_ sign_extend 32) (size!620 (buf!929 (_2!1279 lt!29134)))) ((_ sign_extend 32) (currentByte!2218 (_2!1279 lt!29134))) ((_ sign_extend 32) (currentBit!2213 (_2!1279 lt!29134))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29133 () Unit!1793)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1074 BitStream!1074 (_ BitVec 64) (_ BitVec 64)) Unit!1793)

(assert (=> b!20435 (= lt!29133 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1279 lt!29134) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1074 (_ BitVec 8) (_ BitVec 32)) tuple2!2388)

(assert (=> b!20435 (= lt!29134 (appendBitFromByte!0 thiss!1379 (select (arr!1064 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5124 res!17749) b!20430))

(assert (= (and b!20430 res!17747) b!20431))

(assert (= (and b!20431 (not res!17750)) b!20435))

(assert (= (and b!20435 (not res!17748)) b!20432))

(assert (= (and b!20432 res!17746) b!20433))

(assert (= start!5124 b!20434))

(declare-fun m!27701 () Bool)

(assert (=> b!20433 m!27701))

(assert (=> b!20433 m!27701))

(declare-fun m!27703 () Bool)

(assert (=> b!20433 m!27703))

(declare-fun m!27705 () Bool)

(assert (=> b!20433 m!27705))

(assert (=> b!20433 m!27705))

(declare-fun m!27707 () Bool)

(assert (=> b!20433 m!27707))

(declare-fun m!27709 () Bool)

(assert (=> b!20430 m!27709))

(declare-fun m!27711 () Bool)

(assert (=> b!20431 m!27711))

(declare-fun m!27713 () Bool)

(assert (=> b!20431 m!27713))

(declare-fun m!27715 () Bool)

(assert (=> b!20431 m!27715))

(declare-fun m!27717 () Bool)

(assert (=> start!5124 m!27717))

(declare-fun m!27719 () Bool)

(assert (=> start!5124 m!27719))

(declare-fun m!27721 () Bool)

(assert (=> b!20434 m!27721))

(declare-fun m!27723 () Bool)

(assert (=> b!20432 m!27723))

(declare-fun m!27725 () Bool)

(assert (=> b!20432 m!27725))

(declare-fun m!27727 () Bool)

(assert (=> b!20432 m!27727))

(declare-fun m!27729 () Bool)

(assert (=> b!20435 m!27729))

(declare-fun m!27731 () Bool)

(assert (=> b!20435 m!27731))

(declare-fun m!27733 () Bool)

(assert (=> b!20435 m!27733))

(declare-fun m!27735 () Bool)

(assert (=> b!20435 m!27735))

(assert (=> b!20435 m!27731))

(declare-fun m!27737 () Bool)

(assert (=> b!20435 m!27737))

(check-sat (not start!5124) (not b!20434) (not b!20432) (not b!20430) (not b!20433) (not b!20431) (not b!20435))
