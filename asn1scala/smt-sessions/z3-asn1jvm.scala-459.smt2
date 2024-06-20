; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12662 () Bool)

(assert start!12662)

(declare-fun b!64778 () Bool)

(declare-fun res!53753 () Bool)

(declare-fun e!42734 () Bool)

(assert (=> b!64778 (=> res!53753 e!42734)))

(declare-datatypes ((array!2826 0))(
  ( (array!2827 (arr!1863 (Array (_ BitVec 32) (_ BitVec 8))) (size!1299 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2244 0))(
  ( (BitStream!2245 (buf!1680 array!2826) (currentByte!3340 (_ BitVec 32)) (currentBit!3335 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5776 0))(
  ( (tuple2!5777 (_1!2999 BitStream!2244) (_2!2999 BitStream!2244)) )
))
(declare-fun lt!102486 () tuple2!5776)

(declare-fun lt!102481 () tuple2!5776)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!64778 (= res!53753 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102486))) (currentByte!3340 (_1!2999 lt!102486)) (currentBit!3335 (_1!2999 lt!102486)))) (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102481))) (currentByte!3340 (_1!2999 lt!102481)) (currentBit!3335 (_1!2999 lt!102481))))))))

(declare-fun srcBuffer!2 () array!2826)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!102473 () tuple2!5776)

(declare-datatypes ((Unit!4387 0))(
  ( (Unit!4388) )
))
(declare-datatypes ((tuple2!5778 0))(
  ( (tuple2!5779 (_1!3000 Unit!4387) (_2!3000 BitStream!2244)) )
))
(declare-fun lt!102474 () tuple2!5778)

(declare-fun e!42736 () Bool)

(declare-fun b!64779 () Bool)

(declare-datatypes ((List!697 0))(
  ( (Nil!694) (Cons!693 (h!812 Bool) (t!1447 List!697)) )
))
(declare-fun head!516 (List!697) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2244 array!2826 (_ BitVec 64) (_ BitVec 64)) List!697)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2244 BitStream!2244 (_ BitVec 64)) List!697)

(assert (=> b!64779 (= e!42736 (= (head!516 (byteArrayBitContentToList!0 (_2!3000 lt!102474) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!516 (bitStreamReadBitsIntoList!0 (_2!3000 lt!102474) (_1!2999 lt!102473) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun b!64780 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64780 (= e!42734 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_1!2999 lt!102486)))) ((_ sign_extend 32) (currentByte!3340 (_1!2999 lt!102486))) ((_ sign_extend 32) (currentBit!3335 (_1!2999 lt!102486))) (bvsub to!314 i!635)))))

(declare-fun b!64781 () Bool)

(declare-fun res!53755 () Bool)

(declare-fun e!42730 () Bool)

(assert (=> b!64781 (=> res!53755 e!42730)))

(declare-fun thiss!1379 () BitStream!2244)

(declare-fun lt!102483 () tuple2!5778)

(assert (=> b!64781 (= res!53755 (not (= (size!1299 (buf!1680 thiss!1379)) (size!1299 (buf!1680 (_2!3000 lt!102483))))))))

(declare-fun res!53769 () Bool)

(declare-fun e!42732 () Bool)

(assert (=> start!12662 (=> (not res!53769) (not e!42732))))

(assert (=> start!12662 (= res!53769 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1299 srcBuffer!2))))))))

(assert (=> start!12662 e!42732))

(assert (=> start!12662 true))

(declare-fun array_inv!1181 (array!2826) Bool)

(assert (=> start!12662 (array_inv!1181 srcBuffer!2)))

(declare-fun e!42731 () Bool)

(declare-fun inv!12 (BitStream!2244) Bool)

(assert (=> start!12662 (and (inv!12 thiss!1379) e!42731)))

(declare-fun b!64782 () Bool)

(declare-fun res!53761 () Bool)

(assert (=> b!64782 (=> res!53761 e!42730)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!64782 (= res!53761 (not (invariant!0 (currentBit!3335 (_2!3000 lt!102483)) (currentByte!3340 (_2!3000 lt!102483)) (size!1299 (buf!1680 (_2!3000 lt!102483))))))))

(declare-fun b!64783 () Bool)

(assert (=> b!64783 (= e!42731 (array_inv!1181 (buf!1680 thiss!1379)))))

(declare-fun b!64784 () Bool)

(declare-fun res!53756 () Bool)

(declare-fun e!42733 () Bool)

(assert (=> b!64784 (=> res!53756 e!42733)))

(assert (=> b!64784 (= res!53756 (not (invariant!0 (currentBit!3335 (_2!3000 lt!102474)) (currentByte!3340 (_2!3000 lt!102474)) (size!1299 (buf!1680 (_2!3000 lt!102483))))))))

(declare-fun b!64785 () Bool)

(declare-fun e!42726 () Bool)

(assert (=> b!64785 (= e!42726 e!42730)))

(declare-fun res!53772 () Bool)

(assert (=> b!64785 (=> res!53772 e!42730)))

(declare-fun lt!102475 () (_ BitVec 64))

(declare-fun lt!102476 () (_ BitVec 64))

(assert (=> b!64785 (= res!53772 (not (= lt!102476 (bvsub (bvadd lt!102475 to!314) i!635))))))

(assert (=> b!64785 (= lt!102476 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102483))) (currentByte!3340 (_2!3000 lt!102483)) (currentBit!3335 (_2!3000 lt!102483))))))

(declare-fun b!64786 () Bool)

(declare-fun res!53758 () Bool)

(assert (=> b!64786 (=> res!53758 e!42733)))

(assert (=> b!64786 (= res!53758 (not (invariant!0 (currentBit!3335 (_2!3000 lt!102474)) (currentByte!3340 (_2!3000 lt!102474)) (size!1299 (buf!1680 (_2!3000 lt!102474))))))))

(declare-fun b!64787 () Bool)

(declare-fun res!53771 () Bool)

(assert (=> b!64787 (=> res!53771 e!42734)))

(declare-fun isPrefixOf!0 (BitStream!2244 BitStream!2244) Bool)

(assert (=> b!64787 (= res!53771 (not (isPrefixOf!0 (_1!2999 lt!102486) (_1!2999 lt!102481))))))

(declare-fun e!42729 () Bool)

(declare-fun b!64788 () Bool)

