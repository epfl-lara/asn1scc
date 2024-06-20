; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54692 () Bool)

(assert start!54692)

(declare-fun b!256395 () Bool)

(declare-fun e!177666 () Bool)

(declare-fun e!177665 () Bool)

(assert (=> b!256395 (= e!177666 (not e!177665))))

(declare-fun res!214958 () Bool)

(assert (=> b!256395 (=> res!214958 e!177665)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256395 (= res!214958 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13839 0))(
  ( (array!13840 (arr!7061 (Array (_ BitVec 32) (_ BitVec 8))) (size!6074 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11070 0))(
  ( (BitStream!11071 (buf!6591 array!13839) (currentByte!12070 (_ BitVec 32)) (currentBit!12065 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11070)

(declare-fun isPrefixOf!0 (BitStream!11070 BitStream!11070) Bool)

(assert (=> b!256395 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18356 0))(
  ( (Unit!18357) )
))
(declare-fun lt!397755 () Unit!18356)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11070) Unit!18356)

(assert (=> b!256395 (= lt!397755 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256396 () Bool)

(declare-fun res!214962 () Bool)

(assert (=> b!256396 (=> (not res!214962) (not e!177666))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256396 (= res!214962 (validate_offset_bits!1 ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))) ((_ sign_extend 32) (currentByte!12070 thiss!1005)) ((_ sign_extend 32) (currentBit!12065 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256397 () Bool)

(declare-fun e!177667 () Bool)

(declare-fun array_inv!5815 (array!13839) Bool)

(assert (=> b!256397 (= e!177667 (array_inv!5815 (buf!6591 thiss!1005)))))

(declare-fun res!214960 () Bool)

(assert (=> start!54692 (=> (not res!214960) (not e!177666))))

(assert (=> start!54692 (= res!214960 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54692 e!177666))

(assert (=> start!54692 true))

(declare-fun inv!12 (BitStream!11070) Bool)

(assert (=> start!54692 (and (inv!12 thiss!1005) e!177667)))

(declare-fun b!256398 () Bool)

(declare-fun res!214959 () Bool)

(assert (=> b!256398 (=> (not res!214959) (not e!177666))))

(assert (=> b!256398 (= res!214959 (bvsge from!289 nBits!297))))

(declare-fun b!256399 () Bool)

(declare-fun e!177664 () Bool)

(declare-datatypes ((tuple2!21946 0))(
  ( (tuple2!21947 (_1!11907 BitStream!11070) (_2!11907 Bool)) )
))
(declare-fun lt!397756 () tuple2!21946)

(declare-datatypes ((tuple2!21948 0))(
  ( (tuple2!21949 (_1!11908 BitStream!11070) (_2!11908 BitStream!11070)) )
))
(declare-fun lt!397754 () tuple2!21948)

(assert (=> b!256399 (= e!177664 (and (_2!11907 lt!397756) (= (_1!11907 lt!397756) (_2!11908 lt!397754))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11070 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21946)

(assert (=> b!256399 (= lt!397756 (checkBitsLoopPure!0 (_1!11908 lt!397754) nBits!297 bit!26 from!289))))

(declare-fun lt!397758 () Unit!18356)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11070 array!13839 (_ BitVec 64)) Unit!18356)

(assert (=> b!256399 (= lt!397758 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6591 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-fun reader!0 (BitStream!11070 BitStream!11070) tuple2!21948)

(assert (=> b!256399 (= lt!397754 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256400 () Bool)

(assert (=> b!256400 (= e!177665 e!177664)))

(declare-fun res!214961 () Bool)

(assert (=> b!256400 (=> (not res!214961) (not e!177664))))

(declare-fun lt!397757 () (_ BitVec 64))

(assert (=> b!256400 (= res!214961 (= lt!397757 (bvadd lt!397757 (bvsub nBits!297 from!289))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256400 (= lt!397757 (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005)))))

(assert (= (and start!54692 res!214960) b!256396))

(assert (= (and b!256396 res!214962) b!256398))

(assert (= (and b!256398 res!214959) b!256395))

(assert (= (and b!256395 (not res!214958)) b!256400))

(assert (= (and b!256400 res!214961) b!256399))

(assert (= start!54692 b!256397))

(declare-fun m!385983 () Bool)

(assert (=> b!256399 m!385983))

(declare-fun m!385985 () Bool)

(assert (=> b!256399 m!385985))

(declare-fun m!385987 () Bool)

(assert (=> b!256399 m!385987))

(declare-fun m!385989 () Bool)

(assert (=> b!256400 m!385989))

(declare-fun m!385991 () Bool)

(assert (=> b!256397 m!385991))

(declare-fun m!385993 () Bool)

(assert (=> start!54692 m!385993))

(declare-fun m!385995 () Bool)

(assert (=> b!256396 m!385995))

(declare-fun m!385997 () Bool)

(assert (=> b!256395 m!385997))

(declare-fun m!385999 () Bool)

(assert (=> b!256395 m!385999))

(check-sat (not b!256399) (not b!256397) (not start!54692) (not b!256396) (not b!256400) (not b!256395))
(check-sat)
(get-model)

(declare-datatypes ((tuple2!21958 0))(
  ( (tuple2!21959 (_1!11913 Bool) (_2!11913 BitStream!11070)) )
))
(declare-fun lt!397950 () tuple2!21958)

(declare-fun d!85982 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!11070 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21958)

(assert (=> d!85982 (= lt!397950 (checkBitsLoop!0 (_1!11908 lt!397754) nBits!297 bit!26 from!289))))

(assert (=> d!85982 (= (checkBitsLoopPure!0 (_1!11908 lt!397754) nBits!297 bit!26 from!289) (tuple2!21947 (_2!11913 lt!397950) (_1!11913 lt!397950)))))

(declare-fun bs!21719 () Bool)

(assert (= bs!21719 d!85982))

(declare-fun m!386083 () Bool)

(assert (=> bs!21719 m!386083))

(assert (=> b!256399 d!85982))

(declare-fun d!85984 () Bool)

(assert (=> d!85984 (validate_offset_bits!1 ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))) ((_ sign_extend 32) (currentByte!12070 thiss!1005)) ((_ sign_extend 32) (currentBit!12065 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397953 () Unit!18356)

(declare-fun choose!9 (BitStream!11070 array!13839 (_ BitVec 64) BitStream!11070) Unit!18356)

(assert (=> d!85984 (= lt!397953 (choose!9 thiss!1005 (buf!6591 thiss!1005) (bvsub nBits!297 from!289) (BitStream!11071 (buf!6591 thiss!1005) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))))))

(assert (=> d!85984 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6591 thiss!1005) (bvsub nBits!297 from!289)) lt!397953)))

(declare-fun bs!21720 () Bool)

(assert (= bs!21720 d!85984))

(assert (=> bs!21720 m!385995))

(declare-fun m!386085 () Bool)

(assert (=> bs!21720 m!386085))

(assert (=> b!256399 d!85984))

(declare-fun b!256489 () Bool)

(declare-fun res!215034 () Bool)

(declare-fun e!177718 () Bool)

(assert (=> b!256489 (=> (not res!215034) (not e!177718))))

(declare-fun lt!398002 () tuple2!21948)

(assert (=> b!256489 (= res!215034 (isPrefixOf!0 (_1!11908 lt!398002) thiss!1005))))

(declare-fun b!256490 () Bool)

(declare-fun e!177719 () Unit!18356)

(declare-fun Unit!18362 () Unit!18356)

(assert (=> b!256490 (= e!177719 Unit!18362)))

(declare-fun b!256491 () Bool)

(declare-fun lt!398003 () Unit!18356)

(assert (=> b!256491 (= e!177719 lt!398003)))

(declare-fun lt!398005 () (_ BitVec 64))

(assert (=> b!256491 (= lt!398005 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!398001 () (_ BitVec 64))

(assert (=> b!256491 (= lt!398001 (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13839 array!13839 (_ BitVec 64) (_ BitVec 64)) Unit!18356)

(assert (=> b!256491 (= lt!398003 (arrayBitRangesEqSymmetric!0 (buf!6591 thiss!1005) (buf!6591 thiss!1005) lt!398005 lt!398001))))

(declare-fun arrayBitRangesEq!0 (array!13839 array!13839 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256491 (arrayBitRangesEq!0 (buf!6591 thiss!1005) (buf!6591 thiss!1005) lt!398005 lt!398001)))

(declare-fun b!256492 () Bool)

(declare-fun res!215033 () Bool)

(assert (=> b!256492 (=> (not res!215033) (not e!177718))))

(assert (=> b!256492 (= res!215033 (isPrefixOf!0 (_2!11908 lt!398002) thiss!1005))))

(declare-fun lt!398009 () (_ BitVec 64))

(declare-fun b!256493 () Bool)

(declare-fun lt!398011 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!11070 (_ BitVec 64)) BitStream!11070)

(assert (=> b!256493 (= e!177718 (= (_1!11908 lt!398002) (withMovedBitIndex!0 (_2!11908 lt!398002) (bvsub lt!398009 lt!398011))))))

(assert (=> b!256493 (or (= (bvand lt!398009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398011 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398009 lt!398011) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!256493 (= lt!398011 (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005)))))

(assert (=> b!256493 (= lt!398009 (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005)))))

(declare-fun d!85986 () Bool)

(assert (=> d!85986 e!177718))

(declare-fun res!215032 () Bool)

(assert (=> d!85986 (=> (not res!215032) (not e!177718))))

(assert (=> d!85986 (= res!215032 (isPrefixOf!0 (_1!11908 lt!398002) (_2!11908 lt!398002)))))

(declare-fun lt!398000 () BitStream!11070)

(assert (=> d!85986 (= lt!398002 (tuple2!21949 lt!398000 thiss!1005))))

(declare-fun lt!398006 () Unit!18356)

(declare-fun lt!398007 () Unit!18356)

(assert (=> d!85986 (= lt!398006 lt!398007)))

(assert (=> d!85986 (isPrefixOf!0 lt!398000 thiss!1005)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11070 BitStream!11070 BitStream!11070) Unit!18356)

(assert (=> d!85986 (= lt!398007 (lemmaIsPrefixTransitive!0 lt!398000 thiss!1005 thiss!1005))))

(declare-fun lt!397995 () Unit!18356)

(declare-fun lt!398008 () Unit!18356)

(assert (=> d!85986 (= lt!397995 lt!398008)))

(assert (=> d!85986 (isPrefixOf!0 lt!398000 thiss!1005)))

(assert (=> d!85986 (= lt!398008 (lemmaIsPrefixTransitive!0 lt!398000 thiss!1005 thiss!1005))))

(declare-fun lt!397994 () Unit!18356)

(assert (=> d!85986 (= lt!397994 e!177719)))

(declare-fun c!11779 () Bool)

(assert (=> d!85986 (= c!11779 (not (= (size!6074 (buf!6591 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!398010 () Unit!18356)

(declare-fun lt!398013 () Unit!18356)

(assert (=> d!85986 (= lt!398010 lt!398013)))

(assert (=> d!85986 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85986 (= lt!398013 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!397997 () Unit!18356)

(declare-fun lt!397996 () Unit!18356)

(assert (=> d!85986 (= lt!397997 lt!397996)))

(assert (=> d!85986 (= lt!397996 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!398012 () Unit!18356)

(declare-fun lt!397999 () Unit!18356)

(assert (=> d!85986 (= lt!398012 lt!397999)))

(assert (=> d!85986 (isPrefixOf!0 lt!398000 lt!398000)))

(assert (=> d!85986 (= lt!397999 (lemmaIsPrefixRefl!0 lt!398000))))

(declare-fun lt!397998 () Unit!18356)

(declare-fun lt!398004 () Unit!18356)

(assert (=> d!85986 (= lt!397998 lt!398004)))

(assert (=> d!85986 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85986 (= lt!398004 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!85986 (= lt!398000 (BitStream!11071 (buf!6591 thiss!1005) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005)))))

(assert (=> d!85986 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85986 (= (reader!0 thiss!1005 thiss!1005) lt!398002)))

(assert (= (and d!85986 c!11779) b!256491))

(assert (= (and d!85986 (not c!11779)) b!256490))

(assert (= (and d!85986 res!215032) b!256489))

(assert (= (and b!256489 res!215034) b!256492))

(assert (= (and b!256492 res!215033) b!256493))

(assert (=> b!256491 m!385989))

(declare-fun m!386087 () Bool)

(assert (=> b!256491 m!386087))

(declare-fun m!386089 () Bool)

(assert (=> b!256491 m!386089))

(declare-fun m!386091 () Bool)

(assert (=> b!256492 m!386091))

(assert (=> d!85986 m!385999))

(declare-fun m!386093 () Bool)

(assert (=> d!85986 m!386093))

(declare-fun m!386095 () Bool)

(assert (=> d!85986 m!386095))

(assert (=> d!85986 m!385997))

(declare-fun m!386097 () Bool)

(assert (=> d!85986 m!386097))

(declare-fun m!386099 () Bool)

(assert (=> d!85986 m!386099))

(assert (=> d!85986 m!385997))

(declare-fun m!386101 () Bool)

(assert (=> d!85986 m!386101))

(assert (=> d!85986 m!385999))

(assert (=> d!85986 m!385997))

(assert (=> d!85986 m!386099))

(declare-fun m!386103 () Bool)

(assert (=> b!256489 m!386103))

(declare-fun m!386105 () Bool)

(assert (=> b!256493 m!386105))

(assert (=> b!256493 m!385989))

(assert (=> b!256493 m!385989))

(assert (=> b!256399 d!85986))

(declare-fun d!85988 () Bool)

(declare-fun e!177722 () Bool)

(assert (=> d!85988 e!177722))

(declare-fun res!215040 () Bool)

(assert (=> d!85988 (=> (not res!215040) (not e!177722))))

(declare-fun lt!398031 () (_ BitVec 64))

(declare-fun lt!398027 () (_ BitVec 64))

(declare-fun lt!398028 () (_ BitVec 64))

(assert (=> d!85988 (= res!215040 (= lt!398031 (bvsub lt!398027 lt!398028)))))

(assert (=> d!85988 (or (= (bvand lt!398027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398028 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398027 lt!398028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!85988 (= lt!398028 (remainingBits!0 ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))) ((_ sign_extend 32) (currentByte!12070 thiss!1005)) ((_ sign_extend 32) (currentBit!12065 thiss!1005))))))

(declare-fun lt!398030 () (_ BitVec 64))

(declare-fun lt!398029 () (_ BitVec 64))

(assert (=> d!85988 (= lt!398027 (bvmul lt!398030 lt!398029))))

(assert (=> d!85988 (or (= lt!398030 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398029 (bvsdiv (bvmul lt!398030 lt!398029) lt!398030)))))

(assert (=> d!85988 (= lt!398029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85988 (= lt!398030 ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))))))

(assert (=> d!85988 (= lt!398031 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12070 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12065 thiss!1005))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!85988 (invariant!0 (currentBit!12065 thiss!1005) (currentByte!12070 thiss!1005) (size!6074 (buf!6591 thiss!1005)))))

(assert (=> d!85988 (= (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005)) lt!398031)))

(declare-fun b!256498 () Bool)

(declare-fun res!215039 () Bool)

(assert (=> b!256498 (=> (not res!215039) (not e!177722))))

(assert (=> b!256498 (= res!215039 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398031))))

(declare-fun b!256499 () Bool)

(declare-fun lt!398026 () (_ BitVec 64))

(assert (=> b!256499 (= e!177722 (bvsle lt!398031 (bvmul lt!398026 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256499 (or (= lt!398026 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398026 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398026)))))

(assert (=> b!256499 (= lt!398026 ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))))))

(assert (= (and d!85988 res!215040) b!256498))

(assert (= (and b!256498 res!215039) b!256499))

(declare-fun m!386107 () Bool)

(assert (=> d!85988 m!386107))

(declare-fun m!386109 () Bool)

(assert (=> d!85988 m!386109))

(assert (=> b!256400 d!85988))

(declare-fun d!85990 () Bool)

(assert (=> d!85990 (= (array_inv!5815 (buf!6591 thiss!1005)) (bvsge (size!6074 (buf!6591 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!256397 d!85990))

(declare-fun d!85992 () Bool)

(declare-fun res!215049 () Bool)

(declare-fun e!177728 () Bool)

(assert (=> d!85992 (=> (not res!215049) (not e!177728))))

(assert (=> d!85992 (= res!215049 (= (size!6074 (buf!6591 thiss!1005)) (size!6074 (buf!6591 thiss!1005))))))

(assert (=> d!85992 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!177728)))

(declare-fun b!256506 () Bool)

(declare-fun res!215048 () Bool)

(assert (=> b!256506 (=> (not res!215048) (not e!177728))))

(assert (=> b!256506 (= res!215048 (bvsle (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005)) (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))))))

(declare-fun b!256507 () Bool)

(declare-fun e!177727 () Bool)

(assert (=> b!256507 (= e!177728 e!177727)))

(declare-fun res!215047 () Bool)

(assert (=> b!256507 (=> res!215047 e!177727)))

(assert (=> b!256507 (= res!215047 (= (size!6074 (buf!6591 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!256508 () Bool)

(assert (=> b!256508 (= e!177727 (arrayBitRangesEq!0 (buf!6591 thiss!1005) (buf!6591 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))))))

(assert (= (and d!85992 res!215049) b!256506))

(assert (= (and b!256506 res!215048) b!256507))

(assert (= (and b!256507 (not res!215047)) b!256508))

(assert (=> b!256506 m!385989))

(assert (=> b!256506 m!385989))

(assert (=> b!256508 m!385989))

(assert (=> b!256508 m!385989))

(declare-fun m!386111 () Bool)

(assert (=> b!256508 m!386111))

(assert (=> b!256395 d!85992))

(declare-fun d!85994 () Bool)

(assert (=> d!85994 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!398034 () Unit!18356)

(declare-fun choose!11 (BitStream!11070) Unit!18356)

(assert (=> d!85994 (= lt!398034 (choose!11 thiss!1005))))

(assert (=> d!85994 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!398034)))

(declare-fun bs!21722 () Bool)

(assert (= bs!21722 d!85994))

(assert (=> bs!21722 m!385997))

(declare-fun m!386113 () Bool)

(assert (=> bs!21722 m!386113))

(assert (=> b!256395 d!85994))

(declare-fun d!85996 () Bool)

(assert (=> d!85996 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))) ((_ sign_extend 32) (currentByte!12070 thiss!1005)) ((_ sign_extend 32) (currentBit!12065 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))) ((_ sign_extend 32) (currentByte!12070 thiss!1005)) ((_ sign_extend 32) (currentBit!12065 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21723 () Bool)

(assert (= bs!21723 d!85996))

(assert (=> bs!21723 m!386107))

(assert (=> b!256396 d!85996))

(declare-fun d!85998 () Bool)

(assert (=> d!85998 (= (inv!12 thiss!1005) (invariant!0 (currentBit!12065 thiss!1005) (currentByte!12070 thiss!1005) (size!6074 (buf!6591 thiss!1005))))))

(declare-fun bs!21724 () Bool)

(assert (= bs!21724 d!85998))

(assert (=> bs!21724 m!386109))

(assert (=> start!54692 d!85998))

(check-sat (not d!85994) (not d!85986) (not b!256491) (not b!256489) (not b!256508) (not b!256492) (not d!85996) (not d!85984) (not b!256506) (not d!85982) (not d!85998) (not d!85988) (not b!256493))
(check-sat)
(get-model)

(declare-fun d!86000 () Bool)

(declare-fun e!177731 () Bool)

(assert (=> d!86000 e!177731))

(declare-fun res!215052 () Bool)

(assert (=> d!86000 (=> (not res!215052) (not e!177731))))

(declare-fun lt!398039 () BitStream!11070)

(declare-fun lt!398040 () (_ BitVec 64))

(assert (=> d!86000 (= res!215052 (= (bvadd lt!398040 (bvsub lt!398009 lt!398011)) (bitIndex!0 (size!6074 (buf!6591 lt!398039)) (currentByte!12070 lt!398039) (currentBit!12065 lt!398039))))))

(assert (=> d!86000 (or (not (= (bvand lt!398040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398009 lt!398011) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398040 (bvsub lt!398009 lt!398011)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86000 (= lt!398040 (bitIndex!0 (size!6074 (buf!6591 (_2!11908 lt!398002))) (currentByte!12070 (_2!11908 lt!398002)) (currentBit!12065 (_2!11908 lt!398002))))))

(declare-datatypes ((tuple2!21960 0))(
  ( (tuple2!21961 (_1!11914 Unit!18356) (_2!11914 BitStream!11070)) )
))
(declare-fun moveBitIndex!0 (BitStream!11070 (_ BitVec 64)) tuple2!21960)

(assert (=> d!86000 (= lt!398039 (_2!11914 (moveBitIndex!0 (_2!11908 lt!398002) (bvsub lt!398009 lt!398011))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!11070 (_ BitVec 64)) Bool)

(assert (=> d!86000 (moveBitIndexPrecond!0 (_2!11908 lt!398002) (bvsub lt!398009 lt!398011))))

(assert (=> d!86000 (= (withMovedBitIndex!0 (_2!11908 lt!398002) (bvsub lt!398009 lt!398011)) lt!398039)))

(declare-fun b!256511 () Bool)

(assert (=> b!256511 (= e!177731 (= (size!6074 (buf!6591 (_2!11908 lt!398002))) (size!6074 (buf!6591 lt!398039))))))

(assert (= (and d!86000 res!215052) b!256511))

(declare-fun m!386115 () Bool)

(assert (=> d!86000 m!386115))

(declare-fun m!386117 () Bool)

(assert (=> d!86000 m!386117))

(declare-fun m!386119 () Bool)

(assert (=> d!86000 m!386119))

(declare-fun m!386121 () Bool)

(assert (=> d!86000 m!386121))

(assert (=> b!256493 d!86000))

(assert (=> b!256493 d!85988))

(declare-fun d!86002 () Bool)

(assert (=> d!86002 (= (remainingBits!0 ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))) ((_ sign_extend 32) (currentByte!12070 thiss!1005)) ((_ sign_extend 32) (currentBit!12065 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12070 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12065 thiss!1005)))))))

(assert (=> d!85988 d!86002))

(declare-fun d!86004 () Bool)

(assert (=> d!86004 (= (invariant!0 (currentBit!12065 thiss!1005) (currentByte!12070 thiss!1005) (size!6074 (buf!6591 thiss!1005))) (and (bvsge (currentBit!12065 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!12065 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12070 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12070 thiss!1005) (size!6074 (buf!6591 thiss!1005))) (and (= (currentBit!12065 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12070 thiss!1005) (size!6074 (buf!6591 thiss!1005)))))))))

(assert (=> d!85988 d!86004))

(assert (=> b!256506 d!85988))

(declare-fun d!86006 () Bool)

(declare-fun res!215055 () Bool)

(declare-fun e!177733 () Bool)

(assert (=> d!86006 (=> (not res!215055) (not e!177733))))

(assert (=> d!86006 (= res!215055 (= (size!6074 (buf!6591 (_2!11908 lt!398002))) (size!6074 (buf!6591 thiss!1005))))))

(assert (=> d!86006 (= (isPrefixOf!0 (_2!11908 lt!398002) thiss!1005) e!177733)))

(declare-fun b!256512 () Bool)

(declare-fun res!215054 () Bool)

(assert (=> b!256512 (=> (not res!215054) (not e!177733))))

(assert (=> b!256512 (= res!215054 (bvsle (bitIndex!0 (size!6074 (buf!6591 (_2!11908 lt!398002))) (currentByte!12070 (_2!11908 lt!398002)) (currentBit!12065 (_2!11908 lt!398002))) (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))))))

(declare-fun b!256513 () Bool)

(declare-fun e!177732 () Bool)

(assert (=> b!256513 (= e!177733 e!177732)))

(declare-fun res!215053 () Bool)

(assert (=> b!256513 (=> res!215053 e!177732)))

(assert (=> b!256513 (= res!215053 (= (size!6074 (buf!6591 (_2!11908 lt!398002))) #b00000000000000000000000000000000))))

(declare-fun b!256514 () Bool)

(assert (=> b!256514 (= e!177732 (arrayBitRangesEq!0 (buf!6591 (_2!11908 lt!398002)) (buf!6591 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6074 (buf!6591 (_2!11908 lt!398002))) (currentByte!12070 (_2!11908 lt!398002)) (currentBit!12065 (_2!11908 lt!398002)))))))

(assert (= (and d!86006 res!215055) b!256512))

(assert (= (and b!256512 res!215054) b!256513))

(assert (= (and b!256513 (not res!215053)) b!256514))

(assert (=> b!256512 m!386117))

(assert (=> b!256512 m!385989))

(assert (=> b!256514 m!386117))

(assert (=> b!256514 m!386117))

(declare-fun m!386123 () Bool)

(assert (=> b!256514 m!386123))

(assert (=> b!256492 d!86006))

(declare-fun d!86008 () Bool)

(assert (=> d!86008 (isPrefixOf!0 lt!398000 lt!398000)))

(declare-fun lt!398041 () Unit!18356)

(assert (=> d!86008 (= lt!398041 (choose!11 lt!398000))))

(assert (=> d!86008 (= (lemmaIsPrefixRefl!0 lt!398000) lt!398041)))

(declare-fun bs!21725 () Bool)

(assert (= bs!21725 d!86008))

(assert (=> bs!21725 m!386097))

(declare-fun m!386125 () Bool)

(assert (=> bs!21725 m!386125))

(assert (=> d!85986 d!86008))

(declare-fun d!86010 () Bool)

(assert (=> d!86010 (isPrefixOf!0 lt!398000 thiss!1005)))

(declare-fun lt!398044 () Unit!18356)

(declare-fun choose!30 (BitStream!11070 BitStream!11070 BitStream!11070) Unit!18356)

(assert (=> d!86010 (= lt!398044 (choose!30 lt!398000 thiss!1005 thiss!1005))))

(assert (=> d!86010 (isPrefixOf!0 lt!398000 thiss!1005)))

(assert (=> d!86010 (= (lemmaIsPrefixTransitive!0 lt!398000 thiss!1005 thiss!1005) lt!398044)))

(declare-fun bs!21726 () Bool)

(assert (= bs!21726 d!86010))

(assert (=> bs!21726 m!386095))

(declare-fun m!386127 () Bool)

(assert (=> bs!21726 m!386127))

(assert (=> bs!21726 m!386095))

(assert (=> d!85986 d!86010))

(assert (=> d!85986 d!85992))

(declare-fun d!86012 () Bool)

(declare-fun res!215058 () Bool)

(declare-fun e!177735 () Bool)

(assert (=> d!86012 (=> (not res!215058) (not e!177735))))

(assert (=> d!86012 (= res!215058 (= (size!6074 (buf!6591 lt!398000)) (size!6074 (buf!6591 thiss!1005))))))

(assert (=> d!86012 (= (isPrefixOf!0 lt!398000 thiss!1005) e!177735)))

(declare-fun b!256515 () Bool)

(declare-fun res!215057 () Bool)

(assert (=> b!256515 (=> (not res!215057) (not e!177735))))

(assert (=> b!256515 (= res!215057 (bvsle (bitIndex!0 (size!6074 (buf!6591 lt!398000)) (currentByte!12070 lt!398000) (currentBit!12065 lt!398000)) (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))))))

(declare-fun b!256516 () Bool)

(declare-fun e!177734 () Bool)

(assert (=> b!256516 (= e!177735 e!177734)))

(declare-fun res!215056 () Bool)

(assert (=> b!256516 (=> res!215056 e!177734)))

(assert (=> b!256516 (= res!215056 (= (size!6074 (buf!6591 lt!398000)) #b00000000000000000000000000000000))))

(declare-fun b!256517 () Bool)

(assert (=> b!256517 (= e!177734 (arrayBitRangesEq!0 (buf!6591 lt!398000) (buf!6591 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6074 (buf!6591 lt!398000)) (currentByte!12070 lt!398000) (currentBit!12065 lt!398000))))))

(assert (= (and d!86012 res!215058) b!256515))

(assert (= (and b!256515 res!215057) b!256516))

(assert (= (and b!256516 (not res!215056)) b!256517))

(declare-fun m!386129 () Bool)

(assert (=> b!256515 m!386129))

(assert (=> b!256515 m!385989))

(assert (=> b!256517 m!386129))

(assert (=> b!256517 m!386129))

(declare-fun m!386131 () Bool)

(assert (=> b!256517 m!386131))

(assert (=> d!85986 d!86012))

(assert (=> d!85986 d!85994))

(declare-fun d!86014 () Bool)

(declare-fun res!215061 () Bool)

(declare-fun e!177737 () Bool)

(assert (=> d!86014 (=> (not res!215061) (not e!177737))))

(assert (=> d!86014 (= res!215061 (= (size!6074 (buf!6591 (_1!11908 lt!398002))) (size!6074 (buf!6591 (_2!11908 lt!398002)))))))

(assert (=> d!86014 (= (isPrefixOf!0 (_1!11908 lt!398002) (_2!11908 lt!398002)) e!177737)))

(declare-fun b!256518 () Bool)

(declare-fun res!215060 () Bool)

(assert (=> b!256518 (=> (not res!215060) (not e!177737))))

(assert (=> b!256518 (= res!215060 (bvsle (bitIndex!0 (size!6074 (buf!6591 (_1!11908 lt!398002))) (currentByte!12070 (_1!11908 lt!398002)) (currentBit!12065 (_1!11908 lt!398002))) (bitIndex!0 (size!6074 (buf!6591 (_2!11908 lt!398002))) (currentByte!12070 (_2!11908 lt!398002)) (currentBit!12065 (_2!11908 lt!398002)))))))

(declare-fun b!256519 () Bool)

(declare-fun e!177736 () Bool)

(assert (=> b!256519 (= e!177737 e!177736)))

(declare-fun res!215059 () Bool)

(assert (=> b!256519 (=> res!215059 e!177736)))

(assert (=> b!256519 (= res!215059 (= (size!6074 (buf!6591 (_1!11908 lt!398002))) #b00000000000000000000000000000000))))

(declare-fun b!256520 () Bool)

(assert (=> b!256520 (= e!177736 (arrayBitRangesEq!0 (buf!6591 (_1!11908 lt!398002)) (buf!6591 (_2!11908 lt!398002)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6074 (buf!6591 (_1!11908 lt!398002))) (currentByte!12070 (_1!11908 lt!398002)) (currentBit!12065 (_1!11908 lt!398002)))))))

(assert (= (and d!86014 res!215061) b!256518))

(assert (= (and b!256518 res!215060) b!256519))

(assert (= (and b!256519 (not res!215059)) b!256520))

(declare-fun m!386133 () Bool)

(assert (=> b!256518 m!386133))

(assert (=> b!256518 m!386117))

(assert (=> b!256520 m!386133))

(assert (=> b!256520 m!386133))

(declare-fun m!386135 () Bool)

(assert (=> b!256520 m!386135))

(assert (=> d!85986 d!86014))

(declare-fun d!86016 () Bool)

(declare-fun res!215064 () Bool)

(declare-fun e!177739 () Bool)

(assert (=> d!86016 (=> (not res!215064) (not e!177739))))

(assert (=> d!86016 (= res!215064 (= (size!6074 (buf!6591 lt!398000)) (size!6074 (buf!6591 lt!398000))))))

(assert (=> d!86016 (= (isPrefixOf!0 lt!398000 lt!398000) e!177739)))

(declare-fun b!256521 () Bool)

(declare-fun res!215063 () Bool)

(assert (=> b!256521 (=> (not res!215063) (not e!177739))))

(assert (=> b!256521 (= res!215063 (bvsle (bitIndex!0 (size!6074 (buf!6591 lt!398000)) (currentByte!12070 lt!398000) (currentBit!12065 lt!398000)) (bitIndex!0 (size!6074 (buf!6591 lt!398000)) (currentByte!12070 lt!398000) (currentBit!12065 lt!398000))))))

(declare-fun b!256522 () Bool)

(declare-fun e!177738 () Bool)

(assert (=> b!256522 (= e!177739 e!177738)))

(declare-fun res!215062 () Bool)

(assert (=> b!256522 (=> res!215062 e!177738)))

(assert (=> b!256522 (= res!215062 (= (size!6074 (buf!6591 lt!398000)) #b00000000000000000000000000000000))))

(declare-fun b!256523 () Bool)

(assert (=> b!256523 (= e!177738 (arrayBitRangesEq!0 (buf!6591 lt!398000) (buf!6591 lt!398000) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6074 (buf!6591 lt!398000)) (currentByte!12070 lt!398000) (currentBit!12065 lt!398000))))))

(assert (= (and d!86016 res!215064) b!256521))

(assert (= (and b!256521 res!215063) b!256522))

(assert (= (and b!256522 (not res!215062)) b!256523))

(assert (=> b!256521 m!386129))

(assert (=> b!256521 m!386129))

(assert (=> b!256523 m!386129))

(assert (=> b!256523 m!386129))

(declare-fun m!386137 () Bool)

(assert (=> b!256523 m!386137))

(assert (=> d!85986 d!86016))

(assert (=> b!256491 d!85988))

(declare-fun d!86018 () Bool)

(assert (=> d!86018 (arrayBitRangesEq!0 (buf!6591 thiss!1005) (buf!6591 thiss!1005) lt!398005 lt!398001)))

(declare-fun lt!398047 () Unit!18356)

(declare-fun choose!8 (array!13839 array!13839 (_ BitVec 64) (_ BitVec 64)) Unit!18356)

(assert (=> d!86018 (= lt!398047 (choose!8 (buf!6591 thiss!1005) (buf!6591 thiss!1005) lt!398005 lt!398001))))

(assert (=> d!86018 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398005) (bvsle lt!398005 lt!398001))))

(assert (=> d!86018 (= (arrayBitRangesEqSymmetric!0 (buf!6591 thiss!1005) (buf!6591 thiss!1005) lt!398005 lt!398001) lt!398047)))

(declare-fun bs!21727 () Bool)

(assert (= bs!21727 d!86018))

(assert (=> bs!21727 m!386089))

(declare-fun m!386139 () Bool)

(assert (=> bs!21727 m!386139))

(assert (=> b!256491 d!86018))

(declare-fun lt!398055 () (_ BitVec 32))

(declare-datatypes ((tuple4!308 0))(
  ( (tuple4!309 (_1!11915 (_ BitVec 32)) (_2!11915 (_ BitVec 32)) (_3!934 (_ BitVec 32)) (_4!154 (_ BitVec 32))) )
))
(declare-fun lt!398054 () tuple4!308)

(declare-fun bm!4008 () Bool)

(declare-fun call!4011 () Bool)

(declare-fun lt!398056 () (_ BitVec 32))

(declare-fun c!11782 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4008 (= call!4011 (byteRangesEq!0 (ite c!11782 (select (arr!7061 (buf!6591 thiss!1005)) (_3!934 lt!398054)) (select (arr!7061 (buf!6591 thiss!1005)) (_4!154 lt!398054))) (ite c!11782 (select (arr!7061 (buf!6591 thiss!1005)) (_3!934 lt!398054)) (select (arr!7061 (buf!6591 thiss!1005)) (_4!154 lt!398054))) (ite c!11782 lt!398055 #b00000000000000000000000000000000) lt!398056))))

(declare-fun b!256538 () Bool)

(declare-fun e!177755 () Bool)

(assert (=> b!256538 (= e!177755 call!4011)))

(declare-fun b!256539 () Bool)

(declare-fun e!177754 () Bool)

(declare-fun e!177757 () Bool)

(assert (=> b!256539 (= e!177754 e!177757)))

(declare-fun res!215075 () Bool)

(assert (=> b!256539 (=> (not res!215075) (not e!177757))))

(declare-fun e!177753 () Bool)

(assert (=> b!256539 (= res!215075 e!177753)))

(declare-fun res!215078 () Bool)

(assert (=> b!256539 (=> res!215078 e!177753)))

(assert (=> b!256539 (= res!215078 (bvsge (_1!11915 lt!398054) (_2!11915 lt!398054)))))

(assert (=> b!256539 (= lt!398056 ((_ extract 31 0) (bvsrem lt!398001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256539 (= lt!398055 ((_ extract 31 0) (bvsrem lt!398005 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!308)

(assert (=> b!256539 (= lt!398054 (arrayBitIndices!0 lt!398005 lt!398001))))

(declare-fun b!256540 () Bool)

(declare-fun e!177752 () Bool)

(assert (=> b!256540 (= e!177755 e!177752)))

(declare-fun res!215079 () Bool)

(assert (=> b!256540 (= res!215079 (byteRangesEq!0 (select (arr!7061 (buf!6591 thiss!1005)) (_3!934 lt!398054)) (select (arr!7061 (buf!6591 thiss!1005)) (_3!934 lt!398054)) lt!398055 #b00000000000000000000000000001000))))

(assert (=> b!256540 (=> (not res!215079) (not e!177752))))

(declare-fun b!256541 () Bool)

(assert (=> b!256541 (= e!177757 e!177755)))

(assert (=> b!256541 (= c!11782 (= (_3!934 lt!398054) (_4!154 lt!398054)))))

(declare-fun b!256542 () Bool)

(declare-fun res!215076 () Bool)

(assert (=> b!256542 (= res!215076 (= lt!398056 #b00000000000000000000000000000000))))

(declare-fun e!177756 () Bool)

(assert (=> b!256542 (=> res!215076 e!177756)))

(assert (=> b!256542 (= e!177752 e!177756)))

(declare-fun d!86020 () Bool)

(declare-fun res!215077 () Bool)

(assert (=> d!86020 (=> res!215077 e!177754)))

(assert (=> d!86020 (= res!215077 (bvsge lt!398005 lt!398001))))

(assert (=> d!86020 (= (arrayBitRangesEq!0 (buf!6591 thiss!1005) (buf!6591 thiss!1005) lt!398005 lt!398001) e!177754)))

(declare-fun b!256543 () Bool)

(declare-fun arrayRangesEq!931 (array!13839 array!13839 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256543 (= e!177753 (arrayRangesEq!931 (buf!6591 thiss!1005) (buf!6591 thiss!1005) (_1!11915 lt!398054) (_2!11915 lt!398054)))))

(declare-fun b!256544 () Bool)

(assert (=> b!256544 (= e!177756 call!4011)))

(assert (= (and d!86020 (not res!215077)) b!256539))

(assert (= (and b!256539 (not res!215078)) b!256543))

(assert (= (and b!256539 res!215075) b!256541))

(assert (= (and b!256541 c!11782) b!256538))

(assert (= (and b!256541 (not c!11782)) b!256540))

(assert (= (and b!256540 res!215079) b!256542))

(assert (= (and b!256542 (not res!215076)) b!256544))

(assert (= (or b!256538 b!256544) bm!4008))

(declare-fun m!386141 () Bool)

(assert (=> bm!4008 m!386141))

(declare-fun m!386143 () Bool)

(assert (=> bm!4008 m!386143))

(assert (=> bm!4008 m!386143))

(assert (=> bm!4008 m!386141))

(declare-fun m!386145 () Bool)

(assert (=> bm!4008 m!386145))

(declare-fun m!386147 () Bool)

(assert (=> b!256539 m!386147))

(assert (=> b!256540 m!386143))

(assert (=> b!256540 m!386143))

(assert (=> b!256540 m!386143))

(assert (=> b!256540 m!386143))

(declare-fun m!386149 () Bool)

(assert (=> b!256540 m!386149))

(declare-fun m!386151 () Bool)

(assert (=> b!256543 m!386151))

(assert (=> b!256491 d!86020))

(declare-fun d!86022 () Bool)

(declare-fun res!215082 () Bool)

(declare-fun e!177759 () Bool)

(assert (=> d!86022 (=> (not res!215082) (not e!177759))))

(assert (=> d!86022 (= res!215082 (= (size!6074 (buf!6591 (_1!11908 lt!398002))) (size!6074 (buf!6591 thiss!1005))))))

(assert (=> d!86022 (= (isPrefixOf!0 (_1!11908 lt!398002) thiss!1005) e!177759)))

(declare-fun b!256545 () Bool)

(declare-fun res!215081 () Bool)

(assert (=> b!256545 (=> (not res!215081) (not e!177759))))

(assert (=> b!256545 (= res!215081 (bvsle (bitIndex!0 (size!6074 (buf!6591 (_1!11908 lt!398002))) (currentByte!12070 (_1!11908 lt!398002)) (currentBit!12065 (_1!11908 lt!398002))) (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))))))

(declare-fun b!256546 () Bool)

(declare-fun e!177758 () Bool)

(assert (=> b!256546 (= e!177759 e!177758)))

(declare-fun res!215080 () Bool)

(assert (=> b!256546 (=> res!215080 e!177758)))

(assert (=> b!256546 (= res!215080 (= (size!6074 (buf!6591 (_1!11908 lt!398002))) #b00000000000000000000000000000000))))

(declare-fun b!256547 () Bool)

(assert (=> b!256547 (= e!177758 (arrayBitRangesEq!0 (buf!6591 (_1!11908 lt!398002)) (buf!6591 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6074 (buf!6591 (_1!11908 lt!398002))) (currentByte!12070 (_1!11908 lt!398002)) (currentBit!12065 (_1!11908 lt!398002)))))))

(assert (= (and d!86022 res!215082) b!256545))

(assert (= (and b!256545 res!215081) b!256546))

(assert (= (and b!256546 (not res!215080)) b!256547))

(assert (=> b!256545 m!386133))

(assert (=> b!256545 m!385989))

(assert (=> b!256547 m!386133))

(assert (=> b!256547 m!386133))

(declare-fun m!386153 () Bool)

(assert (=> b!256547 m!386153))

(assert (=> b!256489 d!86022))

(assert (=> d!85994 d!85992))

(declare-fun d!86024 () Bool)

(assert (=> d!86024 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!86024 true))

(declare-fun _$14!325 () Unit!18356)

(assert (=> d!86024 (= (choose!11 thiss!1005) _$14!325)))

(declare-fun bs!21729 () Bool)

(assert (= bs!21729 d!86024))

(assert (=> bs!21729 m!385997))

(assert (=> d!85994 d!86024))

(assert (=> d!85996 d!86002))

(assert (=> d!85984 d!85996))

(declare-fun d!86026 () Bool)

(assert (=> d!86026 (validate_offset_bits!1 ((_ sign_extend 32) (size!6074 (buf!6591 thiss!1005))) ((_ sign_extend 32) (currentByte!12070 thiss!1005)) ((_ sign_extend 32) (currentBit!12065 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!86026 true))

(declare-fun _$6!447 () Unit!18356)

(assert (=> d!86026 (= (choose!9 thiss!1005 (buf!6591 thiss!1005) (bvsub nBits!297 from!289) (BitStream!11071 (buf!6591 thiss!1005) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))) _$6!447)))

(declare-fun bs!21730 () Bool)

(assert (= bs!21730 d!86026))

(assert (=> bs!21730 m!385995))

(assert (=> d!85984 d!86026))

(assert (=> d!85998 d!86004))

(declare-fun b!256569 () Bool)

(declare-fun e!177775 () Bool)

(declare-fun readBitPure!0 (BitStream!11070) tuple2!21946)

(assert (=> b!256569 (= e!177775 (= bit!26 (_2!11907 (readBitPure!0 (_1!11908 lt!397754)))))))

(declare-fun lt!398082 () tuple2!21958)

(declare-fun lt!398083 () tuple2!21958)

(declare-fun b!256570 () Bool)

(assert (=> b!256570 (= lt!398083 (checkBitsLoop!0 (_2!11913 lt!398082) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!398084 () Unit!18356)

(declare-fun lt!398081 () Unit!18356)

(assert (=> b!256570 (= lt!398084 lt!398081)))

(declare-fun lt!398086 () (_ BitVec 64))

(declare-fun lt!398087 () (_ BitVec 64))

(assert (=> b!256570 (validate_offset_bits!1 ((_ sign_extend 32) (size!6074 (buf!6591 (_2!11913 lt!398082)))) ((_ sign_extend 32) (currentByte!12070 (_2!11913 lt!398082))) ((_ sign_extend 32) (currentBit!12065 (_2!11913 lt!398082))) (bvsub lt!398086 lt!398087))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11070 BitStream!11070 (_ BitVec 64) (_ BitVec 64)) Unit!18356)

(assert (=> b!256570 (= lt!398081 (validateOffsetBitsIneqLemma!0 (_1!11908 lt!397754) (_2!11913 lt!398082) lt!398086 lt!398087))))

(assert (=> b!256570 (= lt!398087 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!256570 (= lt!398086 (bvsub nBits!297 from!289))))

(declare-fun e!177774 () tuple2!21958)

(assert (=> b!256570 (= e!177774 (tuple2!21959 (_1!11913 lt!398083) (_2!11913 lt!398083)))))

(declare-fun b!256571 () Bool)

(declare-fun e!177776 () tuple2!21958)

(assert (=> b!256571 (= e!177776 (tuple2!21959 true (_1!11908 lt!397754)))))

(declare-fun b!256572 () Bool)

(declare-fun e!177773 () Bool)

(assert (=> b!256572 (= e!177773 e!177775)))

(declare-fun res!215097 () Bool)

(assert (=> b!256572 (=> res!215097 e!177775)))

(declare-fun lt!398088 () tuple2!21958)

(assert (=> b!256572 (= res!215097 (or (not (_1!11913 lt!398088)) (bvsge from!289 nBits!297)))))

(declare-fun b!256573 () Bool)

(assert (=> b!256573 (= e!177776 e!177774)))

(declare-fun readBit!0 (BitStream!11070) tuple2!21958)

(assert (=> b!256573 (= lt!398082 (readBit!0 (_1!11908 lt!397754)))))

(declare-fun c!11788 () Bool)

(assert (=> b!256573 (= c!11788 (not (= (_1!11913 lt!398082) bit!26)))))

(declare-fun lt!398079 () (_ BitVec 64))

(declare-fun e!177772 () Bool)

(declare-fun b!256574 () Bool)

(assert (=> b!256574 (= e!177772 (= (bvsub lt!398079 from!289) (bitIndex!0 (size!6074 (buf!6591 (_2!11913 lt!398088))) (currentByte!12070 (_2!11913 lt!398088)) (currentBit!12065 (_2!11913 lt!398088)))))))

(assert (=> b!256574 (or (= (bvand lt!398079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398079 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!398089 () (_ BitVec 64))

(assert (=> b!256574 (= lt!398079 (bvadd lt!398089 nBits!297))))

(assert (=> b!256574 (or (not (= (bvand lt!398089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398089 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!256574 (= lt!398089 (bitIndex!0 (size!6074 (buf!6591 (_1!11908 lt!397754))) (currentByte!12070 (_1!11908 lt!397754)) (currentBit!12065 (_1!11908 lt!397754))))))

(declare-fun b!256575 () Bool)

(declare-fun res!215099 () Bool)

(assert (=> b!256575 (=> (not res!215099) (not e!177773))))

(assert (=> b!256575 (= res!215099 (and (= (buf!6591 (_1!11908 lt!397754)) (buf!6591 (_2!11913 lt!398088))) (or (not (= nBits!297 from!289)) (_1!11913 lt!398088))))))

(declare-fun d!86028 () Bool)

(assert (=> d!86028 e!177773))

(declare-fun res!215096 () Bool)

(assert (=> d!86028 (=> (not res!215096) (not e!177773))))

(declare-fun lt!398085 () (_ BitVec 64))

(assert (=> d!86028 (= res!215096 (bvsge (bvsub lt!398085 from!289) (bitIndex!0 (size!6074 (buf!6591 (_2!11913 lt!398088))) (currentByte!12070 (_2!11913 lt!398088)) (currentBit!12065 (_2!11913 lt!398088)))))))

(assert (=> d!86028 (or (= (bvand lt!398085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398085 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!398080 () (_ BitVec 64))

(assert (=> d!86028 (= lt!398085 (bvadd lt!398080 nBits!297))))

(assert (=> d!86028 (or (not (= (bvand lt!398080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398080 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86028 (= lt!398080 (bitIndex!0 (size!6074 (buf!6591 (_1!11908 lt!397754))) (currentByte!12070 (_1!11908 lt!397754)) (currentBit!12065 (_1!11908 lt!397754))))))

(assert (=> d!86028 (= lt!398088 e!177776)))

(declare-fun c!11787 () Bool)

(assert (=> d!86028 (= c!11787 (= from!289 nBits!297))))

(assert (=> d!86028 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86028 (= (checkBitsLoop!0 (_1!11908 lt!397754) nBits!297 bit!26 from!289) lt!398088)))

(declare-fun b!256576 () Bool)

(declare-fun res!215100 () Bool)

(assert (=> b!256576 (=> (not res!215100) (not e!177773))))

(assert (=> b!256576 (= res!215100 e!177772)))

(declare-fun res!215098 () Bool)

(assert (=> b!256576 (=> res!215098 e!177772)))

(assert (=> b!256576 (= res!215098 (not (_1!11913 lt!398088)))))

(declare-fun b!256577 () Bool)

(assert (=> b!256577 (= e!177774 (tuple2!21959 false (_2!11913 lt!398082)))))

(assert (= (and d!86028 c!11787) b!256571))

(assert (= (and d!86028 (not c!11787)) b!256573))

(assert (= (and b!256573 c!11788) b!256577))

(assert (= (and b!256573 (not c!11788)) b!256570))

(assert (= (and d!86028 res!215096) b!256575))

(assert (= (and b!256575 res!215099) b!256576))

(assert (= (and b!256576 (not res!215098)) b!256574))

(assert (= (and b!256576 res!215100) b!256572))

(assert (= (and b!256572 (not res!215097)) b!256569))

(declare-fun m!386159 () Bool)

(assert (=> d!86028 m!386159))

(declare-fun m!386163 () Bool)

(assert (=> d!86028 m!386163))

(declare-fun m!386165 () Bool)

(assert (=> b!256573 m!386165))

(assert (=> b!256574 m!386159))

(assert (=> b!256574 m!386163))

(declare-fun m!386167 () Bool)

(assert (=> b!256569 m!386167))

(declare-fun m!386171 () Bool)

(assert (=> b!256570 m!386171))

(declare-fun m!386173 () Bool)

(assert (=> b!256570 m!386173))

(declare-fun m!386175 () Bool)

(assert (=> b!256570 m!386175))

(assert (=> d!85982 d!86028))

(declare-fun lt!398091 () (_ BitVec 32))

(declare-fun lt!398092 () (_ BitVec 32))

(declare-fun call!4012 () Bool)

(declare-fun lt!398090 () tuple4!308)

(declare-fun bm!4009 () Bool)

(declare-fun c!11789 () Bool)

(assert (=> bm!4009 (= call!4012 (byteRangesEq!0 (ite c!11789 (select (arr!7061 (buf!6591 thiss!1005)) (_3!934 lt!398090)) (select (arr!7061 (buf!6591 thiss!1005)) (_4!154 lt!398090))) (ite c!11789 (select (arr!7061 (buf!6591 thiss!1005)) (_3!934 lt!398090)) (select (arr!7061 (buf!6591 thiss!1005)) (_4!154 lt!398090))) (ite c!11789 lt!398091 #b00000000000000000000000000000000) lt!398092))))

(declare-fun b!256581 () Bool)

(declare-fun e!177782 () Bool)

(assert (=> b!256581 (= e!177782 call!4012)))

(declare-fun b!256582 () Bool)

(declare-fun e!177781 () Bool)

(declare-fun e!177784 () Bool)

(assert (=> b!256582 (= e!177781 e!177784)))

(declare-fun res!215104 () Bool)

(assert (=> b!256582 (=> (not res!215104) (not e!177784))))

(declare-fun e!177780 () Bool)

(assert (=> b!256582 (= res!215104 e!177780)))

(declare-fun res!215107 () Bool)

(assert (=> b!256582 (=> res!215107 e!177780)))

(assert (=> b!256582 (= res!215107 (bvsge (_1!11915 lt!398090) (_2!11915 lt!398090)))))

(assert (=> b!256582 (= lt!398092 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256582 (= lt!398091 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256582 (= lt!398090 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))))))

(declare-fun b!256583 () Bool)

(declare-fun e!177779 () Bool)

(assert (=> b!256583 (= e!177782 e!177779)))

(declare-fun res!215108 () Bool)

(assert (=> b!256583 (= res!215108 (byteRangesEq!0 (select (arr!7061 (buf!6591 thiss!1005)) (_3!934 lt!398090)) (select (arr!7061 (buf!6591 thiss!1005)) (_3!934 lt!398090)) lt!398091 #b00000000000000000000000000001000))))

(assert (=> b!256583 (=> (not res!215108) (not e!177779))))

(declare-fun b!256584 () Bool)

(assert (=> b!256584 (= e!177784 e!177782)))

(assert (=> b!256584 (= c!11789 (= (_3!934 lt!398090) (_4!154 lt!398090)))))

(declare-fun b!256585 () Bool)

(declare-fun res!215105 () Bool)

(assert (=> b!256585 (= res!215105 (= lt!398092 #b00000000000000000000000000000000))))

(declare-fun e!177783 () Bool)

(assert (=> b!256585 (=> res!215105 e!177783)))

(assert (=> b!256585 (= e!177779 e!177783)))

(declare-fun d!86040 () Bool)

(declare-fun res!215106 () Bool)

(assert (=> d!86040 (=> res!215106 e!177781)))

(assert (=> d!86040 (= res!215106 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))))))

(assert (=> d!86040 (= (arrayBitRangesEq!0 (buf!6591 thiss!1005) (buf!6591 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6074 (buf!6591 thiss!1005)) (currentByte!12070 thiss!1005) (currentBit!12065 thiss!1005))) e!177781)))

(declare-fun b!256586 () Bool)

(assert (=> b!256586 (= e!177780 (arrayRangesEq!931 (buf!6591 thiss!1005) (buf!6591 thiss!1005) (_1!11915 lt!398090) (_2!11915 lt!398090)))))

(declare-fun b!256587 () Bool)

(assert (=> b!256587 (= e!177783 call!4012)))

(assert (= (and d!86040 (not res!215106)) b!256582))

(assert (= (and b!256582 (not res!215107)) b!256586))

(assert (= (and b!256582 res!215104) b!256584))

(assert (= (and b!256584 c!11789) b!256581))

(assert (= (and b!256584 (not c!11789)) b!256583))

(assert (= (and b!256583 res!215108) b!256585))

(assert (= (and b!256585 (not res!215105)) b!256587))

(assert (= (or b!256581 b!256587) bm!4009))

(declare-fun m!386177 () Bool)

(assert (=> bm!4009 m!386177))

(declare-fun m!386179 () Bool)

(assert (=> bm!4009 m!386179))

(assert (=> bm!4009 m!386179))

(assert (=> bm!4009 m!386177))

(declare-fun m!386181 () Bool)

(assert (=> bm!4009 m!386181))

(assert (=> b!256582 m!385989))

(declare-fun m!386183 () Bool)

(assert (=> b!256582 m!386183))

(assert (=> b!256583 m!386179))

(assert (=> b!256583 m!386179))

(assert (=> b!256583 m!386179))

(assert (=> b!256583 m!386179))

(declare-fun m!386185 () Bool)

(assert (=> b!256583 m!386185))

(declare-fun m!386187 () Bool)

(assert (=> b!256586 m!386187))

(assert (=> b!256508 d!86040))

(assert (=> b!256508 d!85988))

(check-sat (not b!256543) (not bm!4008) (not b!256574) (not d!86008) (not b!256570) (not b!256582) (not b!256518) (not b!256583) (not d!86026) (not b!256512) (not b!256515) (not b!256586) (not b!256547) (not b!256517) (not b!256569) (not b!256573) (not b!256545) (not b!256520) (not b!256539) (not d!86010) (not b!256521) (not b!256523) (not d!86000) (not bm!4009) (not d!86028) (not d!86024) (not b!256540) (not d!86018) (not b!256514))
(check-sat)
