; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43976 () Bool)

(assert start!43976)

(declare-fun b!209545 () Bool)

(declare-fun e!143045 () Bool)

(declare-fun e!143036 () Bool)

(assert (=> b!209545 (= e!143045 (not e!143036))))

(declare-fun res!175921 () Bool)

(assert (=> b!209545 (=> res!175921 e!143036)))

(declare-fun lt!328075 () (_ BitVec 64))

(declare-fun lt!328082 () (_ BitVec 64))

(assert (=> b!209545 (= res!175921 (not (= lt!328075 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!328082))))))

(declare-datatypes ((array!10474 0))(
  ( (array!10475 (arr!5534 (Array (_ BitVec 32) (_ BitVec 8))) (size!4604 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8316 0))(
  ( (BitStream!8317 (buf!5118 array!10474) (currentByte!9654 (_ BitVec 32)) (currentBit!9649 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14919 0))(
  ( (Unit!14920) )
))
(declare-datatypes ((tuple2!17974 0))(
  ( (tuple2!17975 (_1!9642 Unit!14919) (_2!9642 BitStream!8316)) )
))
(declare-fun lt!328070 () tuple2!17974)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209545 (= lt!328075 (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))))))

(declare-fun thiss!1204 () BitStream!8316)

(assert (=> b!209545 (= lt!328082 (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)))))

(declare-fun e!143037 () Bool)

(assert (=> b!209545 e!143037))

(declare-fun res!175916 () Bool)

(assert (=> b!209545 (=> (not res!175916) (not e!143037))))

(assert (=> b!209545 (= res!175916 (= (size!4604 (buf!5118 thiss!1204)) (size!4604 (buf!5118 (_2!9642 lt!328070)))))))

(declare-fun lt!328060 () Bool)

(declare-fun appendBit!0 (BitStream!8316 Bool) tuple2!17974)

(assert (=> b!209545 (= lt!328070 (appendBit!0 thiss!1204 lt!328060))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!328066 () (_ BitVec 64))

(assert (=> b!209545 (= lt!328060 (not (= (bvand v!189 lt!328066) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!209545 (= lt!328066 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!209546 () Bool)

(declare-fun e!143035 () Bool)

(declare-fun e!143038 () Bool)

(assert (=> b!209546 (= e!143035 e!143038)))

(declare-fun res!175924 () Bool)

(assert (=> b!209546 (=> res!175924 e!143038)))

(declare-datatypes ((tuple2!17976 0))(
  ( (tuple2!17977 (_1!9643 BitStream!8316) (_2!9643 BitStream!8316)) )
))
(declare-fun lt!328056 () tuple2!17976)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!328072 () (_ BitVec 64))

(declare-datatypes ((tuple2!17978 0))(
  ( (tuple2!17979 (_1!9644 BitStream!8316) (_2!9644 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17978)

(assert (=> b!209546 (= res!175924 (not (= (_1!9644 (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!328056) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328072)) (_2!9643 lt!328056))))))

(declare-fun lt!328059 () tuple2!17974)

(declare-fun lt!328061 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209546 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070))) lt!328061)))

(declare-fun lt!328055 () Unit!14919)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8316 array!10474 (_ BitVec 64)) Unit!14919)

(assert (=> b!209546 (= lt!328055 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9642 lt!328070) (buf!5118 (_2!9642 lt!328059)) lt!328061))))

(assert (=> b!209546 (= lt!328061 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!328065 () (_ BitVec 64))

(declare-datatypes ((tuple2!17980 0))(
  ( (tuple2!17981 (_1!9645 BitStream!8316) (_2!9645 Bool)) )
))
(declare-fun lt!328057 () tuple2!17980)

(assert (=> b!209546 (= lt!328072 (bvor lt!328065 (ite (_2!9645 lt!328057) lt!328066 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!328074 () tuple2!17978)

(declare-fun lt!328076 () tuple2!17976)

(assert (=> b!209546 (= lt!328074 (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!328076) nBits!348 i!590 lt!328065))))

(declare-fun lt!328080 () (_ BitVec 64))

(assert (=> b!209546 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))) ((_ sign_extend 32) (currentByte!9654 thiss!1204)) ((_ sign_extend 32) (currentBit!9649 thiss!1204)) lt!328080)))

(declare-fun lt!328073 () Unit!14919)

(assert (=> b!209546 (= lt!328073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5118 (_2!9642 lt!328059)) lt!328080))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209546 (= lt!328065 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!209546 (= (_2!9645 lt!328057) lt!328060)))

(declare-fun readBitPure!0 (BitStream!8316) tuple2!17980)

(assert (=> b!209546 (= lt!328057 (readBitPure!0 (_1!9643 lt!328076)))))

(declare-fun reader!0 (BitStream!8316 BitStream!8316) tuple2!17976)

(assert (=> b!209546 (= lt!328056 (reader!0 (_2!9642 lt!328070) (_2!9642 lt!328059)))))

(assert (=> b!209546 (= lt!328076 (reader!0 thiss!1204 (_2!9642 lt!328059)))))

(declare-fun e!143044 () Bool)

(assert (=> b!209546 e!143044))

(declare-fun res!175913 () Bool)

(assert (=> b!209546 (=> (not res!175913) (not e!143044))))

(declare-fun lt!328079 () tuple2!17980)

(declare-fun lt!328081 () tuple2!17980)

(assert (=> b!209546 (= res!175913 (= (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!328079))) (currentByte!9654 (_1!9645 lt!328079)) (currentBit!9649 (_1!9645 lt!328079))) (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!328081))) (currentByte!9654 (_1!9645 lt!328081)) (currentBit!9649 (_1!9645 lt!328081)))))))

(declare-fun lt!328068 () Unit!14919)

(declare-fun lt!328062 () BitStream!8316)

(declare-fun readBitPrefixLemma!0 (BitStream!8316 BitStream!8316) Unit!14919)

(assert (=> b!209546 (= lt!328068 (readBitPrefixLemma!0 lt!328062 (_2!9642 lt!328059)))))

(assert (=> b!209546 (= lt!328081 (readBitPure!0 (BitStream!8317 (buf!5118 (_2!9642 lt!328059)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204))))))

(assert (=> b!209546 (= lt!328079 (readBitPure!0 lt!328062))))

(declare-fun e!143046 () Bool)

(assert (=> b!209546 e!143046))

(declare-fun res!175910 () Bool)

(assert (=> b!209546 (=> (not res!175910) (not e!143046))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!209546 (= res!175910 (invariant!0 (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204) (size!4604 (buf!5118 (_2!9642 lt!328070)))))))

(assert (=> b!209546 (= lt!328062 (BitStream!8317 (buf!5118 (_2!9642 lt!328070)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)))))

(declare-fun b!209547 () Bool)

(declare-fun res!175923 () Bool)

(assert (=> b!209547 (=> res!175923 e!143035)))

(declare-fun isPrefixOf!0 (BitStream!8316 BitStream!8316) Bool)

(assert (=> b!209547 (= res!175923 (not (isPrefixOf!0 thiss!1204 (_2!9642 lt!328070))))))

(declare-fun res!175912 () Bool)

(declare-fun e!143043 () Bool)

(assert (=> start!43976 (=> (not res!175912) (not e!143043))))

(assert (=> start!43976 (= res!175912 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43976 e!143043))

(assert (=> start!43976 true))

(declare-fun e!143040 () Bool)

(declare-fun inv!12 (BitStream!8316) Bool)

(assert (=> start!43976 (and (inv!12 thiss!1204) e!143040)))

(declare-fun b!209548 () Bool)

(declare-fun e!143041 () Bool)

(declare-fun e!143042 () Bool)

(assert (=> b!209548 (= e!143041 e!143042)))

(declare-fun res!175925 () Bool)

(assert (=> b!209548 (=> (not res!175925) (not e!143042))))

(declare-fun lt!328064 () tuple2!17980)

(assert (=> b!209548 (= res!175925 (and (= (_2!9645 lt!328064) lt!328060) (= (_1!9645 lt!328064) (_2!9642 lt!328070))))))

(declare-fun readerFrom!0 (BitStream!8316 (_ BitVec 32) (_ BitVec 32)) BitStream!8316)

(assert (=> b!209548 (= lt!328064 (readBitPure!0 (readerFrom!0 (_2!9642 lt!328070) (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204))))))

(declare-fun b!209549 () Bool)

(assert (=> b!209549 (= e!143046 (invariant!0 (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204) (size!4604 (buf!5118 (_2!9642 lt!328059)))))))

(declare-fun b!209550 () Bool)

(assert (=> b!209550 (= e!143037 e!143041)))

(declare-fun res!175920 () Bool)

(assert (=> b!209550 (=> (not res!175920) (not e!143041))))

(declare-fun lt!328058 () (_ BitVec 64))

(declare-fun lt!328077 () (_ BitVec 64))

(assert (=> b!209550 (= res!175920 (= lt!328058 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!328077)))))

(assert (=> b!209550 (= lt!328058 (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))))))

(assert (=> b!209550 (= lt!328077 (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)))))

(declare-fun b!209551 () Bool)

(assert (=> b!209551 (= e!143044 (= (_2!9645 lt!328079) (_2!9645 lt!328081)))))

(declare-fun b!209552 () Bool)

(declare-fun array_inv!4345 (array!10474) Bool)

(assert (=> b!209552 (= e!143040 (array_inv!4345 (buf!5118 thiss!1204)))))

(declare-fun b!209553 () Bool)

(assert (=> b!209553 (= e!143036 e!143035)))

(declare-fun res!175914 () Bool)

(assert (=> b!209553 (=> res!175914 e!143035)))

(declare-fun lt!328071 () (_ BitVec 64))

