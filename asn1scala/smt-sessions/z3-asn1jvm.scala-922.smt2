; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25932 () Bool)

(assert start!25932)

(declare-fun b!132407 () Bool)

(declare-fun e!87783 () Bool)

(assert (=> b!132407 (= e!87783 true)))

(declare-datatypes ((array!6102 0))(
  ( (array!6103 (arr!3397 (Array (_ BitVec 32) (_ BitVec 8))) (size!2762 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4788 0))(
  ( (BitStream!4789 (buf!3135 array!6102) (currentByte!5920 (_ BitVec 32)) (currentBit!5915 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11472 0))(
  ( (tuple2!11473 (_1!6042 BitStream!4788) (_2!6042 BitStream!4788)) )
))
(declare-fun lt!204436 () tuple2!11472)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun lt!204441 () array!6102)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!11474 0))(
  ( (tuple2!11475 (_1!6043 BitStream!4788) (_2!6043 array!6102)) )
))
(declare-fun lt!204438 () tuple2!11474)

(declare-fun readByteArrayLoopPure!0 (BitStream!4788 array!6102 (_ BitVec 32) (_ BitVec 32)) tuple2!11474)

(declare-fun withMovedByteIndex!0 (BitStream!4788 (_ BitVec 32)) BitStream!4788)

(assert (=> b!132407 (= lt!204438 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6042 lt!204436) #b00000000000000000000000000000001) lt!204441 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun b!132408 () Bool)

(declare-fun res!109941 () Bool)

(declare-fun e!87782 () Bool)

(assert (=> b!132408 (=> (not res!109941) (not e!87782))))

(declare-datatypes ((Unit!8156 0))(
  ( (Unit!8157) )
))
(declare-datatypes ((tuple2!11476 0))(
  ( (tuple2!11477 (_1!6044 Unit!8156) (_2!6044 BitStream!4788)) )
))
(declare-fun lt!204431 () tuple2!11476)

(declare-fun thiss!1634 () BitStream!4788)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132408 (= res!109941 (= (bitIndex!0 (size!2762 (buf!3135 (_2!6044 lt!204431))) (currentByte!5920 (_2!6044 lt!204431)) (currentBit!5915 (_2!6044 lt!204431))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2762 (buf!3135 thiss!1634)) (currentByte!5920 thiss!1634) (currentBit!5915 thiss!1634)))))))

(declare-fun arr!237 () array!6102)

(declare-fun b!132409 () Bool)

(declare-fun lt!204434 () tuple2!11472)

(declare-datatypes ((tuple2!11478 0))(
  ( (tuple2!11479 (_1!6045 BitStream!4788) (_2!6045 (_ BitVec 8))) )
))
(declare-fun lt!204440 () tuple2!11478)

(assert (=> b!132409 (= e!87782 (and (= (_2!6045 lt!204440) (select (arr!3397 arr!237) from!447)) (= (_1!6045 lt!204440) (_2!6042 lt!204434))))))

(declare-fun readBytePure!0 (BitStream!4788) tuple2!11478)

(assert (=> b!132409 (= lt!204440 (readBytePure!0 (_1!6042 lt!204434)))))

(declare-fun reader!0 (BitStream!4788 BitStream!4788) tuple2!11472)

(assert (=> b!132409 (= lt!204434 (reader!0 thiss!1634 (_2!6044 lt!204431)))))

(declare-fun b!132410 () Bool)

(declare-fun e!87780 () Bool)

(declare-fun array_inv!2551 (array!6102) Bool)

(assert (=> b!132410 (= e!87780 (array_inv!2551 (buf!3135 thiss!1634)))))

(declare-fun b!132412 () Bool)

(declare-fun e!87776 () Bool)

(declare-fun lt!204439 () tuple2!11478)

(declare-fun lt!204448 () tuple2!11478)

(assert (=> b!132412 (= e!87776 (= (_2!6045 lt!204439) (_2!6045 lt!204448)))))

(declare-fun e!87784 () Bool)

(declare-fun b!132413 () Bool)

(assert (=> b!132413 (= e!87784 (= (_1!6043 (readByteArrayLoopPure!0 (_1!6042 lt!204436) arr!237 from!447 to!404)) (_2!6042 lt!204436)))))

