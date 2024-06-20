; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12660 () Bool)

(assert start!12660)

(declare-fun b!64715 () Bool)

(declare-fun res!53709 () Bool)

(declare-fun e!42701 () Bool)

(assert (=> b!64715 (=> res!53709 e!42701)))

(declare-datatypes ((array!2824 0))(
  ( (array!2825 (arr!1862 (Array (_ BitVec 32) (_ BitVec 8))) (size!1298 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2242 0))(
  ( (BitStream!2243 (buf!1679 array!2824) (currentByte!3339 (_ BitVec 32)) (currentBit!3334 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5772 0))(
  ( (tuple2!5773 (_1!2997 BitStream!2242) (_2!2997 BitStream!2242)) )
))
(declare-fun lt!102437 () tuple2!5772)

(declare-fun lt!102426 () tuple2!5772)

(declare-fun isPrefixOf!0 (BitStream!2242 BitStream!2242) Bool)

(assert (=> b!64715 (= res!53709 (not (isPrefixOf!0 (_1!2997 lt!102437) (_1!2997 lt!102426))))))

(declare-fun b!64716 () Bool)

(declare-fun e!42699 () Bool)

(declare-fun e!42698 () Bool)

(assert (=> b!64716 (= e!42699 (not e!42698))))

(declare-fun res!53695 () Bool)

(assert (=> b!64716 (=> res!53695 e!42698)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!64716 (= res!53695 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!2242)

(assert (=> b!64716 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4385 0))(
  ( (Unit!4386) )
))
(declare-fun lt!102435 () Unit!4385)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2242) Unit!4385)

(assert (=> b!64716 (= lt!102435 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!102428 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!64716 (= lt!102428 (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)))))

(declare-fun b!64717 () Bool)

(declare-fun e!42696 () Bool)

(declare-fun e!42695 () Bool)

(assert (=> b!64717 (= e!42696 e!42695)))

(declare-fun res!53699 () Bool)

(assert (=> b!64717 (=> res!53699 e!42695)))

(declare-datatypes ((tuple2!5774 0))(
  ( (tuple2!5775 (_1!2998 Unit!4385) (_2!2998 BitStream!2242)) )
))
(declare-fun lt!102430 () tuple2!5774)

(declare-fun lt!102432 () tuple2!5774)

(assert (=> b!64717 (= res!53699 (not (isPrefixOf!0 (_2!2998 lt!102430) (_2!2998 lt!102432))))))

(assert (=> b!64717 (isPrefixOf!0 thiss!1379 (_2!2998 lt!102432))))

(declare-fun lt!102434 () Unit!4385)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2242 BitStream!2242 BitStream!2242) Unit!4385)

(assert (=> b!64717 (= lt!102434 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2998 lt!102430) (_2!2998 lt!102432)))))

(declare-fun srcBuffer!2 () array!2824)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2242 array!2824 (_ BitVec 64) (_ BitVec 64)) tuple2!5774)

(assert (=> b!64717 (= lt!102432 (appendBitsMSBFirstLoop!0 (_2!2998 lt!102430) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!42691 () Bool)

(assert (=> b!64717 e!42691))

(declare-fun res!53696 () Bool)

(assert (=> b!64717 (=> (not res!53696) (not e!42691))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64717 (= res!53696 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102427 () Unit!4385)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2242 array!2824 (_ BitVec 64)) Unit!4385)

(assert (=> b!64717 (= lt!102427 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1679 (_2!2998 lt!102430)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102436 () tuple2!5772)

(declare-fun reader!0 (BitStream!2242 BitStream!2242) tuple2!5772)

(assert (=> b!64717 (= lt!102436 (reader!0 thiss!1379 (_2!2998 lt!102430)))))

(declare-fun b!64718 () Bool)

(declare-fun res!53704 () Bool)

(assert (=> b!64718 (=> res!53704 e!42701)))

(declare-fun lt!102438 () (_ BitVec 64))

(assert (=> b!64718 (= res!53704 (or (not (= (buf!1679 (_1!2997 lt!102437)) (buf!1679 (_1!2997 lt!102426)))) (not (= (buf!1679 (_1!2997 lt!102437)) (buf!1679 (_2!2998 lt!102432)))) (bvsge lt!102438 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!64719 () Bool)

(declare-fun e!42690 () Bool)

(declare-fun e!42693 () Bool)

(assert (=> b!64719 (= e!42690 e!42693)))

(declare-fun res!53705 () Bool)

(assert (=> b!64719 (=> res!53705 e!42693)))

(assert (=> b!64719 (= res!53705 (not (= (size!1298 (buf!1679 (_2!2998 lt!102430))) (size!1298 (buf!1679 (_2!2998 lt!102432))))))))

(declare-fun e!42694 () Bool)

(assert (=> b!64719 e!42694))

(declare-fun res!53706 () Bool)

(assert (=> b!64719 (=> (not res!53706) (not e!42694))))

(assert (=> b!64719 (= res!53706 (= (size!1298 (buf!1679 (_2!2998 lt!102432))) (size!1298 (buf!1679 thiss!1379))))))

(declare-fun b!64720 () Bool)

(assert (=> b!64720 (= e!42695 e!42690)))

(declare-fun res!53698 () Bool)

(assert (=> b!64720 (=> res!53698 e!42690)))

(assert (=> b!64720 (= res!53698 (not (= lt!102438 (bvsub (bvadd lt!102428 to!314) i!635))))))

(assert (=> b!64720 (= lt!102438 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102432))) (currentByte!3339 (_2!2998 lt!102432)) (currentBit!3334 (_2!2998 lt!102432))))))

(declare-fun b!64721 () Bool)

(assert (=> b!64721 (= e!42701 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_1!2997 lt!102437)))) ((_ sign_extend 32) (currentByte!3339 (_1!2997 lt!102437))) ((_ sign_extend 32) (currentBit!3334 (_1!2997 lt!102437))) (bvsub to!314 i!635)))))

(declare-fun b!64722 () Bool)

(assert (=> b!64722 (= e!42694 (= lt!102438 (bvsub (bvsub (bvadd (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64723 () Bool)

(assert (=> b!64723 (= e!42693 e!42701)))

(declare-fun res!53693 () Bool)

(assert (=> b!64723 (=> res!53693 e!42701)))

(assert (=> b!64723 (= res!53693 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102431 () (_ BitVec 64))

(declare-datatypes ((List!696 0))(
  ( (Nil!693) (Cons!692 (h!811 Bool) (t!1446 List!696)) )
))
(declare-fun lt!102433 () List!696)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2242 BitStream!2242 (_ BitVec 64)) List!696)

(assert (=> b!64723 (= lt!102433 (bitStreamReadBitsIntoList!0 (_2!2998 lt!102432) (_1!2997 lt!102426) lt!102431))))

(declare-fun lt!102439 () List!696)

(assert (=> b!64723 (= lt!102439 (bitStreamReadBitsIntoList!0 (_2!2998 lt!102432) (_1!2997 lt!102437) (bvsub to!314 i!635)))))

(assert (=> b!64723 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) lt!102431)))

(declare-fun lt!102424 () Unit!4385)

(assert (=> b!64723 (= lt!102424 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2998 lt!102430) (buf!1679 (_2!2998 lt!102432)) lt!102431))))

(assert (=> b!64723 (= lt!102426 (reader!0 (_2!2998 lt!102430) (_2!2998 lt!102432)))))

(assert (=> b!64723 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!102425 () Unit!4385)

(assert (=> b!64723 (= lt!102425 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1679 (_2!2998 lt!102432)) (bvsub to!314 i!635)))))

(assert (=> b!64723 (= lt!102437 (reader!0 thiss!1379 (_2!2998 lt!102432)))))

(declare-fun b!64724 () Bool)

(declare-fun res!53703 () Bool)

(assert (=> b!64724 (=> res!53703 e!42693)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!64724 (= res!53703 (not (invariant!0 (currentBit!3334 (_2!2998 lt!102430)) (currentByte!3339 (_2!2998 lt!102430)) (size!1298 (buf!1679 (_2!2998 lt!102432))))))))

(declare-fun b!64725 () Bool)

(declare-fun res!53708 () Bool)

(assert (=> b!64725 (=> res!53708 e!42690)))

(assert (=> b!64725 (= res!53708 (not (= (size!1298 (buf!1679 thiss!1379)) (size!1298 (buf!1679 (_2!2998 lt!102432))))))))

(declare-fun b!64726 () Bool)

(declare-fun e!42700 () Bool)

(declare-fun array_inv!1180 (array!2824) Bool)

(assert (=> b!64726 (= e!42700 (array_inv!1180 (buf!1679 thiss!1379)))))

(declare-fun b!64727 () Bool)

(declare-fun res!53701 () Bool)

(assert (=> b!64727 (=> res!53701 e!42701)))

(assert (=> b!64727 (= res!53701 (not (isPrefixOf!0 (_1!2997 lt!102437) (_2!2998 lt!102432))))))

(declare-fun b!64729 () Bool)

(declare-fun res!53694 () Bool)

(assert (=> b!64729 (=> res!53694 e!42701)))

(assert (=> b!64729 (= res!53694 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102437))) (currentByte!3339 (_1!2997 lt!102437)) (currentBit!3334 (_1!2997 lt!102437)))) (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102426))) (currentByte!3339 (_1!2997 lt!102426)) (currentBit!3334 (_1!2997 lt!102426))))))))

(declare-fun b!64730 () Bool)

(declare-fun res!53707 () Bool)

(assert (=> b!64730 (=> (not res!53707) (not e!42699))))

(assert (=> b!64730 (= res!53707 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 thiss!1379))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!64731 () Bool)

(declare-fun head!515 (List!696) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2242 array!2824 (_ BitVec 64) (_ BitVec 64)) List!696)

(assert (=> b!64731 (= e!42691 (= (head!515 (byteArrayBitContentToList!0 (_2!2998 lt!102430) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!515 (bitStreamReadBitsIntoList!0 (_2!2998 lt!102430) (_1!2997 lt!102436) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!64732 () Bool)

(declare-fun res!53710 () Bool)

(assert (=> b!64732 (=> res!53710 e!42701)))

(assert (=> b!64732 (= res!53710 (not (isPrefixOf!0 (_1!2997 lt!102426) (_2!2998 lt!102432))))))

(declare-fun b!64733 () Bool)

(assert (=> b!64733 (= e!42698 e!42696)))

(declare-fun res!53697 () Bool)

(assert (=> b!64733 (=> res!53697 e!42696)))

(assert (=> b!64733 (= res!53697 (not (isPrefixOf!0 thiss!1379 (_2!2998 lt!102430))))))

(assert (=> b!64733 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) lt!102431)))

(assert (=> b!64733 (= lt!102431 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102429 () Unit!4385)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2242 BitStream!2242 (_ BitVec 64) (_ BitVec 64)) Unit!4385)

(assert (=> b!64733 (= lt!102429 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2998 lt!102430) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2242 (_ BitVec 8) (_ BitVec 32)) tuple2!5774)

(assert (=> b!64733 (= lt!102430 (appendBitFromByte!0 thiss!1379 (select (arr!1862 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!64734 () Bool)

(declare-fun res!53711 () Bool)

(assert (=> b!64734 (=> res!53711 e!42690)))

(assert (=> b!64734 (= res!53711 (not (invariant!0 (currentBit!3334 (_2!2998 lt!102432)) (currentByte!3339 (_2!2998 lt!102432)) (size!1298 (buf!1679 (_2!2998 lt!102432))))))))

(declare-fun b!64735 () Bool)

(declare-fun res!53702 () Bool)

(assert (=> b!64735 (=> res!53702 e!42701)))

(declare-fun length!324 (List!696) Int)

(assert (=> b!64735 (= res!53702 (<= (length!324 lt!102439) 0))))

(declare-fun res!53712 () Bool)

(assert (=> start!12660 (=> (not res!53712) (not e!42699))))

(assert (=> start!12660 (= res!53712 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1298 srcBuffer!2))))))))

(assert (=> start!12660 e!42699))

(assert (=> start!12660 true))

(assert (=> start!12660 (array_inv!1180 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2242) Bool)

(assert (=> start!12660 (and (inv!12 thiss!1379) e!42700)))

(declare-fun b!64728 () Bool)

(declare-fun res!53700 () Bool)

(assert (=> b!64728 (=> res!53700 e!42693)))

(assert (=> b!64728 (= res!53700 (not (invariant!0 (currentBit!3334 (_2!2998 lt!102430)) (currentByte!3339 (_2!2998 lt!102430)) (size!1298 (buf!1679 (_2!2998 lt!102430))))))))

(assert (= (and start!12660 res!53712) b!64730))

(assert (= (and b!64730 res!53707) b!64716))

(assert (= (and b!64716 (not res!53695)) b!64733))

(assert (= (and b!64733 (not res!53697)) b!64717))

(assert (= (and b!64717 res!53696) b!64731))

(assert (= (and b!64717 (not res!53699)) b!64720))

(assert (= (and b!64720 (not res!53698)) b!64734))

(assert (= (and b!64734 (not res!53711)) b!64725))

(assert (= (and b!64725 (not res!53708)) b!64719))

(assert (= (and b!64719 res!53706) b!64722))

(assert (= (and b!64719 (not res!53705)) b!64728))

(assert (= (and b!64728 (not res!53700)) b!64724))

(assert (= (and b!64724 (not res!53703)) b!64723))

(assert (= (and b!64723 (not res!53693)) b!64735))

(assert (= (and b!64735 (not res!53702)) b!64727))

(assert (= (and b!64727 (not res!53701)) b!64732))

(assert (= (and b!64732 (not res!53710)) b!64715))

(assert (= (and b!64715 (not res!53709)) b!64718))

(assert (= (and b!64718 (not res!53704)) b!64729))

(assert (= (and b!64729 (not res!53694)) b!64721))

(assert (= start!12660 b!64726))

(declare-fun m!102703 () Bool)

(assert (=> b!64735 m!102703))

(declare-fun m!102705 () Bool)

(assert (=> b!64720 m!102705))

(declare-fun m!102707 () Bool)

(assert (=> b!64717 m!102707))

(declare-fun m!102709 () Bool)

(assert (=> b!64717 m!102709))

(declare-fun m!102711 () Bool)

(assert (=> b!64717 m!102711))

(declare-fun m!102713 () Bool)

(assert (=> b!64717 m!102713))

(declare-fun m!102715 () Bool)

(assert (=> b!64717 m!102715))

(declare-fun m!102717 () Bool)

(assert (=> b!64717 m!102717))

(declare-fun m!102719 () Bool)

(assert (=> b!64717 m!102719))

(declare-fun m!102721 () Bool)

(assert (=> b!64728 m!102721))

(declare-fun m!102723 () Bool)

(assert (=> b!64716 m!102723))

(declare-fun m!102725 () Bool)

(assert (=> b!64716 m!102725))

(declare-fun m!102727 () Bool)

(assert (=> b!64716 m!102727))

(declare-fun m!102729 () Bool)

(assert (=> b!64722 m!102729))

(declare-fun m!102731 () Bool)

(assert (=> b!64726 m!102731))

(declare-fun m!102733 () Bool)

(assert (=> b!64734 m!102733))

(declare-fun m!102735 () Bool)

(assert (=> b!64733 m!102735))

(declare-fun m!102737 () Bool)

(assert (=> b!64733 m!102737))

(declare-fun m!102739 () Bool)

(assert (=> b!64733 m!102739))

(declare-fun m!102741 () Bool)

(assert (=> b!64733 m!102741))

(assert (=> b!64733 m!102739))

(declare-fun m!102743 () Bool)

(assert (=> b!64733 m!102743))

(declare-fun m!102745 () Bool)

(assert (=> b!64724 m!102745))

(declare-fun m!102747 () Bool)

(assert (=> b!64727 m!102747))

(declare-fun m!102749 () Bool)

(assert (=> b!64732 m!102749))

(declare-fun m!102751 () Bool)

(assert (=> b!64721 m!102751))

(declare-fun m!102753 () Bool)

(assert (=> b!64729 m!102753))

(declare-fun m!102755 () Bool)

(assert (=> b!64729 m!102755))

(declare-fun m!102757 () Bool)

(assert (=> b!64730 m!102757))

(declare-fun m!102759 () Bool)

(assert (=> b!64715 m!102759))

(declare-fun m!102761 () Bool)

(assert (=> b!64731 m!102761))

(assert (=> b!64731 m!102761))

(declare-fun m!102763 () Bool)

(assert (=> b!64731 m!102763))

(declare-fun m!102765 () Bool)

(assert (=> b!64731 m!102765))

(assert (=> b!64731 m!102765))

(declare-fun m!102767 () Bool)

(assert (=> b!64731 m!102767))

(declare-fun m!102769 () Bool)

(assert (=> b!64723 m!102769))

(declare-fun m!102771 () Bool)

(assert (=> b!64723 m!102771))

(declare-fun m!102773 () Bool)

(assert (=> b!64723 m!102773))

(declare-fun m!102775 () Bool)

(assert (=> b!64723 m!102775))

(declare-fun m!102777 () Bool)

(assert (=> b!64723 m!102777))

(declare-fun m!102779 () Bool)

(assert (=> b!64723 m!102779))

(declare-fun m!102781 () Bool)

(assert (=> b!64723 m!102781))

(declare-fun m!102783 () Bool)

(assert (=> b!64723 m!102783))

(declare-fun m!102785 () Bool)

(assert (=> start!12660 m!102785))

(declare-fun m!102787 () Bool)

(assert (=> start!12660 m!102787))

(push 1)

(assert (not b!64733))

(assert (not b!64715))

(assert (not b!64721))

(assert (not b!64732))

(assert (not b!64728))

(assert (not b!64723))

(assert (not b!64720))

(assert (not b!64724))

(assert (not b!64731))

(assert (not b!64717))

(assert (not b!64734))

(assert (not b!64726))

(assert (not b!64716))

(assert (not b!64722))

(assert (not b!64730))

(assert (not b!64735))

(assert (not start!12660))

(assert (not b!64727))

(assert (not b!64729))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!20290 () Bool)

(declare-fun res!53868 () Bool)

(declare-fun e!42810 () Bool)

(assert (=> d!20290 (=> (not res!53868) (not e!42810))))

(assert (=> d!20290 (= res!53868 (= (size!1298 (buf!1679 (_1!2997 lt!102426))) (size!1298 (buf!1679 (_2!2998 lt!102432)))))))

(assert (=> d!20290 (= (isPrefixOf!0 (_1!2997 lt!102426) (_2!2998 lt!102432)) e!42810)))

(declare-fun b!64931 () Bool)

(declare-fun res!53866 () Bool)

(assert (=> b!64931 (=> (not res!53866) (not e!42810))))

(assert (=> b!64931 (= res!53866 (bvsle (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102426))) (currentByte!3339 (_1!2997 lt!102426)) (currentBit!3334 (_1!2997 lt!102426))) (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102432))) (currentByte!3339 (_2!2998 lt!102432)) (currentBit!3334 (_2!2998 lt!102432)))))))

