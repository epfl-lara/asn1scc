; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10016 () Bool)

(assert start!10016)

(declare-fun b!50634 () Bool)

(declare-fun res!42405 () Bool)

(declare-fun e!33460 () Bool)

(assert (=> b!50634 (=> res!42405 e!33460)))

(declare-datatypes ((List!561 0))(
  ( (Nil!558) (Cons!557 (h!676 Bool) (t!1311 List!561)) )
))
(declare-fun lt!78483 () List!561)

(declare-fun lt!78465 () Bool)

(declare-fun head!380 (List!561) Bool)

(assert (=> b!50634 (= res!42405 (not (= (head!380 lt!78483) lt!78465)))))

(declare-fun b!50635 () Bool)

(declare-fun res!42410 () Bool)

(declare-fun e!33461 () Bool)

(assert (=> b!50635 (=> res!42410 e!33461)))

(declare-datatypes ((array!2338 0))(
  ( (array!2339 (arr!1592 (Array (_ BitVec 32) (_ BitVec 8))) (size!1063 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1840 0))(
  ( (BitStream!1841 (buf!1418 array!2338) (currentByte!2941 (_ BitVec 32)) (currentBit!2936 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1840)

(declare-datatypes ((Unit!3501 0))(
  ( (Unit!3502) )
))
(declare-datatypes ((tuple2!4668 0))(
  ( (tuple2!4669 (_1!2439 Unit!3501) (_2!2439 BitStream!1840)) )
))
(declare-fun lt!78468 () tuple2!4668)

(assert (=> b!50635 (= res!42410 (not (= (size!1063 (buf!1418 thiss!1379)) (size!1063 (buf!1418 (_2!2439 lt!78468))))))))

(declare-fun b!50636 () Bool)

(declare-fun res!42397 () Bool)

(assert (=> b!50636 (=> res!42397 e!33461)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50636 (= res!42397 (not (invariant!0 (currentBit!2936 (_2!2439 lt!78468)) (currentByte!2941 (_2!2439 lt!78468)) (size!1063 (buf!1418 (_2!2439 lt!78468))))))))

(declare-fun b!50637 () Bool)

(declare-fun e!33455 () Bool)

(declare-fun e!33464 () Bool)

(assert (=> b!50637 (= e!33455 e!33464)))

(declare-fun res!42413 () Bool)

(assert (=> b!50637 (=> res!42413 e!33464)))

(declare-fun lt!78479 () Bool)

(declare-fun lt!78464 () Bool)

(assert (=> b!50637 (= res!42413 (not (= lt!78479 lt!78464)))))

(declare-fun lt!78462 () tuple2!4668)

(declare-fun lt!78475 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2338 (_ BitVec 64)) Bool)

(assert (=> b!50637 (= lt!78479 (bitAt!0 (buf!1418 (_2!2439 lt!78462)) lt!78475))))

(declare-fun res!42414 () Bool)

(declare-fun e!33456 () Bool)

(assert (=> start!10016 (=> (not res!42414) (not e!33456))))

(declare-fun srcBuffer!2 () array!2338)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10016 (= res!42414 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1063 srcBuffer!2))))))))

(assert (=> start!10016 e!33456))

(assert (=> start!10016 true))

(declare-fun array_inv!973 (array!2338) Bool)

(assert (=> start!10016 (array_inv!973 srcBuffer!2)))

(declare-fun e!33457 () Bool)

(declare-fun inv!12 (BitStream!1840) Bool)

(assert (=> start!10016 (and (inv!12 thiss!1379) e!33457)))

(declare-fun b!50638 () Bool)

(declare-fun e!33462 () Bool)

(declare-fun e!33467 () Bool)

(assert (=> b!50638 (= e!33462 e!33467)))

(declare-fun res!42404 () Bool)

(assert (=> b!50638 (=> res!42404 e!33467)))

(declare-fun isPrefixOf!0 (BitStream!1840 BitStream!1840) Bool)

(assert (=> b!50638 (= res!42404 (not (isPrefixOf!0 (_2!2439 lt!78462) (_2!2439 lt!78468))))))

(assert (=> b!50638 (isPrefixOf!0 thiss!1379 (_2!2439 lt!78468))))

(declare-fun lt!78482 () Unit!3501)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1840 BitStream!1840 BitStream!1840) Unit!3501)

(assert (=> b!50638 (= lt!78482 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2439 lt!78462) (_2!2439 lt!78468)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1840 array!2338 (_ BitVec 64) (_ BitVec 64)) tuple2!4668)