(assert (=> b!209553 (= res!175914 (not (= lt!328071 (bvsub (bvsub (bvadd lt!328075 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!209553 (= lt!328071 (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328059))) (currentByte!9654 (_2!9642 lt!328059)) (currentBit!9649 (_2!9642 lt!328059))))))

(assert (=> b!209553 (isPrefixOf!0 thiss!1204 (_2!9642 lt!328059))))

(declare-fun lt!328067 () Unit!14919)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8316 BitStream!8316 BitStream!8316) Unit!14919)

(assert (=> b!209553 (= lt!328067 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9642 lt!328070) (_2!9642 lt!328059)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8316 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17974)

(assert (=> b!209553 (= lt!328059 (appendBitsLSBFirstLoopTR!0 (_2!9642 lt!328070) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!209554 () Bool)

(declare-fun res!175911 () Bool)

(assert (=> b!209554 (=> res!175911 e!143035)))

(assert (=> b!209554 (= res!175911 (not (invariant!0 (currentBit!9649 (_2!9642 lt!328059)) (currentByte!9654 (_2!9642 lt!328059)) (size!4604 (buf!5118 (_2!9642 lt!328059))))))))

(declare-fun b!209555 () Bool)

(declare-fun lt!328063 () (_ BitVec 64))

(assert (=> b!209555 (= e!143038 (or (= lt!328063 (bvand lt!328071 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!328063 (bvand (bvsub lt!328082 lt!328071) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209555 (= lt!328063 (bvand lt!328082 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!328069 () tuple2!17978)

(assert (=> b!209555 (and (= (_2!9644 lt!328074) (_2!9644 lt!328069)) (= (_1!9644 lt!328074) (_1!9644 lt!328069)))))

(declare-fun lt!328078 () Unit!14919)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14919)

(assert (=> b!209555 (= lt!328078 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9643 lt!328076) nBits!348 i!590 lt!328065))))

(declare-fun withMovedBitIndex!0 (BitStream!8316 (_ BitVec 64)) BitStream!8316)

(assert (=> b!209555 (= lt!328069 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9643 lt!328076) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328072))))

(declare-fun b!209556 () Bool)

(assert (=> b!209556 (= e!143043 e!143045)))

(declare-fun res!175922 () Bool)

(assert (=> b!209556 (=> (not res!175922) (not e!143045))))

(assert (=> b!209556 (= res!175922 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 thiss!1204))) ((_ sign_extend 32) (currentByte!9654 thiss!1204)) ((_ sign_extend 32) (currentBit!9649 thiss!1204)) lt!328080))))

(assert (=> b!209556 (= lt!328080 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!209557 () Bool)

(declare-fun res!175919 () Bool)

(assert (=> b!209557 (=> res!175919 e!143035)))

(assert (=> b!209557 (= res!175919 (not (isPrefixOf!0 (_2!9642 lt!328070) (_2!9642 lt!328059))))))

(declare-fun b!209558 () Bool)

(declare-fun res!175915 () Bool)

(assert (=> b!209558 (=> (not res!175915) (not e!143045))))

(assert (=> b!209558 (= res!175915 (invariant!0 (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204) (size!4604 (buf!5118 thiss!1204))))))

(declare-fun b!209559 () Bool)

(declare-fun res!175918 () Bool)

(assert (=> b!209559 (=> (not res!175918) (not e!143045))))

(assert (=> b!209559 (= res!175918 (not (= i!590 nBits!348)))))

(declare-fun b!209560 () Bool)

(assert (=> b!209560 (= e!143042 (= (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!328064))) (currentByte!9654 (_1!9645 lt!328064)) (currentBit!9649 (_1!9645 lt!328064))) lt!328058))))

(declare-fun b!209561 () Bool)

(declare-fun res!175909 () Bool)

(assert (=> b!209561 (=> res!175909 e!143035)))

(assert (=> b!209561 (= res!175909 (or (not (= (size!4604 (buf!5118 (_2!9642 lt!328059))) (size!4604 (buf!5118 thiss!1204)))) (not (= lt!328071 (bvsub (bvadd lt!328082 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!209562 () Bool)

(declare-fun res!175917 () Bool)

(assert (=> b!209562 (=> (not res!175917) (not e!143041))))

(assert (=> b!209562 (= res!175917 (isPrefixOf!0 thiss!1204 (_2!9642 lt!328070)))))

(assert (= (and start!43976 res!175912) b!209556))

(assert (= (and b!209556 res!175922) b!209558))

(assert (= (and b!209558 res!175915) b!209559))

(assert (= (and b!209559 res!175918) b!209545))

(assert (= (and b!209545 res!175916) b!209550))

(assert (= (and b!209550 res!175920) b!209562))

(assert (= (and b!209562 res!175917) b!209548))

(assert (= (and b!209548 res!175925) b!209560))

(assert (= (and b!209545 (not res!175921)) b!209553))

(assert (= (and b!209553 (not res!175914)) b!209554))

(assert (= (and b!209554 (not res!175911)) b!209561))

(assert (= (and b!209561 (not res!175909)) b!209557))

(assert (= (and b!209557 (not res!175919)) b!209547))

(assert (= (and b!209547 (not res!175923)) b!209546))

(assert (= (and b!209546 res!175910) b!209549))

(assert (= (and b!209546 res!175913) b!209551))

(assert (= (and b!209546 (not res!175924)) b!209555))

(assert (= start!43976 b!209552))

(declare-fun m!322433 () Bool)

(assert (=> b!209552 m!322433))

(declare-fun m!322435 () Bool)

(assert (=> b!209548 m!322435))

(assert (=> b!209548 m!322435))

(declare-fun m!322437 () Bool)

(assert (=> b!209548 m!322437))

(declare-fun m!322439 () Bool)

(assert (=> b!209545 m!322439))

(declare-fun m!322441 () Bool)

(assert (=> b!209545 m!322441))

(declare-fun m!322443 () Bool)

(assert (=> b!209545 m!322443))

(declare-fun m!322445 () Bool)

(assert (=> b!209554 m!322445))

(declare-fun m!322447 () Bool)

(assert (=> b!209562 m!322447))

(declare-fun m!322449 () Bool)

(assert (=> b!209558 m!322449))

(declare-fun m!322451 () Bool)

(assert (=> b!209546 m!322451))

(declare-fun m!322453 () Bool)

(assert (=> b!209546 m!322453))

(declare-fun m!322455 () Bool)

(assert (=> b!209546 m!322455))

(declare-fun m!322457 () Bool)

(assert (=> b!209546 m!322457))

(declare-fun m!322459 () Bool)

(assert (=> b!209546 m!322459))

(declare-fun m!322461 () Bool)

(assert (=> b!209546 m!322461))

(declare-fun m!322463 () Bool)

(assert (=> b!209546 m!322463))

(declare-fun m!322465 () Bool)

(assert (=> b!209546 m!322465))

(declare-fun m!322467 () Bool)

(assert (=> b!209546 m!322467))

(declare-fun m!322469 () Bool)

(assert (=> b!209546 m!322469))

(declare-fun m!322471 () Bool)

(assert (=> b!209546 m!322471))

(declare-fun m!322473 () Bool)

(assert (=> b!209546 m!322473))

(declare-fun m!322475 () Bool)

(assert (=> b!209546 m!322475))

(declare-fun m!322477 () Bool)

(assert (=> b!209546 m!322477))

(declare-fun m!322479 () Bool)

(assert (=> b!209546 m!322479))

(declare-fun m!322481 () Bool)

(assert (=> b!209546 m!322481))

(assert (=> b!209547 m!322447))

(declare-fun m!322483 () Bool)

(assert (=> start!43976 m!322483))

(declare-fun m!322485 () Bool)

(assert (=> b!209556 m!322485))

(declare-fun m!322487 () Bool)

(assert (=> b!209555 m!322487))

(declare-fun m!322489 () Bool)

(assert (=> b!209555 m!322489))

(assert (=> b!209555 m!322489))

(declare-fun m!322491 () Bool)

(assert (=> b!209555 m!322491))

(declare-fun m!322493 () Bool)

(assert (=> b!209557 m!322493))

(assert (=> b!209550 m!322439))

(assert (=> b!209550 m!322441))

(declare-fun m!322495 () Bool)

(assert (=> b!209553 m!322495))

(declare-fun m!322497 () Bool)

(assert (=> b!209553 m!322497))

(declare-fun m!322499 () Bool)

(assert (=> b!209553 m!322499))

(declare-fun m!322501 () Bool)

(assert (=> b!209553 m!322501))

(declare-fun m!322503 () Bool)

(assert (=> b!209560 m!322503))

(declare-fun m!322505 () Bool)

(assert (=> b!209549 m!322505))

(check-sat (not b!209558) (not b!209552) (not b!209555) (not b!209557) (not b!209549) (not b!209556) (not b!209550) (not b!209560) (not b!209554) (not b!209553) (not b!209562) (not b!209547) (not b!209545) (not b!209548) (not b!209546) (not start!43976))
(check-sat)
(get-model)

(declare-fun d!70897 () Bool)

(declare-fun res!176079 () Bool)

(declare-fun e!143146 () Bool)

(assert (=> d!70897 (=> (not res!176079) (not e!143146))))

(assert (=> d!70897 (= res!176079 (= (size!4604 (buf!5118 (_2!9642 lt!328070))) (size!4604 (buf!5118 (_2!9642 lt!328059)))))))

(assert (=> d!70897 (= (isPrefixOf!0 (_2!9642 lt!328070) (_2!9642 lt!328059)) e!143146)))

(declare-fun b!209728 () Bool)

(declare-fun res!176080 () Bool)

(assert (=> b!209728 (=> (not res!176080) (not e!143146))))

(assert (=> b!209728 (= res!176080 (bvsle (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))) (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328059))) (currentByte!9654 (_2!9642 lt!328059)) (currentBit!9649 (_2!9642 lt!328059)))))))

(declare-fun b!209729 () Bool)

(declare-fun e!143145 () Bool)

(assert (=> b!209729 (= e!143146 e!143145)))

(declare-fun res!176081 () Bool)

(assert (=> b!209729 (=> res!176081 e!143145)))

(assert (=> b!209729 (= res!176081 (= (size!4604 (buf!5118 (_2!9642 lt!328070))) #b00000000000000000000000000000000))))

(declare-fun b!209730 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10474 array!10474 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209730 (= e!143145 (arrayBitRangesEq!0 (buf!5118 (_2!9642 lt!328070)) (buf!5118 (_2!9642 lt!328059)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070)))))))

(assert (= (and d!70897 res!176079) b!209728))

(assert (= (and b!209728 res!176080) b!209729))

(assert (= (and b!209729 (not res!176081)) b!209730))

(assert (=> b!209728 m!322439))

(assert (=> b!209728 m!322495))

(assert (=> b!209730 m!322439))

(assert (=> b!209730 m!322439))

(declare-fun m!322749 () Bool)

(assert (=> b!209730 m!322749))

(assert (=> b!209557 d!70897))

(declare-fun d!70899 () Bool)

(declare-datatypes ((tuple2!17998 0))(
  ( (tuple2!17999 (_1!9654 Bool) (_2!9654 BitStream!8316)) )
))
(declare-fun lt!328408 () tuple2!17998)

(declare-fun readBit!0 (BitStream!8316) tuple2!17998)

(assert (=> d!70899 (= lt!328408 (readBit!0 (_1!9643 lt!328076)))))

(assert (=> d!70899 (= (readBitPure!0 (_1!9643 lt!328076)) (tuple2!17981 (_2!9654 lt!328408) (_1!9654 lt!328408)))))

(declare-fun bs!17414 () Bool)

(assert (= bs!17414 d!70899))

(declare-fun m!322751 () Bool)

(assert (=> bs!17414 m!322751))

(assert (=> b!209546 d!70899))

(declare-fun d!70901 () Bool)

(assert (=> d!70901 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))) ((_ sign_extend 32) (currentByte!9654 thiss!1204)) ((_ sign_extend 32) (currentBit!9649 thiss!1204)) lt!328080)))

(declare-fun lt!328411 () Unit!14919)

(declare-fun choose!9 (BitStream!8316 array!10474 (_ BitVec 64) BitStream!8316) Unit!14919)

(assert (=> d!70901 (= lt!328411 (choose!9 thiss!1204 (buf!5118 (_2!9642 lt!328059)) lt!328080 (BitStream!8317 (buf!5118 (_2!9642 lt!328059)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204))))))

(assert (=> d!70901 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5118 (_2!9642 lt!328059)) lt!328080) lt!328411)))

(declare-fun bs!17415 () Bool)

(assert (= bs!17415 d!70901))

(assert (=> bs!17415 m!322465))

(declare-fun m!322753 () Bool)

(assert (=> bs!17415 m!322753))

(assert (=> b!209546 d!70901))

(declare-fun d!70903 () Bool)

(assert (=> d!70903 (= (invariant!0 (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204) (size!4604 (buf!5118 (_2!9642 lt!328070)))) (and (bvsge (currentBit!9649 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9649 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9654 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9654 thiss!1204) (size!4604 (buf!5118 (_2!9642 lt!328070)))) (and (= (currentBit!9649 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9654 thiss!1204) (size!4604 (buf!5118 (_2!9642 lt!328070))))))))))

(assert (=> b!209546 d!70903))

(declare-datatypes ((tuple2!18000 0))(
  ( (tuple2!18001 (_1!9655 (_ BitVec 64)) (_2!9655 BitStream!8316)) )
))
(declare-fun lt!328414 () tuple2!18000)

(declare-fun d!70905 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18000)

(assert (=> d!70905 (= lt!328414 (readNBitsLSBFirstsLoop!0 (_1!9643 lt!328056) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328072))))

(assert (=> d!70905 (= (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!328056) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328072) (tuple2!17979 (_2!9655 lt!328414) (_1!9655 lt!328414)))))

(declare-fun bs!17416 () Bool)

(assert (= bs!17416 d!70905))

(declare-fun m!322755 () Bool)

(assert (=> bs!17416 m!322755))

(assert (=> b!209546 d!70905))

(declare-fun d!70907 () Bool)

(declare-fun e!143151 () Bool)

(assert (=> d!70907 e!143151))

(declare-fun res!176089 () Bool)

(assert (=> d!70907 (=> (not res!176089) (not e!143151))))

(declare-fun lt!328459 () tuple2!17976)

(assert (=> d!70907 (= res!176089 (isPrefixOf!0 (_1!9643 lt!328459) (_2!9643 lt!328459)))))

(declare-fun lt!328457 () BitStream!8316)

(assert (=> d!70907 (= lt!328459 (tuple2!17977 lt!328457 (_2!9642 lt!328059)))))

(declare-fun lt!328469 () Unit!14919)

(declare-fun lt!328472 () Unit!14919)

(assert (=> d!70907 (= lt!328469 lt!328472)))

(assert (=> d!70907 (isPrefixOf!0 lt!328457 (_2!9642 lt!328059))))

(assert (=> d!70907 (= lt!328472 (lemmaIsPrefixTransitive!0 lt!328457 (_2!9642 lt!328059) (_2!9642 lt!328059)))))

(declare-fun lt!328474 () Unit!14919)

(declare-fun lt!328473 () Unit!14919)

(assert (=> d!70907 (= lt!328474 lt!328473)))

(assert (=> d!70907 (isPrefixOf!0 lt!328457 (_2!9642 lt!328059))))

(assert (=> d!70907 (= lt!328473 (lemmaIsPrefixTransitive!0 lt!328457 (_2!9642 lt!328070) (_2!9642 lt!328059)))))

(declare-fun lt!328466 () Unit!14919)

(declare-fun e!143152 () Unit!14919)

(assert (=> d!70907 (= lt!328466 e!143152)))

(declare-fun c!10305 () Bool)