(declare-fun b!64932 () Bool)

(declare-fun e!42809 () Bool)

(assert (=> b!64932 (= e!42810 e!42809)))

(declare-fun res!53867 () Bool)

(assert (=> b!64932 (=> res!53867 e!42809)))

(assert (=> b!64932 (= res!53867 (= (size!1298 (buf!1679 (_1!2997 lt!102426))) #b00000000000000000000000000000000))))

(declare-fun b!64933 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2824 array!2824 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64933 (= e!42809 (arrayBitRangesEq!0 (buf!1679 (_1!2997 lt!102426)) (buf!1679 (_2!2998 lt!102432)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102426))) (currentByte!3339 (_1!2997 lt!102426)) (currentBit!3334 (_1!2997 lt!102426)))))))

(assert (= (and d!20290 res!53868) b!64931))

(assert (= (and b!64931 res!53866) b!64932))

(assert (= (and b!64932 (not res!53867)) b!64933))

(assert (=> b!64931 m!102755))

(assert (=> b!64931 m!102705))

(assert (=> b!64933 m!102755))

(assert (=> b!64933 m!102755))

(declare-fun m!103087 () Bool)

(assert (=> b!64933 m!103087))

(assert (=> b!64732 d!20290))

(declare-fun d!20292 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20292 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_1!2997 lt!102437)))) ((_ sign_extend 32) (currentByte!3339 (_1!2997 lt!102437))) ((_ sign_extend 32) (currentBit!3334 (_1!2997 lt!102437))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 (_1!2997 lt!102437)))) ((_ sign_extend 32) (currentByte!3339 (_1!2997 lt!102437))) ((_ sign_extend 32) (currentBit!3334 (_1!2997 lt!102437)))) (bvsub to!314 i!635)))))

(declare-fun bs!4969 () Bool)

(assert (= bs!4969 d!20292))

(declare-fun m!103089 () Bool)

(assert (=> bs!4969 m!103089))

(assert (=> b!64721 d!20292))

(declare-fun d!20294 () Bool)

(assert (=> d!20294 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) lt!102431) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430)))) lt!102431))))

(declare-fun bs!4970 () Bool)

(assert (= bs!4970 d!20294))

(declare-fun m!103091 () Bool)

(assert (=> bs!4970 m!103091))

(assert (=> b!64723 d!20294))

(declare-fun d!20296 () Bool)

(declare-fun e!42815 () Bool)

(assert (=> d!20296 e!42815))

(declare-fun res!53875 () Bool)

(assert (=> d!20296 (=> (not res!53875) (not e!42815))))

(declare-fun lt!102700 () tuple2!5772)

(assert (=> d!20296 (= res!53875 (isPrefixOf!0 (_1!2997 lt!102700) (_2!2997 lt!102700)))))

(declare-fun lt!102712 () BitStream!2242)

(assert (=> d!20296 (= lt!102700 (tuple2!5773 lt!102712 (_2!2998 lt!102432)))))

(declare-fun lt!102718 () Unit!4385)

(declare-fun lt!102702 () Unit!4385)

(assert (=> d!20296 (= lt!102718 lt!102702)))

(assert (=> d!20296 (isPrefixOf!0 lt!102712 (_2!2998 lt!102432))))

(assert (=> d!20296 (= lt!102702 (lemmaIsPrefixTransitive!0 lt!102712 (_2!2998 lt!102432) (_2!2998 lt!102432)))))

(declare-fun lt!102709 () Unit!4385)

(declare-fun lt!102701 () Unit!4385)

(assert (=> d!20296 (= lt!102709 lt!102701)))

(assert (=> d!20296 (isPrefixOf!0 lt!102712 (_2!2998 lt!102432))))

(assert (=> d!20296 (= lt!102701 (lemmaIsPrefixTransitive!0 lt!102712 (_2!2998 lt!102430) (_2!2998 lt!102432)))))

(declare-fun lt!102716 () Unit!4385)

(declare-fun e!42816 () Unit!4385)

(assert (=> d!20296 (= lt!102716 e!42816)))

(declare-fun c!4689 () Bool)

(assert (=> d!20296 (= c!4689 (not (= (size!1298 (buf!1679 (_2!2998 lt!102430))) #b00000000000000000000000000000000)))))

(declare-fun lt!102704 () Unit!4385)

(declare-fun lt!102705 () Unit!4385)

(assert (=> d!20296 (= lt!102704 lt!102705)))

(assert (=> d!20296 (isPrefixOf!0 (_2!2998 lt!102432) (_2!2998 lt!102432))))

(assert (=> d!20296 (= lt!102705 (lemmaIsPrefixRefl!0 (_2!2998 lt!102432)))))

(declare-fun lt!102703 () Unit!4385)

(declare-fun lt!102717 () Unit!4385)

(assert (=> d!20296 (= lt!102703 lt!102717)))

(assert (=> d!20296 (= lt!102717 (lemmaIsPrefixRefl!0 (_2!2998 lt!102432)))))

(declare-fun lt!102714 () Unit!4385)

(declare-fun lt!102710 () Unit!4385)

(assert (=> d!20296 (= lt!102714 lt!102710)))

(assert (=> d!20296 (isPrefixOf!0 lt!102712 lt!102712)))

(assert (=> d!20296 (= lt!102710 (lemmaIsPrefixRefl!0 lt!102712))))

(declare-fun lt!102713 () Unit!4385)

(declare-fun lt!102711 () Unit!4385)

(assert (=> d!20296 (= lt!102713 lt!102711)))

(assert (=> d!20296 (isPrefixOf!0 (_2!2998 lt!102430) (_2!2998 lt!102430))))

(assert (=> d!20296 (= lt!102711 (lemmaIsPrefixRefl!0 (_2!2998 lt!102430)))))

(assert (=> d!20296 (= lt!102712 (BitStream!2243 (buf!1679 (_2!2998 lt!102432)) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))))))

(assert (=> d!20296 (isPrefixOf!0 (_2!2998 lt!102430) (_2!2998 lt!102432))))

(assert (=> d!20296 (= (reader!0 (_2!2998 lt!102430) (_2!2998 lt!102432)) lt!102700)))

(declare-fun b!64944 () Bool)

(declare-fun Unit!4401 () Unit!4385)

(assert (=> b!64944 (= e!42816 Unit!4401)))

(declare-fun b!64945 () Bool)

(declare-fun res!53877 () Bool)

(assert (=> b!64945 (=> (not res!53877) (not e!42815))))

(assert (=> b!64945 (= res!53877 (isPrefixOf!0 (_1!2997 lt!102700) (_2!2998 lt!102430)))))

(declare-fun lt!102706 () (_ BitVec 64))

(declare-fun b!64946 () Bool)

(declare-fun lt!102707 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2242 (_ BitVec 64)) BitStream!2242)

(assert (=> b!64946 (= e!42815 (= (_1!2997 lt!102700) (withMovedBitIndex!0 (_2!2997 lt!102700) (bvsub lt!102707 lt!102706))))))

(assert (=> b!64946 (or (= (bvand lt!102707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102706 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102707 lt!102706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64946 (= lt!102706 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102432))) (currentByte!3339 (_2!2998 lt!102432)) (currentBit!3334 (_2!2998 lt!102432))))))

(assert (=> b!64946 (= lt!102707 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))))))

(declare-fun b!64947 () Bool)

(declare-fun lt!102708 () Unit!4385)

(assert (=> b!64947 (= e!42816 lt!102708)))

(declare-fun lt!102699 () (_ BitVec 64))

