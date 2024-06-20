; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54632 () Bool)

(assert start!54632)

(declare-fun b!255523 () Bool)

(declare-fun res!214176 () Bool)

(declare-fun e!177016 () Bool)

(assert (=> b!255523 (=> (not res!214176) (not e!177016))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13779 0))(
  ( (array!13780 (arr!7031 (Array (_ BitVec 32) (_ BitVec 8))) (size!6044 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11010 0))(
  ( (BitStream!11011 (buf!6561 array!13779) (currentByte!12040 (_ BitVec 32)) (currentBit!12035 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11010)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255523 (= res!214176 (validate_offset_bits!1 ((_ sign_extend 32) (size!6044 (buf!6561 thiss!1005))) ((_ sign_extend 32) (currentByte!12040 thiss!1005)) ((_ sign_extend 32) (currentBit!12035 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255524 () Bool)

(declare-fun e!177020 () Bool)

(declare-datatypes ((Unit!18296 0))(
  ( (Unit!18297) )
))
(declare-datatypes ((tuple2!21852 0))(
  ( (tuple2!21853 (_1!11860 Unit!18296) (_2!11860 BitStream!11010)) )
))
(declare-fun lt!396857 () tuple2!21852)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255524 (= e!177020 (invariant!0 (currentBit!12035 thiss!1005) (currentByte!12040 thiss!1005) (size!6044 (buf!6561 (_2!11860 lt!396857)))))))

(declare-fun b!255525 () Bool)

(declare-fun res!214190 () Bool)

(assert (=> b!255525 (=> (not res!214190) (not e!177016))))

(assert (=> b!255525 (= res!214190 (bvslt from!289 nBits!297))))

(declare-fun b!255526 () Bool)

(declare-fun e!177021 () Bool)

(declare-fun array_inv!5785 (array!13779) Bool)

(assert (=> b!255526 (= e!177021 (array_inv!5785 (buf!6561 thiss!1005)))))

(declare-fun b!255527 () Bool)

(declare-fun e!177017 () Bool)

(declare-fun e!177023 () Bool)

(assert (=> b!255527 (= e!177017 e!177023)))

(declare-fun res!214188 () Bool)

(assert (=> b!255527 (=> res!214188 e!177023)))

(assert (=> b!255527 (= res!214188 (not (= (size!6044 (buf!6561 thiss!1005)) (size!6044 (buf!6561 (_2!11860 lt!396857))))))))

(declare-datatypes ((tuple2!21854 0))(
  ( (tuple2!21855 (_1!11861 BitStream!11010) (_2!11861 Bool)) )
))
(declare-fun lt!396861 () tuple2!21854)

(declare-fun lt!396860 () tuple2!21854)

(declare-datatypes ((tuple2!21856 0))(
  ( (tuple2!21857 (_1!11862 BitStream!11010) (_2!11862 BitStream!11010)) )
))
(declare-fun lt!396867 () tuple2!21856)

(assert (=> b!255527 (and (= (_2!11861 lt!396861) (_2!11861 lt!396860)) (= (_1!11861 lt!396861) (_2!11862 lt!396867)))))

(declare-fun b!255529 () Bool)

(declare-fun e!177025 () Bool)

(declare-fun e!177024 () Bool)

(assert (=> b!255529 (= e!177025 e!177024)))

(declare-fun res!214179 () Bool)

(assert (=> b!255529 (=> (not res!214179) (not e!177024))))

(declare-fun lt!396862 () (_ BitVec 64))

(declare-fun lt!396853 () tuple2!21852)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255529 (= res!214179 (= (bitIndex!0 (size!6044 (buf!6561 (_2!11860 lt!396857))) (currentByte!12040 (_2!11860 lt!396857)) (currentBit!12035 (_2!11860 lt!396857))) (bvadd (bitIndex!0 (size!6044 (buf!6561 (_2!11860 lt!396853))) (currentByte!12040 (_2!11860 lt!396853)) (currentBit!12035 (_2!11860 lt!396853))) lt!396862)))))

(assert (=> b!255529 (= lt!396862 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255530 () Bool)

(declare-fun e!177022 () Bool)

(declare-fun e!177019 () Bool)

(assert (=> b!255530 (= e!177022 e!177019)))

(declare-fun res!214184 () Bool)

(assert (=> b!255530 (=> (not res!214184) (not e!177019))))

(declare-fun lt!396859 () (_ BitVec 64))

(declare-fun lt!396864 () (_ BitVec 64))

(assert (=> b!255530 (= res!214184 (= lt!396859 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!396864)))))

(assert (=> b!255530 (= lt!396859 (bitIndex!0 (size!6044 (buf!6561 (_2!11860 lt!396853))) (currentByte!12040 (_2!11860 lt!396853)) (currentBit!12035 (_2!11860 lt!396853))))))

(assert (=> b!255530 (= lt!396864 (bitIndex!0 (size!6044 (buf!6561 thiss!1005)) (currentByte!12040 thiss!1005) (currentBit!12035 thiss!1005)))))

(declare-fun b!255531 () Bool)

(declare-fun res!214187 () Bool)

(assert (=> b!255531 (=> (not res!214187) (not e!177020))))

(assert (=> b!255531 (= res!214187 (invariant!0 (currentBit!12035 thiss!1005) (currentByte!12040 thiss!1005) (size!6044 (buf!6561 (_2!11860 lt!396853)))))))

(declare-fun b!255532 () Bool)

(declare-fun res!214183 () Bool)

(assert (=> b!255532 (=> (not res!214183) (not e!177019))))

(declare-fun isPrefixOf!0 (BitStream!11010 BitStream!11010) Bool)

(assert (=> b!255532 (= res!214183 (isPrefixOf!0 thiss!1005 (_2!11860 lt!396853)))))

(declare-fun b!255533 () Bool)

(declare-fun e!177026 () Bool)

(assert (=> b!255533 (= e!177019 e!177026)))

(declare-fun res!214181 () Bool)

(assert (=> b!255533 (=> (not res!214181) (not e!177026))))

(declare-fun bit!26 () Bool)

(declare-fun lt!396856 () tuple2!21854)

(assert (=> b!255533 (= res!214181 (and (= (_2!11861 lt!396856) bit!26) (= (_1!11861 lt!396856) (_2!11860 lt!396853))))))

(declare-fun readBitPure!0 (BitStream!11010) tuple2!21854)

(declare-fun readerFrom!0 (BitStream!11010 (_ BitVec 32) (_ BitVec 32)) BitStream!11010)

(assert (=> b!255533 (= lt!396856 (readBitPure!0 (readerFrom!0 (_2!11860 lt!396853) (currentBit!12035 thiss!1005) (currentByte!12040 thiss!1005))))))

(declare-fun b!255534 () Bool)

(assert (=> b!255534 (= e!177023 true)))

(declare-fun lt!396866 () (_ BitVec 64))

(assert (=> b!255534 (= lt!396866 (bitIndex!0 (size!6044 (buf!6561 (_2!11860 lt!396857))) (currentByte!12040 (_2!11860 lt!396857)) (currentBit!12035 (_2!11860 lt!396857))))))

(declare-fun lt!396854 () (_ BitVec 64))

(assert (=> b!255534 (= lt!396854 (bitIndex!0 (size!6044 (buf!6561 thiss!1005)) (currentByte!12040 thiss!1005) (currentBit!12035 thiss!1005)))))

(declare-fun b!255535 () Bool)

(assert (=> b!255535 (= e!177016 (not e!177017))))

(declare-fun res!214186 () Bool)

(assert (=> b!255535 (=> res!214186 e!177017)))

(declare-fun lt!396871 () tuple2!21856)

(assert (=> b!255535 (= res!214186 (not (= (_1!11861 lt!396860) (_2!11862 lt!396871))))))

(declare-fun checkBitsLoopPure!0 (BitStream!11010 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21854)

(assert (=> b!255535 (= lt!396860 (checkBitsLoopPure!0 (_1!11862 lt!396871) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396865 () (_ BitVec 64))

(assert (=> b!255535 (validate_offset_bits!1 ((_ sign_extend 32) (size!6044 (buf!6561 (_2!11860 lt!396857)))) ((_ sign_extend 32) (currentByte!12040 (_2!11860 lt!396853))) ((_ sign_extend 32) (currentBit!12035 (_2!11860 lt!396853))) lt!396865)))

(declare-fun lt!396863 () Unit!18296)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11010 array!13779 (_ BitVec 64)) Unit!18296)

(assert (=> b!255535 (= lt!396863 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11860 lt!396853) (buf!6561 (_2!11860 lt!396857)) lt!396865))))

(assert (=> b!255535 (= lt!396861 (checkBitsLoopPure!0 (_1!11862 lt!396867) nBits!297 bit!26 from!289))))

(assert (=> b!255535 (validate_offset_bits!1 ((_ sign_extend 32) (size!6044 (buf!6561 (_2!11860 lt!396857)))) ((_ sign_extend 32) (currentByte!12040 thiss!1005)) ((_ sign_extend 32) (currentBit!12035 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!396869 () Unit!18296)

(assert (=> b!255535 (= lt!396869 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6561 (_2!11860 lt!396857)) (bvsub nBits!297 from!289)))))

(assert (=> b!255535 (= (_2!11861 (readBitPure!0 (_1!11862 lt!396867))) bit!26)))

(declare-fun reader!0 (BitStream!11010 BitStream!11010) tuple2!21856)

(assert (=> b!255535 (= lt!396871 (reader!0 (_2!11860 lt!396853) (_2!11860 lt!396857)))))

(assert (=> b!255535 (= lt!396867 (reader!0 thiss!1005 (_2!11860 lt!396857)))))

(declare-fun e!177015 () Bool)

(assert (=> b!255535 e!177015))

(declare-fun res!214189 () Bool)

(assert (=> b!255535 (=> (not res!214189) (not e!177015))))

(declare-fun lt!396868 () tuple2!21854)

(declare-fun lt!396855 () tuple2!21854)

(assert (=> b!255535 (= res!214189 (= (bitIndex!0 (size!6044 (buf!6561 (_1!11861 lt!396868))) (currentByte!12040 (_1!11861 lt!396868)) (currentBit!12035 (_1!11861 lt!396868))) (bitIndex!0 (size!6044 (buf!6561 (_1!11861 lt!396855))) (currentByte!12040 (_1!11861 lt!396855)) (currentBit!12035 (_1!11861 lt!396855)))))))

(declare-fun lt!396872 () Unit!18296)

(declare-fun lt!396873 () BitStream!11010)

(declare-fun readBitPrefixLemma!0 (BitStream!11010 BitStream!11010) Unit!18296)

(assert (=> b!255535 (= lt!396872 (readBitPrefixLemma!0 lt!396873 (_2!11860 lt!396857)))))

(assert (=> b!255535 (= lt!396855 (readBitPure!0 (BitStream!11011 (buf!6561 (_2!11860 lt!396857)) (currentByte!12040 thiss!1005) (currentBit!12035 thiss!1005))))))

(assert (=> b!255535 (= lt!396868 (readBitPure!0 lt!396873))))

(assert (=> b!255535 (= lt!396873 (BitStream!11011 (buf!6561 (_2!11860 lt!396853)) (currentByte!12040 thiss!1005) (currentBit!12035 thiss!1005)))))

(assert (=> b!255535 e!177020))

(declare-fun res!214182 () Bool)

(assert (=> b!255535 (=> (not res!214182) (not e!177020))))

(assert (=> b!255535 (= res!214182 (isPrefixOf!0 thiss!1005 (_2!11860 lt!396857)))))

(declare-fun lt!396850 () Unit!18296)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11010 BitStream!11010 BitStream!11010) Unit!18296)

(assert (=> b!255535 (= lt!396850 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11860 lt!396853) (_2!11860 lt!396857)))))

(assert (=> b!255535 e!177025))

(declare-fun res!214180 () Bool)

(assert (=> b!255535 (=> (not res!214180) (not e!177025))))

(assert (=> b!255535 (= res!214180 (= (size!6044 (buf!6561 (_2!11860 lt!396853))) (size!6044 (buf!6561 (_2!11860 lt!396857)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11010 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21852)

(assert (=> b!255535 (= lt!396857 (appendNBitsLoop!0 (_2!11860 lt!396853) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255535 (validate_offset_bits!1 ((_ sign_extend 32) (size!6044 (buf!6561 (_2!11860 lt!396853)))) ((_ sign_extend 32) (currentByte!12040 (_2!11860 lt!396853))) ((_ sign_extend 32) (currentBit!12035 (_2!11860 lt!396853))) lt!396865)))

(assert (=> b!255535 (= lt!396865 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!396870 () Unit!18296)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11010 BitStream!11010 (_ BitVec 64) (_ BitVec 64)) Unit!18296)

(assert (=> b!255535 (= lt!396870 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11860 lt!396853) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255535 e!177022))

(declare-fun res!214191 () Bool)

(assert (=> b!255535 (=> (not res!214191) (not e!177022))))

(assert (=> b!255535 (= res!214191 (= (size!6044 (buf!6561 thiss!1005)) (size!6044 (buf!6561 (_2!11860 lt!396853)))))))

(declare-fun appendBit!0 (BitStream!11010 Bool) tuple2!21852)

(assert (=> b!255535 (= lt!396853 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255536 () Bool)

(declare-fun lt!396852 () tuple2!21854)

(declare-fun lt!396858 () tuple2!21856)

(assert (=> b!255536 (= e!177024 (not (or (not (_2!11861 lt!396852)) (not (= (_1!11861 lt!396852) (_2!11862 lt!396858))))))))

(assert (=> b!255536 (= lt!396852 (checkBitsLoopPure!0 (_1!11862 lt!396858) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255536 (validate_offset_bits!1 ((_ sign_extend 32) (size!6044 (buf!6561 (_2!11860 lt!396857)))) ((_ sign_extend 32) (currentByte!12040 (_2!11860 lt!396853))) ((_ sign_extend 32) (currentBit!12035 (_2!11860 lt!396853))) lt!396862)))

(declare-fun lt!396851 () Unit!18296)

(assert (=> b!255536 (= lt!396851 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11860 lt!396853) (buf!6561 (_2!11860 lt!396857)) lt!396862))))

(assert (=> b!255536 (= lt!396858 (reader!0 (_2!11860 lt!396853) (_2!11860 lt!396857)))))

(declare-fun b!255537 () Bool)

(declare-fun res!214178 () Bool)

(assert (=> b!255537 (=> (not res!214178) (not e!177024))))

(assert (=> b!255537 (= res!214178 (isPrefixOf!0 (_2!11860 lt!396853) (_2!11860 lt!396857)))))

(declare-fun b!255528 () Bool)

(declare-fun res!214177 () Bool)

(assert (=> b!255528 (=> res!214177 e!177017)))

(declare-fun withMovedBitIndex!0 (BitStream!11010 (_ BitVec 64)) BitStream!11010)

(assert (=> b!255528 (= res!214177 (not (= (_1!11862 lt!396871) (withMovedBitIndex!0 (_1!11862 lt!396867) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!214185 () Bool)

(assert (=> start!54632 (=> (not res!214185) (not e!177016))))

(assert (=> start!54632 (= res!214185 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54632 e!177016))

(assert (=> start!54632 true))

(declare-fun inv!12 (BitStream!11010) Bool)

(assert (=> start!54632 (and (inv!12 thiss!1005) e!177021)))

(declare-fun b!255538 () Bool)

(assert (=> b!255538 (= e!177015 (= (_2!11861 lt!396868) (_2!11861 lt!396855)))))

(declare-fun b!255539 () Bool)

(assert (=> b!255539 (= e!177026 (= (bitIndex!0 (size!6044 (buf!6561 (_1!11861 lt!396856))) (currentByte!12040 (_1!11861 lt!396856)) (currentBit!12035 (_1!11861 lt!396856))) lt!396859))))

(assert (= (and start!54632 res!214185) b!255523))

(assert (= (and b!255523 res!214176) b!255525))

(assert (= (and b!255525 res!214190) b!255535))

(assert (= (and b!255535 res!214191) b!255530))

(assert (= (and b!255530 res!214184) b!255532))

(assert (= (and b!255532 res!214183) b!255533))

(assert (= (and b!255533 res!214181) b!255539))

(assert (= (and b!255535 res!214180) b!255529))

(assert (= (and b!255529 res!214179) b!255537))

(assert (= (and b!255537 res!214178) b!255536))

(assert (= (and b!255535 res!214182) b!255531))

(assert (= (and b!255531 res!214187) b!255524))

(assert (= (and b!255535 res!214189) b!255538))

(assert (= (and b!255535 (not res!214186)) b!255528))

(assert (= (and b!255528 (not res!214177)) b!255527))

(assert (= (and b!255527 (not res!214188)) b!255534))

(assert (= start!54632 b!255526))

(declare-fun m!384911 () Bool)

(assert (=> b!255529 m!384911))

(declare-fun m!384913 () Bool)

(assert (=> b!255529 m!384913))

(declare-fun m!384915 () Bool)

(assert (=> start!54632 m!384915))

(assert (=> b!255534 m!384911))

(declare-fun m!384917 () Bool)

(assert (=> b!255534 m!384917))

(assert (=> b!255530 m!384913))

(assert (=> b!255530 m!384917))

(declare-fun m!384919 () Bool)

(assert (=> b!255528 m!384919))

(declare-fun m!384921 () Bool)

(assert (=> b!255523 m!384921))

(declare-fun m!384923 () Bool)

(assert (=> b!255532 m!384923))

(declare-fun m!384925 () Bool)

(assert (=> b!255526 m!384925))

(declare-fun m!384927 () Bool)

(assert (=> b!255533 m!384927))

(assert (=> b!255533 m!384927))

(declare-fun m!384929 () Bool)

(assert (=> b!255533 m!384929))

(declare-fun m!384931 () Bool)

(assert (=> b!255531 m!384931))

(declare-fun m!384933 () Bool)

(assert (=> b!255535 m!384933))

(declare-fun m!384935 () Bool)

(assert (=> b!255535 m!384935))

(declare-fun m!384937 () Bool)

(assert (=> b!255535 m!384937))

(declare-fun m!384939 () Bool)

(assert (=> b!255535 m!384939))

(declare-fun m!384941 () Bool)

(assert (=> b!255535 m!384941))

(declare-fun m!384943 () Bool)

(assert (=> b!255535 m!384943))

(declare-fun m!384945 () Bool)

(assert (=> b!255535 m!384945))

(declare-fun m!384947 () Bool)

(assert (=> b!255535 m!384947))

(declare-fun m!384949 () Bool)

(assert (=> b!255535 m!384949))

(declare-fun m!384951 () Bool)

(assert (=> b!255535 m!384951))

(declare-fun m!384953 () Bool)

(assert (=> b!255535 m!384953))

(declare-fun m!384955 () Bool)

(assert (=> b!255535 m!384955))

(declare-fun m!384957 () Bool)

(assert (=> b!255535 m!384957))

(declare-fun m!384959 () Bool)

(assert (=> b!255535 m!384959))

(declare-fun m!384961 () Bool)

(assert (=> b!255535 m!384961))

(declare-fun m!384963 () Bool)

(assert (=> b!255535 m!384963))

(declare-fun m!384965 () Bool)

(assert (=> b!255535 m!384965))

(declare-fun m!384967 () Bool)

(assert (=> b!255535 m!384967))

(declare-fun m!384969 () Bool)

(assert (=> b!255535 m!384969))

(declare-fun m!384971 () Bool)

(assert (=> b!255535 m!384971))

(declare-fun m!384973 () Bool)

(assert (=> b!255536 m!384973))

(declare-fun m!384975 () Bool)

(assert (=> b!255536 m!384975))

(declare-fun m!384977 () Bool)

(assert (=> b!255536 m!384977))

(assert (=> b!255536 m!384953))

(declare-fun m!384979 () Bool)

(assert (=> b!255539 m!384979))

(declare-fun m!384981 () Bool)

(assert (=> b!255537 m!384981))

(declare-fun m!384983 () Bool)

(assert (=> b!255524 m!384983))

(check-sat (not start!54632) (not b!255529) (not b!255535) (not b!255537) (not b!255528) (not b!255534) (not b!255539) (not b!255531) (not b!255524) (not b!255523) (not b!255533) (not b!255526) (not b!255530) (not b!255532) (not b!255536))
