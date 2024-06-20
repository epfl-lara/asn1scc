; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5842 () Bool)

(assert start!5842)

(declare-fun b!25671 () Bool)

(declare-fun res!22160 () Bool)

(declare-fun e!17519 () Bool)

(assert (=> b!25671 (=> (not res!22160) (not e!17519))))

(declare-datatypes ((array!1672 0))(
  ( (array!1673 (arr!1179 (Array (_ BitVec 32) (_ BitVec 8))) (size!720 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1272 0))(
  ( (BitStream!1273 (buf!1044 array!1672) (currentByte!2363 (_ BitVec 32)) (currentBit!2358 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1272)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25671 (= res!22160 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 thiss!1379))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!22162 () Bool)

(assert (=> start!5842 (=> (not res!22162) (not e!17519))))

(declare-fun srcBuffer!2 () array!1672)

(assert (=> start!5842 (= res!22162 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!720 srcBuffer!2))))))))

(assert (=> start!5842 e!17519))

(assert (=> start!5842 true))

(declare-fun array_inv!689 (array!1672) Bool)

(assert (=> start!5842 (array_inv!689 srcBuffer!2)))

(declare-fun e!17517 () Bool)

(declare-fun inv!12 (BitStream!1272) Bool)

(assert (=> start!5842 (and (inv!12 thiss!1379) e!17517)))

(declare-fun b!25672 () Bool)

(declare-fun res!22157 () Bool)

(declare-fun e!17514 () Bool)

(assert (=> b!25672 (=> res!22157 e!17514)))

(declare-datatypes ((Unit!2113 0))(
  ( (Unit!2114) )
))
(declare-datatypes ((tuple2!2886 0))(
  ( (tuple2!2887 (_1!1530 Unit!2113) (_2!1530 BitStream!1272)) )
))
(declare-fun lt!36764 () tuple2!2886)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!25672 (= res!22157 (not (invariant!0 (currentBit!2358 (_2!1530 lt!36764)) (currentByte!2363 (_2!1530 lt!36764)) (size!720 (buf!1044 (_2!1530 lt!36764))))))))

(declare-fun b!25673 () Bool)

(declare-fun e!17521 () Bool)

(declare-fun e!17513 () Bool)

(assert (=> b!25673 (= e!17521 e!17513)))

(declare-fun res!22167 () Bool)

(assert (=> b!25673 (=> res!22167 e!17513)))

(declare-fun lt!36761 () (_ BitVec 64))

(declare-fun lt!36768 () (_ BitVec 64))

(assert (=> b!25673 (= res!22167 (not (= lt!36768 (bvsub (bvadd lt!36761 to!314) i!635))))))

(declare-fun lt!36757 () tuple2!2886)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!25673 (= lt!36768 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36757))) (currentByte!2363 (_2!1530 lt!36757)) (currentBit!2358 (_2!1530 lt!36757))))))

(declare-fun b!25674 () Bool)

(assert (=> b!25674 (= e!17517 (array_inv!689 (buf!1044 thiss!1379)))))

(declare-fun b!25675 () Bool)

(declare-fun e!17518 () Bool)

(assert (=> b!25675 (= e!17519 (not e!17518))))

(declare-fun res!22155 () Bool)

(assert (=> b!25675 (=> res!22155 e!17518)))

(assert (=> b!25675 (= res!22155 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1272 BitStream!1272) Bool)

(assert (=> b!25675 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!36763 () Unit!2113)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1272) Unit!2113)

(assert (=> b!25675 (= lt!36763 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!25675 (= lt!36761 (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)))))

(declare-fun b!25676 () Bool)

(declare-fun res!22159 () Bool)

(assert (=> b!25676 (=> res!22159 e!17513)))

(assert (=> b!25676 (= res!22159 (not (= (size!720 (buf!1044 thiss!1379)) (size!720 (buf!1044 (_2!1530 lt!36757))))))))

(declare-fun e!17516 () Bool)

(declare-fun b!25677 () Bool)

(assert (=> b!25677 (= e!17516 (= lt!36768 (bvsub (bvsub (bvadd (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25678 () Bool)

(declare-datatypes ((tuple2!2888 0))(
  ( (tuple2!2889 (_1!1531 BitStream!1272) (_2!1531 BitStream!1272)) )
))
(declare-fun lt!36759 () tuple2!2888)

(declare-fun e!17511 () Bool)

(declare-datatypes ((List!337 0))(
  ( (Nil!334) (Cons!333 (h!452 Bool) (t!1087 List!337)) )
))
(declare-fun head!174 (List!337) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1272 array!1672 (_ BitVec 64) (_ BitVec 64)) List!337)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1272 BitStream!1272 (_ BitVec 64)) List!337)

(assert (=> b!25678 (= e!17511 (= (head!174 (byteArrayBitContentToList!0 (_2!1530 lt!36764) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!174 (bitStreamReadBitsIntoList!0 (_2!1530 lt!36764) (_1!1531 lt!36759) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!25679 () Bool)

(declare-fun res!22164 () Bool)

(assert (=> b!25679 (=> res!22164 e!17514)))

(assert (=> b!25679 (= res!22164 (not (invariant!0 (currentBit!2358 (_2!1530 lt!36764)) (currentByte!2363 (_2!1530 lt!36764)) (size!720 (buf!1044 (_2!1530 lt!36757))))))))

(declare-fun b!25680 () Bool)

(declare-fun e!17515 () Bool)

(assert (=> b!25680 (= e!17515 e!17521)))

(declare-fun res!22161 () Bool)

(assert (=> b!25680 (=> res!22161 e!17521)))

(assert (=> b!25680 (= res!22161 (not (isPrefixOf!0 (_2!1530 lt!36764) (_2!1530 lt!36757))))))

(assert (=> b!25680 (isPrefixOf!0 thiss!1379 (_2!1530 lt!36757))))

(declare-fun lt!36767 () Unit!2113)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1272 BitStream!1272 BitStream!1272) Unit!2113)

(assert (=> b!25680 (= lt!36767 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1530 lt!36764) (_2!1530 lt!36757)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1272 array!1672 (_ BitVec 64) (_ BitVec 64)) tuple2!2886)

(assert (=> b!25680 (= lt!36757 (appendBitsMSBFirstLoop!0 (_2!1530 lt!36764) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!25680 e!17511))

(declare-fun res!22156 () Bool)

(assert (=> b!25680 (=> (not res!22156) (not e!17511))))

(assert (=> b!25680 (= res!22156 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36760 () Unit!2113)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1272 array!1672 (_ BitVec 64)) Unit!2113)

(assert (=> b!25680 (= lt!36760 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1044 (_2!1530 lt!36764)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1272 BitStream!1272) tuple2!2888)

(assert (=> b!25680 (= lt!36759 (reader!0 thiss!1379 (_2!1530 lt!36764)))))

(declare-fun b!25681 () Bool)

(assert (=> b!25681 (= e!17513 e!17514)))

(declare-fun res!22163 () Bool)

(assert (=> b!25681 (=> res!22163 e!17514)))

(assert (=> b!25681 (= res!22163 (not (= (size!720 (buf!1044 (_2!1530 lt!36764))) (size!720 (buf!1044 (_2!1530 lt!36757))))))))

(assert (=> b!25681 e!17516))

(declare-fun res!22158 () Bool)

(assert (=> b!25681 (=> (not res!22158) (not e!17516))))

(assert (=> b!25681 (= res!22158 (= (size!720 (buf!1044 (_2!1530 lt!36757))) (size!720 (buf!1044 thiss!1379))))))

(declare-fun b!25682 () Bool)

(declare-fun res!22166 () Bool)

(assert (=> b!25682 (=> res!22166 e!17513)))

(assert (=> b!25682 (= res!22166 (not (invariant!0 (currentBit!2358 (_2!1530 lt!36757)) (currentByte!2363 (_2!1530 lt!36757)) (size!720 (buf!1044 (_2!1530 lt!36757))))))))

(declare-fun b!25683 () Bool)

(declare-fun lt!36756 () tuple2!2888)

(declare-fun lt!36765 () (_ BitVec 64))

(assert (=> b!25683 (= e!17514 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_1!1531 lt!36756)))) ((_ sign_extend 32) (currentByte!2363 (_1!1531 lt!36756))) ((_ sign_extend 32) (currentBit!2358 (_1!1531 lt!36756))) lt!36765))))

(declare-fun lt!36758 () tuple2!2888)

(declare-fun lt!36762 () List!337)

(assert (=> b!25683 (= lt!36762 (bitStreamReadBitsIntoList!0 (_2!1530 lt!36757) (_1!1531 lt!36758) (bvsub to!314 i!635)))))

(assert (=> b!25683 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) lt!36765)))

(declare-fun lt!36755 () Unit!2113)

(assert (=> b!25683 (= lt!36755 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1530 lt!36764) (buf!1044 (_2!1530 lt!36757)) lt!36765))))

(assert (=> b!25683 (= lt!36756 (reader!0 (_2!1530 lt!36764) (_2!1530 lt!36757)))))

(assert (=> b!25683 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!36769 () Unit!2113)

(assert (=> b!25683 (= lt!36769 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1044 (_2!1530 lt!36757)) (bvsub to!314 i!635)))))

(assert (=> b!25683 (= lt!36758 (reader!0 thiss!1379 (_2!1530 lt!36757)))))

(declare-fun b!25684 () Bool)

(assert (=> b!25684 (= e!17518 e!17515)))

(declare-fun res!22165 () Bool)

(assert (=> b!25684 (=> res!22165 e!17515)))

(assert (=> b!25684 (= res!22165 (not (isPrefixOf!0 thiss!1379 (_2!1530 lt!36764))))))

(assert (=> b!25684 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) lt!36765)))

(assert (=> b!25684 (= lt!36765 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36766 () Unit!2113)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1272 BitStream!1272 (_ BitVec 64) (_ BitVec 64)) Unit!2113)

(assert (=> b!25684 (= lt!36766 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1530 lt!36764) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1272 (_ BitVec 8) (_ BitVec 32)) tuple2!2886)