(assert (=> b!64947 (= lt!102699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102715 () (_ BitVec 64))

(assert (=> b!64947 (= lt!102715 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2824 array!2824 (_ BitVec 64) (_ BitVec 64)) Unit!4385)

(assert (=> b!64947 (= lt!102708 (arrayBitRangesEqSymmetric!0 (buf!1679 (_2!2998 lt!102430)) (buf!1679 (_2!2998 lt!102432)) lt!102699 lt!102715))))

(assert (=> b!64947 (arrayBitRangesEq!0 (buf!1679 (_2!2998 lt!102432)) (buf!1679 (_2!2998 lt!102430)) lt!102699 lt!102715)))

(declare-fun b!64948 () Bool)

(declare-fun res!53876 () Bool)

(assert (=> b!64948 (=> (not res!53876) (not e!42815))))

(assert (=> b!64948 (= res!53876 (isPrefixOf!0 (_2!2997 lt!102700) (_2!2998 lt!102432)))))

(assert (= (and d!20296 c!4689) b!64947))

(assert (= (and d!20296 (not c!4689)) b!64944))

(assert (= (and d!20296 res!53875) b!64945))

(assert (= (and b!64945 res!53877) b!64948))

(assert (= (and b!64948 res!53876) b!64946))

(declare-fun m!103093 () Bool)

(assert (=> b!64945 m!103093))

(declare-fun m!103095 () Bool)

(assert (=> d!20296 m!103095))

(declare-fun m!103097 () Bool)

(assert (=> d!20296 m!103097))

(declare-fun m!103099 () Bool)

(assert (=> d!20296 m!103099))

(assert (=> d!20296 m!102711))

(declare-fun m!103101 () Bool)

(assert (=> d!20296 m!103101))

(declare-fun m!103103 () Bool)

(assert (=> d!20296 m!103103))

(declare-fun m!103105 () Bool)

(assert (=> d!20296 m!103105))

(declare-fun m!103107 () Bool)

(assert (=> d!20296 m!103107))

(declare-fun m!103109 () Bool)

(assert (=> d!20296 m!103109))

(declare-fun m!103111 () Bool)

(assert (=> d!20296 m!103111))

(declare-fun m!103113 () Bool)

(assert (=> d!20296 m!103113))

(declare-fun m!103115 () Bool)

(assert (=> b!64948 m!103115))

(assert (=> b!64947 m!102729))

(declare-fun m!103117 () Bool)

(assert (=> b!64947 m!103117))

(declare-fun m!103119 () Bool)

(assert (=> b!64947 m!103119))

(declare-fun m!103121 () Bool)

(assert (=> b!64946 m!103121))

(assert (=> b!64946 m!102705))

(assert (=> b!64946 m!102729))

(assert (=> b!64723 d!20296))

(declare-fun d!20300 () Bool)

(declare-fun e!42817 () Bool)

(assert (=> d!20300 e!42817))

(declare-fun res!53878 () Bool)

(assert (=> d!20300 (=> (not res!53878) (not e!42817))))

(declare-fun lt!102720 () tuple2!5772)

(assert (=> d!20300 (= res!53878 (isPrefixOf!0 (_1!2997 lt!102720) (_2!2997 lt!102720)))))

(declare-fun lt!102732 () BitStream!2242)

(assert (=> d!20300 (= lt!102720 (tuple2!5773 lt!102732 (_2!2998 lt!102432)))))

(declare-fun lt!102738 () Unit!4385)

(declare-fun lt!102722 () Unit!4385)

(assert (=> d!20300 (= lt!102738 lt!102722)))

(assert (=> d!20300 (isPrefixOf!0 lt!102732 (_2!2998 lt!102432))))

(assert (=> d!20300 (= lt!102722 (lemmaIsPrefixTransitive!0 lt!102732 (_2!2998 lt!102432) (_2!2998 lt!102432)))))

(declare-fun lt!102729 () Unit!4385)

(declare-fun lt!102721 () Unit!4385)

(assert (=> d!20300 (= lt!102729 lt!102721)))

(assert (=> d!20300 (isPrefixOf!0 lt!102732 (_2!2998 lt!102432))))

(assert (=> d!20300 (= lt!102721 (lemmaIsPrefixTransitive!0 lt!102732 thiss!1379 (_2!2998 lt!102432)))))

(declare-fun lt!102736 () Unit!4385)

(declare-fun e!42818 () Unit!4385)

(assert (=> d!20300 (= lt!102736 e!42818)))

(declare-fun c!4690 () Bool)

(assert (=> d!20300 (= c!4690 (not (= (size!1298 (buf!1679 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!102724 () Unit!4385)

(declare-fun lt!102725 () Unit!4385)

(assert (=> d!20300 (= lt!102724 lt!102725)))

(assert (=> d!20300 (isPrefixOf!0 (_2!2998 lt!102432) (_2!2998 lt!102432))))

(assert (=> d!20300 (= lt!102725 (lemmaIsPrefixRefl!0 (_2!2998 lt!102432)))))

(declare-fun lt!102723 () Unit!4385)

(declare-fun lt!102737 () Unit!4385)

(assert (=> d!20300 (= lt!102723 lt!102737)))

(assert (=> d!20300 (= lt!102737 (lemmaIsPrefixRefl!0 (_2!2998 lt!102432)))))

(declare-fun lt!102734 () Unit!4385)

(declare-fun lt!102730 () Unit!4385)

(assert (=> d!20300 (= lt!102734 lt!102730)))

(assert (=> d!20300 (isPrefixOf!0 lt!102732 lt!102732)))

(assert (=> d!20300 (= lt!102730 (lemmaIsPrefixRefl!0 lt!102732))))

(declare-fun lt!102733 () Unit!4385)

(declare-fun lt!102731 () Unit!4385)

(assert (=> d!20300 (= lt!102733 lt!102731)))

(assert (=> d!20300 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20300 (= lt!102731 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20300 (= lt!102732 (BitStream!2243 (buf!1679 (_2!2998 lt!102432)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)))))

(assert (=> d!20300 (isPrefixOf!0 thiss!1379 (_2!2998 lt!102432))))

(assert (=> d!20300 (= (reader!0 thiss!1379 (_2!2998 lt!102432)) lt!102720)))

(declare-fun b!64949 () Bool)

(declare-fun Unit!4402 () Unit!4385)

(assert (=> b!64949 (= e!42818 Unit!4402)))

(declare-fun b!64950 () Bool)

(declare-fun res!53880 () Bool)

(assert (=> b!64950 (=> (not res!53880) (not e!42817))))

(assert (=> b!64950 (= res!53880 (isPrefixOf!0 (_1!2997 lt!102720) thiss!1379))))

(declare-fun b!64951 () Bool)

(declare-fun lt!102726 () (_ BitVec 64))

(declare-fun lt!102727 () (_ BitVec 64))

(assert (=> b!64951 (= e!42817 (= (_1!2997 lt!102720) (withMovedBitIndex!0 (_2!2997 lt!102720) (bvsub lt!102727 lt!102726))))))

(assert (=> b!64951 (or (= (bvand lt!102727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102726 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102727 lt!102726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64951 (= lt!102726 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102432))) (currentByte!3339 (_2!2998 lt!102432)) (currentBit!3334 (_2!2998 lt!102432))))))

(assert (=> b!64951 (= lt!102727 (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)))))

(declare-fun b!64952 () Bool)

(declare-fun lt!102728 () Unit!4385)

(assert (=> b!64952 (= e!42818 lt!102728)))

(declare-fun lt!102719 () (_ BitVec 64))

(assert (=> b!64952 (= lt!102719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102735 () (_ BitVec 64))

(assert (=> b!64952 (= lt!102735 (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)))))

(assert (=> b!64952 (= lt!102728 (arrayBitRangesEqSymmetric!0 (buf!1679 thiss!1379) (buf!1679 (_2!2998 lt!102432)) lt!102719 lt!102735))))

(assert (=> b!64952 (arrayBitRangesEq!0 (buf!1679 (_2!2998 lt!102432)) (buf!1679 thiss!1379) lt!102719 lt!102735)))

(declare-fun b!64953 () Bool)

(declare-fun res!53879 () Bool)

(assert (=> b!64953 (=> (not res!53879) (not e!42817))))

(assert (=> b!64953 (= res!53879 (isPrefixOf!0 (_2!2997 lt!102720) (_2!2998 lt!102432)))))

(assert (= (and d!20300 c!4690) b!64952))

(assert (= (and d!20300 (not c!4690)) b!64949))

(assert (= (and d!20300 res!53878) b!64950))

(assert (= (and b!64950 res!53880) b!64953))

(assert (= (and b!64953 res!53879) b!64951))

(declare-fun m!103123 () Bool)

(assert (=> b!64950 m!103123))

(assert (=> d!20300 m!102725))

(assert (=> d!20300 m!103097))

(assert (=> d!20300 m!103099))

(assert (=> d!20300 m!102715))

(declare-fun m!103125 () Bool)

(assert (=> d!20300 m!103125))

(declare-fun m!103127 () Bool)

(assert (=> d!20300 m!103127))

(assert (=> d!20300 m!102723))

(declare-fun m!103129 () Bool)

(assert (=> d!20300 m!103129))

(declare-fun m!103131 () Bool)

(assert (=> d!20300 m!103131))

(declare-fun m!103133 () Bool)

(assert (=> d!20300 m!103133))

(declare-fun m!103135 () Bool)

(assert (=> d!20300 m!103135))

(declare-fun m!103137 () Bool)

(assert (=> b!64953 m!103137))

(assert (=> b!64952 m!102727))

(declare-fun m!103139 () Bool)

(assert (=> b!64952 m!103139))

(declare-fun m!103141 () Bool)

(assert (=> b!64952 m!103141))

(declare-fun m!103143 () Bool)

(assert (=> b!64951 m!103143))

(assert (=> b!64951 m!102705))

(assert (=> b!64951 m!102727))

(assert (=> b!64723 d!20300))

(declare-fun d!20302 () Bool)

(assert (=> d!20302 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4971 () Bool)

(assert (= bs!4971 d!20302))

(declare-fun m!103145 () Bool)

(assert (=> bs!4971 m!103145))

(assert (=> b!64723 d!20302))

(declare-fun b!64962 () Bool)

(declare-datatypes ((tuple2!5792 0))(
  ( (tuple2!5793 (_1!3007 List!696) (_2!3007 BitStream!2242)) )
))
(declare-fun e!42823 () tuple2!5792)

(assert (=> b!64962 (= e!42823 (tuple2!5793 Nil!693 (_1!2997 lt!102437)))))

(declare-fun d!20304 () Bool)

(declare-fun e!42824 () Bool)

(assert (=> d!20304 e!42824))

(declare-fun c!4695 () Bool)

(assert (=> d!20304 (= c!4695 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102747 () List!696)

(assert (=> d!20304 (= lt!102747 (_1!3007 e!42823))))

(declare-fun c!4696 () Bool)

(assert (=> d!20304 (= c!4696 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20304 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20304 (= (bitStreamReadBitsIntoList!0 (_2!2998 lt!102432) (_1!2997 lt!102437) (bvsub to!314 i!635)) lt!102747)))

(declare-fun b!64964 () Bool)

(declare-fun isEmpty!202 (List!696) Bool)

(assert (=> b!64964 (= e!42824 (isEmpty!202 lt!102747))))

(declare-fun b!64965 () Bool)

(assert (=> b!64965 (= e!42824 (> (length!324 lt!102747) 0))))

(declare-datatypes ((tuple2!5794 0))(
  ( (tuple2!5795 (_1!3008 Bool) (_2!3008 BitStream!2242)) )
))
(declare-fun lt!102746 () tuple2!5794)

(declare-fun lt!102745 () (_ BitVec 64))

(declare-fun b!64963 () Bool)

(assert (=> b!64963 (= e!42823 (tuple2!5793 (Cons!692 (_1!3008 lt!102746) (bitStreamReadBitsIntoList!0 (_2!2998 lt!102432) (_2!3008 lt!102746) (bvsub (bvsub to!314 i!635) lt!102745))) (_2!3008 lt!102746)))))

(declare-fun readBit!0 (BitStream!2242) tuple2!5794)

(assert (=> b!64963 (= lt!102746 (readBit!0 (_1!2997 lt!102437)))))

(assert (=> b!64963 (= lt!102745 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20304 c!4696) b!64962))

(assert (= (and d!20304 (not c!4696)) b!64963))

(assert (= (and d!20304 c!4695) b!64964))

(assert (= (and d!20304 (not c!4695)) b!64965))

(declare-fun m!103147 () Bool)

(assert (=> b!64964 m!103147))

(declare-fun m!103149 () Bool)

(assert (=> b!64965 m!103149))

(declare-fun m!103151 () Bool)

(assert (=> b!64963 m!103151))

(declare-fun m!103153 () Bool)

(assert (=> b!64963 m!103153))

(assert (=> b!64723 d!20304))

(declare-fun d!20306 () Bool)

(assert (=> d!20306 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) lt!102431)))

(declare-fun lt!102756 () Unit!4385)

(declare-fun choose!9 (BitStream!2242 array!2824 (_ BitVec 64) BitStream!2242) Unit!4385)

(assert (=> d!20306 (= lt!102756 (choose!9 (_2!2998 lt!102430) (buf!1679 (_2!2998 lt!102432)) lt!102431 (BitStream!2243 (buf!1679 (_2!2998 lt!102432)) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430)))))))

(assert (=> d!20306 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2998 lt!102430) (buf!1679 (_2!2998 lt!102432)) lt!102431) lt!102756)))

(declare-fun bs!4972 () Bool)

(assert (= bs!4972 d!20306))

(assert (=> bs!4972 m!102773))

(declare-fun m!103155 () Bool)

(assert (=> bs!4972 m!103155))

(assert (=> b!64723 d!20306))

(declare-fun b!64974 () Bool)

(declare-fun e!42829 () tuple2!5792)

(assert (=> b!64974 (= e!42829 (tuple2!5793 Nil!693 (_1!2997 lt!102426)))))

(declare-fun d!20308 () Bool)

(declare-fun e!42830 () Bool)

(assert (=> d!20308 e!42830))

(declare-fun c!4701 () Bool)

(assert (=> d!20308 (= c!4701 (= lt!102431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102759 () List!696)

(assert (=> d!20308 (= lt!102759 (_1!3007 e!42829))))

(declare-fun c!4702 () Bool)

(assert (=> d!20308 (= c!4702 (= lt!102431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20308 (bvsge lt!102431 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20308 (= (bitStreamReadBitsIntoList!0 (_2!2998 lt!102432) (_1!2997 lt!102426) lt!102431) lt!102759)))

(declare-fun b!64976 () Bool)

(assert (=> b!64976 (= e!42830 (isEmpty!202 lt!102759))))

(declare-fun b!64977 () Bool)

(assert (=> b!64977 (= e!42830 (> (length!324 lt!102759) 0))))

(declare-fun lt!102757 () (_ BitVec 64))

(declare-fun b!64975 () Bool)

(declare-fun lt!102758 () tuple2!5794)

(assert (=> b!64975 (= e!42829 (tuple2!5793 (Cons!692 (_1!3008 lt!102758) (bitStreamReadBitsIntoList!0 (_2!2998 lt!102432) (_2!3008 lt!102758) (bvsub lt!102431 lt!102757))) (_2!3008 lt!102758)))))

(assert (=> b!64975 (= lt!102758 (readBit!0 (_1!2997 lt!102426)))))

(assert (=> b!64975 (= lt!102757 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20308 c!4702) b!64974))

(assert (= (and d!20308 (not c!4702)) b!64975))

(assert (= (and d!20308 c!4701) b!64976))

(assert (= (and d!20308 (not c!4701)) b!64977))

(declare-fun m!103157 () Bool)

(assert (=> b!64976 m!103157))

(declare-fun m!103159 () Bool)

(assert (=> b!64977 m!103159))

(declare-fun m!103161 () Bool)

(assert (=> b!64975 m!103161))

(declare-fun m!103163 () Bool)

(assert (=> b!64975 m!103163))

(assert (=> b!64723 d!20308))

(declare-fun d!20310 () Bool)

(assert (=> d!20310 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!102760 () Unit!4385)

(assert (=> d!20310 (= lt!102760 (choose!9 thiss!1379 (buf!1679 (_2!2998 lt!102432)) (bvsub to!314 i!635) (BitStream!2243 (buf!1679 (_2!2998 lt!102432)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379))))))

(assert (=> d!20310 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1679 (_2!2998 lt!102432)) (bvsub to!314 i!635)) lt!102760)))

(declare-fun bs!4973 () Bool)

(assert (= bs!4973 d!20310))

(assert (=> bs!4973 m!102775))

(declare-fun m!103165 () Bool)

(assert (=> bs!4973 m!103165))

(assert (=> b!64723 d!20310))

(declare-fun d!20312 () Bool)

(declare-fun res!53883 () Bool)

(declare-fun e!42832 () Bool)

(assert (=> d!20312 (=> (not res!53883) (not e!42832))))

(assert (=> d!20312 (= res!53883 (= (size!1298 (buf!1679 thiss!1379)) (size!1298 (buf!1679 (_2!2998 lt!102430)))))))

(assert (=> d!20312 (= (isPrefixOf!0 thiss!1379 (_2!2998 lt!102430)) e!42832)))

(declare-fun b!64978 () Bool)

(declare-fun res!53881 () Bool)

(assert (=> b!64978 (=> (not res!53881) (not e!42832))))

(assert (=> b!64978 (= res!53881 (bvsle (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)) (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430)))))))

(declare-fun b!64979 () Bool)

(declare-fun e!42831 () Bool)

(assert (=> b!64979 (= e!42832 e!42831)))

(declare-fun res!53882 () Bool)

(assert (=> b!64979 (=> res!53882 e!42831)))

(assert (=> b!64979 (= res!53882 (= (size!1298 (buf!1679 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64980 () Bool)

(assert (=> b!64980 (= e!42831 (arrayBitRangesEq!0 (buf!1679 thiss!1379) (buf!1679 (_2!2998 lt!102430)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379))))))

(assert (= (and d!20312 res!53883) b!64978))

(assert (= (and b!64978 res!53881) b!64979))

(assert (= (and b!64979 (not res!53882)) b!64980))

(assert (=> b!64978 m!102727))

(assert (=> b!64978 m!102729))

(assert (=> b!64980 m!102727))

(assert (=> b!64980 m!102727))

(declare-fun m!103167 () Bool)

(assert (=> b!64980 m!103167))

(assert (=> b!64733 d!20312))

(declare-fun d!20314 () Bool)

(assert (=> d!20314 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) lt!102431) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430)))) lt!102431))))

(declare-fun bs!4974 () Bool)

(assert (= bs!4974 d!20314))

(declare-fun m!103169 () Bool)

(assert (=> bs!4974 m!103169))

(assert (=> b!64733 d!20314))

(declare-fun d!20316 () Bool)

(declare-fun e!42837 () Bool)

(assert (=> d!20316 e!42837))

(declare-fun res!53886 () Bool)

(assert (=> d!20316 (=> (not res!53886) (not e!42837))))

(assert (=> d!20316 (= res!53886 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!102768 () Unit!4385)

(declare-fun choose!27 (BitStream!2242 BitStream!2242 (_ BitVec 64) (_ BitVec 64)) Unit!4385)

(assert (=> d!20316 (= lt!102768 (choose!27 thiss!1379 (_2!2998 lt!102430) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20316 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20316 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2998 lt!102430) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102768)))

(declare-fun b!64987 () Bool)

(assert (=> b!64987 (= e!42837 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20316 res!53886) b!64987))

(declare-fun m!103179 () Bool)

(assert (=> d!20316 m!103179))

(declare-fun m!103181 () Bool)

(assert (=> b!64987 m!103181))

(assert (=> b!64733 d!20316))

(declare-fun b!65048 () Bool)

(declare-fun e!42868 () Bool)

(declare-fun e!42870 () Bool)

(assert (=> b!65048 (= e!42868 e!42870)))

(declare-fun res!53931 () Bool)

(assert (=> b!65048 (=> (not res!53931) (not e!42870))))

(declare-datatypes ((tuple2!5796 0))(
  ( (tuple2!5797 (_1!3009 BitStream!2242) (_2!3009 Bool)) )
))
(declare-fun lt!102889 () tuple2!5796)

(declare-fun lt!102886 () tuple2!5774)

(declare-fun lt!102888 () Bool)

(assert (=> b!65048 (= res!53931 (and (= (_2!3009 lt!102889) lt!102888) (= (_1!3009 lt!102889) (_2!2998 lt!102886))))))

(declare-fun readBitPure!0 (BitStream!2242) tuple2!5796)

(declare-fun readerFrom!0 (BitStream!2242 (_ BitVec 32) (_ BitVec 32)) BitStream!2242)

(assert (=> b!65048 (= lt!102889 (readBitPure!0 (readerFrom!0 (_2!2998 lt!102886) (currentBit!3334 thiss!1379) (currentByte!3339 thiss!1379))))))

(declare-fun b!65049 () Bool)

(declare-fun e!42869 () Bool)

(declare-fun lt!102884 () tuple2!5796)

(declare-fun lt!102887 () tuple2!5774)

(assert (=> b!65049 (= e!42869 (= (bitIndex!0 (size!1298 (buf!1679 (_1!3009 lt!102884))) (currentByte!3339 (_1!3009 lt!102884)) (currentBit!3334 (_1!3009 lt!102884))) (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102887))) (currentByte!3339 (_2!2998 lt!102887)) (currentBit!3334 (_2!2998 lt!102887)))))))

(declare-fun b!65050 () Bool)

(declare-fun res!53928 () Bool)

(assert (=> b!65050 (=> (not res!53928) (not e!42868))))

(assert (=> b!65050 (= res!53928 (= (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102886))) (currentByte!3339 (_2!2998 lt!102886)) (currentBit!3334 (_2!2998 lt!102886))) (bvadd (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!65051 () Bool)

(declare-fun e!42867 () Bool)

(assert (=> b!65051 (= e!42867 e!42869)))

(declare-fun res!53929 () Bool)

(assert (=> b!65051 (=> (not res!53929) (not e!42869))))

(declare-fun lt!102881 () (_ BitVec 8))

(assert (=> b!65051 (= res!53929 (and (= (_2!3009 lt!102884) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1862 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!102881)) #b00000000000000000000000000000000))) (= (_1!3009 lt!102884) (_2!2998 lt!102887))))))

(declare-datatypes ((tuple2!5798 0))(
  ( (tuple2!5799 (_1!3010 array!2824) (_2!3010 BitStream!2242)) )
))
(declare-fun lt!102891 () tuple2!5798)

(declare-fun lt!102890 () BitStream!2242)

(declare-fun readBits!0 (BitStream!2242 (_ BitVec 64)) tuple2!5798)

(assert (=> b!65051 (= lt!102891 (readBits!0 lt!102890 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!65051 (= lt!102884 (readBitPure!0 lt!102890))))

(assert (=> b!65051 (= lt!102890 (readerFrom!0 (_2!2998 lt!102887) (currentBit!3334 thiss!1379) (currentByte!3339 thiss!1379)))))

(declare-fun b!65052 () Bool)

(declare-fun res!53924 () Bool)

(assert (=> b!65052 (=> (not res!53924) (not e!42867))))

(assert (=> b!65052 (= res!53924 (isPrefixOf!0 thiss!1379 (_2!2998 lt!102887)))))

(declare-fun b!65053 () Bool)

(declare-fun res!53925 () Bool)

(assert (=> b!65053 (=> (not res!53925) (not e!42867))))

(declare-fun lt!102892 () (_ BitVec 64))

(declare-fun lt!102885 () (_ BitVec 64))

(assert (=> b!65053 (= res!53925 (= (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102887))) (currentByte!3339 (_2!2998 lt!102887)) (currentBit!3334 (_2!2998 lt!102887))) (bvadd lt!102892 lt!102885)))))

(assert (=> b!65053 (or (not (= (bvand lt!102892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102885 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!102892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!102892 lt!102885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65053 (= lt!102885 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!65053 (= lt!102892 (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)))))

(declare-fun b!65054 () Bool)

(declare-fun res!53930 () Bool)

(assert (=> b!65054 (=> (not res!53930) (not e!42868))))

(assert (=> b!65054 (= res!53930 (isPrefixOf!0 thiss!1379 (_2!2998 lt!102886)))))

(declare-fun d!20320 () Bool)

(assert (=> d!20320 e!42867))

(declare-fun res!53926 () Bool)

(assert (=> d!20320 (=> (not res!53926) (not e!42867))))

(assert (=> d!20320 (= res!53926 (= (size!1298 (buf!1679 (_2!2998 lt!102887))) (size!1298 (buf!1679 thiss!1379))))))

(declare-fun lt!102883 () array!2824)

(assert (=> d!20320 (= lt!102881 (select (arr!1862 lt!102883) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20320 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1298 lt!102883)))))

(assert (=> d!20320 (= lt!102883 (array!2825 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!102882 () tuple2!5774)

(assert (=> d!20320 (= lt!102887 (tuple2!5775 (_1!2998 lt!102882) (_2!2998 lt!102882)))))

(assert (=> d!20320 (= lt!102882 lt!102886)))

(assert (=> d!20320 e!42868))

(declare-fun res!53927 () Bool)

(assert (=> d!20320 (=> (not res!53927) (not e!42868))))

(assert (=> d!20320 (= res!53927 (= (size!1298 (buf!1679 thiss!1379)) (size!1298 (buf!1679 (_2!2998 lt!102886)))))))

(declare-fun appendBit!0 (BitStream!2242 Bool) tuple2!5774)

(assert (=> d!20320 (= lt!102886 (appendBit!0 thiss!1379 lt!102888))))

(assert (=> d!20320 (= lt!102888 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1862 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20320 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20320 (= (appendBitFromByte!0 thiss!1379 (select (arr!1862 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!102887)))

(declare-fun b!65055 () Bool)

(assert (=> b!65055 (= e!42870 (= (bitIndex!0 (size!1298 (buf!1679 (_1!3009 lt!102889))) (currentByte!3339 (_1!3009 lt!102889)) (currentBit!3334 (_1!3009 lt!102889))) (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102886))) (currentByte!3339 (_2!2998 lt!102886)) (currentBit!3334 (_2!2998 lt!102886)))))))

(assert (= (and d!20320 res!53927) b!65050))

(assert (= (and b!65050 res!53928) b!65054))

(assert (= (and b!65054 res!53930) b!65048))

(assert (= (and b!65048 res!53931) b!65055))

(assert (= (and d!20320 res!53926) b!65053))

(assert (= (and b!65053 res!53925) b!65052))

(assert (= (and b!65052 res!53924) b!65051))

(assert (= (and b!65051 res!53929) b!65049))

(declare-fun m!103269 () Bool)

(assert (=> b!65048 m!103269))

(assert (=> b!65048 m!103269))

(declare-fun m!103271 () Bool)

(assert (=> b!65048 m!103271))

(declare-fun m!103273 () Bool)

(assert (=> b!65053 m!103273))

(assert (=> b!65053 m!102727))

(declare-fun m!103275 () Bool)

(assert (=> b!65050 m!103275))

(assert (=> b!65050 m!102727))

(declare-fun m!103277 () Bool)

(assert (=> b!65051 m!103277))

(declare-fun m!103279 () Bool)

(assert (=> b!65051 m!103279))

(declare-fun m!103281 () Bool)

(assert (=> b!65051 m!103281))

(declare-fun m!103283 () Bool)

(assert (=> b!65049 m!103283))

(assert (=> b!65049 m!103273))

(declare-fun m!103285 () Bool)

(assert (=> b!65054 m!103285))

(declare-fun m!103287 () Bool)

(assert (=> d!20320 m!103287))

(declare-fun m!103289 () Bool)

(assert (=> d!20320 m!103289))

(declare-fun m!103291 () Bool)

(assert (=> d!20320 m!103291))

(declare-fun m!103293 () Bool)

(assert (=> b!65055 m!103293))

(assert (=> b!65055 m!103275))

(declare-fun m!103295 () Bool)

(assert (=> b!65052 m!103295))

(assert (=> b!64733 d!20320))

(declare-fun d!20352 () Bool)

(declare-fun e!42882 () Bool)

(assert (=> d!20352 e!42882))

(declare-fun res!53951 () Bool)

(assert (=> d!20352 (=> (not res!53951) (not e!42882))))

(declare-fun lt!102925 () (_ BitVec 64))

(declare-fun lt!102924 () (_ BitVec 64))

(declare-fun lt!102927 () (_ BitVec 64))

(assert (=> d!20352 (= res!53951 (= lt!102925 (bvsub lt!102927 lt!102924)))))

(assert (=> d!20352 (or (= (bvand lt!102927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102924 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102927 lt!102924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20352 (= lt!102924 (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430)))))))

(declare-fun lt!102926 () (_ BitVec 64))

(declare-fun lt!102928 () (_ BitVec 64))

(assert (=> d!20352 (= lt!102927 (bvmul lt!102926 lt!102928))))

(assert (=> d!20352 (or (= lt!102926 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102928 (bvsdiv (bvmul lt!102926 lt!102928) lt!102926)))))

(assert (=> d!20352 (= lt!102928 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20352 (= lt!102926 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))))))

(assert (=> d!20352 (= lt!102925 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430)))))))

(assert (=> d!20352 (invariant!0 (currentBit!3334 (_2!2998 lt!102430)) (currentByte!3339 (_2!2998 lt!102430)) (size!1298 (buf!1679 (_2!2998 lt!102430))))))

(assert (=> d!20352 (= (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))) lt!102925)))

(declare-fun b!65075 () Bool)

(declare-fun res!53952 () Bool)

(assert (=> b!65075 (=> (not res!53952) (not e!42882))))

(assert (=> b!65075 (= res!53952 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102925))))

(declare-fun b!65076 () Bool)

(declare-fun lt!102923 () (_ BitVec 64))

(assert (=> b!65076 (= e!42882 (bvsle lt!102925 (bvmul lt!102923 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65076 (or (= lt!102923 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102923 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102923)))))

(assert (=> b!65076 (= lt!102923 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))))))

(assert (= (and d!20352 res!53951) b!65075))

(assert (= (and b!65075 res!53952) b!65076))

(assert (=> d!20352 m!103169))

(assert (=> d!20352 m!102721))

(assert (=> b!64722 d!20352))

(declare-fun d!20366 () Bool)

(declare-fun e!42883 () Bool)

(assert (=> d!20366 e!42883))

(declare-fun res!53953 () Bool)

(assert (=> d!20366 (=> (not res!53953) (not e!42883))))

(declare-fun lt!102930 () (_ BitVec 64))

(declare-fun lt!102931 () (_ BitVec 64))

(declare-fun lt!102933 () (_ BitVec 64))

(assert (=> d!20366 (= res!53953 (= lt!102931 (bvsub lt!102933 lt!102930)))))

(assert (=> d!20366 (or (= (bvand lt!102933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102930 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102933 lt!102930) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20366 (= lt!102930 (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 (_1!2997 lt!102437)))) ((_ sign_extend 32) (currentByte!3339 (_1!2997 lt!102437))) ((_ sign_extend 32) (currentBit!3334 (_1!2997 lt!102437)))))))

(declare-fun lt!102932 () (_ BitVec 64))

(declare-fun lt!102934 () (_ BitVec 64))

(assert (=> d!20366 (= lt!102933 (bvmul lt!102932 lt!102934))))

(assert (=> d!20366 (or (= lt!102932 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102934 (bvsdiv (bvmul lt!102932 lt!102934) lt!102932)))))

(assert (=> d!20366 (= lt!102934 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20366 (= lt!102932 ((_ sign_extend 32) (size!1298 (buf!1679 (_1!2997 lt!102437)))))))

(assert (=> d!20366 (= lt!102931 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3339 (_1!2997 lt!102437))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3334 (_1!2997 lt!102437)))))))