(assert (=> d!70907 (= c!10305 (not (= (size!4604 (buf!5118 (_2!9642 lt!328070))) #b00000000000000000000000000000000)))))

(declare-fun lt!328460 () Unit!14919)

(declare-fun lt!328456 () Unit!14919)

(assert (=> d!70907 (= lt!328460 lt!328456)))

(assert (=> d!70907 (isPrefixOf!0 (_2!9642 lt!328059) (_2!9642 lt!328059))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8316) Unit!14919)

(assert (=> d!70907 (= lt!328456 (lemmaIsPrefixRefl!0 (_2!9642 lt!328059)))))

(declare-fun lt!328458 () Unit!14919)

(declare-fun lt!328467 () Unit!14919)

(assert (=> d!70907 (= lt!328458 lt!328467)))

(assert (=> d!70907 (= lt!328467 (lemmaIsPrefixRefl!0 (_2!9642 lt!328059)))))

(declare-fun lt!328468 () Unit!14919)

(declare-fun lt!328464 () Unit!14919)

(assert (=> d!70907 (= lt!328468 lt!328464)))

(assert (=> d!70907 (isPrefixOf!0 lt!328457 lt!328457)))

(assert (=> d!70907 (= lt!328464 (lemmaIsPrefixRefl!0 lt!328457))))

(declare-fun lt!328471 () Unit!14919)

(declare-fun lt!328463 () Unit!14919)

(assert (=> d!70907 (= lt!328471 lt!328463)))

(assert (=> d!70907 (isPrefixOf!0 (_2!9642 lt!328070) (_2!9642 lt!328070))))

(assert (=> d!70907 (= lt!328463 (lemmaIsPrefixRefl!0 (_2!9642 lt!328070)))))

(assert (=> d!70907 (= lt!328457 (BitStream!8317 (buf!5118 (_2!9642 lt!328059)) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))))))

(assert (=> d!70907 (isPrefixOf!0 (_2!9642 lt!328070) (_2!9642 lt!328059))))

(assert (=> d!70907 (= (reader!0 (_2!9642 lt!328070) (_2!9642 lt!328059)) lt!328459)))

(declare-fun b!209741 () Bool)

(declare-fun lt!328465 () Unit!14919)

(assert (=> b!209741 (= e!143152 lt!328465)))

(declare-fun lt!328461 () (_ BitVec 64))

(assert (=> b!209741 (= lt!328461 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!328462 () (_ BitVec 64))

(assert (=> b!209741 (= lt!328462 (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10474 array!10474 (_ BitVec 64) (_ BitVec 64)) Unit!14919)

(assert (=> b!209741 (= lt!328465 (arrayBitRangesEqSymmetric!0 (buf!5118 (_2!9642 lt!328070)) (buf!5118 (_2!9642 lt!328059)) lt!328461 lt!328462))))

(assert (=> b!209741 (arrayBitRangesEq!0 (buf!5118 (_2!9642 lt!328059)) (buf!5118 (_2!9642 lt!328070)) lt!328461 lt!328462)))

(declare-fun lt!328455 () (_ BitVec 64))

(declare-fun b!209742 () Bool)

(declare-fun lt!328470 () (_ BitVec 64))

(assert (=> b!209742 (= e!143151 (= (_1!9643 lt!328459) (withMovedBitIndex!0 (_2!9643 lt!328459) (bvsub lt!328470 lt!328455))))))

(assert (=> b!209742 (or (= (bvand lt!328470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328455 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328470 lt!328455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209742 (= lt!328455 (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328059))) (currentByte!9654 (_2!9642 lt!328059)) (currentBit!9649 (_2!9642 lt!328059))))))

(assert (=> b!209742 (= lt!328470 (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))))))

(declare-fun b!209743 () Bool)

(declare-fun res!176090 () Bool)

(assert (=> b!209743 (=> (not res!176090) (not e!143151))))

(assert (=> b!209743 (= res!176090 (isPrefixOf!0 (_2!9643 lt!328459) (_2!9642 lt!328059)))))

(declare-fun b!209744 () Bool)

(declare-fun res!176088 () Bool)

(assert (=> b!209744 (=> (not res!176088) (not e!143151))))

(assert (=> b!209744 (= res!176088 (isPrefixOf!0 (_1!9643 lt!328459) (_2!9642 lt!328070)))))

(declare-fun b!209745 () Bool)

(declare-fun Unit!14949 () Unit!14919)

(assert (=> b!209745 (= e!143152 Unit!14949)))

(assert (= (and d!70907 c!10305) b!209741))

(assert (= (and d!70907 (not c!10305)) b!209745))

(assert (= (and d!70907 res!176089) b!209744))

(assert (= (and b!209744 res!176088) b!209743))

(assert (= (and b!209743 res!176090) b!209742))

(declare-fun m!322757 () Bool)

(assert (=> b!209744 m!322757))

(assert (=> d!70907 m!322493))

(declare-fun m!322759 () Bool)

(assert (=> d!70907 m!322759))

(declare-fun m!322761 () Bool)

(assert (=> d!70907 m!322761))

(declare-fun m!322763 () Bool)

(assert (=> d!70907 m!322763))

(declare-fun m!322765 () Bool)

(assert (=> d!70907 m!322765))

(declare-fun m!322767 () Bool)

(assert (=> d!70907 m!322767))

(declare-fun m!322769 () Bool)

(assert (=> d!70907 m!322769))

(declare-fun m!322771 () Bool)

(assert (=> d!70907 m!322771))

(declare-fun m!322773 () Bool)

(assert (=> d!70907 m!322773))

(declare-fun m!322775 () Bool)

(assert (=> d!70907 m!322775))

(declare-fun m!322777 () Bool)

(assert (=> d!70907 m!322777))

(declare-fun m!322779 () Bool)

(assert (=> b!209743 m!322779))

(assert (=> b!209741 m!322439))

(declare-fun m!322781 () Bool)

(assert (=> b!209741 m!322781))

(declare-fun m!322783 () Bool)

(assert (=> b!209741 m!322783))

(declare-fun m!322785 () Bool)

(assert (=> b!209742 m!322785))

(assert (=> b!209742 m!322495))

(assert (=> b!209742 m!322439))

(assert (=> b!209546 d!70907))

(declare-fun d!70909 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70909 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))) ((_ sign_extend 32) (currentByte!9654 thiss!1204)) ((_ sign_extend 32) (currentBit!9649 thiss!1204)) lt!328080) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))) ((_ sign_extend 32) (currentByte!9654 thiss!1204)) ((_ sign_extend 32) (currentBit!9649 thiss!1204))) lt!328080))))

(declare-fun bs!17417 () Bool)

(assert (= bs!17417 d!70909))

(declare-fun m!322787 () Bool)

(assert (=> bs!17417 m!322787))

(assert (=> b!209546 d!70909))

(declare-fun d!70911 () Bool)

(declare-fun lt!328475 () tuple2!18000)

(assert (=> d!70911 (= lt!328475 (readNBitsLSBFirstsLoop!0 (_1!9643 lt!328076) nBits!348 i!590 lt!328065))))

(assert (=> d!70911 (= (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!328076) nBits!348 i!590 lt!328065) (tuple2!17979 (_2!9655 lt!328475) (_1!9655 lt!328475)))))

(declare-fun bs!17418 () Bool)

(assert (= bs!17418 d!70911))

(declare-fun m!322789 () Bool)

(assert (=> bs!17418 m!322789))

(assert (=> b!209546 d!70911))

(declare-fun d!70913 () Bool)

(declare-fun e!143153 () Bool)

(assert (=> d!70913 e!143153))

(declare-fun res!176092 () Bool)

(assert (=> d!70913 (=> (not res!176092) (not e!143153))))

(declare-fun lt!328480 () tuple2!17976)

(assert (=> d!70913 (= res!176092 (isPrefixOf!0 (_1!9643 lt!328480) (_2!9643 lt!328480)))))

(declare-fun lt!328478 () BitStream!8316)

(assert (=> d!70913 (= lt!328480 (tuple2!17977 lt!328478 (_2!9642 lt!328059)))))

(declare-fun lt!328490 () Unit!14919)

(declare-fun lt!328493 () Unit!14919)

(assert (=> d!70913 (= lt!328490 lt!328493)))

(assert (=> d!70913 (isPrefixOf!0 lt!328478 (_2!9642 lt!328059))))

(assert (=> d!70913 (= lt!328493 (lemmaIsPrefixTransitive!0 lt!328478 (_2!9642 lt!328059) (_2!9642 lt!328059)))))

(declare-fun lt!328495 () Unit!14919)

(declare-fun lt!328494 () Unit!14919)

(assert (=> d!70913 (= lt!328495 lt!328494)))

(assert (=> d!70913 (isPrefixOf!0 lt!328478 (_2!9642 lt!328059))))

(assert (=> d!70913 (= lt!328494 (lemmaIsPrefixTransitive!0 lt!328478 thiss!1204 (_2!9642 lt!328059)))))

(declare-fun lt!328487 () Unit!14919)

(declare-fun e!143154 () Unit!14919)

(assert (=> d!70913 (= lt!328487 e!143154)))

(declare-fun c!10306 () Bool)

(assert (=> d!70913 (= c!10306 (not (= (size!4604 (buf!5118 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!328481 () Unit!14919)

(declare-fun lt!328477 () Unit!14919)

(assert (=> d!70913 (= lt!328481 lt!328477)))

(assert (=> d!70913 (isPrefixOf!0 (_2!9642 lt!328059) (_2!9642 lt!328059))))

(assert (=> d!70913 (= lt!328477 (lemmaIsPrefixRefl!0 (_2!9642 lt!328059)))))

(declare-fun lt!328479 () Unit!14919)

(declare-fun lt!328488 () Unit!14919)

(assert (=> d!70913 (= lt!328479 lt!328488)))

(assert (=> d!70913 (= lt!328488 (lemmaIsPrefixRefl!0 (_2!9642 lt!328059)))))

(declare-fun lt!328489 () Unit!14919)

(declare-fun lt!328485 () Unit!14919)

(assert (=> d!70913 (= lt!328489 lt!328485)))

(assert (=> d!70913 (isPrefixOf!0 lt!328478 lt!328478)))

(assert (=> d!70913 (= lt!328485 (lemmaIsPrefixRefl!0 lt!328478))))

(declare-fun lt!328492 () Unit!14919)

(declare-fun lt!328484 () Unit!14919)

(assert (=> d!70913 (= lt!328492 lt!328484)))

(assert (=> d!70913 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70913 (= lt!328484 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70913 (= lt!328478 (BitStream!8317 (buf!5118 (_2!9642 lt!328059)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)))))

(assert (=> d!70913 (isPrefixOf!0 thiss!1204 (_2!9642 lt!328059))))

(assert (=> d!70913 (= (reader!0 thiss!1204 (_2!9642 lt!328059)) lt!328480)))

(declare-fun b!209746 () Bool)

(declare-fun lt!328486 () Unit!14919)

(assert (=> b!209746 (= e!143154 lt!328486)))

(declare-fun lt!328482 () (_ BitVec 64))

(assert (=> b!209746 (= lt!328482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!328483 () (_ BitVec 64))

(assert (=> b!209746 (= lt!328483 (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)))))

(assert (=> b!209746 (= lt!328486 (arrayBitRangesEqSymmetric!0 (buf!5118 thiss!1204) (buf!5118 (_2!9642 lt!328059)) lt!328482 lt!328483))))

(assert (=> b!209746 (arrayBitRangesEq!0 (buf!5118 (_2!9642 lt!328059)) (buf!5118 thiss!1204) lt!328482 lt!328483)))

(declare-fun lt!328491 () (_ BitVec 64))

(declare-fun b!209747 () Bool)

(declare-fun lt!328476 () (_ BitVec 64))

(assert (=> b!209747 (= e!143153 (= (_1!9643 lt!328480) (withMovedBitIndex!0 (_2!9643 lt!328480) (bvsub lt!328491 lt!328476))))))

(assert (=> b!209747 (or (= (bvand lt!328491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328491 lt!328476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209747 (= lt!328476 (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328059))) (currentByte!9654 (_2!9642 lt!328059)) (currentBit!9649 (_2!9642 lt!328059))))))

(assert (=> b!209747 (= lt!328491 (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)))))

(declare-fun b!209748 () Bool)

(declare-fun res!176093 () Bool)

(assert (=> b!209748 (=> (not res!176093) (not e!143153))))

(assert (=> b!209748 (= res!176093 (isPrefixOf!0 (_2!9643 lt!328480) (_2!9642 lt!328059)))))

(declare-fun b!209749 () Bool)

(declare-fun res!176091 () Bool)

(assert (=> b!209749 (=> (not res!176091) (not e!143153))))

(assert (=> b!209749 (= res!176091 (isPrefixOf!0 (_1!9643 lt!328480) thiss!1204))))

(declare-fun b!209750 () Bool)

(declare-fun Unit!14950 () Unit!14919)

(assert (=> b!209750 (= e!143154 Unit!14950)))

(assert (= (and d!70913 c!10306) b!209746))

(assert (= (and d!70913 (not c!10306)) b!209750))

(assert (= (and d!70913 res!176092) b!209749))

(assert (= (and b!209749 res!176091) b!209748))

(assert (= (and b!209748 res!176093) b!209747))

(declare-fun m!322791 () Bool)

(assert (=> b!209749 m!322791))

(assert (=> d!70913 m!322497))

(declare-fun m!322793 () Bool)

(assert (=> d!70913 m!322793))

(declare-fun m!322795 () Bool)

(assert (=> d!70913 m!322795))

(assert (=> d!70913 m!322763))

(declare-fun m!322797 () Bool)

(assert (=> d!70913 m!322797))

(declare-fun m!322799 () Bool)

(assert (=> d!70913 m!322799))

(declare-fun m!322801 () Bool)

(assert (=> d!70913 m!322801))

(assert (=> d!70913 m!322771))

(declare-fun m!322803 () Bool)

(assert (=> d!70913 m!322803))

(declare-fun m!322805 () Bool)

(assert (=> d!70913 m!322805))

(declare-fun m!322807 () Bool)

(assert (=> d!70913 m!322807))

(declare-fun m!322809 () Bool)

(assert (=> b!209748 m!322809))

(assert (=> b!209746 m!322441))

(declare-fun m!322811 () Bool)

(assert (=> b!209746 m!322811))

(declare-fun m!322813 () Bool)

(assert (=> b!209746 m!322813))

(declare-fun m!322815 () Bool)

(assert (=> b!209747 m!322815))

(assert (=> b!209747 m!322495))

(assert (=> b!209747 m!322441))

(assert (=> b!209546 d!70913))

(declare-fun d!70915 () Bool)

(declare-fun e!143157 () Bool)

(assert (=> d!70915 e!143157))

(declare-fun res!176099 () Bool)

(assert (=> d!70915 (=> (not res!176099) (not e!143157))))

(declare-fun lt!328512 () (_ BitVec 64))

(declare-fun lt!328508 () (_ BitVec 64))

(declare-fun lt!328511 () (_ BitVec 64))

(assert (=> d!70915 (= res!176099 (= lt!328508 (bvsub lt!328511 lt!328512)))))

(assert (=> d!70915 (or (= (bvand lt!328511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328512 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328511 lt!328512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70915 (= lt!328512 (remainingBits!0 ((_ sign_extend 32) (size!4604 (buf!5118 (_1!9645 lt!328081)))) ((_ sign_extend 32) (currentByte!9654 (_1!9645 lt!328081))) ((_ sign_extend 32) (currentBit!9649 (_1!9645 lt!328081)))))))

(declare-fun lt!328510 () (_ BitVec 64))

(declare-fun lt!328513 () (_ BitVec 64))

(assert (=> d!70915 (= lt!328511 (bvmul lt!328510 lt!328513))))

(assert (=> d!70915 (or (= lt!328510 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328513 (bvsdiv (bvmul lt!328510 lt!328513) lt!328510)))))

(assert (=> d!70915 (= lt!328513 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70915 (= lt!328510 ((_ sign_extend 32) (size!4604 (buf!5118 (_1!9645 lt!328081)))))))

(assert (=> d!70915 (= lt!328508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9654 (_1!9645 lt!328081))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9649 (_1!9645 lt!328081)))))))

(assert (=> d!70915 (invariant!0 (currentBit!9649 (_1!9645 lt!328081)) (currentByte!9654 (_1!9645 lt!328081)) (size!4604 (buf!5118 (_1!9645 lt!328081))))))

(assert (=> d!70915 (= (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!328081))) (currentByte!9654 (_1!9645 lt!328081)) (currentBit!9649 (_1!9645 lt!328081))) lt!328508)))

(declare-fun b!209755 () Bool)

(declare-fun res!176098 () Bool)

(assert (=> b!209755 (=> (not res!176098) (not e!143157))))

(assert (=> b!209755 (= res!176098 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328508))))

(declare-fun b!209756 () Bool)

(declare-fun lt!328509 () (_ BitVec 64))

(assert (=> b!209756 (= e!143157 (bvsle lt!328508 (bvmul lt!328509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209756 (or (= lt!328509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328509)))))

(assert (=> b!209756 (= lt!328509 ((_ sign_extend 32) (size!4604 (buf!5118 (_1!9645 lt!328081)))))))

(assert (= (and d!70915 res!176099) b!209755))

(assert (= (and b!209755 res!176098) b!209756))

(declare-fun m!322817 () Bool)

(assert (=> d!70915 m!322817))

(declare-fun m!322819 () Bool)

(assert (=> d!70915 m!322819))

(assert (=> b!209546 d!70915))

(declare-fun d!70917 () Bool)

(assert (=> d!70917 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070))) lt!328061) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070)))) lt!328061))))

