; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7768 () Bool)

(assert start!7768)

(declare-fun b!37977 () Bool)

(declare-fun e!24981 () Bool)

(declare-fun e!24974 () Bool)

(assert (=> b!37977 (= e!24981 e!24974)))

(declare-fun res!32283 () Bool)

(assert (=> b!37977 (=> res!32283 e!24974)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!57600 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!57598 () (_ BitVec 64))

(assert (=> b!37977 (= res!32283 (not (= lt!57600 (bvsub (bvadd lt!57598 to!314) i!635))))))

(declare-datatypes ((array!1948 0))(
  ( (array!1949 (arr!1368 (Array (_ BitVec 32) (_ BitVec 8))) (size!875 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1506 0))(
  ( (BitStream!1507 (buf!1203 array!1948) (currentByte!2609 (_ BitVec 32)) (currentBit!2604 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2747 0))(
  ( (Unit!2748) )
))
(declare-datatypes ((tuple2!3694 0))(
  ( (tuple2!3695 (_1!1934 Unit!2747) (_2!1934 BitStream!1506)) )
))
(declare-fun lt!57599 () tuple2!3694)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!37977 (= lt!57600 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57599))) (currentByte!2609 (_2!1934 lt!57599)) (currentBit!2604 (_2!1934 lt!57599))))))

(declare-fun b!37978 () Bool)

(declare-fun e!24977 () Bool)

(declare-fun e!24982 () Bool)

(assert (=> b!37978 (= e!24977 (not e!24982))))

(declare-fun res!32273 () Bool)

(assert (=> b!37978 (=> res!32273 e!24982)))

(assert (=> b!37978 (= res!32273 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1506)

(declare-fun isPrefixOf!0 (BitStream!1506 BitStream!1506) Bool)

(assert (=> b!37978 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!57605 () Unit!2747)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1506) Unit!2747)

(assert (=> b!37978 (= lt!57605 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!37978 (= lt!57598 (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)))))

(declare-fun b!37979 () Bool)

(declare-fun res!32280 () Bool)

(declare-fun e!24985 () Bool)

(assert (=> b!37979 (=> res!32280 e!24985)))

(declare-datatypes ((List!454 0))(
  ( (Nil!451) (Cons!450 (h!569 Bool) (t!1204 List!454)) )
))
(declare-fun lt!57596 () List!454)

(declare-fun length!180 (List!454) Int)

(assert (=> b!37979 (= res!32280 (<= (length!180 lt!57596) 0))))

(declare-fun b!37980 () Bool)

(declare-fun res!32289 () Bool)

(assert (=> b!37980 (=> res!32289 e!24974)))

(assert (=> b!37980 (= res!32289 (not (= (size!875 (buf!1203 thiss!1379)) (size!875 (buf!1203 (_2!1934 lt!57599))))))))

(declare-fun res!32279 () Bool)

(assert (=> start!7768 (=> (not res!32279) (not e!24977))))

(declare-fun srcBuffer!2 () array!1948)

(assert (=> start!7768 (= res!32279 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!875 srcBuffer!2))))))))

(assert (=> start!7768 e!24977))

(assert (=> start!7768 true))

(declare-fun array_inv!806 (array!1948) Bool)

(assert (=> start!7768 (array_inv!806 srcBuffer!2)))

(declare-fun e!24980 () Bool)

(declare-fun inv!12 (BitStream!1506) Bool)

(assert (=> start!7768 (and (inv!12 thiss!1379) e!24980)))

(declare-fun b!37981 () Bool)

(declare-fun e!24973 () Bool)

(assert (=> b!37981 (= e!24973 e!24981)))

(declare-fun res!32275 () Bool)

(assert (=> b!37981 (=> res!32275 e!24981)))

(declare-fun lt!57603 () tuple2!3694)

(assert (=> b!37981 (= res!32275 (not (isPrefixOf!0 (_2!1934 lt!57603) (_2!1934 lt!57599))))))

(assert (=> b!37981 (isPrefixOf!0 thiss!1379 (_2!1934 lt!57599))))

(declare-fun lt!57609 () Unit!2747)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1506 BitStream!1506 BitStream!1506) Unit!2747)

(assert (=> b!37981 (= lt!57609 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1934 lt!57603) (_2!1934 lt!57599)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1506 array!1948 (_ BitVec 64) (_ BitVec 64)) tuple2!3694)