(assert (=> d!20366 (invariant!0 (currentBit!3334 (_1!2997 lt!102437)) (currentByte!3339 (_1!2997 lt!102437)) (size!1298 (buf!1679 (_1!2997 lt!102437))))))

(assert (=> d!20366 (= (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102437))) (currentByte!3339 (_1!2997 lt!102437)) (currentBit!3334 (_1!2997 lt!102437))) lt!102931)))

(declare-fun b!65077 () Bool)

(declare-fun res!53954 () Bool)

(assert (=> b!65077 (=> (not res!53954) (not e!42883))))

(assert (=> b!65077 (= res!53954 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102931))))

(declare-fun b!65078 () Bool)

(declare-fun lt!102929 () (_ BitVec 64))

(assert (=> b!65078 (= e!42883 (bvsle lt!102931 (bvmul lt!102929 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65078 (or (= lt!102929 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102929 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102929)))))

(assert (=> b!65078 (= lt!102929 ((_ sign_extend 32) (size!1298 (buf!1679 (_1!2997 lt!102437)))))))

(assert (= (and d!20366 res!53953) b!65077))

(assert (= (and b!65077 res!53954) b!65078))

(assert (=> d!20366 m!103089))

(declare-fun m!103307 () Bool)

(assert (=> d!20366 m!103307))

(assert (=> b!64729 d!20366))

(declare-fun d!20368 () Bool)

(declare-fun e!42884 () Bool)

(assert (=> d!20368 e!42884))

(declare-fun res!53955 () Bool)

(assert (=> d!20368 (=> (not res!53955) (not e!42884))))

(declare-fun lt!102939 () (_ BitVec 64))

(declare-fun lt!102937 () (_ BitVec 64))

(declare-fun lt!102936 () (_ BitVec 64))

(assert (=> d!20368 (= res!53955 (= lt!102937 (bvsub lt!102939 lt!102936)))))

(assert (=> d!20368 (or (= (bvand lt!102939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102936 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102939 lt!102936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20368 (= lt!102936 (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 (_1!2997 lt!102426)))) ((_ sign_extend 32) (currentByte!3339 (_1!2997 lt!102426))) ((_ sign_extend 32) (currentBit!3334 (_1!2997 lt!102426)))))))

(declare-fun lt!102938 () (_ BitVec 64))

(declare-fun lt!102942 () (_ BitVec 64))

(assert (=> d!20368 (= lt!102939 (bvmul lt!102938 lt!102942))))

(assert (=> d!20368 (or (= lt!102938 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102942 (bvsdiv (bvmul lt!102938 lt!102942) lt!102938)))))

(assert (=> d!20368 (= lt!102942 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20368 (= lt!102938 ((_ sign_extend 32) (size!1298 (buf!1679 (_1!2997 lt!102426)))))))

(assert (=> d!20368 (= lt!102937 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3339 (_1!2997 lt!102426))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3334 (_1!2997 lt!102426)))))))