(declare-fun bs!17419 () Bool)

(assert (= bs!17419 d!70917))

(declare-fun m!322821 () Bool)

(assert (=> bs!17419 m!322821))

(assert (=> b!209546 d!70917))

(declare-fun d!70919 () Bool)

(declare-fun e!143158 () Bool)

(assert (=> d!70919 e!143158))

(declare-fun res!176101 () Bool)

(assert (=> d!70919 (=> (not res!176101) (not e!143158))))

(declare-fun lt!328517 () (_ BitVec 64))

(declare-fun lt!328518 () (_ BitVec 64))

(declare-fun lt!328514 () (_ BitVec 64))

(assert (=> d!70919 (= res!176101 (= lt!328514 (bvsub lt!328517 lt!328518)))))

(assert (=> d!70919 (or (= (bvand lt!328517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328518 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328517 lt!328518) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70919 (= lt!328518 (remainingBits!0 ((_ sign_extend 32) (size!4604 (buf!5118 (_1!9645 lt!328079)))) ((_ sign_extend 32) (currentByte!9654 (_1!9645 lt!328079))) ((_ sign_extend 32) (currentBit!9649 (_1!9645 lt!328079)))))))

(declare-fun lt!328516 () (_ BitVec 64))

(declare-fun lt!328519 () (_ BitVec 64))

(assert (=> d!70919 (= lt!328517 (bvmul lt!328516 lt!328519))))

(assert (=> d!70919 (or (= lt!328516 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328519 (bvsdiv (bvmul lt!328516 lt!328519) lt!328516)))))

(assert (=> d!70919 (= lt!328519 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70919 (= lt!328516 ((_ sign_extend 32) (size!4604 (buf!5118 (_1!9645 lt!328079)))))))

(assert (=> d!70919 (= lt!328514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9654 (_1!9645 lt!328079))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9649 (_1!9645 lt!328079)))))))

(assert (=> d!70919 (invariant!0 (currentBit!9649 (_1!9645 lt!328079)) (currentByte!9654 (_1!9645 lt!328079)) (size!4604 (buf!5118 (_1!9645 lt!328079))))))

(assert (=> d!70919 (= (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!328079))) (currentByte!9654 (_1!9645 lt!328079)) (currentBit!9649 (_1!9645 lt!328079))) lt!328514)))

(declare-fun b!209757 () Bool)

(declare-fun res!176100 () Bool)

(assert (=> b!209757 (=> (not res!176100) (not e!143158))))

(assert (=> b!209757 (= res!176100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328514))))

(declare-fun b!209758 () Bool)

(declare-fun lt!328515 () (_ BitVec 64))

(assert (=> b!209758 (= e!143158 (bvsle lt!328514 (bvmul lt!328515 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209758 (or (= lt!328515 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328515 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328515)))))

(assert (=> b!209758 (= lt!328515 ((_ sign_extend 32) (size!4604 (buf!5118 (_1!9645 lt!328079)))))))

(assert (= (and d!70919 res!176101) b!209757))

(assert (= (and b!209757 res!176100) b!209758))

(declare-fun m!322823 () Bool)

(assert (=> d!70919 m!322823))

(declare-fun m!322825 () Bool)

(assert (=> d!70919 m!322825))

(assert (=> b!209546 d!70919))

(declare-fun d!70921 () Bool)

(assert (=> d!70921 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!209546 d!70921))

(declare-fun d!70923 () Bool)

(declare-fun lt!328520 () tuple2!17998)

(assert (=> d!70923 (= lt!328520 (readBit!0 (BitStream!8317 (buf!5118 (_2!9642 lt!328059)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204))))))

(assert (=> d!70923 (= (readBitPure!0 (BitStream!8317 (buf!5118 (_2!9642 lt!328059)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204))) (tuple2!17981 (_2!9654 lt!328520) (_1!9654 lt!328520)))))

(declare-fun bs!17420 () Bool)

(assert (= bs!17420 d!70923))

(declare-fun m!322827 () Bool)

(assert (=> bs!17420 m!322827))

(assert (=> b!209546 d!70923))

(declare-fun d!70925 () Bool)

(assert (=> d!70925 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070))) lt!328061)))

(declare-fun lt!328521 () Unit!14919)

(assert (=> d!70925 (= lt!328521 (choose!9 (_2!9642 lt!328070) (buf!5118 (_2!9642 lt!328059)) lt!328061 (BitStream!8317 (buf!5118 (_2!9642 lt!328059)) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070)))))))

(assert (=> d!70925 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9642 lt!328070) (buf!5118 (_2!9642 lt!328059)) lt!328061) lt!328521)))

(declare-fun bs!17421 () Bool)

(assert (= bs!17421 d!70925))

(assert (=> bs!17421 m!322455))

(declare-fun m!322829 () Bool)

(assert (=> bs!17421 m!322829))

(assert (=> b!209546 d!70925))

(declare-fun d!70927 () Bool)

(declare-fun e!143161 () Bool)

(assert (=> d!70927 e!143161))

(declare-fun res!176104 () Bool)

(assert (=> d!70927 (=> (not res!176104) (not e!143161))))

(declare-fun lt!328532 () tuple2!17980)

(declare-fun lt!328531 () tuple2!17980)

(assert (=> d!70927 (= res!176104 (= (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!328532))) (currentByte!9654 (_1!9645 lt!328532)) (currentBit!9649 (_1!9645 lt!328532))) (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!328531))) (currentByte!9654 (_1!9645 lt!328531)) (currentBit!9649 (_1!9645 lt!328531)))))))

(declare-fun lt!328530 () Unit!14919)

(declare-fun lt!328533 () BitStream!8316)

(declare-fun choose!50 (BitStream!8316 BitStream!8316 BitStream!8316 tuple2!17980 tuple2!17980 BitStream!8316 Bool tuple2!17980 tuple2!17980 BitStream!8316 Bool) Unit!14919)

(assert (=> d!70927 (= lt!328530 (choose!50 lt!328062 (_2!9642 lt!328059) lt!328533 lt!328532 (tuple2!17981 (_1!9645 lt!328532) (_2!9645 lt!328532)) (_1!9645 lt!328532) (_2!9645 lt!328532) lt!328531 (tuple2!17981 (_1!9645 lt!328531) (_2!9645 lt!328531)) (_1!9645 lt!328531) (_2!9645 lt!328531)))))

(assert (=> d!70927 (= lt!328531 (readBitPure!0 lt!328533))))

(assert (=> d!70927 (= lt!328532 (readBitPure!0 lt!328062))))

(assert (=> d!70927 (= lt!328533 (BitStream!8317 (buf!5118 (_2!9642 lt!328059)) (currentByte!9654 lt!328062) (currentBit!9649 lt!328062)))))

(assert (=> d!70927 (invariant!0 (currentBit!9649 lt!328062) (currentByte!9654 lt!328062) (size!4604 (buf!5118 (_2!9642 lt!328059))))))

(assert (=> d!70927 (= (readBitPrefixLemma!0 lt!328062 (_2!9642 lt!328059)) lt!328530)))

(declare-fun b!209761 () Bool)

(assert (=> b!209761 (= e!143161 (= (_2!9645 lt!328532) (_2!9645 lt!328531)))))

(assert (= (and d!70927 res!176104) b!209761))

(assert (=> d!70927 m!322463))

(declare-fun m!322831 () Bool)

(assert (=> d!70927 m!322831))

(declare-fun m!322833 () Bool)

(assert (=> d!70927 m!322833))

(declare-fun m!322835 () Bool)

(assert (=> d!70927 m!322835))

(declare-fun m!322837 () Bool)

(assert (=> d!70927 m!322837))

(declare-fun m!322839 () Bool)

(assert (=> d!70927 m!322839))

(assert (=> b!209546 d!70927))

(declare-fun d!70929 () Bool)

(declare-fun lt!328534 () tuple2!17998)

(assert (=> d!70929 (= lt!328534 (readBit!0 lt!328062))))

(assert (=> d!70929 (= (readBitPure!0 lt!328062) (tuple2!17981 (_2!9654 lt!328534) (_1!9654 lt!328534)))))

(declare-fun bs!17422 () Bool)

(assert (= bs!17422 d!70929))

(declare-fun m!322841 () Bool)

(assert (=> bs!17422 m!322841))

(assert (=> b!209546 d!70929))

(declare-fun d!70931 () Bool)

(declare-fun lt!328535 () tuple2!17998)

(assert (=> d!70931 (= lt!328535 (readBit!0 (readerFrom!0 (_2!9642 lt!328070) (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204))))))

(assert (=> d!70931 (= (readBitPure!0 (readerFrom!0 (_2!9642 lt!328070) (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204))) (tuple2!17981 (_2!9654 lt!328535) (_1!9654 lt!328535)))))

(declare-fun bs!17423 () Bool)

(assert (= bs!17423 d!70931))

(assert (=> bs!17423 m!322435))

(declare-fun m!322843 () Bool)

(assert (=> bs!17423 m!322843))

(assert (=> b!209548 d!70931))

(declare-fun d!70933 () Bool)

(declare-fun e!143164 () Bool)

(assert (=> d!70933 e!143164))

(declare-fun res!176108 () Bool)

(assert (=> d!70933 (=> (not res!176108) (not e!143164))))

(assert (=> d!70933 (= res!176108 (invariant!0 (currentBit!9649 (_2!9642 lt!328070)) (currentByte!9654 (_2!9642 lt!328070)) (size!4604 (buf!5118 (_2!9642 lt!328070)))))))

(assert (=> d!70933 (= (readerFrom!0 (_2!9642 lt!328070) (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204)) (BitStream!8317 (buf!5118 (_2!9642 lt!328070)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)))))

