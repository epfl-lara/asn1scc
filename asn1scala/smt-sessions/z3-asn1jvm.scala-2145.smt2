; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54638 () Bool)

(assert start!54638)

(declare-fun b!255676 () Bool)

(declare-fun e!177125 () Bool)

(assert (=> b!255676 (= e!177125 true)))

(declare-fun lt!397086 () (_ BitVec 64))

(declare-datatypes ((array!13785 0))(
  ( (array!13786 (arr!7034 (Array (_ BitVec 32) (_ BitVec 8))) (size!6047 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11016 0))(
  ( (BitStream!11017 (buf!6564 array!13785) (currentByte!12043 (_ BitVec 32)) (currentBit!12038 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18302 0))(
  ( (Unit!18303) )
))
(declare-datatypes ((tuple2!21870 0))(
  ( (tuple2!21871 (_1!11869 Unit!18302) (_2!11869 BitStream!11016)) )
))
(declare-fun lt!397070 () tuple2!21870)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255676 (= lt!397086 (bitIndex!0 (size!6047 (buf!6564 (_2!11869 lt!397070))) (currentByte!12043 (_2!11869 lt!397070)) (currentBit!12038 (_2!11869 lt!397070))))))

(declare-fun lt!397067 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!11016)

(assert (=> b!255676 (= lt!397067 (bitIndex!0 (size!6047 (buf!6564 thiss!1005)) (currentByte!12043 thiss!1005) (currentBit!12038 thiss!1005)))))

(declare-fun b!255678 () Bool)

(declare-fun e!177128 () Bool)

(declare-datatypes ((tuple2!21872 0))(
  ( (tuple2!21873 (_1!11870 BitStream!11016) (_2!11870 Bool)) )
))
(declare-fun lt!397078 () tuple2!21872)

(declare-datatypes ((tuple2!21874 0))(
  ( (tuple2!21875 (_1!11871 BitStream!11016) (_2!11871 BitStream!11016)) )
))
(declare-fun lt!397082 () tuple2!21874)

(assert (=> b!255678 (= e!177128 (not (or (not (_2!11870 lt!397078)) (not (= (_1!11870 lt!397078) (_2!11871 lt!397082))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!11016 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21872)

(assert (=> b!255678 (= lt!397078 (checkBitsLoopPure!0 (_1!11871 lt!397082) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397081 () tuple2!21870)

(declare-fun lt!397077 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255678 (validate_offset_bits!1 ((_ sign_extend 32) (size!6047 (buf!6564 (_2!11869 lt!397070)))) ((_ sign_extend 32) (currentByte!12043 (_2!11869 lt!397081))) ((_ sign_extend 32) (currentBit!12038 (_2!11869 lt!397081))) lt!397077)))

(declare-fun lt!397071 () Unit!18302)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11016 array!13785 (_ BitVec 64)) Unit!18302)

(assert (=> b!255678 (= lt!397071 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11869 lt!397081) (buf!6564 (_2!11869 lt!397070)) lt!397077))))

(declare-fun reader!0 (BitStream!11016 BitStream!11016) tuple2!21874)

(assert (=> b!255678 (= lt!397082 (reader!0 (_2!11869 lt!397081) (_2!11869 lt!397070)))))

(declare-fun b!255679 () Bool)

(declare-fun e!177130 () Bool)

(declare-fun array_inv!5788 (array!13785) Bool)

(assert (=> b!255679 (= e!177130 (array_inv!5788 (buf!6564 thiss!1005)))))

(declare-fun b!255680 () Bool)

(declare-fun e!177132 () Bool)

(assert (=> b!255680 (= e!177132 e!177128)))

(declare-fun res!214326 () Bool)

(assert (=> b!255680 (=> (not res!214326) (not e!177128))))

(assert (=> b!255680 (= res!214326 (= (bitIndex!0 (size!6047 (buf!6564 (_2!11869 lt!397070))) (currentByte!12043 (_2!11869 lt!397070)) (currentBit!12038 (_2!11869 lt!397070))) (bvadd (bitIndex!0 (size!6047 (buf!6564 (_2!11869 lt!397081))) (currentByte!12043 (_2!11869 lt!397081)) (currentBit!12038 (_2!11869 lt!397081))) lt!397077)))))

(assert (=> b!255680 (= lt!397077 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255681 () Bool)

(declare-fun res!214330 () Bool)

(declare-fun e!177129 () Bool)

(assert (=> b!255681 (=> (not res!214330) (not e!177129))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255681 (= res!214330 (invariant!0 (currentBit!12038 thiss!1005) (currentByte!12043 thiss!1005) (size!6047 (buf!6564 (_2!11869 lt!397081)))))))

(declare-fun b!255677 () Bool)

(declare-fun res!214324 () Bool)

(declare-fun e!177126 () Bool)

(assert (=> b!255677 (=> (not res!214324) (not e!177126))))

(declare-fun isPrefixOf!0 (BitStream!11016 BitStream!11016) Bool)

(assert (=> b!255677 (= res!214324 (isPrefixOf!0 thiss!1005 (_2!11869 lt!397081)))))

(declare-fun res!214329 () Bool)

(declare-fun e!177127 () Bool)

(assert (=> start!54638 (=> (not res!214329) (not e!177127))))

(assert (=> start!54638 (= res!214329 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54638 e!177127))

(assert (=> start!54638 true))

(declare-fun inv!12 (BitStream!11016) Bool)

(assert (=> start!54638 (and (inv!12 thiss!1005) e!177130)))

(declare-fun b!255682 () Bool)

(declare-fun e!177123 () Bool)

(declare-fun lt!397075 () tuple2!21872)

(declare-fun lt!397072 () (_ BitVec 64))

(assert (=> b!255682 (= e!177123 (= (bitIndex!0 (size!6047 (buf!6564 (_1!11870 lt!397075))) (currentByte!12043 (_1!11870 lt!397075)) (currentBit!12038 (_1!11870 lt!397075))) lt!397072))))

(declare-fun b!255683 () Bool)

(declare-fun e!177134 () Bool)

(assert (=> b!255683 (= e!177134 e!177126)))

(declare-fun res!214321 () Bool)

(assert (=> b!255683 (=> (not res!214321) (not e!177126))))

(declare-fun lt!397069 () (_ BitVec 64))

(assert (=> b!255683 (= res!214321 (= lt!397072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!397069)))))

(assert (=> b!255683 (= lt!397072 (bitIndex!0 (size!6047 (buf!6564 (_2!11869 lt!397081))) (currentByte!12043 (_2!11869 lt!397081)) (currentBit!12038 (_2!11869 lt!397081))))))

(assert (=> b!255683 (= lt!397069 (bitIndex!0 (size!6047 (buf!6564 thiss!1005)) (currentByte!12043 thiss!1005) (currentBit!12038 thiss!1005)))))

(declare-fun b!255684 () Bool)

(declare-fun res!214322 () Bool)

(assert (=> b!255684 (=> (not res!214322) (not e!177128))))

(assert (=> b!255684 (= res!214322 (isPrefixOf!0 (_2!11869 lt!397081) (_2!11869 lt!397070)))))

(declare-fun b!255685 () Bool)

(declare-fun res!214333 () Bool)

(assert (=> b!255685 (=> (not res!214333) (not e!177127))))

(assert (=> b!255685 (= res!214333 (validate_offset_bits!1 ((_ sign_extend 32) (size!6047 (buf!6564 thiss!1005))) ((_ sign_extend 32) (currentByte!12043 thiss!1005)) ((_ sign_extend 32) (currentBit!12038 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255686 () Bool)

(declare-fun res!214327 () Bool)

(assert (=> b!255686 (=> (not res!214327) (not e!177127))))

(assert (=> b!255686 (= res!214327 (bvslt from!289 nBits!297))))

(declare-fun b!255687 () Bool)

(declare-fun res!214328 () Bool)

(declare-fun e!177131 () Bool)

(assert (=> b!255687 (=> res!214328 e!177131)))

(declare-fun lt!397066 () tuple2!21874)

(declare-fun lt!397076 () tuple2!21874)

(declare-fun withMovedBitIndex!0 (BitStream!11016 (_ BitVec 64)) BitStream!11016)

(assert (=> b!255687 (= res!214328 (not (= (_1!11871 lt!397066) (withMovedBitIndex!0 (_1!11871 lt!397076) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255688 () Bool)

(assert (=> b!255688 (= e!177126 e!177123)))

(declare-fun res!214335 () Bool)

(assert (=> b!255688 (=> (not res!214335) (not e!177123))))

(assert (=> b!255688 (= res!214335 (and (= (_2!11870 lt!397075) bit!26) (= (_1!11870 lt!397075) (_2!11869 lt!397081))))))

(declare-fun readBitPure!0 (BitStream!11016) tuple2!21872)

(declare-fun readerFrom!0 (BitStream!11016 (_ BitVec 32) (_ BitVec 32)) BitStream!11016)

(assert (=> b!255688 (= lt!397075 (readBitPure!0 (readerFrom!0 (_2!11869 lt!397081) (currentBit!12038 thiss!1005) (currentByte!12043 thiss!1005))))))

(declare-fun b!255689 () Bool)

(assert (=> b!255689 (= e!177127 (not e!177131))))

(declare-fun res!214331 () Bool)

(assert (=> b!255689 (=> res!214331 e!177131)))

(declare-fun lt!397084 () tuple2!21872)

(assert (=> b!255689 (= res!214331 (not (= (_1!11870 lt!397084) (_2!11871 lt!397066))))))

(assert (=> b!255689 (= lt!397084 (checkBitsLoopPure!0 (_1!11871 lt!397066) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397074 () (_ BitVec 64))

(assert (=> b!255689 (validate_offset_bits!1 ((_ sign_extend 32) (size!6047 (buf!6564 (_2!11869 lt!397070)))) ((_ sign_extend 32) (currentByte!12043 (_2!11869 lt!397081))) ((_ sign_extend 32) (currentBit!12038 (_2!11869 lt!397081))) lt!397074)))

(declare-fun lt!397087 () Unit!18302)

(assert (=> b!255689 (= lt!397087 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11869 lt!397081) (buf!6564 (_2!11869 lt!397070)) lt!397074))))

(declare-fun lt!397088 () tuple2!21872)

(assert (=> b!255689 (= lt!397088 (checkBitsLoopPure!0 (_1!11871 lt!397076) nBits!297 bit!26 from!289))))

(assert (=> b!255689 (validate_offset_bits!1 ((_ sign_extend 32) (size!6047 (buf!6564 (_2!11869 lt!397070)))) ((_ sign_extend 32) (currentByte!12043 thiss!1005)) ((_ sign_extend 32) (currentBit!12038 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397073 () Unit!18302)

(assert (=> b!255689 (= lt!397073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6564 (_2!11869 lt!397070)) (bvsub nBits!297 from!289)))))

(assert (=> b!255689 (= (_2!11870 (readBitPure!0 (_1!11871 lt!397076))) bit!26)))

(assert (=> b!255689 (= lt!397066 (reader!0 (_2!11869 lt!397081) (_2!11869 lt!397070)))))

(assert (=> b!255689 (= lt!397076 (reader!0 thiss!1005 (_2!11869 lt!397070)))))

(declare-fun e!177133 () Bool)

(assert (=> b!255689 e!177133))

(declare-fun res!214320 () Bool)

(assert (=> b!255689 (=> (not res!214320) (not e!177133))))

(declare-fun lt!397085 () tuple2!21872)

(declare-fun lt!397083 () tuple2!21872)

(assert (=> b!255689 (= res!214320 (= (bitIndex!0 (size!6047 (buf!6564 (_1!11870 lt!397085))) (currentByte!12043 (_1!11870 lt!397085)) (currentBit!12038 (_1!11870 lt!397085))) (bitIndex!0 (size!6047 (buf!6564 (_1!11870 lt!397083))) (currentByte!12043 (_1!11870 lt!397083)) (currentBit!12038 (_1!11870 lt!397083)))))))

(declare-fun lt!397080 () Unit!18302)

(declare-fun lt!397079 () BitStream!11016)

(declare-fun readBitPrefixLemma!0 (BitStream!11016 BitStream!11016) Unit!18302)

(assert (=> b!255689 (= lt!397080 (readBitPrefixLemma!0 lt!397079 (_2!11869 lt!397070)))))

(assert (=> b!255689 (= lt!397083 (readBitPure!0 (BitStream!11017 (buf!6564 (_2!11869 lt!397070)) (currentByte!12043 thiss!1005) (currentBit!12038 thiss!1005))))))

(assert (=> b!255689 (= lt!397085 (readBitPure!0 lt!397079))))

(assert (=> b!255689 (= lt!397079 (BitStream!11017 (buf!6564 (_2!11869 lt!397081)) (currentByte!12043 thiss!1005) (currentBit!12038 thiss!1005)))))

(assert (=> b!255689 e!177129))

(declare-fun res!214334 () Bool)

(assert (=> b!255689 (=> (not res!214334) (not e!177129))))

(assert (=> b!255689 (= res!214334 (isPrefixOf!0 thiss!1005 (_2!11869 lt!397070)))))

(declare-fun lt!397068 () Unit!18302)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11016 BitStream!11016 BitStream!11016) Unit!18302)

(assert (=> b!255689 (= lt!397068 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11869 lt!397081) (_2!11869 lt!397070)))))

(assert (=> b!255689 e!177132))

(declare-fun res!214323 () Bool)

(assert (=> b!255689 (=> (not res!214323) (not e!177132))))

(assert (=> b!255689 (= res!214323 (= (size!6047 (buf!6564 (_2!11869 lt!397081))) (size!6047 (buf!6564 (_2!11869 lt!397070)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11016 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21870)

(assert (=> b!255689 (= lt!397070 (appendNBitsLoop!0 (_2!11869 lt!397081) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255689 (validate_offset_bits!1 ((_ sign_extend 32) (size!6047 (buf!6564 (_2!11869 lt!397081)))) ((_ sign_extend 32) (currentByte!12043 (_2!11869 lt!397081))) ((_ sign_extend 32) (currentBit!12038 (_2!11869 lt!397081))) lt!397074)))

(assert (=> b!255689 (= lt!397074 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!397089 () Unit!18302)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11016 BitStream!11016 (_ BitVec 64) (_ BitVec 64)) Unit!18302)

(assert (=> b!255689 (= lt!397089 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11869 lt!397081) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255689 e!177134))

(declare-fun res!214325 () Bool)

(assert (=> b!255689 (=> (not res!214325) (not e!177134))))

(assert (=> b!255689 (= res!214325 (= (size!6047 (buf!6564 thiss!1005)) (size!6047 (buf!6564 (_2!11869 lt!397081)))))))

(declare-fun appendBit!0 (BitStream!11016 Bool) tuple2!21870)

(assert (=> b!255689 (= lt!397081 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255690 () Bool)

(assert (=> b!255690 (= e!177133 (= (_2!11870 lt!397085) (_2!11870 lt!397083)))))

(declare-fun b!255691 () Bool)

(assert (=> b!255691 (= e!177129 (invariant!0 (currentBit!12038 thiss!1005) (currentByte!12043 thiss!1005) (size!6047 (buf!6564 (_2!11869 lt!397070)))))))

(declare-fun b!255692 () Bool)

(assert (=> b!255692 (= e!177131 e!177125)))

(declare-fun res!214332 () Bool)

(assert (=> b!255692 (=> res!214332 e!177125)))

(assert (=> b!255692 (= res!214332 (not (= (size!6047 (buf!6564 thiss!1005)) (size!6047 (buf!6564 (_2!11869 lt!397070))))))))

(assert (=> b!255692 (and (= (_2!11870 lt!397088) (_2!11870 lt!397084)) (= (_1!11870 lt!397088) (_2!11871 lt!397076)))))

(assert (= (and start!54638 res!214329) b!255685))

(assert (= (and b!255685 res!214333) b!255686))

(assert (= (and b!255686 res!214327) b!255689))

(assert (= (and b!255689 res!214325) b!255683))

(assert (= (and b!255683 res!214321) b!255677))

(assert (= (and b!255677 res!214324) b!255688))

(assert (= (and b!255688 res!214335) b!255682))

(assert (= (and b!255689 res!214323) b!255680))

(assert (= (and b!255680 res!214326) b!255684))

(assert (= (and b!255684 res!214322) b!255678))

(assert (= (and b!255689 res!214334) b!255681))

(assert (= (and b!255681 res!214330) b!255691))

(assert (= (and b!255689 res!214320) b!255690))

(assert (= (and b!255689 (not res!214331)) b!255687))

(assert (= (and b!255687 (not res!214328)) b!255692))

(assert (= (and b!255692 (not res!214332)) b!255676))

(assert (= start!54638 b!255679))

(declare-fun m!385133 () Bool)

(assert (=> b!255683 m!385133))

(declare-fun m!385135 () Bool)

(assert (=> b!255683 m!385135))

(declare-fun m!385137 () Bool)

(assert (=> b!255676 m!385137))

(assert (=> b!255676 m!385135))

(assert (=> b!255680 m!385137))

(assert (=> b!255680 m!385133))

(declare-fun m!385139 () Bool)

(assert (=> b!255681 m!385139))

(declare-fun m!385141 () Bool)

(assert (=> b!255689 m!385141))

(declare-fun m!385143 () Bool)

(assert (=> b!255689 m!385143))

(declare-fun m!385145 () Bool)

(assert (=> b!255689 m!385145))

(declare-fun m!385147 () Bool)

(assert (=> b!255689 m!385147))

(declare-fun m!385149 () Bool)

(assert (=> b!255689 m!385149))

(declare-fun m!385151 () Bool)

(assert (=> b!255689 m!385151))

(declare-fun m!385153 () Bool)

(assert (=> b!255689 m!385153))

(declare-fun m!385155 () Bool)

(assert (=> b!255689 m!385155))

(declare-fun m!385157 () Bool)

(assert (=> b!255689 m!385157))

(declare-fun m!385159 () Bool)

(assert (=> b!255689 m!385159))

(declare-fun m!385161 () Bool)

(assert (=> b!255689 m!385161))

(declare-fun m!385163 () Bool)

(assert (=> b!255689 m!385163))

(declare-fun m!385165 () Bool)

(assert (=> b!255689 m!385165))

(declare-fun m!385167 () Bool)

(assert (=> b!255689 m!385167))

(declare-fun m!385169 () Bool)

(assert (=> b!255689 m!385169))

(declare-fun m!385171 () Bool)

(assert (=> b!255689 m!385171))

(declare-fun m!385173 () Bool)

(assert (=> b!255689 m!385173))

(declare-fun m!385175 () Bool)

(assert (=> b!255689 m!385175))

(declare-fun m!385177 () Bool)

(assert (=> b!255689 m!385177))

(declare-fun m!385179 () Bool)

(assert (=> b!255689 m!385179))

(declare-fun m!385181 () Bool)

(assert (=> b!255684 m!385181))

(declare-fun m!385183 () Bool)

(assert (=> b!255678 m!385183))

(declare-fun m!385185 () Bool)

(assert (=> b!255678 m!385185))

(declare-fun m!385187 () Bool)

(assert (=> b!255678 m!385187))

(assert (=> b!255678 m!385179))

(declare-fun m!385189 () Bool)

(assert (=> b!255685 m!385189))

(declare-fun m!385191 () Bool)

(assert (=> b!255679 m!385191))

(declare-fun m!385193 () Bool)

(assert (=> b!255687 m!385193))

(declare-fun m!385195 () Bool)

(assert (=> start!54638 m!385195))

(declare-fun m!385197 () Bool)

(assert (=> b!255688 m!385197))

(assert (=> b!255688 m!385197))

(declare-fun m!385199 () Bool)

(assert (=> b!255688 m!385199))

(declare-fun m!385201 () Bool)

(assert (=> b!255677 m!385201))

(declare-fun m!385203 () Bool)

(assert (=> b!255682 m!385203))

(declare-fun m!385205 () Bool)

(assert (=> b!255691 m!385205))

(check-sat (not start!54638) (not b!255676) (not b!255679) (not b!255687) (not b!255689) (not b!255681) (not b!255691) (not b!255678) (not b!255685) (not b!255677) (not b!255688) (not b!255680) (not b!255683) (not b!255684) (not b!255682))