(assert (=> d!20368 (invariant!0 (currentBit!3334 (_1!2997 lt!102426)) (currentByte!3339 (_1!2997 lt!102426)) (size!1298 (buf!1679 (_1!2997 lt!102426))))))

(assert (=> d!20368 (= (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102426))) (currentByte!3339 (_1!2997 lt!102426)) (currentBit!3334 (_1!2997 lt!102426))) lt!102937)))

(declare-fun b!65079 () Bool)

(declare-fun res!53956 () Bool)

(assert (=> b!65079 (=> (not res!53956) (not e!42884))))

(assert (=> b!65079 (= res!53956 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102937))))

(declare-fun b!65080 () Bool)

(declare-fun lt!102935 () (_ BitVec 64))

(assert (=> b!65080 (= e!42884 (bvsle lt!102937 (bvmul lt!102935 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65080 (or (= lt!102935 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102935 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102935)))))

(assert (=> b!65080 (= lt!102935 ((_ sign_extend 32) (size!1298 (buf!1679 (_1!2997 lt!102426)))))))

(assert (= (and d!20368 res!53955) b!65079))

(assert (= (and b!65079 res!53956) b!65080))

(declare-fun m!103309 () Bool)

(assert (=> d!20368 m!103309))

(declare-fun m!103311 () Bool)

(assert (=> d!20368 m!103311))

(assert (=> b!64729 d!20368))

(declare-fun d!20370 () Bool)

(assert (=> d!20370 (= (head!515 (byteArrayBitContentToList!0 (_2!2998 lt!102430) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!811 (byteArrayBitContentToList!0 (_2!2998 lt!102430) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64731 d!20370))

(declare-fun d!20374 () Bool)

(declare-fun c!4719 () Bool)

(assert (=> d!20374 (= c!4719 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42893 () List!696)

(assert (=> d!20374 (= (byteArrayBitContentToList!0 (_2!2998 lt!102430) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!42893)))

(declare-fun b!65097 () Bool)

(assert (=> b!65097 (= e!42893 Nil!693)))

(declare-fun b!65098 () Bool)

(assert (=> b!65098 (= e!42893 (Cons!692 (not (= (bvand ((_ sign_extend 24) (select (arr!1862 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2998 lt!102430) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20374 c!4719) b!65097))

(assert (= (and d!20374 (not c!4719)) b!65098))

(assert (=> b!65098 m!102739))

(assert (=> b!65098 m!103291))

(declare-fun m!103343 () Bool)

(assert (=> b!65098 m!103343))

(assert (=> b!64731 d!20374))

(declare-fun d!20384 () Bool)

(assert (=> d!20384 (= (head!515 (bitStreamReadBitsIntoList!0 (_2!2998 lt!102430) (_1!2997 lt!102436) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!811 (bitStreamReadBitsIntoList!0 (_2!2998 lt!102430) (_1!2997 lt!102436) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64731 d!20384))

(declare-fun b!65099 () Bool)

(declare-fun e!42894 () tuple2!5792)

(assert (=> b!65099 (= e!42894 (tuple2!5793 Nil!693 (_1!2997 lt!102436)))))

(declare-fun d!20386 () Bool)

(declare-fun e!42895 () Bool)

(assert (=> d!20386 e!42895))

(declare-fun c!4720 () Bool)

(assert (=> d!20386 (= c!4720 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102978 () List!696)

(assert (=> d!20386 (= lt!102978 (_1!3007 e!42894))))

(declare-fun c!4721 () Bool)

(assert (=> d!20386 (= c!4721 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20386 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20386 (= (bitStreamReadBitsIntoList!0 (_2!2998 lt!102430) (_1!2997 lt!102436) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102978)))

(declare-fun b!65101 () Bool)

(assert (=> b!65101 (= e!42895 (isEmpty!202 lt!102978))))

(declare-fun b!65102 () Bool)

(assert (=> b!65102 (= e!42895 (> (length!324 lt!102978) 0))))

(declare-fun lt!102976 () (_ BitVec 64))

(declare-fun b!65100 () Bool)

(declare-fun lt!102977 () tuple2!5794)

(assert (=> b!65100 (= e!42894 (tuple2!5793 (Cons!692 (_1!3008 lt!102977) (bitStreamReadBitsIntoList!0 (_2!2998 lt!102430) (_2!3008 lt!102977) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!102976))) (_2!3008 lt!102977)))))

(assert (=> b!65100 (= lt!102977 (readBit!0 (_1!2997 lt!102436)))))

(assert (=> b!65100 (= lt!102976 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!20386 c!4721) b!65099))

(assert (= (and d!20386 (not c!4721)) b!65100))

(assert (= (and d!20386 c!4720) b!65101))

(assert (= (and d!20386 (not c!4720)) b!65102))

(declare-fun m!103345 () Bool)

(assert (=> b!65101 m!103345))

(declare-fun m!103347 () Bool)

(assert (=> b!65102 m!103347))

(declare-fun m!103349 () Bool)

(assert (=> b!65100 m!103349))

(declare-fun m!103351 () Bool)

(assert (=> b!65100 m!103351))

(assert (=> b!64731 d!20386))

(declare-fun d!20388 () Bool)

(declare-fun e!42896 () Bool)

(assert (=> d!20388 e!42896))

(declare-fun res!53967 () Bool)

(assert (=> d!20388 (=> (not res!53967) (not e!42896))))

(declare-fun lt!102982 () (_ BitVec 64))

(declare-fun lt!102983 () (_ BitVec 64))

(declare-fun lt!102985 () (_ BitVec 64))

(assert (=> d!20388 (= res!53967 (= lt!102983 (bvsub lt!102985 lt!102982)))))

(assert (=> d!20388 (or (= (bvand lt!102985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102982 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102985 lt!102982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20388 (= lt!102982 (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102432))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102432)))))))

(declare-fun lt!102984 () (_ BitVec 64))

(declare-fun lt!102986 () (_ BitVec 64))

(assert (=> d!20388 (= lt!102985 (bvmul lt!102984 lt!102986))))

(assert (=> d!20388 (or (= lt!102984 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102986 (bvsdiv (bvmul lt!102984 lt!102986) lt!102984)))))

(assert (=> d!20388 (= lt!102986 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20388 (= lt!102984 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))))))

(assert (=> d!20388 (= lt!102983 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102432))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102432)))))))

(assert (=> d!20388 (invariant!0 (currentBit!3334 (_2!2998 lt!102432)) (currentByte!3339 (_2!2998 lt!102432)) (size!1298 (buf!1679 (_2!2998 lt!102432))))))

(assert (=> d!20388 (= (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102432))) (currentByte!3339 (_2!2998 lt!102432)) (currentBit!3334 (_2!2998 lt!102432))) lt!102983)))

(declare-fun b!65103 () Bool)

(declare-fun res!53968 () Bool)

(assert (=> b!65103 (=> (not res!53968) (not e!42896))))

(assert (=> b!65103 (= res!53968 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102983))))

(declare-fun b!65104 () Bool)

(declare-fun lt!102981 () (_ BitVec 64))

(assert (=> b!65104 (= e!42896 (bvsle lt!102983 (bvmul lt!102981 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65104 (or (= lt!102981 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102981 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102981)))))

(assert (=> b!65104 (= lt!102981 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102432)))))))

(assert (= (and d!20388 res!53967) b!65103))

(assert (= (and b!65103 res!53968) b!65104))

(declare-fun m!103353 () Bool)

(assert (=> d!20388 m!103353))

(assert (=> d!20388 m!102733))

(assert (=> b!64720 d!20388))

(declare-fun d!20390 () Bool)

(assert (=> d!20390 (= (array_inv!1180 srcBuffer!2) (bvsge (size!1298 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12660 d!20390))

(declare-fun d!20394 () Bool)

(assert (=> d!20394 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3334 thiss!1379) (currentByte!3339 thiss!1379) (size!1298 (buf!1679 thiss!1379))))))

(declare-fun bs!4987 () Bool)

(assert (= bs!4987 d!20394))

(declare-fun m!103361 () Bool)

(assert (=> bs!4987 m!103361))

(assert (=> start!12660 d!20394))

(declare-fun d!20400 () Bool)

(assert (=> d!20400 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 thiss!1379))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 thiss!1379))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4988 () Bool)

(assert (= bs!4988 d!20400))

(declare-fun m!103363 () Bool)

(assert (=> bs!4988 m!103363))

(assert (=> b!64730 d!20400))

(declare-fun d!20402 () Bool)

(declare-fun res!53971 () Bool)

(declare-fun e!42898 () Bool)

(assert (=> d!20402 (=> (not res!53971) (not e!42898))))

(assert (=> d!20402 (= res!53971 (= (size!1298 (buf!1679 (_1!2997 lt!102437))) (size!1298 (buf!1679 (_2!2998 lt!102432)))))))

(assert (=> d!20402 (= (isPrefixOf!0 (_1!2997 lt!102437) (_2!2998 lt!102432)) e!42898)))

(declare-fun b!65105 () Bool)

(declare-fun res!53969 () Bool)

(assert (=> b!65105 (=> (not res!53969) (not e!42898))))

(assert (=> b!65105 (= res!53969 (bvsle (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102437))) (currentByte!3339 (_1!2997 lt!102437)) (currentBit!3334 (_1!2997 lt!102437))) (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102432))) (currentByte!3339 (_2!2998 lt!102432)) (currentBit!3334 (_2!2998 lt!102432)))))))

(declare-fun b!65106 () Bool)

(declare-fun e!42897 () Bool)

(assert (=> b!65106 (= e!42898 e!42897)))

(declare-fun res!53970 () Bool)

(assert (=> b!65106 (=> res!53970 e!42897)))

(assert (=> b!65106 (= res!53970 (= (size!1298 (buf!1679 (_1!2997 lt!102437))) #b00000000000000000000000000000000))))

(declare-fun b!65107 () Bool)

(assert (=> b!65107 (= e!42897 (arrayBitRangesEq!0 (buf!1679 (_1!2997 lt!102437)) (buf!1679 (_2!2998 lt!102432)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102437))) (currentByte!3339 (_1!2997 lt!102437)) (currentBit!3334 (_1!2997 lt!102437)))))))

(assert (= (and d!20402 res!53971) b!65105))

(assert (= (and b!65105 res!53969) b!65106))

(assert (= (and b!65106 (not res!53970)) b!65107))

(assert (=> b!65105 m!102753))

(assert (=> b!65105 m!102705))

(assert (=> b!65107 m!102753))

(assert (=> b!65107 m!102753))

(declare-fun m!103365 () Bool)

(assert (=> b!65107 m!103365))

(assert (=> b!64727 d!20402))

(declare-fun d!20404 () Bool)

(declare-fun res!53974 () Bool)

(declare-fun e!42900 () Bool)

(assert (=> d!20404 (=> (not res!53974) (not e!42900))))

(assert (=> d!20404 (= res!53974 (= (size!1298 (buf!1679 thiss!1379)) (size!1298 (buf!1679 thiss!1379))))))

(assert (=> d!20404 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!42900)))