(assert (=> b!64788 (= e!42729 (= lt!102476 (bvsub (bvsub (bvadd (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64789 () Bool)

(declare-fun e!42727 () Bool)

(declare-fun e!42728 () Bool)

(assert (=> b!64789 (= e!42727 e!42728)))

(declare-fun res!53768 () Bool)

(assert (=> b!64789 (=> res!53768 e!42728)))

(assert (=> b!64789 (= res!53768 (not (isPrefixOf!0 thiss!1379 (_2!3000 lt!102474))))))

(declare-fun lt!102484 () (_ BitVec 64))

(assert (=> b!64789 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) lt!102484)))

(assert (=> b!64789 (= lt!102484 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102482 () Unit!4387)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2244 BitStream!2244 (_ BitVec 64) (_ BitVec 64)) Unit!4387)

(assert (=> b!64789 (= lt!102482 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3000 lt!102474) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2244 (_ BitVec 8) (_ BitVec 32)) tuple2!5778)

(assert (=> b!64789 (= lt!102474 (appendBitFromByte!0 thiss!1379 (select (arr!1863 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!64790 () Bool)

(assert (=> b!64790 (= e!42728 e!42726)))

(declare-fun res!53759 () Bool)

(assert (=> b!64790 (=> res!53759 e!42726)))

(assert (=> b!64790 (= res!53759 (not (isPrefixOf!0 (_2!3000 lt!102474) (_2!3000 lt!102483))))))

(assert (=> b!64790 (isPrefixOf!0 thiss!1379 (_2!3000 lt!102483))))

(declare-fun lt!102487 () Unit!4387)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2244 BitStream!2244 BitStream!2244) Unit!4387)

(assert (=> b!64790 (= lt!102487 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3000 lt!102474) (_2!3000 lt!102483)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2244 array!2826 (_ BitVec 64) (_ BitVec 64)) tuple2!5778)

(assert (=> b!64790 (= lt!102483 (appendBitsMSBFirstLoop!0 (_2!3000 lt!102474) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!64790 e!42736))

(declare-fun res!53770 () Bool)

(assert (=> b!64790 (=> (not res!53770) (not e!42736))))

(assert (=> b!64790 (= res!53770 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102485 () Unit!4387)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2244 array!2826 (_ BitVec 64)) Unit!4387)

(assert (=> b!64790 (= lt!102485 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1680 (_2!3000 lt!102474)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2244 BitStream!2244) tuple2!5776)

(assert (=> b!64790 (= lt!102473 (reader!0 thiss!1379 (_2!3000 lt!102474)))))

(declare-fun b!64791 () Bool)

(declare-fun res!53764 () Bool)

(assert (=> b!64791 (=> res!53764 e!42734)))

(assert (=> b!64791 (= res!53764 (or (not (= (buf!1680 (_1!2999 lt!102486)) (buf!1680 (_1!2999 lt!102481)))) (not (= (buf!1680 (_1!2999 lt!102486)) (buf!1680 (_2!3000 lt!102483)))) (bvsge lt!102476 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!64792 () Bool)

(declare-fun res!53766 () Bool)

(assert (=> b!64792 (=> res!53766 e!42734)))

(assert (=> b!64792 (= res!53766 (not (isPrefixOf!0 (_1!2999 lt!102481) (_2!3000 lt!102483))))))

(declare-fun b!64793 () Bool)

(assert (=> b!64793 (= e!42733 e!42734)))

(declare-fun res!53765 () Bool)

(assert (=> b!64793 (=> res!53765 e!42734)))

(assert (=> b!64793 (= res!53765 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102479 () List!697)

(assert (=> b!64793 (= lt!102479 (bitStreamReadBitsIntoList!0 (_2!3000 lt!102483) (_1!2999 lt!102481) lt!102484))))

(declare-fun lt!102477 () List!697)

(assert (=> b!64793 (= lt!102477 (bitStreamReadBitsIntoList!0 (_2!3000 lt!102483) (_1!2999 lt!102486) (bvsub to!314 i!635)))))

(assert (=> b!64793 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) lt!102484)))

(declare-fun lt!102478 () Unit!4387)

(assert (=> b!64793 (= lt!102478 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3000 lt!102474) (buf!1680 (_2!3000 lt!102483)) lt!102484))))

(assert (=> b!64793 (= lt!102481 (reader!0 (_2!3000 lt!102474) (_2!3000 lt!102483)))))

(assert (=> b!64793 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!102472 () Unit!4387)

(assert (=> b!64793 (= lt!102472 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1680 (_2!3000 lt!102483)) (bvsub to!314 i!635)))))

(assert (=> b!64793 (= lt!102486 (reader!0 thiss!1379 (_2!3000 lt!102483)))))

(declare-fun b!64794 () Bool)

(declare-fun res!53760 () Bool)

(assert (=> b!64794 (=> (not res!53760) (not e!42732))))

(assert (=> b!64794 (= res!53760 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 thiss!1379))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!64795 () Bool)

(declare-fun res!53762 () Bool)

(assert (=> b!64795 (=> res!53762 e!42734)))

(declare-fun length!325 (List!697) Int)

(assert (=> b!64795 (= res!53762 (<= (length!325 lt!102477) 0))))

(declare-fun b!64796 () Bool)

(assert (=> b!64796 (= e!42730 e!42733)))

(declare-fun res!53757 () Bool)

(assert (=> b!64796 (=> res!53757 e!42733)))

(assert (=> b!64796 (= res!53757 (not (= (size!1299 (buf!1680 (_2!3000 lt!102474))) (size!1299 (buf!1680 (_2!3000 lt!102483))))))))

(assert (=> b!64796 e!42729))

(declare-fun res!53763 () Bool)

(assert (=> b!64796 (=> (not res!53763) (not e!42729))))

(assert (=> b!64796 (= res!53763 (= (size!1299 (buf!1680 (_2!3000 lt!102483))) (size!1299 (buf!1680 thiss!1379))))))

(declare-fun b!64797 () Bool)

(assert (=> b!64797 (= e!42732 (not e!42727))))

(declare-fun res!53754 () Bool)

(assert (=> b!64797 (=> res!53754 e!42727)))

(assert (=> b!64797 (= res!53754 (bvsge i!635 to!314))))

(assert (=> b!64797 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!102480 () Unit!4387)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2244) Unit!4387)

(assert (=> b!64797 (= lt!102480 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!64797 (= lt!102475 (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)))))

(declare-fun b!64798 () Bool)

(declare-fun res!53767 () Bool)

(assert (=> b!64798 (=> res!53767 e!42734)))

(assert (=> b!64798 (= res!53767 (not (isPrefixOf!0 (_1!2999 lt!102486) (_2!3000 lt!102483))))))

(assert (= (and start!12662 res!53769) b!64794))

(assert (= (and b!64794 res!53760) b!64797))

(assert (= (and b!64797 (not res!53754)) b!64789))

(assert (= (and b!64789 (not res!53768)) b!64790))

(assert (= (and b!64790 res!53770) b!64779))

(assert (= (and b!64790 (not res!53759)) b!64785))

(assert (= (and b!64785 (not res!53772)) b!64782))

(assert (= (and b!64782 (not res!53761)) b!64781))

(assert (= (and b!64781 (not res!53755)) b!64796))

(assert (= (and b!64796 res!53763) b!64788))

(assert (= (and b!64796 (not res!53757)) b!64786))

(assert (= (and b!64786 (not res!53758)) b!64784))

(assert (= (and b!64784 (not res!53756)) b!64793))

(assert (= (and b!64793 (not res!53765)) b!64795))

(assert (= (and b!64795 (not res!53762)) b!64798))

(assert (= (and b!64798 (not res!53767)) b!64792))

(assert (= (and b!64792 (not res!53766)) b!64787))

(assert (= (and b!64787 (not res!53771)) b!64791))

(assert (= (and b!64791 (not res!53764)) b!64778))

(assert (= (and b!64778 (not res!53753)) b!64780))

(assert (= start!12662 b!64783))

(declare-fun m!102789 () Bool)

(assert (=> b!64786 m!102789))

(declare-fun m!102791 () Bool)

(assert (=> b!64795 m!102791))

(declare-fun m!102793 () Bool)

(assert (=> b!64792 m!102793))

(declare-fun m!102795 () Bool)

(assert (=> b!64793 m!102795))

(declare-fun m!102797 () Bool)

(assert (=> b!64793 m!102797))

(declare-fun m!102799 () Bool)

(assert (=> b!64793 m!102799))

(declare-fun m!102801 () Bool)

(assert (=> b!64793 m!102801))

(declare-fun m!102803 () Bool)

(assert (=> b!64793 m!102803))

(declare-fun m!102805 () Bool)

(assert (=> b!64793 m!102805))

(declare-fun m!102807 () Bool)

(assert (=> b!64793 m!102807))

(declare-fun m!102809 () Bool)

(assert (=> b!64793 m!102809))

(declare-fun m!102811 () Bool)

(assert (=> b!64789 m!102811))

(declare-fun m!102813 () Bool)

(assert (=> b!64789 m!102813))

(declare-fun m!102815 () Bool)

(assert (=> b!64789 m!102815))

(declare-fun m!102817 () Bool)

(assert (=> b!64789 m!102817))

(declare-fun m!102819 () Bool)

(assert (=> b!64789 m!102819))

(assert (=> b!64789 m!102815))

(declare-fun m!102821 () Bool)

(assert (=> b!64787 m!102821))

(declare-fun m!102823 () Bool)

(assert (=> b!64798 m!102823))

(declare-fun m!102825 () Bool)

(assert (=> b!64794 m!102825))

(declare-fun m!102827 () Bool)

(assert (=> b!64797 m!102827))

(declare-fun m!102829 () Bool)

(assert (=> b!64797 m!102829))

(declare-fun m!102831 () Bool)

(assert (=> b!64797 m!102831))

(declare-fun m!102833 () Bool)

(assert (=> b!64778 m!102833))

(declare-fun m!102835 () Bool)

(assert (=> b!64778 m!102835))

(declare-fun m!102837 () Bool)

(assert (=> b!64788 m!102837))

(declare-fun m!102839 () Bool)

(assert (=> start!12662 m!102839))

(declare-fun m!102841 () Bool)

(assert (=> start!12662 m!102841))

(declare-fun m!102843 () Bool)

(assert (=> b!64782 m!102843))

(declare-fun m!102845 () Bool)

(assert (=> b!64790 m!102845))

(declare-fun m!102847 () Bool)

(assert (=> b!64790 m!102847))

(declare-fun m!102849 () Bool)

(assert (=> b!64790 m!102849))

(declare-fun m!102851 () Bool)

(assert (=> b!64790 m!102851))

(declare-fun m!102853 () Bool)

(assert (=> b!64790 m!102853))

(declare-fun m!102855 () Bool)

(assert (=> b!64790 m!102855))

(declare-fun m!102857 () Bool)

(assert (=> b!64790 m!102857))

(declare-fun m!102859 () Bool)

(assert (=> b!64780 m!102859))

(declare-fun m!102861 () Bool)

(assert (=> b!64779 m!102861))

(assert (=> b!64779 m!102861))

(declare-fun m!102863 () Bool)

(assert (=> b!64779 m!102863))

(declare-fun m!102865 () Bool)

(assert (=> b!64779 m!102865))

(assert (=> b!64779 m!102865))

(declare-fun m!102867 () Bool)

(assert (=> b!64779 m!102867))

(declare-fun m!102869 () Bool)

(assert (=> b!64783 m!102869))

(declare-fun m!102871 () Bool)

(assert (=> b!64784 m!102871))

(declare-fun m!102873 () Bool)

(assert (=> b!64785 m!102873))

(check-sat (not b!64787) (not b!64785) (not b!64798) (not b!64778) (not b!64797) (not b!64784) (not b!64793) (not b!64779) (not start!12662) (not b!64780) (not b!64782) (not b!64794) (not b!64788) (not b!64789) (not b!64786) (not b!64790) (not b!64783) (not b!64792) (not b!64795))
(check-sat)
(get-model)

(declare-fun d!20238 () Bool)

(assert (=> d!20238 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) lt!102484)))

(declare-fun lt!102538 () Unit!4387)

(declare-fun choose!9 (BitStream!2244 array!2826 (_ BitVec 64) BitStream!2244) Unit!4387)

(assert (=> d!20238 (= lt!102538 (choose!9 (_2!3000 lt!102474) (buf!1680 (_2!3000 lt!102483)) lt!102484 (BitStream!2245 (buf!1680 (_2!3000 lt!102483)) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474)))))))

(assert (=> d!20238 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3000 lt!102474) (buf!1680 (_2!3000 lt!102483)) lt!102484) lt!102538)))

(declare-fun bs!4959 () Bool)

(assert (= bs!4959 d!20238))

(assert (=> bs!4959 m!102795))

(declare-fun m!102961 () Bool)

(assert (=> bs!4959 m!102961))

(assert (=> b!64793 d!20238))

(declare-fun b!64872 () Bool)

(declare-fun e!42779 () Bool)

(declare-fun lt!102545 () List!697)

(declare-fun isEmpty!201 (List!697) Bool)

(assert (=> b!64872 (= e!42779 (isEmpty!201 lt!102545))))

(declare-fun b!64870 () Bool)

(declare-datatypes ((tuple2!5784 0))(
  ( (tuple2!5785 (_1!3003 List!697) (_2!3003 BitStream!2244)) )
))
(declare-fun e!42778 () tuple2!5784)

(assert (=> b!64870 (= e!42778 (tuple2!5785 Nil!694 (_1!2999 lt!102486)))))

(declare-fun d!20240 () Bool)

(assert (=> d!20240 e!42779))

(declare-fun c!4674 () Bool)

(assert (=> d!20240 (= c!4674 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20240 (= lt!102545 (_1!3003 e!42778))))

(declare-fun c!4673 () Bool)

(assert (=> d!20240 (= c!4673 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20240 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20240 (= (bitStreamReadBitsIntoList!0 (_2!3000 lt!102483) (_1!2999 lt!102486) (bvsub to!314 i!635)) lt!102545)))

(declare-fun lt!102547 () (_ BitVec 64))

(declare-fun b!64871 () Bool)

(declare-datatypes ((tuple2!5786 0))(
  ( (tuple2!5787 (_1!3004 Bool) (_2!3004 BitStream!2244)) )
))
(declare-fun lt!102546 () tuple2!5786)

(assert (=> b!64871 (= e!42778 (tuple2!5785 (Cons!693 (_1!3004 lt!102546) (bitStreamReadBitsIntoList!0 (_2!3000 lt!102483) (_2!3004 lt!102546) (bvsub (bvsub to!314 i!635) lt!102547))) (_2!3004 lt!102546)))))

(declare-fun readBit!0 (BitStream!2244) tuple2!5786)

(assert (=> b!64871 (= lt!102546 (readBit!0 (_1!2999 lt!102486)))))

(assert (=> b!64871 (= lt!102547 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!64873 () Bool)

(assert (=> b!64873 (= e!42779 (> (length!325 lt!102545) 0))))

(assert (= (and d!20240 c!4673) b!64870))

(assert (= (and d!20240 (not c!4673)) b!64871))

(assert (= (and d!20240 c!4674) b!64872))

(assert (= (and d!20240 (not c!4674)) b!64873))

(declare-fun m!102963 () Bool)

(assert (=> b!64872 m!102963))

(declare-fun m!102965 () Bool)

(assert (=> b!64871 m!102965))

(declare-fun m!102967 () Bool)

(assert (=> b!64871 m!102967))

(declare-fun m!102969 () Bool)

(assert (=> b!64873 m!102969))

(assert (=> b!64793 d!20240))

(declare-fun d!20242 () Bool)

(assert (=> d!20242 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!102548 () Unit!4387)

(assert (=> d!20242 (= lt!102548 (choose!9 thiss!1379 (buf!1680 (_2!3000 lt!102483)) (bvsub to!314 i!635) (BitStream!2245 (buf!1680 (_2!3000 lt!102483)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379))))))

(assert (=> d!20242 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1680 (_2!3000 lt!102483)) (bvsub to!314 i!635)) lt!102548)))

(declare-fun bs!4960 () Bool)

(assert (= bs!4960 d!20242))

(assert (=> bs!4960 m!102809))

(declare-fun m!102971 () Bool)

(assert (=> bs!4960 m!102971))

(assert (=> b!64793 d!20242))

(declare-fun d!20244 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20244 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) lt!102484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474)))) lt!102484))))

(declare-fun bs!4961 () Bool)

(assert (= bs!4961 d!20244))

(declare-fun m!102973 () Bool)

(assert (=> bs!4961 m!102973))

(assert (=> b!64793 d!20244))

(declare-fun b!64884 () Bool)

(declare-fun e!42784 () Unit!4387)

(declare-fun Unit!4391 () Unit!4387)

(assert (=> b!64884 (= e!42784 Unit!4391)))

(declare-fun b!64885 () Bool)

(declare-fun lt!102590 () Unit!4387)

(assert (=> b!64885 (= e!42784 lt!102590)))

(declare-fun lt!102601 () (_ BitVec 64))