(declare-fun b!209764 () Bool)

(assert (=> b!209764 (= e!143164 (invariant!0 (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204) (size!4604 (buf!5118 (_2!9642 lt!328070)))))))

(assert (= (and d!70933 res!176108) b!209764))

(declare-fun m!322845 () Bool)

(assert (=> d!70933 m!322845))

(assert (=> b!209764 m!322457))

(assert (=> b!209548 d!70933))

(declare-fun d!70935 () Bool)

(declare-fun res!176109 () Bool)

(declare-fun e!143166 () Bool)

(assert (=> d!70935 (=> (not res!176109) (not e!143166))))

(assert (=> d!70935 (= res!176109 (= (size!4604 (buf!5118 thiss!1204)) (size!4604 (buf!5118 (_2!9642 lt!328070)))))))

(assert (=> d!70935 (= (isPrefixOf!0 thiss!1204 (_2!9642 lt!328070)) e!143166)))

(declare-fun b!209765 () Bool)

(declare-fun res!176110 () Bool)

(assert (=> b!209765 (=> (not res!176110) (not e!143166))))

(assert (=> b!209765 (= res!176110 (bvsle (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)) (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070)))))))

(declare-fun b!209766 () Bool)

(declare-fun e!143165 () Bool)

(assert (=> b!209766 (= e!143166 e!143165)))

(declare-fun res!176111 () Bool)

(assert (=> b!209766 (=> res!176111 e!143165)))

(assert (=> b!209766 (= res!176111 (= (size!4604 (buf!5118 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209767 () Bool)

(assert (=> b!209767 (= e!143165 (arrayBitRangesEq!0 (buf!5118 thiss!1204) (buf!5118 (_2!9642 lt!328070)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204))))))

(assert (= (and d!70935 res!176109) b!209765))

(assert (= (and b!209765 res!176110) b!209766))

(assert (= (and b!209766 (not res!176111)) b!209767))

(assert (=> b!209765 m!322441))

(assert (=> b!209765 m!322439))

(assert (=> b!209767 m!322441))

(assert (=> b!209767 m!322441))

(declare-fun m!322847 () Bool)

(assert (=> b!209767 m!322847))

(assert (=> b!209547 d!70935))

(declare-fun d!70937 () Bool)

(assert (=> d!70937 (= (invariant!0 (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204) (size!4604 (buf!5118 thiss!1204))) (and (bvsge (currentBit!9649 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9649 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9654 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9654 thiss!1204) (size!4604 (buf!5118 thiss!1204))) (and (= (currentBit!9649 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9654 thiss!1204) (size!4604 (buf!5118 thiss!1204)))))))))

(assert (=> b!209558 d!70937))

(declare-fun d!70939 () Bool)

(assert (=> d!70939 (= (invariant!0 (currentBit!9649 (_2!9642 lt!328059)) (currentByte!9654 (_2!9642 lt!328059)) (size!4604 (buf!5118 (_2!9642 lt!328059)))) (and (bvsge (currentBit!9649 (_2!9642 lt!328059)) #b00000000000000000000000000000000) (bvslt (currentBit!9649 (_2!9642 lt!328059)) #b00000000000000000000000000001000) (bvsge (currentByte!9654 (_2!9642 lt!328059)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9654 (_2!9642 lt!328059)) (size!4604 (buf!5118 (_2!9642 lt!328059)))) (and (= (currentBit!9649 (_2!9642 lt!328059)) #b00000000000000000000000000000000) (= (currentByte!9654 (_2!9642 lt!328059)) (size!4604 (buf!5118 (_2!9642 lt!328059))))))))))

(assert (=> b!209554 d!70939))

(declare-fun d!70941 () Bool)

(declare-fun e!143167 () Bool)

(assert (=> d!70941 e!143167))

(declare-fun res!176113 () Bool)

(assert (=> d!70941 (=> (not res!176113) (not e!143167))))

(declare-fun lt!328539 () (_ BitVec 64))

(declare-fun lt!328540 () (_ BitVec 64))

(declare-fun lt!328536 () (_ BitVec 64))

(assert (=> d!70941 (= res!176113 (= lt!328536 (bvsub lt!328539 lt!328540)))))

(assert (=> d!70941 (or (= (bvand lt!328539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328540 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328539 lt!328540) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70941 (= lt!328540 (remainingBits!0 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328070)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070)))))))

(declare-fun lt!328538 () (_ BitVec 64))

(declare-fun lt!328541 () (_ BitVec 64))

(assert (=> d!70941 (= lt!328539 (bvmul lt!328538 lt!328541))))

(assert (=> d!70941 (or (= lt!328538 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328541 (bvsdiv (bvmul lt!328538 lt!328541) lt!328538)))))

(assert (=> d!70941 (= lt!328541 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70941 (= lt!328538 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328070)))))))

(assert (=> d!70941 (= lt!328536 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070)))))))

(assert (=> d!70941 (invariant!0 (currentBit!9649 (_2!9642 lt!328070)) (currentByte!9654 (_2!9642 lt!328070)) (size!4604 (buf!5118 (_2!9642 lt!328070))))))

(assert (=> d!70941 (= (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))) lt!328536)))

(declare-fun b!209768 () Bool)

(declare-fun res!176112 () Bool)

(assert (=> b!209768 (=> (not res!176112) (not e!143167))))

(assert (=> b!209768 (= res!176112 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328536))))

(declare-fun b!209769 () Bool)

(declare-fun lt!328537 () (_ BitVec 64))

(assert (=> b!209769 (= e!143167 (bvsle lt!328536 (bvmul lt!328537 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209769 (or (= lt!328537 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328537 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328537)))))

(assert (=> b!209769 (= lt!328537 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328070)))))))

(assert (= (and d!70941 res!176113) b!209768))

(assert (= (and b!209768 res!176112) b!209769))

(declare-fun m!322849 () Bool)

(assert (=> d!70941 m!322849))

(assert (=> d!70941 m!322845))

(assert (=> b!209545 d!70941))

(declare-fun d!70943 () Bool)

(declare-fun e!143168 () Bool)

(assert (=> d!70943 e!143168))

(declare-fun res!176115 () Bool)

(assert (=> d!70943 (=> (not res!176115) (not e!143168))))

(declare-fun lt!328542 () (_ BitVec 64))

(declare-fun lt!328546 () (_ BitVec 64))

(declare-fun lt!328545 () (_ BitVec 64))

(assert (=> d!70943 (= res!176115 (= lt!328542 (bvsub lt!328545 lt!328546)))))

(assert (=> d!70943 (or (= (bvand lt!328545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328545 lt!328546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70943 (= lt!328546 (remainingBits!0 ((_ sign_extend 32) (size!4604 (buf!5118 thiss!1204))) ((_ sign_extend 32) (currentByte!9654 thiss!1204)) ((_ sign_extend 32) (currentBit!9649 thiss!1204))))))

(declare-fun lt!328544 () (_ BitVec 64))

(declare-fun lt!328547 () (_ BitVec 64))

(assert (=> d!70943 (= lt!328545 (bvmul lt!328544 lt!328547))))

(assert (=> d!70943 (or (= lt!328544 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328547 (bvsdiv (bvmul lt!328544 lt!328547) lt!328544)))))

(assert (=> d!70943 (= lt!328547 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70943 (= lt!328544 ((_ sign_extend 32) (size!4604 (buf!5118 thiss!1204))))))

(assert (=> d!70943 (= lt!328542 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9654 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9649 thiss!1204))))))

(assert (=> d!70943 (invariant!0 (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204) (size!4604 (buf!5118 thiss!1204)))))

(assert (=> d!70943 (= (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)) lt!328542)))

(declare-fun b!209770 () Bool)

(declare-fun res!176114 () Bool)

(assert (=> b!209770 (=> (not res!176114) (not e!143168))))

(assert (=> b!209770 (= res!176114 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328542))))

(declare-fun b!209771 () Bool)

(declare-fun lt!328543 () (_ BitVec 64))

(assert (=> b!209771 (= e!143168 (bvsle lt!328542 (bvmul lt!328543 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209771 (or (= lt!328543 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328543 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328543)))))

(assert (=> b!209771 (= lt!328543 ((_ sign_extend 32) (size!4604 (buf!5118 thiss!1204))))))

(assert (= (and d!70943 res!176115) b!209770))

(assert (= (and b!209770 res!176114) b!209771))

(declare-fun m!322851 () Bool)

(assert (=> d!70943 m!322851))

(assert (=> d!70943 m!322449))

(assert (=> b!209545 d!70943))

(declare-fun b!209782 () Bool)

(declare-fun res!176126 () Bool)

(declare-fun e!143174 () Bool)

(assert (=> b!209782 (=> (not res!176126) (not e!143174))))

(declare-fun lt!328557 () tuple2!17974)

(assert (=> b!209782 (= res!176126 (isPrefixOf!0 thiss!1204 (_2!9642 lt!328557)))))

(declare-fun b!209783 () Bool)

(declare-fun e!143173 () Bool)

(assert (=> b!209783 (= e!143174 e!143173)))

(declare-fun res!176125 () Bool)

(assert (=> b!209783 (=> (not res!176125) (not e!143173))))

(declare-fun lt!328558 () tuple2!17980)

(assert (=> b!209783 (= res!176125 (and (= (_2!9645 lt!328558) lt!328060) (= (_1!9645 lt!328558) (_2!9642 lt!328557))))))

(assert (=> b!209783 (= lt!328558 (readBitPure!0 (readerFrom!0 (_2!9642 lt!328557) (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204))))))

(declare-fun b!209781 () Bool)

(declare-fun res!176127 () Bool)

(assert (=> b!209781 (=> (not res!176127) (not e!143174))))

(declare-fun lt!328556 () (_ BitVec 64))

(declare-fun lt!328559 () (_ BitVec 64))

(assert (=> b!209781 (= res!176127 (= (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328557))) (currentByte!9654 (_2!9642 lt!328557)) (currentBit!9649 (_2!9642 lt!328557))) (bvadd lt!328556 lt!328559)))))

(assert (=> b!209781 (or (not (= (bvand lt!328556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328559 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!328556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!328556 lt!328559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209781 (= lt!328559 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!209781 (= lt!328556 (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)))))

(declare-fun d!70945 () Bool)

(assert (=> d!70945 e!143174))

(declare-fun res!176124 () Bool)

(assert (=> d!70945 (=> (not res!176124) (not e!143174))))

(assert (=> d!70945 (= res!176124 (= (size!4604 (buf!5118 thiss!1204)) (size!4604 (buf!5118 (_2!9642 lt!328557)))))))

(declare-fun choose!16 (BitStream!8316 Bool) tuple2!17974)

(assert (=> d!70945 (= lt!328557 (choose!16 thiss!1204 lt!328060))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70945 (validate_offset_bit!0 ((_ sign_extend 32) (size!4604 (buf!5118 thiss!1204))) ((_ sign_extend 32) (currentByte!9654 thiss!1204)) ((_ sign_extend 32) (currentBit!9649 thiss!1204)))))

(assert (=> d!70945 (= (appendBit!0 thiss!1204 lt!328060) lt!328557)))

(declare-fun b!209784 () Bool)

(assert (=> b!209784 (= e!143173 (= (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!328558))) (currentByte!9654 (_1!9645 lt!328558)) (currentBit!9649 (_1!9645 lt!328558))) (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328557))) (currentByte!9654 (_2!9642 lt!328557)) (currentBit!9649 (_2!9642 lt!328557)))))))

(assert (= (and d!70945 res!176124) b!209781))

(assert (= (and b!209781 res!176127) b!209782))

(assert (= (and b!209782 res!176126) b!209783))

(assert (= (and b!209783 res!176125) b!209784))

(declare-fun m!322853 () Bool)

(assert (=> b!209784 m!322853))

(declare-fun m!322855 () Bool)

(assert (=> b!209784 m!322855))

(declare-fun m!322857 () Bool)

(assert (=> b!209782 m!322857))

(declare-fun m!322859 () Bool)

(assert (=> b!209783 m!322859))

(assert (=> b!209783 m!322859))

(declare-fun m!322861 () Bool)

(assert (=> b!209783 m!322861))

(declare-fun m!322863 () Bool)

(assert (=> d!70945 m!322863))

(declare-fun m!322865 () Bool)

(assert (=> d!70945 m!322865))

(assert (=> b!209781 m!322855))

(assert (=> b!209781 m!322441))

(assert (=> b!209545 d!70945))

(declare-fun d!70947 () Bool)

(assert (=> d!70947 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 thiss!1204))) ((_ sign_extend 32) (currentByte!9654 thiss!1204)) ((_ sign_extend 32) (currentBit!9649 thiss!1204)) lt!328080) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4604 (buf!5118 thiss!1204))) ((_ sign_extend 32) (currentByte!9654 thiss!1204)) ((_ sign_extend 32) (currentBit!9649 thiss!1204))) lt!328080))))

(declare-fun bs!17424 () Bool)

(assert (= bs!17424 d!70947))

(assert (=> bs!17424 m!322851))

(assert (=> b!209556 d!70947))

(declare-fun d!70949 () Bool)

(declare-fun lt!328573 () tuple2!17978)