(assert (=> b!25684 (= lt!36764 (appendBitFromByte!0 thiss!1379 (select (arr!1179 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5842 res!22162) b!25671))

(assert (= (and b!25671 res!22160) b!25675))

(assert (= (and b!25675 (not res!22155)) b!25684))

(assert (= (and b!25684 (not res!22165)) b!25680))

(assert (= (and b!25680 res!22156) b!25678))

(assert (= (and b!25680 (not res!22161)) b!25673))

(assert (= (and b!25673 (not res!22167)) b!25682))

(assert (= (and b!25682 (not res!22166)) b!25676))

(assert (= (and b!25676 (not res!22159)) b!25681))

(assert (= (and b!25681 res!22158) b!25677))

(assert (= (and b!25681 (not res!22163)) b!25672))

(assert (= (and b!25672 (not res!22157)) b!25679))

(assert (= (and b!25679 (not res!22164)) b!25683))

(assert (= start!5842 b!25674))

(declare-fun m!36633 () Bool)

(assert (=> b!25673 m!36633))

(declare-fun m!36635 () Bool)

(assert (=> b!25683 m!36635))

(declare-fun m!36637 () Bool)

(assert (=> b!25683 m!36637))

(declare-fun m!36639 () Bool)

(assert (=> b!25683 m!36639))

(declare-fun m!36641 () Bool)

(assert (=> b!25683 m!36641))

(declare-fun m!36643 () Bool)

(assert (=> b!25683 m!36643))

(declare-fun m!36645 () Bool)

(assert (=> b!25683 m!36645))

(declare-fun m!36647 () Bool)

(assert (=> b!25683 m!36647))

(declare-fun m!36649 () Bool)

(assert (=> b!25683 m!36649))

(declare-fun m!36651 () Bool)

(assert (=> b!25679 m!36651))

(declare-fun m!36653 () Bool)

(assert (=> b!25672 m!36653))

(declare-fun m!36655 () Bool)

(assert (=> b!25671 m!36655))

(declare-fun m!36657 () Bool)

(assert (=> b!25682 m!36657))

(declare-fun m!36659 () Bool)

(assert (=> b!25684 m!36659))

(declare-fun m!36661 () Bool)

(assert (=> b!25684 m!36661))

(declare-fun m!36663 () Bool)

(assert (=> b!25684 m!36663))

(declare-fun m!36665 () Bool)

(assert (=> b!25684 m!36665))

(assert (=> b!25684 m!36663))

(declare-fun m!36667 () Bool)

(assert (=> b!25684 m!36667))

(declare-fun m!36669 () Bool)

(assert (=> b!25677 m!36669))

(declare-fun m!36671 () Bool)

(assert (=> b!25678 m!36671))

(assert (=> b!25678 m!36671))

(declare-fun m!36673 () Bool)

(assert (=> b!25678 m!36673))

(declare-fun m!36675 () Bool)

(assert (=> b!25678 m!36675))

(assert (=> b!25678 m!36675))

(declare-fun m!36677 () Bool)

(assert (=> b!25678 m!36677))

(declare-fun m!36679 () Bool)

(assert (=> start!5842 m!36679))

(declare-fun m!36681 () Bool)

(assert (=> start!5842 m!36681))

(declare-fun m!36683 () Bool)

(assert (=> b!25675 m!36683))

(declare-fun m!36685 () Bool)

(assert (=> b!25675 m!36685))

(declare-fun m!36687 () Bool)

(assert (=> b!25675 m!36687))

(declare-fun m!36689 () Bool)

(assert (=> b!25680 m!36689))

(declare-fun m!36691 () Bool)

(assert (=> b!25680 m!36691))

(declare-fun m!36693 () Bool)

(assert (=> b!25680 m!36693))

(declare-fun m!36695 () Bool)

(assert (=> b!25680 m!36695))

(declare-fun m!36697 () Bool)

(assert (=> b!25680 m!36697))

(declare-fun m!36699 () Bool)

(assert (=> b!25680 m!36699))

(declare-fun m!36701 () Bool)

(assert (=> b!25680 m!36701))

(declare-fun m!36703 () Bool)

(assert (=> b!25674 m!36703))

(check-sat (not b!25675) (not b!25682) (not b!25679) (not b!25672) (not b!25671) (not b!25673) (not b!25680) (not b!25674) (not b!25683) (not b!25677) (not b!25684) (not start!5842) (not b!25678))
(check-sat)
(get-model)

(declare-fun d!7644 () Bool)

(assert (=> d!7644 (= (invariant!0 (currentBit!2358 (_2!1530 lt!36757)) (currentByte!2363 (_2!1530 lt!36757)) (size!720 (buf!1044 (_2!1530 lt!36757)))) (and (bvsge (currentBit!2358 (_2!1530 lt!36757)) #b00000000000000000000000000000000) (bvslt (currentBit!2358 (_2!1530 lt!36757)) #b00000000000000000000000000001000) (bvsge (currentByte!2363 (_2!1530 lt!36757)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2363 (_2!1530 lt!36757)) (size!720 (buf!1044 (_2!1530 lt!36757)))) (and (= (currentBit!2358 (_2!1530 lt!36757)) #b00000000000000000000000000000000) (= (currentByte!2363 (_2!1530 lt!36757)) (size!720 (buf!1044 (_2!1530 lt!36757))))))))))

(assert (=> b!25682 d!7644))

(declare-fun d!7646 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7646 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 thiss!1379))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!720 (buf!1044 thiss!1379))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2210 () Bool)

(assert (= bs!2210 d!7646))

(declare-fun m!36777 () Bool)

(assert (=> bs!2210 m!36777))

(assert (=> b!25671 d!7646))

(declare-fun d!7648 () Bool)

(assert (=> d!7648 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) lt!36765) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764)))) lt!36765))))

(declare-fun bs!2211 () Bool)

(assert (= bs!2211 d!7648))

(declare-fun m!36779 () Bool)

(assert (=> bs!2211 m!36779))

(assert (=> b!25683 d!7648))

(declare-fun b!25737 () Bool)

(declare-fun e!17560 () Unit!2113)

(declare-fun Unit!2117 () Unit!2113)

(assert (=> b!25737 (= e!17560 Unit!2117)))

(declare-fun lt!36866 () tuple2!2888)

(declare-fun lt!36860 () (_ BitVec 64))

(declare-fun b!25738 () Bool)

(declare-fun lt!36871 () (_ BitVec 64))

(declare-fun e!17559 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1272 (_ BitVec 64)) BitStream!1272)

(assert (=> b!25738 (= e!17559 (= (_1!1531 lt!36866) (withMovedBitIndex!0 (_2!1531 lt!36866) (bvsub lt!36860 lt!36871))))))

(assert (=> b!25738 (or (= (bvand lt!36860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36871 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36860 lt!36871) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25738 (= lt!36871 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36757))) (currentByte!2363 (_2!1530 lt!36757)) (currentBit!2358 (_2!1530 lt!36757))))))

(assert (=> b!25738 (= lt!36860 (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)))))

(declare-fun b!25739 () Bool)

(declare-fun lt!36856 () Unit!2113)

(assert (=> b!25739 (= e!17560 lt!36856)))

(declare-fun lt!36865 () (_ BitVec 64))

(assert (=> b!25739 (= lt!36865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!36857 () (_ BitVec 64))

(assert (=> b!25739 (= lt!36857 (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1672 array!1672 (_ BitVec 64) (_ BitVec 64)) Unit!2113)

(assert (=> b!25739 (= lt!36856 (arrayBitRangesEqSymmetric!0 (buf!1044 thiss!1379) (buf!1044 (_2!1530 lt!36757)) lt!36865 lt!36857))))

(declare-fun arrayBitRangesEq!0 (array!1672 array!1672 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25739 (arrayBitRangesEq!0 (buf!1044 (_2!1530 lt!36757)) (buf!1044 thiss!1379) lt!36865 lt!36857)))

(declare-fun d!7650 () Bool)

(assert (=> d!7650 e!17559))

(declare-fun res!22214 () Bool)

(assert (=> d!7650 (=> (not res!22214) (not e!17559))))

(assert (=> d!7650 (= res!22214 (isPrefixOf!0 (_1!1531 lt!36866) (_2!1531 lt!36866)))))

(declare-fun lt!36862 () BitStream!1272)

(assert (=> d!7650 (= lt!36866 (tuple2!2889 lt!36862 (_2!1530 lt!36757)))))

(declare-fun lt!36861 () Unit!2113)

(declare-fun lt!36874 () Unit!2113)

(assert (=> d!7650 (= lt!36861 lt!36874)))

(assert (=> d!7650 (isPrefixOf!0 lt!36862 (_2!1530 lt!36757))))

(assert (=> d!7650 (= lt!36874 (lemmaIsPrefixTransitive!0 lt!36862 (_2!1530 lt!36757) (_2!1530 lt!36757)))))

(declare-fun lt!36869 () Unit!2113)

(declare-fun lt!36867 () Unit!2113)

(assert (=> d!7650 (= lt!36869 lt!36867)))

(assert (=> d!7650 (isPrefixOf!0 lt!36862 (_2!1530 lt!36757))))

(assert (=> d!7650 (= lt!36867 (lemmaIsPrefixTransitive!0 lt!36862 thiss!1379 (_2!1530 lt!36757)))))

(declare-fun lt!36858 () Unit!2113)

(assert (=> d!7650 (= lt!36858 e!17560)))

(declare-fun c!1722 () Bool)

(assert (=> d!7650 (= c!1722 (not (= (size!720 (buf!1044 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!36868 () Unit!2113)

(declare-fun lt!36859 () Unit!2113)

(assert (=> d!7650 (= lt!36868 lt!36859)))

(assert (=> d!7650 (isPrefixOf!0 (_2!1530 lt!36757) (_2!1530 lt!36757))))

(assert (=> d!7650 (= lt!36859 (lemmaIsPrefixRefl!0 (_2!1530 lt!36757)))))

(declare-fun lt!36855 () Unit!2113)

(declare-fun lt!36873 () Unit!2113)

(assert (=> d!7650 (= lt!36855 lt!36873)))

(assert (=> d!7650 (= lt!36873 (lemmaIsPrefixRefl!0 (_2!1530 lt!36757)))))

(declare-fun lt!36872 () Unit!2113)

(declare-fun lt!36870 () Unit!2113)

(assert (=> d!7650 (= lt!36872 lt!36870)))

(assert (=> d!7650 (isPrefixOf!0 lt!36862 lt!36862)))

(assert (=> d!7650 (= lt!36870 (lemmaIsPrefixRefl!0 lt!36862))))

(declare-fun lt!36863 () Unit!2113)

(declare-fun lt!36864 () Unit!2113)

(assert (=> d!7650 (= lt!36863 lt!36864)))

(assert (=> d!7650 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7650 (= lt!36864 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7650 (= lt!36862 (BitStream!1273 (buf!1044 (_2!1530 lt!36757)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)))))

(assert (=> d!7650 (isPrefixOf!0 thiss!1379 (_2!1530 lt!36757))))

(assert (=> d!7650 (= (reader!0 thiss!1379 (_2!1530 lt!36757)) lt!36866)))

(declare-fun b!25740 () Bool)

(declare-fun res!22213 () Bool)

(assert (=> b!25740 (=> (not res!22213) (not e!17559))))

(assert (=> b!25740 (= res!22213 (isPrefixOf!0 (_2!1531 lt!36866) (_2!1530 lt!36757)))))

(declare-fun b!25741 () Bool)

(declare-fun res!22215 () Bool)

(assert (=> b!25741 (=> (not res!22215) (not e!17559))))

(assert (=> b!25741 (= res!22215 (isPrefixOf!0 (_1!1531 lt!36866) thiss!1379))))

(assert (= (and d!7650 c!1722) b!25739))

(assert (= (and d!7650 (not c!1722)) b!25737))

(assert (= (and d!7650 res!22214) b!25741))

(assert (= (and b!25741 res!22215) b!25740))

(assert (= (and b!25740 res!22213) b!25738))

(declare-fun m!36781 () Bool)

(assert (=> b!25738 m!36781))

(assert (=> b!25738 m!36633))

(assert (=> b!25738 m!36687))

(declare-fun m!36783 () Bool)

(assert (=> d!7650 m!36783))

(assert (=> d!7650 m!36685))

(declare-fun m!36785 () Bool)

(assert (=> d!7650 m!36785))

(declare-fun m!36787 () Bool)

(assert (=> d!7650 m!36787))

(declare-fun m!36789 () Bool)

(assert (=> d!7650 m!36789))

(declare-fun m!36791 () Bool)

(assert (=> d!7650 m!36791))

(declare-fun m!36793 () Bool)

(assert (=> d!7650 m!36793))

(declare-fun m!36795 () Bool)

(assert (=> d!7650 m!36795))

(declare-fun m!36797 () Bool)

(assert (=> d!7650 m!36797))

(assert (=> d!7650 m!36701))

(assert (=> d!7650 m!36683))

(declare-fun m!36799 () Bool)

(assert (=> b!25741 m!36799))

(assert (=> b!25739 m!36687))

(declare-fun m!36801 () Bool)

(assert (=> b!25739 m!36801))

(declare-fun m!36803 () Bool)

(assert (=> b!25739 m!36803))

(declare-fun m!36805 () Bool)

(assert (=> b!25740 m!36805))

(assert (=> b!25683 d!7650))

(declare-fun d!7652 () Bool)

(assert (=> d!7652 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_1!1531 lt!36756)))) ((_ sign_extend 32) (currentByte!2363 (_1!1531 lt!36756))) ((_ sign_extend 32) (currentBit!2358 (_1!1531 lt!36756))) lt!36765) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!720 (buf!1044 (_1!1531 lt!36756)))) ((_ sign_extend 32) (currentByte!2363 (_1!1531 lt!36756))) ((_ sign_extend 32) (currentBit!2358 (_1!1531 lt!36756)))) lt!36765))))

(declare-fun bs!2212 () Bool)

(assert (= bs!2212 d!7652))

(declare-fun m!36807 () Bool)

(assert (=> bs!2212 m!36807))

(assert (=> b!25683 d!7652))

(declare-fun d!7654 () Bool)

(assert (=> d!7654 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!36877 () Unit!2113)

(declare-fun choose!9 (BitStream!1272 array!1672 (_ BitVec 64) BitStream!1272) Unit!2113)

(assert (=> d!7654 (= lt!36877 (choose!9 thiss!1379 (buf!1044 (_2!1530 lt!36757)) (bvsub to!314 i!635) (BitStream!1273 (buf!1044 (_2!1530 lt!36757)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379))))))

(assert (=> d!7654 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1044 (_2!1530 lt!36757)) (bvsub to!314 i!635)) lt!36877)))