(declare-fun b!132414 () Bool)

(declare-fun e!87779 () Bool)

(declare-fun e!87777 () Bool)

(assert (=> b!132414 (= e!87779 e!87777)))

(declare-fun res!109936 () Bool)

(assert (=> b!132414 (=> (not res!109936) (not e!87777))))

(declare-fun lt!204429 () tuple2!11476)

(declare-fun lt!204435 () (_ BitVec 64))

(assert (=> b!132414 (= res!109936 (= (bitIndex!0 (size!2762 (buf!3135 (_2!6044 lt!204429))) (currentByte!5920 (_2!6044 lt!204429)) (currentBit!5915 (_2!6044 lt!204429))) (bvadd (bitIndex!0 (size!2762 (buf!3135 (_2!6044 lt!204431))) (currentByte!5920 (_2!6044 lt!204431)) (currentBit!5915 (_2!6044 lt!204431))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!204435))))))

(assert (=> b!132414 (= lt!204435 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun e!87778 () Bool)

(declare-fun lt!204437 () tuple2!11474)

(declare-fun b!132415 () Bool)

(declare-fun arrayRangesEq!165 (array!6102 array!6102 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132415 (= e!87778 (not (arrayRangesEq!165 arr!237 (_2!6043 lt!204437) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132416 () Bool)

(declare-fun e!87774 () Bool)

(assert (=> b!132416 (= e!87774 (not e!87783))))

(declare-fun res!109933 () Bool)

(assert (=> b!132416 (=> res!109933 e!87783)))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132416 (= res!109933 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2762 (buf!3135 (_1!6042 lt!204436)))) ((_ sign_extend 32) (currentByte!5920 (_1!6042 lt!204436))) ((_ sign_extend 32) (currentBit!5915 (_1!6042 lt!204436))) (bvsub to!404 from!447))))))

(declare-fun lt!204427 () tuple2!11474)

(declare-fun lt!204442 () tuple2!11472)

(assert (=> b!132416 (= lt!204427 (readByteArrayLoopPure!0 (_1!6042 lt!204442) lt!204441 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204433 () tuple2!11478)

(assert (=> b!132416 (= lt!204441 (array!6103 (store (arr!3397 arr!237) from!447 (_2!6045 lt!204433)) (size!2762 arr!237)))))

(declare-fun lt!204449 () (_ BitVec 32))

(assert (=> b!132416 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2762 (buf!3135 (_2!6044 lt!204429)))) ((_ sign_extend 32) (currentByte!5920 (_2!6044 lt!204431))) ((_ sign_extend 32) (currentBit!5915 (_2!6044 lt!204431))) lt!204449)))

(declare-fun lt!204428 () Unit!8156)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4788 array!6102 (_ BitVec 32)) Unit!8156)

(assert (=> b!132416 (= lt!204428 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6044 lt!204431) (buf!3135 (_2!6044 lt!204429)) lt!204449))))

(assert (=> b!132416 e!87784))

(declare-fun res!109935 () Bool)

(assert (=> b!132416 (=> (not res!109935) (not e!87784))))

(assert (=> b!132416 (= res!109935 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2762 (buf!3135 (_2!6044 lt!204429)))) ((_ sign_extend 32) (currentByte!5920 thiss!1634)) ((_ sign_extend 32) (currentBit!5915 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!204432 () Unit!8156)

(assert (=> b!132416 (= lt!204432 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3135 (_2!6044 lt!204429)) (bvsub to!404 from!447)))))

(assert (=> b!132416 (= (_2!6045 lt!204433) (select (arr!3397 arr!237) from!447))))

(assert (=> b!132416 (= lt!204433 (readBytePure!0 (_1!6042 lt!204436)))))

(assert (=> b!132416 (= lt!204442 (reader!0 (_2!6044 lt!204431) (_2!6044 lt!204429)))))

(assert (=> b!132416 (= lt!204436 (reader!0 thiss!1634 (_2!6044 lt!204429)))))

(assert (=> b!132416 e!87776))

(declare-fun res!109930 () Bool)