(declare-fun lt!328575 () tuple2!17978)

(assert (=> d!70949 (and (= (_2!9644 lt!328573) (_2!9644 lt!328575)) (= (_1!9644 lt!328573) (_1!9644 lt!328575)))))

(declare-fun lt!328574 () Bool)

(declare-fun lt!328576 () BitStream!8316)

(declare-fun lt!328577 () (_ BitVec 64))

(declare-fun lt!328572 () Unit!14919)

(declare-fun choose!56 (BitStream!8316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17978 tuple2!17978 BitStream!8316 (_ BitVec 64) Bool BitStream!8316 (_ BitVec 64) tuple2!17978 tuple2!17978 BitStream!8316 (_ BitVec 64)) Unit!14919)

(assert (=> d!70949 (= lt!328572 (choose!56 (_1!9643 lt!328076) nBits!348 i!590 lt!328065 lt!328573 (tuple2!17979 (_1!9644 lt!328573) (_2!9644 lt!328573)) (_1!9644 lt!328573) (_2!9644 lt!328573) lt!328574 lt!328576 lt!328577 lt!328575 (tuple2!17979 (_1!9644 lt!328575) (_2!9644 lt!328575)) (_1!9644 lt!328575) (_2!9644 lt!328575)))))

(assert (=> d!70949 (= lt!328575 (readNBitsLSBFirstsLoopPure!0 lt!328576 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!328577))))

(assert (=> d!70949 (= lt!328577 (bvor lt!328065 (ite lt!328574 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70949 (= lt!328576 (withMovedBitIndex!0 (_1!9643 lt!328076) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!70949 (= lt!328574 (_2!9645 (readBitPure!0 (_1!9643 lt!328076))))))

(assert (=> d!70949 (= lt!328573 (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!328076) nBits!348 i!590 lt!328065))))

(assert (=> d!70949 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9643 lt!328076) nBits!348 i!590 lt!328065) lt!328572)))

(declare-fun bs!17426 () Bool)

(assert (= bs!17426 d!70949))

(declare-fun m!322867 () Bool)

(assert (=> bs!17426 m!322867))

(assert (=> bs!17426 m!322467))

(assert (=> bs!17426 m!322451))

(declare-fun m!322869 () Bool)

(assert (=> bs!17426 m!322869))

(assert (=> bs!17426 m!322489))

(assert (=> b!209555 d!70949))

(declare-fun d!70951 () Bool)

(declare-fun lt!328578 () tuple2!18000)

(assert (=> d!70951 (= lt!328578 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9643 lt!328076) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328072))))

(assert (=> d!70951 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9643 lt!328076) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328072) (tuple2!17979 (_2!9655 lt!328578) (_1!9655 lt!328578)))))

(declare-fun bs!17427 () Bool)

(assert (= bs!17427 d!70951))

(assert (=> bs!17427 m!322489))

(declare-fun m!322871 () Bool)

(assert (=> bs!17427 m!322871))

(assert (=> b!209555 d!70951))

(declare-fun d!70953 () Bool)

(declare-fun e!143177 () Bool)

(assert (=> d!70953 e!143177))

(declare-fun res!176130 () Bool)

(assert (=> d!70953 (=> (not res!176130) (not e!143177))))

(declare-fun lt!328584 () (_ BitVec 64))

(declare-fun lt!328583 () BitStream!8316)

(assert (=> d!70953 (= res!176130 (= (bvadd lt!328584 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4604 (buf!5118 lt!328583)) (currentByte!9654 lt!328583) (currentBit!9649 lt!328583))))))

(assert (=> d!70953 (or (not (= (bvand lt!328584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!328584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!328584 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70953 (= lt!328584 (bitIndex!0 (size!4604 (buf!5118 (_1!9643 lt!328076))) (currentByte!9654 (_1!9643 lt!328076)) (currentBit!9649 (_1!9643 lt!328076))))))

(declare-fun moveBitIndex!0 (BitStream!8316 (_ BitVec 64)) tuple2!17974)

(assert (=> d!70953 (= lt!328583 (_2!9642 (moveBitIndex!0 (_1!9643 lt!328076) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8316 (_ BitVec 64)) Bool)

(assert (=> d!70953 (moveBitIndexPrecond!0 (_1!9643 lt!328076) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!70953 (= (withMovedBitIndex!0 (_1!9643 lt!328076) #b0000000000000000000000000000000000000000000000000000000000000001) lt!328583)))

(declare-fun b!209787 () Bool)

(assert (=> b!209787 (= e!143177 (= (size!4604 (buf!5118 (_1!9643 lt!328076))) (size!4604 (buf!5118 lt!328583))))))

(assert (= (and d!70953 res!176130) b!209787))

(declare-fun m!322873 () Bool)

(assert (=> d!70953 m!322873))

(declare-fun m!322875 () Bool)

(assert (=> d!70953 m!322875))

(declare-fun m!322877 () Bool)

(assert (=> d!70953 m!322877))

(declare-fun m!322879 () Bool)

(assert (=> d!70953 m!322879))

(assert (=> b!209555 d!70953))

(declare-fun d!70955 () Bool)

(assert (=> d!70955 (= (array_inv!4345 (buf!5118 thiss!1204)) (bvsge (size!4604 (buf!5118 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!209552 d!70955))

(assert (=> b!209562 d!70935))

(declare-fun d!70957 () Bool)

(declare-fun e!143178 () Bool)

(assert (=> d!70957 e!143178))

(declare-fun res!176132 () Bool)

(assert (=> d!70957 (=> (not res!176132) (not e!143178))))

(declare-fun lt!328588 () (_ BitVec 64))

(declare-fun lt!328589 () (_ BitVec 64))

(declare-fun lt!328585 () (_ BitVec 64))

(assert (=> d!70957 (= res!176132 (= lt!328585 (bvsub lt!328588 lt!328589)))))

(assert (=> d!70957 (or (= (bvand lt!328588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328588 lt!328589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70957 (= lt!328589 (remainingBits!0 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328059))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328059)))))))

(declare-fun lt!328587 () (_ BitVec 64))

(declare-fun lt!328590 () (_ BitVec 64))

(assert (=> d!70957 (= lt!328588 (bvmul lt!328587 lt!328590))))

(assert (=> d!70957 (or (= lt!328587 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328590 (bvsdiv (bvmul lt!328587 lt!328590) lt!328587)))))

(assert (=> d!70957 (= lt!328590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70957 (= lt!328587 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))))))

(assert (=> d!70957 (= lt!328585 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328059))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328059)))))))

(assert (=> d!70957 (invariant!0 (currentBit!9649 (_2!9642 lt!328059)) (currentByte!9654 (_2!9642 lt!328059)) (size!4604 (buf!5118 (_2!9642 lt!328059))))))

(assert (=> d!70957 (= (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328059))) (currentByte!9654 (_2!9642 lt!328059)) (currentBit!9649 (_2!9642 lt!328059))) lt!328585)))

(declare-fun b!209788 () Bool)

(declare-fun res!176131 () Bool)

(assert (=> b!209788 (=> (not res!176131) (not e!143178))))

(assert (=> b!209788 (= res!176131 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328585))))

(declare-fun b!209789 () Bool)

(declare-fun lt!328586 () (_ BitVec 64))

(assert (=> b!209789 (= e!143178 (bvsle lt!328585 (bvmul lt!328586 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209789 (or (= lt!328586 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328586 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328586)))))

(assert (=> b!209789 (= lt!328586 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328059)))))))

(assert (= (and d!70957 res!176132) b!209788))

(assert (= (and b!209788 res!176131) b!209789))

(declare-fun m!322881 () Bool)

(assert (=> d!70957 m!322881))

(assert (=> d!70957 m!322445))

(assert (=> b!209553 d!70957))

(declare-fun d!70959 () Bool)

(declare-fun res!176133 () Bool)

(declare-fun e!143180 () Bool)

(assert (=> d!70959 (=> (not res!176133) (not e!143180))))

(assert (=> d!70959 (= res!176133 (= (size!4604 (buf!5118 thiss!1204)) (size!4604 (buf!5118 (_2!9642 lt!328059)))))))

(assert (=> d!70959 (= (isPrefixOf!0 thiss!1204 (_2!9642 lt!328059)) e!143180)))

(declare-fun b!209790 () Bool)

(declare-fun res!176134 () Bool)

(assert (=> b!209790 (=> (not res!176134) (not e!143180))))

(assert (=> b!209790 (= res!176134 (bvsle (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204)) (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328059))) (currentByte!9654 (_2!9642 lt!328059)) (currentBit!9649 (_2!9642 lt!328059)))))))

(declare-fun b!209791 () Bool)

(declare-fun e!143179 () Bool)

(assert (=> b!209791 (= e!143180 e!143179)))

(declare-fun res!176135 () Bool)

(assert (=> b!209791 (=> res!176135 e!143179)))

(assert (=> b!209791 (= res!176135 (= (size!4604 (buf!5118 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209792 () Bool)

(assert (=> b!209792 (= e!143179 (arrayBitRangesEq!0 (buf!5118 thiss!1204) (buf!5118 (_2!9642 lt!328059)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4604 (buf!5118 thiss!1204)) (currentByte!9654 thiss!1204) (currentBit!9649 thiss!1204))))))

(assert (= (and d!70959 res!176133) b!209790))

(assert (= (and b!209790 res!176134) b!209791))

(assert (= (and b!209791 (not res!176135)) b!209792))

(assert (=> b!209790 m!322441))

(assert (=> b!209790 m!322495))

(assert (=> b!209792 m!322441))

(assert (=> b!209792 m!322441))

(declare-fun m!322883 () Bool)

(assert (=> b!209792 m!322883))

(assert (=> b!209553 d!70959))

(declare-fun d!70961 () Bool)

(assert (=> d!70961 (isPrefixOf!0 thiss!1204 (_2!9642 lt!328059))))

(declare-fun lt!328593 () Unit!14919)

(declare-fun choose!30 (BitStream!8316 BitStream!8316 BitStream!8316) Unit!14919)

(assert (=> d!70961 (= lt!328593 (choose!30 thiss!1204 (_2!9642 lt!328070) (_2!9642 lt!328059)))))

(assert (=> d!70961 (isPrefixOf!0 thiss!1204 (_2!9642 lt!328070))))

(assert (=> d!70961 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9642 lt!328070) (_2!9642 lt!328059)) lt!328593)))

(declare-fun bs!17428 () Bool)

(assert (= bs!17428 d!70961))

(assert (=> bs!17428 m!322497))

(declare-fun m!322885 () Bool)

(assert (=> bs!17428 m!322885))

(assert (=> bs!17428 m!322447))

(assert (=> b!209553 d!70961))

(declare-fun b!209962 () Bool)

(declare-fun res!176269 () Bool)

(declare-fun e!143277 () Bool)

(assert (=> b!209962 (=> (not res!176269) (not e!143277))))

(declare-fun lt!329229 () tuple2!17974)

(declare-fun lt!329214 () (_ BitVec 64))

(declare-fun lt!329193 () (_ BitVec 64))

(assert (=> b!209962 (= res!176269 (= (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!329229))) (currentByte!9654 (_2!9642 lt!329229)) (currentBit!9649 (_2!9642 lt!329229))) (bvsub lt!329193 lt!329214)))))