(declare-fun bs!2213 () Bool)

(assert (= bs!2213 d!7654))

(assert (=> bs!2213 m!36647))

(declare-fun m!36809 () Bool)

(assert (=> bs!2213 m!36809))

(assert (=> b!25683 d!7654))

(declare-fun b!25742 () Bool)

(declare-fun e!17562 () Unit!2113)

(declare-fun Unit!2118 () Unit!2113)

(assert (=> b!25742 (= e!17562 Unit!2118)))

(declare-fun e!17561 () Bool)

(declare-fun b!25743 () Bool)

(declare-fun lt!36883 () (_ BitVec 64))

(declare-fun lt!36894 () (_ BitVec 64))

(declare-fun lt!36889 () tuple2!2888)

(assert (=> b!25743 (= e!17561 (= (_1!1531 lt!36889) (withMovedBitIndex!0 (_2!1531 lt!36889) (bvsub lt!36883 lt!36894))))))

(assert (=> b!25743 (or (= (bvand lt!36883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36894 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36883 lt!36894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25743 (= lt!36894 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36757))) (currentByte!2363 (_2!1530 lt!36757)) (currentBit!2358 (_2!1530 lt!36757))))))

(assert (=> b!25743 (= lt!36883 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))))))

(declare-fun b!25744 () Bool)

(declare-fun lt!36879 () Unit!2113)

(assert (=> b!25744 (= e!17562 lt!36879)))

(declare-fun lt!36888 () (_ BitVec 64))

(assert (=> b!25744 (= lt!36888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!36880 () (_ BitVec 64))

(assert (=> b!25744 (= lt!36880 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))))))

(assert (=> b!25744 (= lt!36879 (arrayBitRangesEqSymmetric!0 (buf!1044 (_2!1530 lt!36764)) (buf!1044 (_2!1530 lt!36757)) lt!36888 lt!36880))))

(assert (=> b!25744 (arrayBitRangesEq!0 (buf!1044 (_2!1530 lt!36757)) (buf!1044 (_2!1530 lt!36764)) lt!36888 lt!36880)))

(declare-fun d!7656 () Bool)

(assert (=> d!7656 e!17561))

(declare-fun res!22217 () Bool)

(assert (=> d!7656 (=> (not res!22217) (not e!17561))))

(assert (=> d!7656 (= res!22217 (isPrefixOf!0 (_1!1531 lt!36889) (_2!1531 lt!36889)))))

(declare-fun lt!36885 () BitStream!1272)

(assert (=> d!7656 (= lt!36889 (tuple2!2889 lt!36885 (_2!1530 lt!36757)))))

(declare-fun lt!36884 () Unit!2113)

(declare-fun lt!36897 () Unit!2113)

(assert (=> d!7656 (= lt!36884 lt!36897)))

(assert (=> d!7656 (isPrefixOf!0 lt!36885 (_2!1530 lt!36757))))

(assert (=> d!7656 (= lt!36897 (lemmaIsPrefixTransitive!0 lt!36885 (_2!1530 lt!36757) (_2!1530 lt!36757)))))

(declare-fun lt!36892 () Unit!2113)

(declare-fun lt!36890 () Unit!2113)

(assert (=> d!7656 (= lt!36892 lt!36890)))

(assert (=> d!7656 (isPrefixOf!0 lt!36885 (_2!1530 lt!36757))))

(assert (=> d!7656 (= lt!36890 (lemmaIsPrefixTransitive!0 lt!36885 (_2!1530 lt!36764) (_2!1530 lt!36757)))))

(declare-fun lt!36881 () Unit!2113)

(assert (=> d!7656 (= lt!36881 e!17562)))

(declare-fun c!1723 () Bool)

