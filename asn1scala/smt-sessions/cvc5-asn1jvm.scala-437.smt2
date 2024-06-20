; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11814 () Bool)

(assert start!11814)

(declare-fun b!58698 () Bool)

(declare-fun e!38965 () Bool)

(declare-datatypes ((array!2671 0))(
  ( (array!2672 (arr!1775 (Array (_ BitVec 32) (_ BitVec 8))) (size!1211 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2110 0))(
  ( (BitStream!2111 (buf!1592 array!2671) (currentByte!3210 (_ BitVec 32)) (currentBit!3205 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2110)

(declare-fun array_inv!1114 (array!2671) Bool)

(assert (=> b!58698 (= e!38965 (array_inv!1114 (buf!1592 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2671)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5342 0))(
  ( (tuple2!5343 (_1!2782 BitStream!2110) (_2!2782 BitStream!2110)) )
))
(declare-fun lt!92549 () tuple2!5342)

(declare-datatypes ((Unit!4045 0))(
  ( (Unit!4046) )
))
(declare-datatypes ((tuple2!5344 0))(
  ( (tuple2!5345 (_1!2783 Unit!4045) (_2!2783 BitStream!2110)) )
))
(declare-fun lt!92560 () tuple2!5344)

(declare-fun e!38962 () Bool)

(declare-fun b!58699 () Bool)

(declare-datatypes ((List!630 0))(
  ( (Nil!627) (Cons!626 (h!745 Bool) (t!1380 List!630)) )
))
(declare-fun head!449 (List!630) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2110 array!2671 (_ BitVec 64) (_ BitVec 64)) List!630)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2110 BitStream!2110 (_ BitVec 64)) List!630)

(assert (=> b!58699 (= e!38962 (= (head!449 (byteArrayBitContentToList!0 (_2!2783 lt!92560) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!449 (bitStreamReadBitsIntoList!0 (_2!2783 lt!92560) (_1!2782 lt!92549) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58700 () Bool)

(declare-fun e!38972 () Bool)

(declare-fun e!38966 () Bool)

(assert (=> b!58700 (= e!38972 e!38966)))

(declare-fun res!48781 () Bool)

(assert (=> b!58700 (=> res!48781 e!38966)))

(declare-fun lt!92555 () tuple2!5344)

(assert (=> b!58700 (= res!48781 (not (= (size!1211 (buf!1592 (_2!2783 lt!92560))) (size!1211 (buf!1592 (_2!2783 lt!92555))))))))

(declare-fun e!38963 () Bool)

(assert (=> b!58700 e!38963))

(declare-fun res!48783 () Bool)

(assert (=> b!58700 (=> (not res!48783) (not e!38963))))

(assert (=> b!58700 (= res!48783 (= (size!1211 (buf!1592 (_2!2783 lt!92555))) (size!1211 (buf!1592 thiss!1379))))))

(declare-fun b!58701 () Bool)

(declare-fun res!48777 () Bool)

(assert (=> b!58701 (=> res!48777 e!38972)))

(assert (=> b!58701 (= res!48777 (not (= (size!1211 (buf!1592 thiss!1379)) (size!1211 (buf!1592 (_2!2783 lt!92555))))))))

(declare-fun b!58702 () Bool)

(declare-fun e!38967 () Bool)

(assert (=> b!58702 (= e!38967 e!38972)))

(declare-fun res!48786 () Bool)

(assert (=> b!58702 (=> res!48786 e!38972)))

(declare-fun lt!92552 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!92548 () (_ BitVec 64))

(assert (=> b!58702 (= res!48786 (not (= lt!92548 (bvsub (bvadd lt!92552 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58702 (= lt!92548 (bitIndex!0 (size!1211 (buf!1592 (_2!2783 lt!92555))) (currentByte!3210 (_2!2783 lt!92555)) (currentBit!3205 (_2!2783 lt!92555))))))

(declare-fun b!58703 () Bool)

(declare-fun lt!92559 () (_ BitVec 64))

(declare-fun lt!92553 () (_ BitVec 64))

(assert (=> b!58703 (= e!38966 (or (= lt!92559 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!92559 (bvand lt!92553 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!58703 (= lt!92559 (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!92551 () tuple2!5342)

(declare-fun reader!0 (BitStream!2110 BitStream!2110) tuple2!5342)

(assert (=> b!58703 (= lt!92551 (reader!0 (_2!2783 lt!92560) (_2!2783 lt!92555)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58703 (validate_offset_bits!1 ((_ sign_extend 32) (size!1211 (buf!1592 (_2!2783 lt!92555)))) ((_ sign_extend 32) (currentByte!3210 thiss!1379)) ((_ sign_extend 32) (currentBit!3205 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92556 () Unit!4045)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2110 array!2671 (_ BitVec 64)) Unit!4045)

(assert (=> b!58703 (= lt!92556 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1592 (_2!2783 lt!92555)) (bvsub to!314 i!635)))))

(declare-fun lt!92554 () tuple2!5342)

(assert (=> b!58703 (= lt!92554 (reader!0 thiss!1379 (_2!2783 lt!92555)))))

(declare-fun b!58704 () Bool)

(assert (=> b!58704 (= e!38963 (= lt!92548 (bvsub (bvsub (bvadd (bitIndex!0 (size!1211 (buf!1592 (_2!2783 lt!92560))) (currentByte!3210 (_2!2783 lt!92560)) (currentBit!3205 (_2!2783 lt!92560))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58706 () Bool)

(declare-fun e!38968 () Bool)

(declare-fun e!38969 () Bool)

(assert (=> b!58706 (= e!38968 (not e!38969))))

(declare-fun res!48784 () Bool)

(assert (=> b!58706 (=> res!48784 e!38969)))

(assert (=> b!58706 (= res!48784 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2110 BitStream!2110) Bool)

(assert (=> b!58706 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92557 () Unit!4045)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2110) Unit!4045)

(assert (=> b!58706 (= lt!92557 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58706 (= lt!92552 (bitIndex!0 (size!1211 (buf!1592 thiss!1379)) (currentByte!3210 thiss!1379) (currentBit!3205 thiss!1379)))))

(declare-fun b!58707 () Bool)

(declare-fun res!48789 () Bool)

(assert (=> b!58707 (=> res!48789 e!38966)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58707 (= res!48789 (not (invariant!0 (currentBit!3205 (_2!2783 lt!92560)) (currentByte!3210 (_2!2783 lt!92560)) (size!1211 (buf!1592 (_2!2783 lt!92555))))))))

(declare-fun b!58708 () Bool)

(declare-fun res!48778 () Bool)

(assert (=> b!58708 (=> res!48778 e!38966)))

(assert (=> b!58708 (= res!48778 (not (invariant!0 (currentBit!3205 (_2!2783 lt!92560)) (currentByte!3210 (_2!2783 lt!92560)) (size!1211 (buf!1592 (_2!2783 lt!92560))))))))

(declare-fun b!58709 () Bool)

(declare-fun res!48780 () Bool)

(assert (=> b!58709 (=> (not res!48780) (not e!38968))))

(assert (=> b!58709 (= res!48780 (validate_offset_bits!1 ((_ sign_extend 32) (size!1211 (buf!1592 thiss!1379))) ((_ sign_extend 32) (currentByte!3210 thiss!1379)) ((_ sign_extend 32) (currentBit!3205 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58710 () Bool)

(declare-fun res!48787 () Bool)

(assert (=> b!58710 (=> res!48787 e!38972)))

(assert (=> b!58710 (= res!48787 (not (invariant!0 (currentBit!3205 (_2!2783 lt!92555)) (currentByte!3210 (_2!2783 lt!92555)) (size!1211 (buf!1592 (_2!2783 lt!92555))))))))

(declare-fun b!58711 () Bool)

(declare-fun e!38970 () Bool)

(assert (=> b!58711 (= e!38969 e!38970)))

(declare-fun res!48785 () Bool)

(assert (=> b!58711 (=> res!48785 e!38970)))

(assert (=> b!58711 (= res!48785 (not (isPrefixOf!0 thiss!1379 (_2!2783 lt!92560))))))

(assert (=> b!58711 (validate_offset_bits!1 ((_ sign_extend 32) (size!1211 (buf!1592 (_2!2783 lt!92560)))) ((_ sign_extend 32) (currentByte!3210 (_2!2783 lt!92560))) ((_ sign_extend 32) (currentBit!3205 (_2!2783 lt!92560))) lt!92553)))

(assert (=> b!58711 (= lt!92553 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92550 () Unit!4045)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2110 BitStream!2110 (_ BitVec 64) (_ BitVec 64)) Unit!4045)

(assert (=> b!58711 (= lt!92550 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2783 lt!92560) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2110 (_ BitVec 8) (_ BitVec 32)) tuple2!5344)

(assert (=> b!58711 (= lt!92560 (appendBitFromByte!0 thiss!1379 (select (arr!1775 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58705 () Bool)

(assert (=> b!58705 (= e!38970 e!38967)))

(declare-fun res!48782 () Bool)

(assert (=> b!58705 (=> res!48782 e!38967)))

(assert (=> b!58705 (= res!48782 (not (isPrefixOf!0 (_2!2783 lt!92560) (_2!2783 lt!92555))))))

(assert (=> b!58705 (isPrefixOf!0 thiss!1379 (_2!2783 lt!92555))))

(declare-fun lt!92547 () Unit!4045)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2110 BitStream!2110 BitStream!2110) Unit!4045)

(assert (=> b!58705 (= lt!92547 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2783 lt!92560) (_2!2783 lt!92555)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2110 array!2671 (_ BitVec 64) (_ BitVec 64)) tuple2!5344)

(assert (=> b!58705 (= lt!92555 (appendBitsMSBFirstLoop!0 (_2!2783 lt!92560) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58705 e!38962))

(declare-fun res!48788 () Bool)

(assert (=> b!58705 (=> (not res!48788) (not e!38962))))

(assert (=> b!58705 (= res!48788 (validate_offset_bits!1 ((_ sign_extend 32) (size!1211 (buf!1592 (_2!2783 lt!92560)))) ((_ sign_extend 32) (currentByte!3210 thiss!1379)) ((_ sign_extend 32) (currentBit!3205 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92558 () Unit!4045)

(assert (=> b!58705 (= lt!92558 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1592 (_2!2783 lt!92560)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58705 (= lt!92549 (reader!0 thiss!1379 (_2!2783 lt!92560)))))

(declare-fun res!48779 () Bool)

(assert (=> start!11814 (=> (not res!48779) (not e!38968))))

(assert (=> start!11814 (= res!48779 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1211 srcBuffer!2))))))))

(assert (=> start!11814 e!38968))

(assert (=> start!11814 true))

(assert (=> start!11814 (array_inv!1114 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2110) Bool)

(assert (=> start!11814 (and (inv!12 thiss!1379) e!38965)))

(assert (= (and start!11814 res!48779) b!58709))

(assert (= (and b!58709 res!48780) b!58706))

(assert (= (and b!58706 (not res!48784)) b!58711))

(assert (= (and b!58711 (not res!48785)) b!58705))

(assert (= (and b!58705 res!48788) b!58699))

(assert (= (and b!58705 (not res!48782)) b!58702))

(assert (= (and b!58702 (not res!48786)) b!58710))

(assert (= (and b!58710 (not res!48787)) b!58701))

(assert (= (and b!58701 (not res!48777)) b!58700))

(assert (= (and b!58700 res!48783) b!58704))

(assert (= (and b!58700 (not res!48781)) b!58708))

(assert (= (and b!58708 (not res!48778)) b!58707))

(assert (= (and b!58707 (not res!48789)) b!58703))

(assert (= start!11814 b!58698))

(declare-fun m!92449 () Bool)

(assert (=> b!58702 m!92449))

(declare-fun m!92451 () Bool)

(assert (=> b!58711 m!92451))

(declare-fun m!92453 () Bool)

(assert (=> b!58711 m!92453))

(declare-fun m!92455 () Bool)

(assert (=> b!58711 m!92455))

(declare-fun m!92457 () Bool)

(assert (=> b!58711 m!92457))

(assert (=> b!58711 m!92453))

(declare-fun m!92459 () Bool)

(assert (=> b!58711 m!92459))

(declare-fun m!92461 () Bool)

(assert (=> b!58705 m!92461))

(declare-fun m!92463 () Bool)

(assert (=> b!58705 m!92463))

(declare-fun m!92465 () Bool)

(assert (=> b!58705 m!92465))

(declare-fun m!92467 () Bool)

(assert (=> b!58705 m!92467))

(declare-fun m!92469 () Bool)

(assert (=> b!58705 m!92469))

(declare-fun m!92471 () Bool)

(assert (=> b!58705 m!92471))

(declare-fun m!92473 () Bool)

(assert (=> b!58705 m!92473))

(declare-fun m!92475 () Bool)

(assert (=> start!11814 m!92475))

(declare-fun m!92477 () Bool)

(assert (=> start!11814 m!92477))

(declare-fun m!92479 () Bool)

(assert (=> b!58704 m!92479))

(declare-fun m!92481 () Bool)

(assert (=> b!58707 m!92481))

(declare-fun m!92483 () Bool)

(assert (=> b!58706 m!92483))

(declare-fun m!92485 () Bool)

(assert (=> b!58706 m!92485))

(declare-fun m!92487 () Bool)

(assert (=> b!58706 m!92487))

(declare-fun m!92489 () Bool)

(assert (=> b!58710 m!92489))

(declare-fun m!92491 () Bool)

(assert (=> b!58709 m!92491))

(declare-fun m!92493 () Bool)

(assert (=> b!58708 m!92493))

(declare-fun m!92495 () Bool)

(assert (=> b!58703 m!92495))

(declare-fun m!92497 () Bool)

(assert (=> b!58703 m!92497))

(declare-fun m!92499 () Bool)

(assert (=> b!58703 m!92499))

(declare-fun m!92501 () Bool)

(assert (=> b!58703 m!92501))

(declare-fun m!92503 () Bool)

(assert (=> b!58698 m!92503))

(declare-fun m!92505 () Bool)

(assert (=> b!58699 m!92505))

(assert (=> b!58699 m!92505))

(declare-fun m!92507 () Bool)

(assert (=> b!58699 m!92507))

(declare-fun m!92509 () Bool)

(assert (=> b!58699 m!92509))

(assert (=> b!58699 m!92509))

(declare-fun m!92511 () Bool)

(assert (=> b!58699 m!92511))

(push 1)

(assert (not b!58702))

(assert (not b!58703))

(assert (not b!58704))

(assert (not b!58706))

(assert (not b!58698))

(assert (not b!58699))

(assert (not b!58707))

(assert (not b!58708))

(assert (not b!58709))

(assert (not b!58711))

(assert (not start!11814))

(assert (not b!58705))

(assert (not b!58710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

