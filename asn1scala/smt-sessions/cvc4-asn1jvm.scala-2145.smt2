; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54640 () Bool)

(assert start!54640)

(declare-fun b!255727 () Bool)

(declare-fun e!177163 () Bool)

(declare-fun e!177164 () Bool)

(assert (=> b!255727 (= e!177163 e!177164)))

(declare-fun res!214371 () Bool)

(assert (=> b!255727 (=> (not res!214371) (not e!177164))))

(declare-datatypes ((array!13787 0))(
  ( (array!13788 (arr!7035 (Array (_ BitVec 32) (_ BitVec 8))) (size!6048 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11018 0))(
  ( (BitStream!11019 (buf!6565 array!13787) (currentByte!12044 (_ BitVec 32)) (currentBit!12039 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18304 0))(
  ( (Unit!18305) )
))
(declare-datatypes ((tuple2!21876 0))(
  ( (tuple2!21877 (_1!11872 Unit!18304) (_2!11872 BitStream!11018)) )
))
(declare-fun lt!397161 () tuple2!21876)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21878 0))(
  ( (tuple2!21879 (_1!11873 BitStream!11018) (_2!11873 Bool)) )
))
(declare-fun lt!397138 () tuple2!21878)

(assert (=> b!255727 (= res!214371 (and (= (_2!11873 lt!397138) bit!26) (= (_1!11873 lt!397138) (_2!11872 lt!397161))))))

(declare-fun thiss!1005 () BitStream!11018)

(declare-fun readBitPure!0 (BitStream!11018) tuple2!21878)

(declare-fun readerFrom!0 (BitStream!11018 (_ BitVec 32) (_ BitVec 32)) BitStream!11018)

(assert (=> b!255727 (= lt!397138 (readBitPure!0 (readerFrom!0 (_2!11872 lt!397161) (currentBit!12039 thiss!1005) (currentByte!12044 thiss!1005))))))

(declare-fun b!255728 () Bool)

(declare-fun res!214370 () Bool)

(assert (=> b!255728 (=> (not res!214370) (not e!177163))))

(declare-fun isPrefixOf!0 (BitStream!11018 BitStream!11018) Bool)

(assert (=> b!255728 (= res!214370 (isPrefixOf!0 thiss!1005 (_2!11872 lt!397161)))))

(declare-fun b!255729 () Bool)

(declare-fun res!214381 () Bool)

(declare-fun e!177167 () Bool)

(assert (=> b!255729 (=> (not res!214381) (not e!177167))))

(declare-fun lt!397146 () tuple2!21876)

(assert (=> b!255729 (= res!214381 (isPrefixOf!0 (_2!11872 lt!397161) (_2!11872 lt!397146)))))

(declare-fun b!255730 () Bool)

(declare-fun e!177162 () Bool)

(declare-fun e!177160 () Bool)

(assert (=> b!255730 (= e!177162 e!177160)))

(declare-fun res!214368 () Bool)

(assert (=> b!255730 (=> res!214368 e!177160)))

(assert (=> b!255730 (= res!214368 (not (= (size!6048 (buf!6565 thiss!1005)) (size!6048 (buf!6565 (_2!11872 lt!397146))))))))

(declare-fun lt!397143 () tuple2!21878)

(declare-fun lt!397142 () tuple2!21878)

(declare-datatypes ((tuple2!21880 0))(
  ( (tuple2!21881 (_1!11874 BitStream!11018) (_2!11874 BitStream!11018)) )
))
(declare-fun lt!397156 () tuple2!21880)

(assert (=> b!255730 (and (= (_2!11873 lt!397143) (_2!11873 lt!397142)) (= (_1!11873 lt!397143) (_2!11874 lt!397156)))))

(declare-fun res!214379 () Bool)

(declare-fun e!177165 () Bool)

(assert (=> start!54640 (=> (not res!214379) (not e!177165))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!54640 (= res!214379 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54640 e!177165))

(assert (=> start!54640 true))

(declare-fun e!177159 () Bool)

(declare-fun inv!12 (BitStream!11018) Bool)

(assert (=> start!54640 (and (inv!12 thiss!1005) e!177159)))

(declare-fun b!255731 () Bool)

(declare-fun e!177166 () Bool)

(assert (=> b!255731 (= e!177166 e!177163)))

(declare-fun res!214375 () Bool)

(assert (=> b!255731 (=> (not res!214375) (not e!177163))))

(declare-fun lt!397148 () (_ BitVec 64))

(declare-fun lt!397141 () (_ BitVec 64))

(assert (=> b!255731 (= res!214375 (= lt!397148 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!397141)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255731 (= lt!397148 (bitIndex!0 (size!6048 (buf!6565 (_2!11872 lt!397161))) (currentByte!12044 (_2!11872 lt!397161)) (currentBit!12039 (_2!11872 lt!397161))))))

(assert (=> b!255731 (= lt!397141 (bitIndex!0 (size!6048 (buf!6565 thiss!1005)) (currentByte!12044 thiss!1005) (currentBit!12039 thiss!1005)))))

(declare-fun b!255732 () Bool)

(declare-fun res!214377 () Bool)

(assert (=> b!255732 (=> res!214377 e!177162)))

(declare-fun lt!397140 () tuple2!21880)

(declare-fun withMovedBitIndex!0 (BitStream!11018 (_ BitVec 64)) BitStream!11018)

(assert (=> b!255732 (= res!214377 (not (= (_1!11874 lt!397140) (withMovedBitIndex!0 (_1!11874 lt!397156) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255733 () Bool)

(assert (=> b!255733 (= e!177160 true)))

(declare-fun lt!397145 () (_ BitVec 64))

(assert (=> b!255733 (= lt!397145 (bitIndex!0 (size!6048 (buf!6565 (_2!11872 lt!397146))) (currentByte!12044 (_2!11872 lt!397146)) (currentBit!12039 (_2!11872 lt!397146))))))

(declare-fun lt!397144 () (_ BitVec 64))

(assert (=> b!255733 (= lt!397144 (bitIndex!0 (size!6048 (buf!6565 thiss!1005)) (currentByte!12044 thiss!1005) (currentBit!12039 thiss!1005)))))

(declare-fun b!255734 () Bool)

(declare-fun res!214374 () Bool)

(assert (=> b!255734 (=> (not res!214374) (not e!177165))))

(assert (=> b!255734 (= res!214374 (bvslt from!289 nBits!297))))

(declare-fun b!255735 () Bool)

(declare-fun e!177168 () Bool)

(declare-fun lt!397149 () tuple2!21878)

(declare-fun lt!397160 () tuple2!21878)

(assert (=> b!255735 (= e!177168 (= (_2!11873 lt!397149) (_2!11873 lt!397160)))))

(declare-fun b!255736 () Bool)

(assert (=> b!255736 (= e!177165 (not e!177162))))

(declare-fun res!214372 () Bool)

(assert (=> b!255736 (=> res!214372 e!177162)))

(assert (=> b!255736 (= res!214372 (not (= (_1!11873 lt!397142) (_2!11874 lt!397140))))))

(declare-fun checkBitsLoopPure!0 (BitStream!11018 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21878)

(assert (=> b!255736 (= lt!397142 (checkBitsLoopPure!0 (_1!11874 lt!397140) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397159 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255736 (validate_offset_bits!1 ((_ sign_extend 32) (size!6048 (buf!6565 (_2!11872 lt!397146)))) ((_ sign_extend 32) (currentByte!12044 (_2!11872 lt!397161))) ((_ sign_extend 32) (currentBit!12039 (_2!11872 lt!397161))) lt!397159)))

(declare-fun lt!397147 () Unit!18304)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11018 array!13787 (_ BitVec 64)) Unit!18304)

(assert (=> b!255736 (= lt!397147 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11872 lt!397161) (buf!6565 (_2!11872 lt!397146)) lt!397159))))

(assert (=> b!255736 (= lt!397143 (checkBitsLoopPure!0 (_1!11874 lt!397156) nBits!297 bit!26 from!289))))

(assert (=> b!255736 (validate_offset_bits!1 ((_ sign_extend 32) (size!6048 (buf!6565 (_2!11872 lt!397146)))) ((_ sign_extend 32) (currentByte!12044 thiss!1005)) ((_ sign_extend 32) (currentBit!12039 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397158 () Unit!18304)

(assert (=> b!255736 (= lt!397158 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6565 (_2!11872 lt!397146)) (bvsub nBits!297 from!289)))))

(assert (=> b!255736 (= (_2!11873 (readBitPure!0 (_1!11874 lt!397156))) bit!26)))

(declare-fun reader!0 (BitStream!11018 BitStream!11018) tuple2!21880)

(assert (=> b!255736 (= lt!397140 (reader!0 (_2!11872 lt!397161) (_2!11872 lt!397146)))))

(assert (=> b!255736 (= lt!397156 (reader!0 thiss!1005 (_2!11872 lt!397146)))))

(assert (=> b!255736 e!177168))

(declare-fun res!214376 () Bool)

(assert (=> b!255736 (=> (not res!214376) (not e!177168))))

(assert (=> b!255736 (= res!214376 (= (bitIndex!0 (size!6048 (buf!6565 (_1!11873 lt!397149))) (currentByte!12044 (_1!11873 lt!397149)) (currentBit!12039 (_1!11873 lt!397149))) (bitIndex!0 (size!6048 (buf!6565 (_1!11873 lt!397160))) (currentByte!12044 (_1!11873 lt!397160)) (currentBit!12039 (_1!11873 lt!397160)))))))

(declare-fun lt!397151 () Unit!18304)

(declare-fun lt!397154 () BitStream!11018)

(declare-fun readBitPrefixLemma!0 (BitStream!11018 BitStream!11018) Unit!18304)

(assert (=> b!255736 (= lt!397151 (readBitPrefixLemma!0 lt!397154 (_2!11872 lt!397146)))))

(assert (=> b!255736 (= lt!397160 (readBitPure!0 (BitStream!11019 (buf!6565 (_2!11872 lt!397146)) (currentByte!12044 thiss!1005) (currentBit!12039 thiss!1005))))))

(assert (=> b!255736 (= lt!397149 (readBitPure!0 lt!397154))))

(assert (=> b!255736 (= lt!397154 (BitStream!11019 (buf!6565 (_2!11872 lt!397161)) (currentByte!12044 thiss!1005) (currentBit!12039 thiss!1005)))))

(declare-fun e!177169 () Bool)

(assert (=> b!255736 e!177169))

(declare-fun res!214373 () Bool)

(assert (=> b!255736 (=> (not res!214373) (not e!177169))))

(assert (=> b!255736 (= res!214373 (isPrefixOf!0 thiss!1005 (_2!11872 lt!397146)))))

(declare-fun lt!397150 () Unit!18304)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11018 BitStream!11018 BitStream!11018) Unit!18304)

(assert (=> b!255736 (= lt!397150 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11872 lt!397161) (_2!11872 lt!397146)))))

(declare-fun e!177170 () Bool)

(assert (=> b!255736 e!177170))

(declare-fun res!214382 () Bool)

(assert (=> b!255736 (=> (not res!214382) (not e!177170))))

(assert (=> b!255736 (= res!214382 (= (size!6048 (buf!6565 (_2!11872 lt!397161))) (size!6048 (buf!6565 (_2!11872 lt!397146)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11018 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21876)

(assert (=> b!255736 (= lt!397146 (appendNBitsLoop!0 (_2!11872 lt!397161) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255736 (validate_offset_bits!1 ((_ sign_extend 32) (size!6048 (buf!6565 (_2!11872 lt!397161)))) ((_ sign_extend 32) (currentByte!12044 (_2!11872 lt!397161))) ((_ sign_extend 32) (currentBit!12039 (_2!11872 lt!397161))) lt!397159)))

(assert (=> b!255736 (= lt!397159 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!397152 () Unit!18304)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11018 BitStream!11018 (_ BitVec 64) (_ BitVec 64)) Unit!18304)

(assert (=> b!255736 (= lt!397152 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11872 lt!397161) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255736 e!177166))

(declare-fun res!214383 () Bool)

(assert (=> b!255736 (=> (not res!214383) (not e!177166))))

(assert (=> b!255736 (= res!214383 (= (size!6048 (buf!6565 thiss!1005)) (size!6048 (buf!6565 (_2!11872 lt!397161)))))))

(declare-fun appendBit!0 (BitStream!11018 Bool) tuple2!21876)

(assert (=> b!255736 (= lt!397161 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255737 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255737 (= e!177169 (invariant!0 (currentBit!12039 thiss!1005) (currentByte!12044 thiss!1005) (size!6048 (buf!6565 (_2!11872 lt!397146)))))))

(declare-fun b!255738 () Bool)

(assert (=> b!255738 (= e!177170 e!177167)))

(declare-fun res!214378 () Bool)

(assert (=> b!255738 (=> (not res!214378) (not e!177167))))

(declare-fun lt!397153 () (_ BitVec 64))

(assert (=> b!255738 (= res!214378 (= (bitIndex!0 (size!6048 (buf!6565 (_2!11872 lt!397146))) (currentByte!12044 (_2!11872 lt!397146)) (currentBit!12039 (_2!11872 lt!397146))) (bvadd (bitIndex!0 (size!6048 (buf!6565 (_2!11872 lt!397161))) (currentByte!12044 (_2!11872 lt!397161)) (currentBit!12039 (_2!11872 lt!397161))) lt!397153)))))

(assert (=> b!255738 (= lt!397153 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255739 () Bool)

(declare-fun array_inv!5789 (array!13787) Bool)

(assert (=> b!255739 (= e!177159 (array_inv!5789 (buf!6565 thiss!1005)))))

(declare-fun b!255740 () Bool)

(declare-fun res!214380 () Bool)

(assert (=> b!255740 (=> (not res!214380) (not e!177165))))

(assert (=> b!255740 (= res!214380 (validate_offset_bits!1 ((_ sign_extend 32) (size!6048 (buf!6565 thiss!1005))) ((_ sign_extend 32) (currentByte!12044 thiss!1005)) ((_ sign_extend 32) (currentBit!12039 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255741 () Bool)

(assert (=> b!255741 (= e!177164 (= (bitIndex!0 (size!6048 (buf!6565 (_1!11873 lt!397138))) (currentByte!12044 (_1!11873 lt!397138)) (currentBit!12039 (_1!11873 lt!397138))) lt!397148))))

(declare-fun b!255742 () Bool)

(declare-fun lt!397155 () tuple2!21878)

(declare-fun lt!397157 () tuple2!21880)

(assert (=> b!255742 (= e!177167 (not (or (not (_2!11873 lt!397155)) (not (= (_1!11873 lt!397155) (_2!11874 lt!397157))))))))

(assert (=> b!255742 (= lt!397155 (checkBitsLoopPure!0 (_1!11874 lt!397157) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255742 (validate_offset_bits!1 ((_ sign_extend 32) (size!6048 (buf!6565 (_2!11872 lt!397146)))) ((_ sign_extend 32) (currentByte!12044 (_2!11872 lt!397161))) ((_ sign_extend 32) (currentBit!12039 (_2!11872 lt!397161))) lt!397153)))

(declare-fun lt!397139 () Unit!18304)

(assert (=> b!255742 (= lt!397139 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11872 lt!397161) (buf!6565 (_2!11872 lt!397146)) lt!397153))))

(assert (=> b!255742 (= lt!397157 (reader!0 (_2!11872 lt!397161) (_2!11872 lt!397146)))))

(declare-fun b!255743 () Bool)

(declare-fun res!214369 () Bool)

(assert (=> b!255743 (=> (not res!214369) (not e!177169))))

(assert (=> b!255743 (= res!214369 (invariant!0 (currentBit!12039 thiss!1005) (currentByte!12044 thiss!1005) (size!6048 (buf!6565 (_2!11872 lt!397161)))))))

(assert (= (and start!54640 res!214379) b!255740))

(assert (= (and b!255740 res!214380) b!255734))

(assert (= (and b!255734 res!214374) b!255736))

(assert (= (and b!255736 res!214383) b!255731))

(assert (= (and b!255731 res!214375) b!255728))

(assert (= (and b!255728 res!214370) b!255727))

(assert (= (and b!255727 res!214371) b!255741))

(assert (= (and b!255736 res!214382) b!255738))

(assert (= (and b!255738 res!214378) b!255729))

(assert (= (and b!255729 res!214381) b!255742))

(assert (= (and b!255736 res!214373) b!255743))

(assert (= (and b!255743 res!214369) b!255737))

(assert (= (and b!255736 res!214376) b!255735))

(assert (= (and b!255736 (not res!214372)) b!255732))

(assert (= (and b!255732 (not res!214377)) b!255730))

(assert (= (and b!255730 (not res!214368)) b!255733))

(assert (= start!54640 b!255739))

(declare-fun m!385207 () Bool)

(assert (=> b!255727 m!385207))

(assert (=> b!255727 m!385207))

(declare-fun m!385209 () Bool)

(assert (=> b!255727 m!385209))

(declare-fun m!385211 () Bool)

(assert (=> b!255729 m!385211))

(declare-fun m!385213 () Bool)

(assert (=> b!255738 m!385213))

(declare-fun m!385215 () Bool)

(assert (=> b!255738 m!385215))

(declare-fun m!385217 () Bool)

(assert (=> b!255736 m!385217))

(declare-fun m!385219 () Bool)

(assert (=> b!255736 m!385219))

(declare-fun m!385221 () Bool)

(assert (=> b!255736 m!385221))

(declare-fun m!385223 () Bool)

(assert (=> b!255736 m!385223))

(declare-fun m!385225 () Bool)

(assert (=> b!255736 m!385225))

(declare-fun m!385227 () Bool)

(assert (=> b!255736 m!385227))

(declare-fun m!385229 () Bool)

(assert (=> b!255736 m!385229))

(declare-fun m!385231 () Bool)

(assert (=> b!255736 m!385231))

(declare-fun m!385233 () Bool)

(assert (=> b!255736 m!385233))

(declare-fun m!385235 () Bool)

(assert (=> b!255736 m!385235))

(declare-fun m!385237 () Bool)

(assert (=> b!255736 m!385237))

(declare-fun m!385239 () Bool)

(assert (=> b!255736 m!385239))

(declare-fun m!385241 () Bool)

(assert (=> b!255736 m!385241))

(declare-fun m!385243 () Bool)

(assert (=> b!255736 m!385243))

(declare-fun m!385245 () Bool)

(assert (=> b!255736 m!385245))

(declare-fun m!385247 () Bool)

(assert (=> b!255736 m!385247))

(declare-fun m!385249 () Bool)

(assert (=> b!255736 m!385249))

(declare-fun m!385251 () Bool)

(assert (=> b!255736 m!385251))

(declare-fun m!385253 () Bool)

(assert (=> b!255736 m!385253))

(declare-fun m!385255 () Bool)

(assert (=> b!255736 m!385255))

(declare-fun m!385257 () Bool)

(assert (=> b!255739 m!385257))

(declare-fun m!385259 () Bool)

(assert (=> b!255737 m!385259))

(assert (=> b!255733 m!385213))

(declare-fun m!385261 () Bool)

(assert (=> b!255733 m!385261))

(declare-fun m!385263 () Bool)

(assert (=> b!255732 m!385263))

(declare-fun m!385265 () Bool)

(assert (=> b!255740 m!385265))

(declare-fun m!385267 () Bool)

(assert (=> b!255728 m!385267))

(declare-fun m!385269 () Bool)

(assert (=> b!255743 m!385269))

(declare-fun m!385271 () Bool)

(assert (=> b!255742 m!385271))

(declare-fun m!385273 () Bool)

(assert (=> b!255742 m!385273))

(declare-fun m!385275 () Bool)

(assert (=> b!255742 m!385275))

(assert (=> b!255742 m!385235))

(declare-fun m!385277 () Bool)

(assert (=> b!255741 m!385277))

(declare-fun m!385279 () Bool)

(assert (=> start!54640 m!385279))

(assert (=> b!255731 m!385215))

(assert (=> b!255731 m!385261))

(push 1)

(assert (not b!255740))

(assert (not b!255737))

(assert (not b!255742))

(assert (not b!255743))

(assert (not b!255728))

(assert (not b!255736))

(assert (not b!255741))

(assert (not b!255731))

(assert (not b!255739))

(assert (not b!255733))

(assert (not b!255732))

(assert (not b!255729))

(assert (not b!255727))

(assert (not b!255738))

(assert (not start!54640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

