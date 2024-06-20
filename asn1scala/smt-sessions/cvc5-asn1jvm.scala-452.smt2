; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11904 () Bool)

(assert start!11904)

(declare-fun b!60628 () Bool)

(declare-fun e!40482 () Bool)

(declare-datatypes ((array!2761 0))(
  ( (array!2762 (arr!1820 (Array (_ BitVec 32) (_ BitVec 8))) (size!1256 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2200 0))(
  ( (BitStream!2201 (buf!1637 array!2761) (currentByte!3255 (_ BitVec 32)) (currentBit!3250 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5522 0))(
  ( (tuple2!5523 (_1!2872 BitStream!2200) (_2!2872 BitStream!2200)) )
))
(declare-fun lt!94514 () tuple2!5522)

(declare-datatypes ((Unit!4135 0))(
  ( (Unit!4136) )
))
(declare-datatypes ((tuple2!5524 0))(
  ( (tuple2!5525 (_1!2873 Unit!4135) (_2!2873 BitStream!2200)) )
))
(declare-fun lt!94526 () tuple2!5524)

(declare-fun isPrefixOf!0 (BitStream!2200 BitStream!2200) Bool)

(assert (=> b!60628 (= e!40482 (isPrefixOf!0 (_1!2872 lt!94514) (_2!2873 lt!94526)))))

(declare-fun b!60629 () Bool)

(declare-fun e!40478 () Bool)

(declare-fun thiss!1379 () BitStream!2200)

(declare-fun array_inv!1159 (array!2761) Bool)

(assert (=> b!60629 (= e!40478 (array_inv!1159 (buf!1637 thiss!1379)))))

(declare-fun b!60630 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!94521 () tuple2!5522)

(declare-fun lt!94513 () tuple2!5524)

(declare-fun srcBuffer!2 () array!2761)

(declare-fun e!40483 () Bool)

(declare-datatypes ((List!675 0))(
  ( (Nil!672) (Cons!671 (h!790 Bool) (t!1425 List!675)) )
))
(declare-fun head!494 (List!675) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2200 array!2761 (_ BitVec 64) (_ BitVec 64)) List!675)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2200 BitStream!2200 (_ BitVec 64)) List!675)

(assert (=> b!60630 (= e!40483 (= (head!494 (byteArrayBitContentToList!0 (_2!2873 lt!94513) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!494 (bitStreamReadBitsIntoList!0 (_2!2873 lt!94513) (_1!2872 lt!94521) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60631 () Bool)

(declare-fun res!50582 () Bool)

(assert (=> b!60631 (=> res!50582 e!40482)))

(declare-fun lt!94518 () List!675)

(declare-fun length!303 (List!675) Int)

(assert (=> b!60631 (= res!50582 (<= (length!303 lt!94518) 0))))

(declare-fun res!50578 () Bool)

(declare-fun e!40479 () Bool)

(assert (=> start!11904 (=> (not res!50578) (not e!40479))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11904 (= res!50578 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1256 srcBuffer!2))))))))

(assert (=> start!11904 e!40479))

(assert (=> start!11904 true))

(assert (=> start!11904 (array_inv!1159 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2200) Bool)

(assert (=> start!11904 (and (inv!12 thiss!1379) e!40478)))

(declare-fun b!60632 () Bool)

(declare-fun e!40481 () Bool)

(assert (=> b!60632 (= e!40479 (not e!40481))))

(declare-fun res!50585 () Bool)

(assert (=> b!60632 (=> res!50585 e!40481)))

(assert (=> b!60632 (= res!50585 (bvsge i!635 to!314))))

(assert (=> b!60632 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94516 () Unit!4135)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2200) Unit!4135)

(assert (=> b!60632 (= lt!94516 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!94525 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60632 (= lt!94525 (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)))))

(declare-fun b!60633 () Bool)

(declare-fun res!50581 () Bool)

(assert (=> b!60633 (=> (not res!50581) (not e!40479))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60633 (= res!50581 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 thiss!1379))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60634 () Bool)

(declare-fun e!40477 () Bool)

(declare-fun e!40486 () Bool)

(assert (=> b!60634 (= e!40477 e!40486)))

(declare-fun res!50572 () Bool)

(assert (=> b!60634 (=> res!50572 e!40486)))

(declare-fun lt!94519 () (_ BitVec 64))

(assert (=> b!60634 (= res!50572 (not (= lt!94519 (bvsub (bvadd lt!94525 to!314) i!635))))))

(assert (=> b!60634 (= lt!94519 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94526))) (currentByte!3255 (_2!2873 lt!94526)) (currentBit!3250 (_2!2873 lt!94526))))))

(declare-fun b!60635 () Bool)

(declare-fun res!50583 () Bool)

(declare-fun e!40485 () Bool)

(assert (=> b!60635 (=> res!50583 e!40485)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60635 (= res!50583 (not (invariant!0 (currentBit!3250 (_2!2873 lt!94513)) (currentByte!3255 (_2!2873 lt!94513)) (size!1256 (buf!1637 (_2!2873 lt!94513))))))))

(declare-fun b!60636 () Bool)

(declare-fun e!40476 () Bool)

(assert (=> b!60636 (= e!40476 e!40477)))

(declare-fun res!50586 () Bool)

(assert (=> b!60636 (=> res!50586 e!40477)))

(assert (=> b!60636 (= res!50586 (not (isPrefixOf!0 (_2!2873 lt!94513) (_2!2873 lt!94526))))))

(assert (=> b!60636 (isPrefixOf!0 thiss!1379 (_2!2873 lt!94526))))

(declare-fun lt!94527 () Unit!4135)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2200 BitStream!2200 BitStream!2200) Unit!4135)

(assert (=> b!60636 (= lt!94527 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2873 lt!94513) (_2!2873 lt!94526)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2200 array!2761 (_ BitVec 64) (_ BitVec 64)) tuple2!5524)

(assert (=> b!60636 (= lt!94526 (appendBitsMSBFirstLoop!0 (_2!2873 lt!94513) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!60636 e!40483))

(declare-fun res!50580 () Bool)

(assert (=> b!60636 (=> (not res!50580) (not e!40483))))

(assert (=> b!60636 (= res!50580 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94528 () Unit!4135)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2200 array!2761 (_ BitVec 64)) Unit!4135)

(assert (=> b!60636 (= lt!94528 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1637 (_2!2873 lt!94513)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2200 BitStream!2200) tuple2!5522)

(assert (=> b!60636 (= lt!94521 (reader!0 thiss!1379 (_2!2873 lt!94513)))))

(declare-fun b!60637 () Bool)

(declare-fun res!50576 () Bool)

(assert (=> b!60637 (=> res!50576 e!40486)))

(assert (=> b!60637 (= res!50576 (not (= (size!1256 (buf!1637 thiss!1379)) (size!1256 (buf!1637 (_2!2873 lt!94526))))))))

(declare-fun b!60638 () Bool)

(assert (=> b!60638 (= e!40485 e!40482)))

(declare-fun res!50573 () Bool)

(assert (=> b!60638 (=> res!50573 e!40482)))

(assert (=> b!60638 (= res!50573 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94515 () List!675)

(declare-fun lt!94517 () (_ BitVec 64))

(declare-fun lt!94524 () tuple2!5522)

(assert (=> b!60638 (= lt!94515 (bitStreamReadBitsIntoList!0 (_2!2873 lt!94526) (_1!2872 lt!94524) lt!94517))))

(assert (=> b!60638 (= lt!94518 (bitStreamReadBitsIntoList!0 (_2!2873 lt!94526) (_1!2872 lt!94514) (bvsub to!314 i!635)))))

(assert (=> b!60638 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) lt!94517)))

(declare-fun lt!94523 () Unit!4135)

(assert (=> b!60638 (= lt!94523 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2873 lt!94513) (buf!1637 (_2!2873 lt!94526)) lt!94517))))

(assert (=> b!60638 (= lt!94524 (reader!0 (_2!2873 lt!94513) (_2!2873 lt!94526)))))

(assert (=> b!60638 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94522 () Unit!4135)

(assert (=> b!60638 (= lt!94522 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1637 (_2!2873 lt!94526)) (bvsub to!314 i!635)))))

(assert (=> b!60638 (= lt!94514 (reader!0 thiss!1379 (_2!2873 lt!94526)))))

(declare-fun b!60639 () Bool)

(declare-fun res!50574 () Bool)

(assert (=> b!60639 (=> res!50574 e!40486)))

(assert (=> b!60639 (= res!50574 (not (invariant!0 (currentBit!3250 (_2!2873 lt!94526)) (currentByte!3255 (_2!2873 lt!94526)) (size!1256 (buf!1637 (_2!2873 lt!94526))))))))

(declare-fun b!60640 () Bool)

(assert (=> b!60640 (= e!40486 e!40485)))

(declare-fun res!50579 () Bool)

(assert (=> b!60640 (=> res!50579 e!40485)))

(assert (=> b!60640 (= res!50579 (not (= (size!1256 (buf!1637 (_2!2873 lt!94513))) (size!1256 (buf!1637 (_2!2873 lt!94526))))))))

(declare-fun e!40484 () Bool)

(assert (=> b!60640 e!40484))

(declare-fun res!50575 () Bool)

(assert (=> b!60640 (=> (not res!50575) (not e!40484))))

(assert (=> b!60640 (= res!50575 (= (size!1256 (buf!1637 (_2!2873 lt!94526))) (size!1256 (buf!1637 thiss!1379))))))

(declare-fun b!60641 () Bool)