(declare-fun b!65108 () Bool)

(declare-fun res!53972 () Bool)

(assert (=> b!65108 (=> (not res!53972) (not e!42900))))

(assert (=> b!65108 (= res!53972 (bvsle (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)) (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379))))))

(declare-fun b!65109 () Bool)

(declare-fun e!42899 () Bool)

(assert (=> b!65109 (= e!42900 e!42899)))

(declare-fun res!53973 () Bool)

(assert (=> b!65109 (=> res!53973 e!42899)))

(assert (=> b!65109 (= res!53973 (= (size!1298 (buf!1679 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65110 () Bool)

(assert (=> b!65110 (= e!42899 (arrayBitRangesEq!0 (buf!1679 thiss!1379) (buf!1679 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379))))))

(assert (= (and d!20404 res!53974) b!65108))

(assert (= (and b!65108 res!53972) b!65109))

(assert (= (and b!65109 (not res!53973)) b!65110))

(assert (=> b!65108 m!102727))

(assert (=> b!65108 m!102727))

(assert (=> b!65110 m!102727))

(assert (=> b!65110 m!102727))

(declare-fun m!103367 () Bool)

(assert (=> b!65110 m!103367))

(assert (=> b!64716 d!20404))

(declare-fun d!20406 () Bool)

(assert (=> d!20406 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!102991 () Unit!4385)

(declare-fun choose!11 (BitStream!2242) Unit!4385)

(assert (=> d!20406 (= lt!102991 (choose!11 thiss!1379))))

(assert (=> d!20406 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!102991)))

(declare-fun bs!4990 () Bool)

(assert (= bs!4990 d!20406))

(assert (=> bs!4990 m!102723))

(declare-fun m!103369 () Bool)

(assert (=> bs!4990 m!103369))

(assert (=> b!64716 d!20406))

(declare-fun d!20408 () Bool)

(declare-fun e!42901 () Bool)

(assert (=> d!20408 e!42901))

(declare-fun res!53975 () Bool)

(assert (=> d!20408 (=> (not res!53975) (not e!42901))))

(declare-fun lt!102994 () (_ BitVec 64))

(declare-fun lt!102996 () (_ BitVec 64))

(declare-fun lt!102993 () (_ BitVec 64))

(assert (=> d!20408 (= res!53975 (= lt!102994 (bvsub lt!102996 lt!102993)))))

(assert (=> d!20408 (or (= (bvand lt!102996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102993 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102996 lt!102993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20408 (= lt!102993 (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 thiss!1379))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379))))))

(declare-fun lt!102995 () (_ BitVec 64))

(declare-fun lt!102997 () (_ BitVec 64))

(assert (=> d!20408 (= lt!102996 (bvmul lt!102995 lt!102997))))

(assert (=> d!20408 (or (= lt!102995 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102997 (bvsdiv (bvmul lt!102995 lt!102997) lt!102995)))))

(assert (=> d!20408 (= lt!102997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20408 (= lt!102995 ((_ sign_extend 32) (size!1298 (buf!1679 thiss!1379))))))

(assert (=> d!20408 (= lt!102994 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3339 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3334 thiss!1379))))))

(assert (=> d!20408 (invariant!0 (currentBit!3334 thiss!1379) (currentByte!3339 thiss!1379) (size!1298 (buf!1679 thiss!1379)))))

(assert (=> d!20408 (= (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)) lt!102994)))

(declare-fun b!65111 () Bool)

(declare-fun res!53976 () Bool)

(assert (=> b!65111 (=> (not res!53976) (not e!42901))))

(assert (=> b!65111 (= res!53976 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102994))))

(declare-fun b!65112 () Bool)

(declare-fun lt!102992 () (_ BitVec 64))

