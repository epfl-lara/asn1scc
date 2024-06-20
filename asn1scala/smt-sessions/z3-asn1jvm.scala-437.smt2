; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11816 () Bool)

(assert start!11816)

(declare-fun b!58740 () Bool)

(declare-fun res!48816 () Bool)

(declare-fun e!39003 () Bool)

(assert (=> b!58740 (=> res!48816 e!39003)))

(declare-datatypes ((array!2673 0))(
  ( (array!2674 (arr!1776 (Array (_ BitVec 32) (_ BitVec 8))) (size!1212 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2112 0))(
  ( (BitStream!2113 (buf!1593 array!2673) (currentByte!3211 (_ BitVec 32)) (currentBit!3206 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4047 0))(
  ( (Unit!4048) )
))
(declare-datatypes ((tuple2!5346 0))(
  ( (tuple2!5347 (_1!2784 Unit!4047) (_2!2784 BitStream!2112)) )
))
(declare-fun lt!92595 () tuple2!5346)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58740 (= res!48816 (not (invariant!0 (currentBit!3206 (_2!2784 lt!92595)) (currentByte!3211 (_2!2784 lt!92595)) (size!1212 (buf!1593 (_2!2784 lt!92595))))))))

(declare-fun b!58741 () Bool)

(declare-fun res!48818 () Bool)

(declare-fun e!39001 () Bool)

(assert (=> b!58741 (=> res!48818 e!39001)))

(declare-fun lt!92602 () tuple2!5346)

(assert (=> b!58741 (= res!48818 (not (invariant!0 (currentBit!3206 (_2!2784 lt!92602)) (currentByte!3211 (_2!2784 lt!92602)) (size!1212 (buf!1593 (_2!2784 lt!92602))))))))

(declare-fun b!58742 () Bool)

(declare-fun res!48824 () Bool)

(declare-fun e!38998 () Bool)

(assert (=> b!58742 (=> (not res!48824) (not e!38998))))

(declare-fun thiss!1379 () BitStream!2112)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58742 (= res!48824 (validate_offset_bits!1 ((_ sign_extend 32) (size!1212 (buf!1593 thiss!1379))) ((_ sign_extend 32) (currentByte!3211 thiss!1379)) ((_ sign_extend 32) (currentBit!3206 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58743 () Bool)

(declare-fun e!39005 () Bool)

(declare-fun e!38996 () Bool)

(assert (=> b!58743 (= e!39005 e!38996)))

(declare-fun res!48821 () Bool)

(assert (=> b!58743 (=> res!48821 e!38996)))

(declare-fun isPrefixOf!0 (BitStream!2112 BitStream!2112) Bool)

(assert (=> b!58743 (= res!48821 (not (isPrefixOf!0 thiss!1379 (_2!2784 lt!92602))))))

(declare-fun lt!92599 () (_ BitVec 64))

(assert (=> b!58743 (validate_offset_bits!1 ((_ sign_extend 32) (size!1212 (buf!1593 (_2!2784 lt!92602)))) ((_ sign_extend 32) (currentByte!3211 (_2!2784 lt!92602))) ((_ sign_extend 32) (currentBit!3206 (_2!2784 lt!92602))) lt!92599)))

(assert (=> b!58743 (= lt!92599 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92600 () Unit!4047)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2112 BitStream!2112 (_ BitVec 64) (_ BitVec 64)) Unit!4047)

(assert (=> b!58743 (= lt!92600 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2784 lt!92602) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2673)

(declare-fun appendBitFromByte!0 (BitStream!2112 (_ BitVec 8) (_ BitVec 32)) tuple2!5346)

(assert (=> b!58743 (= lt!92602 (appendBitFromByte!0 thiss!1379 (select (arr!1776 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58744 () Bool)

(declare-fun res!48825 () Bool)

(assert (=> b!58744 (=> res!48825 e!39001)))

(assert (=> b!58744 (= res!48825 (not (invariant!0 (currentBit!3206 (_2!2784 lt!92602)) (currentByte!3211 (_2!2784 lt!92602)) (size!1212 (buf!1593 (_2!2784 lt!92595))))))))

(declare-fun b!58745 () Bool)

(assert (=> b!58745 (= e!39003 e!39001)))

(declare-fun res!48828 () Bool)

(assert (=> b!58745 (=> res!48828 e!39001)))

(assert (=> b!58745 (= res!48828 (not (= (size!1212 (buf!1593 (_2!2784 lt!92602))) (size!1212 (buf!1593 (_2!2784 lt!92595))))))))

(declare-fun e!39000 () Bool)

(assert (=> b!58745 e!39000))

(declare-fun res!48826 () Bool)

(assert (=> b!58745 (=> (not res!48826) (not e!39000))))

(assert (=> b!58745 (= res!48826 (= (size!1212 (buf!1593 (_2!2784 lt!92595))) (size!1212 (buf!1593 thiss!1379))))))

(declare-fun res!48823 () Bool)

(assert (=> start!11816 (=> (not res!48823) (not e!38998))))

(assert (=> start!11816 (= res!48823 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1212 srcBuffer!2))))))))

(assert (=> start!11816 e!38998))

(assert (=> start!11816 true))

(declare-fun array_inv!1115 (array!2673) Bool)

(assert (=> start!11816 (array_inv!1115 srcBuffer!2)))

(declare-fun e!39002 () Bool)

(declare-fun inv!12 (BitStream!2112) Bool)

(assert (=> start!11816 (and (inv!12 thiss!1379) e!39002)))

(declare-fun b!58746 () Bool)

(assert (=> b!58746 (= e!39002 (array_inv!1115 (buf!1593 thiss!1379)))))

(declare-fun b!58747 () Bool)

(declare-fun e!38997 () Bool)

(assert (=> b!58747 (= e!38996 e!38997)))

(declare-fun res!48827 () Bool)

(assert (=> b!58747 (=> res!48827 e!38997)))

(assert (=> b!58747 (= res!48827 (not (isPrefixOf!0 (_2!2784 lt!92602) (_2!2784 lt!92595))))))

(assert (=> b!58747 (isPrefixOf!0 thiss!1379 (_2!2784 lt!92595))))

(declare-fun lt!92590 () Unit!4047)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2112 BitStream!2112 BitStream!2112) Unit!4047)

(assert (=> b!58747 (= lt!92590 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2784 lt!92602) (_2!2784 lt!92595)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2112 array!2673 (_ BitVec 64) (_ BitVec 64)) tuple2!5346)

(assert (=> b!58747 (= lt!92595 (appendBitsMSBFirstLoop!0 (_2!2784 lt!92602) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38995 () Bool)

(assert (=> b!58747 e!38995))

(declare-fun res!48820 () Bool)

(assert (=> b!58747 (=> (not res!48820) (not e!38995))))

(assert (=> b!58747 (= res!48820 (validate_offset_bits!1 ((_ sign_extend 32) (size!1212 (buf!1593 (_2!2784 lt!92602)))) ((_ sign_extend 32) (currentByte!3211 thiss!1379)) ((_ sign_extend 32) (currentBit!3206 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92601 () Unit!4047)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2112 array!2673 (_ BitVec 64)) Unit!4047)

(assert (=> b!58747 (= lt!92601 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1593 (_2!2784 lt!92602)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5348 0))(
  ( (tuple2!5349 (_1!2785 BitStream!2112) (_2!2785 BitStream!2112)) )
))
(declare-fun lt!92589 () tuple2!5348)

(declare-fun reader!0 (BitStream!2112 BitStream!2112) tuple2!5348)

(assert (=> b!58747 (= lt!92589 (reader!0 thiss!1379 (_2!2784 lt!92602)))))

(declare-fun b!58748 () Bool)

(declare-fun res!48822 () Bool)

(assert (=> b!58748 (=> res!48822 e!39003)))

(assert (=> b!58748 (= res!48822 (not (= (size!1212 (buf!1593 thiss!1379)) (size!1212 (buf!1593 (_2!2784 lt!92595))))))))

(declare-fun b!58749 () Bool)

(assert (=> b!58749 (= e!38998 (not e!39005))))

(declare-fun res!48817 () Bool)

(assert (=> b!58749 (=> res!48817 e!39005)))

(assert (=> b!58749 (= res!48817 (bvsge i!635 to!314))))

(assert (=> b!58749 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92597 () Unit!4047)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2112) Unit!4047)

(assert (=> b!58749 (= lt!92597 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92594 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58749 (= lt!92594 (bitIndex!0 (size!1212 (buf!1593 thiss!1379)) (currentByte!3211 thiss!1379) (currentBit!3206 thiss!1379)))))

(declare-fun b!58750 () Bool)

(assert (=> b!58750 (= e!38997 e!39003)))

(declare-fun res!48819 () Bool)

(assert (=> b!58750 (=> res!48819 e!39003)))

(declare-fun lt!92591 () (_ BitVec 64))

(assert (=> b!58750 (= res!48819 (not (= lt!92591 (bvsub (bvadd lt!92594 to!314) i!635))))))

(assert (=> b!58750 (= lt!92591 (bitIndex!0 (size!1212 (buf!1593 (_2!2784 lt!92595))) (currentByte!3211 (_2!2784 lt!92595)) (currentBit!3206 (_2!2784 lt!92595))))))

(declare-fun b!58751 () Bool)

(assert (=> b!58751 (= e!39000 (= lt!92591 (bvsub (bvsub (bvadd (bitIndex!0 (size!1212 (buf!1593 (_2!2784 lt!92602))) (currentByte!3211 (_2!2784 lt!92602)) (currentBit!3206 (_2!2784 lt!92602))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58752 () Bool)

(declare-fun lt!92598 () (_ BitVec 64))

(assert (=> b!58752 (= e!39001 (or (= lt!92598 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!92598 (bvand lt!92599 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!58752 (= lt!92598 (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!92593 () tuple2!5348)

(assert (=> b!58752 (= lt!92593 (reader!0 (_2!2784 lt!92602) (_2!2784 lt!92595)))))

(assert (=> b!58752 (validate_offset_bits!1 ((_ sign_extend 32) (size!1212 (buf!1593 (_2!2784 lt!92595)))) ((_ sign_extend 32) (currentByte!3211 thiss!1379)) ((_ sign_extend 32) (currentBit!3206 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92596 () Unit!4047)

(assert (=> b!58752 (= lt!92596 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1593 (_2!2784 lt!92595)) (bvsub to!314 i!635)))))

(declare-fun lt!92592 () tuple2!5348)

(assert (=> b!58752 (= lt!92592 (reader!0 thiss!1379 (_2!2784 lt!92595)))))

(declare-fun b!58753 () Bool)

(declare-datatypes ((List!631 0))(
  ( (Nil!628) (Cons!627 (h!746 Bool) (t!1381 List!631)) )
))
(declare-fun head!450 (List!631) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2112 array!2673 (_ BitVec 64) (_ BitVec 64)) List!631)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2112 BitStream!2112 (_ BitVec 64)) List!631)

(assert (=> b!58753 (= e!38995 (= (head!450 (byteArrayBitContentToList!0 (_2!2784 lt!92602) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!450 (bitStreamReadBitsIntoList!0 (_2!2784 lt!92602) (_1!2785 lt!92589) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!11816 res!48823) b!58742))

(assert (= (and b!58742 res!48824) b!58749))

(assert (= (and b!58749 (not res!48817)) b!58743))

(assert (= (and b!58743 (not res!48821)) b!58747))

(assert (= (and b!58747 res!48820) b!58753))

(assert (= (and b!58747 (not res!48827)) b!58750))

(assert (= (and b!58750 (not res!48819)) b!58740))

(assert (= (and b!58740 (not res!48816)) b!58748))

(assert (= (and b!58748 (not res!48822)) b!58745))

(assert (= (and b!58745 res!48826) b!58751))

(assert (= (and b!58745 (not res!48828)) b!58741))

(assert (= (and b!58741 (not res!48818)) b!58744))

(assert (= (and b!58744 (not res!48825)) b!58752))

(assert (= start!11816 b!58746))

(declare-fun m!92513 () Bool)

(assert (=> b!58752 m!92513))

(declare-fun m!92515 () Bool)

(assert (=> b!58752 m!92515))

(declare-fun m!92517 () Bool)

(assert (=> b!58752 m!92517))

(declare-fun m!92519 () Bool)

(assert (=> b!58752 m!92519))

(declare-fun m!92521 () Bool)

(assert (=> b!58751 m!92521))

(declare-fun m!92523 () Bool)

(assert (=> b!58753 m!92523))

(assert (=> b!58753 m!92523))

(declare-fun m!92525 () Bool)

(assert (=> b!58753 m!92525))

(declare-fun m!92527 () Bool)

(assert (=> b!58753 m!92527))

(assert (=> b!58753 m!92527))

(declare-fun m!92529 () Bool)

(assert (=> b!58753 m!92529))

(declare-fun m!92531 () Bool)

(assert (=> b!58750 m!92531))

(declare-fun m!92533 () Bool)

(assert (=> b!58746 m!92533))

(declare-fun m!92535 () Bool)

(assert (=> start!11816 m!92535))

(declare-fun m!92537 () Bool)

(assert (=> start!11816 m!92537))

(declare-fun m!92539 () Bool)

(assert (=> b!58741 m!92539))

(declare-fun m!92541 () Bool)

(assert (=> b!58743 m!92541))

(declare-fun m!92543 () Bool)

(assert (=> b!58743 m!92543))

(declare-fun m!92545 () Bool)

(assert (=> b!58743 m!92545))

(assert (=> b!58743 m!92541))

(declare-fun m!92547 () Bool)

(assert (=> b!58743 m!92547))

(declare-fun m!92549 () Bool)

(assert (=> b!58743 m!92549))

(declare-fun m!92551 () Bool)

(assert (=> b!58744 m!92551))

(declare-fun m!92553 () Bool)

(assert (=> b!58749 m!92553))

(declare-fun m!92555 () Bool)

(assert (=> b!58749 m!92555))

(declare-fun m!92557 () Bool)

(assert (=> b!58749 m!92557))

(declare-fun m!92559 () Bool)

(assert (=> b!58742 m!92559))

(declare-fun m!92561 () Bool)

(assert (=> b!58740 m!92561))

(declare-fun m!92563 () Bool)

(assert (=> b!58747 m!92563))

(declare-fun m!92565 () Bool)

(assert (=> b!58747 m!92565))

(declare-fun m!92567 () Bool)

(assert (=> b!58747 m!92567))

(declare-fun m!92569 () Bool)

(assert (=> b!58747 m!92569))

(declare-fun m!92571 () Bool)

(assert (=> b!58747 m!92571))

(declare-fun m!92573 () Bool)

(assert (=> b!58747 m!92573))

(declare-fun m!92575 () Bool)

(assert (=> b!58747 m!92575))

(check-sat (not b!58743) (not start!11816) (not b!58741) (not b!58742) (not b!58740) (not b!58752) (not b!58751) (not b!58744) (not b!58746) (not b!58747) (not b!58753) (not b!58749) (not b!58750))
(check-sat)
