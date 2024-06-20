; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11812 () Bool)

(assert start!11812)

(declare-fun b!58656 () Bool)

(declare-fun res!48749 () Bool)

(declare-fun e!38934 () Bool)

(assert (=> b!58656 (=> res!48749 e!38934)))

(declare-datatypes ((array!2669 0))(
  ( (array!2670 (arr!1774 (Array (_ BitVec 32) (_ BitVec 8))) (size!1210 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2108 0))(
  ( (BitStream!2109 (buf!1591 array!2669) (currentByte!3209 (_ BitVec 32)) (currentBit!3204 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4043 0))(
  ( (Unit!4044) )
))
(declare-datatypes ((tuple2!5338 0))(
  ( (tuple2!5339 (_1!2780 Unit!4043) (_2!2780 BitStream!2108)) )
))
(declare-fun lt!92509 () tuple2!5338)

(declare-fun lt!92516 () tuple2!5338)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58656 (= res!48749 (not (invariant!0 (currentBit!3204 (_2!2780 lt!92509)) (currentByte!3209 (_2!2780 lt!92509)) (size!1210 (buf!1591 (_2!2780 lt!92516))))))))

(declare-fun b!58658 () Bool)

(declare-fun res!48746 () Bool)

(declare-fun e!38936 () Bool)

(assert (=> b!58658 (=> (not res!48746) (not e!38936))))

(declare-fun thiss!1379 () BitStream!2108)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58658 (= res!48746 (validate_offset_bits!1 ((_ sign_extend 32) (size!1210 (buf!1591 thiss!1379))) ((_ sign_extend 32) (currentByte!3209 thiss!1379)) ((_ sign_extend 32) (currentBit!3204 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58659 () Bool)

(declare-fun e!38929 () Bool)

(declare-fun e!38930 () Bool)

(assert (=> b!58659 (= e!38929 e!38930)))

(declare-fun res!48748 () Bool)

(assert (=> b!58659 (=> res!48748 e!38930)))

(declare-fun isPrefixOf!0 (BitStream!2108 BitStream!2108) Bool)

(assert (=> b!58659 (= res!48748 (not (isPrefixOf!0 (_2!2780 lt!92509) (_2!2780 lt!92516))))))

(assert (=> b!58659 (isPrefixOf!0 thiss!1379 (_2!2780 lt!92516))))

(declare-fun lt!92508 () Unit!4043)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2108 BitStream!2108 BitStream!2108) Unit!4043)

(assert (=> b!58659 (= lt!92508 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2780 lt!92509) (_2!2780 lt!92516)))))

(declare-fun srcBuffer!2 () array!2669)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2108 array!2669 (_ BitVec 64) (_ BitVec 64)) tuple2!5338)

