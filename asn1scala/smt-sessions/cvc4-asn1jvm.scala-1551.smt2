; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43606 () Bool)

(assert start!43606)

(declare-fun b!206441 () Bool)

(declare-fun e!141160 () Bool)

(declare-datatypes ((array!10389 0))(
  ( (array!10390 (arr!5496 (Array (_ BitVec 32) (_ BitVec 8))) (size!4566 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8240 0))(
  ( (BitStream!8241 (buf!5071 array!10389) (currentByte!9589 (_ BitVec 32)) (currentBit!9584 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8240)

(declare-fun array_inv!4307 (array!10389) Bool)

(assert (=> b!206441 (= e!141160 (array_inv!4307 (buf!5071 thiss!1204)))))

(declare-fun b!206442 () Bool)

(declare-fun res!173113 () Bool)

(declare-fun e!141161 () Bool)

(assert (=> b!206442 (=> res!173113 e!141161)))

(declare-datatypes ((Unit!14726 0))(
  ( (Unit!14727) )
))
(declare-datatypes ((tuple2!17642 0))(
  ( (tuple2!17643 (_1!9476 Unit!14726) (_2!9476 BitStream!8240)) )
))
(declare-fun lt!322630 () tuple2!17642)

(declare-fun isPrefixOf!0 (BitStream!8240 BitStream!8240) Bool)

(assert (=> b!206442 (= res!173113 (not (isPrefixOf!0 thiss!1204 (_2!9476 lt!322630))))))

(declare-fun b!206443 () Bool)

(declare-fun e!141159 () Bool)

(declare-datatypes ((tuple2!17644 0))(
  ( (tuple2!17645 (_1!9477 BitStream!8240) (_2!9477 Bool)) )
))
(declare-fun lt!322637 () tuple2!17644)

(declare-fun lt!322628 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206443 (= e!141159 (= (bitIndex!0 (size!4566 (buf!5071 (_1!9477 lt!322637))) (currentByte!9589 (_1!9477 lt!322637)) (currentBit!9584 (_1!9477 lt!322637))) lt!322628))))

(declare-fun b!206444 () Bool)

(declare-fun res!173112 () Bool)

(declare-fun e!141163 () Bool)

(assert (=> b!206444 (=> (not res!173112) (not e!141163))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206444 (= res!173112 (invariant!0 (currentBit!9584 thiss!1204) (currentByte!9589 thiss!1204) (size!4566 (buf!5071 thiss!1204))))))

(declare-fun b!206446 () Bool)

(declare-fun e!141158 () Bool)

(assert (=> b!206446 (= e!141158 e!141159)))

(declare-fun res!173101 () Bool)

(assert (=> b!206446 (=> (not res!173101) (not e!141159))))

(declare-fun lt!322629 () Bool)

(assert (=> b!206446 (= res!173101 (and (= (_2!9477 lt!322637) lt!322629) (= (_1!9477 lt!322637) (_2!9476 lt!322630))))))

(declare-fun readBitPure!0 (BitStream!8240) tuple2!17644)

(declare-fun readerFrom!0 (BitStream!8240 (_ BitVec 32) (_ BitVec 32)) BitStream!8240)

(assert (=> b!206446 (= lt!322637 (readBitPure!0 (readerFrom!0 (_2!9476 lt!322630) (currentBit!9584 thiss!1204) (currentByte!9589 thiss!1204))))))

(declare-fun b!206447 () Bool)

(declare-fun e!141164 () Bool)

(declare-fun lt!322622 () tuple2!17644)

(declare-fun lt!322627 () tuple2!17644)

(assert (=> b!206447 (= e!141164 (= (_2!9477 lt!322622) (_2!9477 lt!322627)))))

(declare-fun b!206448 () Bool)

(declare-fun e!141156 () Bool)

(assert (=> b!206448 (= e!141156 e!141158)))

(declare-fun res!173106 () Bool)

(assert (=> b!206448 (=> (not res!173106) (not e!141158))))

(declare-fun lt!322633 () (_ BitVec 64))

(assert (=> b!206448 (= res!173106 (= lt!322628 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322633)))))

(assert (=> b!206448 (= lt!322628 (bitIndex!0 (size!4566 (buf!5071 (_2!9476 lt!322630))) (currentByte!9589 (_2!9476 lt!322630)) (currentBit!9584 (_2!9476 lt!322630))))))

(assert (=> b!206448 (= lt!322633 (bitIndex!0 (size!4566 (buf!5071 thiss!1204)) (currentByte!9589 thiss!1204) (currentBit!9584 thiss!1204)))))

(declare-fun b!206449 () Bool)

(declare-fun res!173109 () Bool)

(assert (=> b!206449 (=> res!173109 e!141161)))

(declare-fun lt!322631 () tuple2!17642)

(assert (=> b!206449 (= res!173109 (not (invariant!0 (currentBit!9584 (_2!9476 lt!322631)) (currentByte!9589 (_2!9476 lt!322631)) (size!4566 (buf!5071 (_2!9476 lt!322631))))))))

(declare-fun b!206450 () Bool)

(declare-fun e!141157 () Bool)

(assert (=> b!206450 (= e!141163 (not e!141157))))

(declare-fun res!173100 () Bool)

(assert (=> b!206450 (=> res!173100 e!141157)))

(declare-fun lt!322636 () (_ BitVec 64))

(declare-fun lt!322621 () (_ BitVec 64))

(assert (=> b!206450 (= res!173100 (not (= lt!322636 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322621))))))

(assert (=> b!206450 (= lt!322636 (bitIndex!0 (size!4566 (buf!5071 (_2!9476 lt!322630))) (currentByte!9589 (_2!9476 lt!322630)) (currentBit!9584 (_2!9476 lt!322630))))))

(assert (=> b!206450 (= lt!322621 (bitIndex!0 (size!4566 (buf!5071 thiss!1204)) (currentByte!9589 thiss!1204) (currentBit!9584 thiss!1204)))))

(assert (=> b!206450 e!141156))

(declare-fun res!173099 () Bool)

(assert (=> b!206450 (=> (not res!173099) (not e!141156))))

(assert (=> b!206450 (= res!173099 (= (size!4566 (buf!5071 thiss!1204)) (size!4566 (buf!5071 (_2!9476 lt!322630)))))))

(declare-fun appendBit!0 (BitStream!8240 Bool) tuple2!17642)

(assert (=> b!206450 (= lt!322630 (appendBit!0 thiss!1204 lt!322629))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!206450 (= lt!322629 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206451 () Bool)

(assert (=> b!206451 (= e!141157 e!141161)))

(declare-fun res!173114 () Bool)

(assert (=> b!206451 (=> res!173114 e!141161)))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!322624 () (_ BitVec 64))

(assert (=> b!206451 (= res!173114 (not (= lt!322624 (bvsub (bvsub (bvadd lt!322636 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206451 (= lt!322624 (bitIndex!0 (size!4566 (buf!5071 (_2!9476 lt!322631))) (currentByte!9589 (_2!9476 lt!322631)) (currentBit!9584 (_2!9476 lt!322631))))))

(assert (=> b!206451 (isPrefixOf!0 thiss!1204 (_2!9476 lt!322631))))

(declare-fun lt!322635 () Unit!14726)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8240 BitStream!8240 BitStream!8240) Unit!14726)

(assert (=> b!206451 (= lt!322635 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9476 lt!322630) (_2!9476 lt!322631)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8240 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17642)

(assert (=> b!206451 (= lt!322631 (appendBitsLSBFirstLoopTR!0 (_2!9476 lt!322630) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206452 () Bool)

(declare-fun res!173103 () Bool)

(assert (=> b!206452 (=> res!173103 e!141161)))

(assert (=> b!206452 (= res!173103 (not (isPrefixOf!0 (_2!9476 lt!322630) (_2!9476 lt!322631))))))

(declare-fun b!206453 () Bool)

(declare-fun e!141155 () Bool)

(assert (=> b!206453 (= e!141155 e!141163)))

(declare-fun res!173107 () Bool)

(assert (=> b!206453 (=> (not res!173107) (not e!141163))))

(declare-fun lt!322632 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206453 (= res!173107 (validate_offset_bits!1 ((_ sign_extend 32) (size!4566 (buf!5071 thiss!1204))) ((_ sign_extend 32) (currentByte!9589 thiss!1204)) ((_ sign_extend 32) (currentBit!9584 thiss!1204)) lt!322632))))

(assert (=> b!206453 (= lt!322632 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!173110 () Bool)

(assert (=> start!43606 (=> (not res!173110) (not e!141155))))

(assert (=> start!43606 (= res!173110 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43606 e!141155))

(assert (=> start!43606 true))

(declare-fun inv!12 (BitStream!8240) Bool)

(assert (=> start!43606 (and (inv!12 thiss!1204) e!141160)))

(declare-fun b!206445 () Bool)

(declare-fun e!141162 () Bool)

(assert (=> b!206445 (= e!141162 (invariant!0 (currentBit!9584 thiss!1204) (currentByte!9589 thiss!1204) (size!4566 (buf!5071 (_2!9476 lt!322631)))))))

(declare-fun b!206454 () Bool)

(assert (=> b!206454 (= e!141161 (or (not (= (size!4566 (buf!5071 thiss!1204)) (size!4566 (buf!5071 (_2!9476 lt!322631))))) (bvsge lt!322632 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!17646 0))(
  ( (tuple2!17647 (_1!9478 BitStream!8240) (_2!9478 BitStream!8240)) )
))
(declare-fun lt!322626 () tuple2!17646)

(assert (=> b!206454 (= (_2!9477 (readBitPure!0 (_1!9478 lt!322626))) lt!322629)))

(declare-fun lt!322625 () tuple2!17646)

(declare-fun reader!0 (BitStream!8240 BitStream!8240) tuple2!17646)

(assert (=> b!206454 (= lt!322625 (reader!0 (_2!9476 lt!322630) (_2!9476 lt!322631)))))

(assert (=> b!206454 (= lt!322626 (reader!0 thiss!1204 (_2!9476 lt!322631)))))

(assert (=> b!206454 e!141164))

(declare-fun res!173105 () Bool)

(assert (=> b!206454 (=> (not res!173105) (not e!141164))))

(assert (=> b!206454 (= res!173105 (= (bitIndex!0 (size!4566 (buf!5071 (_1!9477 lt!322622))) (currentByte!9589 (_1!9477 lt!322622)) (currentBit!9584 (_1!9477 lt!322622))) (bitIndex!0 (size!4566 (buf!5071 (_1!9477 lt!322627))) (currentByte!9589 (_1!9477 lt!322627)) (currentBit!9584 (_1!9477 lt!322627)))))))

(declare-fun lt!322623 () Unit!14726)

(declare-fun lt!322634 () BitStream!8240)

(declare-fun readBitPrefixLemma!0 (BitStream!8240 BitStream!8240) Unit!14726)

(assert (=> b!206454 (= lt!322623 (readBitPrefixLemma!0 lt!322634 (_2!9476 lt!322631)))))

(assert (=> b!206454 (= lt!322627 (readBitPure!0 (BitStream!8241 (buf!5071 (_2!9476 lt!322631)) (currentByte!9589 thiss!1204) (currentBit!9584 thiss!1204))))))

(assert (=> b!206454 (= lt!322622 (readBitPure!0 lt!322634))))

(assert (=> b!206454 e!141162))

(declare-fun res!173108 () Bool)

(assert (=> b!206454 (=> (not res!173108) (not e!141162))))

(assert (=> b!206454 (= res!173108 (invariant!0 (currentBit!9584 thiss!1204) (currentByte!9589 thiss!1204) (size!4566 (buf!5071 (_2!9476 lt!322630)))))))

(assert (=> b!206454 (= lt!322634 (BitStream!8241 (buf!5071 (_2!9476 lt!322630)) (currentByte!9589 thiss!1204) (currentBit!9584 thiss!1204)))))

(declare-fun b!206455 () Bool)

(declare-fun res!173102 () Bool)

(assert (=> b!206455 (=> res!173102 e!141161)))

(assert (=> b!206455 (= res!173102 (or (not (= (size!4566 (buf!5071 (_2!9476 lt!322631))) (size!4566 (buf!5071 thiss!1204)))) (not (= lt!322624 (bvsub (bvadd lt!322621 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206456 () Bool)

(declare-fun res!173111 () Bool)

(assert (=> b!206456 (=> (not res!173111) (not e!141158))))

(assert (=> b!206456 (= res!173111 (isPrefixOf!0 thiss!1204 (_2!9476 lt!322630)))))

(declare-fun b!206457 () Bool)

(declare-fun res!173104 () Bool)

(assert (=> b!206457 (=> (not res!173104) (not e!141163))))

(assert (=> b!206457 (= res!173104 (not (= i!590 nBits!348)))))

(assert (= (and start!43606 res!173110) b!206453))

(assert (= (and b!206453 res!173107) b!206444))

(assert (= (and b!206444 res!173112) b!206457))

(assert (= (and b!206457 res!173104) b!206450))

(assert (= (and b!206450 res!173099) b!206448))

(assert (= (and b!206448 res!173106) b!206456))

(assert (= (and b!206456 res!173111) b!206446))

(assert (= (and b!206446 res!173101) b!206443))

(assert (= (and b!206450 (not res!173100)) b!206451))

(assert (= (and b!206451 (not res!173114)) b!206449))

(assert (= (and b!206449 (not res!173109)) b!206455))

(assert (= (and b!206455 (not res!173102)) b!206452))

(assert (= (and b!206452 (not res!173103)) b!206442))

(assert (= (and b!206442 (not res!173113)) b!206454))

(assert (= (and b!206454 res!173108) b!206445))

(assert (= (and b!206454 res!173105) b!206447))

(assert (= start!43606 b!206441))

(declare-fun m!318003 () Bool)

(assert (=> b!206443 m!318003))

(declare-fun m!318005 () Bool)

(assert (=> b!206448 m!318005))

(declare-fun m!318007 () Bool)

(assert (=> b!206448 m!318007))

(declare-fun m!318009 () Bool)

(assert (=> start!43606 m!318009))

(declare-fun m!318011 () Bool)

(assert (=> b!206454 m!318011))

(declare-fun m!318013 () Bool)

(assert (=> b!206454 m!318013))

(declare-fun m!318015 () Bool)

(assert (=> b!206454 m!318015))

(declare-fun m!318017 () Bool)

(assert (=> b!206454 m!318017))

(declare-fun m!318019 () Bool)

(assert (=> b!206454 m!318019))

(declare-fun m!318021 () Bool)

(assert (=> b!206454 m!318021))

(declare-fun m!318023 () Bool)

(assert (=> b!206454 m!318023))

(declare-fun m!318025 () Bool)

(assert (=> b!206454 m!318025))

(declare-fun m!318027 () Bool)

(assert (=> b!206454 m!318027))

(declare-fun m!318029 () Bool)

(assert (=> b!206441 m!318029))

(declare-fun m!318031 () Bool)

(assert (=> b!206445 m!318031))

(declare-fun m!318033 () Bool)

(assert (=> b!206456 m!318033))

(declare-fun m!318035 () Bool)

(assert (=> b!206453 m!318035))

(declare-fun m!318037 () Bool)

(assert (=> b!206446 m!318037))

(assert (=> b!206446 m!318037))

(declare-fun m!318039 () Bool)

(assert (=> b!206446 m!318039))

(declare-fun m!318041 () Bool)

(assert (=> b!206444 m!318041))

(assert (=> b!206450 m!318005))

(assert (=> b!206450 m!318007))

(declare-fun m!318043 () Bool)

(assert (=> b!206450 m!318043))

(declare-fun m!318045 () Bool)

(assert (=> b!206449 m!318045))

(declare-fun m!318047 () Bool)

(assert (=> b!206452 m!318047))

(assert (=> b!206442 m!318033))

(declare-fun m!318049 () Bool)

(assert (=> b!206451 m!318049))

(declare-fun m!318051 () Bool)

(assert (=> b!206451 m!318051))

(declare-fun m!318053 () Bool)

(assert (=> b!206451 m!318053))

(declare-fun m!318055 () Bool)

(assert (=> b!206451 m!318055))

(push 1)

(assert (not b!206454))

(assert (not b!206445))

(assert (not b!206443))

(assert (not b!206446))

(assert (not b!206444))

(assert (not b!206456))

(assert (not b!206441))

(assert (not b!206452))

(assert (not b!206449))

(assert (not b!206450))

(assert (not b!206448))

(assert (not b!206442))

(assert (not start!43606))

(assert (not b!206453))

(assert (not b!206451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