(assert (=> d!7656 (= c!1723 (not (= (size!720 (buf!1044 (_2!1530 lt!36764))) #b00000000000000000000000000000000)))))

(declare-fun lt!36891 () Unit!2113)

(declare-fun lt!36882 () Unit!2113)

(assert (=> d!7656 (= lt!36891 lt!36882)))

(assert (=> d!7656 (isPrefixOf!0 (_2!1530 lt!36757) (_2!1530 lt!36757))))

(assert (=> d!7656 (= lt!36882 (lemmaIsPrefixRefl!0 (_2!1530 lt!36757)))))

(declare-fun lt!36878 () Unit!2113)

(declare-fun lt!36896 () Unit!2113)

(assert (=> d!7656 (= lt!36878 lt!36896)))

(assert (=> d!7656 (= lt!36896 (lemmaIsPrefixRefl!0 (_2!1530 lt!36757)))))

(declare-fun lt!36895 () Unit!2113)

(declare-fun lt!36893 () Unit!2113)

(assert (=> d!7656 (= lt!36895 lt!36893)))

(assert (=> d!7656 (isPrefixOf!0 lt!36885 lt!36885)))

(assert (=> d!7656 (= lt!36893 (lemmaIsPrefixRefl!0 lt!36885))))

(declare-fun lt!36886 () Unit!2113)

(declare-fun lt!36887 () Unit!2113)

(assert (=> d!7656 (= lt!36886 lt!36887)))

(assert (=> d!7656 (isPrefixOf!0 (_2!1530 lt!36764) (_2!1530 lt!36764))))

(assert (=> d!7656 (= lt!36887 (lemmaIsPrefixRefl!0 (_2!1530 lt!36764)))))

(assert (=> d!7656 (= lt!36885 (BitStream!1273 (buf!1044 (_2!1530 lt!36757)) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))))))

(assert (=> d!7656 (isPrefixOf!0 (_2!1530 lt!36764) (_2!1530 lt!36757))))

(assert (=> d!7656 (= (reader!0 (_2!1530 lt!36764) (_2!1530 lt!36757)) lt!36889)))

(declare-fun b!25745 () Bool)

(declare-fun res!22216 () Bool)

(assert (=> b!25745 (=> (not res!22216) (not e!17561))))

(assert (=> b!25745 (= res!22216 (isPrefixOf!0 (_2!1531 lt!36889) (_2!1530 lt!36757)))))

(declare-fun b!25746 () Bool)

(declare-fun res!22218 () Bool)

(assert (=> b!25746 (=> (not res!22218) (not e!17561))))

(assert (=> b!25746 (= res!22218 (isPrefixOf!0 (_1!1531 lt!36889) (_2!1530 lt!36764)))))

(assert (= (and d!7656 c!1723) b!25744))

(assert (= (and d!7656 (not c!1723)) b!25742))

(assert (= (and d!7656 res!22217) b!25746))

(assert (= (and b!25746 res!22218) b!25745))

(assert (= (and b!25745 res!22216) b!25743))

(declare-fun m!36811 () Bool)

(assert (=> b!25743 m!36811))

(assert (=> b!25743 m!36633))

(assert (=> b!25743 m!36669))

(declare-fun m!36813 () Bool)

(assert (=> d!7656 m!36813))

(declare-fun m!36815 () Bool)

(assert (=> d!7656 m!36815))

(declare-fun m!36817 () Bool)

(assert (=> d!7656 m!36817))

(assert (=> d!7656 m!36787))

(declare-fun m!36819 () Bool)

(assert (=> d!7656 m!36819))

(assert (=> d!7656 m!36791))

(declare-fun m!36821 () Bool)

(assert (=> d!7656 m!36821))

(declare-fun m!36823 () Bool)

(assert (=> d!7656 m!36823))

(declare-fun m!36825 () Bool)

(assert (=> d!7656 m!36825))

(assert (=> d!7656 m!36689))

(declare-fun m!36827 () Bool)

(assert (=> d!7656 m!36827))

(declare-fun m!36829 () Bool)

(assert (=> b!25746 m!36829))

(assert (=> b!25744 m!36669))

(declare-fun m!36831 () Bool)

(assert (=> b!25744 m!36831))

(declare-fun m!36833 () Bool)

(assert (=> b!25744 m!36833))

(declare-fun m!36835 () Bool)

(assert (=> b!25745 m!36835))

(assert (=> b!25683 d!7656))

(declare-fun b!25755 () Bool)

(declare-datatypes ((tuple2!2894 0))(
  ( (tuple2!2895 (_1!1534 List!337) (_2!1534 BitStream!1272)) )
))
(declare-fun e!17568 () tuple2!2894)

(assert (=> b!25755 (= e!17568 (tuple2!2895 Nil!334 (_1!1531 lt!36758)))))

(declare-fun b!25757 () Bool)

(declare-fun e!17567 () Bool)

(declare-fun lt!36904 () List!337)

(declare-fun isEmpty!67 (List!337) Bool)

(assert (=> b!25757 (= e!17567 (isEmpty!67 lt!36904))))

(declare-fun d!7658 () Bool)

(assert (=> d!7658 e!17567))

(declare-fun c!1729 () Bool)

(assert (=> d!7658 (= c!1729 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7658 (= lt!36904 (_1!1534 e!17568))))

(declare-fun c!1728 () Bool)

(assert (=> d!7658 (= c!1728 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7658 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7658 (= (bitStreamReadBitsIntoList!0 (_2!1530 lt!36757) (_1!1531 lt!36758) (bvsub to!314 i!635)) lt!36904)))

(declare-fun b!25756 () Bool)

(declare-fun lt!36906 () (_ BitVec 64))

(declare-datatypes ((tuple2!2896 0))(
  ( (tuple2!2897 (_1!1535 Bool) (_2!1535 BitStream!1272)) )
))
(declare-fun lt!36905 () tuple2!2896)

(assert (=> b!25756 (= e!17568 (tuple2!2895 (Cons!333 (_1!1535 lt!36905) (bitStreamReadBitsIntoList!0 (_2!1530 lt!36757) (_2!1535 lt!36905) (bvsub (bvsub to!314 i!635) lt!36906))) (_2!1535 lt!36905)))))

(declare-fun readBit!0 (BitStream!1272) tuple2!2896)

(assert (=> b!25756 (= lt!36905 (readBit!0 (_1!1531 lt!36758)))))

(assert (=> b!25756 (= lt!36906 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!25758 () Bool)

(declare-fun length!62 (List!337) Int)

(assert (=> b!25758 (= e!17567 (> (length!62 lt!36904) 0))))

(assert (= (and d!7658 c!1728) b!25755))

(assert (= (and d!7658 (not c!1728)) b!25756))

(assert (= (and d!7658 c!1729) b!25757))

(assert (= (and d!7658 (not c!1729)) b!25758))

(declare-fun m!36837 () Bool)

(assert (=> b!25757 m!36837))

(declare-fun m!36839 () Bool)

(assert (=> b!25756 m!36839))

(declare-fun m!36841 () Bool)

(assert (=> b!25756 m!36841))

(declare-fun m!36843 () Bool)

(assert (=> b!25758 m!36843))

(assert (=> b!25683 d!7658))

(declare-fun d!7660 () Bool)

(assert (=> d!7660 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2214 () Bool)

(assert (= bs!2214 d!7660))

(declare-fun m!36845 () Bool)

(assert (=> bs!2214 m!36845))

(assert (=> b!25683 d!7660))

(declare-fun d!7662 () Bool)

(assert (=> d!7662 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) lt!36765)))

(declare-fun lt!36907 () Unit!2113)

(assert (=> d!7662 (= lt!36907 (choose!9 (_2!1530 lt!36764) (buf!1044 (_2!1530 lt!36757)) lt!36765 (BitStream!1273 (buf!1044 (_2!1530 lt!36757)) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764)))))))

(assert (=> d!7662 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1530 lt!36764) (buf!1044 (_2!1530 lt!36757)) lt!36765) lt!36907)))

(declare-fun bs!2215 () Bool)

(assert (= bs!2215 d!7662))

(assert (=> bs!2215 m!36635))

(declare-fun m!36847 () Bool)

(assert (=> bs!2215 m!36847))

(assert (=> b!25683 d!7662))

(declare-fun d!7664 () Bool)

(assert (=> d!7664 (= (invariant!0 (currentBit!2358 (_2!1530 lt!36764)) (currentByte!2363 (_2!1530 lt!36764)) (size!720 (buf!1044 (_2!1530 lt!36764)))) (and (bvsge (currentBit!2358 (_2!1530 lt!36764)) #b00000000000000000000000000000000) (bvslt (currentBit!2358 (_2!1530 lt!36764)) #b00000000000000000000000000001000) (bvsge (currentByte!2363 (_2!1530 lt!36764)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2363 (_2!1530 lt!36764)) (size!720 (buf!1044 (_2!1530 lt!36764)))) (and (= (currentBit!2358 (_2!1530 lt!36764)) #b00000000000000000000000000000000) (= (currentByte!2363 (_2!1530 lt!36764)) (size!720 (buf!1044 (_2!1530 lt!36764))))))))))

(assert (=> b!25672 d!7664))

(declare-fun d!7666 () Bool)

(assert (=> d!7666 (= (array_inv!689 (buf!1044 thiss!1379)) (bvsge (size!720 (buf!1044 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!25674 d!7666))

(declare-fun d!7668 () Bool)

(declare-fun res!22225 () Bool)

(declare-fun e!17574 () Bool)

(assert (=> d!7668 (=> (not res!22225) (not e!17574))))

(assert (=> d!7668 (= res!22225 (= (size!720 (buf!1044 thiss!1379)) (size!720 (buf!1044 (_2!1530 lt!36764)))))))

(assert (=> d!7668 (= (isPrefixOf!0 thiss!1379 (_2!1530 lt!36764)) e!17574)))

(declare-fun b!25765 () Bool)

(declare-fun res!22227 () Bool)

(assert (=> b!25765 (=> (not res!22227) (not e!17574))))

(assert (=> b!25765 (= res!22227 (bvsle (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)) (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764)))))))

(declare-fun b!25766 () Bool)

(declare-fun e!17573 () Bool)

(assert (=> b!25766 (= e!17574 e!17573)))

(declare-fun res!22226 () Bool)

(assert (=> b!25766 (=> res!22226 e!17573)))

(assert (=> b!25766 (= res!22226 (= (size!720 (buf!1044 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25767 () Bool)

(assert (=> b!25767 (= e!17573 (arrayBitRangesEq!0 (buf!1044 thiss!1379) (buf!1044 (_2!1530 lt!36764)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379))))))

(assert (= (and d!7668 res!22225) b!25765))

(assert (= (and b!25765 res!22227) b!25766))

(assert (= (and b!25766 (not res!22226)) b!25767))

(assert (=> b!25765 m!36687))

(assert (=> b!25765 m!36669))

(assert (=> b!25767 m!36687))

(assert (=> b!25767 m!36687))

(declare-fun m!36849 () Bool)

(assert (=> b!25767 m!36849))

(assert (=> b!25684 d!7668))

(declare-fun d!7670 () Bool)

(assert (=> d!7670 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) lt!36765) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764)))) lt!36765))))

(declare-fun bs!2216 () Bool)

(assert (= bs!2216 d!7670))

(declare-fun m!36851 () Bool)

(assert (=> bs!2216 m!36851))

(assert (=> b!25684 d!7670))

(declare-fun d!7672 () Bool)

(declare-fun e!17577 () Bool)

(assert (=> d!7672 e!17577))

(declare-fun res!22230 () Bool)

(assert (=> d!7672 (=> (not res!22230) (not e!17577))))

(assert (=> d!7672 (= res!22230 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!36910 () Unit!2113)

(declare-fun choose!27 (BitStream!1272 BitStream!1272 (_ BitVec 64) (_ BitVec 64)) Unit!2113)

(assert (=> d!7672 (= lt!36910 (choose!27 thiss!1379 (_2!1530 lt!36764) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7672 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7672 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1530 lt!36764) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!36910)))

(declare-fun b!25770 () Bool)

(assert (=> b!25770 (= e!17577 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7672 res!22230) b!25770))

(declare-fun m!36853 () Bool)

(assert (=> d!7672 m!36853))

(declare-fun m!36855 () Bool)

(assert (=> b!25770 m!36855))

(assert (=> b!25684 d!7672))

(declare-fun b!25788 () Bool)

(declare-fun e!17587 () Bool)

(declare-datatypes ((tuple2!2898 0))(
  ( (tuple2!2899 (_1!1536 BitStream!1272) (_2!1536 Bool)) )
))
(declare-fun lt!36935 () tuple2!2898)

(declare-fun lt!36941 () tuple2!2886)

(assert (=> b!25788 (= e!17587 (= (bitIndex!0 (size!720 (buf!1044 (_1!1536 lt!36935))) (currentByte!2363 (_1!1536 lt!36935)) (currentBit!2358 (_1!1536 lt!36935))) (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36941))) (currentByte!2363 (_2!1530 lt!36941)) (currentBit!2358 (_2!1530 lt!36941)))))))

(declare-fun b!25789 () Bool)

(declare-fun res!22254 () Bool)

(declare-fun e!17588 () Bool)

(assert (=> b!25789 (=> (not res!22254) (not e!17588))))

(declare-fun lt!36937 () tuple2!2886)

(assert (=> b!25789 (= res!22254 (= (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36937))) (currentByte!2363 (_2!1530 lt!36937)) (currentBit!2358 (_2!1530 lt!36937))) (bvadd (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25790 () Bool)

(declare-fun res!22250 () Bool)

(assert (=> b!25790 (=> (not res!22250) (not e!17588))))

(assert (=> b!25790 (= res!22250 (isPrefixOf!0 thiss!1379 (_2!1530 lt!36937)))))

(declare-fun b!25791 () Bool)

(declare-fun res!22251 () Bool)

(declare-fun e!17589 () Bool)

(assert (=> b!25791 (=> (not res!22251) (not e!17589))))

(declare-fun lt!36936 () (_ BitVec 64))

(declare-fun lt!36939 () (_ BitVec 64))

(assert (=> b!25791 (= res!22251 (= (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36941))) (currentByte!2363 (_2!1530 lt!36941)) (currentBit!2358 (_2!1530 lt!36941))) (bvadd lt!36939 lt!36936)))))

(assert (=> b!25791 (or (not (= (bvand lt!36939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36936 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!36939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!36939 lt!36936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25791 (= lt!36936 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!25791 (= lt!36939 (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)))))

(declare-fun b!25792 () Bool)

(assert (=> b!25792 (= e!17589 e!17587)))

(declare-fun res!22249 () Bool)

(assert (=> b!25792 (=> (not res!22249) (not e!17587))))

(declare-fun lt!36942 () (_ BitVec 8))

(assert (=> b!25792 (= res!22249 (and (= (_2!1536 lt!36935) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1179 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!36942)) #b00000000000000000000000000000000))) (= (_1!1536 lt!36935) (_2!1530 lt!36941))))))

(declare-datatypes ((tuple2!2900 0))(
  ( (tuple2!2901 (_1!1537 array!1672) (_2!1537 BitStream!1272)) )
))
(declare-fun lt!36943 () tuple2!2900)

(declare-fun lt!36940 () BitStream!1272)

(declare-fun readBits!0 (BitStream!1272 (_ BitVec 64)) tuple2!2900)

(assert (=> b!25792 (= lt!36943 (readBits!0 lt!36940 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1272) tuple2!2898)

(assert (=> b!25792 (= lt!36935 (readBitPure!0 lt!36940))))

(declare-fun readerFrom!0 (BitStream!1272 (_ BitVec 32) (_ BitVec 32)) BitStream!1272)

(assert (=> b!25792 (= lt!36940 (readerFrom!0 (_2!1530 lt!36941) (currentBit!2358 thiss!1379) (currentByte!2363 thiss!1379)))))

(declare-fun b!25793 () Bool)

(declare-fun e!17586 () Bool)

(declare-fun lt!36938 () tuple2!2898)

(assert (=> b!25793 (= e!17586 (= (bitIndex!0 (size!720 (buf!1044 (_1!1536 lt!36938))) (currentByte!2363 (_1!1536 lt!36938)) (currentBit!2358 (_1!1536 lt!36938))) (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36937))) (currentByte!2363 (_2!1530 lt!36937)) (currentBit!2358 (_2!1530 lt!36937)))))))

(declare-fun b!25794 () Bool)

(declare-fun res!22252 () Bool)

(assert (=> b!25794 (=> (not res!22252) (not e!17589))))

(assert (=> b!25794 (= res!22252 (isPrefixOf!0 thiss!1379 (_2!1530 lt!36941)))))

(declare-fun b!25795 () Bool)

(assert (=> b!25795 (= e!17588 e!17586)))

(declare-fun res!22247 () Bool)

(assert (=> b!25795 (=> (not res!22247) (not e!17586))))

(declare-fun lt!36944 () Bool)

(assert (=> b!25795 (= res!22247 (and (= (_2!1536 lt!36938) lt!36944) (= (_1!1536 lt!36938) (_2!1530 lt!36937))))))

(assert (=> b!25795 (= lt!36938 (readBitPure!0 (readerFrom!0 (_2!1530 lt!36937) (currentBit!2358 thiss!1379) (currentByte!2363 thiss!1379))))))

(declare-fun d!7674 () Bool)

(assert (=> d!7674 e!17589))

(declare-fun res!22253 () Bool)

(assert (=> d!7674 (=> (not res!22253) (not e!17589))))

(assert (=> d!7674 (= res!22253 (= (size!720 (buf!1044 (_2!1530 lt!36941))) (size!720 (buf!1044 thiss!1379))))))

(declare-fun lt!36946 () array!1672)

(assert (=> d!7674 (= lt!36942 (select (arr!1179 lt!36946) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7674 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!720 lt!36946)))))

(assert (=> d!7674 (= lt!36946 (array!1673 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!36945 () tuple2!2886)

(assert (=> d!7674 (= lt!36941 (tuple2!2887 (_1!1530 lt!36945) (_2!1530 lt!36945)))))

(assert (=> d!7674 (= lt!36945 lt!36937)))

(assert (=> d!7674 e!17588))

(declare-fun res!22248 () Bool)

(assert (=> d!7674 (=> (not res!22248) (not e!17588))))

(assert (=> d!7674 (= res!22248 (= (size!720 (buf!1044 thiss!1379)) (size!720 (buf!1044 (_2!1530 lt!36937)))))))

(declare-fun appendBit!0 (BitStream!1272 Bool) tuple2!2886)

(assert (=> d!7674 (= lt!36937 (appendBit!0 thiss!1379 lt!36944))))

(assert (=> d!7674 (= lt!36944 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1179 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7674 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7674 (= (appendBitFromByte!0 thiss!1379 (select (arr!1179 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!36941)))

(assert (= (and d!7674 res!22248) b!25789))

(assert (= (and b!25789 res!22254) b!25790))

(assert (= (and b!25790 res!22250) b!25795))

(assert (= (and b!25795 res!22247) b!25793))

(assert (= (and d!7674 res!22253) b!25791))

(assert (= (and b!25791 res!22251) b!25794))

(assert (= (and b!25794 res!22252) b!25792))

(assert (= (and b!25792 res!22249) b!25788))

(declare-fun m!36857 () Bool)

(assert (=> b!25792 m!36857))

(declare-fun m!36859 () Bool)

(assert (=> b!25792 m!36859))

(declare-fun m!36861 () Bool)

(assert (=> b!25792 m!36861))

(declare-fun m!36863 () Bool)

(assert (=> b!25791 m!36863))

(assert (=> b!25791 m!36687))

(declare-fun m!36865 () Bool)

(assert (=> b!25789 m!36865))

(assert (=> b!25789 m!36687))

(declare-fun m!36867 () Bool)

(assert (=> b!25788 m!36867))

(assert (=> b!25788 m!36863))

(declare-fun m!36869 () Bool)

(assert (=> d!7674 m!36869))

(declare-fun m!36871 () Bool)

(assert (=> d!7674 m!36871))

(declare-fun m!36873 () Bool)

(assert (=> d!7674 m!36873))

(declare-fun m!36875 () Bool)

(assert (=> b!25793 m!36875))

(assert (=> b!25793 m!36865))

(declare-fun m!36877 () Bool)

(assert (=> b!25790 m!36877))

(declare-fun m!36879 () Bool)

(assert (=> b!25795 m!36879))

(assert (=> b!25795 m!36879))

(declare-fun m!36881 () Bool)

(assert (=> b!25795 m!36881))

(declare-fun m!36883 () Bool)

(assert (=> b!25794 m!36883))

(assert (=> b!25684 d!7674))

(declare-fun d!7676 () Bool)

(declare-fun e!17592 () Bool)

(assert (=> d!7676 e!17592))

(declare-fun res!22260 () Bool)

(assert (=> d!7676 (=> (not res!22260) (not e!17592))))

(declare-fun lt!36959 () (_ BitVec 64))

(declare-fun lt!36960 () (_ BitVec 64))

(declare-fun lt!36961 () (_ BitVec 64))

(assert (=> d!7676 (= res!22260 (= lt!36961 (bvsub lt!36960 lt!36959)))))

(assert (=> d!7676 (or (= (bvand lt!36960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36959 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36960 lt!36959) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7676 (= lt!36959 (remainingBits!0 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36757))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36757)))))))

(declare-fun lt!36963 () (_ BitVec 64))

(declare-fun lt!36964 () (_ BitVec 64))

(assert (=> d!7676 (= lt!36960 (bvmul lt!36963 lt!36964))))

(assert (=> d!7676 (or (= lt!36963 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!36964 (bvsdiv (bvmul lt!36963 lt!36964) lt!36963)))))

(assert (=> d!7676 (= lt!36964 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7676 (= lt!36963 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))))))

(assert (=> d!7676 (= lt!36961 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36757))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36757)))))))

(assert (=> d!7676 (invariant!0 (currentBit!2358 (_2!1530 lt!36757)) (currentByte!2363 (_2!1530 lt!36757)) (size!720 (buf!1044 (_2!1530 lt!36757))))))

(assert (=> d!7676 (= (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36757))) (currentByte!2363 (_2!1530 lt!36757)) (currentBit!2358 (_2!1530 lt!36757))) lt!36961)))

