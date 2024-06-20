; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11860 () Bool)

(assert start!11860)

(declare-fun e!39721 () Bool)

(declare-datatypes ((array!2717 0))(
  ( (array!2718 (arr!1798 (Array (_ BitVec 32) (_ BitVec 8))) (size!1234 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2156 0))(
  ( (BitStream!2157 (buf!1615 array!2717) (currentByte!3233 (_ BitVec 32)) (currentBit!3228 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4091 0))(
  ( (Unit!4092) )
))
(declare-datatypes ((tuple2!5434 0))(
  ( (tuple2!5435 (_1!2828 Unit!4091) (_2!2828 BitStream!2156)) )
))
(declare-fun lt!93481 () tuple2!5434)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5436 0))(
  ( (tuple2!5437 (_1!2829 BitStream!2156) (_2!2829 BitStream!2156)) )
))
(declare-fun lt!93480 () tuple2!5436)

(declare-fun b!59664 () Bool)

(declare-fun srcBuffer!2 () array!2717)

(declare-datatypes ((List!653 0))(
  ( (Nil!650) (Cons!649 (h!768 Bool) (t!1403 List!653)) )
))
(declare-fun head!472 (List!653) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2156 array!2717 (_ BitVec 64) (_ BitVec 64)) List!653)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2156 BitStream!2156 (_ BitVec 64)) List!653)