(assert (=> b!132416 (=> (not res!109930) (not e!87776))))

(assert (=> b!132416 (= res!109930 (= (bitIndex!0 (size!2762 (buf!3135 (_1!6045 lt!204439))) (currentByte!5920 (_1!6045 lt!204439)) (currentBit!5915 (_1!6045 lt!204439))) (bitIndex!0 (size!2762 (buf!3135 (_1!6045 lt!204448))) (currentByte!5920 (_1!6045 lt!204448)) (currentBit!5915 (_1!6045 lt!204448)))))))

(declare-fun lt!204430 () Unit!8156)

(declare-fun lt!204445 () BitStream!4788)

(declare-fun readBytePrefixLemma!0 (BitStream!4788 BitStream!4788) Unit!8156)

(assert (=> b!132416 (= lt!204430 (readBytePrefixLemma!0 lt!204445 (_2!6044 lt!204429)))))

(assert (=> b!132416 (= lt!204448 (readBytePure!0 (BitStream!4789 (buf!3135 (_2!6044 lt!204429)) (currentByte!5920 thiss!1634) (currentBit!5915 thiss!1634))))))

(assert (=> b!132416 (= lt!204439 (readBytePure!0 lt!204445))))

(assert (=> b!132416 (= lt!204445 (BitStream!4789 (buf!3135 (_2!6044 lt!204431)) (currentByte!5920 thiss!1634) (currentBit!5915 thiss!1634)))))

(declare-fun e!87785 () Bool)

(assert (=> b!132416 e!87785))

(declare-fun res!109932 () Bool)

(assert (=> b!132416 (=> (not res!109932) (not e!87785))))

(declare-fun isPrefixOf!0 (BitStream!4788 BitStream!4788) Bool)

(assert (=> b!132416 (= res!109932 (isPrefixOf!0 thiss!1634 (_2!6044 lt!204429)))))

(declare-fun lt!204444 () Unit!8156)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4788 BitStream!4788 BitStream!4788) Unit!8156)

(assert (=> b!132416 (= lt!204444 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6044 lt!204431) (_2!6044 lt!204429)))))

(assert (=> b!132416 e!87779))

(declare-fun res!109937 () Bool)

(assert (=> b!132416 (=> (not res!109937) (not e!87779))))