(assert (=> b!64885 (= lt!102601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102594 () (_ BitVec 64))

(assert (=> b!64885 (= lt!102594 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2826 array!2826 (_ BitVec 64) (_ BitVec 64)) Unit!4387)

(assert (=> b!64885 (= lt!102590 (arrayBitRangesEqSymmetric!0 (buf!1680 (_2!3000 lt!102474)) (buf!1680 (_2!3000 lt!102483)) lt!102601 lt!102594))))

(declare-fun arrayBitRangesEq!0 (array!2826 array!2826 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64885 (arrayBitRangesEq!0 (buf!1680 (_2!3000 lt!102483)) (buf!1680 (_2!3000 lt!102474)) lt!102601 lt!102594)))

(declare-fun d!20246 () Bool)

(declare-fun e!42785 () Bool)

(assert (=> d!20246 e!42785))

(declare-fun res!53839 () Bool)

(assert (=> d!20246 (=> (not res!53839) (not e!42785))))

(declare-fun lt!102593 () tuple2!5776)

(assert (=> d!20246 (= res!53839 (isPrefixOf!0 (_1!2999 lt!102593) (_2!2999 lt!102593)))))

(declare-fun lt!102605 () BitStream!2244)

(assert (=> d!20246 (= lt!102593 (tuple2!5777 lt!102605 (_2!3000 lt!102483)))))

(declare-fun lt!102595 () Unit!4387)

(declare-fun lt!102592 () Unit!4387)

(assert (=> d!20246 (= lt!102595 lt!102592)))

(assert (=> d!20246 (isPrefixOf!0 lt!102605 (_2!3000 lt!102483))))

(assert (=> d!20246 (= lt!102592 (lemmaIsPrefixTransitive!0 lt!102605 (_2!3000 lt!102483) (_2!3000 lt!102483)))))

(declare-fun lt!102607 () Unit!4387)

(declare-fun lt!102603 () Unit!4387)

(assert (=> d!20246 (= lt!102607 lt!102603)))

(assert (=> d!20246 (isPrefixOf!0 lt!102605 (_2!3000 lt!102483))))

(assert (=> d!20246 (= lt!102603 (lemmaIsPrefixTransitive!0 lt!102605 (_2!3000 lt!102474) (_2!3000 lt!102483)))))

(declare-fun lt!102599 () Unit!4387)

(assert (=> d!20246 (= lt!102599 e!42784)))

(declare-fun c!4677 () Bool)

(assert (=> d!20246 (= c!4677 (not (= (size!1299 (buf!1680 (_2!3000 lt!102474))) #b00000000000000000000000000000000)))))

(declare-fun lt!102589 () Unit!4387)

(declare-fun lt!102608 () Unit!4387)

(assert (=> d!20246 (= lt!102589 lt!102608)))

(assert (=> d!20246 (isPrefixOf!0 (_2!3000 lt!102483) (_2!3000 lt!102483))))

(assert (=> d!20246 (= lt!102608 (lemmaIsPrefixRefl!0 (_2!3000 lt!102483)))))

(declare-fun lt!102591 () Unit!4387)

(declare-fun lt!102602 () Unit!4387)

(assert (=> d!20246 (= lt!102591 lt!102602)))

(assert (=> d!20246 (= lt!102602 (lemmaIsPrefixRefl!0 (_2!3000 lt!102483)))))

(declare-fun lt!102596 () Unit!4387)

(declare-fun lt!102606 () Unit!4387)

(assert (=> d!20246 (= lt!102596 lt!102606)))

(assert (=> d!20246 (isPrefixOf!0 lt!102605 lt!102605)))

(assert (=> d!20246 (= lt!102606 (lemmaIsPrefixRefl!0 lt!102605))))

(declare-fun lt!102598 () Unit!4387)

(declare-fun lt!102597 () Unit!4387)

(assert (=> d!20246 (= lt!102598 lt!102597)))

(assert (=> d!20246 (isPrefixOf!0 (_2!3000 lt!102474) (_2!3000 lt!102474))))

(assert (=> d!20246 (= lt!102597 (lemmaIsPrefixRefl!0 (_2!3000 lt!102474)))))

(assert (=> d!20246 (= lt!102605 (BitStream!2245 (buf!1680 (_2!3000 lt!102483)) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))))))

(assert (=> d!20246 (isPrefixOf!0 (_2!3000 lt!102474) (_2!3000 lt!102483))))

(assert (=> d!20246 (= (reader!0 (_2!3000 lt!102474) (_2!3000 lt!102483)) lt!102593)))

(declare-fun lt!102604 () (_ BitVec 64))

(declare-fun lt!102600 () (_ BitVec 64))

(declare-fun b!64886 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2244 (_ BitVec 64)) BitStream!2244)

(assert (=> b!64886 (= e!42785 (= (_1!2999 lt!102593) (withMovedBitIndex!0 (_2!2999 lt!102593) (bvsub lt!102600 lt!102604))))))

(assert (=> b!64886 (or (= (bvand lt!102600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102604 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102600 lt!102604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64886 (= lt!102604 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102483))) (currentByte!3340 (_2!3000 lt!102483)) (currentBit!3335 (_2!3000 lt!102483))))))

(assert (=> b!64886 (= lt!102600 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))))))

(declare-fun b!64887 () Bool)

(declare-fun res!53841 () Bool)

(assert (=> b!64887 (=> (not res!53841) (not e!42785))))

(assert (=> b!64887 (= res!53841 (isPrefixOf!0 (_2!2999 lt!102593) (_2!3000 lt!102483)))))

(declare-fun b!64888 () Bool)

(declare-fun res!53840 () Bool)

(assert (=> b!64888 (=> (not res!53840) (not e!42785))))

(assert (=> b!64888 (= res!53840 (isPrefixOf!0 (_1!2999 lt!102593) (_2!3000 lt!102474)))))

(assert (= (and d!20246 c!4677) b!64885))

(assert (= (and d!20246 (not c!4677)) b!64884))

(assert (= (and d!20246 res!53839) b!64888))

(assert (= (and b!64888 res!53840) b!64887))

(assert (= (and b!64887 res!53841) b!64886))

(declare-fun m!102975 () Bool)

(assert (=> b!64887 m!102975))

(assert (=> b!64885 m!102837))

(declare-fun m!102977 () Bool)

(assert (=> b!64885 m!102977))

(declare-fun m!102979 () Bool)

(assert (=> b!64885 m!102979))

(declare-fun m!102981 () Bool)

(assert (=> b!64888 m!102981))

(assert (=> d!20246 m!102853))

(declare-fun m!102983 () Bool)

(assert (=> d!20246 m!102983))

(declare-fun m!102985 () Bool)

(assert (=> d!20246 m!102985))

(declare-fun m!102987 () Bool)

(assert (=> d!20246 m!102987))

(declare-fun m!102989 () Bool)

(assert (=> d!20246 m!102989))

(declare-fun m!102991 () Bool)

(assert (=> d!20246 m!102991))

(declare-fun m!102993 () Bool)

(assert (=> d!20246 m!102993))

(declare-fun m!102995 () Bool)

(assert (=> d!20246 m!102995))

(declare-fun m!102997 () Bool)

(assert (=> d!20246 m!102997))

(declare-fun m!102999 () Bool)

(assert (=> d!20246 m!102999))

(declare-fun m!103001 () Bool)

(assert (=> d!20246 m!103001))

(declare-fun m!103003 () Bool)

(assert (=> b!64886 m!103003))

(assert (=> b!64886 m!102873))

(assert (=> b!64886 m!102837))

(assert (=> b!64793 d!20246))

(declare-fun b!64889 () Bool)

(declare-fun e!42786 () Unit!4387)

(declare-fun Unit!4392 () Unit!4387)

(assert (=> b!64889 (= e!42786 Unit!4392)))

(declare-fun b!64890 () Bool)

(declare-fun lt!102610 () Unit!4387)

(assert (=> b!64890 (= e!42786 lt!102610)))

(declare-fun lt!102621 () (_ BitVec 64))

(assert (=> b!64890 (= lt!102621 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102614 () (_ BitVec 64))

(assert (=> b!64890 (= lt!102614 (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)))))

(assert (=> b!64890 (= lt!102610 (arrayBitRangesEqSymmetric!0 (buf!1680 thiss!1379) (buf!1680 (_2!3000 lt!102483)) lt!102621 lt!102614))))

(assert (=> b!64890 (arrayBitRangesEq!0 (buf!1680 (_2!3000 lt!102483)) (buf!1680 thiss!1379) lt!102621 lt!102614)))

(declare-fun d!20248 () Bool)

(declare-fun e!42787 () Bool)

(assert (=> d!20248 e!42787))

(declare-fun res!53842 () Bool)

(assert (=> d!20248 (=> (not res!53842) (not e!42787))))

(declare-fun lt!102613 () tuple2!5776)

(assert (=> d!20248 (= res!53842 (isPrefixOf!0 (_1!2999 lt!102613) (_2!2999 lt!102613)))))

(declare-fun lt!102625 () BitStream!2244)

(assert (=> d!20248 (= lt!102613 (tuple2!5777 lt!102625 (_2!3000 lt!102483)))))

(declare-fun lt!102615 () Unit!4387)

(declare-fun lt!102612 () Unit!4387)

(assert (=> d!20248 (= lt!102615 lt!102612)))

(assert (=> d!20248 (isPrefixOf!0 lt!102625 (_2!3000 lt!102483))))

(assert (=> d!20248 (= lt!102612 (lemmaIsPrefixTransitive!0 lt!102625 (_2!3000 lt!102483) (_2!3000 lt!102483)))))

(declare-fun lt!102627 () Unit!4387)

(declare-fun lt!102623 () Unit!4387)

(assert (=> d!20248 (= lt!102627 lt!102623)))

(assert (=> d!20248 (isPrefixOf!0 lt!102625 (_2!3000 lt!102483))))

(assert (=> d!20248 (= lt!102623 (lemmaIsPrefixTransitive!0 lt!102625 thiss!1379 (_2!3000 lt!102483)))))

(declare-fun lt!102619 () Unit!4387)

(assert (=> d!20248 (= lt!102619 e!42786)))

(declare-fun c!4678 () Bool)

(assert (=> d!20248 (= c!4678 (not (= (size!1299 (buf!1680 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!102609 () Unit!4387)

(declare-fun lt!102628 () Unit!4387)

(assert (=> d!20248 (= lt!102609 lt!102628)))

(assert (=> d!20248 (isPrefixOf!0 (_2!3000 lt!102483) (_2!3000 lt!102483))))

(assert (=> d!20248 (= lt!102628 (lemmaIsPrefixRefl!0 (_2!3000 lt!102483)))))

(declare-fun lt!102611 () Unit!4387)

(declare-fun lt!102622 () Unit!4387)

(assert (=> d!20248 (= lt!102611 lt!102622)))

(assert (=> d!20248 (= lt!102622 (lemmaIsPrefixRefl!0 (_2!3000 lt!102483)))))

(declare-fun lt!102616 () Unit!4387)

(declare-fun lt!102626 () Unit!4387)

(assert (=> d!20248 (= lt!102616 lt!102626)))

(assert (=> d!20248 (isPrefixOf!0 lt!102625 lt!102625)))

(assert (=> d!20248 (= lt!102626 (lemmaIsPrefixRefl!0 lt!102625))))

(declare-fun lt!102618 () Unit!4387)

(declare-fun lt!102617 () Unit!4387)

(assert (=> d!20248 (= lt!102618 lt!102617)))

(assert (=> d!20248 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20248 (= lt!102617 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20248 (= lt!102625 (BitStream!2245 (buf!1680 (_2!3000 lt!102483)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)))))

(assert (=> d!20248 (isPrefixOf!0 thiss!1379 (_2!3000 lt!102483))))

(assert (=> d!20248 (= (reader!0 thiss!1379 (_2!3000 lt!102483)) lt!102613)))

(declare-fun lt!102624 () (_ BitVec 64))

(declare-fun b!64891 () Bool)

(declare-fun lt!102620 () (_ BitVec 64))

(assert (=> b!64891 (= e!42787 (= (_1!2999 lt!102613) (withMovedBitIndex!0 (_2!2999 lt!102613) (bvsub lt!102620 lt!102624))))))

(assert (=> b!64891 (or (= (bvand lt!102620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102624 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102620 lt!102624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64891 (= lt!102624 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102483))) (currentByte!3340 (_2!3000 lt!102483)) (currentBit!3335 (_2!3000 lt!102483))))))

(assert (=> b!64891 (= lt!102620 (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)))))

(declare-fun b!64892 () Bool)

(declare-fun res!53844 () Bool)

(assert (=> b!64892 (=> (not res!53844) (not e!42787))))

(assert (=> b!64892 (= res!53844 (isPrefixOf!0 (_2!2999 lt!102613) (_2!3000 lt!102483)))))

(declare-fun b!64893 () Bool)

(declare-fun res!53843 () Bool)

(assert (=> b!64893 (=> (not res!53843) (not e!42787))))

(assert (=> b!64893 (= res!53843 (isPrefixOf!0 (_1!2999 lt!102613) thiss!1379))))

(assert (= (and d!20248 c!4678) b!64890))

(assert (= (and d!20248 (not c!4678)) b!64889))

(assert (= (and d!20248 res!53842) b!64893))

(assert (= (and b!64893 res!53843) b!64892))

(assert (= (and b!64892 res!53844) b!64891))

(declare-fun m!103005 () Bool)

(assert (=> b!64892 m!103005))

(assert (=> b!64890 m!102831))

(declare-fun m!103007 () Bool)

(assert (=> b!64890 m!103007))

(declare-fun m!103009 () Bool)

(assert (=> b!64890 m!103009))

(declare-fun m!103011 () Bool)

(assert (=> b!64893 m!103011))

(assert (=> d!20248 m!102851))

(assert (=> d!20248 m!102829))

(declare-fun m!103013 () Bool)

(assert (=> d!20248 m!103013))

(assert (=> d!20248 m!102987))

(assert (=> d!20248 m!102827))

(declare-fun m!103015 () Bool)

(assert (=> d!20248 m!103015))

(declare-fun m!103017 () Bool)

(assert (=> d!20248 m!103017))

(declare-fun m!103019 () Bool)

(assert (=> d!20248 m!103019))

(declare-fun m!103021 () Bool)

(assert (=> d!20248 m!103021))

(assert (=> d!20248 m!102999))

(declare-fun m!103023 () Bool)

(assert (=> d!20248 m!103023))

(declare-fun m!103025 () Bool)

(assert (=> b!64891 m!103025))

(assert (=> b!64891 m!102873))

(assert (=> b!64891 m!102831))

(assert (=> b!64793 d!20248))

(declare-fun b!64896 () Bool)

(declare-fun e!42789 () Bool)

(declare-fun lt!102629 () List!697)

(assert (=> b!64896 (= e!42789 (isEmpty!201 lt!102629))))

(declare-fun b!64894 () Bool)

(declare-fun e!42788 () tuple2!5784)

(assert (=> b!64894 (= e!42788 (tuple2!5785 Nil!694 (_1!2999 lt!102481)))))

(declare-fun d!20250 () Bool)

(assert (=> d!20250 e!42789))

(declare-fun c!4680 () Bool)

(assert (=> d!20250 (= c!4680 (= lt!102484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20250 (= lt!102629 (_1!3003 e!42788))))

(declare-fun c!4679 () Bool)

(assert (=> d!20250 (= c!4679 (= lt!102484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20250 (bvsge lt!102484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20250 (= (bitStreamReadBitsIntoList!0 (_2!3000 lt!102483) (_1!2999 lt!102481) lt!102484) lt!102629)))

(declare-fun lt!102630 () tuple2!5786)

(declare-fun b!64895 () Bool)

(declare-fun lt!102631 () (_ BitVec 64))

(assert (=> b!64895 (= e!42788 (tuple2!5785 (Cons!693 (_1!3004 lt!102630) (bitStreamReadBitsIntoList!0 (_2!3000 lt!102483) (_2!3004 lt!102630) (bvsub lt!102484 lt!102631))) (_2!3004 lt!102630)))))

(assert (=> b!64895 (= lt!102630 (readBit!0 (_1!2999 lt!102481)))))

(assert (=> b!64895 (= lt!102631 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!64897 () Bool)

(assert (=> b!64897 (= e!42789 (> (length!325 lt!102629) 0))))

(assert (= (and d!20250 c!4679) b!64894))

(assert (= (and d!20250 (not c!4679)) b!64895))

(assert (= (and d!20250 c!4680) b!64896))

(assert (= (and d!20250 (not c!4680)) b!64897))

(declare-fun m!103027 () Bool)

(assert (=> b!64896 m!103027))

(declare-fun m!103029 () Bool)

(assert (=> b!64895 m!103029))

(declare-fun m!103031 () Bool)

(assert (=> b!64895 m!103031))

(declare-fun m!103033 () Bool)

(assert (=> b!64897 m!103033))

(assert (=> b!64793 d!20250))

(declare-fun d!20252 () Bool)

(assert (=> d!20252 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4962 () Bool)

(assert (= bs!4962 d!20252))

(declare-fun m!103035 () Bool)

(assert (=> bs!4962 m!103035))

(assert (=> b!64793 d!20252))

(declare-fun d!20254 () Bool)

(assert (=> d!20254 (= (invariant!0 (currentBit!3335 (_2!3000 lt!102483)) (currentByte!3340 (_2!3000 lt!102483)) (size!1299 (buf!1680 (_2!3000 lt!102483)))) (and (bvsge (currentBit!3335 (_2!3000 lt!102483)) #b00000000000000000000000000000000) (bvslt (currentBit!3335 (_2!3000 lt!102483)) #b00000000000000000000000000001000) (bvsge (currentByte!3340 (_2!3000 lt!102483)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3340 (_2!3000 lt!102483)) (size!1299 (buf!1680 (_2!3000 lt!102483)))) (and (= (currentBit!3335 (_2!3000 lt!102483)) #b00000000000000000000000000000000) (= (currentByte!3340 (_2!3000 lt!102483)) (size!1299 (buf!1680 (_2!3000 lt!102483))))))))))

(assert (=> b!64782 d!20254))

(declare-fun d!20256 () Bool)

(assert (=> d!20256 (= (invariant!0 (currentBit!3335 (_2!3000 lt!102474)) (currentByte!3340 (_2!3000 lt!102474)) (size!1299 (buf!1680 (_2!3000 lt!102483)))) (and (bvsge (currentBit!3335 (_2!3000 lt!102474)) #b00000000000000000000000000000000) (bvslt (currentBit!3335 (_2!3000 lt!102474)) #b00000000000000000000000000001000) (bvsge (currentByte!3340 (_2!3000 lt!102474)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3340 (_2!3000 lt!102474)) (size!1299 (buf!1680 (_2!3000 lt!102483)))) (and (= (currentBit!3335 (_2!3000 lt!102474)) #b00000000000000000000000000000000) (= (currentByte!3340 (_2!3000 lt!102474)) (size!1299 (buf!1680 (_2!3000 lt!102483))))))))))

(assert (=> b!64784 d!20256))

(declare-fun d!20258 () Bool)

(assert (=> d!20258 (= (array_inv!1181 (buf!1680 thiss!1379)) (bvsge (size!1299 (buf!1680 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!64783 d!20258))

(declare-fun d!20260 () Bool)

(assert (=> d!20260 (= (array_inv!1181 srcBuffer!2) (bvsge (size!1299 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12662 d!20260))

(declare-fun d!20262 () Bool)

(assert (=> d!20262 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3335 thiss!1379) (currentByte!3340 thiss!1379) (size!1299 (buf!1680 thiss!1379))))))

(declare-fun bs!4963 () Bool)

(assert (= bs!4963 d!20262))

(declare-fun m!103037 () Bool)

(assert (=> bs!4963 m!103037))

(assert (=> start!12662 d!20262))

(declare-fun d!20264 () Bool)

(assert (=> d!20264 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 thiss!1379))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 thiss!1379))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4964 () Bool)

(assert (= bs!4964 d!20264))

(declare-fun m!103039 () Bool)

(assert (=> bs!4964 m!103039))

(assert (=> b!64794 d!20264))

(declare-fun d!20266 () Bool)

(assert (=> d!20266 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_1!2999 lt!102486)))) ((_ sign_extend 32) (currentByte!3340 (_1!2999 lt!102486))) ((_ sign_extend 32) (currentBit!3335 (_1!2999 lt!102486))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 (_1!2999 lt!102486)))) ((_ sign_extend 32) (currentByte!3340 (_1!2999 lt!102486))) ((_ sign_extend 32) (currentBit!3335 (_1!2999 lt!102486)))) (bvsub to!314 i!635)))))

(declare-fun bs!4965 () Bool)

(assert (= bs!4965 d!20266))

(declare-fun m!103041 () Bool)

(assert (=> bs!4965 m!103041))

(assert (=> b!64780 d!20266))

(declare-fun d!20268 () Bool)

(assert (=> d!20268 (= (head!516 (byteArrayBitContentToList!0 (_2!3000 lt!102474) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!812 (byteArrayBitContentToList!0 (_2!3000 lt!102474) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64779 d!20268))

(declare-fun d!20270 () Bool)

(declare-fun c!4683 () Bool)

(assert (=> d!20270 (= c!4683 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42792 () List!697)

(assert (=> d!20270 (= (byteArrayBitContentToList!0 (_2!3000 lt!102474) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!42792)))

(declare-fun b!64902 () Bool)

(assert (=> b!64902 (= e!42792 Nil!694)))

(declare-fun b!64903 () Bool)

(assert (=> b!64903 (= e!42792 (Cons!693 (not (= (bvand ((_ sign_extend 24) (select (arr!1863 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3000 lt!102474) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20270 c!4683) b!64902))

(assert (= (and d!20270 (not c!4683)) b!64903))

(assert (=> b!64903 m!102815))

(declare-fun m!103043 () Bool)

(assert (=> b!64903 m!103043))

(declare-fun m!103045 () Bool)

(assert (=> b!64903 m!103045))

(assert (=> b!64779 d!20270))

(declare-fun d!20272 () Bool)

(assert (=> d!20272 (= (head!516 (bitStreamReadBitsIntoList!0 (_2!3000 lt!102474) (_1!2999 lt!102473) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!812 (bitStreamReadBitsIntoList!0 (_2!3000 lt!102474) (_1!2999 lt!102473) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64779 d!20272))

(declare-fun b!64906 () Bool)

(declare-fun e!42794 () Bool)

(declare-fun lt!102632 () List!697)

(assert (=> b!64906 (= e!42794 (isEmpty!201 lt!102632))))

(declare-fun b!64904 () Bool)

(declare-fun e!42793 () tuple2!5784)

(assert (=> b!64904 (= e!42793 (tuple2!5785 Nil!694 (_1!2999 lt!102473)))))

(declare-fun d!20274 () Bool)

(assert (=> d!20274 e!42794))

(declare-fun c!4685 () Bool)

(assert (=> d!20274 (= c!4685 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20274 (= lt!102632 (_1!3003 e!42793))))

(declare-fun c!4684 () Bool)

(assert (=> d!20274 (= c!4684 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20274 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20274 (= (bitStreamReadBitsIntoList!0 (_2!3000 lt!102474) (_1!2999 lt!102473) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102632)))

(declare-fun lt!102633 () tuple2!5786)

(declare-fun lt!102634 () (_ BitVec 64))

(declare-fun b!64905 () Bool)

(assert (=> b!64905 (= e!42793 (tuple2!5785 (Cons!693 (_1!3004 lt!102633) (bitStreamReadBitsIntoList!0 (_2!3000 lt!102474) (_2!3004 lt!102633) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!102634))) (_2!3004 lt!102633)))))

(assert (=> b!64905 (= lt!102633 (readBit!0 (_1!2999 lt!102473)))))

(assert (=> b!64905 (= lt!102634 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!64907 () Bool)

(assert (=> b!64907 (= e!42794 (> (length!325 lt!102632) 0))))

(assert (= (and d!20274 c!4684) b!64904))

(assert (= (and d!20274 (not c!4684)) b!64905))

(assert (= (and d!20274 c!4685) b!64906))

(assert (= (and d!20274 (not c!4685)) b!64907))

(declare-fun m!103047 () Bool)

(assert (=> b!64906 m!103047))

(declare-fun m!103049 () Bool)

(assert (=> b!64905 m!103049))

(declare-fun m!103051 () Bool)

(assert (=> b!64905 m!103051))

(declare-fun m!103053 () Bool)

(assert (=> b!64907 m!103053))

(assert (=> b!64779 d!20274))

(declare-fun d!20276 () Bool)

(declare-fun res!53851 () Bool)

(declare-fun e!42799 () Bool)

(assert (=> d!20276 (=> (not res!53851) (not e!42799))))

(assert (=> d!20276 (= res!53851 (= (size!1299 (buf!1680 (_2!3000 lt!102474))) (size!1299 (buf!1680 (_2!3000 lt!102483)))))))

(assert (=> d!20276 (= (isPrefixOf!0 (_2!3000 lt!102474) (_2!3000 lt!102483)) e!42799)))

(declare-fun b!64914 () Bool)

(declare-fun res!53852 () Bool)

(assert (=> b!64914 (=> (not res!53852) (not e!42799))))

(assert (=> b!64914 (= res!53852 (bvsle (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))) (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102483))) (currentByte!3340 (_2!3000 lt!102483)) (currentBit!3335 (_2!3000 lt!102483)))))))

(declare-fun b!64915 () Bool)

(declare-fun e!42800 () Bool)

(assert (=> b!64915 (= e!42799 e!42800)))

(declare-fun res!53853 () Bool)

(assert (=> b!64915 (=> res!53853 e!42800)))

(assert (=> b!64915 (= res!53853 (= (size!1299 (buf!1680 (_2!3000 lt!102474))) #b00000000000000000000000000000000))))

(declare-fun b!64916 () Bool)

(assert (=> b!64916 (= e!42800 (arrayBitRangesEq!0 (buf!1680 (_2!3000 lt!102474)) (buf!1680 (_2!3000 lt!102483)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474)))))))

(assert (= (and d!20276 res!53851) b!64914))

(assert (= (and b!64914 res!53852) b!64915))

(assert (= (and b!64915 (not res!53853)) b!64916))

(assert (=> b!64914 m!102837))

(assert (=> b!64914 m!102873))

(assert (=> b!64916 m!102837))

(assert (=> b!64916 m!102837))

(declare-fun m!103055 () Bool)

(assert (=> b!64916 m!103055))

(assert (=> b!64790 d!20276))

(declare-fun d!20278 () Bool)

(assert (=> d!20278 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!102635 () Unit!4387)

(assert (=> d!20278 (= lt!102635 (choose!9 thiss!1379 (buf!1680 (_2!3000 lt!102474)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2245 (buf!1680 (_2!3000 lt!102474)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379))))))

(assert (=> d!20278 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1680 (_2!3000 lt!102474)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102635)))

(declare-fun bs!4966 () Bool)

(assert (= bs!4966 d!20278))

(assert (=> bs!4966 m!102849))

(declare-fun m!103057 () Bool)

(assert (=> bs!4966 m!103057))

(assert (=> b!64790 d!20278))

(declare-fun d!20280 () Bool)

(assert (=> d!20280 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4967 () Bool)

(assert (= bs!4967 d!20280))

(declare-fun m!103059 () Bool)

(assert (=> bs!4967 m!103059))

(assert (=> b!64790 d!20280))

(declare-fun d!20282 () Bool)

(declare-fun res!53854 () Bool)

(declare-fun e!42801 () Bool)

(assert (=> d!20282 (=> (not res!53854) (not e!42801))))

(assert (=> d!20282 (= res!53854 (= (size!1299 (buf!1680 thiss!1379)) (size!1299 (buf!1680 (_2!3000 lt!102483)))))))

(assert (=> d!20282 (= (isPrefixOf!0 thiss!1379 (_2!3000 lt!102483)) e!42801)))

(declare-fun b!64917 () Bool)

(declare-fun res!53855 () Bool)

(assert (=> b!64917 (=> (not res!53855) (not e!42801))))

(assert (=> b!64917 (= res!53855 (bvsle (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)) (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102483))) (currentByte!3340 (_2!3000 lt!102483)) (currentBit!3335 (_2!3000 lt!102483)))))))

(declare-fun b!64918 () Bool)

(declare-fun e!42802 () Bool)

(assert (=> b!64918 (= e!42801 e!42802)))

(declare-fun res!53856 () Bool)

(assert (=> b!64918 (=> res!53856 e!42802)))

(assert (=> b!64918 (= res!53856 (= (size!1299 (buf!1680 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64919 () Bool)

(assert (=> b!64919 (= e!42802 (arrayBitRangesEq!0 (buf!1680 thiss!1379) (buf!1680 (_2!3000 lt!102483)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379))))))

(assert (= (and d!20282 res!53854) b!64917))

(assert (= (and b!64917 res!53855) b!64918))

(assert (= (and b!64918 (not res!53856)) b!64919))

(assert (=> b!64917 m!102831))

(assert (=> b!64917 m!102873))

(assert (=> b!64919 m!102831))

(assert (=> b!64919 m!102831))

(declare-fun m!103061 () Bool)

(assert (=> b!64919 m!103061))

(assert (=> b!64790 d!20282))

(declare-fun b!64920 () Bool)

(declare-fun e!42803 () Unit!4387)

(declare-fun Unit!4393 () Unit!4387)

(assert (=> b!64920 (= e!42803 Unit!4393)))

(declare-fun b!64921 () Bool)

(declare-fun lt!102637 () Unit!4387)

(assert (=> b!64921 (= e!42803 lt!102637)))

(declare-fun lt!102648 () (_ BitVec 64))

(assert (=> b!64921 (= lt!102648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102641 () (_ BitVec 64))

(assert (=> b!64921 (= lt!102641 (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)))))

(assert (=> b!64921 (= lt!102637 (arrayBitRangesEqSymmetric!0 (buf!1680 thiss!1379) (buf!1680 (_2!3000 lt!102474)) lt!102648 lt!102641))))

(assert (=> b!64921 (arrayBitRangesEq!0 (buf!1680 (_2!3000 lt!102474)) (buf!1680 thiss!1379) lt!102648 lt!102641)))

(declare-fun d!20284 () Bool)

(declare-fun e!42804 () Bool)

(assert (=> d!20284 e!42804))

(declare-fun res!53857 () Bool)

(assert (=> d!20284 (=> (not res!53857) (not e!42804))))

(declare-fun lt!102640 () tuple2!5776)

(assert (=> d!20284 (= res!53857 (isPrefixOf!0 (_1!2999 lt!102640) (_2!2999 lt!102640)))))

(declare-fun lt!102652 () BitStream!2244)

(assert (=> d!20284 (= lt!102640 (tuple2!5777 lt!102652 (_2!3000 lt!102474)))))

(declare-fun lt!102642 () Unit!4387)

(declare-fun lt!102639 () Unit!4387)

(assert (=> d!20284 (= lt!102642 lt!102639)))

(assert (=> d!20284 (isPrefixOf!0 lt!102652 (_2!3000 lt!102474))))

(assert (=> d!20284 (= lt!102639 (lemmaIsPrefixTransitive!0 lt!102652 (_2!3000 lt!102474) (_2!3000 lt!102474)))))

(declare-fun lt!102654 () Unit!4387)

(declare-fun lt!102650 () Unit!4387)

(assert (=> d!20284 (= lt!102654 lt!102650)))

(assert (=> d!20284 (isPrefixOf!0 lt!102652 (_2!3000 lt!102474))))

(assert (=> d!20284 (= lt!102650 (lemmaIsPrefixTransitive!0 lt!102652 thiss!1379 (_2!3000 lt!102474)))))

(declare-fun lt!102646 () Unit!4387)

(assert (=> d!20284 (= lt!102646 e!42803)))

(declare-fun c!4686 () Bool)

(assert (=> d!20284 (= c!4686 (not (= (size!1299 (buf!1680 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!102636 () Unit!4387)

(declare-fun lt!102655 () Unit!4387)

(assert (=> d!20284 (= lt!102636 lt!102655)))

(assert (=> d!20284 (isPrefixOf!0 (_2!3000 lt!102474) (_2!3000 lt!102474))))

(assert (=> d!20284 (= lt!102655 (lemmaIsPrefixRefl!0 (_2!3000 lt!102474)))))

(declare-fun lt!102638 () Unit!4387)

(declare-fun lt!102649 () Unit!4387)

(assert (=> d!20284 (= lt!102638 lt!102649)))

(assert (=> d!20284 (= lt!102649 (lemmaIsPrefixRefl!0 (_2!3000 lt!102474)))))

(declare-fun lt!102643 () Unit!4387)

(declare-fun lt!102653 () Unit!4387)

(assert (=> d!20284 (= lt!102643 lt!102653)))

(assert (=> d!20284 (isPrefixOf!0 lt!102652 lt!102652)))

(assert (=> d!20284 (= lt!102653 (lemmaIsPrefixRefl!0 lt!102652))))

(declare-fun lt!102645 () Unit!4387)

(declare-fun lt!102644 () Unit!4387)

(assert (=> d!20284 (= lt!102645 lt!102644)))

(assert (=> d!20284 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20284 (= lt!102644 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20284 (= lt!102652 (BitStream!2245 (buf!1680 (_2!3000 lt!102474)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)))))

(assert (=> d!20284 (isPrefixOf!0 thiss!1379 (_2!3000 lt!102474))))

(assert (=> d!20284 (= (reader!0 thiss!1379 (_2!3000 lt!102474)) lt!102640)))

(declare-fun lt!102647 () (_ BitVec 64))

(declare-fun lt!102651 () (_ BitVec 64))

(declare-fun b!64922 () Bool)

(assert (=> b!64922 (= e!42804 (= (_1!2999 lt!102640) (withMovedBitIndex!0 (_2!2999 lt!102640) (bvsub lt!102647 lt!102651))))))

(assert (=> b!64922 (or (= (bvand lt!102647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102651 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102647 lt!102651) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64922 (= lt!102651 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))))))

(assert (=> b!64922 (= lt!102647 (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)))))

(declare-fun b!64923 () Bool)

(declare-fun res!53859 () Bool)

(assert (=> b!64923 (=> (not res!53859) (not e!42804))))

(assert (=> b!64923 (= res!53859 (isPrefixOf!0 (_2!2999 lt!102640) (_2!3000 lt!102474)))))

(declare-fun b!64924 () Bool)

(declare-fun res!53858 () Bool)

(assert (=> b!64924 (=> (not res!53858) (not e!42804))))

(assert (=> b!64924 (= res!53858 (isPrefixOf!0 (_1!2999 lt!102640) thiss!1379))))

(assert (= (and d!20284 c!4686) b!64921))

(assert (= (and d!20284 (not c!4686)) b!64920))

(assert (= (and d!20284 res!53857) b!64924))

(assert (= (and b!64924 res!53858) b!64923))

(assert (= (and b!64923 res!53859) b!64922))

(declare-fun m!103063 () Bool)

(assert (=> b!64923 m!103063))

(assert (=> b!64921 m!102831))

(declare-fun m!103065 () Bool)

(assert (=> b!64921 m!103065))

(declare-fun m!103067 () Bool)

(assert (=> b!64921 m!103067))

(declare-fun m!103069 () Bool)

(assert (=> b!64924 m!103069))

(assert (=> d!20284 m!102813))

(assert (=> d!20284 m!102829))

(declare-fun m!103071 () Bool)

(assert (=> d!20284 m!103071))

(assert (=> d!20284 m!102983))

(assert (=> d!20284 m!102827))

(declare-fun m!103073 () Bool)

(assert (=> d!20284 m!103073))

(declare-fun m!103075 () Bool)

(assert (=> d!20284 m!103075))

(declare-fun m!103077 () Bool)

(assert (=> d!20284 m!103077))

(declare-fun m!103079 () Bool)

(assert (=> d!20284 m!103079))

(assert (=> d!20284 m!102989))

(declare-fun m!103081 () Bool)

(assert (=> d!20284 m!103081))

(declare-fun m!103083 () Bool)

(assert (=> b!64922 m!103083))

(assert (=> b!64922 m!102837))

(assert (=> b!64922 m!102831))

(assert (=> b!64790 d!20284))

(declare-fun d!20286 () Bool)

(assert (=> d!20286 (isPrefixOf!0 thiss!1379 (_2!3000 lt!102483))))

(declare-fun lt!102658 () Unit!4387)

(declare-fun choose!30 (BitStream!2244 BitStream!2244 BitStream!2244) Unit!4387)

(assert (=> d!20286 (= lt!102658 (choose!30 thiss!1379 (_2!3000 lt!102474) (_2!3000 lt!102483)))))

(assert (=> d!20286 (isPrefixOf!0 thiss!1379 (_2!3000 lt!102474))))

(assert (=> d!20286 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3000 lt!102474) (_2!3000 lt!102483)) lt!102658)))

(declare-fun bs!4968 () Bool)

(assert (= bs!4968 d!20286))

(assert (=> bs!4968 m!102851))

(declare-fun m!103085 () Bool)

(assert (=> bs!4968 m!103085))

(assert (=> bs!4968 m!102813))

(assert (=> b!64790 d!20286))

(declare-fun b!65132 () Bool)

(declare-fun e!42910 () tuple2!5778)

(declare-fun Unit!4394 () Unit!4387)

(assert (=> b!65132 (= e!42910 (tuple2!5779 Unit!4394 (_2!3000 lt!102474)))))

(assert (=> b!65132 (= (size!1299 (buf!1680 (_2!3000 lt!102474))) (size!1299 (buf!1680 (_2!3000 lt!102474))))))

(declare-fun lt!103108 () Unit!4387)

(declare-fun Unit!4395 () Unit!4387)

(assert (=> b!65132 (= lt!103108 Unit!4395)))

(declare-fun call!829 () tuple2!5776)

(declare-fun checkByteArrayBitContent!0 (BitStream!2244 array!2826 array!2826 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5788 0))(
  ( (tuple2!5789 (_1!3005 array!2826) (_2!3005 BitStream!2244)) )
))
(declare-fun readBits!0 (BitStream!2244 (_ BitVec 64)) tuple2!5788)

(assert (=> b!65132 (checkByteArrayBitContent!0 (_2!3000 lt!102474) srcBuffer!2 (_1!3005 (readBits!0 (_1!2999 call!829) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun bm!826 () Bool)

(declare-fun lt!103100 () tuple2!5778)

(declare-fun c!4724 () Bool)

(assert (=> bm!826 (= call!829 (reader!0 (_2!3000 lt!102474) (ite c!4724 (_2!3000 lt!103100) (_2!3000 lt!102474))))))

(declare-fun b!65133 () Bool)

(declare-fun lt!103120 () tuple2!5776)

(declare-fun e!42912 () Bool)

(declare-fun lt!103119 () tuple2!5778)

(assert (=> b!65133 (= e!42912 (= (bitStreamReadBitsIntoList!0 (_2!3000 lt!103119) (_1!2999 lt!103120) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3000 lt!103119) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!65133 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65133 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!103110 () Unit!4387)

(declare-fun lt!103114 () Unit!4387)

(assert (=> b!65133 (= lt!103110 lt!103114)))

(declare-fun lt!103123 () (_ BitVec 64))

(assert (=> b!65133 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!103119)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) lt!103123)))

(assert (=> b!65133 (= lt!103114 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3000 lt!102474) (buf!1680 (_2!3000 lt!103119)) lt!103123))))

(declare-fun e!42911 () Bool)

(assert (=> b!65133 e!42911))

(declare-fun res!53996 () Bool)

(assert (=> b!65133 (=> (not res!53996) (not e!42911))))

(assert (=> b!65133 (= res!53996 (and (= (size!1299 (buf!1680 (_2!3000 lt!102474))) (size!1299 (buf!1680 (_2!3000 lt!103119)))) (bvsge lt!103123 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65133 (= lt!103123 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!65133 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65133 (= lt!103120 (reader!0 (_2!3000 lt!102474) (_2!3000 lt!103119)))))

(declare-fun b!65134 () Bool)

(declare-fun res!53994 () Bool)

(assert (=> b!65134 (=> (not res!53994) (not e!42912))))

(assert (=> b!65134 (= res!53994 (invariant!0 (currentBit!3335 (_2!3000 lt!103119)) (currentByte!3340 (_2!3000 lt!103119)) (size!1299 (buf!1680 (_2!3000 lt!103119)))))))

(declare-fun b!65135 () Bool)

(declare-fun res!53992 () Bool)

(assert (=> b!65135 (=> (not res!53992) (not e!42912))))

(assert (=> b!65135 (= res!53992 (isPrefixOf!0 (_2!3000 lt!102474) (_2!3000 lt!103119)))))

(declare-fun b!65136 () Bool)

(assert (=> b!65136 (= e!42911 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) lt!103123))))

(declare-fun b!65137 () Bool)

(declare-fun res!53993 () Bool)

(assert (=> b!65137 (=> (not res!53993) (not e!42912))))

(assert (=> b!65137 (= res!53993 (= (size!1299 (buf!1680 (_2!3000 lt!103119))) (size!1299 (buf!1680 (_2!3000 lt!102474)))))))

(declare-fun d!20288 () Bool)

(assert (=> d!20288 e!42912))

(declare-fun res!53995 () Bool)

(assert (=> d!20288 (=> (not res!53995) (not e!42912))))

(declare-fun lt!103126 () (_ BitVec 64))

(assert (=> d!20288 (= res!53995 (= (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!103119))) (currentByte!3340 (_2!3000 lt!103119)) (currentBit!3335 (_2!3000 lt!103119))) (bvsub lt!103126 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20288 (or (= (bvand lt!103126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103126 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!103098 () (_ BitVec 64))

(assert (=> d!20288 (= lt!103126 (bvadd lt!103098 to!314))))

(assert (=> d!20288 (or (not (= (bvand lt!103098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!103098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!103098 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20288 (= lt!103098 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))))))

(assert (=> d!20288 (= lt!103119 e!42910)))

(assert (=> d!20288 (= c!4724 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!103092 () Unit!4387)

(declare-fun lt!103103 () Unit!4387)

(assert (=> d!20288 (= lt!103092 lt!103103)))

(assert (=> d!20288 (isPrefixOf!0 (_2!3000 lt!102474) (_2!3000 lt!102474))))

(assert (=> d!20288 (= lt!103103 (lemmaIsPrefixRefl!0 (_2!3000 lt!102474)))))

(declare-fun lt!103124 () (_ BitVec 64))

(assert (=> d!20288 (= lt!103124 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))))))

(assert (=> d!20288 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20288 (= (appendBitsMSBFirstLoop!0 (_2!3000 lt!102474) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!103119)))

(declare-fun b!65138 () Bool)

(declare-fun res!53997 () Bool)

(assert (=> b!65138 (=> (not res!53997) (not e!42912))))

(assert (=> b!65138 (= res!53997 (= (size!1299 (buf!1680 (_2!3000 lt!102474))) (size!1299 (buf!1680 (_2!3000 lt!103119)))))))

(declare-fun b!65139 () Bool)

(declare-fun Unit!4396 () Unit!4387)

(assert (=> b!65139 (= e!42910 (tuple2!5779 Unit!4396 (_2!3000 lt!103100)))))

(declare-fun lt!103128 () tuple2!5778)

(assert (=> b!65139 (= lt!103128 (appendBitFromByte!0 (_2!3000 lt!102474) (select (arr!1863 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!103117 () (_ BitVec 64))

(assert (=> b!65139 (= lt!103117 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103127 () (_ BitVec 64))

(assert (=> b!65139 (= lt!103127 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!103116 () Unit!4387)

(assert (=> b!65139 (= lt!103116 (validateOffsetBitsIneqLemma!0 (_2!3000 lt!102474) (_2!3000 lt!103128) lt!103117 lt!103127))))

(assert (=> b!65139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!103128)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!103128))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!103128))) (bvsub lt!103117 lt!103127))))

(declare-fun lt!103090 () Unit!4387)

(assert (=> b!65139 (= lt!103090 lt!103116)))

(declare-fun lt!103099 () tuple2!5776)

(assert (=> b!65139 (= lt!103099 (reader!0 (_2!3000 lt!102474) (_2!3000 lt!103128)))))

(declare-fun lt!103129 () (_ BitVec 64))

(assert (=> b!65139 (= lt!103129 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!103101 () Unit!4387)

(assert (=> b!65139 (= lt!103101 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3000 lt!102474) (buf!1680 (_2!3000 lt!103128)) lt!103129))))

(assert (=> b!65139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!103128)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) lt!103129)))

(declare-fun lt!103091 () Unit!4387)

(assert (=> b!65139 (= lt!103091 lt!103101)))

(assert (=> b!65139 (= (head!516 (byteArrayBitContentToList!0 (_2!3000 lt!103128) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!516 (bitStreamReadBitsIntoList!0 (_2!3000 lt!103128) (_1!2999 lt!103099) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!103107 () Unit!4387)

(declare-fun Unit!4397 () Unit!4387)

(assert (=> b!65139 (= lt!103107 Unit!4397)))

(assert (=> b!65139 (= lt!103100 (appendBitsMSBFirstLoop!0 (_2!3000 lt!103128) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!103102 () Unit!4387)

(assert (=> b!65139 (= lt!103102 (lemmaIsPrefixTransitive!0 (_2!3000 lt!102474) (_2!3000 lt!103128) (_2!3000 lt!103100)))))

(assert (=> b!65139 (isPrefixOf!0 (_2!3000 lt!102474) (_2!3000 lt!103100))))

(declare-fun lt!103118 () Unit!4387)

(assert (=> b!65139 (= lt!103118 lt!103102)))

(assert (=> b!65139 (= (size!1299 (buf!1680 (_2!3000 lt!103100))) (size!1299 (buf!1680 (_2!3000 lt!102474))))))

(declare-fun lt!103095 () Unit!4387)

(declare-fun Unit!4398 () Unit!4387)

(assert (=> b!65139 (= lt!103095 Unit!4398)))

(assert (=> b!65139 (= (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!103100))) (currentByte!3340 (_2!3000 lt!103100)) (currentBit!3335 (_2!3000 lt!103100))) (bvsub (bvadd (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103097 () Unit!4387)

(declare-fun Unit!4399 () Unit!4387)

(assert (=> b!65139 (= lt!103097 Unit!4399)))

(assert (=> b!65139 (= (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!103100))) (currentByte!3340 (_2!3000 lt!103100)) (currentBit!3335 (_2!3000 lt!103100))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!103128))) (currentByte!3340 (_2!3000 lt!103128)) (currentBit!3335 (_2!3000 lt!103128))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103104 () Unit!4387)

(declare-fun Unit!4400 () Unit!4387)

(assert (=> b!65139 (= lt!103104 Unit!4400)))

(declare-fun lt!103131 () tuple2!5776)

(assert (=> b!65139 (= lt!103131 call!829)))

(declare-fun lt!103096 () (_ BitVec 64))

(assert (=> b!65139 (= lt!103096 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103109 () Unit!4387)

(assert (=> b!65139 (= lt!103109 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3000 lt!102474) (buf!1680 (_2!3000 lt!103100)) lt!103096))))

(assert (=> b!65139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!103100)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) lt!103096)))

(declare-fun lt!103132 () Unit!4387)

(assert (=> b!65139 (= lt!103132 lt!103109)))

(declare-fun lt!103105 () tuple2!5776)

(assert (=> b!65139 (= lt!103105 (reader!0 (_2!3000 lt!103128) (_2!3000 lt!103100)))))

(declare-fun lt!103094 () (_ BitVec 64))

(assert (=> b!65139 (= lt!103094 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103121 () Unit!4387)

(assert (=> b!65139 (= lt!103121 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3000 lt!103128) (buf!1680 (_2!3000 lt!103100)) lt!103094))))

(assert (=> b!65139 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!103100)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!103128))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!103128))) lt!103094)))

(declare-fun lt!103112 () Unit!4387)

(assert (=> b!65139 (= lt!103112 lt!103121)))

(declare-fun lt!103093 () List!697)

(assert (=> b!65139 (= lt!103093 (byteArrayBitContentToList!0 (_2!3000 lt!103100) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!103089 () List!697)

(assert (=> b!65139 (= lt!103089 (byteArrayBitContentToList!0 (_2!3000 lt!103100) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!103115 () List!697)

(assert (=> b!65139 (= lt!103115 (bitStreamReadBitsIntoList!0 (_2!3000 lt!103100) (_1!2999 lt!103131) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!103122 () List!697)

(assert (=> b!65139 (= lt!103122 (bitStreamReadBitsIntoList!0 (_2!3000 lt!103100) (_1!2999 lt!103105) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!103113 () (_ BitVec 64))

(assert (=> b!65139 (= lt!103113 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103125 () Unit!4387)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2244 BitStream!2244 BitStream!2244 BitStream!2244 (_ BitVec 64) List!697) Unit!4387)

(assert (=> b!65139 (= lt!103125 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3000 lt!103100) (_2!3000 lt!103100) (_1!2999 lt!103131) (_1!2999 lt!103105) lt!103113 lt!103115))))

(declare-fun tail!303 (List!697) List!697)

(assert (=> b!65139 (= (bitStreamReadBitsIntoList!0 (_2!3000 lt!103100) (_1!2999 lt!103105) (bvsub lt!103113 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!303 lt!103115))))

(declare-fun lt!103106 () Unit!4387)

(assert (=> b!65139 (= lt!103106 lt!103125)))

(declare-fun lt!103130 () Unit!4387)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2826 array!2826 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4387)

(assert (=> b!65139 (= lt!103130 (arrayBitRangesEqImpliesEq!0 (buf!1680 (_2!3000 lt!103128)) (buf!1680 (_2!3000 lt!103100)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!103124 (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!103128))) (currentByte!3340 (_2!3000 lt!103128)) (currentBit!3335 (_2!3000 lt!103128)))))))

(declare-fun bitAt!0 (array!2826 (_ BitVec 64)) Bool)

(assert (=> b!65139 (= (bitAt!0 (buf!1680 (_2!3000 lt!103128)) lt!103124) (bitAt!0 (buf!1680 (_2!3000 lt!103100)) lt!103124))))

(declare-fun lt!103111 () Unit!4387)

(assert (=> b!65139 (= lt!103111 lt!103130)))

(assert (= (and d!20288 c!4724) b!65139))

(assert (= (and d!20288 (not c!4724)) b!65132))

(assert (= (or b!65139 b!65132) bm!826))

(assert (= (and d!20288 res!53995) b!65134))

(assert (= (and b!65134 res!53994) b!65138))

(assert (= (and b!65138 res!53997) b!65135))

(assert (= (and b!65135 res!53992) b!65137))

(assert (= (and b!65137 res!53993) b!65133))

(assert (= (and b!65133 res!53996) b!65136))

(declare-fun m!103377 () Bool)

(assert (=> bm!826 m!103377))

(declare-fun m!103379 () Bool)

(assert (=> b!65139 m!103379))

(declare-fun m!103381 () Bool)

(assert (=> b!65139 m!103381))

(declare-fun m!103383 () Bool)

(assert (=> b!65139 m!103383))

(declare-fun m!103385 () Bool)

(assert (=> b!65139 m!103385))

(declare-fun m!103387 () Bool)

(assert (=> b!65139 m!103387))

(declare-fun m!103389 () Bool)

(assert (=> b!65139 m!103389))

(declare-fun m!103391 () Bool)

(assert (=> b!65139 m!103391))

(declare-fun m!103393 () Bool)

(assert (=> b!65139 m!103393))

(declare-fun m!103395 () Bool)

(assert (=> b!65139 m!103395))

(declare-fun m!103397 () Bool)

(assert (=> b!65139 m!103397))

(assert (=> b!65139 m!103391))

(declare-fun m!103399 () Bool)

(assert (=> b!65139 m!103399))

(declare-fun m!103401 () Bool)

(assert (=> b!65139 m!103401))

(declare-fun m!103403 () Bool)

(assert (=> b!65139 m!103403))

(declare-fun m!103405 () Bool)

(assert (=> b!65139 m!103405))

(declare-fun m!103407 () Bool)

(assert (=> b!65139 m!103407))

(assert (=> b!65139 m!102837))

(declare-fun m!103409 () Bool)

(assert (=> b!65139 m!103409))

(declare-fun m!103411 () Bool)

(assert (=> b!65139 m!103411))

(declare-fun m!103413 () Bool)

(assert (=> b!65139 m!103413))

(declare-fun m!103415 () Bool)

(assert (=> b!65139 m!103415))

(declare-fun m!103417 () Bool)

(assert (=> b!65139 m!103417))

(declare-fun m!103419 () Bool)

(assert (=> b!65139 m!103419))

(assert (=> b!65139 m!103395))

(declare-fun m!103421 () Bool)

(assert (=> b!65139 m!103421))

(declare-fun m!103423 () Bool)

(assert (=> b!65139 m!103423))

(assert (=> b!65139 m!103393))

(declare-fun m!103425 () Bool)

(assert (=> b!65139 m!103425))

(declare-fun m!103427 () Bool)

(assert (=> b!65139 m!103427))

(declare-fun m!103429 () Bool)

(assert (=> b!65139 m!103429))

(declare-fun m!103431 () Bool)

(assert (=> b!65139 m!103431))

(declare-fun m!103433 () Bool)

(assert (=> b!65139 m!103433))

(declare-fun m!103435 () Bool)

(assert (=> b!65139 m!103435))

(assert (=> b!65139 m!103389))

(declare-fun m!103437 () Bool)

(assert (=> b!65139 m!103437))

(declare-fun m!103439 () Bool)

(assert (=> b!65139 m!103439))

(declare-fun m!103441 () Bool)

(assert (=> b!65132 m!103441))

(declare-fun m!103443 () Bool)

(assert (=> b!65132 m!103443))

(declare-fun m!103445 () Bool)

(assert (=> b!65134 m!103445))

(declare-fun m!103447 () Bool)

(assert (=> b!65136 m!103447))

(declare-fun m!103449 () Bool)

(assert (=> b!65133 m!103449))

(declare-fun m!103451 () Bool)

(assert (=> b!65133 m!103451))

(declare-fun m!103453 () Bool)

(assert (=> b!65133 m!103453))

(declare-fun m!103455 () Bool)

(assert (=> b!65133 m!103455))

(declare-fun m!103457 () Bool)

(assert (=> b!65133 m!103457))

(declare-fun m!103459 () Bool)

(assert (=> b!65135 m!103459))

(declare-fun m!103461 () Bool)

(assert (=> d!20288 m!103461))

(assert (=> d!20288 m!102837))

(assert (=> d!20288 m!102989))

(assert (=> d!20288 m!102983))

(assert (=> b!64790 d!20288))

(declare-fun d!20422 () Bool)

(declare-fun res!53998 () Bool)

(declare-fun e!42913 () Bool)

(assert (=> d!20422 (=> (not res!53998) (not e!42913))))

(assert (=> d!20422 (= res!53998 (= (size!1299 (buf!1680 (_1!2999 lt!102481))) (size!1299 (buf!1680 (_2!3000 lt!102483)))))))

(assert (=> d!20422 (= (isPrefixOf!0 (_1!2999 lt!102481) (_2!3000 lt!102483)) e!42913)))

(declare-fun b!65140 () Bool)

(declare-fun res!53999 () Bool)

(assert (=> b!65140 (=> (not res!53999) (not e!42913))))

(assert (=> b!65140 (= res!53999 (bvsle (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102481))) (currentByte!3340 (_1!2999 lt!102481)) (currentBit!3335 (_1!2999 lt!102481))) (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102483))) (currentByte!3340 (_2!3000 lt!102483)) (currentBit!3335 (_2!3000 lt!102483)))))))

(declare-fun b!65141 () Bool)

(declare-fun e!42914 () Bool)

(assert (=> b!65141 (= e!42913 e!42914)))

(declare-fun res!54000 () Bool)

(assert (=> b!65141 (=> res!54000 e!42914)))

(assert (=> b!65141 (= res!54000 (= (size!1299 (buf!1680 (_1!2999 lt!102481))) #b00000000000000000000000000000000))))

(declare-fun b!65142 () Bool)

(assert (=> b!65142 (= e!42914 (arrayBitRangesEq!0 (buf!1680 (_1!2999 lt!102481)) (buf!1680 (_2!3000 lt!102483)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102481))) (currentByte!3340 (_1!2999 lt!102481)) (currentBit!3335 (_1!2999 lt!102481)))))))

(assert (= (and d!20422 res!53998) b!65140))

(assert (= (and b!65140 res!53999) b!65141))

(assert (= (and b!65141 (not res!54000)) b!65142))

(assert (=> b!65140 m!102835))

(assert (=> b!65140 m!102873))

(assert (=> b!65142 m!102835))

(assert (=> b!65142 m!102835))

(declare-fun m!103463 () Bool)

(assert (=> b!65142 m!103463))

(assert (=> b!64792 d!20422))

(declare-fun d!20424 () Bool)

(declare-fun e!42917 () Bool)

(assert (=> d!20424 e!42917))

(declare-fun res!54005 () Bool)

(assert (=> d!20424 (=> (not res!54005) (not e!42917))))

(declare-fun lt!103146 () (_ BitVec 64))

(declare-fun lt!103150 () (_ BitVec 64))

(declare-fun lt!103145 () (_ BitVec 64))

(assert (=> d!20424 (= res!54005 (= lt!103146 (bvsub lt!103150 lt!103145)))))

(assert (=> d!20424 (or (= (bvand lt!103150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103145 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103150 lt!103145) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20424 (= lt!103145 (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474)))))))

(declare-fun lt!103149 () (_ BitVec 64))

(declare-fun lt!103148 () (_ BitVec 64))

(assert (=> d!20424 (= lt!103150 (bvmul lt!103149 lt!103148))))

(assert (=> d!20424 (or (= lt!103149 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103148 (bvsdiv (bvmul lt!103149 lt!103148) lt!103149)))))

(assert (=> d!20424 (= lt!103148 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20424 (= lt!103149 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))))))

(assert (=> d!20424 (= lt!103146 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474)))))))

(assert (=> d!20424 (invariant!0 (currentBit!3335 (_2!3000 lt!102474)) (currentByte!3340 (_2!3000 lt!102474)) (size!1299 (buf!1680 (_2!3000 lt!102474))))))

(assert (=> d!20424 (= (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474))) lt!103146)))

(declare-fun b!65147 () Bool)

(declare-fun res!54006 () Bool)

(assert (=> b!65147 (=> (not res!54006) (not e!42917))))

(assert (=> b!65147 (= res!54006 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103146))))

(declare-fun b!65148 () Bool)

(declare-fun lt!103147 () (_ BitVec 64))

(assert (=> b!65148 (= e!42917 (bvsle lt!103146 (bvmul lt!103147 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65148 (or (= lt!103147 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103147 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103147)))))

(assert (=> b!65148 (= lt!103147 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))))))

(assert (= (and d!20424 res!54005) b!65147))

(assert (= (and b!65147 res!54006) b!65148))

(declare-fun m!103465 () Bool)

(assert (=> d!20424 m!103465))

(assert (=> d!20424 m!102789))

(assert (=> b!64788 d!20424))

(declare-fun d!20426 () Bool)

(declare-fun res!54007 () Bool)

(declare-fun e!42918 () Bool)

(assert (=> d!20426 (=> (not res!54007) (not e!42918))))

(assert (=> d!20426 (= res!54007 (= (size!1299 (buf!1680 (_1!2999 lt!102486))) (size!1299 (buf!1680 (_1!2999 lt!102481)))))))

(assert (=> d!20426 (= (isPrefixOf!0 (_1!2999 lt!102486) (_1!2999 lt!102481)) e!42918)))

(declare-fun b!65149 () Bool)

(declare-fun res!54008 () Bool)

(assert (=> b!65149 (=> (not res!54008) (not e!42918))))

(assert (=> b!65149 (= res!54008 (bvsle (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102486))) (currentByte!3340 (_1!2999 lt!102486)) (currentBit!3335 (_1!2999 lt!102486))) (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102481))) (currentByte!3340 (_1!2999 lt!102481)) (currentBit!3335 (_1!2999 lt!102481)))))))

(declare-fun b!65150 () Bool)

(declare-fun e!42919 () Bool)

(assert (=> b!65150 (= e!42918 e!42919)))

(declare-fun res!54009 () Bool)

(assert (=> b!65150 (=> res!54009 e!42919)))

(assert (=> b!65150 (= res!54009 (= (size!1299 (buf!1680 (_1!2999 lt!102486))) #b00000000000000000000000000000000))))

(declare-fun b!65151 () Bool)

(assert (=> b!65151 (= e!42919 (arrayBitRangesEq!0 (buf!1680 (_1!2999 lt!102486)) (buf!1680 (_1!2999 lt!102481)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102486))) (currentByte!3340 (_1!2999 lt!102486)) (currentBit!3335 (_1!2999 lt!102486)))))))

(assert (= (and d!20426 res!54007) b!65149))

(assert (= (and b!65149 res!54008) b!65150))

(assert (= (and b!65150 (not res!54009)) b!65151))

(assert (=> b!65149 m!102833))

(assert (=> b!65149 m!102835))

(assert (=> b!65151 m!102833))

(assert (=> b!65151 m!102833))

(declare-fun m!103467 () Bool)

(assert (=> b!65151 m!103467))

(assert (=> b!64787 d!20426))

(declare-fun d!20428 () Bool)

(declare-fun res!54010 () Bool)

(declare-fun e!42920 () Bool)

(assert (=> d!20428 (=> (not res!54010) (not e!42920))))

(assert (=> d!20428 (= res!54010 (= (size!1299 (buf!1680 (_1!2999 lt!102486))) (size!1299 (buf!1680 (_2!3000 lt!102483)))))))

(assert (=> d!20428 (= (isPrefixOf!0 (_1!2999 lt!102486) (_2!3000 lt!102483)) e!42920)))

(declare-fun b!65152 () Bool)

(declare-fun res!54011 () Bool)

(assert (=> b!65152 (=> (not res!54011) (not e!42920))))

(assert (=> b!65152 (= res!54011 (bvsle (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102486))) (currentByte!3340 (_1!2999 lt!102486)) (currentBit!3335 (_1!2999 lt!102486))) (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102483))) (currentByte!3340 (_2!3000 lt!102483)) (currentBit!3335 (_2!3000 lt!102483)))))))

(declare-fun b!65153 () Bool)

(declare-fun e!42921 () Bool)

(assert (=> b!65153 (= e!42920 e!42921)))

(declare-fun res!54012 () Bool)

(assert (=> b!65153 (=> res!54012 e!42921)))

(assert (=> b!65153 (= res!54012 (= (size!1299 (buf!1680 (_1!2999 lt!102486))) #b00000000000000000000000000000000))))

(declare-fun b!65154 () Bool)

(assert (=> b!65154 (= e!42921 (arrayBitRangesEq!0 (buf!1680 (_1!2999 lt!102486)) (buf!1680 (_2!3000 lt!102483)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102486))) (currentByte!3340 (_1!2999 lt!102486)) (currentBit!3335 (_1!2999 lt!102486)))))))

(assert (= (and d!20428 res!54010) b!65152))

(assert (= (and b!65152 res!54011) b!65153))

(assert (= (and b!65153 (not res!54012)) b!65154))

(assert (=> b!65152 m!102833))

(assert (=> b!65152 m!102873))

(assert (=> b!65154 m!102833))

(assert (=> b!65154 m!102833))

(declare-fun m!103469 () Bool)

(assert (=> b!65154 m!103469))

(assert (=> b!64798 d!20428))

(declare-fun d!20430 () Bool)

(declare-fun res!54013 () Bool)

(declare-fun e!42922 () Bool)

(assert (=> d!20430 (=> (not res!54013) (not e!42922))))

(assert (=> d!20430 (= res!54013 (= (size!1299 (buf!1680 thiss!1379)) (size!1299 (buf!1680 (_2!3000 lt!102474)))))))

(assert (=> d!20430 (= (isPrefixOf!0 thiss!1379 (_2!3000 lt!102474)) e!42922)))

(declare-fun b!65155 () Bool)

(declare-fun res!54014 () Bool)

(assert (=> b!65155 (=> (not res!54014) (not e!42922))))

(assert (=> b!65155 (= res!54014 (bvsle (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)) (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102474))) (currentByte!3340 (_2!3000 lt!102474)) (currentBit!3335 (_2!3000 lt!102474)))))))

(declare-fun b!65156 () Bool)

(declare-fun e!42923 () Bool)

(assert (=> b!65156 (= e!42922 e!42923)))

(declare-fun res!54015 () Bool)

(assert (=> b!65156 (=> res!54015 e!42923)))

(assert (=> b!65156 (= res!54015 (= (size!1299 (buf!1680 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65157 () Bool)

(assert (=> b!65157 (= e!42923 (arrayBitRangesEq!0 (buf!1680 thiss!1379) (buf!1680 (_2!3000 lt!102474)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379))))))

(assert (= (and d!20430 res!54013) b!65155))

(assert (= (and b!65155 res!54014) b!65156))

(assert (= (and b!65156 (not res!54015)) b!65157))

(assert (=> b!65155 m!102831))

(assert (=> b!65155 m!102837))

(assert (=> b!65157 m!102831))

(assert (=> b!65157 m!102831))

(declare-fun m!103471 () Bool)

(assert (=> b!65157 m!103471))

(assert (=> b!64789 d!20430))

(declare-fun d!20432 () Bool)

(assert (=> d!20432 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) lt!102484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474)))) lt!102484))))

(declare-fun bs!4993 () Bool)

(assert (= bs!4993 d!20432))

(assert (=> bs!4993 m!103465))

(assert (=> b!64789 d!20432))

(declare-fun d!20434 () Bool)

(declare-fun e!42926 () Bool)

(assert (=> d!20434 e!42926))

(declare-fun res!54018 () Bool)

(assert (=> d!20434 (=> (not res!54018) (not e!42926))))

(assert (=> d!20434 (= res!54018 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!103153 () Unit!4387)

(declare-fun choose!27 (BitStream!2244 BitStream!2244 (_ BitVec 64) (_ BitVec 64)) Unit!4387)

(assert (=> d!20434 (= lt!103153 (choose!27 thiss!1379 (_2!3000 lt!102474) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20434 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20434 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3000 lt!102474) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103153)))

(declare-fun b!65160 () Bool)

(assert (=> b!65160 (= e!42926 (validate_offset_bits!1 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102474)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102474))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102474))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20434 res!54018) b!65160))

(declare-fun m!103473 () Bool)

(assert (=> d!20434 m!103473))

(declare-fun m!103475 () Bool)

(assert (=> b!65160 m!103475))

(assert (=> b!64789 d!20434))

(declare-fun b!65178 () Bool)

(declare-fun res!54037 () Bool)

(declare-fun e!42937 () Bool)

(assert (=> b!65178 (=> (not res!54037) (not e!42937))))

(declare-fun lt!103180 () tuple2!5778)

(assert (=> b!65178 (= res!54037 (isPrefixOf!0 thiss!1379 (_2!3000 lt!103180)))))

(declare-fun b!65179 () Bool)

(declare-fun res!54039 () Bool)

(declare-fun e!42935 () Bool)

(assert (=> b!65179 (=> (not res!54039) (not e!42935))))

(declare-fun lt!103186 () tuple2!5778)

(assert (=> b!65179 (= res!54039 (= (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!103186))) (currentByte!3340 (_2!3000 lt!103186)) (currentBit!3335 (_2!3000 lt!103186))) (bvadd (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!65180 () Bool)

(declare-fun res!54040 () Bool)

(assert (=> b!65180 (=> (not res!54040) (not e!42935))))

(assert (=> b!65180 (= res!54040 (isPrefixOf!0 thiss!1379 (_2!3000 lt!103186)))))

(declare-fun b!65182 () Bool)

(declare-fun e!42938 () Bool)

(declare-datatypes ((tuple2!5790 0))(
  ( (tuple2!5791 (_1!3006 BitStream!2244) (_2!3006 Bool)) )
))
(declare-fun lt!103188 () tuple2!5790)

(assert (=> b!65182 (= e!42938 (= (bitIndex!0 (size!1299 (buf!1680 (_1!3006 lt!103188))) (currentByte!3340 (_1!3006 lt!103188)) (currentBit!3335 (_1!3006 lt!103188))) (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!103180))) (currentByte!3340 (_2!3000 lt!103180)) (currentBit!3335 (_2!3000 lt!103180)))))))

(declare-fun b!65183 () Bool)

(declare-fun e!42936 () Bool)

(assert (=> b!65183 (= e!42935 e!42936)))

(declare-fun res!54042 () Bool)

(assert (=> b!65183 (=> (not res!54042) (not e!42936))))

(declare-fun lt!103182 () tuple2!5790)

(declare-fun lt!103184 () Bool)

(assert (=> b!65183 (= res!54042 (and (= (_2!3006 lt!103182) lt!103184) (= (_1!3006 lt!103182) (_2!3000 lt!103186))))))

(declare-fun readBitPure!0 (BitStream!2244) tuple2!5790)

(declare-fun readerFrom!0 (BitStream!2244 (_ BitVec 32) (_ BitVec 32)) BitStream!2244)

(assert (=> b!65183 (= lt!103182 (readBitPure!0 (readerFrom!0 (_2!3000 lt!103186) (currentBit!3335 thiss!1379) (currentByte!3340 thiss!1379))))))

(declare-fun b!65184 () Bool)

(assert (=> b!65184 (= e!42937 e!42938)))

(declare-fun res!54041 () Bool)

(assert (=> b!65184 (=> (not res!54041) (not e!42938))))

(declare-fun lt!103183 () (_ BitVec 8))

(assert (=> b!65184 (= res!54041 (and (= (_2!3006 lt!103188) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1863 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!103183)) #b00000000000000000000000000000000))) (= (_1!3006 lt!103188) (_2!3000 lt!103180))))))

(declare-fun lt!103189 () tuple2!5788)

(declare-fun lt!103185 () BitStream!2244)

(assert (=> b!65184 (= lt!103189 (readBits!0 lt!103185 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!65184 (= lt!103188 (readBitPure!0 lt!103185))))

(assert (=> b!65184 (= lt!103185 (readerFrom!0 (_2!3000 lt!103180) (currentBit!3335 thiss!1379) (currentByte!3340 thiss!1379)))))

(declare-fun b!65185 () Bool)

(declare-fun res!54038 () Bool)

(assert (=> b!65185 (=> (not res!54038) (not e!42937))))

(declare-fun lt!103187 () (_ BitVec 64))

(declare-fun lt!103181 () (_ BitVec 64))

(assert (=> b!65185 (= res!54038 (= (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!103180))) (currentByte!3340 (_2!3000 lt!103180)) (currentBit!3335 (_2!3000 lt!103180))) (bvadd lt!103181 lt!103187)))))

(assert (=> b!65185 (or (not (= (bvand lt!103181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103187 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!103181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!103181 lt!103187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65185 (= lt!103187 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!65185 (= lt!103181 (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)))))

(declare-fun b!65181 () Bool)

(assert (=> b!65181 (= e!42936 (= (bitIndex!0 (size!1299 (buf!1680 (_1!3006 lt!103182))) (currentByte!3340 (_1!3006 lt!103182)) (currentBit!3335 (_1!3006 lt!103182))) (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!103186))) (currentByte!3340 (_2!3000 lt!103186)) (currentBit!3335 (_2!3000 lt!103186)))))))

(declare-fun d!20436 () Bool)

(assert (=> d!20436 e!42937))

(declare-fun res!54036 () Bool)

(assert (=> d!20436 (=> (not res!54036) (not e!42937))))

(assert (=> d!20436 (= res!54036 (= (size!1299 (buf!1680 (_2!3000 lt!103180))) (size!1299 (buf!1680 thiss!1379))))))

(declare-fun lt!103178 () array!2826)

(assert (=> d!20436 (= lt!103183 (select (arr!1863 lt!103178) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20436 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1299 lt!103178)))))

(assert (=> d!20436 (= lt!103178 (array!2827 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!103179 () tuple2!5778)

(assert (=> d!20436 (= lt!103180 (tuple2!5779 (_1!3000 lt!103179) (_2!3000 lt!103179)))))

(assert (=> d!20436 (= lt!103179 lt!103186)))

(assert (=> d!20436 e!42935))

(declare-fun res!54035 () Bool)

(assert (=> d!20436 (=> (not res!54035) (not e!42935))))

(assert (=> d!20436 (= res!54035 (= (size!1299 (buf!1680 thiss!1379)) (size!1299 (buf!1680 (_2!3000 lt!103186)))))))

(declare-fun appendBit!0 (BitStream!2244 Bool) tuple2!5778)

(assert (=> d!20436 (= lt!103186 (appendBit!0 thiss!1379 lt!103184))))

(assert (=> d!20436 (= lt!103184 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1863 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20436 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20436 (= (appendBitFromByte!0 thiss!1379 (select (arr!1863 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!103180)))

(assert (= (and d!20436 res!54035) b!65179))

(assert (= (and b!65179 res!54039) b!65180))

(assert (= (and b!65180 res!54040) b!65183))

(assert (= (and b!65183 res!54042) b!65181))

(assert (= (and d!20436 res!54036) b!65185))

(assert (= (and b!65185 res!54038) b!65178))

(assert (= (and b!65178 res!54037) b!65184))

(assert (= (and b!65184 res!54041) b!65182))

(declare-fun m!103477 () Bool)

(assert (=> b!65181 m!103477))

(declare-fun m!103479 () Bool)

(assert (=> b!65181 m!103479))

(declare-fun m!103481 () Bool)

(assert (=> d!20436 m!103481))

(declare-fun m!103483 () Bool)

(assert (=> d!20436 m!103483))

(assert (=> d!20436 m!103043))

(declare-fun m!103485 () Bool)

(assert (=> b!65184 m!103485))

(declare-fun m!103487 () Bool)

(assert (=> b!65184 m!103487))

(declare-fun m!103489 () Bool)

(assert (=> b!65184 m!103489))

(declare-fun m!103491 () Bool)

(assert (=> b!65178 m!103491))

(declare-fun m!103493 () Bool)

(assert (=> b!65183 m!103493))

(assert (=> b!65183 m!103493))

(declare-fun m!103495 () Bool)

(assert (=> b!65183 m!103495))

(declare-fun m!103497 () Bool)

(assert (=> b!65185 m!103497))

(assert (=> b!65185 m!102831))

(declare-fun m!103499 () Bool)

(assert (=> b!65180 m!103499))

(assert (=> b!65179 m!103479))

(assert (=> b!65179 m!102831))

(declare-fun m!103501 () Bool)

(assert (=> b!65182 m!103501))

(assert (=> b!65182 m!103497))

(assert (=> b!64789 d!20436))

(declare-fun d!20438 () Bool)

(declare-fun e!42939 () Bool)

(assert (=> d!20438 e!42939))

(declare-fun res!54043 () Bool)

(assert (=> d!20438 (=> (not res!54043) (not e!42939))))

(declare-fun lt!103195 () (_ BitVec 64))

(declare-fun lt!103190 () (_ BitVec 64))

(declare-fun lt!103191 () (_ BitVec 64))

(assert (=> d!20438 (= res!54043 (= lt!103191 (bvsub lt!103195 lt!103190)))))

(assert (=> d!20438 (or (= (bvand lt!103195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103190 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103195 lt!103190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20438 (= lt!103190 (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 (_1!2999 lt!102486)))) ((_ sign_extend 32) (currentByte!3340 (_1!2999 lt!102486))) ((_ sign_extend 32) (currentBit!3335 (_1!2999 lt!102486)))))))

(declare-fun lt!103194 () (_ BitVec 64))

(declare-fun lt!103193 () (_ BitVec 64))

(assert (=> d!20438 (= lt!103195 (bvmul lt!103194 lt!103193))))

(assert (=> d!20438 (or (= lt!103194 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103193 (bvsdiv (bvmul lt!103194 lt!103193) lt!103194)))))

(assert (=> d!20438 (= lt!103193 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20438 (= lt!103194 ((_ sign_extend 32) (size!1299 (buf!1680 (_1!2999 lt!102486)))))))

(assert (=> d!20438 (= lt!103191 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3340 (_1!2999 lt!102486))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3335 (_1!2999 lt!102486)))))))

(assert (=> d!20438 (invariant!0 (currentBit!3335 (_1!2999 lt!102486)) (currentByte!3340 (_1!2999 lt!102486)) (size!1299 (buf!1680 (_1!2999 lt!102486))))))

(assert (=> d!20438 (= (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102486))) (currentByte!3340 (_1!2999 lt!102486)) (currentBit!3335 (_1!2999 lt!102486))) lt!103191)))

(declare-fun b!65186 () Bool)

(declare-fun res!54044 () Bool)

(assert (=> b!65186 (=> (not res!54044) (not e!42939))))

(assert (=> b!65186 (= res!54044 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103191))))

(declare-fun b!65187 () Bool)

(declare-fun lt!103192 () (_ BitVec 64))

(assert (=> b!65187 (= e!42939 (bvsle lt!103191 (bvmul lt!103192 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65187 (or (= lt!103192 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103192 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103192)))))

(assert (=> b!65187 (= lt!103192 ((_ sign_extend 32) (size!1299 (buf!1680 (_1!2999 lt!102486)))))))

(assert (= (and d!20438 res!54043) b!65186))

(assert (= (and b!65186 res!54044) b!65187))

(assert (=> d!20438 m!103041))

(declare-fun m!103503 () Bool)

(assert (=> d!20438 m!103503))

(assert (=> b!64778 d!20438))

(declare-fun d!20440 () Bool)

(declare-fun e!42940 () Bool)

(assert (=> d!20440 e!42940))

(declare-fun res!54045 () Bool)

(assert (=> d!20440 (=> (not res!54045) (not e!42940))))

(declare-fun lt!103197 () (_ BitVec 64))

(declare-fun lt!103201 () (_ BitVec 64))

(declare-fun lt!103196 () (_ BitVec 64))

(assert (=> d!20440 (= res!54045 (= lt!103197 (bvsub lt!103201 lt!103196)))))

(assert (=> d!20440 (or (= (bvand lt!103201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103196 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103201 lt!103196) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20440 (= lt!103196 (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 (_1!2999 lt!102481)))) ((_ sign_extend 32) (currentByte!3340 (_1!2999 lt!102481))) ((_ sign_extend 32) (currentBit!3335 (_1!2999 lt!102481)))))))

(declare-fun lt!103200 () (_ BitVec 64))

(declare-fun lt!103199 () (_ BitVec 64))

(assert (=> d!20440 (= lt!103201 (bvmul lt!103200 lt!103199))))

(assert (=> d!20440 (or (= lt!103200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103199 (bvsdiv (bvmul lt!103200 lt!103199) lt!103200)))))

(assert (=> d!20440 (= lt!103199 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20440 (= lt!103200 ((_ sign_extend 32) (size!1299 (buf!1680 (_1!2999 lt!102481)))))))

(assert (=> d!20440 (= lt!103197 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3340 (_1!2999 lt!102481))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3335 (_1!2999 lt!102481)))))))

(assert (=> d!20440 (invariant!0 (currentBit!3335 (_1!2999 lt!102481)) (currentByte!3340 (_1!2999 lt!102481)) (size!1299 (buf!1680 (_1!2999 lt!102481))))))

(assert (=> d!20440 (= (bitIndex!0 (size!1299 (buf!1680 (_1!2999 lt!102481))) (currentByte!3340 (_1!2999 lt!102481)) (currentBit!3335 (_1!2999 lt!102481))) lt!103197)))

(declare-fun b!65188 () Bool)

(declare-fun res!54046 () Bool)

(assert (=> b!65188 (=> (not res!54046) (not e!42940))))

(assert (=> b!65188 (= res!54046 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103197))))

(declare-fun b!65189 () Bool)

(declare-fun lt!103198 () (_ BitVec 64))

(assert (=> b!65189 (= e!42940 (bvsle lt!103197 (bvmul lt!103198 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65189 (or (= lt!103198 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103198 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103198)))))

(assert (=> b!65189 (= lt!103198 ((_ sign_extend 32) (size!1299 (buf!1680 (_1!2999 lt!102481)))))))

(assert (= (and d!20440 res!54045) b!65188))

(assert (= (and b!65188 res!54046) b!65189))

(declare-fun m!103505 () Bool)

(assert (=> d!20440 m!103505))

(declare-fun m!103507 () Bool)

(assert (=> d!20440 m!103507))

(assert (=> b!64778 d!20440))

(declare-fun d!20442 () Bool)

(declare-fun e!42941 () Bool)

(assert (=> d!20442 e!42941))

(declare-fun res!54047 () Bool)

(assert (=> d!20442 (=> (not res!54047) (not e!42941))))

(declare-fun lt!103207 () (_ BitVec 64))

(declare-fun lt!103203 () (_ BitVec 64))

(declare-fun lt!103202 () (_ BitVec 64))

(assert (=> d!20442 (= res!54047 (= lt!103203 (bvsub lt!103207 lt!103202)))))

(assert (=> d!20442 (or (= (bvand lt!103207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103202 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103207 lt!103202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20442 (= lt!103202 (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))) ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102483))) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102483)))))))

(declare-fun lt!103206 () (_ BitVec 64))

(declare-fun lt!103205 () (_ BitVec 64))

(assert (=> d!20442 (= lt!103207 (bvmul lt!103206 lt!103205))))

(assert (=> d!20442 (or (= lt!103206 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103205 (bvsdiv (bvmul lt!103206 lt!103205) lt!103206)))))

(assert (=> d!20442 (= lt!103205 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20442 (= lt!103206 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))))))

(assert (=> d!20442 (= lt!103203 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3340 (_2!3000 lt!102483))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3335 (_2!3000 lt!102483)))))))

(assert (=> d!20442 (invariant!0 (currentBit!3335 (_2!3000 lt!102483)) (currentByte!3340 (_2!3000 lt!102483)) (size!1299 (buf!1680 (_2!3000 lt!102483))))))

(assert (=> d!20442 (= (bitIndex!0 (size!1299 (buf!1680 (_2!3000 lt!102483))) (currentByte!3340 (_2!3000 lt!102483)) (currentBit!3335 (_2!3000 lt!102483))) lt!103203)))

(declare-fun b!65190 () Bool)

(declare-fun res!54048 () Bool)

(assert (=> b!65190 (=> (not res!54048) (not e!42941))))

(assert (=> b!65190 (= res!54048 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103203))))

(declare-fun b!65191 () Bool)

(declare-fun lt!103204 () (_ BitVec 64))

(assert (=> b!65191 (= e!42941 (bvsle lt!103203 (bvmul lt!103204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65191 (or (= lt!103204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103204)))))

(assert (=> b!65191 (= lt!103204 ((_ sign_extend 32) (size!1299 (buf!1680 (_2!3000 lt!102483)))))))

(assert (= (and d!20442 res!54047) b!65190))

(assert (= (and b!65190 res!54048) b!65191))

(declare-fun m!103509 () Bool)

(assert (=> d!20442 m!103509))

(assert (=> d!20442 m!102843))

(assert (=> b!64785 d!20442))

(declare-fun d!20444 () Bool)

(declare-fun size!1301 (List!697) Int)

(assert (=> d!20444 (= (length!325 lt!102477) (size!1301 lt!102477))))

(declare-fun bs!4994 () Bool)

(assert (= bs!4994 d!20444))

(declare-fun m!103511 () Bool)

(assert (=> bs!4994 m!103511))

(assert (=> b!64795 d!20444))

(declare-fun d!20446 () Bool)

(declare-fun res!54049 () Bool)

(declare-fun e!42942 () Bool)

(assert (=> d!20446 (=> (not res!54049) (not e!42942))))

(assert (=> d!20446 (= res!54049 (= (size!1299 (buf!1680 thiss!1379)) (size!1299 (buf!1680 thiss!1379))))))

(assert (=> d!20446 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!42942)))

(declare-fun b!65192 () Bool)

(declare-fun res!54050 () Bool)

(assert (=> b!65192 (=> (not res!54050) (not e!42942))))

(assert (=> b!65192 (= res!54050 (bvsle (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)) (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379))))))

(declare-fun b!65193 () Bool)

(declare-fun e!42943 () Bool)

(assert (=> b!65193 (= e!42942 e!42943)))

(declare-fun res!54051 () Bool)

(assert (=> b!65193 (=> res!54051 e!42943)))

(assert (=> b!65193 (= res!54051 (= (size!1299 (buf!1680 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65194 () Bool)

(assert (=> b!65194 (= e!42943 (arrayBitRangesEq!0 (buf!1680 thiss!1379) (buf!1680 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379))))))

(assert (= (and d!20446 res!54049) b!65192))

(assert (= (and b!65192 res!54050) b!65193))

(assert (= (and b!65193 (not res!54051)) b!65194))

(assert (=> b!65192 m!102831))

(assert (=> b!65192 m!102831))

(assert (=> b!65194 m!102831))

(assert (=> b!65194 m!102831))

(declare-fun m!103513 () Bool)

(assert (=> b!65194 m!103513))

(assert (=> b!64797 d!20446))

(declare-fun d!20448 () Bool)

(assert (=> d!20448 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!103210 () Unit!4387)

(declare-fun choose!11 (BitStream!2244) Unit!4387)

(assert (=> d!20448 (= lt!103210 (choose!11 thiss!1379))))

(assert (=> d!20448 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!103210)))

(declare-fun bs!4996 () Bool)

(assert (= bs!4996 d!20448))

(assert (=> bs!4996 m!102827))

(declare-fun m!103515 () Bool)

(assert (=> bs!4996 m!103515))

(assert (=> b!64797 d!20448))

(declare-fun d!20450 () Bool)

(declare-fun e!42944 () Bool)

(assert (=> d!20450 e!42944))

(declare-fun res!54052 () Bool)

(assert (=> d!20450 (=> (not res!54052) (not e!42944))))

(declare-fun lt!103212 () (_ BitVec 64))

(declare-fun lt!103211 () (_ BitVec 64))

(declare-fun lt!103216 () (_ BitVec 64))

(assert (=> d!20450 (= res!54052 (= lt!103212 (bvsub lt!103216 lt!103211)))))

(assert (=> d!20450 (or (= (bvand lt!103216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103211 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103216 lt!103211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20450 (= lt!103211 (remainingBits!0 ((_ sign_extend 32) (size!1299 (buf!1680 thiss!1379))) ((_ sign_extend 32) (currentByte!3340 thiss!1379)) ((_ sign_extend 32) (currentBit!3335 thiss!1379))))))

(declare-fun lt!103215 () (_ BitVec 64))

(declare-fun lt!103214 () (_ BitVec 64))

(assert (=> d!20450 (= lt!103216 (bvmul lt!103215 lt!103214))))

(assert (=> d!20450 (or (= lt!103215 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103214 (bvsdiv (bvmul lt!103215 lt!103214) lt!103215)))))

(assert (=> d!20450 (= lt!103214 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20450 (= lt!103215 ((_ sign_extend 32) (size!1299 (buf!1680 thiss!1379))))))

(assert (=> d!20450 (= lt!103212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3340 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3335 thiss!1379))))))

(assert (=> d!20450 (invariant!0 (currentBit!3335 thiss!1379) (currentByte!3340 thiss!1379) (size!1299 (buf!1680 thiss!1379)))))

(assert (=> d!20450 (= (bitIndex!0 (size!1299 (buf!1680 thiss!1379)) (currentByte!3340 thiss!1379) (currentBit!3335 thiss!1379)) lt!103212)))

(declare-fun b!65195 () Bool)

(declare-fun res!54053 () Bool)

(assert (=> b!65195 (=> (not res!54053) (not e!42944))))

(assert (=> b!65195 (= res!54053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103212))))

(declare-fun b!65196 () Bool)

(declare-fun lt!103213 () (_ BitVec 64))

(assert (=> b!65196 (= e!42944 (bvsle lt!103212 (bvmul lt!103213 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65196 (or (= lt!103213 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103213 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103213)))))

(assert (=> b!65196 (= lt!103213 ((_ sign_extend 32) (size!1299 (buf!1680 thiss!1379))))))

(assert (= (and d!20450 res!54052) b!65195))

(assert (= (and b!65195 res!54053) b!65196))

(assert (=> d!20450 m!103039))

(assert (=> d!20450 m!103037))

(assert (=> b!64797 d!20450))

(declare-fun d!20452 () Bool)

(assert (=> d!20452 (= (invariant!0 (currentBit!3335 (_2!3000 lt!102474)) (currentByte!3340 (_2!3000 lt!102474)) (size!1299 (buf!1680 (_2!3000 lt!102474)))) (and (bvsge (currentBit!3335 (_2!3000 lt!102474)) #b00000000000000000000000000000000) (bvslt (currentBit!3335 (_2!3000 lt!102474)) #b00000000000000000000000000001000) (bvsge (currentByte!3340 (_2!3000 lt!102474)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3340 (_2!3000 lt!102474)) (size!1299 (buf!1680 (_2!3000 lt!102474)))) (and (= (currentBit!3335 (_2!3000 lt!102474)) #b00000000000000000000000000000000) (= (currentByte!3340 (_2!3000 lt!102474)) (size!1299 (buf!1680 (_2!3000 lt!102474))))))))))

(assert (=> b!64786 d!20452))

(check-sat (not b!64888) (not b!65160) (not d!20246) (not d!20262) (not d!20266) (not b!64921) (not b!65140) (not b!64872) (not b!65132) (not b!65142) (not b!65135) (not b!65134) (not d!20242) (not d!20442) (not b!65157) (not b!64896) (not b!64903) (not d!20238) (not b!65152) (not d!20432) (not b!65194) (not d!20244) (not b!65149) (not b!64891) (not b!64906) (not b!65184) (not b!65139) (not b!64897) (not d!20252) (not b!65151) (not b!65136) (not b!64916) (not b!64871) (not b!64917) (not b!64893) (not b!64890) (not b!65192) (not d!20440) (not b!65155) (not d!20448) (not d!20434) (not d!20444) (not d!20286) (not b!64907) (not d!20288) (not b!64885) (not d!20424) (not d!20278) (not d!20264) (not b!64905) (not d!20248) (not d!20450) (not b!65183) (not b!64886) (not b!65182) (not b!64923) (not b!64892) (not b!64895) (not d!20280) (not b!64919) (not b!65181) (not b!65154) (not b!64887) (not b!65179) (not d!20436) (not b!65133) (not d!20438) (not b!65178) (not b!65180) (not b!64924) (not b!64922) (not bm!826) (not b!64914) (not b!64873) (not b!65185) (not d!20284))
(check-sat)