(assert (=> b!65112 (= e!42901 (bvsle lt!102994 (bvmul lt!102992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65112 (or (= lt!102992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102992)))))

(assert (=> b!65112 (= lt!102992 ((_ sign_extend 32) (size!1298 (buf!1679 thiss!1379))))))

(assert (= (and d!20408 res!53975) b!65111))

(assert (= (and b!65111 res!53976) b!65112))

(assert (=> d!20408 m!103363))

(assert (=> d!20408 m!103361))

(assert (=> b!64716 d!20408))

(declare-fun d!20410 () Bool)

(assert (=> d!20410 (= (array_inv!1180 (buf!1679 thiss!1379)) (bvsge (size!1298 (buf!1679 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!64726 d!20410))

(declare-fun d!20412 () Bool)

(assert (=> d!20412 (= (invariant!0 (currentBit!3334 (_2!2998 lt!102430)) (currentByte!3339 (_2!2998 lt!102430)) (size!1298 (buf!1679 (_2!2998 lt!102430)))) (and (bvsge (currentBit!3334 (_2!2998 lt!102430)) #b00000000000000000000000000000000) (bvslt (currentBit!3334 (_2!2998 lt!102430)) #b00000000000000000000000000001000) (bvsge (currentByte!3339 (_2!2998 lt!102430)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3339 (_2!2998 lt!102430)) (size!1298 (buf!1679 (_2!2998 lt!102430)))) (and (= (currentBit!3334 (_2!2998 lt!102430)) #b00000000000000000000000000000000) (= (currentByte!3339 (_2!2998 lt!102430)) (size!1298 (buf!1679 (_2!2998 lt!102430))))))))))

(assert (=> b!64728 d!20412))

(declare-fun d!20414 () Bool)

(assert (=> d!20414 (isPrefixOf!0 thiss!1379 (_2!2998 lt!102432))))

(declare-fun lt!103000 () Unit!4385)

(declare-fun choose!30 (BitStream!2242 BitStream!2242 BitStream!2242) Unit!4385)

(assert (=> d!20414 (= lt!103000 (choose!30 thiss!1379 (_2!2998 lt!102430) (_2!2998 lt!102432)))))

(assert (=> d!20414 (isPrefixOf!0 thiss!1379 (_2!2998 lt!102430))))

(assert (=> d!20414 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2998 lt!102430) (_2!2998 lt!102432)) lt!103000)))

(declare-fun bs!4991 () Bool)

(assert (= bs!4991 d!20414))

(assert (=> bs!4991 m!102715))

(declare-fun m!103371 () Bool)

(assert (=> bs!4991 m!103371))

(assert (=> bs!4991 m!102737))

(assert (=> b!64717 d!20414))

(declare-fun d!20416 () Bool)

(assert (=> d!20416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4992 () Bool)

(assert (= bs!4992 d!20416))

(declare-fun m!103373 () Bool)

(assert (=> bs!4992 m!103373))

(assert (=> b!64717 d!20416))

(declare-fun d!20418 () Bool)

(declare-fun res!53979 () Bool)

(declare-fun e!42903 () Bool)

(assert (=> d!20418 (=> (not res!53979) (not e!42903))))

(assert (=> d!20418 (= res!53979 (= (size!1298 (buf!1679 (_2!2998 lt!102430))) (size!1298 (buf!1679 (_2!2998 lt!102432)))))))

(assert (=> d!20418 (= (isPrefixOf!0 (_2!2998 lt!102430) (_2!2998 lt!102432)) e!42903)))

(declare-fun b!65113 () Bool)

(declare-fun res!53977 () Bool)

(assert (=> b!65113 (=> (not res!53977) (not e!42903))))

(assert (=> b!65113 (= res!53977 (bvsle (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))) (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102432))) (currentByte!3339 (_2!2998 lt!102432)) (currentBit!3334 (_2!2998 lt!102432)))))))

(declare-fun b!65114 () Bool)

(declare-fun e!42902 () Bool)

(assert (=> b!65114 (= e!42903 e!42902)))

(declare-fun res!53978 () Bool)

(assert (=> b!65114 (=> res!53978 e!42902)))

(assert (=> b!65114 (= res!53978 (= (size!1298 (buf!1679 (_2!2998 lt!102430))) #b00000000000000000000000000000000))))

(declare-fun b!65115 () Bool)

(assert (=> b!65115 (= e!42902 (arrayBitRangesEq!0 (buf!1679 (_2!2998 lt!102430)) (buf!1679 (_2!2998 lt!102432)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430)))))))

(assert (= (and d!20418 res!53979) b!65113))

(assert (= (and b!65113 res!53977) b!65114))

(assert (= (and b!65114 (not res!53978)) b!65115))

(assert (=> b!65113 m!102729))

(assert (=> b!65113 m!102705))

(assert (=> b!65115 m!102729))

(assert (=> b!65115 m!102729))

(declare-fun m!103375 () Bool)

(assert (=> b!65115 m!103375))

(assert (=> b!64717 d!20418))

(declare-fun b!65213 () Bool)

(declare-fun res!54066 () Bool)

(declare-fun e!42952 () Bool)

(assert (=> b!65213 (=> (not res!54066) (not e!42952))))

(declare-fun lt!103327 () tuple2!5774)

(assert (=> b!65213 (= res!54066 (= (size!1298 (buf!1679 (_2!2998 lt!102430))) (size!1298 (buf!1679 (_2!2998 lt!103327)))))))

(declare-fun b!65214 () Bool)

(declare-fun res!54067 () Bool)

(assert (=> b!65214 (=> (not res!54067) (not e!42952))))

(assert (=> b!65214 (= res!54067 (isPrefixOf!0 (_2!2998 lt!102430) (_2!2998 lt!103327)))))

(declare-fun b!65215 () Bool)

(declare-fun e!42953 () tuple2!5774)

(declare-fun Unit!4404 () Unit!4385)

(assert (=> b!65215 (= e!42953 (tuple2!5775 Unit!4404 (_2!2998 lt!102430)))))

(assert (=> b!65215 (= (size!1298 (buf!1679 (_2!2998 lt!102430))) (size!1298 (buf!1679 (_2!2998 lt!102430))))))

(declare-fun lt!103314 () Unit!4385)

(declare-fun Unit!4405 () Unit!4385)

(assert (=> b!65215 (= lt!103314 Unit!4405)))

(declare-fun call!832 () tuple2!5772)

(declare-fun checkByteArrayBitContent!0 (BitStream!2242 array!2824 array!2824 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65215 (checkByteArrayBitContent!0 (_2!2998 lt!102430) srcBuffer!2 (_1!3010 (readBits!0 (_1!2997 call!832) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!65216 () Bool)

(declare-fun res!54070 () Bool)

(assert (=> b!65216 (=> (not res!54070) (not e!42952))))

(assert (=> b!65216 (= res!54070 (invariant!0 (currentBit!3334 (_2!2998 lt!103327)) (currentByte!3339 (_2!2998 lt!103327)) (size!1298 (buf!1679 (_2!2998 lt!103327)))))))

(declare-fun bm!829 () Bool)

(declare-fun c!4727 () Bool)

(declare-fun lt!103337 () tuple2!5774)

(assert (=> bm!829 (= call!832 (reader!0 (_2!2998 lt!102430) (ite c!4727 (_2!2998 lt!103337) (_2!2998 lt!102430))))))

(declare-fun b!65218 () Bool)

(declare-fun res!54069 () Bool)

(assert (=> b!65218 (=> (not res!54069) (not e!42952))))

(assert (=> b!65218 (= res!54069 (= (size!1298 (buf!1679 (_2!2998 lt!103327))) (size!1298 (buf!1679 (_2!2998 lt!102430)))))))

(declare-fun b!65219 () Bool)

(declare-fun e!42951 () Bool)

(declare-fun lt!103317 () (_ BitVec 64))

(assert (=> b!65219 (= e!42951 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) lt!103317))))

(declare-fun lt!103312 () tuple2!5772)

(declare-fun b!65220 () Bool)

(assert (=> b!65220 (= e!42952 (= (bitStreamReadBitsIntoList!0 (_2!2998 lt!103327) (_1!2997 lt!103312) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2998 lt!103327) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!65220 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65220 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!103311 () Unit!4385)

(declare-fun lt!103324 () Unit!4385)

(assert (=> b!65220 (= lt!103311 lt!103324)))

(assert (=> b!65220 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!103327)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) lt!103317)))

(assert (=> b!65220 (= lt!103324 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2998 lt!102430) (buf!1679 (_2!2998 lt!103327)) lt!103317))))

(assert (=> b!65220 e!42951))

(declare-fun res!54068 () Bool)

(assert (=> b!65220 (=> (not res!54068) (not e!42951))))

(assert (=> b!65220 (= res!54068 (and (= (size!1298 (buf!1679 (_2!2998 lt!102430))) (size!1298 (buf!1679 (_2!2998 lt!103327)))) (bvsge lt!103317 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65220 (= lt!103317 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!65220 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65220 (= lt!103312 (reader!0 (_2!2998 lt!102430) (_2!2998 lt!103327)))))

(declare-fun b!65217 () Bool)

(declare-fun Unit!4406 () Unit!4385)

(assert (=> b!65217 (= e!42953 (tuple2!5775 Unit!4406 (_2!2998 lt!103337)))))

(declare-fun lt!103318 () tuple2!5774)

(assert (=> b!65217 (= lt!103318 (appendBitFromByte!0 (_2!2998 lt!102430) (select (arr!1862 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!103319 () (_ BitVec 64))

(assert (=> b!65217 (= lt!103319 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103328 () (_ BitVec 64))

(assert (=> b!65217 (= lt!103328 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!103347 () Unit!4385)

(assert (=> b!65217 (= lt!103347 (validateOffsetBitsIneqLemma!0 (_2!2998 lt!102430) (_2!2998 lt!103318) lt!103319 lt!103328))))

(assert (=> b!65217 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!103318)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!103318))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!103318))) (bvsub lt!103319 lt!103328))))

(declare-fun lt!103330 () Unit!4385)

(assert (=> b!65217 (= lt!103330 lt!103347)))

(declare-fun lt!103335 () tuple2!5772)

(assert (=> b!65217 (= lt!103335 (reader!0 (_2!2998 lt!102430) (_2!2998 lt!103318)))))

(declare-fun lt!103306 () (_ BitVec 64))

(assert (=> b!65217 (= lt!103306 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!103310 () Unit!4385)

(assert (=> b!65217 (= lt!103310 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2998 lt!102430) (buf!1679 (_2!2998 lt!103318)) lt!103306))))

(assert (=> b!65217 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!103318)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) lt!103306)))

(declare-fun lt!103344 () Unit!4385)

(assert (=> b!65217 (= lt!103344 lt!103310)))

(assert (=> b!65217 (= (head!515 (byteArrayBitContentToList!0 (_2!2998 lt!103318) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!515 (bitStreamReadBitsIntoList!0 (_2!2998 lt!103318) (_1!2997 lt!103335) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!103338 () Unit!4385)

(declare-fun Unit!4407 () Unit!4385)

(assert (=> b!65217 (= lt!103338 Unit!4407)))

(assert (=> b!65217 (= lt!103337 (appendBitsMSBFirstLoop!0 (_2!2998 lt!103318) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!103315 () Unit!4385)

(assert (=> b!65217 (= lt!103315 (lemmaIsPrefixTransitive!0 (_2!2998 lt!102430) (_2!2998 lt!103318) (_2!2998 lt!103337)))))

(assert (=> b!65217 (isPrefixOf!0 (_2!2998 lt!102430) (_2!2998 lt!103337))))

(declare-fun lt!103309 () Unit!4385)

(assert (=> b!65217 (= lt!103309 lt!103315)))

(assert (=> b!65217 (= (size!1298 (buf!1679 (_2!2998 lt!103337))) (size!1298 (buf!1679 (_2!2998 lt!102430))))))

(declare-fun lt!103305 () Unit!4385)

(declare-fun Unit!4408 () Unit!4385)

(assert (=> b!65217 (= lt!103305 Unit!4408)))

(assert (=> b!65217 (= (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!103337))) (currentByte!3339 (_2!2998 lt!103337)) (currentBit!3334 (_2!2998 lt!103337))) (bvsub (bvadd (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103329 () Unit!4385)

(declare-fun Unit!4409 () Unit!4385)

(assert (=> b!65217 (= lt!103329 Unit!4409)))

(assert (=> b!65217 (= (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!103337))) (currentByte!3339 (_2!2998 lt!103337)) (currentBit!3334 (_2!2998 lt!103337))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!103318))) (currentByte!3339 (_2!2998 lt!103318)) (currentBit!3334 (_2!2998 lt!103318))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103331 () Unit!4385)

(declare-fun Unit!4410 () Unit!4385)

(assert (=> b!65217 (= lt!103331 Unit!4410)))

(declare-fun lt!103343 () tuple2!5772)

(assert (=> b!65217 (= lt!103343 call!832)))

(declare-fun lt!103332 () (_ BitVec 64))

(assert (=> b!65217 (= lt!103332 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103313 () Unit!4385)

(assert (=> b!65217 (= lt!103313 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2998 lt!102430) (buf!1679 (_2!2998 lt!103337)) lt!103332))))

(assert (=> b!65217 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!103337)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!102430))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!102430))) lt!103332)))

(declare-fun lt!103316 () Unit!4385)

(assert (=> b!65217 (= lt!103316 lt!103313)))

(declare-fun lt!103339 () tuple2!5772)

(assert (=> b!65217 (= lt!103339 (reader!0 (_2!2998 lt!103318) (_2!2998 lt!103337)))))

(declare-fun lt!103326 () (_ BitVec 64))

(assert (=> b!65217 (= lt!103326 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103346 () Unit!4385)

(assert (=> b!65217 (= lt!103346 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2998 lt!103318) (buf!1679 (_2!2998 lt!103337)) lt!103326))))

(assert (=> b!65217 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!103337)))) ((_ sign_extend 32) (currentByte!3339 (_2!2998 lt!103318))) ((_ sign_extend 32) (currentBit!3334 (_2!2998 lt!103318))) lt!103326)))

(declare-fun lt!103340 () Unit!4385)

(assert (=> b!65217 (= lt!103340 lt!103346)))

(declare-fun lt!103341 () List!696)

(assert (=> b!65217 (= lt!103341 (byteArrayBitContentToList!0 (_2!2998 lt!103337) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!103320 () List!696)

(assert (=> b!65217 (= lt!103320 (byteArrayBitContentToList!0 (_2!2998 lt!103337) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!103333 () List!696)

(assert (=> b!65217 (= lt!103333 (bitStreamReadBitsIntoList!0 (_2!2998 lt!103337) (_1!2997 lt!103343) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!103348 () List!696)

(assert (=> b!65217 (= lt!103348 (bitStreamReadBitsIntoList!0 (_2!2998 lt!103337) (_1!2997 lt!103339) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!103325 () (_ BitVec 64))

(assert (=> b!65217 (= lt!103325 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103321 () Unit!4385)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2242 BitStream!2242 BitStream!2242 BitStream!2242 (_ BitVec 64) List!696) Unit!4385)

(assert (=> b!65217 (= lt!103321 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2998 lt!103337) (_2!2998 lt!103337) (_1!2997 lt!103343) (_1!2997 lt!103339) lt!103325 lt!103333))))

(declare-fun tail!304 (List!696) List!696)

(assert (=> b!65217 (= (bitStreamReadBitsIntoList!0 (_2!2998 lt!103337) (_1!2997 lt!103339) (bvsub lt!103325 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!304 lt!103333))))

(declare-fun lt!103323 () Unit!4385)

(assert (=> b!65217 (= lt!103323 lt!103321)))

(declare-fun lt!103336 () (_ BitVec 64))

(declare-fun lt!103334 () Unit!4385)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2824 array!2824 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4385)

(assert (=> b!65217 (= lt!103334 (arrayBitRangesEqImpliesEq!0 (buf!1679 (_2!2998 lt!103318)) (buf!1679 (_2!2998 lt!103337)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!103336 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!103318))) (currentByte!3339 (_2!2998 lt!103318)) (currentBit!3334 (_2!2998 lt!103318)))))))

(declare-fun bitAt!0 (array!2824 (_ BitVec 64)) Bool)

(assert (=> b!65217 (= (bitAt!0 (buf!1679 (_2!2998 lt!103318)) lt!103336) (bitAt!0 (buf!1679 (_2!2998 lt!103337)) lt!103336))))

(declare-fun lt!103342 () Unit!4385)

(assert (=> b!65217 (= lt!103342 lt!103334)))

(declare-fun d!20420 () Bool)

(assert (=> d!20420 e!42952))

(declare-fun res!54071 () Bool)

(assert (=> d!20420 (=> (not res!54071) (not e!42952))))

(declare-fun lt!103322 () (_ BitVec 64))

(assert (=> d!20420 (= res!54071 (= (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!103327))) (currentByte!3339 (_2!2998 lt!103327)) (currentBit!3334 (_2!2998 lt!103327))) (bvsub lt!103322 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20420 (or (= (bvand lt!103322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103322 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!103307 () (_ BitVec 64))

(assert (=> d!20420 (= lt!103322 (bvadd lt!103307 to!314))))

(assert (=> d!20420 (or (not (= (bvand lt!103307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!103307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!103307 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20420 (= lt!103307 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))))))

(assert (=> d!20420 (= lt!103327 e!42953)))

(assert (=> d!20420 (= c!4727 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!103345 () Unit!4385)

(declare-fun lt!103308 () Unit!4385)

(assert (=> d!20420 (= lt!103345 lt!103308)))

(assert (=> d!20420 (isPrefixOf!0 (_2!2998 lt!102430) (_2!2998 lt!102430))))

(assert (=> d!20420 (= lt!103308 (lemmaIsPrefixRefl!0 (_2!2998 lt!102430)))))

(assert (=> d!20420 (= lt!103336 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))))))

(assert (=> d!20420 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20420 (= (appendBitsMSBFirstLoop!0 (_2!2998 lt!102430) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!103327)))

(assert (= (and d!20420 c!4727) b!65217))

(assert (= (and d!20420 (not c!4727)) b!65215))

(assert (= (or b!65217 b!65215) bm!829))

(assert (= (and d!20420 res!54071) b!65216))

(assert (= (and b!65216 res!54070) b!65213))

(assert (= (and b!65213 res!54066) b!65214))

(assert (= (and b!65214 res!54067) b!65218))

(assert (= (and b!65218 res!54069) b!65220))

(assert (= (and b!65220 res!54068) b!65219))

(declare-fun m!103517 () Bool)

(assert (=> b!65214 m!103517))

(declare-fun m!103519 () Bool)

(assert (=> b!65219 m!103519))

(declare-fun m!103521 () Bool)

(assert (=> d!20420 m!103521))

(assert (=> d!20420 m!102729))

(assert (=> d!20420 m!103105))

(assert (=> d!20420 m!103095))

(declare-fun m!103523 () Bool)

(assert (=> b!65217 m!103523))

(declare-fun m!103525 () Bool)

(assert (=> b!65217 m!103525))

(declare-fun m!103527 () Bool)

(assert (=> b!65217 m!103527))

(declare-fun m!103529 () Bool)

(assert (=> b!65217 m!103529))

(declare-fun m!103531 () Bool)

(assert (=> b!65217 m!103531))

(declare-fun m!103533 () Bool)

(assert (=> b!65217 m!103533))

(declare-fun m!103535 () Bool)

(assert (=> b!65217 m!103535))

(declare-fun m!103537 () Bool)

(assert (=> b!65217 m!103537))

(declare-fun m!103539 () Bool)

(assert (=> b!65217 m!103539))

(declare-fun m!103541 () Bool)

(assert (=> b!65217 m!103541))

(declare-fun m!103543 () Bool)

(assert (=> b!65217 m!103543))

(declare-fun m!103545 () Bool)

(assert (=> b!65217 m!103545))

(declare-fun m!103547 () Bool)

(assert (=> b!65217 m!103547))

(declare-fun m!103549 () Bool)

(assert (=> b!65217 m!103549))

(declare-fun m!103551 () Bool)

(assert (=> b!65217 m!103551))

(declare-fun m!103553 () Bool)

(assert (=> b!65217 m!103553))

(declare-fun m!103555 () Bool)

(assert (=> b!65217 m!103555))

(assert (=> b!65217 m!102729))

(declare-fun m!103557 () Bool)

(assert (=> b!65217 m!103557))

(declare-fun m!103559 () Bool)

(assert (=> b!65217 m!103559))

(declare-fun m!103561 () Bool)

(assert (=> b!65217 m!103561))

(declare-fun m!103563 () Bool)

(assert (=> b!65217 m!103563))

(declare-fun m!103565 () Bool)

(assert (=> b!65217 m!103565))

(declare-fun m!103567 () Bool)

(assert (=> b!65217 m!103567))

(declare-fun m!103569 () Bool)

(assert (=> b!65217 m!103569))

(declare-fun m!103571 () Bool)

(assert (=> b!65217 m!103571))

(assert (=> b!65217 m!103565))

(declare-fun m!103573 () Bool)

(assert (=> b!65217 m!103573))

(declare-fun m!103575 () Bool)

(assert (=> b!65217 m!103575))

(declare-fun m!103577 () Bool)

(assert (=> b!65217 m!103577))

(declare-fun m!103579 () Bool)

(assert (=> b!65217 m!103579))

(declare-fun m!103581 () Bool)

(assert (=> b!65217 m!103581))

(assert (=> b!65217 m!103539))

(assert (=> b!65217 m!103551))

(assert (=> b!65217 m!103559))

(declare-fun m!103583 () Bool)

(assert (=> b!65217 m!103583))

(declare-fun m!103585 () Bool)

(assert (=> b!65220 m!103585))

(declare-fun m!103587 () Bool)

(assert (=> b!65220 m!103587))

(declare-fun m!103589 () Bool)

(assert (=> b!65220 m!103589))

(declare-fun m!103591 () Bool)

(assert (=> b!65220 m!103591))

(declare-fun m!103593 () Bool)

(assert (=> b!65220 m!103593))

(declare-fun m!103595 () Bool)

(assert (=> b!65215 m!103595))

(declare-fun m!103597 () Bool)

(assert (=> b!65215 m!103597))

(declare-fun m!103599 () Bool)

(assert (=> bm!829 m!103599))

(declare-fun m!103601 () Bool)

(assert (=> b!65216 m!103601))

(assert (=> b!64717 d!20420))

(declare-fun d!20454 () Bool)

(assert (=> d!20454 (validate_offset_bits!1 ((_ sign_extend 32) (size!1298 (buf!1679 (_2!2998 lt!102430)))) ((_ sign_extend 32) (currentByte!3339 thiss!1379)) ((_ sign_extend 32) (currentBit!3334 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!103349 () Unit!4385)

(assert (=> d!20454 (= lt!103349 (choose!9 thiss!1379 (buf!1679 (_2!2998 lt!102430)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2243 (buf!1679 (_2!2998 lt!102430)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379))))))

(assert (=> d!20454 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1679 (_2!2998 lt!102430)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103349)))

(declare-fun bs!4997 () Bool)

(assert (= bs!4997 d!20454))

(assert (=> bs!4997 m!102719))

(declare-fun m!103603 () Bool)

(assert (=> bs!4997 m!103603))

(assert (=> b!64717 d!20454))

(declare-fun d!20456 () Bool)

(declare-fun res!54074 () Bool)

(declare-fun e!42955 () Bool)

(assert (=> d!20456 (=> (not res!54074) (not e!42955))))

(assert (=> d!20456 (= res!54074 (= (size!1298 (buf!1679 thiss!1379)) (size!1298 (buf!1679 (_2!2998 lt!102432)))))))

(assert (=> d!20456 (= (isPrefixOf!0 thiss!1379 (_2!2998 lt!102432)) e!42955)))

(declare-fun b!65221 () Bool)

(declare-fun res!54072 () Bool)

(assert (=> b!65221 (=> (not res!54072) (not e!42955))))

(assert (=> b!65221 (= res!54072 (bvsle (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)) (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102432))) (currentByte!3339 (_2!2998 lt!102432)) (currentBit!3334 (_2!2998 lt!102432)))))))

(declare-fun b!65222 () Bool)

(declare-fun e!42954 () Bool)

(assert (=> b!65222 (= e!42955 e!42954)))

(declare-fun res!54073 () Bool)

(assert (=> b!65222 (=> res!54073 e!42954)))

(assert (=> b!65222 (= res!54073 (= (size!1298 (buf!1679 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65223 () Bool)

(assert (=> b!65223 (= e!42954 (arrayBitRangesEq!0 (buf!1679 thiss!1379) (buf!1679 (_2!2998 lt!102432)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379))))))

(assert (= (and d!20456 res!54074) b!65221))

(assert (= (and b!65221 res!54072) b!65222))

(assert (= (and b!65222 (not res!54073)) b!65223))

(assert (=> b!65221 m!102727))

(assert (=> b!65221 m!102705))

(assert (=> b!65223 m!102727))

(assert (=> b!65223 m!102727))

(declare-fun m!103605 () Bool)

(assert (=> b!65223 m!103605))

(assert (=> b!64717 d!20456))

(declare-fun d!20458 () Bool)

(declare-fun e!42956 () Bool)

(assert (=> d!20458 e!42956))

(declare-fun res!54075 () Bool)

(assert (=> d!20458 (=> (not res!54075) (not e!42956))))

(declare-fun lt!103351 () tuple2!5772)

(assert (=> d!20458 (= res!54075 (isPrefixOf!0 (_1!2997 lt!103351) (_2!2997 lt!103351)))))

(declare-fun lt!103363 () BitStream!2242)

(assert (=> d!20458 (= lt!103351 (tuple2!5773 lt!103363 (_2!2998 lt!102430)))))

(declare-fun lt!103369 () Unit!4385)

(declare-fun lt!103353 () Unit!4385)

(assert (=> d!20458 (= lt!103369 lt!103353)))

(assert (=> d!20458 (isPrefixOf!0 lt!103363 (_2!2998 lt!102430))))

(assert (=> d!20458 (= lt!103353 (lemmaIsPrefixTransitive!0 lt!103363 (_2!2998 lt!102430) (_2!2998 lt!102430)))))

(declare-fun lt!103360 () Unit!4385)

(declare-fun lt!103352 () Unit!4385)

(assert (=> d!20458 (= lt!103360 lt!103352)))

(assert (=> d!20458 (isPrefixOf!0 lt!103363 (_2!2998 lt!102430))))

(assert (=> d!20458 (= lt!103352 (lemmaIsPrefixTransitive!0 lt!103363 thiss!1379 (_2!2998 lt!102430)))))

(declare-fun lt!103367 () Unit!4385)

(declare-fun e!42957 () Unit!4385)

(assert (=> d!20458 (= lt!103367 e!42957)))

(declare-fun c!4728 () Bool)

(assert (=> d!20458 (= c!4728 (not (= (size!1298 (buf!1679 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!103355 () Unit!4385)

(declare-fun lt!103356 () Unit!4385)

(assert (=> d!20458 (= lt!103355 lt!103356)))

(assert (=> d!20458 (isPrefixOf!0 (_2!2998 lt!102430) (_2!2998 lt!102430))))

(assert (=> d!20458 (= lt!103356 (lemmaIsPrefixRefl!0 (_2!2998 lt!102430)))))

(declare-fun lt!103354 () Unit!4385)

(declare-fun lt!103368 () Unit!4385)

(assert (=> d!20458 (= lt!103354 lt!103368)))

(assert (=> d!20458 (= lt!103368 (lemmaIsPrefixRefl!0 (_2!2998 lt!102430)))))

(declare-fun lt!103365 () Unit!4385)

(declare-fun lt!103361 () Unit!4385)

(assert (=> d!20458 (= lt!103365 lt!103361)))

(assert (=> d!20458 (isPrefixOf!0 lt!103363 lt!103363)))

(assert (=> d!20458 (= lt!103361 (lemmaIsPrefixRefl!0 lt!103363))))

(declare-fun lt!103364 () Unit!4385)

(declare-fun lt!103362 () Unit!4385)

(assert (=> d!20458 (= lt!103364 lt!103362)))

(assert (=> d!20458 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20458 (= lt!103362 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20458 (= lt!103363 (BitStream!2243 (buf!1679 (_2!2998 lt!102430)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)))))

(assert (=> d!20458 (isPrefixOf!0 thiss!1379 (_2!2998 lt!102430))))

(assert (=> d!20458 (= (reader!0 thiss!1379 (_2!2998 lt!102430)) lt!103351)))

(declare-fun b!65224 () Bool)

(declare-fun Unit!4412 () Unit!4385)

(assert (=> b!65224 (= e!42957 Unit!4412)))

(declare-fun b!65225 () Bool)

(declare-fun res!54077 () Bool)

(assert (=> b!65225 (=> (not res!54077) (not e!42956))))

(assert (=> b!65225 (= res!54077 (isPrefixOf!0 (_1!2997 lt!103351) thiss!1379))))

(declare-fun lt!103358 () (_ BitVec 64))

(declare-fun lt!103357 () (_ BitVec 64))

(declare-fun b!65226 () Bool)

(assert (=> b!65226 (= e!42956 (= (_1!2997 lt!103351) (withMovedBitIndex!0 (_2!2997 lt!103351) (bvsub lt!103358 lt!103357))))))

(assert (=> b!65226 (or (= (bvand lt!103358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103357 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103358 lt!103357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65226 (= lt!103357 (bitIndex!0 (size!1298 (buf!1679 (_2!2998 lt!102430))) (currentByte!3339 (_2!2998 lt!102430)) (currentBit!3334 (_2!2998 lt!102430))))))

(assert (=> b!65226 (= lt!103358 (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)))))

(declare-fun b!65227 () Bool)

(declare-fun lt!103359 () Unit!4385)

(assert (=> b!65227 (= e!42957 lt!103359)))

(declare-fun lt!103350 () (_ BitVec 64))

(assert (=> b!65227 (= lt!103350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!103366 () (_ BitVec 64))

(assert (=> b!65227 (= lt!103366 (bitIndex!0 (size!1298 (buf!1679 thiss!1379)) (currentByte!3339 thiss!1379) (currentBit!3334 thiss!1379)))))

(assert (=> b!65227 (= lt!103359 (arrayBitRangesEqSymmetric!0 (buf!1679 thiss!1379) (buf!1679 (_2!2998 lt!102430)) lt!103350 lt!103366))))

(assert (=> b!65227 (arrayBitRangesEq!0 (buf!1679 (_2!2998 lt!102430)) (buf!1679 thiss!1379) lt!103350 lt!103366)))

(declare-fun b!65228 () Bool)

(declare-fun res!54076 () Bool)

(assert (=> b!65228 (=> (not res!54076) (not e!42956))))

(assert (=> b!65228 (= res!54076 (isPrefixOf!0 (_2!2997 lt!103351) (_2!2998 lt!102430)))))

(assert (= (and d!20458 c!4728) b!65227))

(assert (= (and d!20458 (not c!4728)) b!65224))

(assert (= (and d!20458 res!54075) b!65225))

(assert (= (and b!65225 res!54077) b!65228))

(assert (= (and b!65228 res!54076) b!65226))

(declare-fun m!103607 () Bool)

(assert (=> b!65225 m!103607))

(assert (=> d!20458 m!102725))

(assert (=> d!20458 m!103095))

(assert (=> d!20458 m!103105))

(assert (=> d!20458 m!102737))

(declare-fun m!103609 () Bool)

(assert (=> d!20458 m!103609))

(declare-fun m!103611 () Bool)

(assert (=> d!20458 m!103611))

(assert (=> d!20458 m!102723))

(declare-fun m!103613 () Bool)

(assert (=> d!20458 m!103613))

(declare-fun m!103615 () Bool)

(assert (=> d!20458 m!103615))

(declare-fun m!103617 () Bool)

(assert (=> d!20458 m!103617))

(declare-fun m!103619 () Bool)

(assert (=> d!20458 m!103619))

(declare-fun m!103621 () Bool)

(assert (=> b!65228 m!103621))

(assert (=> b!65227 m!102727))

(declare-fun m!103623 () Bool)

(assert (=> b!65227 m!103623))

(declare-fun m!103625 () Bool)

(assert (=> b!65227 m!103625))

(declare-fun m!103627 () Bool)

(assert (=> b!65226 m!103627))

(assert (=> b!65226 m!102729))

(assert (=> b!65226 m!102727))

(assert (=> b!64717 d!20458))

(declare-fun d!20460 () Bool)

(declare-fun size!1303 (List!696) Int)

(assert (=> d!20460 (= (length!324 lt!102439) (size!1303 lt!102439))))

(declare-fun bs!4998 () Bool)

(assert (= bs!4998 d!20460))

(declare-fun m!103629 () Bool)

(assert (=> bs!4998 m!103629))

(assert (=> b!64735 d!20460))

(declare-fun d!20462 () Bool)

(assert (=> d!20462 (= (invariant!0 (currentBit!3334 (_2!2998 lt!102430)) (currentByte!3339 (_2!2998 lt!102430)) (size!1298 (buf!1679 (_2!2998 lt!102432)))) (and (bvsge (currentBit!3334 (_2!2998 lt!102430)) #b00000000000000000000000000000000) (bvslt (currentBit!3334 (_2!2998 lt!102430)) #b00000000000000000000000000001000) (bvsge (currentByte!3339 (_2!2998 lt!102430)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3339 (_2!2998 lt!102430)) (size!1298 (buf!1679 (_2!2998 lt!102432)))) (and (= (currentBit!3334 (_2!2998 lt!102430)) #b00000000000000000000000000000000) (= (currentByte!3339 (_2!2998 lt!102430)) (size!1298 (buf!1679 (_2!2998 lt!102432))))))))))

(assert (=> b!64724 d!20462))

(declare-fun d!20464 () Bool)

(assert (=> d!20464 (= (invariant!0 (currentBit!3334 (_2!2998 lt!102432)) (currentByte!3339 (_2!2998 lt!102432)) (size!1298 (buf!1679 (_2!2998 lt!102432)))) (and (bvsge (currentBit!3334 (_2!2998 lt!102432)) #b00000000000000000000000000000000) (bvslt (currentBit!3334 (_2!2998 lt!102432)) #b00000000000000000000000000001000) (bvsge (currentByte!3339 (_2!2998 lt!102432)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3339 (_2!2998 lt!102432)) (size!1298 (buf!1679 (_2!2998 lt!102432)))) (and (= (currentBit!3334 (_2!2998 lt!102432)) #b00000000000000000000000000000000) (= (currentByte!3339 (_2!2998 lt!102432)) (size!1298 (buf!1679 (_2!2998 lt!102432))))))))))

(assert (=> b!64734 d!20464))

(declare-fun d!20466 () Bool)

(declare-fun res!54080 () Bool)

(declare-fun e!42959 () Bool)

(assert (=> d!20466 (=> (not res!54080) (not e!42959))))

(assert (=> d!20466 (= res!54080 (= (size!1298 (buf!1679 (_1!2997 lt!102437))) (size!1298 (buf!1679 (_1!2997 lt!102426)))))))

(assert (=> d!20466 (= (isPrefixOf!0 (_1!2997 lt!102437) (_1!2997 lt!102426)) e!42959)))

(declare-fun b!65229 () Bool)

(declare-fun res!54078 () Bool)

(assert (=> b!65229 (=> (not res!54078) (not e!42959))))

(assert (=> b!65229 (= res!54078 (bvsle (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102437))) (currentByte!3339 (_1!2997 lt!102437)) (currentBit!3334 (_1!2997 lt!102437))) (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102426))) (currentByte!3339 (_1!2997 lt!102426)) (currentBit!3334 (_1!2997 lt!102426)))))))

(declare-fun b!65230 () Bool)

(declare-fun e!42958 () Bool)

(assert (=> b!65230 (= e!42959 e!42958)))

(declare-fun res!54079 () Bool)

(assert (=> b!65230 (=> res!54079 e!42958)))

(assert (=> b!65230 (= res!54079 (= (size!1298 (buf!1679 (_1!2997 lt!102437))) #b00000000000000000000000000000000))))

(declare-fun b!65231 () Bool)

(assert (=> b!65231 (= e!42958 (arrayBitRangesEq!0 (buf!1679 (_1!2997 lt!102437)) (buf!1679 (_1!2997 lt!102426)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1298 (buf!1679 (_1!2997 lt!102437))) (currentByte!3339 (_1!2997 lt!102437)) (currentBit!3334 (_1!2997 lt!102437)))))))

(assert (= (and d!20466 res!54080) b!65229))

(assert (= (and b!65229 res!54078) b!65230))

(assert (= (and b!65230 (not res!54079)) b!65231))

(assert (=> b!65229 m!102753))

(assert (=> b!65229 m!102755))

(assert (=> b!65231 m!102753))

(assert (=> b!65231 m!102753))

(declare-fun m!103631 () Bool)

(assert (=> b!65231 m!103631))

(assert (=> b!64715 d!20466))

(push 1)

(assert (not b!65049))

(assert (not b!64952))

(assert (not d!20416))

(assert (not d!20460))

(assert (not b!65102))

(assert (not b!65098))

(assert (not d!20306))

(assert (not b!64980))

(assert (not b!65052))

(assert (not b!65051))

(assert (not b!65228))

(assert (not d!20310))

(assert (not b!64953))

(assert (not d!20296))

(assert (not d!20300))

(assert (not d!20388))

(assert (not d!20320))

(assert (not b!64987))

(assert (not b!64946))

(assert (not b!65110))

(assert (not b!65048))

(assert (not bm!829))

(assert (not d!20302))

(assert (not d!20368))

(assert (not b!64950))

(assert (not b!65115))

(assert (not d!20406))

(assert (not d!20408))

(assert (not d!20414))

(assert (not b!64964))

(assert (not b!65225))

(assert (not b!65050))

(assert (not d!20314))

(assert (not b!65100))

(assert (not b!64975))

(assert (not b!65054))

(assert (not d!20420))

(assert (not d!20458))

(assert (not b!65101))

(assert (not b!65231))

(assert (not b!64931))

(assert (not b!64945))

(assert (not b!65214))

(assert (not d!20400))

(assert (not b!64977))

(assert (not b!65227))

(assert (not b!64933))

(assert (not b!65221))

(assert (not d!20292))

(assert (not b!65220))

(assert (not b!65219))

(assert (not b!65216))

(assert (not d!20294))

(assert (not b!64963))

(assert (not d!20352))

(assert (not d!20316))

(assert (not b!65107))

(assert (not b!65226))

(assert (not b!65113))

(assert (not b!65223))

(assert (not b!65217))

(assert (not b!65055))

(assert (not d!20394))

(assert (not b!65108))

(assert (not b!64947))

(assert (not b!64978))

(assert (not d!20366))

(assert (not b!65105))

(assert (not b!64951))

(assert (not b!65053))

(assert (not d!20454))

(assert (not b!64965))

(assert (not b!65215))

(assert (not b!64976))

(assert (not b!65229))

(assert (not b!64948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