(assert (=> b!59664 (= e!39721 (= (head!472 (byteArrayBitContentToList!0 (_2!2828 lt!93481) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!472 (bitStreamReadBitsIntoList!0 (_2!2828 lt!93481) (_1!2829 lt!93480) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59665 () Bool)

(declare-fun e!39729 () Bool)

(declare-fun thiss!1379 () BitStream!2156)

(declare-fun array_inv!1137 (array!2717) Bool)

(assert (=> b!59665 (= e!39729 (array_inv!1137 (buf!1615 thiss!1379)))))

(declare-fun b!59666 () Bool)

(declare-fun res!49675 () Bool)

(declare-fun e!39728 () Bool)

(assert (=> b!59666 (=> res!49675 e!39728)))

(declare-fun lt!93469 () tuple2!5434)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59666 (= res!49675 (not (invariant!0 (currentBit!3228 (_2!2828 lt!93481)) (currentByte!3233 (_2!2828 lt!93481)) (size!1234 (buf!1615 (_2!2828 lt!93469))))))))

(declare-fun b!59667 () Bool)

(declare-fun lt!93467 () (_ BitVec 64))

(declare-fun lt!93475 () (_ BitVec 64))

(assert (=> b!59667 (= e!39728 (or (= lt!93467 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!93467 (bvand lt!93475 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!59667 (= lt!93467 (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59667 (validate_offset_bits!1 ((_ sign_extend 32) (size!1234 (buf!1615 (_2!2828 lt!93469)))) ((_ sign_extend 32) (currentByte!3233 (_2!2828 lt!93481))) ((_ sign_extend 32) (currentBit!3228 (_2!2828 lt!93481))) lt!93475)))

(declare-fun lt!93476 () Unit!4091)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2156 array!2717 (_ BitVec 64)) Unit!4091)

(assert (=> b!59667 (= lt!93476 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2828 lt!93481) (buf!1615 (_2!2828 lt!93469)) lt!93475))))

(declare-fun lt!93477 () tuple2!5436)

(declare-fun reader!0 (BitStream!2156 BitStream!2156) tuple2!5436)

(assert (=> b!59667 (= lt!93477 (reader!0 (_2!2828 lt!93481) (_2!2828 lt!93469)))))

(assert (=> b!59667 (validate_offset_bits!1 ((_ sign_extend 32) (size!1234 (buf!1615 (_2!2828 lt!93469)))) ((_ sign_extend 32) (currentByte!3233 thiss!1379)) ((_ sign_extend 32) (currentBit!3228 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93478 () Unit!4091)

(assert (=> b!59667 (= lt!93478 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1615 (_2!2828 lt!93469)) (bvsub to!314 i!635)))))

(declare-fun lt!93470 () tuple2!5436)

(assert (=> b!59667 (= lt!93470 (reader!0 thiss!1379 (_2!2828 lt!93469)))))

(declare-fun b!59668 () Bool)

(declare-fun e!39726 () Bool)

(assert (=> b!59668 (= e!39726 e!39728)))

(declare-fun res!49686 () Bool)

(assert (=> b!59668 (=> res!49686 e!39728)))

(assert (=> b!59668 (= res!49686 (not (= (size!1234 (buf!1615 (_2!2828 lt!93481))) (size!1234 (buf!1615 (_2!2828 lt!93469))))))))

(declare-fun e!39723 () Bool)

(assert (=> b!59668 e!39723))

(declare-fun res!49677 () Bool)

(assert (=> b!59668 (=> (not res!49677) (not e!39723))))

(assert (=> b!59668 (= res!49677 (= (size!1234 (buf!1615 (_2!2828 lt!93469))) (size!1234 (buf!1615 thiss!1379))))))

(declare-fun b!59669 () Bool)

(declare-fun res!49682 () Bool)

(declare-fun e!39725 () Bool)

(assert (=> b!59669 (=> (not res!49682) (not e!39725))))

(assert (=> b!59669 (= res!49682 (validate_offset_bits!1 ((_ sign_extend 32) (size!1234 (buf!1615 thiss!1379))) ((_ sign_extend 32) (currentByte!3233 thiss!1379)) ((_ sign_extend 32) (currentBit!3228 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59670 () Bool)

(declare-fun res!49685 () Bool)

(assert (=> b!59670 (=> res!49685 e!39726)))

(assert (=> b!59670 (= res!49685 (not (= (size!1234 (buf!1615 thiss!1379)) (size!1234 (buf!1615 (_2!2828 lt!93469))))))))

(declare-fun b!59671 () Bool)

(declare-fun e!39731 () Bool)

(declare-fun e!39730 () Bool)

(assert (=> b!59671 (= e!39731 e!39730)))

(declare-fun res!49681 () Bool)

(assert (=> b!59671 (=> res!49681 e!39730)))

(declare-fun isPrefixOf!0 (BitStream!2156 BitStream!2156) Bool)

(assert (=> b!59671 (= res!49681 (not (isPrefixOf!0 (_2!2828 lt!93481) (_2!2828 lt!93469))))))

(assert (=> b!59671 (isPrefixOf!0 thiss!1379 (_2!2828 lt!93469))))

(declare-fun lt!93472 () Unit!4091)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2156 BitStream!2156 BitStream!2156) Unit!4091)

(assert (=> b!59671 (= lt!93472 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2828 lt!93481) (_2!2828 lt!93469)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2156 array!2717 (_ BitVec 64) (_ BitVec 64)) tuple2!5434)

(assert (=> b!59671 (= lt!93469 (appendBitsMSBFirstLoop!0 (_2!2828 lt!93481) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59671 e!39721))

(declare-fun res!49676 () Bool)

(assert (=> b!59671 (=> (not res!49676) (not e!39721))))

(assert (=> b!59671 (= res!49676 (validate_offset_bits!1 ((_ sign_extend 32) (size!1234 (buf!1615 (_2!2828 lt!93481)))) ((_ sign_extend 32) (currentByte!3233 thiss!1379)) ((_ sign_extend 32) (currentBit!3228 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93473 () Unit!4091)

(assert (=> b!59671 (= lt!93473 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1615 (_2!2828 lt!93481)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59671 (= lt!93480 (reader!0 thiss!1379 (_2!2828 lt!93481)))))

(declare-fun b!59672 () Bool)

(declare-fun res!49678 () Bool)

(assert (=> b!59672 (=> res!49678 e!39726)))

(assert (=> b!59672 (= res!49678 (not (invariant!0 (currentBit!3228 (_2!2828 lt!93469)) (currentByte!3233 (_2!2828 lt!93469)) (size!1234 (buf!1615 (_2!2828 lt!93469))))))))

(declare-fun b!59673 () Bool)

(declare-fun res!49683 () Bool)

(assert (=> b!59673 (=> res!49683 e!39728)))

(assert (=> b!59673 (= res!49683 (not (invariant!0 (currentBit!3228 (_2!2828 lt!93481)) (currentByte!3233 (_2!2828 lt!93481)) (size!1234 (buf!1615 (_2!2828 lt!93481))))))))

(declare-fun b!59675 () Bool)

(declare-fun e!39724 () Bool)

(assert (=> b!59675 (= e!39725 (not e!39724))))

(declare-fun res!49679 () Bool)

(assert (=> b!59675 (=> res!49679 e!39724)))

(assert (=> b!59675 (= res!49679 (bvsge i!635 to!314))))

(assert (=> b!59675 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93471 () Unit!4091)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2156) Unit!4091)

(assert (=> b!59675 (= lt!93471 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!93479 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59675 (= lt!93479 (bitIndex!0 (size!1234 (buf!1615 thiss!1379)) (currentByte!3233 thiss!1379) (currentBit!3228 thiss!1379)))))

(declare-fun b!59676 () Bool)

(assert (=> b!59676 (= e!39724 e!39731)))

(declare-fun res!49680 () Bool)

(assert (=> b!59676 (=> res!49680 e!39731)))

(assert (=> b!59676 (= res!49680 (not (isPrefixOf!0 thiss!1379 (_2!2828 lt!93481))))))

(assert (=> b!59676 (validate_offset_bits!1 ((_ sign_extend 32) (size!1234 (buf!1615 (_2!2828 lt!93481)))) ((_ sign_extend 32) (currentByte!3233 (_2!2828 lt!93481))) ((_ sign_extend 32) (currentBit!3228 (_2!2828 lt!93481))) lt!93475)))

(assert (=> b!59676 (= lt!93475 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93468 () Unit!4091)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2156 BitStream!2156 (_ BitVec 64) (_ BitVec 64)) Unit!4091)

(assert (=> b!59676 (= lt!93468 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2828 lt!93481) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2156 (_ BitVec 8) (_ BitVec 32)) tuple2!5434)

(assert (=> b!59676 (= lt!93481 (appendBitFromByte!0 thiss!1379 (select (arr!1798 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59677 () Bool)

(assert (=> b!59677 (= e!39730 e!39726)))

(declare-fun res!49674 () Bool)

(assert (=> b!59677 (=> res!49674 e!39726)))

(declare-fun lt!93474 () (_ BitVec 64))

(assert (=> b!59677 (= res!49674 (not (= lt!93474 (bvsub (bvadd lt!93479 to!314) i!635))))))

(assert (=> b!59677 (= lt!93474 (bitIndex!0 (size!1234 (buf!1615 (_2!2828 lt!93469))) (currentByte!3233 (_2!2828 lt!93469)) (currentBit!3228 (_2!2828 lt!93469))))))

(declare-fun res!49684 () Bool)

(assert (=> start!11860 (=> (not res!49684) (not e!39725))))

(assert (=> start!11860 (= res!49684 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1234 srcBuffer!2))))))))

(assert (=> start!11860 e!39725))

(assert (=> start!11860 true))

(assert (=> start!11860 (array_inv!1137 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2156) Bool)

(assert (=> start!11860 (and (inv!12 thiss!1379) e!39729)))

(declare-fun b!59674 () Bool)

(assert (=> b!59674 (= e!39723 (= lt!93474 (bvsub (bvsub (bvadd (bitIndex!0 (size!1234 (buf!1615 (_2!2828 lt!93481))) (currentByte!3233 (_2!2828 lt!93481)) (currentBit!3228 (_2!2828 lt!93481))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!11860 res!49684) b!59669))

(assert (= (and b!59669 res!49682) b!59675))

(assert (= (and b!59675 (not res!49679)) b!59676))

(assert (= (and b!59676 (not res!49680)) b!59671))

(assert (= (and b!59671 res!49676) b!59664))

(assert (= (and b!59671 (not res!49681)) b!59677))

(assert (= (and b!59677 (not res!49674)) b!59672))

(assert (= (and b!59672 (not res!49678)) b!59670))

(assert (= (and b!59670 (not res!49685)) b!59668))

(assert (= (and b!59668 res!49677) b!59674))

(assert (= (and b!59668 (not res!49686)) b!59673))

(assert (= (and b!59673 (not res!49683)) b!59666))

(assert (= (and b!59666 (not res!49675)) b!59667))

(assert (= start!11860 b!59665))

(declare-fun m!93965 () Bool)

(assert (=> b!59671 m!93965))

(declare-fun m!93967 () Bool)

(assert (=> b!59671 m!93967))

(declare-fun m!93969 () Bool)

(assert (=> b!59671 m!93969))

(declare-fun m!93971 () Bool)

(assert (=> b!59671 m!93971))

(declare-fun m!93973 () Bool)

(assert (=> b!59671 m!93973))

(declare-fun m!93975 () Bool)

(assert (=> b!59671 m!93975))

(declare-fun m!93977 () Bool)

(assert (=> b!59671 m!93977))

(declare-fun m!93979 () Bool)

(assert (=> b!59665 m!93979))

(declare-fun m!93981 () Bool)

(assert (=> b!59673 m!93981))

(declare-fun m!93983 () Bool)

(assert (=> b!59674 m!93983))

(declare-fun m!93985 () Bool)

(assert (=> b!59666 m!93985))

(declare-fun m!93987 () Bool)

(assert (=> b!59667 m!93987))

(declare-fun m!93989 () Bool)

(assert (=> b!59667 m!93989))

(declare-fun m!93991 () Bool)

(assert (=> b!59667 m!93991))

(declare-fun m!93993 () Bool)

(assert (=> b!59667 m!93993))

(declare-fun m!93995 () Bool)

(assert (=> b!59667 m!93995))

(declare-fun m!93997 () Bool)

(assert (=> b!59667 m!93997))

(declare-fun m!93999 () Bool)

(assert (=> b!59677 m!93999))

(declare-fun m!94001 () Bool)

(assert (=> start!11860 m!94001))

(declare-fun m!94003 () Bool)

(assert (=> start!11860 m!94003))

(declare-fun m!94005 () Bool)

(assert (=> b!59675 m!94005))

(declare-fun m!94007 () Bool)

(assert (=> b!59675 m!94007))

(declare-fun m!94009 () Bool)

(assert (=> b!59675 m!94009))

(declare-fun m!94011 () Bool)

(assert (=> b!59669 m!94011))

(declare-fun m!94013 () Bool)

(assert (=> b!59664 m!94013))

(assert (=> b!59664 m!94013))

(declare-fun m!94015 () Bool)

(assert (=> b!59664 m!94015))

(declare-fun m!94017 () Bool)

(assert (=> b!59664 m!94017))

(assert (=> b!59664 m!94017))

(declare-fun m!94019 () Bool)

(assert (=> b!59664 m!94019))

(declare-fun m!94021 () Bool)

(assert (=> b!59672 m!94021))

(declare-fun m!94023 () Bool)

(assert (=> b!59676 m!94023))

(declare-fun m!94025 () Bool)

(assert (=> b!59676 m!94025))

(declare-fun m!94027 () Bool)

(assert (=> b!59676 m!94027))

(declare-fun m!94029 () Bool)

(assert (=> b!59676 m!94029))

(assert (=> b!59676 m!94025))

(declare-fun m!94031 () Bool)

(assert (=> b!59676 m!94031))

(push 1)

(assert (not b!59677))

(assert (not b!59665))

(assert (not b!59676))

(assert (not b!59673))

(assert (not b!59667))

(assert (not b!59672))

(assert (not b!59675))

(assert (not b!59671))

(assert (not b!59669))

(assert (not b!59666))

(assert (not start!11860))

(assert (not b!59674))

(assert (not b!59664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

