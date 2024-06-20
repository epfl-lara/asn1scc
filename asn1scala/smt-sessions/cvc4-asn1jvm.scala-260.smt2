; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5120 () Bool)

(assert start!5120)

(declare-datatypes ((array!1455 0))(
  ( (array!1456 (arr!1062 (Array (_ BitVec 32) (_ BitVec 8))) (size!618 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1455)

(declare-fun e!13663 () Bool)

(declare-datatypes ((BitStream!1070 0))(
  ( (BitStream!1071 (buf!927 array!1455) (currentByte!2216 (_ BitVec 32)) (currentBit!2211 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1789 0))(
  ( (Unit!1790) )
))
(declare-datatypes ((tuple2!2380 0))(
  ( (tuple2!2381 (_1!1275 Unit!1789) (_2!1275 BitStream!1070)) )
))
(declare-fun lt!29100 () tuple2!2380)

(declare-fun b!20394 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!2382 0))(
  ( (tuple2!2383 (_1!1276 BitStream!1070) (_2!1276 BitStream!1070)) )
))
(declare-fun lt!29099 () tuple2!2382)

(declare-datatypes ((List!236 0))(
  ( (Nil!233) (Cons!232 (h!351 Bool) (t!986 List!236)) )
))
(declare-fun head!73 (List!236) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1070 array!1455 (_ BitVec 64) (_ BitVec 64)) List!236)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1070 BitStream!1070 (_ BitVec 64)) List!236)

(assert (=> b!20394 (= e!13663 (= (head!73 (byteArrayBitContentToList!0 (_2!1275 lt!29100) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!73 (bitStreamReadBitsIntoList!0 (_2!1275 lt!29100) (_1!1276 lt!29099) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20396 () Bool)

(declare-fun e!13666 () Bool)

(declare-fun e!13662 () Bool)

(assert (=> b!20396 (= e!13666 (not e!13662))))

(declare-fun res!17717 () Bool)

(assert (=> b!20396 (=> res!17717 e!13662)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20396 (= res!17717 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1070)

(declare-fun isPrefixOf!0 (BitStream!1070 BitStream!1070) Bool)

(assert (=> b!20396 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29097 () Unit!1789)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1070) Unit!1789)

(assert (=> b!20396 (= lt!29097 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29096 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20396 (= lt!29096 (bitIndex!0 (size!618 (buf!927 thiss!1379)) (currentByte!2216 thiss!1379) (currentBit!2211 thiss!1379)))))

(declare-fun b!20397 () Bool)

(declare-fun e!13667 () Bool)

(assert (=> b!20397 (= e!13667 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20397 e!13663))

(declare-fun res!17718 () Bool)

(assert (=> b!20397 (=> (not res!17718) (not e!13663))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20397 (= res!17718 (validate_offset_bits!1 ((_ sign_extend 32) (size!618 (buf!927 (_2!1275 lt!29100)))) ((_ sign_extend 32) (currentByte!2216 thiss!1379)) ((_ sign_extend 32) (currentBit!2211 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29101 () Unit!1789)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1070 array!1455 (_ BitVec 64)) Unit!1789)

(assert (=> b!20397 (= lt!29101 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!927 (_2!1275 lt!29100)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1070 BitStream!1070) tuple2!2382)

(assert (=> b!20397 (= lt!29099 (reader!0 thiss!1379 (_2!1275 lt!29100)))))

(declare-fun b!20398 () Bool)

(declare-fun e!13668 () Bool)

(declare-fun array_inv!588 (array!1455) Bool)

(assert (=> b!20398 (= e!13668 (array_inv!588 (buf!927 thiss!1379)))))

(declare-fun b!20399 () Bool)

(assert (=> b!20399 (= e!13662 e!13667)))

(declare-fun res!17719 () Bool)

(assert (=> b!20399 (=> res!17719 e!13667)))

(assert (=> b!20399 (= res!17719 (not (isPrefixOf!0 thiss!1379 (_2!1275 lt!29100))))))

(assert (=> b!20399 (validate_offset_bits!1 ((_ sign_extend 32) (size!618 (buf!927 (_2!1275 lt!29100)))) ((_ sign_extend 32) (currentByte!2216 (_2!1275 lt!29100))) ((_ sign_extend 32) (currentBit!2211 (_2!1275 lt!29100))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29098 () Unit!1789)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1070 BitStream!1070 (_ BitVec 64) (_ BitVec 64)) Unit!1789)

(assert (=> b!20399 (= lt!29098 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1275 lt!29100) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1070 (_ BitVec 8) (_ BitVec 32)) tuple2!2380)

(assert (=> b!20399 (= lt!29100 (appendBitFromByte!0 thiss!1379 (select (arr!1062 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!17716 () Bool)

(assert (=> start!5120 (=> (not res!17716) (not e!13666))))

(assert (=> start!5120 (= res!17716 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!618 srcBuffer!2))))))))

(assert (=> start!5120 e!13666))

(assert (=> start!5120 true))

(assert (=> start!5120 (array_inv!588 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1070) Bool)

(assert (=> start!5120 (and (inv!12 thiss!1379) e!13668)))

(declare-fun b!20395 () Bool)

(declare-fun res!17720 () Bool)

(assert (=> b!20395 (=> (not res!17720) (not e!13666))))

(assert (=> b!20395 (= res!17720 (validate_offset_bits!1 ((_ sign_extend 32) (size!618 (buf!927 thiss!1379))) ((_ sign_extend 32) (currentByte!2216 thiss!1379)) ((_ sign_extend 32) (currentBit!2211 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5120 res!17716) b!20395))

(assert (= (and b!20395 res!17720) b!20396))

(assert (= (and b!20396 (not res!17717)) b!20399))

(assert (= (and b!20399 (not res!17719)) b!20397))

(assert (= (and b!20397 res!17718) b!20394))

(assert (= start!5120 b!20398))

(declare-fun m!27625 () Bool)

(assert (=> b!20397 m!27625))

(declare-fun m!27627 () Bool)

(assert (=> b!20397 m!27627))

(declare-fun m!27629 () Bool)

(assert (=> b!20397 m!27629))

(declare-fun m!27631 () Bool)

(assert (=> b!20399 m!27631))

(assert (=> b!20399 m!27631))

(declare-fun m!27633 () Bool)

(assert (=> b!20399 m!27633))

(declare-fun m!27635 () Bool)

(assert (=> b!20399 m!27635))

(declare-fun m!27637 () Bool)

(assert (=> b!20399 m!27637))

(declare-fun m!27639 () Bool)

(assert (=> b!20399 m!27639))

(declare-fun m!27641 () Bool)

(assert (=> start!5120 m!27641))

(declare-fun m!27643 () Bool)

(assert (=> start!5120 m!27643))

(declare-fun m!27645 () Bool)

(assert (=> b!20394 m!27645))

(assert (=> b!20394 m!27645))

(declare-fun m!27647 () Bool)

(assert (=> b!20394 m!27647))

(declare-fun m!27649 () Bool)

(assert (=> b!20394 m!27649))

(assert (=> b!20394 m!27649))

(declare-fun m!27651 () Bool)

(assert (=> b!20394 m!27651))

(declare-fun m!27653 () Bool)

(assert (=> b!20396 m!27653))

(declare-fun m!27655 () Bool)

(assert (=> b!20396 m!27655))

(declare-fun m!27657 () Bool)

(assert (=> b!20396 m!27657))

(declare-fun m!27659 () Bool)

(assert (=> b!20395 m!27659))

(declare-fun m!27661 () Bool)

(assert (=> b!20398 m!27661))

(push 1)

(assert (not b!20394))

(assert (not b!20399))

(assert (not b!20396))

(assert (not b!20395))

(assert (not b!20398))

(assert (not start!5120))

(assert (not b!20397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

