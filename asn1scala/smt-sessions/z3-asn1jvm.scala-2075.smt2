; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52612 () Bool)

(assert start!52612)

(declare-fun b!242980 () Bool)

(declare-fun e!168425 () Bool)

(declare-datatypes ((array!13324 0))(
  ( (array!13325 (arr!6827 (Array (_ BitVec 32) (_ BitVec 8))) (size!5840 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10602 0))(
  ( (BitStream!10603 (buf!6309 array!13324) (currentByte!11681 (_ BitVec 32)) (currentBit!11676 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20796 0))(
  ( (tuple2!20797 (_1!11320 BitStream!10602) (_2!11320 Bool)) )
))
(declare-fun lt!378794 () tuple2!20796)

(declare-fun lt!378791 () tuple2!20796)

(assert (=> b!242980 (= e!168425 (= (_2!11320 lt!378794) (_2!11320 lt!378791)))))

(declare-fun b!242981 () Bool)

(declare-fun e!168422 () Bool)

(declare-fun lt!378785 () tuple2!20796)

(declare-datatypes ((tuple2!20798 0))(
  ( (tuple2!20799 (_1!11321 BitStream!10602) (_2!11321 BitStream!10602)) )
))
(declare-fun lt!378788 () tuple2!20798)

(assert (=> b!242981 (= e!168422 (not (or (not (_2!11320 lt!378785)) (not (= (_1!11320 lt!378785) (_2!11321 lt!378788))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10602 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20796)

(assert (=> b!242981 (= lt!378785 (checkBitsLoopPure!0 (_1!11321 lt!378788) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!17769 0))(
  ( (Unit!17770) )
))
(declare-datatypes ((tuple2!20800 0))(
  ( (tuple2!20801 (_1!11322 Unit!17769) (_2!11322 BitStream!10602)) )
))
(declare-fun lt!378780 () tuple2!20800)

(declare-fun lt!378795 () tuple2!20800)

(declare-fun lt!378784 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242981 (validate_offset_bits!1 ((_ sign_extend 32) (size!5840 (buf!6309 (_2!11322 lt!378780)))) ((_ sign_extend 32) (currentByte!11681 (_2!11322 lt!378795))) ((_ sign_extend 32) (currentBit!11676 (_2!11322 lt!378795))) lt!378784)))

(declare-fun lt!378779 () Unit!17769)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10602 array!13324 (_ BitVec 64)) Unit!17769)

(assert (=> b!242981 (= lt!378779 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11322 lt!378795) (buf!6309 (_2!11322 lt!378780)) lt!378784))))

(declare-fun reader!0 (BitStream!10602 BitStream!10602) tuple2!20798)

(assert (=> b!242981 (= lt!378788 (reader!0 (_2!11322 lt!378795) (_2!11322 lt!378780)))))

(declare-fun b!242982 () Bool)

(declare-fun res!202959 () Bool)

(declare-fun e!168427 () Bool)

(assert (=> b!242982 (=> (not res!202959) (not e!168427))))

(declare-fun thiss!1005 () BitStream!10602)

(assert (=> b!242982 (= res!202959 (validate_offset_bits!1 ((_ sign_extend 32) (size!5840 (buf!6309 thiss!1005))) ((_ sign_extend 32) (currentByte!11681 thiss!1005)) ((_ sign_extend 32) (currentBit!11676 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242983 () Bool)

(declare-fun res!202968 () Bool)

(assert (=> b!242983 (=> (not res!202968) (not e!168427))))

(assert (=> b!242983 (= res!202968 (bvslt from!289 nBits!297))))

(declare-fun b!242984 () Bool)

(declare-fun e!168428 () Bool)

(declare-fun lt!378782 () tuple2!20796)

(declare-fun lt!378789 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242984 (= e!168428 (= (bitIndex!0 (size!5840 (buf!6309 (_1!11320 lt!378782))) (currentByte!11681 (_1!11320 lt!378782)) (currentBit!11676 (_1!11320 lt!378782))) lt!378789))))

(declare-fun b!242985 () Bool)

(declare-fun e!168429 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242985 (= e!168429 (invariant!0 (currentBit!11676 thiss!1005) (currentByte!11681 thiss!1005) (size!5840 (buf!6309 (_2!11322 lt!378780)))))))

(declare-fun b!242986 () Bool)

(declare-fun res!202964 () Bool)

(assert (=> b!242986 (=> (not res!202964) (not e!168429))))

(assert (=> b!242986 (= res!202964 (invariant!0 (currentBit!11676 thiss!1005) (currentByte!11681 thiss!1005) (size!5840 (buf!6309 (_2!11322 lt!378795)))))))

(declare-fun res!202963 () Bool)

(assert (=> start!52612 (=> (not res!202963) (not e!168427))))

(assert (=> start!52612 (= res!202963 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52612 e!168427))

(assert (=> start!52612 true))

(declare-fun e!168431 () Bool)

(declare-fun inv!12 (BitStream!10602) Bool)

(assert (=> start!52612 (and (inv!12 thiss!1005) e!168431)))

(declare-fun b!242987 () Bool)

(declare-fun res!202957 () Bool)

(declare-fun e!168424 () Bool)

(assert (=> b!242987 (=> (not res!202957) (not e!168424))))

(declare-fun isPrefixOf!0 (BitStream!10602 BitStream!10602) Bool)

(assert (=> b!242987 (= res!202957 (isPrefixOf!0 thiss!1005 (_2!11322 lt!378795)))))

(declare-fun b!242988 () Bool)

(declare-fun array_inv!5581 (array!13324) Bool)

(assert (=> b!242988 (= e!168431 (array_inv!5581 (buf!6309 thiss!1005)))))

(declare-fun b!242989 () Bool)

(declare-fun e!168423 () Bool)

(assert (=> b!242989 (= e!168423 e!168424)))

(declare-fun res!202965 () Bool)

(assert (=> b!242989 (=> (not res!202965) (not e!168424))))

(declare-fun lt!378792 () (_ BitVec 64))

(assert (=> b!242989 (= res!202965 (= lt!378789 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!378792)))))

(assert (=> b!242989 (= lt!378789 (bitIndex!0 (size!5840 (buf!6309 (_2!11322 lt!378795))) (currentByte!11681 (_2!11322 lt!378795)) (currentBit!11676 (_2!11322 lt!378795))))))

(assert (=> b!242989 (= lt!378792 (bitIndex!0 (size!5840 (buf!6309 thiss!1005)) (currentByte!11681 thiss!1005) (currentBit!11676 thiss!1005)))))

(declare-fun b!242990 () Bool)

(declare-fun res!202958 () Bool)

(assert (=> b!242990 (=> (not res!202958) (not e!168422))))

(assert (=> b!242990 (= res!202958 (isPrefixOf!0 (_2!11322 lt!378795) (_2!11322 lt!378780)))))

(declare-fun b!242991 () Bool)

(declare-fun e!168430 () Bool)

(assert (=> b!242991 (= e!168430 e!168422)))

(declare-fun res!202967 () Bool)

(assert (=> b!242991 (=> (not res!202967) (not e!168422))))

(assert (=> b!242991 (= res!202967 (= (bitIndex!0 (size!5840 (buf!6309 (_2!11322 lt!378780))) (currentByte!11681 (_2!11322 lt!378780)) (currentBit!11676 (_2!11322 lt!378780))) (bvadd (bitIndex!0 (size!5840 (buf!6309 (_2!11322 lt!378795))) (currentByte!11681 (_2!11322 lt!378795)) (currentBit!11676 (_2!11322 lt!378795))) lt!378784)))))

(assert (=> b!242991 (= lt!378784 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242992 () Bool)

(assert (=> b!242992 (= e!168424 e!168428)))

(declare-fun res!202960 () Bool)

(assert (=> b!242992 (=> (not res!202960) (not e!168428))))

(assert (=> b!242992 (= res!202960 (and (= (_2!11320 lt!378782) bit!26) (= (_1!11320 lt!378782) (_2!11322 lt!378795))))))

(declare-fun readBitPure!0 (BitStream!10602) tuple2!20796)

(declare-fun readerFrom!0 (BitStream!10602 (_ BitVec 32) (_ BitVec 32)) BitStream!10602)

(assert (=> b!242992 (= lt!378782 (readBitPure!0 (readerFrom!0 (_2!11322 lt!378795) (currentBit!11676 thiss!1005) (currentByte!11681 thiss!1005))))))

(declare-fun b!242993 () Bool)

(assert (=> b!242993 (= e!168427 (not true))))

(declare-fun lt!378786 () tuple2!20798)

(assert (=> b!242993 (= (_2!11320 (readBitPure!0 (_1!11321 lt!378786))) bit!26)))

(declare-fun lt!378790 () tuple2!20798)

(assert (=> b!242993 (= lt!378790 (reader!0 (_2!11322 lt!378795) (_2!11322 lt!378780)))))

(assert (=> b!242993 (= lt!378786 (reader!0 thiss!1005 (_2!11322 lt!378780)))))

(assert (=> b!242993 e!168425))

(declare-fun res!202962 () Bool)

(assert (=> b!242993 (=> (not res!202962) (not e!168425))))

(assert (=> b!242993 (= res!202962 (= (bitIndex!0 (size!5840 (buf!6309 (_1!11320 lt!378794))) (currentByte!11681 (_1!11320 lt!378794)) (currentBit!11676 (_1!11320 lt!378794))) (bitIndex!0 (size!5840 (buf!6309 (_1!11320 lt!378791))) (currentByte!11681 (_1!11320 lt!378791)) (currentBit!11676 (_1!11320 lt!378791)))))))

(declare-fun lt!378781 () Unit!17769)

(declare-fun lt!378793 () BitStream!10602)

(declare-fun readBitPrefixLemma!0 (BitStream!10602 BitStream!10602) Unit!17769)

(assert (=> b!242993 (= lt!378781 (readBitPrefixLemma!0 lt!378793 (_2!11322 lt!378780)))))

(assert (=> b!242993 (= lt!378791 (readBitPure!0 (BitStream!10603 (buf!6309 (_2!11322 lt!378780)) (currentByte!11681 thiss!1005) (currentBit!11676 thiss!1005))))))

(assert (=> b!242993 (= lt!378794 (readBitPure!0 lt!378793))))

(assert (=> b!242993 (= lt!378793 (BitStream!10603 (buf!6309 (_2!11322 lt!378795)) (currentByte!11681 thiss!1005) (currentBit!11676 thiss!1005)))))

(assert (=> b!242993 e!168429))

(declare-fun res!202966 () Bool)

(assert (=> b!242993 (=> (not res!202966) (not e!168429))))

(assert (=> b!242993 (= res!202966 (isPrefixOf!0 thiss!1005 (_2!11322 lt!378780)))))

(declare-fun lt!378783 () Unit!17769)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10602 BitStream!10602 BitStream!10602) Unit!17769)

(assert (=> b!242993 (= lt!378783 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11322 lt!378795) (_2!11322 lt!378780)))))

(assert (=> b!242993 e!168430))

(declare-fun res!202961 () Bool)

(assert (=> b!242993 (=> (not res!202961) (not e!168430))))

(assert (=> b!242993 (= res!202961 (= (size!5840 (buf!6309 (_2!11322 lt!378795))) (size!5840 (buf!6309 (_2!11322 lt!378780)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10602 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20800)

(assert (=> b!242993 (= lt!378780 (appendNBitsLoop!0 (_2!11322 lt!378795) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242993 (validate_offset_bits!1 ((_ sign_extend 32) (size!5840 (buf!6309 (_2!11322 lt!378795)))) ((_ sign_extend 32) (currentByte!11681 (_2!11322 lt!378795))) ((_ sign_extend 32) (currentBit!11676 (_2!11322 lt!378795))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!378787 () Unit!17769)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10602 BitStream!10602 (_ BitVec 64) (_ BitVec 64)) Unit!17769)

(assert (=> b!242993 (= lt!378787 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11322 lt!378795) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!242993 e!168423))

(declare-fun res!202956 () Bool)

(assert (=> b!242993 (=> (not res!202956) (not e!168423))))

(assert (=> b!242993 (= res!202956 (= (size!5840 (buf!6309 thiss!1005)) (size!5840 (buf!6309 (_2!11322 lt!378795)))))))

(declare-fun appendBit!0 (BitStream!10602 Bool) tuple2!20800)

(assert (=> b!242993 (= lt!378795 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!52612 res!202963) b!242982))

(assert (= (and b!242982 res!202959) b!242983))

(assert (= (and b!242983 res!202968) b!242993))

(assert (= (and b!242993 res!202956) b!242989))

(assert (= (and b!242989 res!202965) b!242987))

(assert (= (and b!242987 res!202957) b!242992))

(assert (= (and b!242992 res!202960) b!242984))

(assert (= (and b!242993 res!202961) b!242991))

(assert (= (and b!242991 res!202967) b!242990))

(assert (= (and b!242990 res!202958) b!242981))

(assert (= (and b!242993 res!202966) b!242986))

(assert (= (and b!242986 res!202964) b!242985))

(assert (= (and b!242993 res!202962) b!242980))

(assert (= start!52612 b!242988))

(declare-fun m!366113 () Bool)

(assert (=> b!242981 m!366113))

(declare-fun m!366115 () Bool)

(assert (=> b!242981 m!366115))

(declare-fun m!366117 () Bool)

(assert (=> b!242981 m!366117))

(declare-fun m!366119 () Bool)

(assert (=> b!242981 m!366119))

(declare-fun m!366121 () Bool)

(assert (=> b!242993 m!366121))

(declare-fun m!366123 () Bool)

(assert (=> b!242993 m!366123))

(declare-fun m!366125 () Bool)

(assert (=> b!242993 m!366125))

(declare-fun m!366127 () Bool)

(assert (=> b!242993 m!366127))

(declare-fun m!366129 () Bool)

(assert (=> b!242993 m!366129))

(declare-fun m!366131 () Bool)

(assert (=> b!242993 m!366131))

(declare-fun m!366133 () Bool)

(assert (=> b!242993 m!366133))

(assert (=> b!242993 m!366119))

(declare-fun m!366135 () Bool)

(assert (=> b!242993 m!366135))

(declare-fun m!366137 () Bool)

(assert (=> b!242993 m!366137))

(declare-fun m!366139 () Bool)

(assert (=> b!242993 m!366139))

(declare-fun m!366141 () Bool)

(assert (=> b!242993 m!366141))

(declare-fun m!366143 () Bool)

(assert (=> b!242993 m!366143))

(declare-fun m!366145 () Bool)

(assert (=> b!242993 m!366145))

(declare-fun m!366147 () Bool)

(assert (=> b!242986 m!366147))

(declare-fun m!366149 () Bool)

(assert (=> b!242982 m!366149))

(declare-fun m!366151 () Bool)

(assert (=> b!242990 m!366151))

(declare-fun m!366153 () Bool)

(assert (=> b!242992 m!366153))

(assert (=> b!242992 m!366153))

(declare-fun m!366155 () Bool)

(assert (=> b!242992 m!366155))

(declare-fun m!366157 () Bool)

(assert (=> b!242985 m!366157))

(declare-fun m!366159 () Bool)

(assert (=> start!52612 m!366159))

(declare-fun m!366161 () Bool)

(assert (=> b!242988 m!366161))

(declare-fun m!366163 () Bool)

(assert (=> b!242991 m!366163))

(declare-fun m!366165 () Bool)

(assert (=> b!242991 m!366165))

(declare-fun m!366167 () Bool)

(assert (=> b!242987 m!366167))

(assert (=> b!242989 m!366165))

(declare-fun m!366169 () Bool)

(assert (=> b!242989 m!366169))

(declare-fun m!366171 () Bool)

(assert (=> b!242984 m!366171))

(check-sat (not b!242981) (not b!242991) (not b!242992) (not start!52612) (not b!242982) (not b!242993) (not b!242989) (not b!242987) (not b!242986) (not b!242985) (not b!242984) (not b!242990) (not b!242988))