(assert (=> b!209962 (or (= (bvand lt!329193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329214 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329193 lt!329214) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209962 (= lt!329214 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!329205 () (_ BitVec 64))

(declare-fun lt!329201 () (_ BitVec 64))

(assert (=> b!209962 (= lt!329193 (bvadd lt!329205 lt!329201))))

(assert (=> b!209962 (or (not (= (bvand lt!329205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329201 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!329205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!329205 lt!329201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209962 (= lt!329201 ((_ sign_extend 32) nBits!348))))

(assert (=> b!209962 (= lt!329205 (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))))))

(declare-fun b!209963 () Bool)

(declare-fun lt!329236 () tuple2!17980)

(declare-fun lt!329223 () tuple2!17974)

(assert (=> b!209963 (= lt!329236 (readBitPure!0 (readerFrom!0 (_2!9642 lt!329223) (currentBit!9649 (_2!9642 lt!328070)) (currentByte!9654 (_2!9642 lt!328070)))))))

(declare-fun res!176272 () Bool)

(declare-fun lt!329228 () Bool)

(assert (=> b!209963 (= res!176272 (and (= (_2!9645 lt!329236) lt!329228) (= (_1!9645 lt!329236) (_2!9642 lt!329223))))))

(declare-fun e!143281 () Bool)

(assert (=> b!209963 (=> (not res!176272) (not e!143281))))

(declare-fun e!143285 () Bool)

(assert (=> b!209963 (= e!143285 e!143281)))

(declare-fun b!209964 () Bool)

(declare-fun e!143282 () (_ BitVec 64))

(assert (=> b!209964 (= e!143282 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!209965 () Bool)

(declare-fun e!143279 () Bool)

(assert (=> b!209965 (= e!143277 e!143279)))

(declare-fun res!176273 () Bool)

(assert (=> b!209965 (=> (not res!176273) (not e!143279))))

(declare-fun lt!329243 () tuple2!17978)

(assert (=> b!209965 (= res!176273 (= (_2!9644 lt!329243) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!329244 () tuple2!17976)

(assert (=> b!209965 (= lt!329243 (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!329244) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!329219 () Unit!14919)

(declare-fun lt!329209 () Unit!14919)

(assert (=> b!209965 (= lt!329219 lt!329209)))

(declare-fun lt!329222 () (_ BitVec 64))

(assert (=> b!209965 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!329229)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070))) lt!329222)))

(assert (=> b!209965 (= lt!329209 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9642 lt!328070) (buf!5118 (_2!9642 lt!329229)) lt!329222))))

(declare-fun e!143283 () Bool)

(assert (=> b!209965 e!143283))

(declare-fun res!176266 () Bool)

(assert (=> b!209965 (=> (not res!176266) (not e!143283))))

(assert (=> b!209965 (= res!176266 (and (= (size!4604 (buf!5118 (_2!9642 lt!328070))) (size!4604 (buf!5118 (_2!9642 lt!329229)))) (bvsge lt!329222 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209965 (= lt!329222 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!209965 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!209965 (= lt!329244 (reader!0 (_2!9642 lt!328070) (_2!9642 lt!329229)))))

(declare-fun b!209966 () Bool)

(declare-fun res!176275 () Bool)

(assert (=> b!209966 (= res!176275 (= (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!329223))) (currentByte!9654 (_2!9642 lt!329223)) (currentBit!9649 (_2!9642 lt!329223))) (bvadd (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!209966 (=> (not res!176275) (not e!143285))))

(declare-fun c!10327 () Bool)

(declare-fun lt!329210 () tuple2!17974)

(declare-fun bm!3303 () Bool)

(declare-fun call!3306 () Bool)

(assert (=> bm!3303 (= call!3306 (isPrefixOf!0 (_2!9642 lt!328070) (ite c!10327 (_2!9642 lt!328070) (_2!9642 lt!329210))))))

(declare-fun b!209967 () Bool)

(declare-fun e!143280 () tuple2!17974)

(assert (=> b!209967 (= e!143280 (tuple2!17975 (_1!9642 lt!329210) (_2!9642 lt!329210)))))

(assert (=> b!209967 (= lt!329228 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209967 (= lt!329223 (appendBit!0 (_2!9642 lt!328070) lt!329228))))

(declare-fun res!176276 () Bool)

(assert (=> b!209967 (= res!176276 (= (size!4604 (buf!5118 (_2!9642 lt!328070))) (size!4604 (buf!5118 (_2!9642 lt!329223)))))))

(assert (=> b!209967 (=> (not res!176276) (not e!143285))))

(assert (=> b!209967 e!143285))

(declare-fun lt!329241 () tuple2!17974)

(assert (=> b!209967 (= lt!329241 lt!329223)))

(assert (=> b!209967 (= lt!329210 (appendBitsLSBFirstLoopTR!0 (_2!9642 lt!329241) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!329239 () Unit!14919)

(assert (=> b!209967 (= lt!329239 (lemmaIsPrefixTransitive!0 (_2!9642 lt!328070) (_2!9642 lt!329241) (_2!9642 lt!329210)))))

(assert (=> b!209967 call!3306))

(declare-fun lt!329217 () Unit!14919)

(assert (=> b!209967 (= lt!329217 lt!329239)))

(assert (=> b!209967 (invariant!0 (currentBit!9649 (_2!9642 lt!328070)) (currentByte!9654 (_2!9642 lt!328070)) (size!4604 (buf!5118 (_2!9642 lt!329241))))))

(declare-fun lt!329200 () BitStream!8316)

(assert (=> b!209967 (= lt!329200 (BitStream!8317 (buf!5118 (_2!9642 lt!329241)) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))))))

(assert (=> b!209967 (invariant!0 (currentBit!9649 lt!329200) (currentByte!9654 lt!329200) (size!4604 (buf!5118 (_2!9642 lt!329210))))))

(declare-fun lt!329208 () BitStream!8316)

(assert (=> b!209967 (= lt!329208 (BitStream!8317 (buf!5118 (_2!9642 lt!329210)) (currentByte!9654 lt!329200) (currentBit!9649 lt!329200)))))

(declare-fun lt!329211 () tuple2!17980)

(assert (=> b!209967 (= lt!329211 (readBitPure!0 lt!329200))))

(declare-fun lt!329198 () tuple2!17980)

(assert (=> b!209967 (= lt!329198 (readBitPure!0 lt!329208))))

(declare-fun lt!329231 () Unit!14919)

(assert (=> b!209967 (= lt!329231 (readBitPrefixLemma!0 lt!329200 (_2!9642 lt!329210)))))

(declare-fun res!176277 () Bool)

(assert (=> b!209967 (= res!176277 (= (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!329211))) (currentByte!9654 (_1!9645 lt!329211)) (currentBit!9649 (_1!9645 lt!329211))) (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!329198))) (currentByte!9654 (_1!9645 lt!329198)) (currentBit!9649 (_1!9645 lt!329198)))))))

(declare-fun e!143284 () Bool)

(assert (=> b!209967 (=> (not res!176277) (not e!143284))))

(assert (=> b!209967 e!143284))

(declare-fun lt!329196 () Unit!14919)

(assert (=> b!209967 (= lt!329196 lt!329231)))

(declare-fun lt!329204 () tuple2!17976)

(assert (=> b!209967 (= lt!329204 (reader!0 (_2!9642 lt!328070) (_2!9642 lt!329210)))))

(declare-fun lt!329238 () tuple2!17976)

(assert (=> b!209967 (= lt!329238 (reader!0 (_2!9642 lt!329241) (_2!9642 lt!329210)))))

(declare-fun lt!329197 () tuple2!17980)

(assert (=> b!209967 (= lt!329197 (readBitPure!0 (_1!9643 lt!329204)))))

(assert (=> b!209967 (= (_2!9645 lt!329197) lt!329228)))

(declare-fun lt!329212 () Unit!14919)

(declare-fun Unit!14951 () Unit!14919)

(assert (=> b!209967 (= lt!329212 Unit!14951)))

(declare-fun lt!329224 () (_ BitVec 64))

(assert (=> b!209967 (= lt!329224 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!329191 () (_ BitVec 64))

(assert (=> b!209967 (= lt!329191 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!329233 () Unit!14919)

(assert (=> b!209967 (= lt!329233 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9642 lt!328070) (buf!5118 (_2!9642 lt!329210)) lt!329191))))

(assert (=> b!209967 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!329210)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070))) lt!329191)))

(declare-fun lt!329218 () Unit!14919)

(assert (=> b!209967 (= lt!329218 lt!329233)))

(declare-fun lt!329230 () tuple2!17978)

(assert (=> b!209967 (= lt!329230 (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!329204) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329224))))

(declare-fun lt!329207 () (_ BitVec 64))

(assert (=> b!209967 (= lt!329207 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!329226 () Unit!14919)

(assert (=> b!209967 (= lt!329226 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9642 lt!329241) (buf!5118 (_2!9642 lt!329210)) lt!329207))))

(assert (=> b!209967 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!329210)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!329241))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!329241))) lt!329207)))

(declare-fun lt!329240 () Unit!14919)

(assert (=> b!209967 (= lt!329240 lt!329226)))

(declare-fun lt!329202 () tuple2!17978)

(assert (=> b!209967 (= lt!329202 (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!329238) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!329224 (ite (_2!9645 lt!329197) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!329237 () tuple2!17978)

(assert (=> b!209967 (= lt!329237 (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!329204) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329224))))

(declare-fun c!10328 () Bool)

(assert (=> b!209967 (= c!10328 (_2!9645 (readBitPure!0 (_1!9643 lt!329204))))))

(declare-fun lt!329242 () tuple2!17978)

(assert (=> b!209967 (= lt!329242 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9643 lt!329204) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!329224 e!143282)))))

(declare-fun lt!329206 () Unit!14919)

(assert (=> b!209967 (= lt!329206 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9643 lt!329204) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329224))))

(assert (=> b!209967 (and (= (_2!9644 lt!329237) (_2!9644 lt!329242)) (= (_1!9644 lt!329237) (_1!9644 lt!329242)))))

(declare-fun lt!329245 () Unit!14919)

(assert (=> b!209967 (= lt!329245 lt!329206)))

(assert (=> b!209967 (= (_1!9643 lt!329204) (withMovedBitIndex!0 (_2!9643 lt!329204) (bvsub (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))) (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!329210))) (currentByte!9654 (_2!9642 lt!329210)) (currentBit!9649 (_2!9642 lt!329210))))))))

(declare-fun lt!329213 () Unit!14919)

(declare-fun Unit!14952 () Unit!14919)

(assert (=> b!209967 (= lt!329213 Unit!14952)))

(assert (=> b!209967 (= (_1!9643 lt!329238) (withMovedBitIndex!0 (_2!9643 lt!329238) (bvsub (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!329241))) (currentByte!9654 (_2!9642 lt!329241)) (currentBit!9649 (_2!9642 lt!329241))) (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!329210))) (currentByte!9654 (_2!9642 lt!329210)) (currentBit!9649 (_2!9642 lt!329210))))))))

(declare-fun lt!329246 () Unit!14919)

(declare-fun Unit!14953 () Unit!14919)

(assert (=> b!209967 (= lt!329246 Unit!14953)))

(assert (=> b!209967 (= (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))) (bvsub (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!329241))) (currentByte!9654 (_2!9642 lt!329241)) (currentBit!9649 (_2!9642 lt!329241))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!329227 () Unit!14919)

(declare-fun Unit!14954 () Unit!14919)

(assert (=> b!209967 (= lt!329227 Unit!14954)))

(assert (=> b!209967 (= (_2!9644 lt!329230) (_2!9644 lt!329202))))

(declare-fun lt!329221 () Unit!14919)

(declare-fun Unit!14955 () Unit!14919)

(assert (=> b!209967 (= lt!329221 Unit!14955)))

(assert (=> b!209967 (invariant!0 (currentBit!9649 (_2!9642 lt!329210)) (currentByte!9654 (_2!9642 lt!329210)) (size!4604 (buf!5118 (_2!9642 lt!329210))))))

(declare-fun lt!329199 () Unit!14919)

(declare-fun Unit!14956 () Unit!14919)

(assert (=> b!209967 (= lt!329199 Unit!14956)))

(assert (=> b!209967 (= (size!4604 (buf!5118 (_2!9642 lt!328070))) (size!4604 (buf!5118 (_2!9642 lt!329210))))))

(declare-fun lt!329203 () Unit!14919)

(declare-fun Unit!14957 () Unit!14919)

(assert (=> b!209967 (= lt!329203 Unit!14957)))

(assert (=> b!209967 (= (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!329210))) (currentByte!9654 (_2!9642 lt!329210)) (currentBit!9649 (_2!9642 lt!329210))) (bvsub (bvadd (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!328070))) (currentByte!9654 (_2!9642 lt!328070)) (currentBit!9649 (_2!9642 lt!328070))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!329232 () Unit!14919)

(declare-fun Unit!14958 () Unit!14919)

(assert (=> b!209967 (= lt!329232 Unit!14958)))

(declare-fun lt!329235 () Unit!14919)

(declare-fun Unit!14959 () Unit!14919)

(assert (=> b!209967 (= lt!329235 Unit!14959)))

(declare-fun lt!329225 () tuple2!17976)

(assert (=> b!209967 (= lt!329225 (reader!0 (_2!9642 lt!328070) (_2!9642 lt!329210)))))

(declare-fun lt!329192 () (_ BitVec 64))

(assert (=> b!209967 (= lt!329192 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!329220 () Unit!14919)

(assert (=> b!209967 (= lt!329220 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9642 lt!328070) (buf!5118 (_2!9642 lt!329210)) lt!329192))))

(assert (=> b!209967 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!329210)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070))) lt!329192)))

(declare-fun lt!329234 () Unit!14919)

(assert (=> b!209967 (= lt!329234 lt!329220)))

(declare-fun lt!329216 () tuple2!17978)