(assert (=> b!58659 (= lt!92516 (appendBitsMSBFirstLoop!0 (_2!2780 lt!92509) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38938 () Bool)

(assert (=> b!58659 e!38938))

(declare-fun res!48741 () Bool)

(assert (=> b!58659 (=> (not res!48741) (not e!38938))))

(assert (=> b!58659 (= res!48741 (validate_offset_bits!1 ((_ sign_extend 32) (size!1210 (buf!1591 (_2!2780 lt!92509)))) ((_ sign_extend 32) (currentByte!3209 thiss!1379)) ((_ sign_extend 32) (currentBit!3204 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92518 () Unit!4043)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2108 array!2669 (_ BitVec 64)) Unit!4043)

(assert (=> b!58659 (= lt!92518 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1591 (_2!2780 lt!92509)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5340 0))(
  ( (tuple2!5341 (_1!2781 BitStream!2108) (_2!2781 BitStream!2108)) )
))
(declare-fun lt!92514 () tuple2!5340)

(declare-fun reader!0 (BitStream!2108 BitStream!2108) tuple2!5340)

(assert (=> b!58659 (= lt!92514 (reader!0 thiss!1379 (_2!2780 lt!92509)))))

(declare-fun lt!92513 () (_ BitVec 64))

(declare-fun b!58660 () Bool)

(declare-fun e!38931 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58660 (= e!38931 (= lt!92513 (bvsub (bvsub (bvadd (bitIndex!0 (size!1210 (buf!1591 (_2!2780 lt!92509))) (currentByte!3209 (_2!2780 lt!92509)) (currentBit!3204 (_2!2780 lt!92509))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58661 () Bool)

(declare-fun res!48750 () Bool)

(declare-fun e!38932 () Bool)

(assert (=> b!58661 (=> res!48750 e!38932)))

(assert (=> b!58661 (= res!48750 (not (invariant!0 (currentBit!3204 (_2!2780 lt!92516)) (currentByte!3209 (_2!2780 lt!92516)) (size!1210 (buf!1591 (_2!2780 lt!92516))))))))

(declare-fun b!58662 () Bool)

(declare-fun e!38939 () Bool)

(assert (=> b!58662 (= e!38936 (not e!38939))))

(declare-fun res!48743 () Bool)

(assert (=> b!58662 (=> res!48743 e!38939)))

(assert (=> b!58662 (= res!48743 (bvsge i!635 to!314))))

(assert (=> b!58662 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92512 () Unit!4043)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2108) Unit!4043)

(assert (=> b!58662 (= lt!92512 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92515 () (_ BitVec 64))

(assert (=> b!58662 (= lt!92515 (bitIndex!0 (size!1210 (buf!1591 thiss!1379)) (currentByte!3209 thiss!1379) (currentBit!3204 thiss!1379)))))

(declare-fun b!58663 () Bool)

(assert (=> b!58663 (= e!38930 e!38932)))

(declare-fun res!48744 () Bool)

(assert (=> b!58663 (=> res!48744 e!38932)))

(assert (=> b!58663 (= res!48744 (not (= lt!92513 (bvsub (bvadd lt!92515 to!314) i!635))))))

(assert (=> b!58663 (= lt!92513 (bitIndex!0 (size!1210 (buf!1591 (_2!2780 lt!92516))) (currentByte!3209 (_2!2780 lt!92516)) (currentBit!3204 (_2!2780 lt!92516))))))

(declare-fun res!48747 () Bool)

(assert (=> start!11812 (=> (not res!48747) (not e!38936))))

(assert (=> start!11812 (= res!48747 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1210 srcBuffer!2))))))))

(assert (=> start!11812 e!38936))

(assert (=> start!11812 true))

(declare-fun array_inv!1113 (array!2669) Bool)

(assert (=> start!11812 (array_inv!1113 srcBuffer!2)))

(declare-fun e!38935 () Bool)

(declare-fun inv!12 (BitStream!2108) Bool)

(assert (=> start!11812 (and (inv!12 thiss!1379) e!38935)))

(declare-fun b!58657 () Bool)

(assert (=> b!58657 (= e!38934 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!92510 () tuple2!5340)

(assert (=> b!58657 (= lt!92510 (reader!0 (_2!2780 lt!92509) (_2!2780 lt!92516)))))

(assert (=> b!58657 (validate_offset_bits!1 ((_ sign_extend 32) (size!1210 (buf!1591 (_2!2780 lt!92516)))) ((_ sign_extend 32) (currentByte!3209 thiss!1379)) ((_ sign_extend 32) (currentBit!3204 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92517 () Unit!4043)

(assert (=> b!58657 (= lt!92517 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1591 (_2!2780 lt!92516)) (bvsub to!314 i!635)))))

(declare-fun lt!92507 () tuple2!5340)

(assert (=> b!58657 (= lt!92507 (reader!0 thiss!1379 (_2!2780 lt!92516)))))

(declare-fun b!58664 () Bool)

(assert (=> b!58664 (= e!38935 (array_inv!1113 (buf!1591 thiss!1379)))))

(declare-fun b!58665 () Bool)

(declare-fun res!48740 () Bool)

(assert (=> b!58665 (=> res!48740 e!38932)))

(assert (=> b!58665 (= res!48740 (not (= (size!1210 (buf!1591 thiss!1379)) (size!1210 (buf!1591 (_2!2780 lt!92516))))))))

(declare-fun b!58666 () Bool)

(declare-fun res!48739 () Bool)

(assert (=> b!58666 (=> res!48739 e!38934)))

(assert (=> b!58666 (= res!48739 (not (invariant!0 (currentBit!3204 (_2!2780 lt!92509)) (currentByte!3209 (_2!2780 lt!92509)) (size!1210 (buf!1591 (_2!2780 lt!92509))))))))

(declare-fun b!58667 () Bool)

(assert (=> b!58667 (= e!38932 e!38934)))

(declare-fun res!48745 () Bool)

(assert (=> b!58667 (=> res!48745 e!38934)))

(assert (=> b!58667 (= res!48745 (not (= (size!1210 (buf!1591 (_2!2780 lt!92509))) (size!1210 (buf!1591 (_2!2780 lt!92516))))))))

(assert (=> b!58667 e!38931))

(declare-fun res!48742 () Bool)

(assert (=> b!58667 (=> (not res!48742) (not e!38931))))

(assert (=> b!58667 (= res!48742 (= (size!1210 (buf!1591 (_2!2780 lt!92516))) (size!1210 (buf!1591 thiss!1379))))))

(declare-fun b!58668 () Bool)

(assert (=> b!58668 (= e!38939 e!38929)))

(declare-fun res!48738 () Bool)

(assert (=> b!58668 (=> res!48738 e!38929)))

(assert (=> b!58668 (= res!48738 (not (isPrefixOf!0 thiss!1379 (_2!2780 lt!92509))))))

(assert (=> b!58668 (validate_offset_bits!1 ((_ sign_extend 32) (size!1210 (buf!1591 (_2!2780 lt!92509)))) ((_ sign_extend 32) (currentByte!3209 (_2!2780 lt!92509))) ((_ sign_extend 32) (currentBit!3204 (_2!2780 lt!92509))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92511 () Unit!4043)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2108 BitStream!2108 (_ BitVec 64) (_ BitVec 64)) Unit!4043)

(assert (=> b!58668 (= lt!92511 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2780 lt!92509) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2108 (_ BitVec 8) (_ BitVec 32)) tuple2!5338)

(assert (=> b!58668 (= lt!92509 (appendBitFromByte!0 thiss!1379 (select (arr!1774 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58669 () Bool)

(declare-datatypes ((List!629 0))(
  ( (Nil!626) (Cons!625 (h!744 Bool) (t!1379 List!629)) )
))
(declare-fun head!448 (List!629) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2108 array!2669 (_ BitVec 64) (_ BitVec 64)) List!629)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2108 BitStream!2108 (_ BitVec 64)) List!629)

(assert (=> b!58669 (= e!38938 (= (head!448 (byteArrayBitContentToList!0 (_2!2780 lt!92509) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!448 (bitStreamReadBitsIntoList!0 (_2!2780 lt!92509) (_1!2781 lt!92514) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!11812 res!48747) b!58658))

(assert (= (and b!58658 res!48746) b!58662))

(assert (= (and b!58662 (not res!48743)) b!58668))

(assert (= (and b!58668 (not res!48738)) b!58659))

(assert (= (and b!58659 res!48741) b!58669))

(assert (= (and b!58659 (not res!48748)) b!58663))

(assert (= (and b!58663 (not res!48744)) b!58661))

(assert (= (and b!58661 (not res!48750)) b!58665))

(assert (= (and b!58665 (not res!48740)) b!58667))

(assert (= (and b!58667 res!48742) b!58660))

(assert (= (and b!58667 (not res!48745)) b!58666))

(assert (= (and b!58666 (not res!48739)) b!58656))

(assert (= (and b!58656 (not res!48749)) b!58657))

(assert (= start!11812 b!58664))

(declare-fun m!92385 () Bool)

(assert (=> start!11812 m!92385))

(declare-fun m!92387 () Bool)

(assert (=> start!11812 m!92387))

(declare-fun m!92389 () Bool)

(assert (=> b!58659 m!92389))

(declare-fun m!92391 () Bool)

(assert (=> b!58659 m!92391))

(declare-fun m!92393 () Bool)

(assert (=> b!58659 m!92393))

(declare-fun m!92395 () Bool)

(assert (=> b!58659 m!92395))

(declare-fun m!92397 () Bool)

(assert (=> b!58659 m!92397))

(declare-fun m!92399 () Bool)

(assert (=> b!58659 m!92399))

(declare-fun m!92401 () Bool)

(assert (=> b!58659 m!92401))

(declare-fun m!92403 () Bool)

(assert (=> b!58664 m!92403))

(declare-fun m!92405 () Bool)

(assert (=> b!58662 m!92405))

(declare-fun m!92407 () Bool)

(assert (=> b!58662 m!92407))

(declare-fun m!92409 () Bool)

(assert (=> b!58662 m!92409))

(declare-fun m!92411 () Bool)

(assert (=> b!58656 m!92411))

(declare-fun m!92413 () Bool)

(assert (=> b!58666 m!92413))

(declare-fun m!92415 () Bool)

(assert (=> b!58663 m!92415))

(declare-fun m!92417 () Bool)

(assert (=> b!58660 m!92417))

(declare-fun m!92419 () Bool)

(assert (=> b!58669 m!92419))

(assert (=> b!58669 m!92419))

(declare-fun m!92421 () Bool)

(assert (=> b!58669 m!92421))

(declare-fun m!92423 () Bool)

(assert (=> b!58669 m!92423))

(assert (=> b!58669 m!92423))

(declare-fun m!92425 () Bool)

(assert (=> b!58669 m!92425))

(declare-fun m!92427 () Bool)

(assert (=> b!58668 m!92427))

(declare-fun m!92429 () Bool)

(assert (=> b!58668 m!92429))

(declare-fun m!92431 () Bool)

(assert (=> b!58668 m!92431))

(declare-fun m!92433 () Bool)

(assert (=> b!58668 m!92433))

(assert (=> b!58668 m!92429))

(declare-fun m!92435 () Bool)

(assert (=> b!58668 m!92435))

(declare-fun m!92437 () Bool)

(assert (=> b!58661 m!92437))

(declare-fun m!92439 () Bool)

(assert (=> b!58657 m!92439))

(declare-fun m!92441 () Bool)

(assert (=> b!58657 m!92441))

(declare-fun m!92443 () Bool)

(assert (=> b!58657 m!92443))

(declare-fun m!92445 () Bool)

(assert (=> b!58657 m!92445))

(declare-fun m!92447 () Bool)

(assert (=> b!58658 m!92447))

(push 1)

(assert (not b!58669))

(assert (not b!58660))

(assert (not b!58664))

(assert (not b!58668))

(assert (not b!58657))

(assert (not b!58658))

(assert (not b!58656))

(assert (not b!58661))

(assert (not b!58659))

(assert (not start!11812))

(assert (not b!58662))

(assert (not b!58663))

(assert (not b!58666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