(declare-fun b!25800 () Bool)

(declare-fun res!22259 () Bool)

(assert (=> b!25800 (=> (not res!22259) (not e!17592))))

(assert (=> b!25800 (= res!22259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!36961))))

(declare-fun b!25801 () Bool)

(declare-fun lt!36962 () (_ BitVec 64))

(assert (=> b!25801 (= e!17592 (bvsle lt!36961 (bvmul lt!36962 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25801 (or (= lt!36962 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!36962 #b0000000000000000000000000000000000000000000000000000000000001000) lt!36962)))))

(assert (=> b!25801 (= lt!36962 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36757)))))))

(assert (= (and d!7676 res!22260) b!25800))

(assert (= (and b!25800 res!22259) b!25801))

(declare-fun m!36885 () Bool)

(assert (=> d!7676 m!36885))

(assert (=> d!7676 m!36657))

(assert (=> b!25673 d!7676))

(declare-fun d!7678 () Bool)

(declare-fun res!22261 () Bool)

(declare-fun e!17594 () Bool)

(assert (=> d!7678 (=> (not res!22261) (not e!17594))))

(assert (=> d!7678 (= res!22261 (= (size!720 (buf!1044 thiss!1379)) (size!720 (buf!1044 thiss!1379))))))

(assert (=> d!7678 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!17594)))

(declare-fun b!25802 () Bool)

(declare-fun res!22263 () Bool)

(assert (=> b!25802 (=> (not res!22263) (not e!17594))))

(assert (=> b!25802 (= res!22263 (bvsle (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)) (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379))))))

(declare-fun b!25803 () Bool)

(declare-fun e!17593 () Bool)

(assert (=> b!25803 (= e!17594 e!17593)))

(declare-fun res!22262 () Bool)

(assert (=> b!25803 (=> res!22262 e!17593)))