(assert (=> b!60641 (= e!40484 (= lt!94519 (bvsub (bvsub (bvadd (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60642 () Bool)

(declare-fun res!50584 () Bool)

(assert (=> b!60642 (=> res!50584 e!40485)))

(assert (=> b!60642 (= res!50584 (not (invariant!0 (currentBit!3250 (_2!2873 lt!94513)) (currentByte!3255 (_2!2873 lt!94513)) (size!1256 (buf!1637 (_2!2873 lt!94526))))))))

(declare-fun b!60643 () Bool)

(assert (=> b!60643 (= e!40481 e!40476)))

(declare-fun res!50577 () Bool)

(assert (=> b!60643 (=> res!50577 e!40476)))

(assert (=> b!60643 (= res!50577 (not (isPrefixOf!0 thiss!1379 (_2!2873 lt!94513))))))

(assert (=> b!60643 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) lt!94517)))

(assert (=> b!60643 (= lt!94517 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94520 () Unit!4135)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2200 BitStream!2200 (_ BitVec 64) (_ BitVec 64)) Unit!4135)

(assert (=> b!60643 (= lt!94520 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2873 lt!94513) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2200 (_ BitVec 8) (_ BitVec 32)) tuple2!5524)

(assert (=> b!60643 (= lt!94513 (appendBitFromByte!0 thiss!1379 (select (arr!1820 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!11904 res!50578) b!60633))

(assert (= (and b!60633 res!50581) b!60632))

(assert (= (and b!60632 (not res!50585)) b!60643))

(assert (= (and b!60643 (not res!50577)) b!60636))

(assert (= (and b!60636 res!50580) b!60630))

(assert (= (and b!60636 (not res!50586)) b!60634))

(assert (= (and b!60634 (not res!50572)) b!60639))

(assert (= (and b!60639 (not res!50574)) b!60637))

(assert (= (and b!60637 (not res!50576)) b!60640))

(assert (= (and b!60640 res!50575) b!60641))

(assert (= (and b!60640 (not res!50579)) b!60635))

(assert (= (and b!60635 (not res!50583)) b!60642))

(assert (= (and b!60642 (not res!50584)) b!60638))

(assert (= (and b!60638 (not res!50573)) b!60631))

(assert (= (and b!60631 (not res!50582)) b!60628))

(assert (= start!11904 b!60629))

(declare-fun m!95539 () Bool)

(assert (=> b!60639 m!95539))

(declare-fun m!95541 () Bool)

(assert (=> b!60642 m!95541))

(declare-fun m!95543 () Bool)

(assert (=> start!11904 m!95543))

(declare-fun m!95545 () Bool)

(assert (=> start!11904 m!95545))

(declare-fun m!95547 () Bool)

(assert (=> b!60638 m!95547))

(declare-fun m!95549 () Bool)

(assert (=> b!60638 m!95549))

(declare-fun m!95551 () Bool)

(assert (=> b!60638 m!95551))

(declare-fun m!95553 () Bool)

(assert (=> b!60638 m!95553))

(declare-fun m!95555 () Bool)

(assert (=> b!60638 m!95555))

(declare-fun m!95557 () Bool)

(assert (=> b!60638 m!95557))

(declare-fun m!95559 () Bool)

(assert (=> b!60638 m!95559))

(declare-fun m!95561 () Bool)

(assert (=> b!60638 m!95561))

(declare-fun m!95563 () Bool)

(assert (=> b!60632 m!95563))

(declare-fun m!95565 () Bool)

(assert (=> b!60632 m!95565))

(declare-fun m!95567 () Bool)

(assert (=> b!60632 m!95567))

(declare-fun m!95569 () Bool)

(assert (=> b!60643 m!95569))

(declare-fun m!95571 () Bool)

(assert (=> b!60643 m!95571))

(declare-fun m!95573 () Bool)

(assert (=> b!60643 m!95573))

(declare-fun m!95575 () Bool)

(assert (=> b!60643 m!95575))

(assert (=> b!60643 m!95573))

(declare-fun m!95577 () Bool)

(assert (=> b!60643 m!95577))

(declare-fun m!95579 () Bool)

(assert (=> b!60631 m!95579))

(declare-fun m!95581 () Bool)

(assert (=> b!60634 m!95581))

(declare-fun m!95583 () Bool)

(assert (=> b!60635 m!95583))

(declare-fun m!95585 () Bool)

(assert (=> b!60641 m!95585))

(declare-fun m!95587 () Bool)

(assert (=> b!60628 m!95587))

(declare-fun m!95589 () Bool)

(assert (=> b!60630 m!95589))

(assert (=> b!60630 m!95589))

(declare-fun m!95591 () Bool)

(assert (=> b!60630 m!95591))

(declare-fun m!95593 () Bool)

(assert (=> b!60630 m!95593))

(assert (=> b!60630 m!95593))

(declare-fun m!95595 () Bool)

(assert (=> b!60630 m!95595))

(declare-fun m!95597 () Bool)

(assert (=> b!60629 m!95597))

(declare-fun m!95599 () Bool)

(assert (=> b!60633 m!95599))

(declare-fun m!95601 () Bool)

(assert (=> b!60636 m!95601))

(declare-fun m!95603 () Bool)

(assert (=> b!60636 m!95603))

(declare-fun m!95605 () Bool)

(assert (=> b!60636 m!95605))

(declare-fun m!95607 () Bool)

(assert (=> b!60636 m!95607))

(declare-fun m!95609 () Bool)

(assert (=> b!60636 m!95609))

(declare-fun m!95611 () Bool)

(assert (=> b!60636 m!95611))

(declare-fun m!95613 () Bool)

(assert (=> b!60636 m!95613))

(push 1)

(assert (not b!60643))

(assert (not b!60635))

(assert (not b!60634))

(assert (not b!60636))

(assert (not b!60638))

(assert (not b!60642))

(assert (not b!60633))

(assert (not b!60628))

(assert (not b!60630))

(assert (not start!11904))

(assert (not b!60631))

(assert (not b!60632))

(assert (not b!60629))

(assert (not b!60639))

(assert (not b!60641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!60817 () Bool)

(declare-fun e!40598 () Unit!4135)

(declare-fun Unit!4151 () Unit!4135)

(assert (=> b!60817 (= e!40598 Unit!4151)))

(declare-fun b!60818 () Bool)

(declare-fun res!50724 () Bool)

(declare-fun e!40597 () Bool)

(assert (=> b!60818 (=> (not res!50724) (not e!40597))))

(declare-fun lt!94822 () tuple2!5522)

(assert (=> b!60818 (= res!50724 (isPrefixOf!0 (_2!2872 lt!94822) (_2!2873 lt!94513)))))

(declare-fun b!60820 () Bool)

(declare-fun lt!94824 () Unit!4135)

(assert (=> b!60820 (= e!40598 lt!94824)))

(declare-fun lt!94825 () (_ BitVec 64))

(assert (=> b!60820 (= lt!94825 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94826 () (_ BitVec 64))

(assert (=> b!60820 (= lt!94826 (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2761 array!2761 (_ BitVec 64) (_ BitVec 64)) Unit!4135)

(assert (=> b!60820 (= lt!94824 (arrayBitRangesEqSymmetric!0 (buf!1637 thiss!1379) (buf!1637 (_2!2873 lt!94513)) lt!94825 lt!94826))))

(declare-fun arrayBitRangesEq!0 (array!2761 array!2761 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60820 (arrayBitRangesEq!0 (buf!1637 (_2!2873 lt!94513)) (buf!1637 thiss!1379) lt!94825 lt!94826)))

(declare-fun lt!94823 () (_ BitVec 64))

(declare-fun b!60821 () Bool)

(declare-fun lt!94833 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2200 (_ BitVec 64)) BitStream!2200)

(assert (=> b!60821 (= e!40597 (= (_1!2872 lt!94822) (withMovedBitIndex!0 (_2!2872 lt!94822) (bvsub lt!94823 lt!94833))))))

(assert (=> b!60821 (or (= (bvand lt!94823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!94833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!94823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!94823 lt!94833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60821 (= lt!94833 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))))))

(assert (=> b!60821 (= lt!94823 (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)))))

(declare-fun d!18636 () Bool)

(assert (=> d!18636 e!40597))

(declare-fun res!50722 () Bool)

(assert (=> d!18636 (=> (not res!50722) (not e!40597))))

(assert (=> d!18636 (= res!50722 (isPrefixOf!0 (_1!2872 lt!94822) (_2!2872 lt!94822)))))

(declare-fun lt!94835 () BitStream!2200)

(assert (=> d!18636 (= lt!94822 (tuple2!5523 lt!94835 (_2!2873 lt!94513)))))

(declare-fun lt!94829 () Unit!4135)

(declare-fun lt!94832 () Unit!4135)

(assert (=> d!18636 (= lt!94829 lt!94832)))

(assert (=> d!18636 (isPrefixOf!0 lt!94835 (_2!2873 lt!94513))))

(assert (=> d!18636 (= lt!94832 (lemmaIsPrefixTransitive!0 lt!94835 (_2!2873 lt!94513) (_2!2873 lt!94513)))))

(declare-fun lt!94830 () Unit!4135)

(declare-fun lt!94841 () Unit!4135)

(assert (=> d!18636 (= lt!94830 lt!94841)))

(assert (=> d!18636 (isPrefixOf!0 lt!94835 (_2!2873 lt!94513))))

(assert (=> d!18636 (= lt!94841 (lemmaIsPrefixTransitive!0 lt!94835 thiss!1379 (_2!2873 lt!94513)))))

(declare-fun lt!94827 () Unit!4135)

(assert (=> d!18636 (= lt!94827 e!40598)))

(declare-fun c!4244 () Bool)

(assert (=> d!18636 (= c!4244 (not (= (size!1256 (buf!1637 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!94836 () Unit!4135)

(declare-fun lt!94834 () Unit!4135)

(assert (=> d!18636 (= lt!94836 lt!94834)))

(assert (=> d!18636 (isPrefixOf!0 (_2!2873 lt!94513) (_2!2873 lt!94513))))

(assert (=> d!18636 (= lt!94834 (lemmaIsPrefixRefl!0 (_2!2873 lt!94513)))))

(declare-fun lt!94839 () Unit!4135)

(declare-fun lt!94828 () Unit!4135)

(assert (=> d!18636 (= lt!94839 lt!94828)))

(assert (=> d!18636 (= lt!94828 (lemmaIsPrefixRefl!0 (_2!2873 lt!94513)))))

(declare-fun lt!94838 () Unit!4135)

(declare-fun lt!94831 () Unit!4135)

(assert (=> d!18636 (= lt!94838 lt!94831)))

(assert (=> d!18636 (isPrefixOf!0 lt!94835 lt!94835)))

(assert (=> d!18636 (= lt!94831 (lemmaIsPrefixRefl!0 lt!94835))))

(declare-fun lt!94840 () Unit!4135)

(declare-fun lt!94837 () Unit!4135)

(assert (=> d!18636 (= lt!94840 lt!94837)))

(assert (=> d!18636 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18636 (= lt!94837 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18636 (= lt!94835 (BitStream!2201 (buf!1637 (_2!2873 lt!94513)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)))))

(assert (=> d!18636 (isPrefixOf!0 thiss!1379 (_2!2873 lt!94513))))

(assert (=> d!18636 (= (reader!0 thiss!1379 (_2!2873 lt!94513)) lt!94822)))

(declare-fun b!60819 () Bool)

(declare-fun res!50723 () Bool)

(assert (=> b!60819 (=> (not res!50723) (not e!40597))))

(assert (=> b!60819 (= res!50723 (isPrefixOf!0 (_1!2872 lt!94822) thiss!1379))))

(assert (= (and d!18636 c!4244) b!60820))

(assert (= (and d!18636 (not c!4244)) b!60817))

(assert (= (and d!18636 res!50722) b!60819))

(assert (= (and b!60819 res!50723) b!60818))

(assert (= (and b!60818 res!50724) b!60821))

(assert (=> d!18636 m!95565))

(declare-fun m!95831 () Bool)

(assert (=> d!18636 m!95831))

(declare-fun m!95833 () Bool)

(assert (=> d!18636 m!95833))

(declare-fun m!95835 () Bool)

(assert (=> d!18636 m!95835))

(declare-fun m!95837 () Bool)

(assert (=> d!18636 m!95837))

(declare-fun m!95839 () Bool)

(assert (=> d!18636 m!95839))

(declare-fun m!95841 () Bool)

(assert (=> d!18636 m!95841))

(declare-fun m!95843 () Bool)

(assert (=> d!18636 m!95843))

(assert (=> d!18636 m!95571))

(declare-fun m!95845 () Bool)

(assert (=> d!18636 m!95845))

(assert (=> d!18636 m!95563))

(declare-fun m!95847 () Bool)

(assert (=> b!60821 m!95847))

(assert (=> b!60821 m!95585))

(assert (=> b!60821 m!95567))

(assert (=> b!60820 m!95567))

(declare-fun m!95849 () Bool)

(assert (=> b!60820 m!95849))

(declare-fun m!95851 () Bool)

(assert (=> b!60820 m!95851))

(declare-fun m!95853 () Bool)

(assert (=> b!60819 m!95853))

(declare-fun m!95855 () Bool)

(assert (=> b!60818 m!95855))

(assert (=> b!60636 d!18636))

(declare-fun d!18640 () Bool)

(declare-fun res!50739 () Bool)

(declare-fun e!40608 () Bool)

(assert (=> d!18640 (=> (not res!50739) (not e!40608))))

(assert (=> d!18640 (= res!50739 (= (size!1256 (buf!1637 thiss!1379)) (size!1256 (buf!1637 (_2!2873 lt!94526)))))))

(assert (=> d!18640 (= (isPrefixOf!0 thiss!1379 (_2!2873 lt!94526)) e!40608)))

(declare-fun b!60838 () Bool)

(declare-fun res!50738 () Bool)

(assert (=> b!60838 (=> (not res!50738) (not e!40608))))

(assert (=> b!60838 (= res!50738 (bvsle (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)) (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94526))) (currentByte!3255 (_2!2873 lt!94526)) (currentBit!3250 (_2!2873 lt!94526)))))))

(declare-fun b!60839 () Bool)

(declare-fun e!40607 () Bool)

(assert (=> b!60839 (= e!40608 e!40607)))

(declare-fun res!50737 () Bool)

(assert (=> b!60839 (=> res!50737 e!40607)))

(assert (=> b!60839 (= res!50737 (= (size!1256 (buf!1637 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!60840 () Bool)

(assert (=> b!60840 (= e!40607 (arrayBitRangesEq!0 (buf!1637 thiss!1379) (buf!1637 (_2!2873 lt!94526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379))))))

(assert (= (and d!18640 res!50739) b!60838))

(assert (= (and b!60838 res!50738) b!60839))

(assert (= (and b!60839 (not res!50737)) b!60840))

(assert (=> b!60838 m!95567))

(assert (=> b!60838 m!95581))

(assert (=> b!60840 m!95567))

(assert (=> b!60840 m!95567))

(declare-fun m!95911 () Bool)

(assert (=> b!60840 m!95911))

(assert (=> b!60636 d!18640))

(declare-fun d!18648 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18648 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4674 () Bool)

(assert (= bs!4674 d!18648))

(declare-fun m!95913 () Bool)

(assert (=> bs!4674 m!95913))

(assert (=> b!60636 d!18648))

(declare-fun d!18650 () Bool)

(assert (=> d!18650 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!94885 () Unit!4135)

(declare-fun choose!9 (BitStream!2200 array!2761 (_ BitVec 64) BitStream!2200) Unit!4135)

(assert (=> d!18650 (= lt!94885 (choose!9 thiss!1379 (buf!1637 (_2!2873 lt!94513)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2201 (buf!1637 (_2!2873 lt!94513)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379))))))

(assert (=> d!18650 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1637 (_2!2873 lt!94513)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!94885)))

(declare-fun bs!4675 () Bool)

(assert (= bs!4675 d!18650))

(assert (=> bs!4675 m!95601))

(declare-fun m!95915 () Bool)

(assert (=> bs!4675 m!95915))

(assert (=> b!60636 d!18650))

(declare-fun d!18652 () Bool)

(assert (=> d!18652 (isPrefixOf!0 thiss!1379 (_2!2873 lt!94526))))

(declare-fun lt!94888 () Unit!4135)

(declare-fun choose!30 (BitStream!2200 BitStream!2200 BitStream!2200) Unit!4135)

(assert (=> d!18652 (= lt!94888 (choose!30 thiss!1379 (_2!2873 lt!94513) (_2!2873 lt!94526)))))

(assert (=> d!18652 (isPrefixOf!0 thiss!1379 (_2!2873 lt!94513))))

(assert (=> d!18652 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2873 lt!94513) (_2!2873 lt!94526)) lt!94888)))

(declare-fun bs!4676 () Bool)

(assert (= bs!4676 d!18652))

(assert (=> bs!4676 m!95605))

(declare-fun m!95917 () Bool)

(assert (=> bs!4676 m!95917))

(assert (=> bs!4676 m!95571))

(assert (=> b!60636 d!18652))

(declare-fun call!769 () tuple2!5522)

(declare-fun c!4266 () Bool)

(declare-fun lt!95274 () tuple2!5524)

(declare-fun bm!766 () Bool)

(declare-fun lt!95269 () tuple2!5524)

(assert (=> bm!766 (= call!769 (reader!0 (ite c!4266 (_2!2873 lt!95269) (_2!2873 lt!94513)) (ite c!4266 (_2!2873 lt!95274) (_2!2873 lt!94513))))))

(declare-fun b!61007 () Bool)

(declare-fun e!40694 () tuple2!5524)

(declare-fun Unit!4153 () Unit!4135)

(assert (=> b!61007 (= e!40694 (tuple2!5525 Unit!4153 (_2!2873 lt!94513)))))

(assert (=> b!61007 (= (size!1256 (buf!1637 (_2!2873 lt!94513))) (size!1256 (buf!1637 (_2!2873 lt!94513))))))

(declare-fun lt!95309 () Unit!4135)

(declare-fun Unit!4154 () Unit!4135)

(assert (=> b!61007 (= lt!95309 Unit!4154)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2200 array!2761 array!2761 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5542 0))(
  ( (tuple2!5543 (_1!2882 array!2761) (_2!2882 BitStream!2200)) )
))
(declare-fun readBits!0 (BitStream!2200 (_ BitVec 64)) tuple2!5542)

(assert (=> b!61007 (checkByteArrayBitContent!0 (_2!2873 lt!94513) srcBuffer!2 (_1!2882 (readBits!0 (_1!2872 call!769) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!61008 () Bool)

(declare-fun res!50870 () Bool)

(declare-fun e!40693 () Bool)

(assert (=> b!61008 (=> (not res!50870) (not e!40693))))

(declare-fun lt!95305 () tuple2!5524)

(assert (=> b!61008 (= res!50870 (invariant!0 (currentBit!3250 (_2!2873 lt!95305)) (currentByte!3255 (_2!2873 lt!95305)) (size!1256 (buf!1637 (_2!2873 lt!95305)))))))

(declare-fun d!18654 () Bool)

(assert (=> d!18654 e!40693))

(declare-fun res!50866 () Bool)

(assert (=> d!18654 (=> (not res!50866) (not e!40693))))

(declare-fun lt!95288 () (_ BitVec 64))

(assert (=> d!18654 (= res!50866 (= (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!95305))) (currentByte!3255 (_2!2873 lt!95305)) (currentBit!3250 (_2!2873 lt!95305))) (bvsub lt!95288 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18654 (or (= (bvand lt!95288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95288 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!95285 () (_ BitVec 64))

(assert (=> d!18654 (= lt!95288 (bvadd lt!95285 to!314))))

(assert (=> d!18654 (or (not (= (bvand lt!95285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!95285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!95285 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18654 (= lt!95285 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))))))

(assert (=> d!18654 (= lt!95305 e!40694)))

(assert (=> d!18654 (= c!4266 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!95281 () Unit!4135)

(declare-fun lt!95289 () Unit!4135)

(assert (=> d!18654 (= lt!95281 lt!95289)))

(assert (=> d!18654 (isPrefixOf!0 (_2!2873 lt!94513) (_2!2873 lt!94513))))

(assert (=> d!18654 (= lt!95289 (lemmaIsPrefixRefl!0 (_2!2873 lt!94513)))))

(declare-fun lt!95280 () (_ BitVec 64))

(assert (=> d!18654 (= lt!95280 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))))))

(assert (=> d!18654 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18654 (= (appendBitsMSBFirstLoop!0 (_2!2873 lt!94513) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!95305)))

(declare-fun b!61009 () Bool)

(declare-fun e!40695 () Bool)

(declare-fun lt!95284 () (_ BitVec 64))

(assert (=> b!61009 (= e!40695 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) lt!95284))))

(declare-fun b!61010 () Bool)

(declare-fun res!50867 () Bool)

(assert (=> b!61010 (=> (not res!50867) (not e!40693))))

(assert (=> b!61010 (= res!50867 (isPrefixOf!0 (_2!2873 lt!94513) (_2!2873 lt!95305)))))

(declare-fun lt!95293 () tuple2!5522)

(declare-fun b!61011 () Bool)

(assert (=> b!61011 (= e!40693 (= (bitStreamReadBitsIntoList!0 (_2!2873 lt!95305) (_1!2872 lt!95293) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2873 lt!95305) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!61011 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61011 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!95291 () Unit!4135)

(declare-fun lt!95302 () Unit!4135)

(assert (=> b!61011 (= lt!95291 lt!95302)))

(assert (=> b!61011 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!95305)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) lt!95284)))

(assert (=> b!61011 (= lt!95302 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2873 lt!94513) (buf!1637 (_2!2873 lt!95305)) lt!95284))))

(assert (=> b!61011 e!40695))

(declare-fun res!50871 () Bool)

(assert (=> b!61011 (=> (not res!50871) (not e!40695))))

(assert (=> b!61011 (= res!50871 (and (= (size!1256 (buf!1637 (_2!2873 lt!94513))) (size!1256 (buf!1637 (_2!2873 lt!95305)))) (bvsge lt!95284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61011 (= lt!95284 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!61011 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61011 (= lt!95293 (reader!0 (_2!2873 lt!94513) (_2!2873 lt!95305)))))

(declare-fun b!61012 () Bool)

(declare-fun res!50868 () Bool)

(assert (=> b!61012 (=> (not res!50868) (not e!40693))))

(assert (=> b!61012 (= res!50868 (= (size!1256 (buf!1637 (_2!2873 lt!95305))) (size!1256 (buf!1637 (_2!2873 lt!94513)))))))

(declare-fun b!61013 () Bool)

(declare-fun res!50869 () Bool)

(assert (=> b!61013 (=> (not res!50869) (not e!40693))))

(assert (=> b!61013 (= res!50869 (= (size!1256 (buf!1637 (_2!2873 lt!94513))) (size!1256 (buf!1637 (_2!2873 lt!95305)))))))

(declare-fun b!61014 () Bool)

(declare-fun Unit!4156 () Unit!4135)

(assert (=> b!61014 (= e!40694 (tuple2!5525 Unit!4156 (_2!2873 lt!95274)))))

(assert (=> b!61014 (= lt!95269 (appendBitFromByte!0 (_2!2873 lt!94513) (select (arr!1820 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!95298 () (_ BitVec 64))

(assert (=> b!61014 (= lt!95298 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95312 () (_ BitVec 64))

(assert (=> b!61014 (= lt!95312 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!95308 () Unit!4135)

(assert (=> b!61014 (= lt!95308 (validateOffsetBitsIneqLemma!0 (_2!2873 lt!94513) (_2!2873 lt!95269) lt!95298 lt!95312))))

(assert (=> b!61014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!95269)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!95269))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!95269))) (bvsub lt!95298 lt!95312))))

(declare-fun lt!95287 () Unit!4135)

(assert (=> b!61014 (= lt!95287 lt!95308)))

(declare-fun lt!95292 () tuple2!5522)

(assert (=> b!61014 (= lt!95292 (reader!0 (_2!2873 lt!94513) (_2!2873 lt!95269)))))

(declare-fun lt!95290 () (_ BitVec 64))

(assert (=> b!61014 (= lt!95290 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!95304 () Unit!4135)

(assert (=> b!61014 (= lt!95304 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2873 lt!94513) (buf!1637 (_2!2873 lt!95269)) lt!95290))))

(assert (=> b!61014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!95269)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) lt!95290)))

(declare-fun lt!95294 () Unit!4135)

(assert (=> b!61014 (= lt!95294 lt!95304)))

(assert (=> b!61014 (= (head!494 (byteArrayBitContentToList!0 (_2!2873 lt!95269) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!494 (bitStreamReadBitsIntoList!0 (_2!2873 lt!95269) (_1!2872 lt!95292) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!95286 () Unit!4135)

(declare-fun Unit!4157 () Unit!4135)

(assert (=> b!61014 (= lt!95286 Unit!4157)))

(assert (=> b!61014 (= lt!95274 (appendBitsMSBFirstLoop!0 (_2!2873 lt!95269) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!95275 () Unit!4135)

(assert (=> b!61014 (= lt!95275 (lemmaIsPrefixTransitive!0 (_2!2873 lt!94513) (_2!2873 lt!95269) (_2!2873 lt!95274)))))

(assert (=> b!61014 (isPrefixOf!0 (_2!2873 lt!94513) (_2!2873 lt!95274))))

(declare-fun lt!95271 () Unit!4135)

(assert (=> b!61014 (= lt!95271 lt!95275)))

(assert (=> b!61014 (= (size!1256 (buf!1637 (_2!2873 lt!95274))) (size!1256 (buf!1637 (_2!2873 lt!94513))))))

(declare-fun lt!95296 () Unit!4135)

(declare-fun Unit!4158 () Unit!4135)

(assert (=> b!61014 (= lt!95296 Unit!4158)))

(assert (=> b!61014 (= (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!95274))) (currentByte!3255 (_2!2873 lt!95274)) (currentBit!3250 (_2!2873 lt!95274))) (bvsub (bvadd (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95282 () Unit!4135)

(declare-fun Unit!4159 () Unit!4135)

(assert (=> b!61014 (= lt!95282 Unit!4159)))

(assert (=> b!61014 (= (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!95274))) (currentByte!3255 (_2!2873 lt!95274)) (currentBit!3250 (_2!2873 lt!95274))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!95269))) (currentByte!3255 (_2!2873 lt!95269)) (currentBit!3250 (_2!2873 lt!95269))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95306 () Unit!4135)

(declare-fun Unit!4160 () Unit!4135)

(assert (=> b!61014 (= lt!95306 Unit!4160)))

(declare-fun lt!95299 () tuple2!5522)

(assert (=> b!61014 (= lt!95299 (reader!0 (_2!2873 lt!94513) (_2!2873 lt!95274)))))

(declare-fun lt!95310 () (_ BitVec 64))

(assert (=> b!61014 (= lt!95310 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95295 () Unit!4135)

(assert (=> b!61014 (= lt!95295 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2873 lt!94513) (buf!1637 (_2!2873 lt!95274)) lt!95310))))

(assert (=> b!61014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!95274)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) lt!95310)))

(declare-fun lt!95273 () Unit!4135)

(assert (=> b!61014 (= lt!95273 lt!95295)))

(declare-fun lt!95270 () tuple2!5522)

(assert (=> b!61014 (= lt!95270 call!769)))

(declare-fun lt!95276 () (_ BitVec 64))

(assert (=> b!61014 (= lt!95276 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95307 () Unit!4135)

(assert (=> b!61014 (= lt!95307 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2873 lt!95269) (buf!1637 (_2!2873 lt!95274)) lt!95276))))

(assert (=> b!61014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!95274)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!95269))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!95269))) lt!95276)))

(declare-fun lt!95283 () Unit!4135)

(assert (=> b!61014 (= lt!95283 lt!95307)))

(declare-fun lt!95297 () List!675)

(assert (=> b!61014 (= lt!95297 (byteArrayBitContentToList!0 (_2!2873 lt!95274) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!95279 () List!675)

(assert (=> b!61014 (= lt!95279 (byteArrayBitContentToList!0 (_2!2873 lt!95274) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!95278 () List!675)

(assert (=> b!61014 (= lt!95278 (bitStreamReadBitsIntoList!0 (_2!2873 lt!95274) (_1!2872 lt!95299) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!95303 () List!675)

(assert (=> b!61014 (= lt!95303 (bitStreamReadBitsIntoList!0 (_2!2873 lt!95274) (_1!2872 lt!95270) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!95300 () (_ BitVec 64))

(assert (=> b!61014 (= lt!95300 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95311 () Unit!4135)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2200 BitStream!2200 BitStream!2200 BitStream!2200 (_ BitVec 64) List!675) Unit!4135)

(assert (=> b!61014 (= lt!95311 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2873 lt!95274) (_2!2873 lt!95274) (_1!2872 lt!95299) (_1!2872 lt!95270) lt!95300 lt!95278))))

(declare-fun tail!283 (List!675) List!675)

(assert (=> b!61014 (= (bitStreamReadBitsIntoList!0 (_2!2873 lt!95274) (_1!2872 lt!95270) (bvsub lt!95300 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!283 lt!95278))))

(declare-fun lt!95301 () Unit!4135)

(assert (=> b!61014 (= lt!95301 lt!95311)))

(declare-fun lt!95277 () Unit!4135)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2761 array!2761 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4135)

(assert (=> b!61014 (= lt!95277 (arrayBitRangesEqImpliesEq!0 (buf!1637 (_2!2873 lt!95269)) (buf!1637 (_2!2873 lt!95274)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!95280 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!95269))) (currentByte!3255 (_2!2873 lt!95269)) (currentBit!3250 (_2!2873 lt!95269)))))))

(declare-fun bitAt!0 (array!2761 (_ BitVec 64)) Bool)

(assert (=> b!61014 (= (bitAt!0 (buf!1637 (_2!2873 lt!95269)) lt!95280) (bitAt!0 (buf!1637 (_2!2873 lt!95274)) lt!95280))))

(declare-fun lt!95272 () Unit!4135)

(assert (=> b!61014 (= lt!95272 lt!95277)))

(assert (= (and d!18654 c!4266) b!61014))

(assert (= (and d!18654 (not c!4266)) b!61007))

(assert (= (or b!61014 b!61007) bm!766))

(assert (= (and d!18654 res!50866) b!61008))

(assert (= (and b!61008 res!50870) b!61013))

(assert (= (and b!61013 res!50869) b!61010))

(assert (= (and b!61010 res!50867) b!61012))

(assert (= (and b!61012 res!50868) b!61011))

(assert (= (and b!61011 res!50871) b!61009))

(declare-fun m!96189 () Bool)

(assert (=> bm!766 m!96189))

(declare-fun m!96191 () Bool)

(assert (=> b!61009 m!96191))

(declare-fun m!96193 () Bool)

(assert (=> b!61011 m!96193))

(declare-fun m!96195 () Bool)

(assert (=> b!61011 m!96195))

(declare-fun m!96197 () Bool)

(assert (=> b!61011 m!96197))

(declare-fun m!96199 () Bool)

(assert (=> b!61011 m!96199))

(declare-fun m!96201 () Bool)

(assert (=> b!61011 m!96201))

(declare-fun m!96203 () Bool)

(assert (=> b!61014 m!96203))

(declare-fun m!96205 () Bool)

(assert (=> b!61014 m!96205))

(declare-fun m!96207 () Bool)

(assert (=> b!61014 m!96207))

(declare-fun m!96209 () Bool)

(assert (=> b!61014 m!96209))

(assert (=> b!61014 m!95585))

(declare-fun m!96211 () Bool)

(assert (=> b!61014 m!96211))

(declare-fun m!96213 () Bool)

(assert (=> b!61014 m!96213))

(declare-fun m!96215 () Bool)

(assert (=> b!61014 m!96215))

(declare-fun m!96217 () Bool)

(assert (=> b!61014 m!96217))

(declare-fun m!96219 () Bool)

(assert (=> b!61014 m!96219))

(declare-fun m!96221 () Bool)

(assert (=> b!61014 m!96221))

(declare-fun m!96223 () Bool)

(assert (=> b!61014 m!96223))

(declare-fun m!96225 () Bool)

(assert (=> b!61014 m!96225))

(declare-fun m!96227 () Bool)

(assert (=> b!61014 m!96227))

(declare-fun m!96229 () Bool)

(assert (=> b!61014 m!96229))

(declare-fun m!96231 () Bool)

(assert (=> b!61014 m!96231))

(declare-fun m!96233 () Bool)

(assert (=> b!61014 m!96233))

(assert (=> b!61014 m!96205))

(declare-fun m!96235 () Bool)

(assert (=> b!61014 m!96235))

(declare-fun m!96237 () Bool)

(assert (=> b!61014 m!96237))

(declare-fun m!96239 () Bool)

(assert (=> b!61014 m!96239))

(assert (=> b!61014 m!96223))

(declare-fun m!96241 () Bool)

(assert (=> b!61014 m!96241))

(declare-fun m!96243 () Bool)

(assert (=> b!61014 m!96243))

(declare-fun m!96245 () Bool)

(assert (=> b!61014 m!96245))

(assert (=> b!61014 m!96225))

(declare-fun m!96247 () Bool)

(assert (=> b!61014 m!96247))

(declare-fun m!96249 () Bool)

(assert (=> b!61014 m!96249))

(declare-fun m!96251 () Bool)

(assert (=> b!61014 m!96251))

(declare-fun m!96253 () Bool)

(assert (=> b!61014 m!96253))

(declare-fun m!96255 () Bool)

(assert (=> b!61014 m!96255))

(declare-fun m!96257 () Bool)

(assert (=> b!61014 m!96257))

(declare-fun m!96259 () Bool)

(assert (=> b!61014 m!96259))

(assert (=> b!61014 m!96243))

(declare-fun m!96261 () Bool)

(assert (=> b!61014 m!96261))

(declare-fun m!96263 () Bool)

(assert (=> b!61014 m!96263))

(declare-fun m!96265 () Bool)

(assert (=> b!61008 m!96265))

(declare-fun m!96267 () Bool)

(assert (=> b!61010 m!96267))

(declare-fun m!96269 () Bool)

(assert (=> d!18654 m!96269))

(assert (=> d!18654 m!95585))

(assert (=> d!18654 m!95837))

(assert (=> d!18654 m!95835))

(declare-fun m!96271 () Bool)

(assert (=> b!61007 m!96271))

(declare-fun m!96273 () Bool)

(assert (=> b!61007 m!96273))

(assert (=> b!60636 d!18654))

(declare-fun d!18736 () Bool)

(declare-fun res!50874 () Bool)

(declare-fun e!40697 () Bool)

(assert (=> d!18736 (=> (not res!50874) (not e!40697))))

(assert (=> d!18736 (= res!50874 (= (size!1256 (buf!1637 (_2!2873 lt!94513))) (size!1256 (buf!1637 (_2!2873 lt!94526)))))))

(assert (=> d!18736 (= (isPrefixOf!0 (_2!2873 lt!94513) (_2!2873 lt!94526)) e!40697)))

(declare-fun b!61015 () Bool)

(declare-fun res!50873 () Bool)

(assert (=> b!61015 (=> (not res!50873) (not e!40697))))

(assert (=> b!61015 (= res!50873 (bvsle (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))) (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94526))) (currentByte!3255 (_2!2873 lt!94526)) (currentBit!3250 (_2!2873 lt!94526)))))))

(declare-fun b!61016 () Bool)

(declare-fun e!40696 () Bool)

(assert (=> b!61016 (= e!40697 e!40696)))

(declare-fun res!50872 () Bool)

(assert (=> b!61016 (=> res!50872 e!40696)))

(assert (=> b!61016 (= res!50872 (= (size!1256 (buf!1637 (_2!2873 lt!94513))) #b00000000000000000000000000000000))))

(declare-fun b!61017 () Bool)

(assert (=> b!61017 (= e!40696 (arrayBitRangesEq!0 (buf!1637 (_2!2873 lt!94513)) (buf!1637 (_2!2873 lt!94526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513)))))))

(assert (= (and d!18736 res!50874) b!61015))

(assert (= (and b!61015 res!50873) b!61016))

(assert (= (and b!61016 (not res!50872)) b!61017))

(assert (=> b!61015 m!95585))

(assert (=> b!61015 m!95581))

(assert (=> b!61017 m!95585))

(assert (=> b!61017 m!95585))

(declare-fun m!96275 () Bool)

(assert (=> b!61017 m!96275))

(assert (=> b!60636 d!18736))

(declare-fun d!18738 () Bool)

(assert (=> d!18738 (= (array_inv!1159 srcBuffer!2) (bvsge (size!1256 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11904 d!18738))

(declare-fun d!18740 () Bool)

(assert (=> d!18740 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3250 thiss!1379) (currentByte!3255 thiss!1379) (size!1256 (buf!1637 thiss!1379))))))

(declare-fun bs!4692 () Bool)

(assert (= bs!4692 d!18740))

(declare-fun m!96277 () Bool)

(assert (=> bs!4692 m!96277))

(assert (=> start!11904 d!18740))

(declare-fun d!18742 () Bool)

(assert (=> d!18742 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 thiss!1379))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1256 (buf!1637 thiss!1379))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4693 () Bool)

(assert (= bs!4693 d!18742))

(declare-fun m!96279 () Bool)

(assert (=> bs!4693 m!96279))

(assert (=> b!60633 d!18742))

(declare-fun d!18744 () Bool)

(declare-fun e!40700 () Bool)

(assert (=> d!18744 e!40700))

(declare-fun res!50880 () Bool)

(assert (=> d!18744 (=> (not res!50880) (not e!40700))))

(declare-fun lt!95330 () (_ BitVec 64))

(declare-fun lt!95325 () (_ BitVec 64))

(declare-fun lt!95327 () (_ BitVec 64))

(assert (=> d!18744 (= res!50880 (= lt!95330 (bvsub lt!95327 lt!95325)))))

(assert (=> d!18744 (or (= (bvand lt!95327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95327 lt!95325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18744 (= lt!95325 (remainingBits!0 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94526))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94526)))))))

(declare-fun lt!95328 () (_ BitVec 64))

(declare-fun lt!95329 () (_ BitVec 64))

(assert (=> d!18744 (= lt!95327 (bvmul lt!95328 lt!95329))))

(assert (=> d!18744 (or (= lt!95328 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!95329 (bvsdiv (bvmul lt!95328 lt!95329) lt!95328)))))

(assert (=> d!18744 (= lt!95329 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18744 (= lt!95328 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))))))

(assert (=> d!18744 (= lt!95330 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94526))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94526)))))))

(assert (=> d!18744 (invariant!0 (currentBit!3250 (_2!2873 lt!94526)) (currentByte!3255 (_2!2873 lt!94526)) (size!1256 (buf!1637 (_2!2873 lt!94526))))))

(assert (=> d!18744 (= (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94526))) (currentByte!3255 (_2!2873 lt!94526)) (currentBit!3250 (_2!2873 lt!94526))) lt!95330)))

(declare-fun b!61022 () Bool)

(declare-fun res!50879 () Bool)

(assert (=> b!61022 (=> (not res!50879) (not e!40700))))

(assert (=> b!61022 (= res!50879 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!95330))))

(declare-fun b!61023 () Bool)

(declare-fun lt!95326 () (_ BitVec 64))

(assert (=> b!61023 (= e!40700 (bvsle lt!95330 (bvmul lt!95326 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61023 (or (= lt!95326 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!95326 #b0000000000000000000000000000000000000000000000000000000000001000) lt!95326)))))

(assert (=> b!61023 (= lt!95326 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))))))

(assert (= (and d!18744 res!50880) b!61022))

(assert (= (and b!61022 res!50879) b!61023))

(declare-fun m!96281 () Bool)

(assert (=> d!18744 m!96281))

(assert (=> d!18744 m!95539))

(assert (=> b!60634 d!18744))

(declare-fun d!18746 () Bool)

(assert (=> d!18746 (= (invariant!0 (currentBit!3250 (_2!2873 lt!94513)) (currentByte!3255 (_2!2873 lt!94513)) (size!1256 (buf!1637 (_2!2873 lt!94513)))) (and (bvsge (currentBit!3250 (_2!2873 lt!94513)) #b00000000000000000000000000000000) (bvslt (currentBit!3250 (_2!2873 lt!94513)) #b00000000000000000000000000001000) (bvsge (currentByte!3255 (_2!2873 lt!94513)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3255 (_2!2873 lt!94513)) (size!1256 (buf!1637 (_2!2873 lt!94513)))) (and (= (currentBit!3250 (_2!2873 lt!94513)) #b00000000000000000000000000000000) (= (currentByte!3255 (_2!2873 lt!94513)) (size!1256 (buf!1637 (_2!2873 lt!94513))))))))))

(assert (=> b!60635 d!18746))

(declare-fun d!18748 () Bool)

(assert (=> d!18748 (= (head!494 (byteArrayBitContentToList!0 (_2!2873 lt!94513) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!790 (byteArrayBitContentToList!0 (_2!2873 lt!94513) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!60630 d!18748))

(declare-fun d!18750 () Bool)

(declare-fun c!4269 () Bool)

(assert (=> d!18750 (= c!4269 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40703 () List!675)

(assert (=> d!18750 (= (byteArrayBitContentToList!0 (_2!2873 lt!94513) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!40703)))

(declare-fun b!61028 () Bool)

(assert (=> b!61028 (= e!40703 Nil!672)))

(declare-fun b!61029 () Bool)

(assert (=> b!61029 (= e!40703 (Cons!671 (not (= (bvand ((_ sign_extend 24) (select (arr!1820 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2873 lt!94513) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18750 c!4269) b!61028))

(assert (= (and d!18750 (not c!4269)) b!61029))

(assert (=> b!61029 m!95573))

(declare-fun m!96283 () Bool)

(assert (=> b!61029 m!96283))

(declare-fun m!96285 () Bool)

(assert (=> b!61029 m!96285))

(assert (=> b!60630 d!18750))

(declare-fun d!18752 () Bool)

(assert (=> d!18752 (= (head!494 (bitStreamReadBitsIntoList!0 (_2!2873 lt!94513) (_1!2872 lt!94521) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!790 (bitStreamReadBitsIntoList!0 (_2!2873 lt!94513) (_1!2872 lt!94521) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!60630 d!18752))

(declare-fun b!61039 () Bool)

(declare-datatypes ((tuple2!5548 0))(
  ( (tuple2!5549 (_1!2885 Bool) (_2!2885 BitStream!2200)) )
))
(declare-fun lt!95337 () tuple2!5548)

(declare-fun lt!95339 () (_ BitVec 64))

(declare-datatypes ((tuple2!5550 0))(
  ( (tuple2!5551 (_1!2886 List!675) (_2!2886 BitStream!2200)) )
))
(declare-fun e!40708 () tuple2!5550)

(assert (=> b!61039 (= e!40708 (tuple2!5551 (Cons!671 (_1!2885 lt!95337) (bitStreamReadBitsIntoList!0 (_2!2873 lt!94513) (_2!2885 lt!95337) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!95339))) (_2!2885 lt!95337)))))

(declare-fun readBit!0 (BitStream!2200) tuple2!5548)

(assert (=> b!61039 (= lt!95337 (readBit!0 (_1!2872 lt!94521)))))

(assert (=> b!61039 (= lt!95339 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61040 () Bool)

(declare-fun e!40709 () Bool)

(declare-fun lt!95338 () List!675)

(declare-fun isEmpty!182 (List!675) Bool)

(assert (=> b!61040 (= e!40709 (isEmpty!182 lt!95338))))

(declare-fun b!61041 () Bool)

(assert (=> b!61041 (= e!40709 (> (length!303 lt!95338) 0))))

(declare-fun b!61038 () Bool)

(assert (=> b!61038 (= e!40708 (tuple2!5551 Nil!672 (_1!2872 lt!94521)))))

(declare-fun d!18754 () Bool)

(assert (=> d!18754 e!40709))

(declare-fun c!4275 () Bool)

(assert (=> d!18754 (= c!4275 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18754 (= lt!95338 (_1!2886 e!40708))))

(declare-fun c!4274 () Bool)

(assert (=> d!18754 (= c!4274 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18754 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18754 (= (bitStreamReadBitsIntoList!0 (_2!2873 lt!94513) (_1!2872 lt!94521) #b0000000000000000000000000000000000000000000000000000000000000001) lt!95338)))

(assert (= (and d!18754 c!4274) b!61038))

(assert (= (and d!18754 (not c!4274)) b!61039))

(assert (= (and d!18754 c!4275) b!61040))

(assert (= (and d!18754 (not c!4275)) b!61041))

(declare-fun m!96287 () Bool)

(assert (=> b!61039 m!96287))

(declare-fun m!96289 () Bool)

(assert (=> b!61039 m!96289))

(declare-fun m!96291 () Bool)

(assert (=> b!61040 m!96291))

(declare-fun m!96293 () Bool)

(assert (=> b!61041 m!96293))

(assert (=> b!60630 d!18754))

(declare-fun d!18756 () Bool)

(declare-fun e!40710 () Bool)

(assert (=> d!18756 e!40710))

(declare-fun res!50882 () Bool)

(assert (=> d!18756 (=> (not res!50882) (not e!40710))))

(declare-fun lt!95345 () (_ BitVec 64))

(declare-fun lt!95342 () (_ BitVec 64))

(declare-fun lt!95340 () (_ BitVec 64))

(assert (=> d!18756 (= res!50882 (= lt!95345 (bvsub lt!95342 lt!95340)))))

(assert (=> d!18756 (or (= (bvand lt!95342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95340 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95342 lt!95340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18756 (= lt!95340 (remainingBits!0 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513)))))))

(declare-fun lt!95343 () (_ BitVec 64))

(declare-fun lt!95344 () (_ BitVec 64))

(assert (=> d!18756 (= lt!95342 (bvmul lt!95343 lt!95344))))

(assert (=> d!18756 (or (= lt!95343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!95344 (bvsdiv (bvmul lt!95343 lt!95344) lt!95343)))))

(assert (=> d!18756 (= lt!95344 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18756 (= lt!95343 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))))))

(assert (=> d!18756 (= lt!95345 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513)))))))

(assert (=> d!18756 (invariant!0 (currentBit!3250 (_2!2873 lt!94513)) (currentByte!3255 (_2!2873 lt!94513)) (size!1256 (buf!1637 (_2!2873 lt!94513))))))

(assert (=> d!18756 (= (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))) lt!95345)))

(declare-fun b!61042 () Bool)

(declare-fun res!50881 () Bool)

(assert (=> b!61042 (=> (not res!50881) (not e!40710))))

(assert (=> b!61042 (= res!50881 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!95345))))

(declare-fun b!61043 () Bool)

(declare-fun lt!95341 () (_ BitVec 64))

(assert (=> b!61043 (= e!40710 (bvsle lt!95345 (bvmul lt!95341 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61043 (or (= lt!95341 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!95341 #b0000000000000000000000000000000000000000000000000000000000001000) lt!95341)))))

(assert (=> b!61043 (= lt!95341 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))))))

(assert (= (and d!18756 res!50882) b!61042))

(assert (= (and b!61042 res!50881) b!61043))

(declare-fun m!96295 () Bool)

(assert (=> d!18756 m!96295))

(assert (=> d!18756 m!95583))

(assert (=> b!60641 d!18756))

(declare-fun d!18758 () Bool)

(declare-fun size!1260 (List!675) Int)

(assert (=> d!18758 (= (length!303 lt!94518) (size!1260 lt!94518))))

(declare-fun bs!4694 () Bool)

(assert (= bs!4694 d!18758))

(declare-fun m!96297 () Bool)

(assert (=> bs!4694 m!96297))

(assert (=> b!60631 d!18758))

(declare-fun d!18760 () Bool)

(assert (=> d!18760 (= (invariant!0 (currentBit!3250 (_2!2873 lt!94513)) (currentByte!3255 (_2!2873 lt!94513)) (size!1256 (buf!1637 (_2!2873 lt!94526)))) (and (bvsge (currentBit!3250 (_2!2873 lt!94513)) #b00000000000000000000000000000000) (bvslt (currentBit!3250 (_2!2873 lt!94513)) #b00000000000000000000000000001000) (bvsge (currentByte!3255 (_2!2873 lt!94513)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3255 (_2!2873 lt!94513)) (size!1256 (buf!1637 (_2!2873 lt!94526)))) (and (= (currentBit!3250 (_2!2873 lt!94513)) #b00000000000000000000000000000000) (= (currentByte!3255 (_2!2873 lt!94513)) (size!1256 (buf!1637 (_2!2873 lt!94526))))))))))

(assert (=> b!60642 d!18760))

(declare-fun d!18762 () Bool)

(declare-fun res!50885 () Bool)

(declare-fun e!40712 () Bool)

(assert (=> d!18762 (=> (not res!50885) (not e!40712))))

(assert (=> d!18762 (= res!50885 (= (size!1256 (buf!1637 thiss!1379)) (size!1256 (buf!1637 thiss!1379))))))

(assert (=> d!18762 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!40712)))

(declare-fun b!61044 () Bool)

(declare-fun res!50884 () Bool)

(assert (=> b!61044 (=> (not res!50884) (not e!40712))))

(assert (=> b!61044 (= res!50884 (bvsle (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)) (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379))))))

(declare-fun b!61045 () Bool)

(declare-fun e!40711 () Bool)

(assert (=> b!61045 (= e!40712 e!40711)))

(declare-fun res!50883 () Bool)

(assert (=> b!61045 (=> res!50883 e!40711)))

(assert (=> b!61045 (= res!50883 (= (size!1256 (buf!1637 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61046 () Bool)

(assert (=> b!61046 (= e!40711 (arrayBitRangesEq!0 (buf!1637 thiss!1379) (buf!1637 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379))))))

(assert (= (and d!18762 res!50885) b!61044))

(assert (= (and b!61044 res!50884) b!61045))

(assert (= (and b!61045 (not res!50883)) b!61046))

(assert (=> b!61044 m!95567))

(assert (=> b!61044 m!95567))

(assert (=> b!61046 m!95567))

(assert (=> b!61046 m!95567))

(declare-fun m!96299 () Bool)

(assert (=> b!61046 m!96299))

(assert (=> b!60632 d!18762))

(declare-fun d!18764 () Bool)

(assert (=> d!18764 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!95348 () Unit!4135)

(declare-fun choose!11 (BitStream!2200) Unit!4135)

(assert (=> d!18764 (= lt!95348 (choose!11 thiss!1379))))

(assert (=> d!18764 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!95348)))

(declare-fun bs!4696 () Bool)

(assert (= bs!4696 d!18764))

(assert (=> bs!4696 m!95563))

(declare-fun m!96301 () Bool)

(assert (=> bs!4696 m!96301))

(assert (=> b!60632 d!18764))

(declare-fun d!18766 () Bool)

(declare-fun e!40713 () Bool)

(assert (=> d!18766 e!40713))

(declare-fun res!50887 () Bool)

(assert (=> d!18766 (=> (not res!50887) (not e!40713))))

(declare-fun lt!95354 () (_ BitVec 64))

(declare-fun lt!95351 () (_ BitVec 64))

(declare-fun lt!95349 () (_ BitVec 64))

(assert (=> d!18766 (= res!50887 (= lt!95354 (bvsub lt!95351 lt!95349)))))

(assert (=> d!18766 (or (= (bvand lt!95351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95349 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95351 lt!95349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18766 (= lt!95349 (remainingBits!0 ((_ sign_extend 32) (size!1256 (buf!1637 thiss!1379))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379))))))

(declare-fun lt!95352 () (_ BitVec 64))

(declare-fun lt!95353 () (_ BitVec 64))

(assert (=> d!18766 (= lt!95351 (bvmul lt!95352 lt!95353))))

(assert (=> d!18766 (or (= lt!95352 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!95353 (bvsdiv (bvmul lt!95352 lt!95353) lt!95352)))))

(assert (=> d!18766 (= lt!95353 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18766 (= lt!95352 ((_ sign_extend 32) (size!1256 (buf!1637 thiss!1379))))))

(assert (=> d!18766 (= lt!95354 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3255 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3250 thiss!1379))))))

(assert (=> d!18766 (invariant!0 (currentBit!3250 thiss!1379) (currentByte!3255 thiss!1379) (size!1256 (buf!1637 thiss!1379)))))

(assert (=> d!18766 (= (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)) lt!95354)))

(declare-fun b!61047 () Bool)

(declare-fun res!50886 () Bool)

(assert (=> b!61047 (=> (not res!50886) (not e!40713))))

(assert (=> b!61047 (= res!50886 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!95354))))

(declare-fun b!61048 () Bool)

(declare-fun lt!95350 () (_ BitVec 64))

(assert (=> b!61048 (= e!40713 (bvsle lt!95354 (bvmul lt!95350 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61048 (or (= lt!95350 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!95350 #b0000000000000000000000000000000000000000000000000000000000001000) lt!95350)))))

(assert (=> b!61048 (= lt!95350 ((_ sign_extend 32) (size!1256 (buf!1637 thiss!1379))))))

(assert (= (and d!18766 res!50887) b!61047))

(assert (= (and b!61047 res!50886) b!61048))

(assert (=> d!18766 m!96279))

(assert (=> d!18766 m!96277))

(assert (=> b!60632 d!18766))

(declare-fun d!18768 () Bool)

(assert (=> d!18768 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!95355 () Unit!4135)

(assert (=> d!18768 (= lt!95355 (choose!9 thiss!1379 (buf!1637 (_2!2873 lt!94526)) (bvsub to!314 i!635) (BitStream!2201 (buf!1637 (_2!2873 lt!94526)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379))))))

(assert (=> d!18768 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1637 (_2!2873 lt!94526)) (bvsub to!314 i!635)) lt!95355)))

(declare-fun bs!4697 () Bool)

(assert (= bs!4697 d!18768))

(assert (=> bs!4697 m!95551))

(declare-fun m!96303 () Bool)

(assert (=> bs!4697 m!96303))

(assert (=> b!60638 d!18768))

(declare-fun lt!95356 () tuple2!5548)

(declare-fun b!61050 () Bool)

(declare-fun e!40714 () tuple2!5550)

(declare-fun lt!95358 () (_ BitVec 64))

(assert (=> b!61050 (= e!40714 (tuple2!5551 (Cons!671 (_1!2885 lt!95356) (bitStreamReadBitsIntoList!0 (_2!2873 lt!94526) (_2!2885 lt!95356) (bvsub (bvsub to!314 i!635) lt!95358))) (_2!2885 lt!95356)))))

(assert (=> b!61050 (= lt!95356 (readBit!0 (_1!2872 lt!94514)))))

(assert (=> b!61050 (= lt!95358 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61051 () Bool)

(declare-fun e!40715 () Bool)

(declare-fun lt!95357 () List!675)

(assert (=> b!61051 (= e!40715 (isEmpty!182 lt!95357))))

(declare-fun b!61052 () Bool)

(assert (=> b!61052 (= e!40715 (> (length!303 lt!95357) 0))))

(declare-fun b!61049 () Bool)

(assert (=> b!61049 (= e!40714 (tuple2!5551 Nil!672 (_1!2872 lt!94514)))))

(declare-fun d!18770 () Bool)

(assert (=> d!18770 e!40715))

(declare-fun c!4277 () Bool)

(assert (=> d!18770 (= c!4277 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18770 (= lt!95357 (_1!2886 e!40714))))

(declare-fun c!4276 () Bool)

(assert (=> d!18770 (= c!4276 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18770 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18770 (= (bitStreamReadBitsIntoList!0 (_2!2873 lt!94526) (_1!2872 lt!94514) (bvsub to!314 i!635)) lt!95357)))

(assert (= (and d!18770 c!4276) b!61049))

(assert (= (and d!18770 (not c!4276)) b!61050))

(assert (= (and d!18770 c!4277) b!61051))

(assert (= (and d!18770 (not c!4277)) b!61052))

(declare-fun m!96305 () Bool)

(assert (=> b!61050 m!96305))

(declare-fun m!96307 () Bool)

(assert (=> b!61050 m!96307))

(declare-fun m!96309 () Bool)

(assert (=> b!61051 m!96309))

(declare-fun m!96311 () Bool)

(assert (=> b!61052 m!96311))

(assert (=> b!60638 d!18770))

(declare-fun b!61053 () Bool)

(declare-fun e!40717 () Unit!4135)

(declare-fun Unit!4161 () Unit!4135)

(assert (=> b!61053 (= e!40717 Unit!4161)))

(declare-fun b!61054 () Bool)

(declare-fun res!50890 () Bool)

(declare-fun e!40716 () Bool)

(assert (=> b!61054 (=> (not res!50890) (not e!40716))))

(declare-fun lt!95359 () tuple2!5522)

(assert (=> b!61054 (= res!50890 (isPrefixOf!0 (_2!2872 lt!95359) (_2!2873 lt!94526)))))

(declare-fun b!61056 () Bool)

(declare-fun lt!95361 () Unit!4135)

(assert (=> b!61056 (= e!40717 lt!95361)))

(declare-fun lt!95362 () (_ BitVec 64))

(assert (=> b!61056 (= lt!95362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95363 () (_ BitVec 64))

(assert (=> b!61056 (= lt!95363 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))))))

(assert (=> b!61056 (= lt!95361 (arrayBitRangesEqSymmetric!0 (buf!1637 (_2!2873 lt!94513)) (buf!1637 (_2!2873 lt!94526)) lt!95362 lt!95363))))

(assert (=> b!61056 (arrayBitRangesEq!0 (buf!1637 (_2!2873 lt!94526)) (buf!1637 (_2!2873 lt!94513)) lt!95362 lt!95363)))

(declare-fun b!61057 () Bool)

(declare-fun lt!95360 () (_ BitVec 64))

(declare-fun lt!95370 () (_ BitVec 64))

(assert (=> b!61057 (= e!40716 (= (_1!2872 lt!95359) (withMovedBitIndex!0 (_2!2872 lt!95359) (bvsub lt!95360 lt!95370))))))

(assert (=> b!61057 (or (= (bvand lt!95360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95370 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95360 lt!95370) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61057 (= lt!95370 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94526))) (currentByte!3255 (_2!2873 lt!94526)) (currentBit!3250 (_2!2873 lt!94526))))))

(assert (=> b!61057 (= lt!95360 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))))))

(declare-fun d!18772 () Bool)

(assert (=> d!18772 e!40716))

(declare-fun res!50888 () Bool)

(assert (=> d!18772 (=> (not res!50888) (not e!40716))))

(assert (=> d!18772 (= res!50888 (isPrefixOf!0 (_1!2872 lt!95359) (_2!2872 lt!95359)))))

(declare-fun lt!95372 () BitStream!2200)

(assert (=> d!18772 (= lt!95359 (tuple2!5523 lt!95372 (_2!2873 lt!94526)))))

(declare-fun lt!95366 () Unit!4135)

(declare-fun lt!95369 () Unit!4135)

(assert (=> d!18772 (= lt!95366 lt!95369)))

(assert (=> d!18772 (isPrefixOf!0 lt!95372 (_2!2873 lt!94526))))

(assert (=> d!18772 (= lt!95369 (lemmaIsPrefixTransitive!0 lt!95372 (_2!2873 lt!94526) (_2!2873 lt!94526)))))

(declare-fun lt!95367 () Unit!4135)

(declare-fun lt!95378 () Unit!4135)

(assert (=> d!18772 (= lt!95367 lt!95378)))

(assert (=> d!18772 (isPrefixOf!0 lt!95372 (_2!2873 lt!94526))))

(assert (=> d!18772 (= lt!95378 (lemmaIsPrefixTransitive!0 lt!95372 (_2!2873 lt!94513) (_2!2873 lt!94526)))))

(declare-fun lt!95364 () Unit!4135)

(assert (=> d!18772 (= lt!95364 e!40717)))

(declare-fun c!4278 () Bool)

(assert (=> d!18772 (= c!4278 (not (= (size!1256 (buf!1637 (_2!2873 lt!94513))) #b00000000000000000000000000000000)))))

(declare-fun lt!95373 () Unit!4135)

(declare-fun lt!95371 () Unit!4135)

(assert (=> d!18772 (= lt!95373 lt!95371)))

(assert (=> d!18772 (isPrefixOf!0 (_2!2873 lt!94526) (_2!2873 lt!94526))))

(assert (=> d!18772 (= lt!95371 (lemmaIsPrefixRefl!0 (_2!2873 lt!94526)))))

(declare-fun lt!95376 () Unit!4135)

(declare-fun lt!95365 () Unit!4135)

(assert (=> d!18772 (= lt!95376 lt!95365)))

(assert (=> d!18772 (= lt!95365 (lemmaIsPrefixRefl!0 (_2!2873 lt!94526)))))

(declare-fun lt!95375 () Unit!4135)

(declare-fun lt!95368 () Unit!4135)

(assert (=> d!18772 (= lt!95375 lt!95368)))

(assert (=> d!18772 (isPrefixOf!0 lt!95372 lt!95372)))

(assert (=> d!18772 (= lt!95368 (lemmaIsPrefixRefl!0 lt!95372))))

(declare-fun lt!95377 () Unit!4135)

(declare-fun lt!95374 () Unit!4135)

(assert (=> d!18772 (= lt!95377 lt!95374)))

(assert (=> d!18772 (isPrefixOf!0 (_2!2873 lt!94513) (_2!2873 lt!94513))))

(assert (=> d!18772 (= lt!95374 (lemmaIsPrefixRefl!0 (_2!2873 lt!94513)))))

(assert (=> d!18772 (= lt!95372 (BitStream!2201 (buf!1637 (_2!2873 lt!94526)) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513))))))

(assert (=> d!18772 (isPrefixOf!0 (_2!2873 lt!94513) (_2!2873 lt!94526))))

(assert (=> d!18772 (= (reader!0 (_2!2873 lt!94513) (_2!2873 lt!94526)) lt!95359)))

(declare-fun b!61055 () Bool)

(declare-fun res!50889 () Bool)

(assert (=> b!61055 (=> (not res!50889) (not e!40716))))

(assert (=> b!61055 (= res!50889 (isPrefixOf!0 (_1!2872 lt!95359) (_2!2873 lt!94513)))))

(assert (= (and d!18772 c!4278) b!61056))

(assert (= (and d!18772 (not c!4278)) b!61053))

(assert (= (and d!18772 res!50888) b!61055))

(assert (= (and b!61055 res!50889) b!61054))

(assert (= (and b!61054 res!50890) b!61057))

(assert (=> d!18772 m!95835))

(declare-fun m!96313 () Bool)

(assert (=> d!18772 m!96313))

(declare-fun m!96315 () Bool)

(assert (=> d!18772 m!96315))

(declare-fun m!96317 () Bool)

(assert (=> d!18772 m!96317))

(declare-fun m!96319 () Bool)

(assert (=> d!18772 m!96319))

(declare-fun m!96321 () Bool)

(assert (=> d!18772 m!96321))

(declare-fun m!96323 () Bool)

(assert (=> d!18772 m!96323))

(declare-fun m!96325 () Bool)

(assert (=> d!18772 m!96325))

(assert (=> d!18772 m!95603))

(declare-fun m!96327 () Bool)

(assert (=> d!18772 m!96327))

(assert (=> d!18772 m!95837))

(declare-fun m!96329 () Bool)

(assert (=> b!61057 m!96329))

(assert (=> b!61057 m!95581))

(assert (=> b!61057 m!95585))

(assert (=> b!61056 m!95585))

(declare-fun m!96331 () Bool)

(assert (=> b!61056 m!96331))

(declare-fun m!96333 () Bool)

(assert (=> b!61056 m!96333))

(declare-fun m!96335 () Bool)

(assert (=> b!61055 m!96335))

(declare-fun m!96337 () Bool)

(assert (=> b!61054 m!96337))

(assert (=> b!60638 d!18772))

(declare-fun e!40718 () tuple2!5550)

(declare-fun b!61059 () Bool)

(declare-fun lt!95379 () tuple2!5548)

(declare-fun lt!95381 () (_ BitVec 64))

(assert (=> b!61059 (= e!40718 (tuple2!5551 (Cons!671 (_1!2885 lt!95379) (bitStreamReadBitsIntoList!0 (_2!2873 lt!94526) (_2!2885 lt!95379) (bvsub lt!94517 lt!95381))) (_2!2885 lt!95379)))))

(assert (=> b!61059 (= lt!95379 (readBit!0 (_1!2872 lt!94524)))))

(assert (=> b!61059 (= lt!95381 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61060 () Bool)

(declare-fun e!40719 () Bool)

(declare-fun lt!95380 () List!675)

(assert (=> b!61060 (= e!40719 (isEmpty!182 lt!95380))))

(declare-fun b!61061 () Bool)

(assert (=> b!61061 (= e!40719 (> (length!303 lt!95380) 0))))

(declare-fun b!61058 () Bool)

(assert (=> b!61058 (= e!40718 (tuple2!5551 Nil!672 (_1!2872 lt!94524)))))

(declare-fun d!18774 () Bool)

(assert (=> d!18774 e!40719))

(declare-fun c!4280 () Bool)

(assert (=> d!18774 (= c!4280 (= lt!94517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18774 (= lt!95380 (_1!2886 e!40718))))

(declare-fun c!4279 () Bool)

(assert (=> d!18774 (= c!4279 (= lt!94517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18774 (bvsge lt!94517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18774 (= (bitStreamReadBitsIntoList!0 (_2!2873 lt!94526) (_1!2872 lt!94524) lt!94517) lt!95380)))

(assert (= (and d!18774 c!4279) b!61058))

(assert (= (and d!18774 (not c!4279)) b!61059))

(assert (= (and d!18774 c!4280) b!61060))

(assert (= (and d!18774 (not c!4280)) b!61061))

(declare-fun m!96339 () Bool)

(assert (=> b!61059 m!96339))

(declare-fun m!96341 () Bool)

(assert (=> b!61059 m!96341))

(declare-fun m!96343 () Bool)

(assert (=> b!61060 m!96343))

(declare-fun m!96345 () Bool)

(assert (=> b!61061 m!96345))

(assert (=> b!60638 d!18774))

(declare-fun d!18776 () Bool)

(assert (=> d!18776 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))) ((_ sign_extend 32) (currentByte!3255 thiss!1379)) ((_ sign_extend 32) (currentBit!3250 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4698 () Bool)

(assert (= bs!4698 d!18776))

(declare-fun m!96347 () Bool)

(assert (=> bs!4698 m!96347))

(assert (=> b!60638 d!18776))

(declare-fun d!18778 () Bool)

(assert (=> d!18778 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) lt!94517)))

(declare-fun lt!95382 () Unit!4135)

(assert (=> d!18778 (= lt!95382 (choose!9 (_2!2873 lt!94513) (buf!1637 (_2!2873 lt!94526)) lt!94517 (BitStream!2201 (buf!1637 (_2!2873 lt!94526)) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513)))))))

(assert (=> d!18778 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2873 lt!94513) (buf!1637 (_2!2873 lt!94526)) lt!94517) lt!95382)))

(declare-fun bs!4699 () Bool)

(assert (= bs!4699 d!18778))

(assert (=> bs!4699 m!95561))

(declare-fun m!96349 () Bool)

(assert (=> bs!4699 m!96349))

(assert (=> b!60638 d!18778))

(declare-fun b!61062 () Bool)

(declare-fun e!40721 () Unit!4135)

(declare-fun Unit!4162 () Unit!4135)

(assert (=> b!61062 (= e!40721 Unit!4162)))

(declare-fun b!61063 () Bool)

(declare-fun res!50893 () Bool)

(declare-fun e!40720 () Bool)

(assert (=> b!61063 (=> (not res!50893) (not e!40720))))

(declare-fun lt!95383 () tuple2!5522)

(assert (=> b!61063 (= res!50893 (isPrefixOf!0 (_2!2872 lt!95383) (_2!2873 lt!94526)))))

(declare-fun b!61065 () Bool)

(declare-fun lt!95385 () Unit!4135)

(assert (=> b!61065 (= e!40721 lt!95385)))

(declare-fun lt!95386 () (_ BitVec 64))

(assert (=> b!61065 (= lt!95386 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95387 () (_ BitVec 64))

(assert (=> b!61065 (= lt!95387 (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)))))

(assert (=> b!61065 (= lt!95385 (arrayBitRangesEqSymmetric!0 (buf!1637 thiss!1379) (buf!1637 (_2!2873 lt!94526)) lt!95386 lt!95387))))

(assert (=> b!61065 (arrayBitRangesEq!0 (buf!1637 (_2!2873 lt!94526)) (buf!1637 thiss!1379) lt!95386 lt!95387)))

(declare-fun b!61066 () Bool)

(declare-fun lt!95384 () (_ BitVec 64))

(declare-fun lt!95394 () (_ BitVec 64))

(assert (=> b!61066 (= e!40720 (= (_1!2872 lt!95383) (withMovedBitIndex!0 (_2!2872 lt!95383) (bvsub lt!95384 lt!95394))))))

(assert (=> b!61066 (or (= (bvand lt!95384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95384 lt!95394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61066 (= lt!95394 (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94526))) (currentByte!3255 (_2!2873 lt!94526)) (currentBit!3250 (_2!2873 lt!94526))))))

(assert (=> b!61066 (= lt!95384 (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)))))

(declare-fun d!18780 () Bool)

(assert (=> d!18780 e!40720))

(declare-fun res!50891 () Bool)

(assert (=> d!18780 (=> (not res!50891) (not e!40720))))

(assert (=> d!18780 (= res!50891 (isPrefixOf!0 (_1!2872 lt!95383) (_2!2872 lt!95383)))))

(declare-fun lt!95396 () BitStream!2200)

(assert (=> d!18780 (= lt!95383 (tuple2!5523 lt!95396 (_2!2873 lt!94526)))))

(declare-fun lt!95390 () Unit!4135)

(declare-fun lt!95393 () Unit!4135)

(assert (=> d!18780 (= lt!95390 lt!95393)))

(assert (=> d!18780 (isPrefixOf!0 lt!95396 (_2!2873 lt!94526))))

(assert (=> d!18780 (= lt!95393 (lemmaIsPrefixTransitive!0 lt!95396 (_2!2873 lt!94526) (_2!2873 lt!94526)))))

(declare-fun lt!95391 () Unit!4135)

(declare-fun lt!95402 () Unit!4135)

(assert (=> d!18780 (= lt!95391 lt!95402)))

(assert (=> d!18780 (isPrefixOf!0 lt!95396 (_2!2873 lt!94526))))

(assert (=> d!18780 (= lt!95402 (lemmaIsPrefixTransitive!0 lt!95396 thiss!1379 (_2!2873 lt!94526)))))

(declare-fun lt!95388 () Unit!4135)

(assert (=> d!18780 (= lt!95388 e!40721)))

(declare-fun c!4281 () Bool)

(assert (=> d!18780 (= c!4281 (not (= (size!1256 (buf!1637 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!95397 () Unit!4135)

(declare-fun lt!95395 () Unit!4135)

(assert (=> d!18780 (= lt!95397 lt!95395)))

(assert (=> d!18780 (isPrefixOf!0 (_2!2873 lt!94526) (_2!2873 lt!94526))))

(assert (=> d!18780 (= lt!95395 (lemmaIsPrefixRefl!0 (_2!2873 lt!94526)))))

(declare-fun lt!95400 () Unit!4135)

(declare-fun lt!95389 () Unit!4135)

(assert (=> d!18780 (= lt!95400 lt!95389)))

(assert (=> d!18780 (= lt!95389 (lemmaIsPrefixRefl!0 (_2!2873 lt!94526)))))

(declare-fun lt!95399 () Unit!4135)

(declare-fun lt!95392 () Unit!4135)

(assert (=> d!18780 (= lt!95399 lt!95392)))

(assert (=> d!18780 (isPrefixOf!0 lt!95396 lt!95396)))

(assert (=> d!18780 (= lt!95392 (lemmaIsPrefixRefl!0 lt!95396))))

(declare-fun lt!95401 () Unit!4135)

(declare-fun lt!95398 () Unit!4135)

(assert (=> d!18780 (= lt!95401 lt!95398)))

(assert (=> d!18780 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18780 (= lt!95398 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18780 (= lt!95396 (BitStream!2201 (buf!1637 (_2!2873 lt!94526)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)))))

(assert (=> d!18780 (isPrefixOf!0 thiss!1379 (_2!2873 lt!94526))))

(assert (=> d!18780 (= (reader!0 thiss!1379 (_2!2873 lt!94526)) lt!95383)))

(declare-fun b!61064 () Bool)

(declare-fun res!50892 () Bool)

(assert (=> b!61064 (=> (not res!50892) (not e!40720))))

(assert (=> b!61064 (= res!50892 (isPrefixOf!0 (_1!2872 lt!95383) thiss!1379))))

(assert (= (and d!18780 c!4281) b!61065))

(assert (= (and d!18780 (not c!4281)) b!61062))

(assert (= (and d!18780 res!50891) b!61064))

(assert (= (and b!61064 res!50892) b!61063))

(assert (= (and b!61063 res!50893) b!61066))

(assert (=> d!18780 m!95565))

(declare-fun m!96351 () Bool)

(assert (=> d!18780 m!96351))

(declare-fun m!96353 () Bool)

(assert (=> d!18780 m!96353))

(assert (=> d!18780 m!96317))

(assert (=> d!18780 m!96319))

(declare-fun m!96355 () Bool)

(assert (=> d!18780 m!96355))

(declare-fun m!96357 () Bool)

(assert (=> d!18780 m!96357))

(declare-fun m!96359 () Bool)

(assert (=> d!18780 m!96359))

(assert (=> d!18780 m!95605))

(declare-fun m!96361 () Bool)

(assert (=> d!18780 m!96361))

(assert (=> d!18780 m!95563))

(declare-fun m!96363 () Bool)

(assert (=> b!61066 m!96363))

(assert (=> b!61066 m!95581))

(assert (=> b!61066 m!95567))

(assert (=> b!61065 m!95567))

(declare-fun m!96365 () Bool)

(assert (=> b!61065 m!96365))

(declare-fun m!96367 () Bool)

(assert (=> b!61065 m!96367))

(declare-fun m!96369 () Bool)

(assert (=> b!61064 m!96369))

(declare-fun m!96371 () Bool)

(assert (=> b!61063 m!96371))

(assert (=> b!60638 d!18780))

(declare-fun d!18782 () Bool)

(assert (=> d!18782 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) lt!94517) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94526)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513)))) lt!94517))))

(declare-fun bs!4700 () Bool)

(assert (= bs!4700 d!18782))

(declare-fun m!96373 () Bool)

(assert (=> bs!4700 m!96373))

(assert (=> b!60638 d!18782))

(declare-fun d!18784 () Bool)

(declare-fun res!50896 () Bool)

(declare-fun e!40723 () Bool)

(assert (=> d!18784 (=> (not res!50896) (not e!40723))))

(assert (=> d!18784 (= res!50896 (= (size!1256 (buf!1637 thiss!1379)) (size!1256 (buf!1637 (_2!2873 lt!94513)))))))

(assert (=> d!18784 (= (isPrefixOf!0 thiss!1379 (_2!2873 lt!94513)) e!40723)))

(declare-fun b!61067 () Bool)

(declare-fun res!50895 () Bool)

(assert (=> b!61067 (=> (not res!50895) (not e!40723))))

(assert (=> b!61067 (= res!50895 (bvsle (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)) (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94513))) (currentByte!3255 (_2!2873 lt!94513)) (currentBit!3250 (_2!2873 lt!94513)))))))

(declare-fun b!61068 () Bool)

(declare-fun e!40722 () Bool)

(assert (=> b!61068 (= e!40723 e!40722)))

(declare-fun res!50894 () Bool)

(assert (=> b!61068 (=> res!50894 e!40722)))

(assert (=> b!61068 (= res!50894 (= (size!1256 (buf!1637 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61069 () Bool)

(assert (=> b!61069 (= e!40722 (arrayBitRangesEq!0 (buf!1637 thiss!1379) (buf!1637 (_2!2873 lt!94513)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379))))))

(assert (= (and d!18784 res!50896) b!61067))

(assert (= (and b!61067 res!50895) b!61068))

(assert (= (and b!61068 (not res!50894)) b!61069))

(assert (=> b!61067 m!95567))

(assert (=> b!61067 m!95585))

(assert (=> b!61069 m!95567))

(assert (=> b!61069 m!95567))

(declare-fun m!96375 () Bool)

(assert (=> b!61069 m!96375))

(assert (=> b!60643 d!18784))

(declare-fun d!18786 () Bool)

(assert (=> d!18786 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) lt!94517) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513)))) lt!94517))))

(declare-fun bs!4701 () Bool)

(assert (= bs!4701 d!18786))

(assert (=> bs!4701 m!96295))

(assert (=> b!60643 d!18786))

(declare-fun d!18788 () Bool)

(declare-fun e!40726 () Bool)

(assert (=> d!18788 e!40726))

(declare-fun res!50899 () Bool)

(assert (=> d!18788 (=> (not res!50899) (not e!40726))))

(assert (=> d!18788 (= res!50899 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!95405 () Unit!4135)

(declare-fun choose!27 (BitStream!2200 BitStream!2200 (_ BitVec 64) (_ BitVec 64)) Unit!4135)

(assert (=> d!18788 (= lt!95405 (choose!27 thiss!1379 (_2!2873 lt!94513) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18788 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18788 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2873 lt!94513) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!95405)))

(declare-fun b!61072 () Bool)

(assert (=> b!61072 (= e!40726 (validate_offset_bits!1 ((_ sign_extend 32) (size!1256 (buf!1637 (_2!2873 lt!94513)))) ((_ sign_extend 32) (currentByte!3255 (_2!2873 lt!94513))) ((_ sign_extend 32) (currentBit!3250 (_2!2873 lt!94513))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18788 res!50899) b!61072))

(declare-fun m!96377 () Bool)

(assert (=> d!18788 m!96377))

(declare-fun m!96379 () Bool)

(assert (=> b!61072 m!96379))

(assert (=> b!60643 d!18788))

(declare-fun b!61131 () Bool)

(declare-fun res!50939 () Bool)

(declare-fun e!40755 () Bool)

(assert (=> b!61131 (=> (not res!50939) (not e!40755))))

(declare-fun lt!95599 () tuple2!5524)

(declare-fun lt!95604 () (_ BitVec 64))

(declare-fun lt!95601 () (_ BitVec 64))

(assert (=> b!61131 (= res!50939 (= (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!95599))) (currentByte!3255 (_2!2873 lt!95599)) (currentBit!3250 (_2!2873 lt!95599))) (bvadd lt!95601 lt!95604)))))

(assert (=> b!61131 (or (not (= (bvand lt!95601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!95601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!95601 lt!95604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61131 (= lt!95604 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!61131 (= lt!95601 (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)))))

(declare-fun b!61132 () Bool)

(declare-fun res!50946 () Bool)

(declare-fun e!40753 () Bool)

(assert (=> b!61132 (=> (not res!50946) (not e!40753))))

(declare-fun lt!95603 () tuple2!5524)

(assert (=> b!61132 (= res!50946 (= (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!95603))) (currentByte!3255 (_2!2873 lt!95603)) (currentBit!3250 (_2!2873 lt!95603))) (bvadd (bitIndex!0 (size!1256 (buf!1637 thiss!1379)) (currentByte!3255 thiss!1379) (currentBit!3250 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!61133 () Bool)

(declare-fun res!50945 () Bool)

(assert (=> b!61133 (=> (not res!50945) (not e!40753))))

(assert (=> b!61133 (= res!50945 (isPrefixOf!0 thiss!1379 (_2!2873 lt!95603)))))

(declare-fun d!18790 () Bool)

(assert (=> d!18790 e!40755))

(declare-fun res!50941 () Bool)

(assert (=> d!18790 (=> (not res!50941) (not e!40755))))

(assert (=> d!18790 (= res!50941 (= (size!1256 (buf!1637 (_2!2873 lt!95599))) (size!1256 (buf!1637 thiss!1379))))))

(declare-fun lt!95605 () (_ BitVec 8))

(declare-fun lt!95595 () array!2761)

(assert (=> d!18790 (= lt!95605 (select (arr!1820 lt!95595) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18790 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1256 lt!95595)))))

(assert (=> d!18790 (= lt!95595 (array!2762 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!95600 () tuple2!5524)

(assert (=> d!18790 (= lt!95599 (tuple2!5525 (_1!2873 lt!95600) (_2!2873 lt!95600)))))

(assert (=> d!18790 (= lt!95600 lt!95603)))

(assert (=> d!18790 e!40753))

(declare-fun res!50944 () Bool)

(assert (=> d!18790 (=> (not res!50944) (not e!40753))))

(assert (=> d!18790 (= res!50944 (= (size!1256 (buf!1637 thiss!1379)) (size!1256 (buf!1637 (_2!2873 lt!95603)))))))

(declare-fun lt!95594 () Bool)

(declare-fun appendBit!0 (BitStream!2200 Bool) tuple2!5524)

(assert (=> d!18790 (= lt!95603 (appendBit!0 thiss!1379 lt!95594))))

(assert (=> d!18790 (= lt!95594 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1820 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18790 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18790 (= (appendBitFromByte!0 thiss!1379 (select (arr!1820 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!95599)))

(declare-fun b!61134 () Bool)

(declare-fun res!50940 () Bool)

(assert (=> b!61134 (=> (not res!50940) (not e!40755))))

(assert (=> b!61134 (= res!50940 (isPrefixOf!0 thiss!1379 (_2!2873 lt!95599)))))

(declare-fun b!61135 () Bool)

(declare-fun e!40752 () Bool)

(assert (=> b!61135 (= e!40753 e!40752)))

(declare-fun res!50943 () Bool)

(assert (=> b!61135 (=> (not res!50943) (not e!40752))))

(declare-datatypes ((tuple2!5556 0))(
  ( (tuple2!5557 (_1!2889 BitStream!2200) (_2!2889 Bool)) )
))
(declare-fun lt!95597 () tuple2!5556)

(assert (=> b!61135 (= res!50943 (and (= (_2!2889 lt!95597) lt!95594) (= (_1!2889 lt!95597) (_2!2873 lt!95603))))))

(declare-fun readBitPure!0 (BitStream!2200) tuple2!5556)

(declare-fun readerFrom!0 (BitStream!2200 (_ BitVec 32) (_ BitVec 32)) BitStream!2200)

(assert (=> b!61135 (= lt!95597 (readBitPure!0 (readerFrom!0 (_2!2873 lt!95603) (currentBit!3250 thiss!1379) (currentByte!3255 thiss!1379))))))

(declare-fun b!61136 () Bool)

(declare-fun e!40754 () Bool)

(assert (=> b!61136 (= e!40755 e!40754)))

(declare-fun res!50942 () Bool)

(assert (=> b!61136 (=> (not res!50942) (not e!40754))))

(declare-fun lt!95598 () tuple2!5556)

(assert (=> b!61136 (= res!50942 (and (= (_2!2889 lt!95598) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1820 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!95605)) #b00000000000000000000000000000000))) (= (_1!2889 lt!95598) (_2!2873 lt!95599))))))

(declare-fun lt!95596 () tuple2!5542)

(declare-fun lt!95602 () BitStream!2200)

(assert (=> b!61136 (= lt!95596 (readBits!0 lt!95602 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!61136 (= lt!95598 (readBitPure!0 lt!95602))))

(assert (=> b!61136 (= lt!95602 (readerFrom!0 (_2!2873 lt!95599) (currentBit!3250 thiss!1379) (currentByte!3255 thiss!1379)))))

(declare-fun b!61137 () Bool)

(assert (=> b!61137 (= e!40754 (= (bitIndex!0 (size!1256 (buf!1637 (_1!2889 lt!95598))) (currentByte!3255 (_1!2889 lt!95598)) (currentBit!3250 (_1!2889 lt!95598))) (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!95599))) (currentByte!3255 (_2!2873 lt!95599)) (currentBit!3250 (_2!2873 lt!95599)))))))

(declare-fun b!61138 () Bool)

(assert (=> b!61138 (= e!40752 (= (bitIndex!0 (size!1256 (buf!1637 (_1!2889 lt!95597))) (currentByte!3255 (_1!2889 lt!95597)) (currentBit!3250 (_1!2889 lt!95597))) (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!95603))) (currentByte!3255 (_2!2873 lt!95603)) (currentBit!3250 (_2!2873 lt!95603)))))))

(assert (= (and d!18790 res!50944) b!61132))

(assert (= (and b!61132 res!50946) b!61133))

(assert (= (and b!61133 res!50945) b!61135))

(assert (= (and b!61135 res!50943) b!61138))

(assert (= (and d!18790 res!50941) b!61131))

(assert (= (and b!61131 res!50939) b!61134))

(assert (= (and b!61134 res!50940) b!61136))

(assert (= (and b!61136 res!50942) b!61137))

(declare-fun m!96505 () Bool)

(assert (=> d!18790 m!96505))

(declare-fun m!96507 () Bool)

(assert (=> d!18790 m!96507))

(assert (=> d!18790 m!96283))

(declare-fun m!96509 () Bool)

(assert (=> b!61136 m!96509))

(declare-fun m!96511 () Bool)

(assert (=> b!61136 m!96511))

(declare-fun m!96513 () Bool)

(assert (=> b!61136 m!96513))

(declare-fun m!96515 () Bool)

(assert (=> b!61137 m!96515))

(declare-fun m!96517 () Bool)

(assert (=> b!61137 m!96517))

(declare-fun m!96519 () Bool)

(assert (=> b!61135 m!96519))

(assert (=> b!61135 m!96519))

(declare-fun m!96521 () Bool)

(assert (=> b!61135 m!96521))

(assert (=> b!61131 m!96517))

(assert (=> b!61131 m!95567))

(declare-fun m!96523 () Bool)

(assert (=> b!61133 m!96523))

(declare-fun m!96525 () Bool)

(assert (=> b!61132 m!96525))

(assert (=> b!61132 m!95567))

(declare-fun m!96527 () Bool)

(assert (=> b!61134 m!96527))

(declare-fun m!96529 () Bool)

(assert (=> b!61138 m!96529))

(assert (=> b!61138 m!96525))

(assert (=> b!60643 d!18790))

(declare-fun d!18808 () Bool)

(declare-fun res!50949 () Bool)

(declare-fun e!40757 () Bool)

(assert (=> d!18808 (=> (not res!50949) (not e!40757))))

(assert (=> d!18808 (= res!50949 (= (size!1256 (buf!1637 (_1!2872 lt!94514))) (size!1256 (buf!1637 (_2!2873 lt!94526)))))))

(assert (=> d!18808 (= (isPrefixOf!0 (_1!2872 lt!94514) (_2!2873 lt!94526)) e!40757)))

(declare-fun b!61139 () Bool)

(declare-fun res!50948 () Bool)

(assert (=> b!61139 (=> (not res!50948) (not e!40757))))

(assert (=> b!61139 (= res!50948 (bvsle (bitIndex!0 (size!1256 (buf!1637 (_1!2872 lt!94514))) (currentByte!3255 (_1!2872 lt!94514)) (currentBit!3250 (_1!2872 lt!94514))) (bitIndex!0 (size!1256 (buf!1637 (_2!2873 lt!94526))) (currentByte!3255 (_2!2873 lt!94526)) (currentBit!3250 (_2!2873 lt!94526)))))))

(declare-fun b!61140 () Bool)

(declare-fun e!40756 () Bool)

(assert (=> b!61140 (= e!40757 e!40756)))

(declare-fun res!50947 () Bool)

(assert (=> b!61140 (=> res!50947 e!40756)))

(assert (=> b!61140 (= res!50947 (= (size!1256 (buf!1637 (_1!2872 lt!94514))) #b00000000000000000000000000000000))))

(declare-fun b!61141 () Bool)

(assert (=> b!61141 (= e!40756 (arrayBitRangesEq!0 (buf!1637 (_1!2872 lt!94514)) (buf!1637 (_2!2873 lt!94526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1256 (buf!1637 (_1!2872 lt!94514))) (currentByte!3255 (_1!2872 lt!94514)) (currentBit!3250 (_1!2872 lt!94514)))))))

(assert (= (and d!18808 res!50949) b!61139))

(assert (= (and b!61139 res!50948) b!61140))

(assert (= (and b!61140 (not res!50947)) b!61141))

(declare-fun m!96531 () Bool)

(assert (=> b!61139 m!96531))

(assert (=> b!61139 m!95581))

(assert (=> b!61141 m!96531))

(assert (=> b!61141 m!96531))

(declare-fun m!96533 () Bool)

(assert (=> b!61141 m!96533))

(assert (=> b!60628 d!18808))

(declare-fun d!18810 () Bool)

(assert (=> d!18810 (= (invariant!0 (currentBit!3250 (_2!2873 lt!94526)) (currentByte!3255 (_2!2873 lt!94526)) (size!1256 (buf!1637 (_2!2873 lt!94526)))) (and (bvsge (currentBit!3250 (_2!2873 lt!94526)) #b00000000000000000000000000000000) (bvslt (currentBit!3250 (_2!2873 lt!94526)) #b00000000000000000000000000001000) (bvsge (currentByte!3255 (_2!2873 lt!94526)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3255 (_2!2873 lt!94526)) (size!1256 (buf!1637 (_2!2873 lt!94526)))) (and (= (currentBit!3250 (_2!2873 lt!94526)) #b00000000000000000000000000000000) (= (currentByte!3255 (_2!2873 lt!94526)) (size!1256 (buf!1637 (_2!2873 lt!94526))))))))))

(assert (=> b!60639 d!18810))

(declare-fun d!18812 () Bool)

(assert (=> d!18812 (= (array_inv!1159 (buf!1637 thiss!1379)) (bvsge (size!1256 (buf!1637 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!60629 d!18812))

(push 1)

(assert (not b!61137))

(assert (not b!61066))

(assert (not b!61039))

(assert (not b!61054))

(assert (not b!61046))

(assert (not d!18742))

(assert (not b!61011))

(assert (not b!61017))

(assert (not b!61061))

(assert (not b!61064))

(assert (not b!61029))

(assert (not b!61134))

(assert (not b!61065))

(assert (not b!60819))

(assert (not d!18778))

(assert (not b!61139))

(assert (not b!61135))

(assert (not b!61136))

(assert (not d!18652))

(assert (not b!61057))

(assert (not b!61132))

(assert (not d!18780))

(assert (not d!18786))

(assert (not bm!766))

(assert (not d!18756))

(assert (not b!61056))

(assert (not b!60820))

(assert (not b!61060))

(assert (not b!60838))

(assert (not b!61051))

(assert (not d!18650))

(assert (not b!61072))

(assert (not b!61069))

(assert (not b!61041))

(assert (not b!61010))

(assert (not b!61055))

(assert (not b!61067))

(assert (not d!18740))

(assert (not b!61044))

(assert (not b!61063))

(assert (not b!61008))

(assert (not d!18782))

(assert (not d!18772))

(assert (not b!61131))

(assert (not b!61138))

(assert (not b!61050))

(assert (not d!18788))

(assert (not d!18768))

(assert (not b!60821))

(assert (not b!61133))

(assert (not d!18766))

(assert (not d!18758))

(assert (not b!61059))

(assert (not d!18744))

(assert (not b!60818))

(assert (not b!60840))

(assert (not b!61007))

(assert (not b!61014))

(assert (not b!61040))

(assert (not b!61015))

(assert (not d!18636))

(assert (not b!61141))

(assert (not d!18776))

(assert (not d!18764))

(assert (not d!18790))

(assert (not d!18654))

(assert (not d!18648))

(assert (not b!61052))

(assert (not b!61009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