(assert (=> b!37981 (= lt!57599 (appendBitsMSBFirstLoop!0 (_2!1934 lt!57603) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!24987 () Bool)

(assert (=> b!37981 e!24987))

(declare-fun res!32285 () Bool)

(assert (=> b!37981 (=> (not res!32285) (not e!24987))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!37981 (= res!32285 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57604 () Unit!2747)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1506 array!1948 (_ BitVec 64)) Unit!2747)

(assert (=> b!37981 (= lt!57604 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1203 (_2!1934 lt!57603)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3696 0))(
  ( (tuple2!3697 (_1!1935 BitStream!1506) (_2!1935 BitStream!1506)) )
))
(declare-fun lt!57615 () tuple2!3696)

(declare-fun reader!0 (BitStream!1506 BitStream!1506) tuple2!3696)

(assert (=> b!37981 (= lt!57615 (reader!0 thiss!1379 (_2!1934 lt!57603)))))

(declare-fun b!37982 () Bool)

(declare-fun res!32276 () Bool)

(declare-fun e!24979 () Bool)

(assert (=> b!37982 (=> res!32276 e!24979)))

(declare-fun lt!57597 () tuple2!3696)

(declare-fun lt!57616 () Bool)

(declare-datatypes ((tuple2!3698 0))(
  ( (tuple2!3699 (_1!1936 BitStream!1506) (_2!1936 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1506) tuple2!3698)

(assert (=> b!37982 (= res!32276 (not (= (_2!1936 (readBitPure!0 (_1!1935 lt!57597))) lt!57616)))))

(declare-fun b!37983 () Bool)

(assert (=> b!37983 (= e!24982 e!24973)))

(declare-fun res!32277 () Bool)

(assert (=> b!37983 (=> res!32277 e!24973)))

(assert (=> b!37983 (= res!32277 (not (isPrefixOf!0 thiss!1379 (_2!1934 lt!57603))))))

(declare-fun lt!57592 () (_ BitVec 64))

(assert (=> b!37983 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) lt!57592)))

(assert (=> b!37983 (= lt!57592 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57591 () Unit!2747)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1506 BitStream!1506 (_ BitVec 64) (_ BitVec 64)) Unit!2747)

(assert (=> b!37983 (= lt!57591 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1934 lt!57603) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1506 (_ BitVec 8) (_ BitVec 32)) tuple2!3694)

(assert (=> b!37983 (= lt!57603 (appendBitFromByte!0 thiss!1379 (select (arr!1368 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!37984 () Bool)

(declare-fun e!24978 () Bool)

(declare-fun e!24986 () Bool)

(assert (=> b!37984 (= e!24978 e!24986)))

(declare-fun res!32282 () Bool)

(assert (=> b!37984 (=> res!32282 e!24986)))

(declare-fun lt!57602 () tuple2!3696)

(declare-fun lt!57608 () Bool)

(declare-fun bitAt!0 (array!1948 (_ BitVec 64)) Bool)

(assert (=> b!37984 (= res!32282 (not (= lt!57608 (bitAt!0 (buf!1203 (_1!1935 lt!57602)) lt!57598))))))

(assert (=> b!37984 (= lt!57608 (bitAt!0 (buf!1203 (_1!1935 lt!57597)) lt!57598))))

(declare-fun b!37985 () Bool)

(assert (=> b!37985 (= e!24980 (array_inv!806 (buf!1203 thiss!1379)))))

(declare-fun b!37986 () Bool)

(declare-fun e!24976 () Bool)

(declare-fun e!24984 () Bool)

(assert (=> b!37986 (= e!24976 e!24984)))

(declare-fun res!32268 () Bool)

(assert (=> b!37986 (=> res!32268 e!24984)))

(declare-fun lt!57606 () Bool)

(assert (=> b!37986 (= res!32268 (not (= lt!57606 lt!57616)))))

(assert (=> b!37986 (= lt!57606 (bitAt!0 (buf!1203 (_2!1934 lt!57603)) lt!57598))))

(declare-fun b!37987 () Bool)

(declare-fun res!32288 () Bool)

(assert (=> b!37987 (=> (not res!32288) (not e!24977))))

(assert (=> b!37987 (= res!32288 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 thiss!1379))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!37988 () Bool)

(assert (=> b!37988 (= e!24984 e!24979)))

(declare-fun res!32278 () Bool)

(assert (=> b!37988 (=> res!32278 e!24979)))

(declare-fun lt!57612 () Bool)

(assert (=> b!37988 (= res!32278 (not (= lt!57612 lt!57616)))))

(assert (=> b!37988 (= lt!57606 lt!57612)))

(assert (=> b!37988 (= lt!57612 (bitAt!0 (buf!1203 (_2!1934 lt!57599)) lt!57598))))

(declare-fun lt!57595 () Unit!2747)

(declare-fun lt!57601 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1948 array!1948 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2747)

(assert (=> b!37988 (= lt!57595 (arrayBitRangesEqImpliesEq!0 (buf!1203 (_2!1934 lt!57603)) (buf!1203 (_2!1934 lt!57599)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57598 lt!57601))))

(declare-fun b!37989 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!37989 (= e!24979 (invariant!0 (currentBit!2604 thiss!1379) (currentByte!2609 thiss!1379) (size!875 (buf!1203 thiss!1379))))))

(declare-fun b!37990 () Bool)

(assert (=> b!37990 (= e!24985 e!24978)))

(declare-fun res!32286 () Bool)

(assert (=> b!37990 (=> res!32286 e!24978)))

(declare-fun lt!57594 () List!454)

(declare-fun lt!57593 () List!454)

(assert (=> b!37990 (= res!32286 (not (= lt!57594 lt!57593)))))

(assert (=> b!37990 (= lt!57593 lt!57594)))

(declare-fun tail!171 (List!454) List!454)

(assert (=> b!37990 (= lt!57594 (tail!171 lt!57596))))

(declare-fun lt!57607 () Unit!2747)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1506 BitStream!1506 BitStream!1506 BitStream!1506 (_ BitVec 64) List!454) Unit!2747)

(assert (=> b!37990 (= lt!57607 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1934 lt!57599) (_2!1934 lt!57599) (_1!1935 lt!57597) (_1!1935 lt!57602) (bvsub to!314 i!635) lt!57596))))

(declare-fun b!37991 () Bool)

(declare-fun e!24975 () Bool)

(assert (=> b!37991 (= e!24974 e!24975)))

(declare-fun res!32287 () Bool)

(assert (=> b!37991 (=> res!32287 e!24975)))

(assert (=> b!37991 (= res!32287 (not (= (size!875 (buf!1203 (_2!1934 lt!57603))) (size!875 (buf!1203 (_2!1934 lt!57599))))))))

(assert (=> b!37991 (= lt!57600 (bvsub (bvsub (bvadd lt!57601 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!37991 (= lt!57601 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))))))

(assert (=> b!37991 (= (size!875 (buf!1203 (_2!1934 lt!57599))) (size!875 (buf!1203 thiss!1379)))))

(declare-fun b!37992 () Bool)

(declare-fun res!32274 () Bool)

(assert (=> b!37992 (=> res!32274 e!24975)))

(assert (=> b!37992 (= res!32274 (not (invariant!0 (currentBit!2604 (_2!1934 lt!57603)) (currentByte!2609 (_2!1934 lt!57603)) (size!875 (buf!1203 (_2!1934 lt!57603))))))))

(declare-fun b!37993 () Bool)

(declare-fun res!32281 () Bool)

(assert (=> b!37993 (=> res!32281 e!24975)))

(assert (=> b!37993 (= res!32281 (not (invariant!0 (currentBit!2604 (_2!1934 lt!57603)) (currentByte!2609 (_2!1934 lt!57603)) (size!875 (buf!1203 (_2!1934 lt!57599))))))))

(declare-fun b!37994 () Bool)

(declare-fun res!32284 () Bool)

(assert (=> b!37994 (=> res!32284 e!24979)))

(declare-fun lt!57614 () Bool)

(declare-fun lt!57611 () Bool)

(assert (=> b!37994 (= res!32284 (not (= lt!57614 lt!57611)))))

(declare-fun b!37995 () Bool)

(declare-fun res!32270 () Bool)

(assert (=> b!37995 (=> res!32270 e!24974)))

(assert (=> b!37995 (= res!32270 (not (invariant!0 (currentBit!2604 (_2!1934 lt!57599)) (currentByte!2609 (_2!1934 lt!57599)) (size!875 (buf!1203 (_2!1934 lt!57599))))))))

(declare-fun b!37996 () Bool)

(declare-fun e!24972 () Bool)

(assert (=> b!37996 (= e!24986 e!24972)))

(declare-fun res!32271 () Bool)

(assert (=> b!37996 (=> res!32271 e!24972)))

(assert (=> b!37996 (= res!32271 (not (= lt!57614 lt!57608)))))

(declare-fun head!291 (List!454) Bool)

(assert (=> b!37996 (= lt!57614 (head!291 lt!57596))))

(declare-fun b!37997 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1506 array!1948 (_ BitVec 64) (_ BitVec 64)) List!454)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1506 BitStream!1506 (_ BitVec 64)) List!454)

(assert (=> b!37997 (= e!24987 (= (head!291 (byteArrayBitContentToList!0 (_2!1934 lt!57603) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!291 (bitStreamReadBitsIntoList!0 (_2!1934 lt!57603) (_1!1935 lt!57615) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!37998 () Bool)

(assert (=> b!37998 (= e!24972 e!24976)))

(declare-fun res!32272 () Bool)

(assert (=> b!37998 (=> res!32272 e!24976)))

(assert (=> b!37998 (= res!32272 (not (= lt!57611 lt!57616)))))

(assert (=> b!37998 (= lt!57616 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!37998 (= lt!57611 (head!291 (byteArrayBitContentToList!0 (_2!1934 lt!57599) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!37999 () Bool)

(assert (=> b!37999 (= e!24975 e!24985)))

(declare-fun res!32269 () Bool)

(assert (=> b!37999 (=> res!32269 e!24985)))

(assert (=> b!37999 (= res!32269 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!37999 (= lt!57593 (bitStreamReadBitsIntoList!0 (_2!1934 lt!57599) (_1!1935 lt!57602) lt!57592))))

(assert (=> b!37999 (= lt!57596 (bitStreamReadBitsIntoList!0 (_2!1934 lt!57599) (_1!1935 lt!57597) (bvsub to!314 i!635)))))

(assert (=> b!37999 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) lt!57592)))

(declare-fun lt!57613 () Unit!2747)

(assert (=> b!37999 (= lt!57613 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1934 lt!57603) (buf!1203 (_2!1934 lt!57599)) lt!57592))))

(assert (=> b!37999 (= lt!57602 (reader!0 (_2!1934 lt!57603) (_2!1934 lt!57599)))))

(assert (=> b!37999 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!57610 () Unit!2747)

(assert (=> b!37999 (= lt!57610 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1203 (_2!1934 lt!57599)) (bvsub to!314 i!635)))))

(assert (=> b!37999 (= lt!57597 (reader!0 thiss!1379 (_2!1934 lt!57599)))))

(assert (= (and start!7768 res!32279) b!37987))

(assert (= (and b!37987 res!32288) b!37978))

(assert (= (and b!37978 (not res!32273)) b!37983))

(assert (= (and b!37983 (not res!32277)) b!37981))

(assert (= (and b!37981 res!32285) b!37997))

(assert (= (and b!37981 (not res!32275)) b!37977))

(assert (= (and b!37977 (not res!32283)) b!37995))

(assert (= (and b!37995 (not res!32270)) b!37980))

(assert (= (and b!37980 (not res!32289)) b!37991))

(assert (= (and b!37991 (not res!32287)) b!37992))

(assert (= (and b!37992 (not res!32274)) b!37993))

(assert (= (and b!37993 (not res!32281)) b!37999))

(assert (= (and b!37999 (not res!32269)) b!37979))

(assert (= (and b!37979 (not res!32280)) b!37990))

(assert (= (and b!37990 (not res!32286)) b!37984))

(assert (= (and b!37984 (not res!32282)) b!37996))

(assert (= (and b!37996 (not res!32271)) b!37998))

(assert (= (and b!37998 (not res!32272)) b!37986))

(assert (= (and b!37986 (not res!32268)) b!37988))

(assert (= (and b!37988 (not res!32278)) b!37982))

(assert (= (and b!37982 (not res!32276)) b!37994))

(assert (= (and b!37994 (not res!32284)) b!37989))

(assert (= start!7768 b!37985))

(declare-fun m!57691 () Bool)

(assert (=> b!37991 m!57691))

(declare-fun m!57693 () Bool)

(assert (=> b!37984 m!57693))

(declare-fun m!57695 () Bool)

(assert (=> b!37984 m!57695))

(declare-fun m!57697 () Bool)

(assert (=> b!37995 m!57697))

(declare-fun m!57699 () Bool)

(assert (=> b!37996 m!57699))

(declare-fun m!57701 () Bool)

(assert (=> b!37983 m!57701))

(declare-fun m!57703 () Bool)

(assert (=> b!37983 m!57703))

(declare-fun m!57705 () Bool)

(assert (=> b!37983 m!57705))

(declare-fun m!57707 () Bool)

(assert (=> b!37983 m!57707))

(assert (=> b!37983 m!57703))

(declare-fun m!57709 () Bool)

(assert (=> b!37983 m!57709))

(declare-fun m!57711 () Bool)

(assert (=> b!37993 m!57711))

(declare-fun m!57713 () Bool)

(assert (=> b!37999 m!57713))

(declare-fun m!57715 () Bool)

(assert (=> b!37999 m!57715))

(declare-fun m!57717 () Bool)

(assert (=> b!37999 m!57717))

(declare-fun m!57719 () Bool)

(assert (=> b!37999 m!57719))

(declare-fun m!57721 () Bool)

(assert (=> b!37999 m!57721))

(declare-fun m!57723 () Bool)

(assert (=> b!37999 m!57723))

(declare-fun m!57725 () Bool)

(assert (=> b!37999 m!57725))

(declare-fun m!57727 () Bool)

(assert (=> b!37999 m!57727))

(declare-fun m!57729 () Bool)

(assert (=> b!37992 m!57729))

(declare-fun m!57731 () Bool)

(assert (=> b!37979 m!57731))

(declare-fun m!57733 () Bool)

(assert (=> b!37997 m!57733))

(assert (=> b!37997 m!57733))

(declare-fun m!57735 () Bool)

(assert (=> b!37997 m!57735))

(declare-fun m!57737 () Bool)

(assert (=> b!37997 m!57737))

(assert (=> b!37997 m!57737))

(declare-fun m!57739 () Bool)

(assert (=> b!37997 m!57739))

(declare-fun m!57741 () Bool)

(assert (=> b!37982 m!57741))

(declare-fun m!57743 () Bool)

(assert (=> b!37986 m!57743))

(declare-fun m!57745 () Bool)

(assert (=> b!37981 m!57745))

(declare-fun m!57747 () Bool)

(assert (=> b!37981 m!57747))

(declare-fun m!57749 () Bool)

(assert (=> b!37981 m!57749))

(declare-fun m!57751 () Bool)

(assert (=> b!37981 m!57751))

(declare-fun m!57753 () Bool)

(assert (=> b!37981 m!57753))

(declare-fun m!57755 () Bool)

(assert (=> b!37981 m!57755))

(declare-fun m!57757 () Bool)

(assert (=> b!37981 m!57757))

(declare-fun m!57759 () Bool)

(assert (=> b!37978 m!57759))

(declare-fun m!57761 () Bool)

(assert (=> b!37978 m!57761))

(declare-fun m!57763 () Bool)

(assert (=> b!37978 m!57763))

(declare-fun m!57765 () Bool)

(assert (=> b!37989 m!57765))

(declare-fun m!57767 () Bool)

(assert (=> b!37998 m!57767))

(declare-fun m!57769 () Bool)

(assert (=> b!37998 m!57769))

(assert (=> b!37998 m!57769))

(declare-fun m!57771 () Bool)

(assert (=> b!37998 m!57771))

(declare-fun m!57773 () Bool)

(assert (=> b!37988 m!57773))

(declare-fun m!57775 () Bool)

(assert (=> b!37988 m!57775))

(declare-fun m!57777 () Bool)

(assert (=> b!37977 m!57777))

(declare-fun m!57779 () Bool)

(assert (=> b!37985 m!57779))

(declare-fun m!57781 () Bool)

(assert (=> b!37987 m!57781))

(declare-fun m!57783 () Bool)

(assert (=> start!7768 m!57783))

(declare-fun m!57785 () Bool)

(assert (=> start!7768 m!57785))

(declare-fun m!57787 () Bool)

(assert (=> b!37990 m!57787))

(declare-fun m!57789 () Bool)

(assert (=> b!37990 m!57789))

(check-sat (not b!37987) (not b!37988) (not b!37982) (not b!37990) (not b!37979) (not start!7768) (not b!37978) (not b!37977) (not b!37985) (not b!37983) (not b!37998) (not b!37995) (not b!37984) (not b!37986) (not b!37989) (not b!37992) (not b!37996) (not b!37999) (not b!37991) (not b!37981) (not b!37993) (not b!37997))
(check-sat)
(get-model)

(declare-fun d!11322 () Bool)

(declare-fun res!32363 () Bool)

(declare-fun e!25045 () Bool)

(assert (=> d!11322 (=> (not res!32363) (not e!25045))))

(assert (=> d!11322 (= res!32363 (= (size!875 (buf!1203 thiss!1379)) (size!875 (buf!1203 (_2!1934 lt!57603)))))))

(assert (=> d!11322 (= (isPrefixOf!0 thiss!1379 (_2!1934 lt!57603)) e!25045)))

(declare-fun b!38075 () Bool)

(declare-fun res!32364 () Bool)

(assert (=> b!38075 (=> (not res!32364) (not e!25045))))

(assert (=> b!38075 (= res!32364 (bvsle (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)) (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603)))))))

(declare-fun b!38076 () Bool)

(declare-fun e!25044 () Bool)

(assert (=> b!38076 (= e!25045 e!25044)))

(declare-fun res!32362 () Bool)

(assert (=> b!38076 (=> res!32362 e!25044)))

(assert (=> b!38076 (= res!32362 (= (size!875 (buf!1203 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!38077 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1948 array!1948 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38077 (= e!25044 (arrayBitRangesEq!0 (buf!1203 thiss!1379) (buf!1203 (_2!1934 lt!57603)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379))))))

(assert (= (and d!11322 res!32363) b!38075))

(assert (= (and b!38075 res!32364) b!38076))

(assert (= (and b!38076 (not res!32362)) b!38077))

(assert (=> b!38075 m!57763))

(assert (=> b!38075 m!57691))

(assert (=> b!38077 m!57763))

(assert (=> b!38077 m!57763))

(declare-fun m!57891 () Bool)

(assert (=> b!38077 m!57891))

(assert (=> b!37983 d!11322))

(declare-fun d!11324 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11324 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) lt!57592) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603)))) lt!57592))))

(declare-fun bs!3017 () Bool)

(assert (= bs!3017 d!11324))

(declare-fun m!57893 () Bool)

(assert (=> bs!3017 m!57893))

(assert (=> b!37983 d!11324))

(declare-fun d!11326 () Bool)

(declare-fun e!25048 () Bool)

(assert (=> d!11326 e!25048))

(declare-fun res!32367 () Bool)

(assert (=> d!11326 (=> (not res!32367) (not e!25048))))

(assert (=> d!11326 (= res!32367 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!57697 () Unit!2747)

(declare-fun choose!27 (BitStream!1506 BitStream!1506 (_ BitVec 64) (_ BitVec 64)) Unit!2747)

(assert (=> d!11326 (= lt!57697 (choose!27 thiss!1379 (_2!1934 lt!57603) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!11326 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!11326 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1934 lt!57603) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!57697)))

(declare-fun b!38080 () Bool)

(assert (=> b!38080 (= e!25048 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11326 res!32367) b!38080))

(declare-fun m!57895 () Bool)

(assert (=> d!11326 m!57895))

(declare-fun m!57897 () Bool)

(assert (=> b!38080 m!57897))

(assert (=> b!37983 d!11326))

(declare-fun b!38098 () Bool)

(declare-fun e!25057 () Bool)

(declare-fun e!25059 () Bool)

(assert (=> b!38098 (= e!25057 e!25059)))

(declare-fun res!32385 () Bool)

(assert (=> b!38098 (=> (not res!32385) (not e!25059))))

(declare-fun lt!57728 () (_ BitVec 8))

(declare-fun lt!57722 () tuple2!3694)

(declare-fun lt!57731 () tuple2!3698)

(assert (=> b!38098 (= res!32385 (and (= (_2!1936 lt!57731) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1368 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!57728)) #b00000000000000000000000000000000))) (= (_1!1936 lt!57731) (_2!1934 lt!57722))))))

(declare-datatypes ((tuple2!3706 0))(
  ( (tuple2!3707 (_1!1940 array!1948) (_2!1940 BitStream!1506)) )
))
(declare-fun lt!57727 () tuple2!3706)

(declare-fun lt!57732 () BitStream!1506)

(declare-fun readBits!0 (BitStream!1506 (_ BitVec 64)) tuple2!3706)

(assert (=> b!38098 (= lt!57727 (readBits!0 lt!57732 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38098 (= lt!57731 (readBitPure!0 lt!57732))))

(declare-fun readerFrom!0 (BitStream!1506 (_ BitVec 32) (_ BitVec 32)) BitStream!1506)

(assert (=> b!38098 (= lt!57732 (readerFrom!0 (_2!1934 lt!57722) (currentBit!2604 thiss!1379) (currentByte!2609 thiss!1379)))))

(declare-fun b!38099 () Bool)

(declare-fun res!32387 () Bool)

(assert (=> b!38099 (=> (not res!32387) (not e!25057))))

(assert (=> b!38099 (= res!32387 (isPrefixOf!0 thiss!1379 (_2!1934 lt!57722)))))

(declare-fun b!38100 () Bool)

(declare-fun e!25058 () Bool)

(declare-fun e!25060 () Bool)

(assert (=> b!38100 (= e!25058 e!25060)))

(declare-fun res!32391 () Bool)

(assert (=> b!38100 (=> (not res!32391) (not e!25060))))

(declare-fun lt!57725 () tuple2!3694)

(declare-fun lt!57729 () tuple2!3698)

(declare-fun lt!57733 () Bool)

(assert (=> b!38100 (= res!32391 (and (= (_2!1936 lt!57729) lt!57733) (= (_1!1936 lt!57729) (_2!1934 lt!57725))))))

(assert (=> b!38100 (= lt!57729 (readBitPure!0 (readerFrom!0 (_2!1934 lt!57725) (currentBit!2604 thiss!1379) (currentByte!2609 thiss!1379))))))

(declare-fun b!38101 () Bool)

(declare-fun res!32384 () Bool)

(assert (=> b!38101 (=> (not res!32384) (not e!25057))))

(declare-fun lt!57730 () (_ BitVec 64))

(declare-fun lt!57726 () (_ BitVec 64))

(assert (=> b!38101 (= res!32384 (= (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57722))) (currentByte!2609 (_2!1934 lt!57722)) (currentBit!2604 (_2!1934 lt!57722))) (bvadd lt!57730 lt!57726)))))

(assert (=> b!38101 (or (not (= (bvand lt!57730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!57726 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!57730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!57730 lt!57726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38101 (= lt!57726 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!38101 (= lt!57730 (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)))))

(declare-fun b!38102 () Bool)

(declare-fun res!32389 () Bool)

(assert (=> b!38102 (=> (not res!32389) (not e!25058))))

(assert (=> b!38102 (= res!32389 (= (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57725))) (currentByte!2609 (_2!1934 lt!57725)) (currentBit!2604 (_2!1934 lt!57725))) (bvadd (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!38103 () Bool)

(assert (=> b!38103 (= e!25060 (= (bitIndex!0 (size!875 (buf!1203 (_1!1936 lt!57729))) (currentByte!2609 (_1!1936 lt!57729)) (currentBit!2604 (_1!1936 lt!57729))) (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57725))) (currentByte!2609 (_2!1934 lt!57725)) (currentBit!2604 (_2!1934 lt!57725)))))))

(declare-fun d!11328 () Bool)

(assert (=> d!11328 e!25057))

(declare-fun res!32386 () Bool)

(assert (=> d!11328 (=> (not res!32386) (not e!25057))))

(assert (=> d!11328 (= res!32386 (= (size!875 (buf!1203 (_2!1934 lt!57722))) (size!875 (buf!1203 thiss!1379))))))

(declare-fun lt!57724 () array!1948)

(assert (=> d!11328 (= lt!57728 (select (arr!1368 lt!57724) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!11328 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!875 lt!57724)))))

(assert (=> d!11328 (= lt!57724 (array!1949 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!57723 () tuple2!3694)

(assert (=> d!11328 (= lt!57722 (tuple2!3695 (_1!1934 lt!57723) (_2!1934 lt!57723)))))

(assert (=> d!11328 (= lt!57723 lt!57725)))

(assert (=> d!11328 e!25058))

(declare-fun res!32388 () Bool)

(assert (=> d!11328 (=> (not res!32388) (not e!25058))))

(assert (=> d!11328 (= res!32388 (= (size!875 (buf!1203 thiss!1379)) (size!875 (buf!1203 (_2!1934 lt!57725)))))))

(declare-fun appendBit!0 (BitStream!1506 Bool) tuple2!3694)

(assert (=> d!11328 (= lt!57725 (appendBit!0 thiss!1379 lt!57733))))

(assert (=> d!11328 (= lt!57733 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1368 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!11328 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!11328 (= (appendBitFromByte!0 thiss!1379 (select (arr!1368 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!57722)))

(declare-fun b!38104 () Bool)

(declare-fun res!32390 () Bool)

(assert (=> b!38104 (=> (not res!32390) (not e!25058))))

(assert (=> b!38104 (= res!32390 (isPrefixOf!0 thiss!1379 (_2!1934 lt!57725)))))

(declare-fun b!38105 () Bool)

(assert (=> b!38105 (= e!25059 (= (bitIndex!0 (size!875 (buf!1203 (_1!1936 lt!57731))) (currentByte!2609 (_1!1936 lt!57731)) (currentBit!2604 (_1!1936 lt!57731))) (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57722))) (currentByte!2609 (_2!1934 lt!57722)) (currentBit!2604 (_2!1934 lt!57722)))))))

(assert (= (and d!11328 res!32388) b!38102))

(assert (= (and b!38102 res!32389) b!38104))

(assert (= (and b!38104 res!32390) b!38100))

(assert (= (and b!38100 res!32391) b!38103))

(assert (= (and d!11328 res!32386) b!38101))

(assert (= (and b!38101 res!32384) b!38099))

(assert (= (and b!38099 res!32387) b!38098))

(assert (= (and b!38098 res!32385) b!38105))

(declare-fun m!57899 () Bool)

(assert (=> d!11328 m!57899))

(declare-fun m!57901 () Bool)

(assert (=> d!11328 m!57901))

(declare-fun m!57903 () Bool)

(assert (=> d!11328 m!57903))

(declare-fun m!57905 () Bool)

(assert (=> b!38099 m!57905))

(declare-fun m!57907 () Bool)

(assert (=> b!38104 m!57907))

(declare-fun m!57909 () Bool)

(assert (=> b!38100 m!57909))

(assert (=> b!38100 m!57909))

(declare-fun m!57911 () Bool)

(assert (=> b!38100 m!57911))

(declare-fun m!57913 () Bool)

(assert (=> b!38098 m!57913))

(declare-fun m!57915 () Bool)

(assert (=> b!38098 m!57915))

(declare-fun m!57917 () Bool)

(assert (=> b!38098 m!57917))

(declare-fun m!57919 () Bool)

(assert (=> b!38101 m!57919))

(assert (=> b!38101 m!57763))

(declare-fun m!57921 () Bool)

(assert (=> b!38103 m!57921))

(declare-fun m!57923 () Bool)

(assert (=> b!38103 m!57923))

(declare-fun m!57925 () Bool)

(assert (=> b!38105 m!57925))

(assert (=> b!38105 m!57919))

(assert (=> b!38102 m!57923))

(assert (=> b!38102 m!57763))

(assert (=> b!37983 d!11328))

(declare-fun d!11330 () Bool)

(declare-datatypes ((tuple2!3708 0))(
  ( (tuple2!3709 (_1!1941 Bool) (_2!1941 BitStream!1506)) )
))
(declare-fun lt!57736 () tuple2!3708)

(declare-fun readBit!0 (BitStream!1506) tuple2!3708)

(assert (=> d!11330 (= lt!57736 (readBit!0 (_1!1935 lt!57597)))))

(assert (=> d!11330 (= (readBitPure!0 (_1!1935 lt!57597)) (tuple2!3699 (_2!1941 lt!57736) (_1!1941 lt!57736)))))

(declare-fun bs!3018 () Bool)

(assert (= bs!3018 d!11330))

(declare-fun m!57927 () Bool)

(assert (=> bs!3018 m!57927))

(assert (=> b!37982 d!11330))

(declare-fun d!11332 () Bool)

(assert (=> d!11332 (= (invariant!0 (currentBit!2604 (_2!1934 lt!57603)) (currentByte!2609 (_2!1934 lt!57603)) (size!875 (buf!1203 (_2!1934 lt!57599)))) (and (bvsge (currentBit!2604 (_2!1934 lt!57603)) #b00000000000000000000000000000000) (bvslt (currentBit!2604 (_2!1934 lt!57603)) #b00000000000000000000000000001000) (bvsge (currentByte!2609 (_2!1934 lt!57603)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2609 (_2!1934 lt!57603)) (size!875 (buf!1203 (_2!1934 lt!57599)))) (and (= (currentBit!2604 (_2!1934 lt!57603)) #b00000000000000000000000000000000) (= (currentByte!2609 (_2!1934 lt!57603)) (size!875 (buf!1203 (_2!1934 lt!57599))))))))))

(assert (=> b!37993 d!11332))

(declare-fun d!11334 () Bool)

(assert (=> d!11334 (= (invariant!0 (currentBit!2604 (_2!1934 lt!57603)) (currentByte!2609 (_2!1934 lt!57603)) (size!875 (buf!1203 (_2!1934 lt!57603)))) (and (bvsge (currentBit!2604 (_2!1934 lt!57603)) #b00000000000000000000000000000000) (bvslt (currentBit!2604 (_2!1934 lt!57603)) #b00000000000000000000000000001000) (bvsge (currentByte!2609 (_2!1934 lt!57603)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2609 (_2!1934 lt!57603)) (size!875 (buf!1203 (_2!1934 lt!57603)))) (and (= (currentBit!2604 (_2!1934 lt!57603)) #b00000000000000000000000000000000) (= (currentByte!2609 (_2!1934 lt!57603)) (size!875 (buf!1203 (_2!1934 lt!57603))))))))))

(assert (=> b!37992 d!11334))

(declare-fun d!11336 () Bool)

(declare-fun res!32393 () Bool)

(declare-fun e!25062 () Bool)

(assert (=> d!11336 (=> (not res!32393) (not e!25062))))

(assert (=> d!11336 (= res!32393 (= (size!875 (buf!1203 thiss!1379)) (size!875 (buf!1203 (_2!1934 lt!57599)))))))

(assert (=> d!11336 (= (isPrefixOf!0 thiss!1379 (_2!1934 lt!57599)) e!25062)))

(declare-fun b!38106 () Bool)

(declare-fun res!32394 () Bool)

(assert (=> b!38106 (=> (not res!32394) (not e!25062))))

(assert (=> b!38106 (= res!32394 (bvsle (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)) (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57599))) (currentByte!2609 (_2!1934 lt!57599)) (currentBit!2604 (_2!1934 lt!57599)))))))

(declare-fun b!38107 () Bool)

(declare-fun e!25061 () Bool)

(assert (=> b!38107 (= e!25062 e!25061)))

(declare-fun res!32392 () Bool)

(assert (=> b!38107 (=> res!32392 e!25061)))

(assert (=> b!38107 (= res!32392 (= (size!875 (buf!1203 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!38108 () Bool)

(assert (=> b!38108 (= e!25061 (arrayBitRangesEq!0 (buf!1203 thiss!1379) (buf!1203 (_2!1934 lt!57599)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379))))))

(assert (= (and d!11336 res!32393) b!38106))

(assert (= (and b!38106 res!32394) b!38107))

(assert (= (and b!38107 (not res!32392)) b!38108))

(assert (=> b!38106 m!57763))

(assert (=> b!38106 m!57777))

(assert (=> b!38108 m!57763))

(assert (=> b!38108 m!57763))

(declare-fun m!57929 () Bool)

(assert (=> b!38108 m!57929))

(assert (=> b!37981 d!11336))

(declare-fun d!11338 () Bool)

(assert (=> d!11338 (isPrefixOf!0 thiss!1379 (_2!1934 lt!57599))))

(declare-fun lt!57739 () Unit!2747)

(declare-fun choose!30 (BitStream!1506 BitStream!1506 BitStream!1506) Unit!2747)

(assert (=> d!11338 (= lt!57739 (choose!30 thiss!1379 (_2!1934 lt!57603) (_2!1934 lt!57599)))))

(assert (=> d!11338 (isPrefixOf!0 thiss!1379 (_2!1934 lt!57603))))

(assert (=> d!11338 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1934 lt!57603) (_2!1934 lt!57599)) lt!57739)))

(declare-fun bs!3019 () Bool)

(assert (= bs!3019 d!11338))

(assert (=> bs!3019 m!57753))

(declare-fun m!57931 () Bool)

(assert (=> bs!3019 m!57931))

(assert (=> bs!3019 m!57701))

(assert (=> b!37981 d!11338))

(declare-fun d!11340 () Bool)

(declare-fun e!25067 () Bool)

(assert (=> d!11340 e!25067))

(declare-fun res!32402 () Bool)

(assert (=> d!11340 (=> (not res!32402) (not e!25067))))

(declare-fun lt!57784 () tuple2!3696)

(assert (=> d!11340 (= res!32402 (isPrefixOf!0 (_1!1935 lt!57784) (_2!1935 lt!57784)))))

(declare-fun lt!57789 () BitStream!1506)

(assert (=> d!11340 (= lt!57784 (tuple2!3697 lt!57789 (_2!1934 lt!57603)))))

(declare-fun lt!57793 () Unit!2747)

(declare-fun lt!57796 () Unit!2747)

(assert (=> d!11340 (= lt!57793 lt!57796)))

(assert (=> d!11340 (isPrefixOf!0 lt!57789 (_2!1934 lt!57603))))

(assert (=> d!11340 (= lt!57796 (lemmaIsPrefixTransitive!0 lt!57789 (_2!1934 lt!57603) (_2!1934 lt!57603)))))

(declare-fun lt!57785 () Unit!2747)

(declare-fun lt!57790 () Unit!2747)

(assert (=> d!11340 (= lt!57785 lt!57790)))

(assert (=> d!11340 (isPrefixOf!0 lt!57789 (_2!1934 lt!57603))))

(assert (=> d!11340 (= lt!57790 (lemmaIsPrefixTransitive!0 lt!57789 thiss!1379 (_2!1934 lt!57603)))))

(declare-fun lt!57786 () Unit!2747)

(declare-fun e!25068 () Unit!2747)

(assert (=> d!11340 (= lt!57786 e!25068)))

(declare-fun c!2622 () Bool)

(assert (=> d!11340 (= c!2622 (not (= (size!875 (buf!1203 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!57782 () Unit!2747)

(declare-fun lt!57794 () Unit!2747)

(assert (=> d!11340 (= lt!57782 lt!57794)))

(assert (=> d!11340 (isPrefixOf!0 (_2!1934 lt!57603) (_2!1934 lt!57603))))

(assert (=> d!11340 (= lt!57794 (lemmaIsPrefixRefl!0 (_2!1934 lt!57603)))))

(declare-fun lt!57783 () Unit!2747)

(declare-fun lt!57780 () Unit!2747)

(assert (=> d!11340 (= lt!57783 lt!57780)))

(assert (=> d!11340 (= lt!57780 (lemmaIsPrefixRefl!0 (_2!1934 lt!57603)))))

(declare-fun lt!57791 () Unit!2747)

(declare-fun lt!57797 () Unit!2747)

(assert (=> d!11340 (= lt!57791 lt!57797)))

(assert (=> d!11340 (isPrefixOf!0 lt!57789 lt!57789)))

(assert (=> d!11340 (= lt!57797 (lemmaIsPrefixRefl!0 lt!57789))))

(declare-fun lt!57795 () Unit!2747)

(declare-fun lt!57787 () Unit!2747)

(assert (=> d!11340 (= lt!57795 lt!57787)))

(assert (=> d!11340 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11340 (= lt!57787 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11340 (= lt!57789 (BitStream!1507 (buf!1203 (_2!1934 lt!57603)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)))))

(assert (=> d!11340 (isPrefixOf!0 thiss!1379 (_2!1934 lt!57603))))

(assert (=> d!11340 (= (reader!0 thiss!1379 (_2!1934 lt!57603)) lt!57784)))

(declare-fun b!38119 () Bool)

(declare-fun res!32403 () Bool)

(assert (=> b!38119 (=> (not res!32403) (not e!25067))))

(assert (=> b!38119 (= res!32403 (isPrefixOf!0 (_2!1935 lt!57784) (_2!1934 lt!57603)))))

(declare-fun lt!57798 () (_ BitVec 64))

(declare-fun lt!57781 () (_ BitVec 64))

(declare-fun b!38120 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1506 (_ BitVec 64)) BitStream!1506)

(assert (=> b!38120 (= e!25067 (= (_1!1935 lt!57784) (withMovedBitIndex!0 (_2!1935 lt!57784) (bvsub lt!57798 lt!57781))))))

(assert (=> b!38120 (or (= (bvand lt!57798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!57781 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!57798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!57798 lt!57781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38120 (= lt!57781 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))))))

(assert (=> b!38120 (= lt!57798 (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)))))

(declare-fun b!38121 () Bool)

(declare-fun Unit!2751 () Unit!2747)

(assert (=> b!38121 (= e!25068 Unit!2751)))

(declare-fun b!38122 () Bool)

(declare-fun lt!57788 () Unit!2747)

(assert (=> b!38122 (= e!25068 lt!57788)))

(declare-fun lt!57799 () (_ BitVec 64))

(assert (=> b!38122 (= lt!57799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57792 () (_ BitVec 64))

(assert (=> b!38122 (= lt!57792 (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1948 array!1948 (_ BitVec 64) (_ BitVec 64)) Unit!2747)

(assert (=> b!38122 (= lt!57788 (arrayBitRangesEqSymmetric!0 (buf!1203 thiss!1379) (buf!1203 (_2!1934 lt!57603)) lt!57799 lt!57792))))

(assert (=> b!38122 (arrayBitRangesEq!0 (buf!1203 (_2!1934 lt!57603)) (buf!1203 thiss!1379) lt!57799 lt!57792)))

(declare-fun b!38123 () Bool)

(declare-fun res!32401 () Bool)

(assert (=> b!38123 (=> (not res!32401) (not e!25067))))

(assert (=> b!38123 (= res!32401 (isPrefixOf!0 (_1!1935 lt!57784) thiss!1379))))

(assert (= (and d!11340 c!2622) b!38122))

(assert (= (and d!11340 (not c!2622)) b!38121))

(assert (= (and d!11340 res!32402) b!38123))

(assert (= (and b!38123 res!32401) b!38119))

(assert (= (and b!38119 res!32403) b!38120))

(declare-fun m!57933 () Bool)

(assert (=> b!38119 m!57933))

(assert (=> b!38122 m!57763))

(declare-fun m!57935 () Bool)

(assert (=> b!38122 m!57935))

(declare-fun m!57937 () Bool)

(assert (=> b!38122 m!57937))

(declare-fun m!57939 () Bool)

(assert (=> b!38123 m!57939))

(declare-fun m!57941 () Bool)

(assert (=> d!11340 m!57941))

(assert (=> d!11340 m!57701))

(assert (=> d!11340 m!57759))

(declare-fun m!57943 () Bool)

(assert (=> d!11340 m!57943))

(declare-fun m!57945 () Bool)

(assert (=> d!11340 m!57945))

(declare-fun m!57947 () Bool)

(assert (=> d!11340 m!57947))

(declare-fun m!57949 () Bool)

(assert (=> d!11340 m!57949))

(declare-fun m!57951 () Bool)

(assert (=> d!11340 m!57951))

(declare-fun m!57953 () Bool)

(assert (=> d!11340 m!57953))

(declare-fun m!57955 () Bool)

(assert (=> d!11340 m!57955))

(assert (=> d!11340 m!57761))

(declare-fun m!57957 () Bool)

(assert (=> b!38120 m!57957))

(assert (=> b!38120 m!57691))

(assert (=> b!38120 m!57763))

(assert (=> b!37981 d!11340))

(declare-fun d!11342 () Bool)

(assert (=> d!11342 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3020 () Bool)

(assert (= bs!3020 d!11342))

(declare-fun m!57959 () Bool)

(assert (=> bs!3020 m!57959))

(assert (=> b!37981 d!11342))

(declare-fun d!11344 () Bool)

(assert (=> d!11344 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!57802 () Unit!2747)

(declare-fun choose!9 (BitStream!1506 array!1948 (_ BitVec 64) BitStream!1506) Unit!2747)

(assert (=> d!11344 (= lt!57802 (choose!9 thiss!1379 (buf!1203 (_2!1934 lt!57603)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1507 (buf!1203 (_2!1934 lt!57603)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379))))))

(assert (=> d!11344 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1203 (_2!1934 lt!57603)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!57802)))

(declare-fun bs!3021 () Bool)

(assert (= bs!3021 d!11344))

(assert (=> bs!3021 m!57757))

(declare-fun m!57961 () Bool)

(assert (=> bs!3021 m!57961))

(assert (=> b!37981 d!11344))

(declare-fun d!11346 () Bool)

(declare-fun res!32405 () Bool)

(declare-fun e!25070 () Bool)

(assert (=> d!11346 (=> (not res!32405) (not e!25070))))

(assert (=> d!11346 (= res!32405 (= (size!875 (buf!1203 (_2!1934 lt!57603))) (size!875 (buf!1203 (_2!1934 lt!57599)))))))

(assert (=> d!11346 (= (isPrefixOf!0 (_2!1934 lt!57603) (_2!1934 lt!57599)) e!25070)))

(declare-fun b!38124 () Bool)

(declare-fun res!32406 () Bool)

(assert (=> b!38124 (=> (not res!32406) (not e!25070))))

(assert (=> b!38124 (= res!32406 (bvsle (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))) (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57599))) (currentByte!2609 (_2!1934 lt!57599)) (currentBit!2604 (_2!1934 lt!57599)))))))

(declare-fun b!38125 () Bool)

(declare-fun e!25069 () Bool)

(assert (=> b!38125 (= e!25070 e!25069)))

(declare-fun res!32404 () Bool)

(assert (=> b!38125 (=> res!32404 e!25069)))

(assert (=> b!38125 (= res!32404 (= (size!875 (buf!1203 (_2!1934 lt!57603))) #b00000000000000000000000000000000))))

(declare-fun b!38126 () Bool)

(assert (=> b!38126 (= e!25069 (arrayBitRangesEq!0 (buf!1203 (_2!1934 lt!57603)) (buf!1203 (_2!1934 lt!57599)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603)))))))

(assert (= (and d!11346 res!32405) b!38124))

(assert (= (and b!38124 res!32406) b!38125))

(assert (= (and b!38125 (not res!32404)) b!38126))

(assert (=> b!38124 m!57691))

(assert (=> b!38124 m!57777))

(assert (=> b!38126 m!57691))

(assert (=> b!38126 m!57691))

(declare-fun m!57963 () Bool)

(assert (=> b!38126 m!57963))

(assert (=> b!37981 d!11346))

(declare-fun b!38167 () Bool)

(declare-fun res!32442 () Bool)

(declare-fun e!25091 () Bool)

(assert (=> b!38167 (=> (not res!32442) (not e!25091))))

(declare-fun lt!57992 () tuple2!3694)

(assert (=> b!38167 (= res!32442 (= (size!875 (buf!1203 (_2!1934 lt!57992))) (size!875 (buf!1203 (_2!1934 lt!57603)))))))

(declare-fun lt!57982 () tuple2!3696)

(declare-fun b!38168 () Bool)

(assert (=> b!38168 (= e!25091 (= (bitStreamReadBitsIntoList!0 (_2!1934 lt!57992) (_1!1935 lt!57982) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1934 lt!57992) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!38168 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38168 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!57959 () Unit!2747)

(declare-fun lt!57972 () Unit!2747)

(assert (=> b!38168 (= lt!57959 lt!57972)))

(declare-fun lt!57967 () (_ BitVec 64))

(assert (=> b!38168 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57992)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) lt!57967)))

(assert (=> b!38168 (= lt!57972 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1934 lt!57603) (buf!1203 (_2!1934 lt!57992)) lt!57967))))

(declare-fun e!25089 () Bool)

(assert (=> b!38168 e!25089))

(declare-fun res!32438 () Bool)

(assert (=> b!38168 (=> (not res!32438) (not e!25089))))

(assert (=> b!38168 (= res!32438 (and (= (size!875 (buf!1203 (_2!1934 lt!57603))) (size!875 (buf!1203 (_2!1934 lt!57992)))) (bvsge lt!57967 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38168 (= lt!57967 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!38168 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38168 (= lt!57982 (reader!0 (_2!1934 lt!57603) (_2!1934 lt!57992)))))

(declare-fun bm!472 () Bool)

(declare-fun call!475 () tuple2!3696)

(declare-fun lt!57975 () tuple2!3694)

(declare-fun c!2628 () Bool)

(assert (=> bm!472 (= call!475 (reader!0 (_2!1934 lt!57603) (ite c!2628 (_2!1934 lt!57975) (_2!1934 lt!57603))))))

(declare-fun b!38170 () Bool)

(declare-fun res!32441 () Bool)

(assert (=> b!38170 (=> (not res!32441) (not e!25091))))

(assert (=> b!38170 (= res!32441 (invariant!0 (currentBit!2604 (_2!1934 lt!57992)) (currentByte!2609 (_2!1934 lt!57992)) (size!875 (buf!1203 (_2!1934 lt!57992)))))))

(declare-fun b!38171 () Bool)

(declare-fun e!25090 () tuple2!3694)

(declare-fun Unit!2752 () Unit!2747)

(assert (=> b!38171 (= e!25090 (tuple2!3695 Unit!2752 (_2!1934 lt!57603)))))

(assert (=> b!38171 (= (size!875 (buf!1203 (_2!1934 lt!57603))) (size!875 (buf!1203 (_2!1934 lt!57603))))))

(declare-fun lt!57962 () Unit!2747)

(declare-fun Unit!2753 () Unit!2747)

(assert (=> b!38171 (= lt!57962 Unit!2753)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1506 array!1948 array!1948 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38171 (checkByteArrayBitContent!0 (_2!1934 lt!57603) srcBuffer!2 (_1!1940 (readBits!0 (_1!1935 call!475) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!38172 () Bool)

(declare-fun Unit!2754 () Unit!2747)

(assert (=> b!38172 (= e!25090 (tuple2!3695 Unit!2754 (_2!1934 lt!57975)))))

(declare-fun lt!57991 () tuple2!3694)

(assert (=> b!38172 (= lt!57991 (appendBitFromByte!0 (_2!1934 lt!57603) (select (arr!1368 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!57957 () (_ BitVec 64))

(assert (=> b!38172 (= lt!57957 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!57983 () (_ BitVec 64))

(assert (=> b!38172 (= lt!57983 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!57997 () Unit!2747)

(assert (=> b!38172 (= lt!57997 (validateOffsetBitsIneqLemma!0 (_2!1934 lt!57603) (_2!1934 lt!57991) lt!57957 lt!57983))))

(assert (=> b!38172 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57991)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57991))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57991))) (bvsub lt!57957 lt!57983))))

(declare-fun lt!57965 () Unit!2747)

(assert (=> b!38172 (= lt!57965 lt!57997)))

(declare-fun lt!57979 () tuple2!3696)

(assert (=> b!38172 (= lt!57979 (reader!0 (_2!1934 lt!57603) (_2!1934 lt!57991)))))

(declare-fun lt!57995 () (_ BitVec 64))

(assert (=> b!38172 (= lt!57995 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!57966 () Unit!2747)

(assert (=> b!38172 (= lt!57966 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1934 lt!57603) (buf!1203 (_2!1934 lt!57991)) lt!57995))))

(assert (=> b!38172 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57991)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) lt!57995)))

(declare-fun lt!57980 () Unit!2747)

(assert (=> b!38172 (= lt!57980 lt!57966)))

(assert (=> b!38172 (= (head!291 (byteArrayBitContentToList!0 (_2!1934 lt!57991) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!291 (bitStreamReadBitsIntoList!0 (_2!1934 lt!57991) (_1!1935 lt!57979) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!57976 () Unit!2747)

(declare-fun Unit!2755 () Unit!2747)

(assert (=> b!38172 (= lt!57976 Unit!2755)))

(assert (=> b!38172 (= lt!57975 (appendBitsMSBFirstLoop!0 (_2!1934 lt!57991) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!57970 () Unit!2747)

(assert (=> b!38172 (= lt!57970 (lemmaIsPrefixTransitive!0 (_2!1934 lt!57603) (_2!1934 lt!57991) (_2!1934 lt!57975)))))

(assert (=> b!38172 (isPrefixOf!0 (_2!1934 lt!57603) (_2!1934 lt!57975))))

(declare-fun lt!57963 () Unit!2747)

(assert (=> b!38172 (= lt!57963 lt!57970)))

(assert (=> b!38172 (= (size!875 (buf!1203 (_2!1934 lt!57975))) (size!875 (buf!1203 (_2!1934 lt!57603))))))

(declare-fun lt!57960 () Unit!2747)

(declare-fun Unit!2756 () Unit!2747)

(assert (=> b!38172 (= lt!57960 Unit!2756)))

(assert (=> b!38172 (= (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57975))) (currentByte!2609 (_2!1934 lt!57975)) (currentBit!2604 (_2!1934 lt!57975))) (bvsub (bvadd (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!57989 () Unit!2747)

(declare-fun Unit!2757 () Unit!2747)

(assert (=> b!38172 (= lt!57989 Unit!2757)))

(assert (=> b!38172 (= (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57975))) (currentByte!2609 (_2!1934 lt!57975)) (currentBit!2604 (_2!1934 lt!57975))) (bvsub (bvsub (bvadd (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57991))) (currentByte!2609 (_2!1934 lt!57991)) (currentBit!2604 (_2!1934 lt!57991))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57984 () Unit!2747)

(declare-fun Unit!2758 () Unit!2747)

(assert (=> b!38172 (= lt!57984 Unit!2758)))

(declare-fun lt!57996 () tuple2!3696)

(assert (=> b!38172 (= lt!57996 call!475)))

(declare-fun lt!57973 () (_ BitVec 64))

(assert (=> b!38172 (= lt!57973 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!57981 () Unit!2747)

(assert (=> b!38172 (= lt!57981 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1934 lt!57603) (buf!1203 (_2!1934 lt!57975)) lt!57973))))

(assert (=> b!38172 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57975)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) lt!57973)))

(declare-fun lt!57990 () Unit!2747)

(assert (=> b!38172 (= lt!57990 lt!57981)))

(declare-fun lt!57994 () tuple2!3696)

(assert (=> b!38172 (= lt!57994 (reader!0 (_2!1934 lt!57991) (_2!1934 lt!57975)))))

(declare-fun lt!58000 () (_ BitVec 64))

(assert (=> b!38172 (= lt!58000 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57985 () Unit!2747)

(assert (=> b!38172 (= lt!57985 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1934 lt!57991) (buf!1203 (_2!1934 lt!57975)) lt!58000))))

(assert (=> b!38172 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57975)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57991))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57991))) lt!58000)))

(declare-fun lt!57961 () Unit!2747)

(assert (=> b!38172 (= lt!57961 lt!57985)))

(declare-fun lt!57958 () List!454)

(assert (=> b!38172 (= lt!57958 (byteArrayBitContentToList!0 (_2!1934 lt!57975) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!57964 () List!454)

(assert (=> b!38172 (= lt!57964 (byteArrayBitContentToList!0 (_2!1934 lt!57975) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!57978 () List!454)

(assert (=> b!38172 (= lt!57978 (bitStreamReadBitsIntoList!0 (_2!1934 lt!57975) (_1!1935 lt!57996) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!57993 () List!454)

(assert (=> b!38172 (= lt!57993 (bitStreamReadBitsIntoList!0 (_2!1934 lt!57975) (_1!1935 lt!57994) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!57998 () (_ BitVec 64))

(assert (=> b!38172 (= lt!57998 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!57999 () Unit!2747)

(assert (=> b!38172 (= lt!57999 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1934 lt!57975) (_2!1934 lt!57975) (_1!1935 lt!57996) (_1!1935 lt!57994) lt!57998 lt!57978))))

(assert (=> b!38172 (= (bitStreamReadBitsIntoList!0 (_2!1934 lt!57975) (_1!1935 lt!57994) (bvsub lt!57998 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!171 lt!57978))))

(declare-fun lt!57986 () Unit!2747)

(assert (=> b!38172 (= lt!57986 lt!57999)))

(declare-fun lt!57969 () (_ BitVec 64))

(declare-fun lt!57988 () Unit!2747)

(assert (=> b!38172 (= lt!57988 (arrayBitRangesEqImpliesEq!0 (buf!1203 (_2!1934 lt!57991)) (buf!1203 (_2!1934 lt!57975)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57969 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57991))) (currentByte!2609 (_2!1934 lt!57991)) (currentBit!2604 (_2!1934 lt!57991)))))))

(assert (=> b!38172 (= (bitAt!0 (buf!1203 (_2!1934 lt!57991)) lt!57969) (bitAt!0 (buf!1203 (_2!1934 lt!57975)) lt!57969))))

(declare-fun lt!57987 () Unit!2747)

(assert (=> b!38172 (= lt!57987 lt!57988)))

(declare-fun b!38173 () Bool)

(assert (=> b!38173 (= e!25089 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) lt!57967))))

(declare-fun b!38174 () Bool)

(declare-fun res!32440 () Bool)

(assert (=> b!38174 (=> (not res!32440) (not e!25091))))

(assert (=> b!38174 (= res!32440 (isPrefixOf!0 (_2!1934 lt!57603) (_2!1934 lt!57992)))))

(declare-fun b!38169 () Bool)

(declare-fun res!32439 () Bool)

(assert (=> b!38169 (=> (not res!32439) (not e!25091))))

(assert (=> b!38169 (= res!32439 (= (size!875 (buf!1203 (_2!1934 lt!57603))) (size!875 (buf!1203 (_2!1934 lt!57992)))))))

(declare-fun d!11348 () Bool)

(assert (=> d!11348 e!25091))

(declare-fun res!32437 () Bool)

(assert (=> d!11348 (=> (not res!32437) (not e!25091))))

(declare-fun lt!57968 () (_ BitVec 64))

(assert (=> d!11348 (= res!32437 (= (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57992))) (currentByte!2609 (_2!1934 lt!57992)) (currentBit!2604 (_2!1934 lt!57992))) (bvsub lt!57968 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!11348 (or (= (bvand lt!57968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!57968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!57968 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!57971 () (_ BitVec 64))

(assert (=> d!11348 (= lt!57968 (bvadd lt!57971 to!314))))

(assert (=> d!11348 (or (not (= (bvand lt!57971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!57971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!57971 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11348 (= lt!57971 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))))))

(assert (=> d!11348 (= lt!57992 e!25090)))

(assert (=> d!11348 (= c!2628 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!57977 () Unit!2747)

(declare-fun lt!57974 () Unit!2747)

(assert (=> d!11348 (= lt!57977 lt!57974)))

(assert (=> d!11348 (isPrefixOf!0 (_2!1934 lt!57603) (_2!1934 lt!57603))))

(assert (=> d!11348 (= lt!57974 (lemmaIsPrefixRefl!0 (_2!1934 lt!57603)))))

(assert (=> d!11348 (= lt!57969 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))))))

(assert (=> d!11348 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11348 (= (appendBitsMSBFirstLoop!0 (_2!1934 lt!57603) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!57992)))

(assert (= (and d!11348 c!2628) b!38172))

(assert (= (and d!11348 (not c!2628)) b!38171))

(assert (= (or b!38172 b!38171) bm!472))

(assert (= (and d!11348 res!32437) b!38170))

(assert (= (and b!38170 res!32441) b!38169))

(assert (= (and b!38169 res!32439) b!38174))

(assert (= (and b!38174 res!32440) b!38167))

(assert (= (and b!38167 res!32442) b!38168))

(assert (= (and b!38168 res!32438) b!38173))

(declare-fun m!58011 () Bool)

(assert (=> b!38170 m!58011))

(declare-fun m!58013 () Bool)

(assert (=> d!11348 m!58013))

(assert (=> d!11348 m!57691))

(assert (=> d!11348 m!57953))

(assert (=> d!11348 m!57949))

(declare-fun m!58015 () Bool)

(assert (=> b!38173 m!58015))

(declare-fun m!58017 () Bool)

(assert (=> b!38172 m!58017))

(declare-fun m!58019 () Bool)

(assert (=> b!38172 m!58019))

(declare-fun m!58021 () Bool)

(assert (=> b!38172 m!58021))

(declare-fun m!58023 () Bool)

(assert (=> b!38172 m!58023))

(declare-fun m!58025 () Bool)

(assert (=> b!38172 m!58025))

(declare-fun m!58027 () Bool)

(assert (=> b!38172 m!58027))

(declare-fun m!58029 () Bool)

(assert (=> b!38172 m!58029))

(declare-fun m!58031 () Bool)

(assert (=> b!38172 m!58031))

(declare-fun m!58033 () Bool)

(assert (=> b!38172 m!58033))

(declare-fun m!58035 () Bool)

(assert (=> b!38172 m!58035))

(declare-fun m!58037 () Bool)

(assert (=> b!38172 m!58037))

(declare-fun m!58039 () Bool)

(assert (=> b!38172 m!58039))

(declare-fun m!58041 () Bool)

(assert (=> b!38172 m!58041))

(declare-fun m!58043 () Bool)

(assert (=> b!38172 m!58043))

(declare-fun m!58045 () Bool)

(assert (=> b!38172 m!58045))

(declare-fun m!58047 () Bool)

(assert (=> b!38172 m!58047))

(declare-fun m!58049 () Bool)

(assert (=> b!38172 m!58049))

(assert (=> b!38172 m!58029))

(declare-fun m!58051 () Bool)

(assert (=> b!38172 m!58051))

(assert (=> b!38172 m!58047))

(declare-fun m!58053 () Bool)

(assert (=> b!38172 m!58053))

(declare-fun m!58055 () Bool)

(assert (=> b!38172 m!58055))

(declare-fun m!58057 () Bool)

(assert (=> b!38172 m!58057))

(declare-fun m!58059 () Bool)

(assert (=> b!38172 m!58059))

(declare-fun m!58061 () Bool)

(assert (=> b!38172 m!58061))

(declare-fun m!58063 () Bool)

(assert (=> b!38172 m!58063))

(declare-fun m!58065 () Bool)

(assert (=> b!38172 m!58065))

(declare-fun m!58067 () Bool)

(assert (=> b!38172 m!58067))

(assert (=> b!38172 m!57691))

(declare-fun m!58069 () Bool)

(assert (=> b!38172 m!58069))

(declare-fun m!58071 () Bool)

(assert (=> b!38172 m!58071))

(declare-fun m!58073 () Bool)

(assert (=> b!38172 m!58073))

(assert (=> b!38172 m!58059))

(declare-fun m!58075 () Bool)

(assert (=> b!38172 m!58075))

(assert (=> b!38172 m!58057))

(declare-fun m!58077 () Bool)

(assert (=> b!38172 m!58077))

(declare-fun m!58079 () Bool)

(assert (=> b!38174 m!58079))

(declare-fun m!58081 () Bool)

(assert (=> b!38168 m!58081))

(declare-fun m!58083 () Bool)

(assert (=> b!38168 m!58083))

(declare-fun m!58085 () Bool)

(assert (=> b!38168 m!58085))

(declare-fun m!58087 () Bool)

(assert (=> b!38168 m!58087))

(declare-fun m!58089 () Bool)

(assert (=> b!38168 m!58089))

(declare-fun m!58091 () Bool)

(assert (=> b!38171 m!58091))

(declare-fun m!58093 () Bool)

(assert (=> b!38171 m!58093))

(declare-fun m!58095 () Bool)

(assert (=> bm!472 m!58095))

(assert (=> b!37981 d!11348))

(declare-fun d!11378 () Bool)

(declare-fun e!25100 () Bool)

(assert (=> d!11378 e!25100))

(declare-fun res!32460 () Bool)

(assert (=> d!11378 (=> (not res!32460) (not e!25100))))

(declare-fun lt!58105 () (_ BitVec 64))

(declare-fun lt!58102 () (_ BitVec 64))

(declare-fun lt!58103 () (_ BitVec 64))

(assert (=> d!11378 (= res!32460 (= lt!58102 (bvsub lt!58105 lt!58103)))))

(assert (=> d!11378 (or (= (bvand lt!58105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58105 lt!58103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11378 (= lt!58103 (remainingBits!0 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603)))))))

(declare-fun lt!58104 () (_ BitVec 64))

(declare-fun lt!58106 () (_ BitVec 64))

(assert (=> d!11378 (= lt!58105 (bvmul lt!58104 lt!58106))))

(assert (=> d!11378 (or (= lt!58104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!58106 (bvsdiv (bvmul lt!58104 lt!58106) lt!58104)))))

(assert (=> d!11378 (= lt!58106 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11378 (= lt!58104 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))))))

(assert (=> d!11378 (= lt!58102 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603)))))))

(assert (=> d!11378 (invariant!0 (currentBit!2604 (_2!1934 lt!57603)) (currentByte!2609 (_2!1934 lt!57603)) (size!875 (buf!1203 (_2!1934 lt!57603))))))

(assert (=> d!11378 (= (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))) lt!58102)))

(declare-fun b!38195 () Bool)

(declare-fun res!32459 () Bool)

(assert (=> b!38195 (=> (not res!32459) (not e!25100))))

(assert (=> b!38195 (= res!32459 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58102))))

(declare-fun b!38196 () Bool)

(declare-fun lt!58101 () (_ BitVec 64))

(assert (=> b!38196 (= e!25100 (bvsle lt!58102 (bvmul lt!58101 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!38196 (or (= lt!58101 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!58101 #b0000000000000000000000000000000000000000000000000000000000001000) lt!58101)))))

(assert (=> b!38196 (= lt!58101 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57603)))))))

(assert (= (and d!11378 res!32460) b!38195))

(assert (= (and b!38195 res!32459) b!38196))

(assert (=> d!11378 m!57893))

(assert (=> d!11378 m!57729))

(assert (=> b!37991 d!11378))

(declare-fun d!11380 () Bool)

(assert (=> d!11380 (= (array_inv!806 srcBuffer!2) (bvsge (size!875 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7768 d!11380))

(declare-fun d!11382 () Bool)

(assert (=> d!11382 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2604 thiss!1379) (currentByte!2609 thiss!1379) (size!875 (buf!1203 thiss!1379))))))

(declare-fun bs!3030 () Bool)

(assert (= bs!3030 d!11382))

(assert (=> bs!3030 m!57765))

(assert (=> start!7768 d!11382))

(declare-fun d!11384 () Bool)

(assert (=> d!11384 (= (tail!171 lt!57596) (t!1204 lt!57596))))

(assert (=> b!37990 d!11384))

(declare-fun d!11386 () Bool)

(declare-fun e!25103 () Bool)

(assert (=> d!11386 e!25103))

(declare-fun res!32463 () Bool)

(assert (=> d!11386 (=> (not res!32463) (not e!25103))))

(declare-fun lt!58112 () (_ BitVec 64))

(assert (=> d!11386 (= res!32463 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58112 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!58112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!11386 (= lt!58112 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!58111 () Unit!2747)

(declare-fun choose!42 (BitStream!1506 BitStream!1506 BitStream!1506 BitStream!1506 (_ BitVec 64) List!454) Unit!2747)

(assert (=> d!11386 (= lt!58111 (choose!42 (_2!1934 lt!57599) (_2!1934 lt!57599) (_1!1935 lt!57597) (_1!1935 lt!57602) (bvsub to!314 i!635) lt!57596))))

(assert (=> d!11386 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11386 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1934 lt!57599) (_2!1934 lt!57599) (_1!1935 lt!57597) (_1!1935 lt!57602) (bvsub to!314 i!635) lt!57596) lt!58111)))

(declare-fun b!38199 () Bool)

(assert (=> b!38199 (= e!25103 (= (bitStreamReadBitsIntoList!0 (_2!1934 lt!57599) (_1!1935 lt!57602) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!171 lt!57596)))))

(assert (= (and d!11386 res!32463) b!38199))

(declare-fun m!58097 () Bool)

(assert (=> d!11386 m!58097))

(declare-fun m!58099 () Bool)

(assert (=> b!38199 m!58099))

(assert (=> b!38199 m!57787))

(assert (=> b!37990 d!11386))

(declare-fun d!11388 () Bool)

(declare-fun size!877 (List!454) Int)

(assert (=> d!11388 (= (length!180 lt!57596) (size!877 lt!57596))))

(declare-fun bs!3031 () Bool)

(assert (= bs!3031 d!11388))

(declare-fun m!58101 () Bool)

(assert (=> bs!3031 m!58101))

(assert (=> b!37979 d!11388))

(declare-fun d!11390 () Bool)

(declare-fun res!32465 () Bool)

(declare-fun e!25105 () Bool)

(assert (=> d!11390 (=> (not res!32465) (not e!25105))))

(assert (=> d!11390 (= res!32465 (= (size!875 (buf!1203 thiss!1379)) (size!875 (buf!1203 thiss!1379))))))

(assert (=> d!11390 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!25105)))

(declare-fun b!38200 () Bool)

(declare-fun res!32466 () Bool)

(assert (=> b!38200 (=> (not res!32466) (not e!25105))))

(assert (=> b!38200 (= res!32466 (bvsle (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)) (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379))))))

(declare-fun b!38201 () Bool)

(declare-fun e!25104 () Bool)

(assert (=> b!38201 (= e!25105 e!25104)))

(declare-fun res!32464 () Bool)

(assert (=> b!38201 (=> res!32464 e!25104)))

(assert (=> b!38201 (= res!32464 (= (size!875 (buf!1203 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!38202 () Bool)

(assert (=> b!38202 (= e!25104 (arrayBitRangesEq!0 (buf!1203 thiss!1379) (buf!1203 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379))))))

(assert (= (and d!11390 res!32465) b!38200))

(assert (= (and b!38200 res!32466) b!38201))

(assert (= (and b!38201 (not res!32464)) b!38202))

(assert (=> b!38200 m!57763))

(assert (=> b!38200 m!57763))

(assert (=> b!38202 m!57763))

(assert (=> b!38202 m!57763))

(declare-fun m!58103 () Bool)

(assert (=> b!38202 m!58103))

(assert (=> b!37978 d!11390))

(declare-fun d!11392 () Bool)

(assert (=> d!11392 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!58159 () Unit!2747)

(declare-fun choose!11 (BitStream!1506) Unit!2747)

(assert (=> d!11392 (= lt!58159 (choose!11 thiss!1379))))

(assert (=> d!11392 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!58159)))

(declare-fun bs!3033 () Bool)

(assert (= bs!3033 d!11392))

(assert (=> bs!3033 m!57759))

(declare-fun m!58105 () Bool)

(assert (=> bs!3033 m!58105))

(assert (=> b!37978 d!11392))

(declare-fun d!11394 () Bool)

(declare-fun e!25109 () Bool)

(assert (=> d!11394 e!25109))

(declare-fun res!32474 () Bool)

(assert (=> d!11394 (=> (not res!32474) (not e!25109))))

(declare-fun lt!58162 () (_ BitVec 64))

(declare-fun lt!58164 () (_ BitVec 64))

(declare-fun lt!58161 () (_ BitVec 64))

(assert (=> d!11394 (= res!32474 (= lt!58161 (bvsub lt!58164 lt!58162)))))

(assert (=> d!11394 (or (= (bvand lt!58164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58164 lt!58162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11394 (= lt!58162 (remainingBits!0 ((_ sign_extend 32) (size!875 (buf!1203 thiss!1379))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379))))))

(declare-fun lt!58163 () (_ BitVec 64))

(declare-fun lt!58165 () (_ BitVec 64))

(assert (=> d!11394 (= lt!58164 (bvmul lt!58163 lt!58165))))

(assert (=> d!11394 (or (= lt!58163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!58165 (bvsdiv (bvmul lt!58163 lt!58165) lt!58163)))))

(assert (=> d!11394 (= lt!58165 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11394 (= lt!58163 ((_ sign_extend 32) (size!875 (buf!1203 thiss!1379))))))

(assert (=> d!11394 (= lt!58161 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2609 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2604 thiss!1379))))))

(assert (=> d!11394 (invariant!0 (currentBit!2604 thiss!1379) (currentByte!2609 thiss!1379) (size!875 (buf!1203 thiss!1379)))))

(assert (=> d!11394 (= (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)) lt!58161)))

(declare-fun b!38211 () Bool)

(declare-fun res!32473 () Bool)

(assert (=> b!38211 (=> (not res!32473) (not e!25109))))

(assert (=> b!38211 (= res!32473 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58161))))

(declare-fun b!38212 () Bool)

(declare-fun lt!58160 () (_ BitVec 64))

(assert (=> b!38212 (= e!25109 (bvsle lt!58161 (bvmul lt!58160 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!38212 (or (= lt!58160 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!58160 #b0000000000000000000000000000000000000000000000000000000000001000) lt!58160)))))

(assert (=> b!38212 (= lt!58160 ((_ sign_extend 32) (size!875 (buf!1203 thiss!1379))))))

(assert (= (and d!11394 res!32474) b!38211))

(assert (= (and b!38211 res!32473) b!38212))

(declare-fun m!58107 () Bool)

(assert (=> d!11394 m!58107))

(assert (=> d!11394 m!57765))

(assert (=> b!37978 d!11394))

(declare-fun d!11396 () Bool)

(assert (=> d!11396 (= (invariant!0 (currentBit!2604 thiss!1379) (currentByte!2609 thiss!1379) (size!875 (buf!1203 thiss!1379))) (and (bvsge (currentBit!2604 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2604 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2609 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2609 thiss!1379) (size!875 (buf!1203 thiss!1379))) (and (= (currentBit!2604 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2609 thiss!1379) (size!875 (buf!1203 thiss!1379)))))))))

(assert (=> b!37989 d!11396))

(declare-fun d!11398 () Bool)

(assert (=> d!11398 (= (bitAt!0 (buf!1203 (_2!1934 lt!57599)) lt!57598) (not (= (bvand ((_ sign_extend 24) (select (arr!1368 (buf!1203 (_2!1934 lt!57599))) ((_ extract 31 0) (bvsdiv lt!57598 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57598 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3034 () Bool)

(assert (= bs!3034 d!11398))

(declare-fun m!58199 () Bool)

(assert (=> bs!3034 m!58199))

(declare-fun m!58201 () Bool)

(assert (=> bs!3034 m!58201))

(assert (=> b!37988 d!11398))

(declare-fun d!11402 () Bool)

(assert (=> d!11402 (= (bitAt!0 (buf!1203 (_2!1934 lt!57603)) lt!57598) (bitAt!0 (buf!1203 (_2!1934 lt!57599)) lt!57598))))

(declare-fun lt!58168 () Unit!2747)

(declare-fun choose!31 (array!1948 array!1948 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2747)

(assert (=> d!11402 (= lt!58168 (choose!31 (buf!1203 (_2!1934 lt!57603)) (buf!1203 (_2!1934 lt!57599)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57598 lt!57601))))

(assert (=> d!11402 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!57601))))

(assert (=> d!11402 (= (arrayBitRangesEqImpliesEq!0 (buf!1203 (_2!1934 lt!57603)) (buf!1203 (_2!1934 lt!57599)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57598 lt!57601) lt!58168)))

(declare-fun bs!3035 () Bool)

(assert (= bs!3035 d!11402))

(assert (=> bs!3035 m!57743))

(assert (=> bs!3035 m!57773))

(declare-fun m!58203 () Bool)

(assert (=> bs!3035 m!58203))

(assert (=> b!37988 d!11402))

(declare-fun d!11404 () Bool)

(assert (=> d!11404 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3036 () Bool)

(assert (= bs!3036 d!11404))

(declare-fun m!58205 () Bool)

(assert (=> bs!3036 m!58205))

(assert (=> b!37999 d!11404))

(declare-fun b!38233 () Bool)

(declare-fun e!25120 () Bool)

(declare-fun lt!58175 () List!454)

(assert (=> b!38233 (= e!25120 (> (length!180 lt!58175) 0))))

(declare-fun b!38232 () Bool)

(declare-fun isEmpty!108 (List!454) Bool)

(assert (=> b!38232 (= e!25120 (isEmpty!108 lt!58175))))

(declare-fun d!11406 () Bool)

(assert (=> d!11406 e!25120))

(declare-fun c!2637 () Bool)

(assert (=> d!11406 (= c!2637 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3710 0))(
  ( (tuple2!3711 (_1!1942 List!454) (_2!1942 BitStream!1506)) )
))
(declare-fun e!25121 () tuple2!3710)

(assert (=> d!11406 (= lt!58175 (_1!1942 e!25121))))

(declare-fun c!2636 () Bool)

(assert (=> d!11406 (= c!2636 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11406 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11406 (= (bitStreamReadBitsIntoList!0 (_2!1934 lt!57599) (_1!1935 lt!57597) (bvsub to!314 i!635)) lt!58175)))

(declare-fun b!38230 () Bool)

(assert (=> b!38230 (= e!25121 (tuple2!3711 Nil!451 (_1!1935 lt!57597)))))

(declare-fun lt!58176 () tuple2!3708)

(declare-fun b!38231 () Bool)

(declare-fun lt!58177 () (_ BitVec 64))

(assert (=> b!38231 (= e!25121 (tuple2!3711 (Cons!450 (_1!1941 lt!58176) (bitStreamReadBitsIntoList!0 (_2!1934 lt!57599) (_2!1941 lt!58176) (bvsub (bvsub to!314 i!635) lt!58177))) (_2!1941 lt!58176)))))

(assert (=> b!38231 (= lt!58176 (readBit!0 (_1!1935 lt!57597)))))

(assert (=> b!38231 (= lt!58177 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!11406 c!2636) b!38230))

(assert (= (and d!11406 (not c!2636)) b!38231))

(assert (= (and d!11406 c!2637) b!38232))

(assert (= (and d!11406 (not c!2637)) b!38233))

(declare-fun m!58209 () Bool)

(assert (=> b!38233 m!58209))

(declare-fun m!58211 () Bool)

(assert (=> b!38232 m!58211))

(declare-fun m!58213 () Bool)

(assert (=> b!38231 m!58213))

(assert (=> b!38231 m!57927))

(assert (=> b!37999 d!11406))

(declare-fun d!11410 () Bool)

(assert (=> d!11410 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!58178 () Unit!2747)

(assert (=> d!11410 (= lt!58178 (choose!9 thiss!1379 (buf!1203 (_2!1934 lt!57599)) (bvsub to!314 i!635) (BitStream!1507 (buf!1203 (_2!1934 lt!57599)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379))))))

(assert (=> d!11410 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1203 (_2!1934 lt!57599)) (bvsub to!314 i!635)) lt!58178)))

(declare-fun bs!3037 () Bool)

(assert (= bs!3037 d!11410))

(assert (=> bs!3037 m!57713))

(declare-fun m!58215 () Bool)

(assert (=> bs!3037 m!58215))

(assert (=> b!37999 d!11410))

(declare-fun d!11412 () Bool)

(declare-fun e!25122 () Bool)

(assert (=> d!11412 e!25122))

(declare-fun res!32485 () Bool)

(assert (=> d!11412 (=> (not res!32485) (not e!25122))))

(declare-fun lt!58183 () tuple2!3696)

(assert (=> d!11412 (= res!32485 (isPrefixOf!0 (_1!1935 lt!58183) (_2!1935 lt!58183)))))

(declare-fun lt!58188 () BitStream!1506)

(assert (=> d!11412 (= lt!58183 (tuple2!3697 lt!58188 (_2!1934 lt!57599)))))

(declare-fun lt!58192 () Unit!2747)

(declare-fun lt!58195 () Unit!2747)

(assert (=> d!11412 (= lt!58192 lt!58195)))

(assert (=> d!11412 (isPrefixOf!0 lt!58188 (_2!1934 lt!57599))))

(assert (=> d!11412 (= lt!58195 (lemmaIsPrefixTransitive!0 lt!58188 (_2!1934 lt!57599) (_2!1934 lt!57599)))))

(declare-fun lt!58184 () Unit!2747)

(declare-fun lt!58189 () Unit!2747)

(assert (=> d!11412 (= lt!58184 lt!58189)))

(assert (=> d!11412 (isPrefixOf!0 lt!58188 (_2!1934 lt!57599))))

(assert (=> d!11412 (= lt!58189 (lemmaIsPrefixTransitive!0 lt!58188 thiss!1379 (_2!1934 lt!57599)))))

(declare-fun lt!58185 () Unit!2747)

(declare-fun e!25123 () Unit!2747)

(assert (=> d!11412 (= lt!58185 e!25123)))

(declare-fun c!2638 () Bool)

(assert (=> d!11412 (= c!2638 (not (= (size!875 (buf!1203 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!58181 () Unit!2747)

(declare-fun lt!58193 () Unit!2747)

(assert (=> d!11412 (= lt!58181 lt!58193)))

(assert (=> d!11412 (isPrefixOf!0 (_2!1934 lt!57599) (_2!1934 lt!57599))))

(assert (=> d!11412 (= lt!58193 (lemmaIsPrefixRefl!0 (_2!1934 lt!57599)))))

(declare-fun lt!58182 () Unit!2747)

(declare-fun lt!58179 () Unit!2747)

(assert (=> d!11412 (= lt!58182 lt!58179)))

(assert (=> d!11412 (= lt!58179 (lemmaIsPrefixRefl!0 (_2!1934 lt!57599)))))

(declare-fun lt!58190 () Unit!2747)

(declare-fun lt!58196 () Unit!2747)

(assert (=> d!11412 (= lt!58190 lt!58196)))

(assert (=> d!11412 (isPrefixOf!0 lt!58188 lt!58188)))

(assert (=> d!11412 (= lt!58196 (lemmaIsPrefixRefl!0 lt!58188))))

(declare-fun lt!58194 () Unit!2747)

(declare-fun lt!58186 () Unit!2747)

(assert (=> d!11412 (= lt!58194 lt!58186)))

(assert (=> d!11412 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11412 (= lt!58186 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11412 (= lt!58188 (BitStream!1507 (buf!1203 (_2!1934 lt!57599)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)))))

(assert (=> d!11412 (isPrefixOf!0 thiss!1379 (_2!1934 lt!57599))))

(assert (=> d!11412 (= (reader!0 thiss!1379 (_2!1934 lt!57599)) lt!58183)))

(declare-fun b!38234 () Bool)

(declare-fun res!32486 () Bool)

(assert (=> b!38234 (=> (not res!32486) (not e!25122))))

(assert (=> b!38234 (= res!32486 (isPrefixOf!0 (_2!1935 lt!58183) (_2!1934 lt!57599)))))

(declare-fun lt!58197 () (_ BitVec 64))

(declare-fun b!38235 () Bool)

(declare-fun lt!58180 () (_ BitVec 64))

(assert (=> b!38235 (= e!25122 (= (_1!1935 lt!58183) (withMovedBitIndex!0 (_2!1935 lt!58183) (bvsub lt!58197 lt!58180))))))

(assert (=> b!38235 (or (= (bvand lt!58197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58180 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58197 lt!58180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38235 (= lt!58180 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57599))) (currentByte!2609 (_2!1934 lt!57599)) (currentBit!2604 (_2!1934 lt!57599))))))

(assert (=> b!38235 (= lt!58197 (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)))))

(declare-fun b!38236 () Bool)

(declare-fun Unit!2759 () Unit!2747)

(assert (=> b!38236 (= e!25123 Unit!2759)))

(declare-fun b!38237 () Bool)

(declare-fun lt!58187 () Unit!2747)

(assert (=> b!38237 (= e!25123 lt!58187)))

(declare-fun lt!58198 () (_ BitVec 64))

(assert (=> b!38237 (= lt!58198 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58191 () (_ BitVec 64))

(assert (=> b!38237 (= lt!58191 (bitIndex!0 (size!875 (buf!1203 thiss!1379)) (currentByte!2609 thiss!1379) (currentBit!2604 thiss!1379)))))

(assert (=> b!38237 (= lt!58187 (arrayBitRangesEqSymmetric!0 (buf!1203 thiss!1379) (buf!1203 (_2!1934 lt!57599)) lt!58198 lt!58191))))

(assert (=> b!38237 (arrayBitRangesEq!0 (buf!1203 (_2!1934 lt!57599)) (buf!1203 thiss!1379) lt!58198 lt!58191)))

(declare-fun b!38238 () Bool)

(declare-fun res!32484 () Bool)

(assert (=> b!38238 (=> (not res!32484) (not e!25122))))

(assert (=> b!38238 (= res!32484 (isPrefixOf!0 (_1!1935 lt!58183) thiss!1379))))

(assert (= (and d!11412 c!2638) b!38237))

(assert (= (and d!11412 (not c!2638)) b!38236))

(assert (= (and d!11412 res!32485) b!38238))

(assert (= (and b!38238 res!32484) b!38234))

(assert (= (and b!38234 res!32486) b!38235))

(declare-fun m!58217 () Bool)

(assert (=> b!38234 m!58217))

(assert (=> b!38237 m!57763))

(declare-fun m!58219 () Bool)

(assert (=> b!38237 m!58219))

(declare-fun m!58221 () Bool)

(assert (=> b!38237 m!58221))

(declare-fun m!58223 () Bool)

(assert (=> b!38238 m!58223))

(declare-fun m!58225 () Bool)

(assert (=> d!11412 m!58225))

(assert (=> d!11412 m!57753))

(assert (=> d!11412 m!57759))

(declare-fun m!58227 () Bool)

(assert (=> d!11412 m!58227))

(declare-fun m!58229 () Bool)

(assert (=> d!11412 m!58229))

(declare-fun m!58231 () Bool)

(assert (=> d!11412 m!58231))

(declare-fun m!58233 () Bool)

(assert (=> d!11412 m!58233))

(declare-fun m!58235 () Bool)

(assert (=> d!11412 m!58235))

(declare-fun m!58237 () Bool)

(assert (=> d!11412 m!58237))

(declare-fun m!58239 () Bool)

(assert (=> d!11412 m!58239))

(assert (=> d!11412 m!57761))

(declare-fun m!58241 () Bool)

(assert (=> b!38235 m!58241))

(assert (=> b!38235 m!57777))

(assert (=> b!38235 m!57763))

(assert (=> b!37999 d!11412))

(declare-fun d!11414 () Bool)

(assert (=> d!11414 (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) lt!57592)))

(declare-fun lt!58199 () Unit!2747)

(assert (=> d!11414 (= lt!58199 (choose!9 (_2!1934 lt!57603) (buf!1203 (_2!1934 lt!57599)) lt!57592 (BitStream!1507 (buf!1203 (_2!1934 lt!57599)) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603)))))))

(assert (=> d!11414 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1934 lt!57603) (buf!1203 (_2!1934 lt!57599)) lt!57592) lt!58199)))

(declare-fun bs!3038 () Bool)

(assert (= bs!3038 d!11414))

(assert (=> bs!3038 m!57721))

(declare-fun m!58243 () Bool)

(assert (=> bs!3038 m!58243))

(assert (=> b!37999 d!11414))

(declare-fun d!11416 () Bool)

(declare-fun e!25124 () Bool)

(assert (=> d!11416 e!25124))

(declare-fun res!32488 () Bool)

(assert (=> d!11416 (=> (not res!32488) (not e!25124))))

(declare-fun lt!58204 () tuple2!3696)

(assert (=> d!11416 (= res!32488 (isPrefixOf!0 (_1!1935 lt!58204) (_2!1935 lt!58204)))))

(declare-fun lt!58209 () BitStream!1506)

(assert (=> d!11416 (= lt!58204 (tuple2!3697 lt!58209 (_2!1934 lt!57599)))))

(declare-fun lt!58213 () Unit!2747)

(declare-fun lt!58216 () Unit!2747)

(assert (=> d!11416 (= lt!58213 lt!58216)))

(assert (=> d!11416 (isPrefixOf!0 lt!58209 (_2!1934 lt!57599))))

(assert (=> d!11416 (= lt!58216 (lemmaIsPrefixTransitive!0 lt!58209 (_2!1934 lt!57599) (_2!1934 lt!57599)))))

(declare-fun lt!58205 () Unit!2747)

(declare-fun lt!58210 () Unit!2747)

(assert (=> d!11416 (= lt!58205 lt!58210)))

(assert (=> d!11416 (isPrefixOf!0 lt!58209 (_2!1934 lt!57599))))

(assert (=> d!11416 (= lt!58210 (lemmaIsPrefixTransitive!0 lt!58209 (_2!1934 lt!57603) (_2!1934 lt!57599)))))

(declare-fun lt!58206 () Unit!2747)

(declare-fun e!25125 () Unit!2747)

(assert (=> d!11416 (= lt!58206 e!25125)))

(declare-fun c!2639 () Bool)

(assert (=> d!11416 (= c!2639 (not (= (size!875 (buf!1203 (_2!1934 lt!57603))) #b00000000000000000000000000000000)))))

(declare-fun lt!58202 () Unit!2747)

(declare-fun lt!58214 () Unit!2747)

(assert (=> d!11416 (= lt!58202 lt!58214)))

(assert (=> d!11416 (isPrefixOf!0 (_2!1934 lt!57599) (_2!1934 lt!57599))))

(assert (=> d!11416 (= lt!58214 (lemmaIsPrefixRefl!0 (_2!1934 lt!57599)))))

(declare-fun lt!58203 () Unit!2747)

(declare-fun lt!58200 () Unit!2747)

(assert (=> d!11416 (= lt!58203 lt!58200)))

(assert (=> d!11416 (= lt!58200 (lemmaIsPrefixRefl!0 (_2!1934 lt!57599)))))

(declare-fun lt!58211 () Unit!2747)

(declare-fun lt!58217 () Unit!2747)

(assert (=> d!11416 (= lt!58211 lt!58217)))

(assert (=> d!11416 (isPrefixOf!0 lt!58209 lt!58209)))

(assert (=> d!11416 (= lt!58217 (lemmaIsPrefixRefl!0 lt!58209))))

(declare-fun lt!58215 () Unit!2747)

(declare-fun lt!58207 () Unit!2747)

(assert (=> d!11416 (= lt!58215 lt!58207)))

(assert (=> d!11416 (isPrefixOf!0 (_2!1934 lt!57603) (_2!1934 lt!57603))))

(assert (=> d!11416 (= lt!58207 (lemmaIsPrefixRefl!0 (_2!1934 lt!57603)))))

(assert (=> d!11416 (= lt!58209 (BitStream!1507 (buf!1203 (_2!1934 lt!57599)) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))))))

(assert (=> d!11416 (isPrefixOf!0 (_2!1934 lt!57603) (_2!1934 lt!57599))))

(assert (=> d!11416 (= (reader!0 (_2!1934 lt!57603) (_2!1934 lt!57599)) lt!58204)))

(declare-fun b!38239 () Bool)

(declare-fun res!32489 () Bool)

(assert (=> b!38239 (=> (not res!32489) (not e!25124))))

(assert (=> b!38239 (= res!32489 (isPrefixOf!0 (_2!1935 lt!58204) (_2!1934 lt!57599)))))

(declare-fun b!38240 () Bool)

(declare-fun lt!58201 () (_ BitVec 64))

(declare-fun lt!58218 () (_ BitVec 64))

(assert (=> b!38240 (= e!25124 (= (_1!1935 lt!58204) (withMovedBitIndex!0 (_2!1935 lt!58204) (bvsub lt!58218 lt!58201))))))

(assert (=> b!38240 (or (= (bvand lt!58218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58218 lt!58201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38240 (= lt!58201 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57599))) (currentByte!2609 (_2!1934 lt!57599)) (currentBit!2604 (_2!1934 lt!57599))))))

(assert (=> b!38240 (= lt!58218 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))))))

(declare-fun b!38241 () Bool)

(declare-fun Unit!2760 () Unit!2747)

(assert (=> b!38241 (= e!25125 Unit!2760)))

(declare-fun b!38242 () Bool)

(declare-fun lt!58208 () Unit!2747)

(assert (=> b!38242 (= e!25125 lt!58208)))

(declare-fun lt!58219 () (_ BitVec 64))

(assert (=> b!38242 (= lt!58219 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58212 () (_ BitVec 64))

(assert (=> b!38242 (= lt!58212 (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57603))) (currentByte!2609 (_2!1934 lt!57603)) (currentBit!2604 (_2!1934 lt!57603))))))

(assert (=> b!38242 (= lt!58208 (arrayBitRangesEqSymmetric!0 (buf!1203 (_2!1934 lt!57603)) (buf!1203 (_2!1934 lt!57599)) lt!58219 lt!58212))))

(assert (=> b!38242 (arrayBitRangesEq!0 (buf!1203 (_2!1934 lt!57599)) (buf!1203 (_2!1934 lt!57603)) lt!58219 lt!58212)))

(declare-fun b!38243 () Bool)

(declare-fun res!32487 () Bool)

(assert (=> b!38243 (=> (not res!32487) (not e!25124))))

(assert (=> b!38243 (= res!32487 (isPrefixOf!0 (_1!1935 lt!58204) (_2!1934 lt!57603)))))

(assert (= (and d!11416 c!2639) b!38242))

(assert (= (and d!11416 (not c!2639)) b!38241))

(assert (= (and d!11416 res!32488) b!38243))

(assert (= (and b!38243 res!32487) b!38239))

(assert (= (and b!38239 res!32489) b!38240))

(declare-fun m!58245 () Bool)

(assert (=> b!38239 m!58245))

(assert (=> b!38242 m!57691))

(declare-fun m!58247 () Bool)

(assert (=> b!38242 m!58247))

(declare-fun m!58249 () Bool)

(assert (=> b!38242 m!58249))

(declare-fun m!58251 () Bool)

(assert (=> b!38243 m!58251))

(declare-fun m!58253 () Bool)

(assert (=> d!11416 m!58253))

(assert (=> d!11416 m!57747))

(assert (=> d!11416 m!57953))

(declare-fun m!58255 () Bool)

(assert (=> d!11416 m!58255))

(declare-fun m!58257 () Bool)

(assert (=> d!11416 m!58257))

(declare-fun m!58259 () Bool)

(assert (=> d!11416 m!58259))

(assert (=> d!11416 m!58233))

(declare-fun m!58261 () Bool)

(assert (=> d!11416 m!58261))

(assert (=> d!11416 m!58237))

(declare-fun m!58263 () Bool)

(assert (=> d!11416 m!58263))

(assert (=> d!11416 m!57949))

(declare-fun m!58265 () Bool)

(assert (=> b!38240 m!58265))

(assert (=> b!38240 m!57777))

(assert (=> b!38240 m!57691))

(assert (=> b!37999 d!11416))

(declare-fun d!11418 () Bool)

(assert (=> d!11418 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603))) lt!57592) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57603))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57603)))) lt!57592))))

(declare-fun bs!3039 () Bool)

(assert (= bs!3039 d!11418))

(declare-fun m!58267 () Bool)

(assert (=> bs!3039 m!58267))

(assert (=> b!37999 d!11418))

(declare-fun b!38247 () Bool)

(declare-fun e!25126 () Bool)

(declare-fun lt!58220 () List!454)

(assert (=> b!38247 (= e!25126 (> (length!180 lt!58220) 0))))

(declare-fun b!38246 () Bool)

(assert (=> b!38246 (= e!25126 (isEmpty!108 lt!58220))))

(declare-fun d!11420 () Bool)

(assert (=> d!11420 e!25126))

(declare-fun c!2641 () Bool)

(assert (=> d!11420 (= c!2641 (= lt!57592 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25127 () tuple2!3710)

(assert (=> d!11420 (= lt!58220 (_1!1942 e!25127))))

(declare-fun c!2640 () Bool)

(assert (=> d!11420 (= c!2640 (= lt!57592 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11420 (bvsge lt!57592 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11420 (= (bitStreamReadBitsIntoList!0 (_2!1934 lt!57599) (_1!1935 lt!57602) lt!57592) lt!58220)))

(declare-fun b!38244 () Bool)

(assert (=> b!38244 (= e!25127 (tuple2!3711 Nil!451 (_1!1935 lt!57602)))))

(declare-fun lt!58221 () tuple2!3708)

(declare-fun lt!58222 () (_ BitVec 64))

(declare-fun b!38245 () Bool)

(assert (=> b!38245 (= e!25127 (tuple2!3711 (Cons!450 (_1!1941 lt!58221) (bitStreamReadBitsIntoList!0 (_2!1934 lt!57599) (_2!1941 lt!58221) (bvsub lt!57592 lt!58222))) (_2!1941 lt!58221)))))

(assert (=> b!38245 (= lt!58221 (readBit!0 (_1!1935 lt!57602)))))

(assert (=> b!38245 (= lt!58222 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!11420 c!2640) b!38244))

(assert (= (and d!11420 (not c!2640)) b!38245))

(assert (= (and d!11420 c!2641) b!38246))

(assert (= (and d!11420 (not c!2641)) b!38247))

(declare-fun m!58269 () Bool)

(assert (=> b!38247 m!58269))

(declare-fun m!58271 () Bool)

(assert (=> b!38246 m!58271))

(declare-fun m!58273 () Bool)

(assert (=> b!38245 m!58273))

(declare-fun m!58275 () Bool)

(assert (=> b!38245 m!58275))

(assert (=> b!37999 d!11420))

(declare-fun d!11422 () Bool)

(assert (=> d!11422 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1368 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3040 () Bool)

(assert (= bs!3040 d!11422))

(assert (=> bs!3040 m!57703))

(assert (=> bs!3040 m!57903))

(assert (=> b!37998 d!11422))

(declare-fun d!11424 () Bool)

(assert (=> d!11424 (= (head!291 (byteArrayBitContentToList!0 (_2!1934 lt!57599) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!569 (byteArrayBitContentToList!0 (_2!1934 lt!57599) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!37998 d!11424))

(declare-fun d!11426 () Bool)

(declare-fun c!2644 () Bool)

(assert (=> d!11426 (= c!2644 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25130 () List!454)

(assert (=> d!11426 (= (byteArrayBitContentToList!0 (_2!1934 lt!57599) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!25130)))

(declare-fun b!38252 () Bool)

(assert (=> b!38252 (= e!25130 Nil!451)))

(declare-fun b!38253 () Bool)

(assert (=> b!38253 (= e!25130 (Cons!450 (not (= (bvand ((_ sign_extend 24) (select (arr!1368 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1934 lt!57599) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11426 c!2644) b!38252))

(assert (= (and d!11426 (not c!2644)) b!38253))

(assert (=> b!38253 m!57703))

(assert (=> b!38253 m!57903))

(declare-fun m!58277 () Bool)

(assert (=> b!38253 m!58277))

(assert (=> b!37998 d!11426))

(declare-fun d!11428 () Bool)

(declare-fun e!25131 () Bool)

(assert (=> d!11428 e!25131))

(declare-fun res!32491 () Bool)

(assert (=> d!11428 (=> (not res!32491) (not e!25131))))

(declare-fun lt!58227 () (_ BitVec 64))

(declare-fun lt!58225 () (_ BitVec 64))

(declare-fun lt!58224 () (_ BitVec 64))

(assert (=> d!11428 (= res!32491 (= lt!58224 (bvsub lt!58227 lt!58225)))))

(assert (=> d!11428 (or (= (bvand lt!58227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58227 lt!58225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11428 (= lt!58225 (remainingBits!0 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))) ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57599))) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57599)))))))

(declare-fun lt!58226 () (_ BitVec 64))

(declare-fun lt!58228 () (_ BitVec 64))

(assert (=> d!11428 (= lt!58227 (bvmul lt!58226 lt!58228))))

(assert (=> d!11428 (or (= lt!58226 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!58228 (bvsdiv (bvmul lt!58226 lt!58228) lt!58226)))))

(assert (=> d!11428 (= lt!58228 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11428 (= lt!58226 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))))))

(assert (=> d!11428 (= lt!58224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2609 (_2!1934 lt!57599))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2604 (_2!1934 lt!57599)))))))

(assert (=> d!11428 (invariant!0 (currentBit!2604 (_2!1934 lt!57599)) (currentByte!2609 (_2!1934 lt!57599)) (size!875 (buf!1203 (_2!1934 lt!57599))))))

(assert (=> d!11428 (= (bitIndex!0 (size!875 (buf!1203 (_2!1934 lt!57599))) (currentByte!2609 (_2!1934 lt!57599)) (currentBit!2604 (_2!1934 lt!57599))) lt!58224)))

(declare-fun b!38254 () Bool)

(declare-fun res!32490 () Bool)

(assert (=> b!38254 (=> (not res!32490) (not e!25131))))

(assert (=> b!38254 (= res!32490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58224))))

(declare-fun b!38255 () Bool)

(declare-fun lt!58223 () (_ BitVec 64))

(assert (=> b!38255 (= e!25131 (bvsle lt!58224 (bvmul lt!58223 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!38255 (or (= lt!58223 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!58223 #b0000000000000000000000000000000000000000000000000000000000001000) lt!58223)))))

(assert (=> b!38255 (= lt!58223 ((_ sign_extend 32) (size!875 (buf!1203 (_2!1934 lt!57599)))))))

(assert (= (and d!11428 res!32491) b!38254))

(assert (= (and b!38254 res!32490) b!38255))

(declare-fun m!58279 () Bool)

(assert (=> d!11428 m!58279))

(assert (=> d!11428 m!57697))

(assert (=> b!37977 d!11428))

(declare-fun d!11430 () Bool)

(assert (=> d!11430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!875 (buf!1203 thiss!1379))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!875 (buf!1203 thiss!1379))) ((_ sign_extend 32) (currentByte!2609 thiss!1379)) ((_ sign_extend 32) (currentBit!2604 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3041 () Bool)

(assert (= bs!3041 d!11430))

(assert (=> bs!3041 m!58107))

(assert (=> b!37987 d!11430))

(declare-fun d!11432 () Bool)

(assert (=> d!11432 (= (bitAt!0 (buf!1203 (_2!1934 lt!57603)) lt!57598) (not (= (bvand ((_ sign_extend 24) (select (arr!1368 (buf!1203 (_2!1934 lt!57603))) ((_ extract 31 0) (bvsdiv lt!57598 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57598 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3042 () Bool)

(assert (= bs!3042 d!11432))

(declare-fun m!58281 () Bool)

(assert (=> bs!3042 m!58281))

(assert (=> bs!3042 m!58201))

(assert (=> b!37986 d!11432))

(declare-fun d!11434 () Bool)

(assert (=> d!11434 (= (head!291 (byteArrayBitContentToList!0 (_2!1934 lt!57603) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!569 (byteArrayBitContentToList!0 (_2!1934 lt!57603) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37997 d!11434))

(declare-fun d!11436 () Bool)

(declare-fun c!2645 () Bool)

(assert (=> d!11436 (= c!2645 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25132 () List!454)

(assert (=> d!11436 (= (byteArrayBitContentToList!0 (_2!1934 lt!57603) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!25132)))

(declare-fun b!38256 () Bool)

(assert (=> b!38256 (= e!25132 Nil!451)))

(declare-fun b!38257 () Bool)

(assert (=> b!38257 (= e!25132 (Cons!450 (not (= (bvand ((_ sign_extend 24) (select (arr!1368 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1934 lt!57603) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11436 c!2645) b!38256))

(assert (= (and d!11436 (not c!2645)) b!38257))

(assert (=> b!38257 m!57703))

(assert (=> b!38257 m!57903))

(declare-fun m!58283 () Bool)

(assert (=> b!38257 m!58283))

(assert (=> b!37997 d!11436))

(declare-fun d!11438 () Bool)

(assert (=> d!11438 (= (head!291 (bitStreamReadBitsIntoList!0 (_2!1934 lt!57603) (_1!1935 lt!57615) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!569 (bitStreamReadBitsIntoList!0 (_2!1934 lt!57603) (_1!1935 lt!57615) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37997 d!11438))

(declare-fun b!38261 () Bool)

(declare-fun e!25133 () Bool)

(declare-fun lt!58229 () List!454)

(assert (=> b!38261 (= e!25133 (> (length!180 lt!58229) 0))))

(declare-fun b!38260 () Bool)

(assert (=> b!38260 (= e!25133 (isEmpty!108 lt!58229))))

(declare-fun d!11440 () Bool)

(assert (=> d!11440 e!25133))

(declare-fun c!2647 () Bool)

(assert (=> d!11440 (= c!2647 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25134 () tuple2!3710)

(assert (=> d!11440 (= lt!58229 (_1!1942 e!25134))))

(declare-fun c!2646 () Bool)

(assert (=> d!11440 (= c!2646 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11440 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11440 (= (bitStreamReadBitsIntoList!0 (_2!1934 lt!57603) (_1!1935 lt!57615) #b0000000000000000000000000000000000000000000000000000000000000001) lt!58229)))

(declare-fun b!38258 () Bool)

(assert (=> b!38258 (= e!25134 (tuple2!3711 Nil!451 (_1!1935 lt!57615)))))

(declare-fun lt!58230 () tuple2!3708)

(declare-fun lt!58231 () (_ BitVec 64))

(declare-fun b!38259 () Bool)

(assert (=> b!38259 (= e!25134 (tuple2!3711 (Cons!450 (_1!1941 lt!58230) (bitStreamReadBitsIntoList!0 (_2!1934 lt!57603) (_2!1941 lt!58230) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!58231))) (_2!1941 lt!58230)))))

(assert (=> b!38259 (= lt!58230 (readBit!0 (_1!1935 lt!57615)))))

(assert (=> b!38259 (= lt!58231 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!11440 c!2646) b!38258))

(assert (= (and d!11440 (not c!2646)) b!38259))

(assert (= (and d!11440 c!2647) b!38260))

(assert (= (and d!11440 (not c!2647)) b!38261))

(declare-fun m!58285 () Bool)

(assert (=> b!38261 m!58285))

(declare-fun m!58287 () Bool)

(assert (=> b!38260 m!58287))

(declare-fun m!58289 () Bool)

(assert (=> b!38259 m!58289))

(declare-fun m!58291 () Bool)

(assert (=> b!38259 m!58291))

(assert (=> b!37997 d!11440))

(declare-fun d!11442 () Bool)

(assert (=> d!11442 (= (head!291 lt!57596) (h!569 lt!57596))))

(assert (=> b!37996 d!11442))

(declare-fun d!11444 () Bool)

(assert (=> d!11444 (= (array_inv!806 (buf!1203 thiss!1379)) (bvsge (size!875 (buf!1203 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!37985 d!11444))

(declare-fun d!11446 () Bool)

(assert (=> d!11446 (= (bitAt!0 (buf!1203 (_1!1935 lt!57602)) lt!57598) (not (= (bvand ((_ sign_extend 24) (select (arr!1368 (buf!1203 (_1!1935 lt!57602))) ((_ extract 31 0) (bvsdiv lt!57598 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57598 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3043 () Bool)

(assert (= bs!3043 d!11446))

(declare-fun m!58293 () Bool)

(assert (=> bs!3043 m!58293))

(assert (=> bs!3043 m!58201))

(assert (=> b!37984 d!11446))

(declare-fun d!11448 () Bool)

(assert (=> d!11448 (= (bitAt!0 (buf!1203 (_1!1935 lt!57597)) lt!57598) (not (= (bvand ((_ sign_extend 24) (select (arr!1368 (buf!1203 (_1!1935 lt!57597))) ((_ extract 31 0) (bvsdiv lt!57598 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57598 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3044 () Bool)

(assert (= bs!3044 d!11448))

(declare-fun m!58295 () Bool)

(assert (=> bs!3044 m!58295))

(assert (=> bs!3044 m!58201))

(assert (=> b!37984 d!11448))

(declare-fun d!11450 () Bool)

(assert (=> d!11450 (= (invariant!0 (currentBit!2604 (_2!1934 lt!57599)) (currentByte!2609 (_2!1934 lt!57599)) (size!875 (buf!1203 (_2!1934 lt!57599)))) (and (bvsge (currentBit!2604 (_2!1934 lt!57599)) #b00000000000000000000000000000000) (bvslt (currentBit!2604 (_2!1934 lt!57599)) #b00000000000000000000000000001000) (bvsge (currentByte!2609 (_2!1934 lt!57599)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2609 (_2!1934 lt!57599)) (size!875 (buf!1203 (_2!1934 lt!57599)))) (and (= (currentBit!2604 (_2!1934 lt!57599)) #b00000000000000000000000000000000) (= (currentByte!2609 (_2!1934 lt!57599)) (size!875 (buf!1203 (_2!1934 lt!57599))))))))))

(assert (=> b!37995 d!11450))

(check-sat (not b!38108) (not b!38235) (not d!11404) (not b!38101) (not d!11412) (not b!38122) (not d!11342) (not d!11414) (not b!38173) (not b!38245) (not b!38246) (not b!38100) (not b!38257) (not d!11340) (not d!11326) (not b!38098) (not d!11392) (not b!38240) (not d!11330) (not d!11418) (not b!38199) (not d!11324) (not b!38233) (not b!38200) (not b!38124) (not b!38103) (not b!38123) (not b!38170) (not b!38231) (not b!38120) (not b!38242) (not b!38237) (not d!11348) (not d!11410) (not b!38172) (not d!11328) (not b!38080) (not b!38104) (not b!38106) (not d!11428) (not b!38232) (not d!11382) (not b!38261) (not d!11430) (not b!38075) (not b!38239) (not b!38243) (not b!38102) (not b!38099) (not d!11338) (not d!11386) (not d!11344) (not d!11402) (not d!11388) (not b!38259) (not b!38119) (not b!38260) (not b!38168) (not b!38238) (not b!38253) (not b!38202) (not b!38247) (not b!38171) (not d!11394) (not d!11378) (not b!38126) (not b!38174) (not bm!472) (not d!11416) (not b!38077) (not b!38105) (not b!38234))