(assert (=> b!25803 (= res!22262 (= (size!720 (buf!1044 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25804 () Bool)

(assert (=> b!25804 (= e!17593 (arrayBitRangesEq!0 (buf!1044 thiss!1379) (buf!1044 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379))))))

(assert (= (and d!7678 res!22261) b!25802))

(assert (= (and b!25802 res!22263) b!25803))

(assert (= (and b!25803 (not res!22262)) b!25804))

(assert (=> b!25802 m!36687))

(assert (=> b!25802 m!36687))

(assert (=> b!25804 m!36687))

(assert (=> b!25804 m!36687))

(declare-fun m!36887 () Bool)

(assert (=> b!25804 m!36887))

(assert (=> b!25675 d!7678))

(declare-fun d!7680 () Bool)

(assert (=> d!7680 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!36967 () Unit!2113)

(declare-fun choose!11 (BitStream!1272) Unit!2113)

(assert (=> d!7680 (= lt!36967 (choose!11 thiss!1379))))

(assert (=> d!7680 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!36967)))

(declare-fun bs!2218 () Bool)

(assert (= bs!2218 d!7680))

(assert (=> bs!2218 m!36683))

(declare-fun m!36889 () Bool)

(assert (=> bs!2218 m!36889))

(assert (=> b!25675 d!7680))

(declare-fun d!7682 () Bool)

(declare-fun e!17595 () Bool)

(assert (=> d!7682 e!17595))

(declare-fun res!22265 () Bool)

(assert (=> d!7682 (=> (not res!22265) (not e!17595))))

(declare-fun lt!36969 () (_ BitVec 64))

(declare-fun lt!36970 () (_ BitVec 64))

(declare-fun lt!36968 () (_ BitVec 64))

(assert (=> d!7682 (= res!22265 (= lt!36970 (bvsub lt!36969 lt!36968)))))

(assert (=> d!7682 (or (= (bvand lt!36969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36968 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36969 lt!36968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7682 (= lt!36968 (remainingBits!0 ((_ sign_extend 32) (size!720 (buf!1044 thiss!1379))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379))))))

(declare-fun lt!36972 () (_ BitVec 64))

(declare-fun lt!36973 () (_ BitVec 64))

(assert (=> d!7682 (= lt!36969 (bvmul lt!36972 lt!36973))))

(assert (=> d!7682 (or (= lt!36972 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!36973 (bvsdiv (bvmul lt!36972 lt!36973) lt!36972)))))

(assert (=> d!7682 (= lt!36973 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7682 (= lt!36972 ((_ sign_extend 32) (size!720 (buf!1044 thiss!1379))))))

(assert (=> d!7682 (= lt!36970 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2363 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2358 thiss!1379))))))

(assert (=> d!7682 (invariant!0 (currentBit!2358 thiss!1379) (currentByte!2363 thiss!1379) (size!720 (buf!1044 thiss!1379)))))

(assert (=> d!7682 (= (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)) lt!36970)))

(declare-fun b!25805 () Bool)

(declare-fun res!22264 () Bool)

(assert (=> b!25805 (=> (not res!22264) (not e!17595))))

(assert (=> b!25805 (= res!22264 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!36970))))

(declare-fun b!25806 () Bool)

(declare-fun lt!36971 () (_ BitVec 64))

(assert (=> b!25806 (= e!17595 (bvsle lt!36970 (bvmul lt!36971 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25806 (or (= lt!36971 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!36971 #b0000000000000000000000000000000000000000000000000000000000001000) lt!36971)))))

(assert (=> b!25806 (= lt!36971 ((_ sign_extend 32) (size!720 (buf!1044 thiss!1379))))))

(assert (= (and d!7682 res!22265) b!25805))

(assert (= (and b!25805 res!22264) b!25806))

(assert (=> d!7682 m!36777))

(declare-fun m!36891 () Bool)

(assert (=> d!7682 m!36891))

(assert (=> b!25675 d!7682))

(declare-fun d!7684 () Bool)

(assert (=> d!7684 (= (array_inv!689 srcBuffer!2) (bvsge (size!720 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5842 d!7684))

(declare-fun d!7686 () Bool)

(assert (=> d!7686 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2358 thiss!1379) (currentByte!2363 thiss!1379) (size!720 (buf!1044 thiss!1379))))))

(declare-fun bs!2219 () Bool)

(assert (= bs!2219 d!7686))

(assert (=> bs!2219 m!36891))

(assert (=> start!5842 d!7686))

(declare-fun d!7688 () Bool)

(assert (=> d!7688 (= (head!174 (byteArrayBitContentToList!0 (_2!1530 lt!36764) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!452 (byteArrayBitContentToList!0 (_2!1530 lt!36764) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25678 d!7688))

(declare-fun d!7690 () Bool)

(declare-fun c!1732 () Bool)

(assert (=> d!7690 (= c!1732 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!17598 () List!337)

(assert (=> d!7690 (= (byteArrayBitContentToList!0 (_2!1530 lt!36764) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!17598)))

(declare-fun b!25811 () Bool)

(assert (=> b!25811 (= e!17598 Nil!334)))

(declare-fun b!25812 () Bool)

(assert (=> b!25812 (= e!17598 (Cons!333 (not (= (bvand ((_ sign_extend 24) (select (arr!1179 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1530 lt!36764) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7690 c!1732) b!25811))

(assert (= (and d!7690 (not c!1732)) b!25812))

(assert (=> b!25812 m!36663))

(assert (=> b!25812 m!36873))

(declare-fun m!36893 () Bool)

(assert (=> b!25812 m!36893))

(assert (=> b!25678 d!7690))

(declare-fun d!7692 () Bool)

(assert (=> d!7692 (= (head!174 (bitStreamReadBitsIntoList!0 (_2!1530 lt!36764) (_1!1531 lt!36759) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!452 (bitStreamReadBitsIntoList!0 (_2!1530 lt!36764) (_1!1531 lt!36759) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25678 d!7692))

(declare-fun b!25813 () Bool)

(declare-fun e!17600 () tuple2!2894)

(assert (=> b!25813 (= e!17600 (tuple2!2895 Nil!334 (_1!1531 lt!36759)))))

(declare-fun b!25815 () Bool)

(declare-fun e!17599 () Bool)

(declare-fun lt!36974 () List!337)

(assert (=> b!25815 (= e!17599 (isEmpty!67 lt!36974))))

(declare-fun d!7694 () Bool)

(assert (=> d!7694 e!17599))

(declare-fun c!1734 () Bool)

(assert (=> d!7694 (= c!1734 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7694 (= lt!36974 (_1!1534 e!17600))))

(declare-fun c!1733 () Bool)

(assert (=> d!7694 (= c!1733 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7694 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7694 (= (bitStreamReadBitsIntoList!0 (_2!1530 lt!36764) (_1!1531 lt!36759) #b0000000000000000000000000000000000000000000000000000000000000001) lt!36974)))

(declare-fun lt!36976 () (_ BitVec 64))

(declare-fun lt!36975 () tuple2!2896)

(declare-fun b!25814 () Bool)

(assert (=> b!25814 (= e!17600 (tuple2!2895 (Cons!333 (_1!1535 lt!36975) (bitStreamReadBitsIntoList!0 (_2!1530 lt!36764) (_2!1535 lt!36975) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!36976))) (_2!1535 lt!36975)))))

(assert (=> b!25814 (= lt!36975 (readBit!0 (_1!1531 lt!36759)))))

(assert (=> b!25814 (= lt!36976 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!25816 () Bool)

(assert (=> b!25816 (= e!17599 (> (length!62 lt!36974) 0))))

(assert (= (and d!7694 c!1733) b!25813))

(assert (= (and d!7694 (not c!1733)) b!25814))

(assert (= (and d!7694 c!1734) b!25815))

(assert (= (and d!7694 (not c!1734)) b!25816))

(declare-fun m!36895 () Bool)

(assert (=> b!25815 m!36895))

(declare-fun m!36897 () Bool)

(assert (=> b!25814 m!36897))

(declare-fun m!36899 () Bool)

(assert (=> b!25814 m!36899))

(declare-fun m!36901 () Bool)

(assert (=> b!25816 m!36901))

(assert (=> b!25678 d!7694))

(declare-fun d!7696 () Bool)

(declare-fun e!17601 () Bool)

(assert (=> d!7696 e!17601))

(declare-fun res!22267 () Bool)

(assert (=> d!7696 (=> (not res!22267) (not e!17601))))

(declare-fun lt!36978 () (_ BitVec 64))

(declare-fun lt!36977 () (_ BitVec 64))

(declare-fun lt!36979 () (_ BitVec 64))

(assert (=> d!7696 (= res!22267 (= lt!36979 (bvsub lt!36978 lt!36977)))))

(assert (=> d!7696 (or (= (bvand lt!36978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36977 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36978 lt!36977) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7696 (= lt!36977 (remainingBits!0 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764)))))))

(declare-fun lt!36981 () (_ BitVec 64))

(declare-fun lt!36982 () (_ BitVec 64))

(assert (=> d!7696 (= lt!36978 (bvmul lt!36981 lt!36982))))

(assert (=> d!7696 (or (= lt!36981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!36982 (bvsdiv (bvmul lt!36981 lt!36982) lt!36981)))))

(assert (=> d!7696 (= lt!36982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7696 (= lt!36981 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))))))

(assert (=> d!7696 (= lt!36979 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764)))))))

(assert (=> d!7696 (invariant!0 (currentBit!2358 (_2!1530 lt!36764)) (currentByte!2363 (_2!1530 lt!36764)) (size!720 (buf!1044 (_2!1530 lt!36764))))))

(assert (=> d!7696 (= (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))) lt!36979)))

(declare-fun b!25817 () Bool)

(declare-fun res!22266 () Bool)

(assert (=> b!25817 (=> (not res!22266) (not e!17601))))

(assert (=> b!25817 (= res!22266 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!36979))))

(declare-fun b!25818 () Bool)

(declare-fun lt!36980 () (_ BitVec 64))

(assert (=> b!25818 (= e!17601 (bvsle lt!36979 (bvmul lt!36980 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25818 (or (= lt!36980 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!36980 #b0000000000000000000000000000000000000000000000000000000000001000) lt!36980)))))

(assert (=> b!25818 (= lt!36980 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))))))

(assert (= (and d!7696 res!22267) b!25817))

(assert (= (and b!25817 res!22266) b!25818))

(assert (=> d!7696 m!36851))

(assert (=> d!7696 m!36653))

(assert (=> b!25677 d!7696))

(declare-fun d!7698 () Bool)

(assert (=> d!7698 (= (invariant!0 (currentBit!2358 (_2!1530 lt!36764)) (currentByte!2363 (_2!1530 lt!36764)) (size!720 (buf!1044 (_2!1530 lt!36757)))) (and (bvsge (currentBit!2358 (_2!1530 lt!36764)) #b00000000000000000000000000000000) (bvslt (currentBit!2358 (_2!1530 lt!36764)) #b00000000000000000000000000001000) (bvsge (currentByte!2363 (_2!1530 lt!36764)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2363 (_2!1530 lt!36764)) (size!720 (buf!1044 (_2!1530 lt!36757)))) (and (= (currentBit!2358 (_2!1530 lt!36764)) #b00000000000000000000000000000000) (= (currentByte!2363 (_2!1530 lt!36764)) (size!720 (buf!1044 (_2!1530 lt!36757))))))))))

(assert (=> b!25679 d!7698))

(declare-fun d!7700 () Bool)

(assert (=> d!7700 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2220 () Bool)

(assert (= bs!2220 d!7700))

(declare-fun m!36903 () Bool)

(assert (=> bs!2220 m!36903))

(assert (=> b!25680 d!7700))

(declare-fun b!25819 () Bool)

(declare-fun e!17603 () Unit!2113)

(declare-fun Unit!2119 () Unit!2113)

(assert (=> b!25819 (= e!17603 Unit!2119)))

(declare-fun lt!36999 () (_ BitVec 64))

(declare-fun b!25820 () Bool)

(declare-fun lt!36994 () tuple2!2888)

(declare-fun lt!36988 () (_ BitVec 64))

(declare-fun e!17602 () Bool)

(assert (=> b!25820 (= e!17602 (= (_1!1531 lt!36994) (withMovedBitIndex!0 (_2!1531 lt!36994) (bvsub lt!36988 lt!36999))))))

(assert (=> b!25820 (or (= (bvand lt!36988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36988 lt!36999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25820 (= lt!36999 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))))))

(assert (=> b!25820 (= lt!36988 (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)))))

(declare-fun b!25821 () Bool)

(declare-fun lt!36984 () Unit!2113)

(assert (=> b!25821 (= e!17603 lt!36984)))

(declare-fun lt!36993 () (_ BitVec 64))

(assert (=> b!25821 (= lt!36993 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!36985 () (_ BitVec 64))

(assert (=> b!25821 (= lt!36985 (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)))))

(assert (=> b!25821 (= lt!36984 (arrayBitRangesEqSymmetric!0 (buf!1044 thiss!1379) (buf!1044 (_2!1530 lt!36764)) lt!36993 lt!36985))))

(assert (=> b!25821 (arrayBitRangesEq!0 (buf!1044 (_2!1530 lt!36764)) (buf!1044 thiss!1379) lt!36993 lt!36985)))

(declare-fun d!7702 () Bool)

(assert (=> d!7702 e!17602))

(declare-fun res!22269 () Bool)

(assert (=> d!7702 (=> (not res!22269) (not e!17602))))

(assert (=> d!7702 (= res!22269 (isPrefixOf!0 (_1!1531 lt!36994) (_2!1531 lt!36994)))))

(declare-fun lt!36990 () BitStream!1272)

(assert (=> d!7702 (= lt!36994 (tuple2!2889 lt!36990 (_2!1530 lt!36764)))))

(declare-fun lt!36989 () Unit!2113)

(declare-fun lt!37002 () Unit!2113)

(assert (=> d!7702 (= lt!36989 lt!37002)))

(assert (=> d!7702 (isPrefixOf!0 lt!36990 (_2!1530 lt!36764))))

(assert (=> d!7702 (= lt!37002 (lemmaIsPrefixTransitive!0 lt!36990 (_2!1530 lt!36764) (_2!1530 lt!36764)))))

(declare-fun lt!36997 () Unit!2113)

(declare-fun lt!36995 () Unit!2113)

(assert (=> d!7702 (= lt!36997 lt!36995)))

(assert (=> d!7702 (isPrefixOf!0 lt!36990 (_2!1530 lt!36764))))

(assert (=> d!7702 (= lt!36995 (lemmaIsPrefixTransitive!0 lt!36990 thiss!1379 (_2!1530 lt!36764)))))

(declare-fun lt!36986 () Unit!2113)

(assert (=> d!7702 (= lt!36986 e!17603)))

(declare-fun c!1735 () Bool)

(assert (=> d!7702 (= c!1735 (not (= (size!720 (buf!1044 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!36996 () Unit!2113)

(declare-fun lt!36987 () Unit!2113)

(assert (=> d!7702 (= lt!36996 lt!36987)))

(assert (=> d!7702 (isPrefixOf!0 (_2!1530 lt!36764) (_2!1530 lt!36764))))

(assert (=> d!7702 (= lt!36987 (lemmaIsPrefixRefl!0 (_2!1530 lt!36764)))))

(declare-fun lt!36983 () Unit!2113)

(declare-fun lt!37001 () Unit!2113)

(assert (=> d!7702 (= lt!36983 lt!37001)))

(assert (=> d!7702 (= lt!37001 (lemmaIsPrefixRefl!0 (_2!1530 lt!36764)))))

(declare-fun lt!37000 () Unit!2113)

(declare-fun lt!36998 () Unit!2113)

(assert (=> d!7702 (= lt!37000 lt!36998)))

(assert (=> d!7702 (isPrefixOf!0 lt!36990 lt!36990)))

(assert (=> d!7702 (= lt!36998 (lemmaIsPrefixRefl!0 lt!36990))))

(declare-fun lt!36991 () Unit!2113)

(declare-fun lt!36992 () Unit!2113)

(assert (=> d!7702 (= lt!36991 lt!36992)))

(assert (=> d!7702 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7702 (= lt!36992 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7702 (= lt!36990 (BitStream!1273 (buf!1044 (_2!1530 lt!36764)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)))))

(assert (=> d!7702 (isPrefixOf!0 thiss!1379 (_2!1530 lt!36764))))

(assert (=> d!7702 (= (reader!0 thiss!1379 (_2!1530 lt!36764)) lt!36994)))

(declare-fun b!25822 () Bool)

(declare-fun res!22268 () Bool)

(assert (=> b!25822 (=> (not res!22268) (not e!17602))))

(assert (=> b!25822 (= res!22268 (isPrefixOf!0 (_2!1531 lt!36994) (_2!1530 lt!36764)))))

(declare-fun b!25823 () Bool)

(declare-fun res!22270 () Bool)

(assert (=> b!25823 (=> (not res!22270) (not e!17602))))

(assert (=> b!25823 (= res!22270 (isPrefixOf!0 (_1!1531 lt!36994) thiss!1379))))

(assert (= (and d!7702 c!1735) b!25821))

(assert (= (and d!7702 (not c!1735)) b!25819))

(assert (= (and d!7702 res!22269) b!25823))

(assert (= (and b!25823 res!22270) b!25822))

(assert (= (and b!25822 res!22268) b!25820))

(declare-fun m!36905 () Bool)

(assert (=> b!25820 m!36905))

(assert (=> b!25820 m!36669))

(assert (=> b!25820 m!36687))

(declare-fun m!36907 () Bool)

(assert (=> d!7702 m!36907))

(assert (=> d!7702 m!36685))

(declare-fun m!36909 () Bool)

(assert (=> d!7702 m!36909))

(assert (=> d!7702 m!36815))

(declare-fun m!36911 () Bool)

(assert (=> d!7702 m!36911))

(assert (=> d!7702 m!36827))

(declare-fun m!36913 () Bool)

(assert (=> d!7702 m!36913))

(declare-fun m!36915 () Bool)

(assert (=> d!7702 m!36915))

(declare-fun m!36917 () Bool)

(assert (=> d!7702 m!36917))

(assert (=> d!7702 m!36665))

(assert (=> d!7702 m!36683))

(declare-fun m!36919 () Bool)

(assert (=> b!25823 m!36919))

(assert (=> b!25821 m!36687))

(declare-fun m!36921 () Bool)

(assert (=> b!25821 m!36921))

(declare-fun m!36923 () Bool)

(assert (=> b!25821 m!36923))

(declare-fun m!36925 () Bool)

(assert (=> b!25822 m!36925))

(assert (=> b!25680 d!7702))

(declare-fun d!7704 () Bool)

(assert (=> d!7704 (isPrefixOf!0 thiss!1379 (_2!1530 lt!36757))))

(declare-fun lt!37005 () Unit!2113)

(declare-fun choose!30 (BitStream!1272 BitStream!1272 BitStream!1272) Unit!2113)

(assert (=> d!7704 (= lt!37005 (choose!30 thiss!1379 (_2!1530 lt!36764) (_2!1530 lt!36757)))))

(assert (=> d!7704 (isPrefixOf!0 thiss!1379 (_2!1530 lt!36764))))

(assert (=> d!7704 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1530 lt!36764) (_2!1530 lt!36757)) lt!37005)))

(declare-fun bs!2221 () Bool)

(assert (= bs!2221 d!7704))

(assert (=> bs!2221 m!36701))

(declare-fun m!36927 () Bool)

(assert (=> bs!2221 m!36927))

(assert (=> bs!2221 m!36665))

(assert (=> b!25680 d!7704))

(declare-fun b!25946 () Bool)

(declare-fun res!22354 () Bool)

(declare-fun e!17664 () Bool)

(assert (=> b!25946 (=> (not res!22354) (not e!17664))))

(declare-fun lt!37325 () tuple2!2886)

(assert (=> b!25946 (= res!22354 (= (size!720 (buf!1044 (_2!1530 lt!36764))) (size!720 (buf!1044 (_2!1530 lt!37325)))))))

(declare-fun lt!37323 () tuple2!2886)

(declare-fun c!1756 () Bool)

(declare-fun bm!346 () Bool)

(declare-fun call!349 () tuple2!2888)

(declare-fun lt!37330 () tuple2!2886)

(assert (=> bm!346 (= call!349 (reader!0 (ite c!1756 (_2!1530 lt!37323) (_2!1530 lt!36764)) (ite c!1756 (_2!1530 lt!37330) (_2!1530 lt!36764))))))

(declare-fun b!25947 () Bool)

(declare-fun res!22353 () Bool)

(assert (=> b!25947 (=> (not res!22353) (not e!17664))))

(assert (=> b!25947 (= res!22353 (invariant!0 (currentBit!2358 (_2!1530 lt!37325)) (currentByte!2363 (_2!1530 lt!37325)) (size!720 (buf!1044 (_2!1530 lt!37325)))))))

(declare-fun b!25948 () Bool)

(declare-fun e!17662 () tuple2!2886)

(declare-fun Unit!2120 () Unit!2113)

(assert (=> b!25948 (= e!17662 (tuple2!2887 Unit!2120 (_2!1530 lt!36764)))))

(assert (=> b!25948 (= (size!720 (buf!1044 (_2!1530 lt!36764))) (size!720 (buf!1044 (_2!1530 lt!36764))))))

(declare-fun lt!37326 () Unit!2113)

(declare-fun Unit!2121 () Unit!2113)

(assert (=> b!25948 (= lt!37326 Unit!2121)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1272 array!1672 array!1672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25948 (checkByteArrayBitContent!0 (_2!1530 lt!36764) srcBuffer!2 (_1!1537 (readBits!0 (_1!1531 call!349) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37347 () tuple2!2888)

(declare-fun b!25949 () Bool)

(assert (=> b!25949 (= e!17664 (= (bitStreamReadBitsIntoList!0 (_2!1530 lt!37325) (_1!1531 lt!37347) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1530 lt!37325) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!25949 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25949 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!37340 () Unit!2113)

(declare-fun lt!37352 () Unit!2113)

(assert (=> b!25949 (= lt!37340 lt!37352)))

(declare-fun lt!37334 () (_ BitVec 64))

(assert (=> b!25949 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!37325)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) lt!37334)))

(assert (=> b!25949 (= lt!37352 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1530 lt!36764) (buf!1044 (_2!1530 lt!37325)) lt!37334))))

(declare-fun e!17663 () Bool)

(assert (=> b!25949 e!17663))

(declare-fun res!22351 () Bool)

(assert (=> b!25949 (=> (not res!22351) (not e!17663))))

(assert (=> b!25949 (= res!22351 (and (= (size!720 (buf!1044 (_2!1530 lt!36764))) (size!720 (buf!1044 (_2!1530 lt!37325)))) (bvsge lt!37334 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25949 (= lt!37334 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!25949 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25949 (= lt!37347 (reader!0 (_2!1530 lt!36764) (_2!1530 lt!37325)))))

(declare-fun b!25950 () Bool)

(declare-fun res!22352 () Bool)

(assert (=> b!25950 (=> (not res!22352) (not e!17664))))

(assert (=> b!25950 (= res!22352 (= (size!720 (buf!1044 (_2!1530 lt!37325))) (size!720 (buf!1044 (_2!1530 lt!36764)))))))

(declare-fun b!25951 () Bool)

(assert (=> b!25951 (= e!17663 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) lt!37334))))

(declare-fun b!25952 () Bool)

(declare-fun res!22356 () Bool)

(assert (=> b!25952 (=> (not res!22356) (not e!17664))))

(assert (=> b!25952 (= res!22356 (isPrefixOf!0 (_2!1530 lt!36764) (_2!1530 lt!37325)))))

(declare-fun d!7706 () Bool)

(assert (=> d!7706 e!17664))

(declare-fun res!22355 () Bool)

(assert (=> d!7706 (=> (not res!22355) (not e!17664))))

(declare-fun lt!37333 () (_ BitVec 64))

(assert (=> d!7706 (= res!22355 (= (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!37325))) (currentByte!2363 (_2!1530 lt!37325)) (currentBit!2358 (_2!1530 lt!37325))) (bvsub lt!37333 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7706 (or (= (bvand lt!37333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37333 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!37359 () (_ BitVec 64))

(assert (=> d!7706 (= lt!37333 (bvadd lt!37359 to!314))))

(assert (=> d!7706 (or (not (= (bvand lt!37359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!37359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!37359 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7706 (= lt!37359 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))))))

(assert (=> d!7706 (= lt!37325 e!17662)))

(assert (=> d!7706 (= c!1756 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!37358 () Unit!2113)

(declare-fun lt!37357 () Unit!2113)

(assert (=> d!7706 (= lt!37358 lt!37357)))

(assert (=> d!7706 (isPrefixOf!0 (_2!1530 lt!36764) (_2!1530 lt!36764))))

(assert (=> d!7706 (= lt!37357 (lemmaIsPrefixRefl!0 (_2!1530 lt!36764)))))

(declare-fun lt!37348 () (_ BitVec 64))

(assert (=> d!7706 (= lt!37348 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))))))

(assert (=> d!7706 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7706 (= (appendBitsMSBFirstLoop!0 (_2!1530 lt!36764) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!37325)))

(declare-fun b!25945 () Bool)

(declare-fun Unit!2122 () Unit!2113)

(assert (=> b!25945 (= e!17662 (tuple2!2887 Unit!2122 (_2!1530 lt!37330)))))

(assert (=> b!25945 (= lt!37323 (appendBitFromByte!0 (_2!1530 lt!36764) (select (arr!1179 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!37335 () (_ BitVec 64))

(assert (=> b!25945 (= lt!37335 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37353 () (_ BitVec 64))

(assert (=> b!25945 (= lt!37353 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!37343 () Unit!2113)

(assert (=> b!25945 (= lt!37343 (validateOffsetBitsIneqLemma!0 (_2!1530 lt!36764) (_2!1530 lt!37323) lt!37335 lt!37353))))

(assert (=> b!25945 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!37323)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!37323))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!37323))) (bvsub lt!37335 lt!37353))))

(declare-fun lt!37331 () Unit!2113)

(assert (=> b!25945 (= lt!37331 lt!37343)))

(declare-fun lt!37354 () tuple2!2888)

(assert (=> b!25945 (= lt!37354 (reader!0 (_2!1530 lt!36764) (_2!1530 lt!37323)))))

(declare-fun lt!37361 () (_ BitVec 64))

(assert (=> b!25945 (= lt!37361 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!37345 () Unit!2113)

(assert (=> b!25945 (= lt!37345 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1530 lt!36764) (buf!1044 (_2!1530 lt!37323)) lt!37361))))

(assert (=> b!25945 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!37323)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) lt!37361)))

(declare-fun lt!37322 () Unit!2113)

(assert (=> b!25945 (= lt!37322 lt!37345)))

(assert (=> b!25945 (= (head!174 (byteArrayBitContentToList!0 (_2!1530 lt!37323) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!174 (bitStreamReadBitsIntoList!0 (_2!1530 lt!37323) (_1!1531 lt!37354) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!37349 () Unit!2113)

(declare-fun Unit!2123 () Unit!2113)

(assert (=> b!25945 (= lt!37349 Unit!2123)))

(assert (=> b!25945 (= lt!37330 (appendBitsMSBFirstLoop!0 (_2!1530 lt!37323) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!37350 () Unit!2113)

(assert (=> b!25945 (= lt!37350 (lemmaIsPrefixTransitive!0 (_2!1530 lt!36764) (_2!1530 lt!37323) (_2!1530 lt!37330)))))

(assert (=> b!25945 (isPrefixOf!0 (_2!1530 lt!36764) (_2!1530 lt!37330))))

(declare-fun lt!37338 () Unit!2113)

(assert (=> b!25945 (= lt!37338 lt!37350)))

(assert (=> b!25945 (= (size!720 (buf!1044 (_2!1530 lt!37330))) (size!720 (buf!1044 (_2!1530 lt!36764))))))

(declare-fun lt!37329 () Unit!2113)

(declare-fun Unit!2124 () Unit!2113)

(assert (=> b!25945 (= lt!37329 Unit!2124)))

(assert (=> b!25945 (= (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!37330))) (currentByte!2363 (_2!1530 lt!37330)) (currentBit!2358 (_2!1530 lt!37330))) (bvsub (bvadd (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37364 () Unit!2113)

(declare-fun Unit!2125 () Unit!2113)

(assert (=> b!25945 (= lt!37364 Unit!2125)))

(assert (=> b!25945 (= (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!37330))) (currentByte!2363 (_2!1530 lt!37330)) (currentBit!2358 (_2!1530 lt!37330))) (bvsub (bvsub (bvadd (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!37323))) (currentByte!2363 (_2!1530 lt!37323)) (currentBit!2358 (_2!1530 lt!37323))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37346 () Unit!2113)

(declare-fun Unit!2126 () Unit!2113)

(assert (=> b!25945 (= lt!37346 Unit!2126)))

(declare-fun lt!37360 () tuple2!2888)

(assert (=> b!25945 (= lt!37360 (reader!0 (_2!1530 lt!36764) (_2!1530 lt!37330)))))

(declare-fun lt!37339 () (_ BitVec 64))

(assert (=> b!25945 (= lt!37339 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37341 () Unit!2113)

(assert (=> b!25945 (= lt!37341 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1530 lt!36764) (buf!1044 (_2!1530 lt!37330)) lt!37339))))

(assert (=> b!25945 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!37330)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!36764))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!36764))) lt!37339)))

(declare-fun lt!37342 () Unit!2113)

(assert (=> b!25945 (= lt!37342 lt!37341)))

(declare-fun lt!37337 () tuple2!2888)

(assert (=> b!25945 (= lt!37337 call!349)))

(declare-fun lt!37332 () (_ BitVec 64))

(assert (=> b!25945 (= lt!37332 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37324 () Unit!2113)

(assert (=> b!25945 (= lt!37324 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1530 lt!37323) (buf!1044 (_2!1530 lt!37330)) lt!37332))))

(assert (=> b!25945 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!37330)))) ((_ sign_extend 32) (currentByte!2363 (_2!1530 lt!37323))) ((_ sign_extend 32) (currentBit!2358 (_2!1530 lt!37323))) lt!37332)))

(declare-fun lt!37336 () Unit!2113)

(assert (=> b!25945 (= lt!37336 lt!37324)))

(declare-fun lt!37344 () List!337)

(assert (=> b!25945 (= lt!37344 (byteArrayBitContentToList!0 (_2!1530 lt!37330) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!37363 () List!337)

(assert (=> b!25945 (= lt!37363 (byteArrayBitContentToList!0 (_2!1530 lt!37330) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!37327 () List!337)

(assert (=> b!25945 (= lt!37327 (bitStreamReadBitsIntoList!0 (_2!1530 lt!37330) (_1!1531 lt!37360) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!37355 () List!337)

(assert (=> b!25945 (= lt!37355 (bitStreamReadBitsIntoList!0 (_2!1530 lt!37330) (_1!1531 lt!37337) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!37356 () (_ BitVec 64))

(assert (=> b!25945 (= lt!37356 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37328 () Unit!2113)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1272 BitStream!1272 BitStream!1272 BitStream!1272 (_ BitVec 64) List!337) Unit!2113)

(assert (=> b!25945 (= lt!37328 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1530 lt!37330) (_2!1530 lt!37330) (_1!1531 lt!37360) (_1!1531 lt!37337) lt!37356 lt!37327))))

(declare-fun tail!89 (List!337) List!337)

(assert (=> b!25945 (= (bitStreamReadBitsIntoList!0 (_2!1530 lt!37330) (_1!1531 lt!37337) (bvsub lt!37356 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!89 lt!37327))))

(declare-fun lt!37351 () Unit!2113)

(assert (=> b!25945 (= lt!37351 lt!37328)))

(declare-fun lt!37362 () Unit!2113)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1672 array!1672 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2113)

(assert (=> b!25945 (= lt!37362 (arrayBitRangesEqImpliesEq!0 (buf!1044 (_2!1530 lt!37323)) (buf!1044 (_2!1530 lt!37330)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!37348 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!37323))) (currentByte!2363 (_2!1530 lt!37323)) (currentBit!2358 (_2!1530 lt!37323)))))))

(declare-fun bitAt!0 (array!1672 (_ BitVec 64)) Bool)

(assert (=> b!25945 (= (bitAt!0 (buf!1044 (_2!1530 lt!37323)) lt!37348) (bitAt!0 (buf!1044 (_2!1530 lt!37330)) lt!37348))))

(declare-fun lt!37365 () Unit!2113)

(assert (=> b!25945 (= lt!37365 lt!37362)))

(assert (= (and d!7706 c!1756) b!25945))

(assert (= (and d!7706 (not c!1756)) b!25948))

(assert (= (or b!25945 b!25948) bm!346))

(assert (= (and d!7706 res!22355) b!25947))

(assert (= (and b!25947 res!22353) b!25946))

(assert (= (and b!25946 res!22354) b!25952))

(assert (= (and b!25952 res!22356) b!25950))

(assert (= (and b!25950 res!22352) b!25949))

(assert (= (and b!25949 res!22351) b!25951))

(declare-fun m!37087 () Bool)

(assert (=> b!25948 m!37087))

(declare-fun m!37089 () Bool)

(assert (=> b!25948 m!37089))

(declare-fun m!37091 () Bool)

(assert (=> b!25949 m!37091))

(declare-fun m!37093 () Bool)

(assert (=> b!25949 m!37093))

(declare-fun m!37095 () Bool)

(assert (=> b!25949 m!37095))

(declare-fun m!37097 () Bool)

(assert (=> b!25949 m!37097))

(declare-fun m!37099 () Bool)

(assert (=> b!25949 m!37099))

(declare-fun m!37101 () Bool)

(assert (=> bm!346 m!37101))

(declare-fun m!37103 () Bool)

(assert (=> b!25952 m!37103))

(declare-fun m!37105 () Bool)

(assert (=> d!7706 m!37105))

(assert (=> d!7706 m!36669))

(assert (=> d!7706 m!36827))

(assert (=> d!7706 m!36815))

(declare-fun m!37107 () Bool)

(assert (=> b!25947 m!37107))

(declare-fun m!37109 () Bool)

(assert (=> b!25951 m!37109))

(declare-fun m!37111 () Bool)

(assert (=> b!25945 m!37111))

(declare-fun m!37113 () Bool)

(assert (=> b!25945 m!37113))

(declare-fun m!37115 () Bool)

(assert (=> b!25945 m!37115))

(assert (=> b!25945 m!36669))

(declare-fun m!37117 () Bool)

(assert (=> b!25945 m!37117))

(declare-fun m!37119 () Bool)

(assert (=> b!25945 m!37119))

(declare-fun m!37121 () Bool)

(assert (=> b!25945 m!37121))

(declare-fun m!37123 () Bool)

(assert (=> b!25945 m!37123))

(declare-fun m!37125 () Bool)

(assert (=> b!25945 m!37125))

(declare-fun m!37127 () Bool)

(assert (=> b!25945 m!37127))

(declare-fun m!37129 () Bool)

(assert (=> b!25945 m!37129))

(declare-fun m!37131 () Bool)

(assert (=> b!25945 m!37131))

(declare-fun m!37133 () Bool)

(assert (=> b!25945 m!37133))

(declare-fun m!37135 () Bool)

(assert (=> b!25945 m!37135))

(declare-fun m!37137 () Bool)

(assert (=> b!25945 m!37137))

(declare-fun m!37139 () Bool)

(assert (=> b!25945 m!37139))

(declare-fun m!37141 () Bool)

(assert (=> b!25945 m!37141))

(declare-fun m!37143 () Bool)

(assert (=> b!25945 m!37143))

(declare-fun m!37145 () Bool)

(assert (=> b!25945 m!37145))

(declare-fun m!37147 () Bool)

(assert (=> b!25945 m!37147))

(declare-fun m!37149 () Bool)

(assert (=> b!25945 m!37149))

(assert (=> b!25945 m!37131))

(declare-fun m!37151 () Bool)

(assert (=> b!25945 m!37151))

(declare-fun m!37153 () Bool)

(assert (=> b!25945 m!37153))

(declare-fun m!37155 () Bool)

(assert (=> b!25945 m!37155))

(assert (=> b!25945 m!37113))

(declare-fun m!37157 () Bool)

(assert (=> b!25945 m!37157))

(declare-fun m!37159 () Bool)

(assert (=> b!25945 m!37159))

(declare-fun m!37161 () Bool)

(assert (=> b!25945 m!37161))

(assert (=> b!25945 m!37117))

(declare-fun m!37163 () Bool)

(assert (=> b!25945 m!37163))

(declare-fun m!37165 () Bool)

(assert (=> b!25945 m!37165))

(declare-fun m!37167 () Bool)

(assert (=> b!25945 m!37167))

(declare-fun m!37169 () Bool)

(assert (=> b!25945 m!37169))

(assert (=> b!25945 m!37143))

(declare-fun m!37171 () Bool)

(assert (=> b!25945 m!37171))

(assert (=> b!25680 d!7706))

(declare-fun d!7774 () Bool)

(assert (=> d!7774 (validate_offset_bits!1 ((_ sign_extend 32) (size!720 (buf!1044 (_2!1530 lt!36764)))) ((_ sign_extend 32) (currentByte!2363 thiss!1379)) ((_ sign_extend 32) (currentBit!2358 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!37366 () Unit!2113)

(assert (=> d!7774 (= lt!37366 (choose!9 thiss!1379 (buf!1044 (_2!1530 lt!36764)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1273 (buf!1044 (_2!1530 lt!36764)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379))))))

(assert (=> d!7774 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1044 (_2!1530 lt!36764)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!37366)))

(declare-fun bs!2236 () Bool)

(assert (= bs!2236 d!7774))

(assert (=> bs!2236 m!36697))

(declare-fun m!37173 () Bool)

(assert (=> bs!2236 m!37173))

(assert (=> b!25680 d!7774))

(declare-fun d!7776 () Bool)

(declare-fun res!22357 () Bool)

(declare-fun e!17666 () Bool)

(assert (=> d!7776 (=> (not res!22357) (not e!17666))))

(assert (=> d!7776 (= res!22357 (= (size!720 (buf!1044 thiss!1379)) (size!720 (buf!1044 (_2!1530 lt!36757)))))))

(assert (=> d!7776 (= (isPrefixOf!0 thiss!1379 (_2!1530 lt!36757)) e!17666)))

(declare-fun b!25953 () Bool)

(declare-fun res!22359 () Bool)

(assert (=> b!25953 (=> (not res!22359) (not e!17666))))

(assert (=> b!25953 (= res!22359 (bvsle (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379)) (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36757))) (currentByte!2363 (_2!1530 lt!36757)) (currentBit!2358 (_2!1530 lt!36757)))))))

(declare-fun b!25954 () Bool)

(declare-fun e!17665 () Bool)

(assert (=> b!25954 (= e!17666 e!17665)))

(declare-fun res!22358 () Bool)

(assert (=> b!25954 (=> res!22358 e!17665)))

(assert (=> b!25954 (= res!22358 (= (size!720 (buf!1044 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25955 () Bool)

(assert (=> b!25955 (= e!17665 (arrayBitRangesEq!0 (buf!1044 thiss!1379) (buf!1044 (_2!1530 lt!36757)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!720 (buf!1044 thiss!1379)) (currentByte!2363 thiss!1379) (currentBit!2358 thiss!1379))))))

(assert (= (and d!7776 res!22357) b!25953))

(assert (= (and b!25953 res!22359) b!25954))

(assert (= (and b!25954 (not res!22358)) b!25955))

(assert (=> b!25953 m!36687))

(assert (=> b!25953 m!36633))

(assert (=> b!25955 m!36687))

(assert (=> b!25955 m!36687))

(declare-fun m!37175 () Bool)

(assert (=> b!25955 m!37175))

(assert (=> b!25680 d!7776))

(declare-fun d!7778 () Bool)

(declare-fun res!22360 () Bool)

(declare-fun e!17668 () Bool)

(assert (=> d!7778 (=> (not res!22360) (not e!17668))))

(assert (=> d!7778 (= res!22360 (= (size!720 (buf!1044 (_2!1530 lt!36764))) (size!720 (buf!1044 (_2!1530 lt!36757)))))))

(assert (=> d!7778 (= (isPrefixOf!0 (_2!1530 lt!36764) (_2!1530 lt!36757)) e!17668)))

(declare-fun b!25956 () Bool)

(declare-fun res!22362 () Bool)

(assert (=> b!25956 (=> (not res!22362) (not e!17668))))

(assert (=> b!25956 (= res!22362 (bvsle (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764))) (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36757))) (currentByte!2363 (_2!1530 lt!36757)) (currentBit!2358 (_2!1530 lt!36757)))))))

(declare-fun b!25957 () Bool)

(declare-fun e!17667 () Bool)

(assert (=> b!25957 (= e!17668 e!17667)))

(declare-fun res!22361 () Bool)

(assert (=> b!25957 (=> res!22361 e!17667)))

(assert (=> b!25957 (= res!22361 (= (size!720 (buf!1044 (_2!1530 lt!36764))) #b00000000000000000000000000000000))))

(declare-fun b!25958 () Bool)

(assert (=> b!25958 (= e!17667 (arrayBitRangesEq!0 (buf!1044 (_2!1530 lt!36764)) (buf!1044 (_2!1530 lt!36757)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!720 (buf!1044 (_2!1530 lt!36764))) (currentByte!2363 (_2!1530 lt!36764)) (currentBit!2358 (_2!1530 lt!36764)))))))

(assert (= (and d!7778 res!22360) b!25956))

(assert (= (and b!25956 res!22362) b!25957))

(assert (= (and b!25957 (not res!22361)) b!25958))

(assert (=> b!25956 m!36669))

(assert (=> b!25956 m!36633))

(assert (=> b!25958 m!36669))

(assert (=> b!25958 m!36669))

(declare-fun m!37177 () Bool)

(assert (=> b!25958 m!37177))

(assert (=> b!25680 d!7778))

(check-sat (not b!25743) (not d!7686) (not b!25949) (not d!7646) (not b!25947) (not d!7702) (not b!25822) (not b!25794) (not b!25951) (not b!25791) (not d!7706) (not d!7682) (not b!25740) (not b!25816) (not b!25958) (not b!25955) (not d!7670) (not b!25795) (not b!25770) (not d!7672) (not d!7662) (not d!7656) (not b!25765) (not d!7652) (not b!25767) (not b!25812) (not d!7774) (not b!25757) (not b!25820) (not bm!346) (not b!25793) (not b!25815) (not d!7648) (not d!7680) (not b!25823) (not b!25741) (not b!25814) (not b!25945) (not b!25744) (not d!7696) (not b!25802) (not b!25952) (not b!25821) (not b!25953) (not d!7654) (not b!25738) (not d!7676) (not b!25804) (not b!25758) (not b!25788) (not b!25948) (not d!7650) (not b!25792) (not d!7660) (not b!25739) (not b!25746) (not d!7674) (not b!25745) (not b!25789) (not b!25756) (not d!7704) (not b!25956) (not d!7700) (not b!25790))
(check-sat)