(assert (=> b!132416 (= res!109937 (= (size!2762 (buf!3135 (_2!6044 lt!204431))) (size!2762 (buf!3135 (_2!6044 lt!204429)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4788 array!6102 (_ BitVec 32) (_ BitVec 32)) tuple2!11476)

(assert (=> b!132416 (= lt!204429 (appendByteArrayLoop!0 (_2!6044 lt!204431) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132416 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2762 (buf!3135 (_2!6044 lt!204431)))) ((_ sign_extend 32) (currentByte!5920 (_2!6044 lt!204431))) ((_ sign_extend 32) (currentBit!5915 (_2!6044 lt!204431))) lt!204449)))

(assert (=> b!132416 (= lt!204449 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!204446 () Unit!8156)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4788 BitStream!4788 (_ BitVec 64) (_ BitVec 32)) Unit!8156)

(assert (=> b!132416 (= lt!204446 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6044 lt!204431) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132416 e!87782))

(declare-fun res!109942 () Bool)

(assert (=> b!132416 (=> (not res!109942) (not e!87782))))

(assert (=> b!132416 (= res!109942 (= (size!2762 (buf!3135 thiss!1634)) (size!2762 (buf!3135 (_2!6044 lt!204431)))))))

(declare-fun appendByte!0 (BitStream!4788 (_ BitVec 8)) tuple2!11476)

(assert (=> b!132416 (= lt!204431 (appendByte!0 thiss!1634 (select (arr!3397 arr!237) from!447)))))

(declare-fun b!132417 () Bool)

(declare-fun res!109939 () Bool)

(assert (=> b!132417 (=> (not res!109939) (not e!87774))))

(assert (=> b!132417 (= res!109939 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2762 (buf!3135 thiss!1634))) ((_ sign_extend 32) (currentByte!5920 thiss!1634)) ((_ sign_extend 32) (currentBit!5915 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132418 () Bool)

(assert (=> b!132418 (= e!87777 (not e!87778))))

(declare-fun res!109929 () Bool)

(assert (=> b!132418 (=> res!109929 e!87778)))

(declare-fun lt!204443 () tuple2!11472)

(assert (=> b!132418 (= res!109929 (or (not (= (size!2762 (_2!6043 lt!204437)) (size!2762 arr!237))) (not (= (_1!6043 lt!204437) (_2!6042 lt!204443)))))))

(assert (=> b!132418 (= lt!204437 (readByteArrayLoopPure!0 (_1!6042 lt!204443) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132418 (validate_offset_bits!1 ((_ sign_extend 32) (size!2762 (buf!3135 (_2!6044 lt!204429)))) ((_ sign_extend 32) (currentByte!5920 (_2!6044 lt!204431))) ((_ sign_extend 32) (currentBit!5915 (_2!6044 lt!204431))) lt!204435)))

(declare-fun lt!204447 () Unit!8156)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4788 array!6102 (_ BitVec 64)) Unit!8156)

(assert (=> b!132418 (= lt!204447 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6044 lt!204431) (buf!3135 (_2!6044 lt!204429)) lt!204435))))

(assert (=> b!132418 (= lt!204443 (reader!0 (_2!6044 lt!204431) (_2!6044 lt!204429)))))

(declare-fun b!132419 () Bool)

(declare-fun res!109934 () Bool)

(assert (=> b!132419 (=> (not res!109934) (not e!87774))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132419 (= res!109934 (invariant!0 (currentBit!5915 thiss!1634) (currentByte!5920 thiss!1634) (size!2762 (buf!3135 thiss!1634))))))

(declare-fun b!132420 () Bool)

(declare-fun res!109928 () Bool)

(assert (=> b!132420 (=> (not res!109928) (not e!87777))))

(assert (=> b!132420 (= res!109928 (isPrefixOf!0 (_2!6044 lt!204431) (_2!6044 lt!204429)))))

(declare-fun b!132421 () Bool)

(declare-fun res!109931 () Bool)

(assert (=> b!132421 (=> (not res!109931) (not e!87782))))

(assert (=> b!132421 (= res!109931 (isPrefixOf!0 thiss!1634 (_2!6044 lt!204431)))))

(declare-fun b!132422 () Bool)

(assert (=> b!132422 (= e!87785 (invariant!0 (currentBit!5915 thiss!1634) (currentByte!5920 thiss!1634) (size!2762 (buf!3135 (_2!6044 lt!204431)))))))

(declare-fun res!109940 () Bool)

(assert (=> start!25932 (=> (not res!109940) (not e!87774))))

(assert (=> start!25932 (= res!109940 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2762 arr!237))))))

(assert (=> start!25932 e!87774))

(assert (=> start!25932 true))

(assert (=> start!25932 (array_inv!2551 arr!237)))

(declare-fun inv!12 (BitStream!4788) Bool)

(assert (=> start!25932 (and (inv!12 thiss!1634) e!87780)))

(declare-fun b!132411 () Bool)

(declare-fun res!109938 () Bool)

(assert (=> b!132411 (=> (not res!109938) (not e!87774))))

(assert (=> b!132411 (= res!109938 (bvslt from!447 to!404))))

(assert (= (and start!25932 res!109940) b!132417))

(assert (= (and b!132417 res!109939) b!132411))

(assert (= (and b!132411 res!109938) b!132419))

(assert (= (and b!132419 res!109934) b!132416))

(assert (= (and b!132416 res!109942) b!132408))

(assert (= (and b!132408 res!109941) b!132421))

(assert (= (and b!132421 res!109931) b!132409))

(assert (= (and b!132416 res!109937) b!132414))

(assert (= (and b!132414 res!109936) b!132420))

(assert (= (and b!132420 res!109928) b!132418))

(assert (= (and b!132418 (not res!109929)) b!132415))

(assert (= (and b!132416 res!109932) b!132422))

(assert (= (and b!132416 res!109930) b!132412))

(assert (= (and b!132416 res!109935) b!132413))

(assert (= (and b!132416 (not res!109933)) b!132407))