(assert (=> b!209967 (= lt!329216 (readNBitsLSBFirstsLoopPure!0 (_1!9643 lt!329225) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!176268 () Bool)

(assert (=> b!209967 (= res!176268 (= (_2!9644 lt!329216) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!143278 () Bool)

(assert (=> b!209967 (=> (not res!176268) (not e!143278))))

(assert (=> b!209967 e!143278))

(declare-fun lt!329194 () Unit!14919)

(declare-fun Unit!14960 () Unit!14919)

(assert (=> b!209967 (= lt!329194 Unit!14960)))

(declare-fun d!70963 () Bool)

(assert (=> d!70963 e!143277))

(declare-fun res!176267 () Bool)

(assert (=> d!70963 (=> (not res!176267) (not e!143277))))

(assert (=> d!70963 (= res!176267 (invariant!0 (currentBit!9649 (_2!9642 lt!329229)) (currentByte!9654 (_2!9642 lt!329229)) (size!4604 (buf!5118 (_2!9642 lt!329229)))))))

(assert (=> d!70963 (= lt!329229 e!143280)))

(assert (=> d!70963 (= c!10327 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70963 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70963 (= (appendBitsLSBFirstLoopTR!0 (_2!9642 lt!328070) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!329229)))

(declare-fun b!209968 () Bool)

(declare-fun res!176271 () Bool)

(assert (=> b!209968 (=> (not res!176271) (not e!143277))))

(assert (=> b!209968 (= res!176271 (= (size!4604 (buf!5118 (_2!9642 lt!328070))) (size!4604 (buf!5118 (_2!9642 lt!329229)))))))

(declare-fun b!209969 () Bool)

(assert (=> b!209969 (= e!143283 (validate_offset_bits!1 ((_ sign_extend 32) (size!4604 (buf!5118 (_2!9642 lt!328070)))) ((_ sign_extend 32) (currentByte!9654 (_2!9642 lt!328070))) ((_ sign_extend 32) (currentBit!9649 (_2!9642 lt!328070))) lt!329222))))

(declare-fun b!209970 () Bool)

(assert (=> b!209970 (= e!143278 (= (_1!9644 lt!329216) (_2!9643 lt!329225)))))

(declare-fun b!209971 () Bool)

(assert (=> b!209971 (= e!143284 (= (_2!9645 lt!329211) (_2!9645 lt!329198)))))

(declare-fun b!209972 () Bool)

(declare-fun res!176270 () Bool)

(assert (=> b!209972 (=> (not res!176270) (not e!143277))))

(assert (=> b!209972 (= res!176270 (isPrefixOf!0 (_2!9642 lt!328070) (_2!9642 lt!329229)))))

(declare-fun b!209973 () Bool)

(assert (=> b!209973 (= e!143282 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!209974 () Bool)

(assert (=> b!209974 (= e!143281 (= (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!329236))) (currentByte!9654 (_1!9645 lt!329236)) (currentBit!9649 (_1!9645 lt!329236))) (bitIndex!0 (size!4604 (buf!5118 (_2!9642 lt!329223))) (currentByte!9654 (_2!9642 lt!329223)) (currentBit!9649 (_2!9642 lt!329223)))))))

(declare-fun b!209975 () Bool)

(assert (=> b!209975 (= e!143279 (= (_1!9644 lt!329243) (_2!9643 lt!329244)))))

(declare-fun b!209976 () Bool)

(declare-fun Unit!14961 () Unit!14919)

(assert (=> b!209976 (= e!143280 (tuple2!17975 Unit!14961 (_2!9642 lt!328070)))))

(declare-fun lt!329215 () Unit!14919)

(assert (=> b!209976 (= lt!329215 (lemmaIsPrefixRefl!0 (_2!9642 lt!328070)))))

(assert (=> b!209976 call!3306))

(declare-fun lt!329195 () Unit!14919)

(assert (=> b!209976 (= lt!329195 lt!329215)))

(declare-fun b!209977 () Bool)

(declare-fun res!176274 () Bool)

(assert (=> b!209977 (= res!176274 (isPrefixOf!0 (_2!9642 lt!328070) (_2!9642 lt!329223)))))

(assert (=> b!209977 (=> (not res!176274) (not e!143285))))

(assert (= (and d!70963 c!10327) b!209976))

(assert (= (and d!70963 (not c!10327)) b!209967))

(assert (= (and b!209967 res!176276) b!209966))

(assert (= (and b!209966 res!176275) b!209977))

(assert (= (and b!209977 res!176274) b!209963))

(assert (= (and b!209963 res!176272) b!209974))

(assert (= (and b!209967 res!176277) b!209971))

(assert (= (and b!209967 c!10328) b!209964))

(assert (= (and b!209967 (not c!10328)) b!209973))

(assert (= (and b!209967 res!176268) b!209970))

(assert (= (or b!209976 b!209967) bm!3303))

(assert (= (and d!70963 res!176267) b!209968))

(assert (= (and b!209968 res!176271) b!209962))

(assert (= (and b!209962 res!176269) b!209972))

(assert (= (and b!209972 res!176270) b!209965))

(assert (= (and b!209965 res!176266) b!209969))

(assert (= (and b!209965 res!176273) b!209975))

(declare-fun m!323187 () Bool)

(assert (=> b!209967 m!323187))

(assert (=> b!209967 m!322439))

(declare-fun m!323189 () Bool)

(assert (=> b!209967 m!323189))

(declare-fun m!323191 () Bool)

(assert (=> b!209967 m!323191))

(declare-fun m!323193 () Bool)

(assert (=> b!209967 m!323193))

(declare-fun m!323195 () Bool)

(assert (=> b!209967 m!323195))

(declare-fun m!323197 () Bool)

(assert (=> b!209967 m!323197))

(declare-fun m!323199 () Bool)

(assert (=> b!209967 m!323199))

(declare-fun m!323201 () Bool)

(assert (=> b!209967 m!323201))

(declare-fun m!323203 () Bool)

(assert (=> b!209967 m!323203))

(declare-fun m!323205 () Bool)

(assert (=> b!209967 m!323205))

(declare-fun m!323207 () Bool)

(assert (=> b!209967 m!323207))

(declare-fun m!323209 () Bool)

(assert (=> b!209967 m!323209))

(declare-fun m!323211 () Bool)

(assert (=> b!209967 m!323211))

(declare-fun m!323213 () Bool)

(assert (=> b!209967 m!323213))

(declare-fun m!323215 () Bool)

(assert (=> b!209967 m!323215))

(declare-fun m!323217 () Bool)

(assert (=> b!209967 m!323217))

(declare-fun m!323219 () Bool)

(assert (=> b!209967 m!323219))

(declare-fun m!323221 () Bool)

(assert (=> b!209967 m!323221))

(declare-fun m!323223 () Bool)

(assert (=> b!209967 m!323223))

(declare-fun m!323225 () Bool)

(assert (=> b!209967 m!323225))

(declare-fun m!323227 () Bool)

(assert (=> b!209967 m!323227))

(declare-fun m!323229 () Bool)

(assert (=> b!209967 m!323229))

(assert (=> b!209967 m!323223))

(declare-fun m!323231 () Bool)

(assert (=> b!209967 m!323231))

(declare-fun m!323233 () Bool)

(assert (=> b!209967 m!323233))

(declare-fun m!323235 () Bool)

(assert (=> b!209967 m!323235))

(declare-fun m!323237 () Bool)

(assert (=> b!209967 m!323237))

(declare-fun m!323239 () Bool)

(assert (=> b!209967 m!323239))

(declare-fun m!323241 () Bool)

(assert (=> b!209967 m!323241))

(declare-fun m!323243 () Bool)

(assert (=> b!209967 m!323243))

(declare-fun m!323245 () Bool)

(assert (=> b!209967 m!323245))

(declare-fun m!323247 () Bool)

(assert (=> b!209967 m!323247))

(declare-fun m!323249 () Bool)

(assert (=> b!209967 m!323249))

(declare-fun m!323251 () Bool)

(assert (=> bm!3303 m!323251))

(declare-fun m!323253 () Bool)

(assert (=> b!209969 m!323253))

(declare-fun m!323255 () Bool)

(assert (=> b!209972 m!323255))

(assert (=> b!209976 m!322769))

(declare-fun m!323257 () Bool)

(assert (=> b!209965 m!323257))

(assert (=> b!209965 m!323207))

(declare-fun m!323259 () Bool)

(assert (=> b!209965 m!323259))

(declare-fun m!323261 () Bool)

(assert (=> b!209965 m!323261))

(assert (=> b!209965 m!323241))

(declare-fun m!323263 () Bool)

(assert (=> b!209965 m!323263))

(declare-fun m!323265 () Bool)

(assert (=> b!209966 m!323265))

(assert (=> b!209966 m!322439))

(declare-fun m!323267 () Bool)

(assert (=> b!209962 m!323267))

(assert (=> b!209962 m!322439))

(declare-fun m!323269 () Bool)

(assert (=> b!209963 m!323269))

(assert (=> b!209963 m!323269))

(declare-fun m!323271 () Bool)

(assert (=> b!209963 m!323271))

(declare-fun m!323273 () Bool)

(assert (=> b!209977 m!323273))

(declare-fun m!323275 () Bool)

(assert (=> b!209974 m!323275))

(assert (=> b!209974 m!323265))

(declare-fun m!323277 () Bool)

(assert (=> d!70963 m!323277))

(assert (=> b!209553 d!70963))

(declare-fun d!71019 () Bool)

(assert (=> d!71019 (= (invariant!0 (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204) (size!4604 (buf!5118 (_2!9642 lt!328059)))) (and (bvsge (currentBit!9649 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9649 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9654 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9654 thiss!1204) (size!4604 (buf!5118 (_2!9642 lt!328059)))) (and (= (currentBit!9649 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9654 thiss!1204) (size!4604 (buf!5118 (_2!9642 lt!328059))))))))))

(assert (=> b!209549 d!71019))

(declare-fun d!71021 () Bool)

(declare-fun e!143286 () Bool)

(assert (=> d!71021 e!143286))

(declare-fun res!176279 () Bool)

(assert (=> d!71021 (=> (not res!176279) (not e!143286))))

(declare-fun lt!329251 () (_ BitVec 64))

(declare-fun lt!329247 () (_ BitVec 64))

(declare-fun lt!329250 () (_ BitVec 64))

(assert (=> d!71021 (= res!176279 (= lt!329247 (bvsub lt!329250 lt!329251)))))

(assert (=> d!71021 (or (= (bvand lt!329250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329251 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329250 lt!329251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71021 (= lt!329251 (remainingBits!0 ((_ sign_extend 32) (size!4604 (buf!5118 (_1!9645 lt!328064)))) ((_ sign_extend 32) (currentByte!9654 (_1!9645 lt!328064))) ((_ sign_extend 32) (currentBit!9649 (_1!9645 lt!328064)))))))

(declare-fun lt!329249 () (_ BitVec 64))

(declare-fun lt!329252 () (_ BitVec 64))

(assert (=> d!71021 (= lt!329250 (bvmul lt!329249 lt!329252))))

(assert (=> d!71021 (or (= lt!329249 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329252 (bvsdiv (bvmul lt!329249 lt!329252) lt!329249)))))

(assert (=> d!71021 (= lt!329252 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71021 (= lt!329249 ((_ sign_extend 32) (size!4604 (buf!5118 (_1!9645 lt!328064)))))))

(assert (=> d!71021 (= lt!329247 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9654 (_1!9645 lt!328064))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9649 (_1!9645 lt!328064)))))))

(assert (=> d!71021 (invariant!0 (currentBit!9649 (_1!9645 lt!328064)) (currentByte!9654 (_1!9645 lt!328064)) (size!4604 (buf!5118 (_1!9645 lt!328064))))))

(assert (=> d!71021 (= (bitIndex!0 (size!4604 (buf!5118 (_1!9645 lt!328064))) (currentByte!9654 (_1!9645 lt!328064)) (currentBit!9649 (_1!9645 lt!328064))) lt!329247)))

(declare-fun b!209978 () Bool)

(declare-fun res!176278 () Bool)

(assert (=> b!209978 (=> (not res!176278) (not e!143286))))

(assert (=> b!209978 (= res!176278 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329247))))

(declare-fun b!209979 () Bool)

(declare-fun lt!329248 () (_ BitVec 64))

(assert (=> b!209979 (= e!143286 (bvsle lt!329247 (bvmul lt!329248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209979 (or (= lt!329248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329248)))))

(assert (=> b!209979 (= lt!329248 ((_ sign_extend 32) (size!4604 (buf!5118 (_1!9645 lt!328064)))))))

(assert (= (and d!71021 res!176279) b!209978))

(assert (= (and b!209978 res!176278) b!209979))

(declare-fun m!323279 () Bool)

(assert (=> d!71021 m!323279))

(declare-fun m!323281 () Bool)

(assert (=> d!71021 m!323281))

(assert (=> b!209560 d!71021))

(declare-fun d!71023 () Bool)

(assert (=> d!71023 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9649 thiss!1204) (currentByte!9654 thiss!1204) (size!4604 (buf!5118 thiss!1204))))))

(declare-fun bs!17444 () Bool)

(assert (= bs!17444 d!71023))

(assert (=> bs!17444 m!322449))

(assert (=> start!43976 d!71023))

(assert (=> b!209550 d!70941))

(assert (=> b!209550 d!70943))

(check-sat (not b!209963) (not d!70927) (not b!209784) (not b!209767) (not b!209746) (not d!70947) (not bm!3303) (not b!209967) (not d!71021) (not b!209962) (not d!70911) (not b!209977) (not d!70945) (not b!209966) (not b!209747) (not d!70941) (not b!209742) (not d!70909) (not d!70899) (not d!70949) (not b!209728) (not b!209969) (not d!70919) (not d!70933) (not d!70923) (not b!209730) (not d!70915) (not b!209782) (not b!209974) (not d!70907) (not d!70953) (not b!209792) (not d!70961) (not b!209790) (not b!209743) (not b!209744) (not d!70925) (not b!209965) (not d!70917) (not d!70963) (not b!209749) (not d!70913) (not b!209781) (not b!209748) (not d!70951) (not d!70901) (not b!209741) (not b!209765) (not d!70905) (not b!209976) (not d!71023) (not d!70929) (not d!70931) (not b!209764) (not b!209783) (not d!70943) (not b!209972) (not d!70957))