(assert (=> b!50638 (= lt!78468 (appendBitsMSBFirstLoop!0 (_2!2439 lt!78462) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!33465 () Bool)

(assert (=> b!50638 e!33465))

(declare-fun res!42411 () Bool)

(assert (=> b!50638 (=> (not res!42411) (not e!33465))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50638 (= res!42411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1063 (buf!1418 (_2!2439 lt!78462)))) ((_ sign_extend 32) (currentByte!2941 thiss!1379)) ((_ sign_extend 32) (currentBit!2936 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78463 () Unit!3501)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1840 array!2338 (_ BitVec 64)) Unit!3501)

(assert (=> b!50638 (= lt!78463 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1418 (_2!2439 lt!78462)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4670 0))(
  ( (tuple2!4671 (_1!2440 BitStream!1840) (_2!2440 BitStream!1840)) )
))
(declare-fun lt!78466 () tuple2!4670)

(declare-fun reader!0 (BitStream!1840 BitStream!1840) tuple2!4670)

(assert (=> b!50638 (= lt!78466 (reader!0 thiss!1379 (_2!2439 lt!78462)))))

(declare-fun b!50639 () Bool)

(declare-fun res!42403 () Bool)

(declare-fun e!33458 () Bool)

(assert (=> b!50639 (=> res!42403 e!33458)))

(assert (=> b!50639 (= res!42403 (not (invariant!0 (currentBit!2936 (_2!2439 lt!78462)) (currentByte!2941 (_2!2439 lt!78462)) (size!1063 (buf!1418 (_2!2439 lt!78462))))))))

(declare-fun b!50640 () Bool)

(declare-fun e!33453 () Bool)

(assert (=> b!50640 (= e!33453 e!33462)))

(declare-fun res!42399 () Bool)

(assert (=> b!50640 (=> res!42399 e!33462)))

(assert (=> b!50640 (= res!42399 (not (isPrefixOf!0 thiss!1379 (_2!2439 lt!78462))))))

(declare-fun lt!78481 () (_ BitVec 64))

(assert (=> b!50640 (validate_offset_bits!1 ((_ sign_extend 32) (size!1063 (buf!1418 (_2!2439 lt!78462)))) ((_ sign_extend 32) (currentByte!2941 (_2!2439 lt!78462))) ((_ sign_extend 32) (currentBit!2936 (_2!2439 lt!78462))) lt!78481)))

(assert (=> b!50640 (= lt!78481 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78484 () Unit!3501)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1840 BitStream!1840 (_ BitVec 64) (_ BitVec 64)) Unit!3501)

(assert (=> b!50640 (= lt!78484 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2439 lt!78462) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1840 (_ BitVec 8) (_ BitVec 32)) tuple2!4668)

(assert (=> b!50640 (= lt!78462 (appendBitFromByte!0 thiss!1379 (select (arr!1592 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50641 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1840 array!2338 (_ BitVec 64) (_ BitVec 64)) List!561)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1840 BitStream!1840 (_ BitVec 64)) List!561)

(assert (=> b!50641 (= e!33465 (= (head!380 (byteArrayBitContentToList!0 (_2!2439 lt!78462) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!380 (bitStreamReadBitsIntoList!0 (_2!2439 lt!78462) (_1!2440 lt!78466) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50642 () Bool)

(declare-fun e!33459 () Bool)

(assert (=> b!50642 (= e!33458 e!33459)))

(declare-fun res!42407 () Bool)

(assert (=> b!50642 (=> res!42407 e!33459)))

(assert (=> b!50642 (= res!42407 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!78469 () tuple2!4670)

(declare-fun lt!78477 () List!561)

(assert (=> b!50642 (= lt!78477 (bitStreamReadBitsIntoList!0 (_2!2439 lt!78468) (_1!2440 lt!78469) lt!78481))))

(declare-fun lt!78467 () tuple2!4670)

(assert (=> b!50642 (= lt!78483 (bitStreamReadBitsIntoList!0 (_2!2439 lt!78468) (_1!2440 lt!78467) (bvsub to!314 i!635)))))

(assert (=> b!50642 (validate_offset_bits!1 ((_ sign_extend 32) (size!1063 (buf!1418 (_2!2439 lt!78468)))) ((_ sign_extend 32) (currentByte!2941 (_2!2439 lt!78462))) ((_ sign_extend 32) (currentBit!2936 (_2!2439 lt!78462))) lt!78481)))

(declare-fun lt!78461 () Unit!3501)

(assert (=> b!50642 (= lt!78461 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2439 lt!78462) (buf!1418 (_2!2439 lt!78468)) lt!78481))))

(assert (=> b!50642 (= lt!78469 (reader!0 (_2!2439 lt!78462) (_2!2439 lt!78468)))))

(assert (=> b!50642 (validate_offset_bits!1 ((_ sign_extend 32) (size!1063 (buf!1418 (_2!2439 lt!78468)))) ((_ sign_extend 32) (currentByte!2941 thiss!1379)) ((_ sign_extend 32) (currentBit!2936 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78478 () Unit!3501)

(assert (=> b!50642 (= lt!78478 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1418 (_2!2439 lt!78468)) (bvsub to!314 i!635)))))

(assert (=> b!50642 (= lt!78467 (reader!0 thiss!1379 (_2!2439 lt!78468)))))

(declare-fun b!50643 () Bool)

(declare-fun res!42396 () Bool)

(assert (=> b!50643 (=> res!42396 e!33458)))

(assert (=> b!50643 (= res!42396 (not (invariant!0 (currentBit!2936 (_2!2439 lt!78462)) (currentByte!2941 (_2!2439 lt!78462)) (size!1063 (buf!1418 (_2!2439 lt!78468))))))))

(declare-fun b!50644 () Bool)

(declare-fun res!42402 () Bool)

(assert (=> b!50644 (=> (not res!42402) (not e!33456))))

(assert (=> b!50644 (= res!42402 (validate_offset_bits!1 ((_ sign_extend 32) (size!1063 (buf!1418 thiss!1379))) ((_ sign_extend 32) (currentByte!2941 thiss!1379)) ((_ sign_extend 32) (currentBit!2936 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50645 () Bool)

(assert (=> b!50645 (= e!33456 (not e!33453))))

(declare-fun res!42398 () Bool)

(assert (=> b!50645 (=> res!42398 e!33453)))

(assert (=> b!50645 (= res!42398 (bvsge i!635 to!314))))

(assert (=> b!50645 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78474 () Unit!3501)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1840) Unit!3501)

(assert (=> b!50645 (= lt!78474 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50645 (= lt!78475 (bitIndex!0 (size!1063 (buf!1418 thiss!1379)) (currentByte!2941 thiss!1379) (currentBit!2936 thiss!1379)))))

(declare-fun b!50646 () Bool)

(declare-fun e!33466 () Bool)

(assert (=> b!50646 (= e!33466 e!33460)))

(declare-fun res!42406 () Bool)

(assert (=> b!50646 (=> res!42406 e!33460)))

(assert (=> b!50646 (= res!42406 (not (= lt!78465 (bitAt!0 (buf!1418 (_1!2440 lt!78469)) lt!78475))))))

(assert (=> b!50646 (= lt!78465 (bitAt!0 (buf!1418 (_1!2440 lt!78467)) lt!78475))))

(declare-fun b!50647 () Bool)

(assert (=> b!50647 (= e!33457 (array_inv!973 (buf!1418 thiss!1379)))))

(declare-fun b!50648 () Bool)

(assert (=> b!50648 (= e!33460 e!33455)))

(declare-fun res!42409 () Bool)

(assert (=> b!50648 (=> res!42409 e!33455)))

(assert (=> b!50648 (= res!42409 (not (= (head!380 (byteArrayBitContentToList!0 (_2!2439 lt!78468) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!78464)))))

(assert (=> b!50648 (= lt!78464 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!50649 () Bool)

(assert (=> b!50649 (= e!33461 e!33458)))

(declare-fun res!42400 () Bool)

(assert (=> b!50649 (=> res!42400 e!33458)))

(assert (=> b!50649 (= res!42400 (not (= (size!1063 (buf!1418 (_2!2439 lt!78462))) (size!1063 (buf!1418 (_2!2439 lt!78468))))))))

(declare-fun lt!78472 () (_ BitVec 64))

(declare-fun lt!78476 () (_ BitVec 64))

(assert (=> b!50649 (= lt!78476 (bvsub (bvsub (bvadd lt!78472 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50649 (= lt!78472 (bitIndex!0 (size!1063 (buf!1418 (_2!2439 lt!78462))) (currentByte!2941 (_2!2439 lt!78462)) (currentBit!2936 (_2!2439 lt!78462))))))

(assert (=> b!50649 (= (size!1063 (buf!1418 (_2!2439 lt!78468))) (size!1063 (buf!1418 thiss!1379)))))

(declare-fun b!50650 () Bool)

(assert (=> b!50650 (= e!33459 e!33466)))

(declare-fun res!42412 () Bool)

(assert (=> b!50650 (=> res!42412 e!33466)))

(declare-fun lt!78473 () List!561)

(assert (=> b!50650 (= res!42412 (not (= lt!78473 lt!78477)))))

(assert (=> b!50650 (= lt!78477 lt!78473)))

(declare-fun tail!247 (List!561) List!561)

(assert (=> b!50650 (= lt!78473 (tail!247 lt!78483))))

(declare-fun lt!78470 () Unit!3501)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1840 BitStream!1840 BitStream!1840 BitStream!1840 (_ BitVec 64) List!561) Unit!3501)

(assert (=> b!50650 (= lt!78470 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2439 lt!78468) (_2!2439 lt!78468) (_1!2440 lt!78467) (_1!2440 lt!78469) (bvsub to!314 i!635) lt!78483))))

(declare-fun b!50651 () Bool)

(declare-fun lt!78480 () Bool)

(assert (=> b!50651 (= e!33464 (= lt!78480 lt!78464))))

(assert (=> b!50651 (= lt!78479 lt!78480)))

(assert (=> b!50651 (= lt!78480 (bitAt!0 (buf!1418 (_2!2439 lt!78468)) lt!78475))))

(declare-fun lt!78471 () Unit!3501)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2338 array!2338 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3501)

(assert (=> b!50651 (= lt!78471 (arrayBitRangesEqImpliesEq!0 (buf!1418 (_2!2439 lt!78462)) (buf!1418 (_2!2439 lt!78468)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78475 lt!78472))))

(declare-fun b!50652 () Bool)

(declare-fun res!42408 () Bool)

(assert (=> b!50652 (=> res!42408 e!33459)))

(declare-fun length!256 (List!561) Int)

(assert (=> b!50652 (= res!42408 (<= (length!256 lt!78483) 0))))

(declare-fun b!50653 () Bool)

(assert (=> b!50653 (= e!33467 e!33461)))

(declare-fun res!42401 () Bool)

(assert (=> b!50653 (=> res!42401 e!33461)))

(assert (=> b!50653 (= res!42401 (not (= lt!78476 (bvsub (bvadd lt!78475 to!314) i!635))))))

(assert (=> b!50653 (= lt!78476 (bitIndex!0 (size!1063 (buf!1418 (_2!2439 lt!78468))) (currentByte!2941 (_2!2439 lt!78468)) (currentBit!2936 (_2!2439 lt!78468))))))

(assert (= (and start!10016 res!42414) b!50644))

(assert (= (and b!50644 res!42402) b!50645))

(assert (= (and b!50645 (not res!42398)) b!50640))

(assert (= (and b!50640 (not res!42399)) b!50638))

(assert (= (and b!50638 res!42411) b!50641))

(assert (= (and b!50638 (not res!42404)) b!50653))

(assert (= (and b!50653 (not res!42401)) b!50636))

(assert (= (and b!50636 (not res!42397)) b!50635))

(assert (= (and b!50635 (not res!42410)) b!50649))

(assert (= (and b!50649 (not res!42400)) b!50639))

(assert (= (and b!50639 (not res!42403)) b!50643))

(assert (= (and b!50643 (not res!42396)) b!50642))

(assert (= (and b!50642 (not res!42407)) b!50652))

(assert (= (and b!50652 (not res!42408)) b!50650))

(assert (= (and b!50650 (not res!42412)) b!50646))

(assert (= (and b!50646 (not res!42406)) b!50634))

(assert (= (and b!50634 (not res!42405)) b!50648))

(assert (= (and b!50648 (not res!42409)) b!50637))

(assert (= (and b!50637 (not res!42413)) b!50651))

(assert (= start!10016 b!50647))

(declare-fun m!79659 () Bool)

(assert (=> b!50639 m!79659))

(declare-fun m!79661 () Bool)

(assert (=> b!50653 m!79661))

(declare-fun m!79663 () Bool)

(assert (=> b!50652 m!79663))

(declare-fun m!79665 () Bool)

(assert (=> b!50646 m!79665))

(declare-fun m!79667 () Bool)

(assert (=> b!50646 m!79667))

(declare-fun m!79669 () Bool)

(assert (=> b!50650 m!79669))

(declare-fun m!79671 () Bool)

(assert (=> b!50650 m!79671))

(declare-fun m!79673 () Bool)

(assert (=> b!50647 m!79673))

(declare-fun m!79675 () Bool)

(assert (=> b!50638 m!79675))

(declare-fun m!79677 () Bool)

(assert (=> b!50638 m!79677))

(declare-fun m!79679 () Bool)

(assert (=> b!50638 m!79679))

(declare-fun m!79681 () Bool)

(assert (=> b!50638 m!79681))

(declare-fun m!79683 () Bool)

(assert (=> b!50638 m!79683))

(declare-fun m!79685 () Bool)

(assert (=> b!50638 m!79685))

(declare-fun m!79687 () Bool)

(assert (=> b!50638 m!79687))

(declare-fun m!79689 () Bool)

(assert (=> b!50649 m!79689))

(declare-fun m!79691 () Bool)

(assert (=> b!50641 m!79691))

(assert (=> b!50641 m!79691))

(declare-fun m!79693 () Bool)

(assert (=> b!50641 m!79693))

(declare-fun m!79695 () Bool)

(assert (=> b!50641 m!79695))

(assert (=> b!50641 m!79695))

(declare-fun m!79697 () Bool)

(assert (=> b!50641 m!79697))

(declare-fun m!79699 () Bool)

(assert (=> start!10016 m!79699))

(declare-fun m!79701 () Bool)

(assert (=> start!10016 m!79701))

(declare-fun m!79703 () Bool)

(assert (=> b!50645 m!79703))

(declare-fun m!79705 () Bool)

(assert (=> b!50645 m!79705))

(declare-fun m!79707 () Bool)

(assert (=> b!50645 m!79707))

(declare-fun m!79709 () Bool)

(assert (=> b!50651 m!79709))

(declare-fun m!79711 () Bool)

(assert (=> b!50651 m!79711))

(declare-fun m!79713 () Bool)

(assert (=> b!50644 m!79713))

(declare-fun m!79715 () Bool)

(assert (=> b!50648 m!79715))

(assert (=> b!50648 m!79715))

(declare-fun m!79717 () Bool)

(assert (=> b!50648 m!79717))

(declare-fun m!79719 () Bool)

(assert (=> b!50648 m!79719))

(declare-fun m!79721 () Bool)

(assert (=> b!50643 m!79721))

(declare-fun m!79723 () Bool)

(assert (=> b!50634 m!79723))

(declare-fun m!79725 () Bool)

(assert (=> b!50642 m!79725))

(declare-fun m!79727 () Bool)

(assert (=> b!50642 m!79727))

(declare-fun m!79729 () Bool)

(assert (=> b!50642 m!79729))

(declare-fun m!79731 () Bool)

(assert (=> b!50642 m!79731))

(declare-fun m!79733 () Bool)

(assert (=> b!50642 m!79733))

(declare-fun m!79735 () Bool)

(assert (=> b!50642 m!79735))

(declare-fun m!79737 () Bool)

(assert (=> b!50642 m!79737))

(declare-fun m!79739 () Bool)

(assert (=> b!50642 m!79739))

(declare-fun m!79741 () Bool)

(assert (=> b!50637 m!79741))

(declare-fun m!79743 () Bool)

(assert (=> b!50640 m!79743))

(declare-fun m!79745 () Bool)

(assert (=> b!50640 m!79745))

(declare-fun m!79747 () Bool)

(assert (=> b!50640 m!79747))

(declare-fun m!79749 () Bool)

(assert (=> b!50640 m!79749))

(assert (=> b!50640 m!79745))

(declare-fun m!79751 () Bool)

(assert (=> b!50640 m!79751))

(declare-fun m!79753 () Bool)

(assert (=> b!50636 m!79753))

(push 1)

(assert (not b!50653))

(assert (not b!50645))

(assert (not b!50650))

(assert (not b!50636))

(assert (not b!50634))

(assert (not b!50637))

(assert (not b!50649))

(assert (not b!50647))

(assert (not b!50646))

(assert (not b!50640))

(assert (not b!50648))

(assert (not b!50638))

(assert (not b!50651))

(assert (not start!10016))

(assert (not b!50652))

(assert (not b!50642))

(assert (not b!50641))

(assert (not b!50643))

(assert (not b!50639))

(assert (not b!50644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