(assert (= start!25932 b!132410))

(declare-fun m!200035 () Bool)

(assert (=> b!132407 m!200035))

(assert (=> b!132407 m!200035))

(declare-fun m!200037 () Bool)

(assert (=> b!132407 m!200037))

(declare-fun m!200039 () Bool)

(assert (=> b!132416 m!200039))

(declare-fun m!200041 () Bool)

(assert (=> b!132416 m!200041))

(declare-fun m!200043 () Bool)

(assert (=> b!132416 m!200043))

(declare-fun m!200045 () Bool)

(assert (=> b!132416 m!200045))

(declare-fun m!200047 () Bool)

(assert (=> b!132416 m!200047))

(declare-fun m!200049 () Bool)

(assert (=> b!132416 m!200049))

(declare-fun m!200051 () Bool)

(assert (=> b!132416 m!200051))

(declare-fun m!200053 () Bool)

(assert (=> b!132416 m!200053))

(declare-fun m!200055 () Bool)

(assert (=> b!132416 m!200055))

(declare-fun m!200057 () Bool)

(assert (=> b!132416 m!200057))

(declare-fun m!200059 () Bool)

(assert (=> b!132416 m!200059))

(declare-fun m!200061 () Bool)

(assert (=> b!132416 m!200061))

(declare-fun m!200063 () Bool)

(assert (=> b!132416 m!200063))

(declare-fun m!200065 () Bool)

(assert (=> b!132416 m!200065))

(declare-fun m!200067 () Bool)

(assert (=> b!132416 m!200067))

(declare-fun m!200069 () Bool)

(assert (=> b!132416 m!200069))

(declare-fun m!200071 () Bool)

(assert (=> b!132416 m!200071))

(declare-fun m!200073 () Bool)

(assert (=> b!132416 m!200073))

(declare-fun m!200075 () Bool)

(assert (=> b!132416 m!200075))

(declare-fun m!200077 () Bool)

(assert (=> b!132416 m!200077))

(declare-fun m!200079 () Bool)

(assert (=> b!132416 m!200079))

(declare-fun m!200081 () Bool)

(assert (=> b!132416 m!200081))

(assert (=> b!132416 m!200053))

(declare-fun m!200083 () Bool)

(assert (=> b!132418 m!200083))

(declare-fun m!200085 () Bool)

(assert (=> b!132418 m!200085))

(declare-fun m!200087 () Bool)

(assert (=> b!132418 m!200087))

(assert (=> b!132418 m!200069))

(declare-fun m!200089 () Bool)

(assert (=> start!25932 m!200089))

(declare-fun m!200091 () Bool)

(assert (=> start!25932 m!200091))

(declare-fun m!200093 () Bool)

(assert (=> b!132413 m!200093))

(declare-fun m!200095 () Bool)

(assert (=> b!132419 m!200095))

(declare-fun m!200097 () Bool)

(assert (=> b!132421 m!200097))

(declare-fun m!200099 () Bool)

(assert (=> b!132414 m!200099))

(declare-fun m!200101 () Bool)

(assert (=> b!132414 m!200101))

(declare-fun m!200103 () Bool)

(assert (=> b!132417 m!200103))

(assert (=> b!132409 m!200053))

(declare-fun m!200105 () Bool)

(assert (=> b!132409 m!200105))

(declare-fun m!200107 () Bool)

(assert (=> b!132409 m!200107))

(declare-fun m!200109 () Bool)

(assert (=> b!132415 m!200109))

(declare-fun m!200111 () Bool)

(assert (=> b!132422 m!200111))

(declare-fun m!200113 () Bool)

(assert (=> b!132420 m!200113))

(declare-fun m!200115 () Bool)

(assert (=> b!132410 m!200115))

(assert (=> b!132408 m!200101))

(declare-fun m!200117 () Bool)

(assert (=> b!132408 m!200117))

(check-sat (not b!132422) (not b!132414) (not b!132410) (not b!132415) (not b!132408) (not b!132418) (not b!132420) (not b!132409) (not start!25932) (not b!132413) (not b!132421) (not b!132407) (not b!132416) (not b!132419) (not b!132417))
