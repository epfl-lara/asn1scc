; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40554 () Bool)

(assert start!40554)

(declare-fun b!186537 () Bool)

(declare-fun e!129071 () Bool)

(declare-fun e!129079 () Bool)

(assert (=> b!186537 (= e!129071 e!129079)))

(declare-fun res!155333 () Bool)

(assert (=> b!186537 (=> (not res!155333) (not e!129079))))

(declare-fun lt!288128 () Bool)

(declare-datatypes ((array!9830 0))(
  ( (array!9831 (arr!5265 (Array (_ BitVec 32) (_ BitVec 8))) (size!4335 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7778 0))(
  ( (BitStream!7779 (buf!4798 array!9830) (currentByte!9048 (_ BitVec 32)) (currentBit!9043 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16148 0))(
  ( (tuple2!16149 (_1!8719 BitStream!7778) (_2!8719 Bool)) )
))
(declare-fun lt!288132 () tuple2!16148)

(declare-datatypes ((Unit!13339 0))(
  ( (Unit!13340) )
))
(declare-datatypes ((tuple2!16150 0))(
  ( (tuple2!16151 (_1!8720 Unit!13339) (_2!8720 BitStream!7778)) )
))
(declare-fun lt!288133 () tuple2!16150)

(assert (=> b!186537 (= res!155333 (and (= (_2!8719 lt!288132) lt!288128) (= (_1!8719 lt!288132) (_2!8720 lt!288133))))))

(declare-fun thiss!1204 () BitStream!7778)

(declare-fun readBitPure!0 (BitStream!7778) tuple2!16148)

(declare-fun readerFrom!0 (BitStream!7778 (_ BitVec 32) (_ BitVec 32)) BitStream!7778)

(assert (=> b!186537 (= lt!288132 (readBitPure!0 (readerFrom!0 (_2!8720 lt!288133) (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204))))))

(declare-fun b!186538 () Bool)

(declare-fun e!129080 () Bool)

(declare-fun e!129078 () Bool)

(assert (=> b!186538 (= e!129080 (not e!129078))))

(declare-fun res!155328 () Bool)

(assert (=> b!186538 (=> res!155328 e!129078)))

(declare-fun lt!288125 () (_ BitVec 64))

(declare-fun lt!288126 () (_ BitVec 64))

(assert (=> b!186538 (= res!155328 (not (= lt!288125 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!288126))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186538 (= lt!288125 (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))))))

(assert (=> b!186538 (= lt!288126 (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)))))

(declare-fun e!129074 () Bool)

(assert (=> b!186538 e!129074))

(declare-fun res!155337 () Bool)

(assert (=> b!186538 (=> (not res!155337) (not e!129074))))

(assert (=> b!186538 (= res!155337 (= (size!4335 (buf!4798 thiss!1204)) (size!4335 (buf!4798 (_2!8720 lt!288133)))))))

(declare-fun appendBit!0 (BitStream!7778 Bool) tuple2!16150)

(assert (=> b!186538 (= lt!288133 (appendBit!0 thiss!1204 lt!288128))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!288129 () (_ BitVec 64))

(assert (=> b!186538 (= lt!288128 (not (= (bvand v!189 lt!288129) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!186538 (= lt!288129 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!186539 () Bool)

(declare-fun res!155336 () Bool)

(declare-fun e!129073 () Bool)

(assert (=> b!186539 (=> res!155336 e!129073)))

(declare-fun lt!288122 () tuple2!16150)

(declare-fun isPrefixOf!0 (BitStream!7778 BitStream!7778) Bool)

(assert (=> b!186539 (= res!155336 (not (isPrefixOf!0 (_2!8720 lt!288133) (_2!8720 lt!288122))))))

(declare-fun b!186540 () Bool)

(declare-fun res!155324 () Bool)

(assert (=> b!186540 (=> (not res!155324) (not e!129071))))

(assert (=> b!186540 (= res!155324 (isPrefixOf!0 thiss!1204 (_2!8720 lt!288133)))))

(declare-fun b!186541 () Bool)

(declare-fun e!129070 () Bool)

(assert (=> b!186541 (= e!129073 e!129070)))

(declare-fun res!155339 () Bool)

(assert (=> b!186541 (=> res!155339 e!129070)))

(declare-fun lt!288134 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!16152 0))(
  ( (tuple2!16153 (_1!8721 BitStream!7778) (_2!8721 BitStream!7778)) )
))
(declare-fun lt!288118 () tuple2!16152)

(declare-datatypes ((tuple2!16154 0))(
  ( (tuple2!16155 (_1!8722 BitStream!7778) (_2!8722 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16154)

(assert (=> b!186541 (= res!155339 (not (= (_1!8722 (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288118) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288134)) (_2!8721 lt!288118))))))

(declare-fun lt!288124 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186541 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133))) lt!288124)))

(declare-fun lt!288115 () Unit!13339)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7778 array!9830 (_ BitVec 64)) Unit!13339)

(assert (=> b!186541 (= lt!288115 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8720 lt!288133) (buf!4798 (_2!8720 lt!288122)) lt!288124))))

(assert (=> b!186541 (= lt!288124 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!288121 () tuple2!16148)

(declare-fun lt!288119 () (_ BitVec 64))

(assert (=> b!186541 (= lt!288134 (bvor lt!288119 (ite (_2!8719 lt!288121) lt!288129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!288112 () tuple2!16154)

(declare-fun lt!288117 () tuple2!16152)

(assert (=> b!186541 (= lt!288112 (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288117) nBits!348 i!590 lt!288119))))

(declare-fun lt!288130 () (_ BitVec 64))

(assert (=> b!186541 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))) ((_ sign_extend 32) (currentByte!9048 thiss!1204)) ((_ sign_extend 32) (currentBit!9043 thiss!1204)) lt!288130)))

(declare-fun lt!288135 () Unit!13339)

(assert (=> b!186541 (= lt!288135 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4798 (_2!8720 lt!288122)) lt!288130))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186541 (= lt!288119 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!186541 (= (_2!8719 lt!288121) lt!288128)))

(assert (=> b!186541 (= lt!288121 (readBitPure!0 (_1!8721 lt!288117)))))

(declare-fun reader!0 (BitStream!7778 BitStream!7778) tuple2!16152)

(assert (=> b!186541 (= lt!288118 (reader!0 (_2!8720 lt!288133) (_2!8720 lt!288122)))))

(assert (=> b!186541 (= lt!288117 (reader!0 thiss!1204 (_2!8720 lt!288122)))))

(declare-fun e!129081 () Bool)

(assert (=> b!186541 e!129081))

(declare-fun res!155327 () Bool)

(assert (=> b!186541 (=> (not res!155327) (not e!129081))))

(declare-fun lt!288136 () tuple2!16148)

(declare-fun lt!288131 () tuple2!16148)

(assert (=> b!186541 (= res!155327 (= (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288136))) (currentByte!9048 (_1!8719 lt!288136)) (currentBit!9043 (_1!8719 lt!288136))) (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288131))) (currentByte!9048 (_1!8719 lt!288131)) (currentBit!9043 (_1!8719 lt!288131)))))))

(declare-fun lt!288120 () Unit!13339)

(declare-fun lt!288116 () BitStream!7778)

(declare-fun readBitPrefixLemma!0 (BitStream!7778 BitStream!7778) Unit!13339)

(assert (=> b!186541 (= lt!288120 (readBitPrefixLemma!0 lt!288116 (_2!8720 lt!288122)))))

(assert (=> b!186541 (= lt!288131 (readBitPure!0 (BitStream!7779 (buf!4798 (_2!8720 lt!288122)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204))))))

(assert (=> b!186541 (= lt!288136 (readBitPure!0 lt!288116))))

(declare-fun e!129076 () Bool)

(assert (=> b!186541 e!129076))

(declare-fun res!155326 () Bool)

(assert (=> b!186541 (=> (not res!155326) (not e!129076))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186541 (= res!155326 (invariant!0 (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204) (size!4335 (buf!4798 (_2!8720 lt!288133)))))))

(assert (=> b!186541 (= lt!288116 (BitStream!7779 (buf!4798 (_2!8720 lt!288133)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)))))

(declare-fun b!186542 () Bool)

(declare-fun res!155322 () Bool)

(assert (=> b!186542 (=> (not res!155322) (not e!129080))))

(assert (=> b!186542 (= res!155322 (invariant!0 (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204) (size!4335 (buf!4798 thiss!1204))))))

(declare-fun b!186543 () Bool)

(declare-fun e!129072 () Bool)

(assert (=> b!186543 (= e!129072 e!129080)))

(declare-fun res!155331 () Bool)

(assert (=> b!186543 (=> (not res!155331) (not e!129080))))

(assert (=> b!186543 (= res!155331 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 thiss!1204))) ((_ sign_extend 32) (currentByte!9048 thiss!1204)) ((_ sign_extend 32) (currentBit!9043 thiss!1204)) lt!288130))))

(assert (=> b!186543 (= lt!288130 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!155338 () Bool)

(assert (=> start!40554 (=> (not res!155338) (not e!129072))))

(assert (=> start!40554 (= res!155338 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40554 e!129072))

(assert (=> start!40554 true))

(declare-fun e!129075 () Bool)

(declare-fun inv!12 (BitStream!7778) Bool)

(assert (=> start!40554 (and (inv!12 thiss!1204) e!129075)))

(declare-fun b!186544 () Bool)

(declare-fun res!155332 () Bool)

(assert (=> b!186544 (=> res!155332 e!129073)))

(assert (=> b!186544 (= res!155332 (not (isPrefixOf!0 thiss!1204 (_2!8720 lt!288133))))))

(declare-fun b!186545 () Bool)

(assert (=> b!186545 (= e!129070 (invariant!0 (currentBit!9043 (_2!8720 lt!288133)) (currentByte!9048 (_2!8720 lt!288133)) (size!4335 (buf!4798 (_2!8720 lt!288133)))))))

(declare-fun e!129077 () Bool)

(assert (=> b!186545 e!129077))

(declare-fun res!155335 () Bool)

(assert (=> b!186545 (=> (not res!155335) (not e!129077))))

(declare-fun lt!288113 () tuple2!16154)

(assert (=> b!186545 (= res!155335 (and (= (_2!8722 lt!288112) (_2!8722 lt!288113)) (= (_1!8722 lt!288112) (_1!8722 lt!288113))))))

(declare-fun lt!288123 () Unit!13339)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13339)

(assert (=> b!186545 (= lt!288123 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8721 lt!288117) nBits!348 i!590 lt!288119))))

(declare-fun withMovedBitIndex!0 (BitStream!7778 (_ BitVec 64)) BitStream!7778)

(assert (=> b!186545 (= lt!288113 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8721 lt!288117) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288134))))

(declare-fun b!186546 () Bool)

(declare-fun res!155330 () Bool)

(assert (=> b!186546 (=> (not res!155330) (not e!129077))))

(declare-fun lt!288110 () (_ BitVec 64))

(assert (=> b!186546 (= res!155330 (= (_1!8721 lt!288117) (withMovedBitIndex!0 (_2!8721 lt!288117) (bvsub lt!288126 lt!288110))))))

(declare-fun b!186547 () Bool)

(assert (=> b!186547 (= e!129074 e!129071)))

(declare-fun res!155334 () Bool)

(assert (=> b!186547 (=> (not res!155334) (not e!129071))))

(declare-fun lt!288111 () (_ BitVec 64))

(declare-fun lt!288114 () (_ BitVec 64))

(assert (=> b!186547 (= res!155334 (= lt!288111 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!288114)))))

(assert (=> b!186547 (= lt!288111 (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))))))

(assert (=> b!186547 (= lt!288114 (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)))))

(declare-fun b!186548 () Bool)

(declare-fun res!155340 () Bool)

(assert (=> b!186548 (=> (not res!155340) (not e!129080))))

(assert (=> b!186548 (= res!155340 (not (= i!590 nBits!348)))))

(declare-fun b!186549 () Bool)

(assert (=> b!186549 (= e!129081 (= (_2!8719 lt!288136) (_2!8719 lt!288131)))))

(declare-fun b!186550 () Bool)

(assert (=> b!186550 (= e!129077 (= (_1!8721 lt!288118) (withMovedBitIndex!0 (_2!8721 lt!288118) (bvsub lt!288125 lt!288110))))))

(declare-fun b!186551 () Bool)

(assert (=> b!186551 (= e!129078 e!129073)))

(declare-fun res!155325 () Bool)

(assert (=> b!186551 (=> res!155325 e!129073)))

(assert (=> b!186551 (= res!155325 (not (= lt!288110 (bvsub (bvsub (bvadd lt!288125 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!186551 (= lt!288110 (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288122))) (currentByte!9048 (_2!8720 lt!288122)) (currentBit!9043 (_2!8720 lt!288122))))))

(assert (=> b!186551 (isPrefixOf!0 thiss!1204 (_2!8720 lt!288122))))

(declare-fun lt!288127 () Unit!13339)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7778 BitStream!7778 BitStream!7778) Unit!13339)

(assert (=> b!186551 (= lt!288127 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8720 lt!288133) (_2!8720 lt!288122)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7778 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16150)

(assert (=> b!186551 (= lt!288122 (appendBitsLSBFirstLoopTR!0 (_2!8720 lt!288133) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!186552 () Bool)

(declare-fun array_inv!4076 (array!9830) Bool)

(assert (=> b!186552 (= e!129075 (array_inv!4076 (buf!4798 thiss!1204)))))

(declare-fun b!186553 () Bool)

(declare-fun res!155329 () Bool)

(assert (=> b!186553 (=> res!155329 e!129073)))

(assert (=> b!186553 (= res!155329 (or (not (= (size!4335 (buf!4798 (_2!8720 lt!288122))) (size!4335 (buf!4798 thiss!1204)))) (not (= lt!288110 (bvsub (bvadd lt!288126 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!186554 () Bool)

(assert (=> b!186554 (= e!129079 (= (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288132))) (currentByte!9048 (_1!8719 lt!288132)) (currentBit!9043 (_1!8719 lt!288132))) lt!288111))))

(declare-fun b!186555 () Bool)

(assert (=> b!186555 (= e!129076 (invariant!0 (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204) (size!4335 (buf!4798 (_2!8720 lt!288122)))))))

(declare-fun b!186556 () Bool)

(declare-fun res!155323 () Bool)

(assert (=> b!186556 (=> res!155323 e!129073)))

(assert (=> b!186556 (= res!155323 (not (invariant!0 (currentBit!9043 (_2!8720 lt!288122)) (currentByte!9048 (_2!8720 lt!288122)) (size!4335 (buf!4798 (_2!8720 lt!288122))))))))

(assert (= (and start!40554 res!155338) b!186543))

(assert (= (and b!186543 res!155331) b!186542))

(assert (= (and b!186542 res!155322) b!186548))

(assert (= (and b!186548 res!155340) b!186538))

(assert (= (and b!186538 res!155337) b!186547))

(assert (= (and b!186547 res!155334) b!186540))

(assert (= (and b!186540 res!155324) b!186537))

(assert (= (and b!186537 res!155333) b!186554))

(assert (= (and b!186538 (not res!155328)) b!186551))

(assert (= (and b!186551 (not res!155325)) b!186556))

(assert (= (and b!186556 (not res!155323)) b!186553))

(assert (= (and b!186553 (not res!155329)) b!186539))

(assert (= (and b!186539 (not res!155336)) b!186544))

(assert (= (and b!186544 (not res!155332)) b!186541))

(assert (= (and b!186541 res!155326) b!186555))

(assert (= (and b!186541 res!155327) b!186549))

(assert (= (and b!186541 (not res!155339)) b!186545))

(assert (= (and b!186545 res!155335) b!186546))

(assert (= (and b!186546 res!155330) b!186550))

(assert (= start!40554 b!186552))

(declare-fun m!289967 () Bool)

(assert (=> b!186554 m!289967))

(declare-fun m!289969 () Bool)

(assert (=> b!186537 m!289969))

(assert (=> b!186537 m!289969))

(declare-fun m!289971 () Bool)

(assert (=> b!186537 m!289971))

(declare-fun m!289973 () Bool)

(assert (=> b!186542 m!289973))

(declare-fun m!289975 () Bool)

(assert (=> b!186539 m!289975))

(declare-fun m!289977 () Bool)

(assert (=> b!186555 m!289977))

(declare-fun m!289979 () Bool)

(assert (=> start!40554 m!289979))

(declare-fun m!289981 () Bool)

(assert (=> b!186543 m!289981))

(declare-fun m!289983 () Bool)

(assert (=> b!186556 m!289983))

(declare-fun m!289985 () Bool)

(assert (=> b!186550 m!289985))

(declare-fun m!289987 () Bool)

(assert (=> b!186552 m!289987))

(declare-fun m!289989 () Bool)

(assert (=> b!186541 m!289989))

(declare-fun m!289991 () Bool)

(assert (=> b!186541 m!289991))

(declare-fun m!289993 () Bool)

(assert (=> b!186541 m!289993))

(declare-fun m!289995 () Bool)

(assert (=> b!186541 m!289995))

(declare-fun m!289997 () Bool)

(assert (=> b!186541 m!289997))

(declare-fun m!289999 () Bool)

(assert (=> b!186541 m!289999))

(declare-fun m!290001 () Bool)

(assert (=> b!186541 m!290001))

(declare-fun m!290003 () Bool)

(assert (=> b!186541 m!290003))

(declare-fun m!290005 () Bool)

(assert (=> b!186541 m!290005))

(declare-fun m!290007 () Bool)

(assert (=> b!186541 m!290007))

(declare-fun m!290009 () Bool)

(assert (=> b!186541 m!290009))

(declare-fun m!290011 () Bool)

(assert (=> b!186541 m!290011))

(declare-fun m!290013 () Bool)

(assert (=> b!186541 m!290013))

(declare-fun m!290015 () Bool)

(assert (=> b!186541 m!290015))

(declare-fun m!290017 () Bool)

(assert (=> b!186541 m!290017))

(declare-fun m!290019 () Bool)

(assert (=> b!186541 m!290019))

(declare-fun m!290021 () Bool)

(assert (=> b!186551 m!290021))

(declare-fun m!290023 () Bool)

(assert (=> b!186551 m!290023))

(declare-fun m!290025 () Bool)

(assert (=> b!186551 m!290025))

(declare-fun m!290027 () Bool)

(assert (=> b!186551 m!290027))

(declare-fun m!290029 () Bool)

(assert (=> b!186540 m!290029))

(declare-fun m!290031 () Bool)

(assert (=> b!186546 m!290031))

(declare-fun m!290033 () Bool)

(assert (=> b!186547 m!290033))

(declare-fun m!290035 () Bool)

(assert (=> b!186547 m!290035))

(assert (=> b!186538 m!290033))

(assert (=> b!186538 m!290035))

(declare-fun m!290037 () Bool)

(assert (=> b!186538 m!290037))

(assert (=> b!186544 m!290029))

(declare-fun m!290039 () Bool)

(assert (=> b!186545 m!290039))

(declare-fun m!290041 () Bool)

(assert (=> b!186545 m!290041))

(declare-fun m!290043 () Bool)

(assert (=> b!186545 m!290043))

(assert (=> b!186545 m!290043))

(declare-fun m!290045 () Bool)

(assert (=> b!186545 m!290045))

(push 1)

(assert (not b!186538))

(assert (not b!186540))

(assert (not b!186539))

(assert (not b!186541))

(assert (not b!186554))

(assert (not b!186555))

(assert (not b!186537))

(assert (not b!186543))

(assert (not b!186542))

(assert (not b!186545))

(assert (not start!40554))

(assert (not b!186556))

(assert (not b!186547))

(assert (not b!186551))

(assert (not b!186544))

(assert (not b!186550))

(assert (not b!186546))

(assert (not b!186552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64265 () Bool)

(declare-fun e!129090 () Bool)

(assert (=> d!64265 e!129090))

(declare-fun res!155355 () Bool)

(assert (=> d!64265 (=> (not res!155355) (not e!129090))))

(declare-fun lt!288180 () (_ BitVec 64))

(declare-fun lt!288179 () (_ BitVec 64))

(declare-fun lt!288184 () (_ BitVec 64))

(assert (=> d!64265 (= res!155355 (= lt!288180 (bvsub lt!288179 lt!288184)))))

(assert (=> d!64265 (or (= (bvand lt!288179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288184 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288179 lt!288184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64265 (= lt!288184 (remainingBits!0 ((_ sign_extend 32) (size!4335 (buf!4798 (_1!8719 lt!288132)))) ((_ sign_extend 32) (currentByte!9048 (_1!8719 lt!288132))) ((_ sign_extend 32) (currentBit!9043 (_1!8719 lt!288132)))))))

(declare-fun lt!288182 () (_ BitVec 64))

(declare-fun lt!288181 () (_ BitVec 64))

(assert (=> d!64265 (= lt!288179 (bvmul lt!288182 lt!288181))))

(assert (=> d!64265 (or (= lt!288182 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288181 (bvsdiv (bvmul lt!288182 lt!288181) lt!288182)))))

(assert (=> d!64265 (= lt!288181 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64265 (= lt!288182 ((_ sign_extend 32) (size!4335 (buf!4798 (_1!8719 lt!288132)))))))

(assert (=> d!64265 (= lt!288180 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9048 (_1!8719 lt!288132))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9043 (_1!8719 lt!288132)))))))

(assert (=> d!64265 (invariant!0 (currentBit!9043 (_1!8719 lt!288132)) (currentByte!9048 (_1!8719 lt!288132)) (size!4335 (buf!4798 (_1!8719 lt!288132))))))

(assert (=> d!64265 (= (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288132))) (currentByte!9048 (_1!8719 lt!288132)) (currentBit!9043 (_1!8719 lt!288132))) lt!288180)))

(declare-fun b!186571 () Bool)

(declare-fun res!155356 () Bool)

(assert (=> b!186571 (=> (not res!155356) (not e!129090))))

(assert (=> b!186571 (= res!155356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288180))))

(declare-fun b!186572 () Bool)

(declare-fun lt!288183 () (_ BitVec 64))

(assert (=> b!186572 (= e!129090 (bvsle lt!288180 (bvmul lt!288183 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186572 (or (= lt!288183 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288183 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288183)))))

(assert (=> b!186572 (= lt!288183 ((_ sign_extend 32) (size!4335 (buf!4798 (_1!8719 lt!288132)))))))

(assert (= (and d!64265 res!155355) b!186571))

(assert (= (and b!186571 res!155356) b!186572))

(declare-fun m!290055 () Bool)

(assert (=> d!64265 m!290055))

(declare-fun m!290057 () Bool)

(assert (=> d!64265 m!290057))

(assert (=> b!186554 d!64265))

(declare-fun d!64273 () Bool)

(assert (=> d!64273 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204) (size!4335 (buf!4798 thiss!1204))))))

(declare-fun bs!15996 () Bool)

(assert (= bs!15996 d!64273))

(assert (=> bs!15996 m!289973))

(assert (=> start!40554 d!64273))

(declare-fun d!64275 () Bool)

(assert (=> d!64275 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 thiss!1204))) ((_ sign_extend 32) (currentByte!9048 thiss!1204)) ((_ sign_extend 32) (currentBit!9043 thiss!1204)) lt!288130) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4335 (buf!4798 thiss!1204))) ((_ sign_extend 32) (currentByte!9048 thiss!1204)) ((_ sign_extend 32) (currentBit!9043 thiss!1204))) lt!288130))))

(declare-fun bs!15997 () Bool)

(assert (= bs!15997 d!64275))

(declare-fun m!290059 () Bool)

(assert (=> bs!15997 m!290059))

(assert (=> b!186543 d!64275))

(declare-fun d!64277 () Bool)

(assert (=> d!64277 (= (invariant!0 (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204) (size!4335 (buf!4798 thiss!1204))) (and (bvsge (currentBit!9043 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9043 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9048 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9048 thiss!1204) (size!4335 (buf!4798 thiss!1204))) (and (= (currentBit!9043 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9048 thiss!1204) (size!4335 (buf!4798 thiss!1204)))))))))

(assert (=> b!186542 d!64277))

(declare-fun d!64279 () Bool)

(assert (=> d!64279 (= (array_inv!4076 (buf!4798 thiss!1204)) (bvsge (size!4335 (buf!4798 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!186552 d!64279))

(declare-fun d!64281 () Bool)

(declare-fun e!129099 () Bool)

(assert (=> d!64281 e!129099))

(declare-fun res!155371 () Bool)

(assert (=> d!64281 (=> (not res!155371) (not e!129099))))

(declare-fun lt!288202 () (_ BitVec 64))

(declare-fun lt!288201 () BitStream!7778)

(assert (=> d!64281 (= res!155371 (= (bvadd lt!288202 (bvsub lt!288126 lt!288110)) (bitIndex!0 (size!4335 (buf!4798 lt!288201)) (currentByte!9048 lt!288201) (currentBit!9043 lt!288201))))))

(assert (=> d!64281 (or (not (= (bvand lt!288202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288126 lt!288110) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288202 (bvsub lt!288126 lt!288110)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64281 (= lt!288202 (bitIndex!0 (size!4335 (buf!4798 (_2!8721 lt!288117))) (currentByte!9048 (_2!8721 lt!288117)) (currentBit!9043 (_2!8721 lt!288117))))))

(declare-fun moveBitIndex!0 (BitStream!7778 (_ BitVec 64)) tuple2!16150)

(assert (=> d!64281 (= lt!288201 (_2!8720 (moveBitIndex!0 (_2!8721 lt!288117) (bvsub lt!288126 lt!288110))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7778 (_ BitVec 64)) Bool)

(assert (=> d!64281 (moveBitIndexPrecond!0 (_2!8721 lt!288117) (bvsub lt!288126 lt!288110))))

(assert (=> d!64281 (= (withMovedBitIndex!0 (_2!8721 lt!288117) (bvsub lt!288126 lt!288110)) lt!288201)))

(declare-fun b!186588 () Bool)

(assert (=> b!186588 (= e!129099 (= (size!4335 (buf!4798 (_2!8721 lt!288117))) (size!4335 (buf!4798 lt!288201))))))

(assert (= (and d!64281 res!155371) b!186588))

(declare-fun m!290075 () Bool)

(assert (=> d!64281 m!290075))

(declare-fun m!290077 () Bool)

(assert (=> d!64281 m!290077))

(declare-fun m!290079 () Bool)

(assert (=> d!64281 m!290079))

(declare-fun m!290081 () Bool)

(assert (=> d!64281 m!290081))

(assert (=> b!186546 d!64281))

(declare-fun d!64287 () Bool)

(assert (=> d!64287 (= (invariant!0 (currentBit!9043 (_2!8720 lt!288122)) (currentByte!9048 (_2!8720 lt!288122)) (size!4335 (buf!4798 (_2!8720 lt!288122)))) (and (bvsge (currentBit!9043 (_2!8720 lt!288122)) #b00000000000000000000000000000000) (bvslt (currentBit!9043 (_2!8720 lt!288122)) #b00000000000000000000000000001000) (bvsge (currentByte!9048 (_2!8720 lt!288122)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9048 (_2!8720 lt!288122)) (size!4335 (buf!4798 (_2!8720 lt!288122)))) (and (= (currentBit!9043 (_2!8720 lt!288122)) #b00000000000000000000000000000000) (= (currentByte!9048 (_2!8720 lt!288122)) (size!4335 (buf!4798 (_2!8720 lt!288122))))))))))

(assert (=> b!186556 d!64287))

(declare-fun d!64289 () Bool)

(assert (=> d!64289 (= (invariant!0 (currentBit!9043 (_2!8720 lt!288133)) (currentByte!9048 (_2!8720 lt!288133)) (size!4335 (buf!4798 (_2!8720 lt!288133)))) (and (bvsge (currentBit!9043 (_2!8720 lt!288133)) #b00000000000000000000000000000000) (bvslt (currentBit!9043 (_2!8720 lt!288133)) #b00000000000000000000000000001000) (bvsge (currentByte!9048 (_2!8720 lt!288133)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9048 (_2!8720 lt!288133)) (size!4335 (buf!4798 (_2!8720 lt!288133)))) (and (= (currentBit!9043 (_2!8720 lt!288133)) #b00000000000000000000000000000000) (= (currentByte!9048 (_2!8720 lt!288133)) (size!4335 (buf!4798 (_2!8720 lt!288133))))))))))

(assert (=> b!186545 d!64289))

(declare-fun d!64291 () Bool)

(declare-fun lt!288225 () tuple2!16154)

(declare-fun lt!288229 () tuple2!16154)

(assert (=> d!64291 (and (= (_2!8722 lt!288225) (_2!8722 lt!288229)) (= (_1!8722 lt!288225) (_1!8722 lt!288229)))))

(declare-fun lt!288227 () Unit!13339)

(declare-fun lt!288224 () Bool)

(declare-fun lt!288228 () BitStream!7778)

(declare-fun lt!288226 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16154 tuple2!16154 BitStream!7778 (_ BitVec 64) Bool BitStream!7778 (_ BitVec 64) tuple2!16154 tuple2!16154 BitStream!7778 (_ BitVec 64)) Unit!13339)

(assert (=> d!64291 (= lt!288227 (choose!56 (_1!8721 lt!288117) nBits!348 i!590 lt!288119 lt!288225 (tuple2!16155 (_1!8722 lt!288225) (_2!8722 lt!288225)) (_1!8722 lt!288225) (_2!8722 lt!288225) lt!288224 lt!288228 lt!288226 lt!288229 (tuple2!16155 (_1!8722 lt!288229) (_2!8722 lt!288229)) (_1!8722 lt!288229) (_2!8722 lt!288229)))))

(assert (=> d!64291 (= lt!288229 (readNBitsLSBFirstsLoopPure!0 lt!288228 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!288226))))

(assert (=> d!64291 (= lt!288226 (bvor lt!288119 (ite lt!288224 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64291 (= lt!288228 (withMovedBitIndex!0 (_1!8721 lt!288117) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64291 (= lt!288224 (_2!8719 (readBitPure!0 (_1!8721 lt!288117))))))

(assert (=> d!64291 (= lt!288225 (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288117) nBits!348 i!590 lt!288119))))

(assert (=> d!64291 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8721 lt!288117) nBits!348 i!590 lt!288119) lt!288227)))

(declare-fun bs!16002 () Bool)

(assert (= bs!16002 d!64291))

(assert (=> bs!16002 m!289991))

(declare-fun m!290095 () Bool)

(assert (=> bs!16002 m!290095))

(assert (=> bs!16002 m!290019))

(declare-fun m!290097 () Bool)

(assert (=> bs!16002 m!290097))

(assert (=> bs!16002 m!290043))

(assert (=> b!186545 d!64291))

(declare-datatypes ((tuple2!16156 0))(
  ( (tuple2!16157 (_1!8723 (_ BitVec 64)) (_2!8723 BitStream!7778)) )
))
(declare-fun lt!288235 () tuple2!16156)

(declare-fun d!64299 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16156)

(assert (=> d!64299 (= lt!288235 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8721 lt!288117) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288134))))

(assert (=> d!64299 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8721 lt!288117) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288134) (tuple2!16155 (_2!8723 lt!288235) (_1!8723 lt!288235)))))

(declare-fun bs!16004 () Bool)

(assert (= bs!16004 d!64299))

(assert (=> bs!16004 m!290043))

(declare-fun m!290101 () Bool)

(assert (=> bs!16004 m!290101))

(assert (=> b!186545 d!64299))

(declare-fun d!64303 () Bool)

(declare-fun e!129103 () Bool)

(assert (=> d!64303 e!129103))

(declare-fun res!155375 () Bool)

(assert (=> d!64303 (=> (not res!155375) (not e!129103))))

(declare-fun lt!288237 () (_ BitVec 64))

(declare-fun lt!288236 () BitStream!7778)

(assert (=> d!64303 (= res!155375 (= (bvadd lt!288237 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4335 (buf!4798 lt!288236)) (currentByte!9048 lt!288236) (currentBit!9043 lt!288236))))))

(assert (=> d!64303 (or (not (= (bvand lt!288237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288237 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64303 (= lt!288237 (bitIndex!0 (size!4335 (buf!4798 (_1!8721 lt!288117))) (currentByte!9048 (_1!8721 lt!288117)) (currentBit!9043 (_1!8721 lt!288117))))))

(assert (=> d!64303 (= lt!288236 (_2!8720 (moveBitIndex!0 (_1!8721 lt!288117) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64303 (moveBitIndexPrecond!0 (_1!8721 lt!288117) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64303 (= (withMovedBitIndex!0 (_1!8721 lt!288117) #b0000000000000000000000000000000000000000000000000000000000000001) lt!288236)))

(declare-fun b!186592 () Bool)

(assert (=> b!186592 (= e!129103 (= (size!4335 (buf!4798 (_1!8721 lt!288117))) (size!4335 (buf!4798 lt!288236))))))

(assert (= (and d!64303 res!155375) b!186592))

(declare-fun m!290103 () Bool)

(assert (=> d!64303 m!290103))

(declare-fun m!290105 () Bool)

(assert (=> d!64303 m!290105))

(declare-fun m!290107 () Bool)

(assert (=> d!64303 m!290107))

(declare-fun m!290109 () Bool)

(assert (=> d!64303 m!290109))

(assert (=> b!186545 d!64303))

(declare-fun d!64307 () Bool)

(declare-fun res!155383 () Bool)

(declare-fun e!129109 () Bool)

(assert (=> d!64307 (=> (not res!155383) (not e!129109))))

(assert (=> d!64307 (= res!155383 (= (size!4335 (buf!4798 thiss!1204)) (size!4335 (buf!4798 (_2!8720 lt!288133)))))))

(assert (=> d!64307 (= (isPrefixOf!0 thiss!1204 (_2!8720 lt!288133)) e!129109)))

(declare-fun b!186599 () Bool)

(declare-fun res!155382 () Bool)

(assert (=> b!186599 (=> (not res!155382) (not e!129109))))

(assert (=> b!186599 (= res!155382 (bvsle (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)) (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133)))))))

(declare-fun b!186600 () Bool)

(declare-fun e!129108 () Bool)

(assert (=> b!186600 (= e!129109 e!129108)))

(declare-fun res!155384 () Bool)

(assert (=> b!186600 (=> res!155384 e!129108)))

(assert (=> b!186600 (= res!155384 (= (size!4335 (buf!4798 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!186601 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9830 array!9830 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186601 (= e!129108 (arrayBitRangesEq!0 (buf!4798 thiss!1204) (buf!4798 (_2!8720 lt!288133)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204))))))

(assert (= (and d!64307 res!155383) b!186599))

(assert (= (and b!186599 res!155382) b!186600))

(assert (= (and b!186600 (not res!155384)) b!186601))

(assert (=> b!186599 m!290035))

(assert (=> b!186599 m!290033))

(assert (=> b!186601 m!290035))

(assert (=> b!186601 m!290035))

(declare-fun m!290111 () Bool)

(assert (=> b!186601 m!290111))

(assert (=> b!186544 d!64307))

(declare-fun d!64309 () Bool)

(assert (=> d!64309 (= (invariant!0 (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204) (size!4335 (buf!4798 (_2!8720 lt!288122)))) (and (bvsge (currentBit!9043 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9043 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9048 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9048 thiss!1204) (size!4335 (buf!4798 (_2!8720 lt!288122)))) (and (= (currentBit!9043 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9048 thiss!1204) (size!4335 (buf!4798 (_2!8720 lt!288122))))))))))

(assert (=> b!186555 d!64309))

(declare-fun d!64311 () Bool)

(declare-fun e!129110 () Bool)

(assert (=> d!64311 e!129110))

(declare-fun res!155385 () Bool)

(assert (=> d!64311 (=> (not res!155385) (not e!129110))))

(declare-fun lt!288238 () (_ BitVec 64))

(declare-fun lt!288239 () (_ BitVec 64))

(declare-fun lt!288243 () (_ BitVec 64))

(assert (=> d!64311 (= res!155385 (= lt!288239 (bvsub lt!288238 lt!288243)))))

(assert (=> d!64311 (or (= (bvand lt!288238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288243 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288238 lt!288243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64311 (= lt!288243 (remainingBits!0 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288133)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133)))))))

(declare-fun lt!288241 () (_ BitVec 64))

(declare-fun lt!288240 () (_ BitVec 64))

(assert (=> d!64311 (= lt!288238 (bvmul lt!288241 lt!288240))))

(assert (=> d!64311 (or (= lt!288241 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288240 (bvsdiv (bvmul lt!288241 lt!288240) lt!288241)))))

(assert (=> d!64311 (= lt!288240 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64311 (= lt!288241 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288133)))))))

(assert (=> d!64311 (= lt!288239 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133)))))))

(assert (=> d!64311 (invariant!0 (currentBit!9043 (_2!8720 lt!288133)) (currentByte!9048 (_2!8720 lt!288133)) (size!4335 (buf!4798 (_2!8720 lt!288133))))))

(assert (=> d!64311 (= (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))) lt!288239)))

(declare-fun b!186602 () Bool)

(declare-fun res!155386 () Bool)

(assert (=> b!186602 (=> (not res!155386) (not e!129110))))

(assert (=> b!186602 (= res!155386 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288239))))

(declare-fun b!186603 () Bool)

(declare-fun lt!288242 () (_ BitVec 64))

(assert (=> b!186603 (= e!129110 (bvsle lt!288239 (bvmul lt!288242 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186603 (or (= lt!288242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288242)))))

(assert (=> b!186603 (= lt!288242 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288133)))))))

(assert (= (and d!64311 res!155385) b!186602))

(assert (= (and b!186602 res!155386) b!186603))

(declare-fun m!290113 () Bool)

(assert (=> d!64311 m!290113))

(assert (=> d!64311 m!290039))

(assert (=> b!186538 d!64311))

(declare-fun d!64313 () Bool)

(declare-fun e!129111 () Bool)

(assert (=> d!64313 e!129111))

(declare-fun res!155387 () Bool)

(assert (=> d!64313 (=> (not res!155387) (not e!129111))))

(declare-fun lt!288244 () (_ BitVec 64))

(declare-fun lt!288245 () (_ BitVec 64))

(declare-fun lt!288249 () (_ BitVec 64))

(assert (=> d!64313 (= res!155387 (= lt!288245 (bvsub lt!288244 lt!288249)))))

(assert (=> d!64313 (or (= (bvand lt!288244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288244 lt!288249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64313 (= lt!288249 (remainingBits!0 ((_ sign_extend 32) (size!4335 (buf!4798 thiss!1204))) ((_ sign_extend 32) (currentByte!9048 thiss!1204)) ((_ sign_extend 32) (currentBit!9043 thiss!1204))))))

(declare-fun lt!288247 () (_ BitVec 64))

(declare-fun lt!288246 () (_ BitVec 64))

(assert (=> d!64313 (= lt!288244 (bvmul lt!288247 lt!288246))))

(assert (=> d!64313 (or (= lt!288247 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288246 (bvsdiv (bvmul lt!288247 lt!288246) lt!288247)))))

(assert (=> d!64313 (= lt!288246 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64313 (= lt!288247 ((_ sign_extend 32) (size!4335 (buf!4798 thiss!1204))))))

(assert (=> d!64313 (= lt!288245 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9048 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9043 thiss!1204))))))

(assert (=> d!64313 (invariant!0 (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204) (size!4335 (buf!4798 thiss!1204)))))

(assert (=> d!64313 (= (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)) lt!288245)))

(declare-fun b!186604 () Bool)

(declare-fun res!155388 () Bool)

(assert (=> b!186604 (=> (not res!155388) (not e!129111))))

(assert (=> b!186604 (= res!155388 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288245))))

(declare-fun b!186605 () Bool)

(declare-fun lt!288248 () (_ BitVec 64))

(assert (=> b!186605 (= e!129111 (bvsle lt!288245 (bvmul lt!288248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186605 (or (= lt!288248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288248)))))

(assert (=> b!186605 (= lt!288248 ((_ sign_extend 32) (size!4335 (buf!4798 thiss!1204))))))

(assert (= (and d!64313 res!155387) b!186604))

(assert (= (and b!186604 res!155388) b!186605))

(assert (=> d!64313 m!290059))

(assert (=> d!64313 m!289973))

(assert (=> b!186538 d!64313))

(declare-fun b!186616 () Bool)

(declare-fun res!155400 () Bool)

(declare-fun e!129117 () Bool)

(assert (=> b!186616 (=> (not res!155400) (not e!129117))))

(declare-fun lt!288261 () tuple2!16150)

(assert (=> b!186616 (= res!155400 (isPrefixOf!0 thiss!1204 (_2!8720 lt!288261)))))

(declare-fun b!186615 () Bool)

(declare-fun res!155399 () Bool)

(assert (=> b!186615 (=> (not res!155399) (not e!129117))))

(declare-fun lt!288258 () (_ BitVec 64))

(declare-fun lt!288259 () (_ BitVec 64))

(assert (=> b!186615 (= res!155399 (= (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288261))) (currentByte!9048 (_2!8720 lt!288261)) (currentBit!9043 (_2!8720 lt!288261))) (bvadd lt!288259 lt!288258)))))

(assert (=> b!186615 (or (not (= (bvand lt!288259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288258 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288259 lt!288258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186615 (= lt!288258 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!186615 (= lt!288259 (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)))))

(declare-fun d!64315 () Bool)

(assert (=> d!64315 e!129117))

(declare-fun res!155398 () Bool)

(assert (=> d!64315 (=> (not res!155398) (not e!129117))))

(assert (=> d!64315 (= res!155398 (= (size!4335 (buf!4798 thiss!1204)) (size!4335 (buf!4798 (_2!8720 lt!288261)))))))

(declare-fun choose!16 (BitStream!7778 Bool) tuple2!16150)

(assert (=> d!64315 (= lt!288261 (choose!16 thiss!1204 lt!288128))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64315 (validate_offset_bit!0 ((_ sign_extend 32) (size!4335 (buf!4798 thiss!1204))) ((_ sign_extend 32) (currentByte!9048 thiss!1204)) ((_ sign_extend 32) (currentBit!9043 thiss!1204)))))

(assert (=> d!64315 (= (appendBit!0 thiss!1204 lt!288128) lt!288261)))

(declare-fun b!186618 () Bool)

(declare-fun e!129116 () Bool)

(declare-fun lt!288260 () tuple2!16148)

(assert (=> b!186618 (= e!129116 (= (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288260))) (currentByte!9048 (_1!8719 lt!288260)) (currentBit!9043 (_1!8719 lt!288260))) (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288261))) (currentByte!9048 (_2!8720 lt!288261)) (currentBit!9043 (_2!8720 lt!288261)))))))

(declare-fun b!186617 () Bool)

(assert (=> b!186617 (= e!129117 e!129116)))

(declare-fun res!155397 () Bool)

(assert (=> b!186617 (=> (not res!155397) (not e!129116))))

(assert (=> b!186617 (= res!155397 (and (= (_2!8719 lt!288260) lt!288128) (= (_1!8719 lt!288260) (_2!8720 lt!288261))))))

(assert (=> b!186617 (= lt!288260 (readBitPure!0 (readerFrom!0 (_2!8720 lt!288261) (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204))))))

(assert (= (and d!64315 res!155398) b!186615))

(assert (= (and b!186615 res!155399) b!186616))

(assert (= (and b!186616 res!155400) b!186617))

(assert (= (and b!186617 res!155397) b!186618))

(declare-fun m!290115 () Bool)

(assert (=> b!186617 m!290115))

(assert (=> b!186617 m!290115))

(declare-fun m!290117 () Bool)

(assert (=> b!186617 m!290117))

(declare-fun m!290119 () Bool)

(assert (=> b!186618 m!290119))

(declare-fun m!290121 () Bool)

(assert (=> b!186618 m!290121))

(declare-fun m!290123 () Bool)

(assert (=> b!186616 m!290123))

(assert (=> b!186615 m!290121))

(assert (=> b!186615 m!290035))

(declare-fun m!290125 () Bool)

(assert (=> d!64315 m!290125))

(declare-fun m!290127 () Bool)

(assert (=> d!64315 m!290127))

(assert (=> b!186538 d!64315))

(declare-fun d!64317 () Bool)

(declare-datatypes ((tuple2!16162 0))(
  ( (tuple2!16163 (_1!8726 Bool) (_2!8726 BitStream!7778)) )
))
(declare-fun lt!288304 () tuple2!16162)

(declare-fun readBit!0 (BitStream!7778) tuple2!16162)

(assert (=> d!64317 (= lt!288304 (readBit!0 (readerFrom!0 (_2!8720 lt!288133) (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204))))))

(assert (=> d!64317 (= (readBitPure!0 (readerFrom!0 (_2!8720 lt!288133) (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204))) (tuple2!16149 (_2!8726 lt!288304) (_1!8726 lt!288304)))))

(declare-fun bs!16005 () Bool)

(assert (= bs!16005 d!64317))

(assert (=> bs!16005 m!289969))

(declare-fun m!290129 () Bool)

(assert (=> bs!16005 m!290129))

(assert (=> b!186537 d!64317))

(declare-fun d!64319 () Bool)

(declare-fun e!129126 () Bool)

(assert (=> d!64319 e!129126))

(declare-fun res!155413 () Bool)

(assert (=> d!64319 (=> (not res!155413) (not e!129126))))

(assert (=> d!64319 (= res!155413 (invariant!0 (currentBit!9043 (_2!8720 lt!288133)) (currentByte!9048 (_2!8720 lt!288133)) (size!4335 (buf!4798 (_2!8720 lt!288133)))))))

(assert (=> d!64319 (= (readerFrom!0 (_2!8720 lt!288133) (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204)) (BitStream!7779 (buf!4798 (_2!8720 lt!288133)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)))))

(declare-fun b!186636 () Bool)

(assert (=> b!186636 (= e!129126 (invariant!0 (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204) (size!4335 (buf!4798 (_2!8720 lt!288133)))))))

(assert (= (and d!64319 res!155413) b!186636))

(assert (=> d!64319 m!290039))

(assert (=> b!186636 m!290011))

(assert (=> b!186537 d!64319))

(assert (=> b!186547 d!64311))

(assert (=> b!186547 d!64313))

(declare-fun d!64321 () Bool)

(assert (=> d!64321 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133))) lt!288124) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133)))) lt!288124))))

(declare-fun bs!16006 () Bool)

(assert (= bs!16006 d!64321))

(declare-fun m!290131 () Bool)

(assert (=> bs!16006 m!290131))

(assert (=> b!186541 d!64321))

(declare-fun d!64323 () Bool)

(declare-fun e!129131 () Bool)

(assert (=> d!64323 e!129131))

(declare-fun res!155419 () Bool)

(assert (=> d!64323 (=> (not res!155419) (not e!129131))))

(declare-fun lt!288354 () tuple2!16148)

(declare-fun lt!288355 () tuple2!16148)

(assert (=> d!64323 (= res!155419 (= (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288354))) (currentByte!9048 (_1!8719 lt!288354)) (currentBit!9043 (_1!8719 lt!288354))) (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288355))) (currentByte!9048 (_1!8719 lt!288355)) (currentBit!9043 (_1!8719 lt!288355)))))))

(declare-fun lt!288357 () Unit!13339)

(declare-fun lt!288356 () BitStream!7778)

(declare-fun choose!50 (BitStream!7778 BitStream!7778 BitStream!7778 tuple2!16148 tuple2!16148 BitStream!7778 Bool tuple2!16148 tuple2!16148 BitStream!7778 Bool) Unit!13339)

(assert (=> d!64323 (= lt!288357 (choose!50 lt!288116 (_2!8720 lt!288122) lt!288356 lt!288354 (tuple2!16149 (_1!8719 lt!288354) (_2!8719 lt!288354)) (_1!8719 lt!288354) (_2!8719 lt!288354) lt!288355 (tuple2!16149 (_1!8719 lt!288355) (_2!8719 lt!288355)) (_1!8719 lt!288355) (_2!8719 lt!288355)))))

(assert (=> d!64323 (= lt!288355 (readBitPure!0 lt!288356))))

(assert (=> d!64323 (= lt!288354 (readBitPure!0 lt!288116))))

(assert (=> d!64323 (= lt!288356 (BitStream!7779 (buf!4798 (_2!8720 lt!288122)) (currentByte!9048 lt!288116) (currentBit!9043 lt!288116)))))

(assert (=> d!64323 (invariant!0 (currentBit!9043 lt!288116) (currentByte!9048 lt!288116) (size!4335 (buf!4798 (_2!8720 lt!288122))))))

(assert (=> d!64323 (= (readBitPrefixLemma!0 lt!288116 (_2!8720 lt!288122)) lt!288357)))

(declare-fun b!186644 () Bool)

(assert (=> b!186644 (= e!129131 (= (_2!8719 lt!288354) (_2!8719 lt!288355)))))

(assert (= (and d!64323 res!155419) b!186644))

(declare-fun m!290191 () Bool)

(assert (=> d!64323 m!290191))

(declare-fun m!290193 () Bool)

(assert (=> d!64323 m!290193))

(assert (=> d!64323 m!290017))

(declare-fun m!290195 () Bool)

(assert (=> d!64323 m!290195))

(declare-fun m!290197 () Bool)

(assert (=> d!64323 m!290197))

(declare-fun m!290199 () Bool)

(assert (=> d!64323 m!290199))

(assert (=> b!186541 d!64323))

(declare-fun d!64331 () Bool)

(declare-fun e!129134 () Bool)

(assert (=> d!64331 e!129134))

(declare-fun res!155422 () Bool)

(assert (=> d!64331 (=> (not res!155422) (not e!129134))))

(declare-fun lt!288371 () (_ BitVec 64))

(declare-fun lt!288366 () (_ BitVec 64))

(declare-fun lt!288367 () (_ BitVec 64))

(assert (=> d!64331 (= res!155422 (= lt!288367 (bvsub lt!288366 lt!288371)))))

(assert (=> d!64331 (or (= (bvand lt!288366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288371 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288366 lt!288371) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64331 (= lt!288371 (remainingBits!0 ((_ sign_extend 32) (size!4335 (buf!4798 (_1!8719 lt!288136)))) ((_ sign_extend 32) (currentByte!9048 (_1!8719 lt!288136))) ((_ sign_extend 32) (currentBit!9043 (_1!8719 lt!288136)))))))

(declare-fun lt!288369 () (_ BitVec 64))

(declare-fun lt!288368 () (_ BitVec 64))

(assert (=> d!64331 (= lt!288366 (bvmul lt!288369 lt!288368))))

(assert (=> d!64331 (or (= lt!288369 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288368 (bvsdiv (bvmul lt!288369 lt!288368) lt!288369)))))

(assert (=> d!64331 (= lt!288368 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64331 (= lt!288369 ((_ sign_extend 32) (size!4335 (buf!4798 (_1!8719 lt!288136)))))))

(assert (=> d!64331 (= lt!288367 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9048 (_1!8719 lt!288136))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9043 (_1!8719 lt!288136)))))))

(assert (=> d!64331 (invariant!0 (currentBit!9043 (_1!8719 lt!288136)) (currentByte!9048 (_1!8719 lt!288136)) (size!4335 (buf!4798 (_1!8719 lt!288136))))))

(assert (=> d!64331 (= (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288136))) (currentByte!9048 (_1!8719 lt!288136)) (currentBit!9043 (_1!8719 lt!288136))) lt!288367)))

(declare-fun b!186645 () Bool)

(declare-fun res!155423 () Bool)

(assert (=> b!186645 (=> (not res!155423) (not e!129134))))

(assert (=> b!186645 (= res!155423 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288367))))

(declare-fun b!186646 () Bool)

(declare-fun lt!288370 () (_ BitVec 64))

(assert (=> b!186646 (= e!129134 (bvsle lt!288367 (bvmul lt!288370 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186646 (or (= lt!288370 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288370 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288370)))))

(assert (=> b!186646 (= lt!288370 ((_ sign_extend 32) (size!4335 (buf!4798 (_1!8719 lt!288136)))))))

(assert (= (and d!64331 res!155422) b!186645))

(assert (= (and b!186645 res!155423) b!186646))

(declare-fun m!290201 () Bool)

(assert (=> d!64331 m!290201))

(declare-fun m!290203 () Bool)

(assert (=> d!64331 m!290203))

(assert (=> b!186541 d!64331))

(declare-fun d!64333 () Bool)

(assert (=> d!64333 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!186541 d!64333))

(declare-fun d!64335 () Bool)

(declare-fun lt!288372 () tuple2!16162)

(assert (=> d!64335 (= lt!288372 (readBit!0 lt!288116))))

(assert (=> d!64335 (= (readBitPure!0 lt!288116) (tuple2!16149 (_2!8726 lt!288372) (_1!8726 lt!288372)))))

(declare-fun bs!16008 () Bool)

(assert (= bs!16008 d!64335))

(declare-fun m!290205 () Bool)

(assert (=> bs!16008 m!290205))

(assert (=> b!186541 d!64335))

(declare-fun d!64337 () Bool)

(declare-fun lt!288373 () tuple2!16162)

(assert (=> d!64337 (= lt!288373 (readBit!0 (BitStream!7779 (buf!4798 (_2!8720 lt!288122)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204))))))

(assert (=> d!64337 (= (readBitPure!0 (BitStream!7779 (buf!4798 (_2!8720 lt!288122)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204))) (tuple2!16149 (_2!8726 lt!288373) (_1!8726 lt!288373)))))

(declare-fun bs!16009 () Bool)

(assert (= bs!16009 d!64337))

(declare-fun m!290207 () Bool)

(assert (=> bs!16009 m!290207))

(assert (=> b!186541 d!64337))

(declare-fun d!64339 () Bool)

(assert (=> d!64339 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))) ((_ sign_extend 32) (currentByte!9048 thiss!1204)) ((_ sign_extend 32) (currentBit!9043 thiss!1204)) lt!288130)))

(declare-fun lt!288380 () Unit!13339)

(declare-fun choose!9 (BitStream!7778 array!9830 (_ BitVec 64) BitStream!7778) Unit!13339)

(assert (=> d!64339 (= lt!288380 (choose!9 thiss!1204 (buf!4798 (_2!8720 lt!288122)) lt!288130 (BitStream!7779 (buf!4798 (_2!8720 lt!288122)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204))))))

(assert (=> d!64339 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4798 (_2!8720 lt!288122)) lt!288130) lt!288380)))

(declare-fun bs!16010 () Bool)

(assert (= bs!16010 d!64339))

(assert (=> bs!16010 m!290005))

(declare-fun m!290219 () Bool)

(assert (=> bs!16010 m!290219))

(assert (=> b!186541 d!64339))

(declare-fun d!64343 () Bool)

(declare-fun lt!288381 () tuple2!16156)

(assert (=> d!64343 (= lt!288381 (readNBitsLSBFirstsLoop!0 (_1!8721 lt!288118) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288134))))

(assert (=> d!64343 (= (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288118) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288134) (tuple2!16155 (_2!8723 lt!288381) (_1!8723 lt!288381)))))

(declare-fun bs!16011 () Bool)

(assert (= bs!16011 d!64343))

(declare-fun m!290221 () Bool)

(assert (=> bs!16011 m!290221))

(assert (=> b!186541 d!64343))

(declare-fun d!64345 () Bool)

(assert (=> d!64345 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133))) lt!288124)))

(declare-fun lt!288384 () Unit!13339)

(assert (=> d!64345 (= lt!288384 (choose!9 (_2!8720 lt!288133) (buf!4798 (_2!8720 lt!288122)) lt!288124 (BitStream!7779 (buf!4798 (_2!8720 lt!288122)) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133)))))))

(assert (=> d!64345 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8720 lt!288133) (buf!4798 (_2!8720 lt!288122)) lt!288124) lt!288384)))

(declare-fun bs!16012 () Bool)

(assert (= bs!16012 d!64345))

(assert (=> bs!16012 m!289989))

(declare-fun m!290223 () Bool)

(assert (=> bs!16012 m!290223))

(assert (=> b!186541 d!64345))

(declare-fun d!64347 () Bool)

(declare-fun lt!288385 () tuple2!16162)

(assert (=> d!64347 (= lt!288385 (readBit!0 (_1!8721 lt!288117)))))

(assert (=> d!64347 (= (readBitPure!0 (_1!8721 lt!288117)) (tuple2!16149 (_2!8726 lt!288385) (_1!8726 lt!288385)))))

(declare-fun bs!16013 () Bool)

(assert (= bs!16013 d!64347))

(declare-fun m!290225 () Bool)

(assert (=> bs!16013 m!290225))

(assert (=> b!186541 d!64347))

(declare-fun lt!288469 () tuple2!16152)

(declare-fun b!186682 () Bool)

(declare-fun lt!288467 () (_ BitVec 64))

(declare-fun e!129155 () Bool)

(declare-fun lt!288466 () (_ BitVec 64))

(assert (=> b!186682 (= e!129155 (= (_1!8721 lt!288469) (withMovedBitIndex!0 (_2!8721 lt!288469) (bvsub lt!288467 lt!288466))))))

(assert (=> b!186682 (or (= (bvand lt!288467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288466 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288467 lt!288466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186682 (= lt!288466 (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288122))) (currentByte!9048 (_2!8720 lt!288122)) (currentBit!9043 (_2!8720 lt!288122))))))

(assert (=> b!186682 (= lt!288467 (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))))))

(declare-fun b!186683 () Bool)

(declare-fun res!155454 () Bool)

(assert (=> b!186683 (=> (not res!155454) (not e!129155))))

(assert (=> b!186683 (= res!155454 (isPrefixOf!0 (_1!8721 lt!288469) (_2!8720 lt!288133)))))

(declare-fun d!64349 () Bool)

(assert (=> d!64349 e!129155))

(declare-fun res!155455 () Bool)

(assert (=> d!64349 (=> (not res!155455) (not e!129155))))

(assert (=> d!64349 (= res!155455 (isPrefixOf!0 (_1!8721 lt!288469) (_2!8721 lt!288469)))))

(declare-fun lt!288459 () BitStream!7778)

(assert (=> d!64349 (= lt!288469 (tuple2!16153 lt!288459 (_2!8720 lt!288122)))))

(declare-fun lt!288460 () Unit!13339)

(declare-fun lt!288473 () Unit!13339)

(assert (=> d!64349 (= lt!288460 lt!288473)))

(assert (=> d!64349 (isPrefixOf!0 lt!288459 (_2!8720 lt!288122))))

(assert (=> d!64349 (= lt!288473 (lemmaIsPrefixTransitive!0 lt!288459 (_2!8720 lt!288122) (_2!8720 lt!288122)))))

(declare-fun lt!288468 () Unit!13339)

(declare-fun lt!288462 () Unit!13339)

(assert (=> d!64349 (= lt!288468 lt!288462)))

(assert (=> d!64349 (isPrefixOf!0 lt!288459 (_2!8720 lt!288122))))

(assert (=> d!64349 (= lt!288462 (lemmaIsPrefixTransitive!0 lt!288459 (_2!8720 lt!288133) (_2!8720 lt!288122)))))

(declare-fun lt!288461 () Unit!13339)

(declare-fun e!129156 () Unit!13339)

(assert (=> d!64349 (= lt!288461 e!129156)))

(declare-fun c!9513 () Bool)

(assert (=> d!64349 (= c!9513 (not (= (size!4335 (buf!4798 (_2!8720 lt!288133))) #b00000000000000000000000000000000)))))

(declare-fun lt!288457 () Unit!13339)

(declare-fun lt!288470 () Unit!13339)

(assert (=> d!64349 (= lt!288457 lt!288470)))

(assert (=> d!64349 (isPrefixOf!0 (_2!8720 lt!288122) (_2!8720 lt!288122))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7778) Unit!13339)

(assert (=> d!64349 (= lt!288470 (lemmaIsPrefixRefl!0 (_2!8720 lt!288122)))))

(declare-fun lt!288454 () Unit!13339)

(declare-fun lt!288456 () Unit!13339)

(assert (=> d!64349 (= lt!288454 lt!288456)))

(assert (=> d!64349 (= lt!288456 (lemmaIsPrefixRefl!0 (_2!8720 lt!288122)))))

(declare-fun lt!288455 () Unit!13339)

(declare-fun lt!288464 () Unit!13339)

(assert (=> d!64349 (= lt!288455 lt!288464)))

(assert (=> d!64349 (isPrefixOf!0 lt!288459 lt!288459)))

(assert (=> d!64349 (= lt!288464 (lemmaIsPrefixRefl!0 lt!288459))))

(declare-fun lt!288471 () Unit!13339)

(declare-fun lt!288458 () Unit!13339)

(assert (=> d!64349 (= lt!288471 lt!288458)))

(assert (=> d!64349 (isPrefixOf!0 (_2!8720 lt!288133) (_2!8720 lt!288133))))

(assert (=> d!64349 (= lt!288458 (lemmaIsPrefixRefl!0 (_2!8720 lt!288133)))))

(assert (=> d!64349 (= lt!288459 (BitStream!7779 (buf!4798 (_2!8720 lt!288122)) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))))))

(assert (=> d!64349 (isPrefixOf!0 (_2!8720 lt!288133) (_2!8720 lt!288122))))

(assert (=> d!64349 (= (reader!0 (_2!8720 lt!288133) (_2!8720 lt!288122)) lt!288469)))

(declare-fun b!186684 () Bool)

(declare-fun res!155456 () Bool)

(assert (=> b!186684 (=> (not res!155456) (not e!129155))))

(assert (=> b!186684 (= res!155456 (isPrefixOf!0 (_2!8721 lt!288469) (_2!8720 lt!288122)))))

(declare-fun b!186685 () Bool)

(declare-fun Unit!13343 () Unit!13339)

(assert (=> b!186685 (= e!129156 Unit!13343)))

(declare-fun b!186686 () Bool)

(declare-fun lt!288463 () Unit!13339)

(assert (=> b!186686 (= e!129156 lt!288463)))

(declare-fun lt!288465 () (_ BitVec 64))

(assert (=> b!186686 (= lt!288465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!288472 () (_ BitVec 64))

(assert (=> b!186686 (= lt!288472 (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9830 array!9830 (_ BitVec 64) (_ BitVec 64)) Unit!13339)

(assert (=> b!186686 (= lt!288463 (arrayBitRangesEqSymmetric!0 (buf!4798 (_2!8720 lt!288133)) (buf!4798 (_2!8720 lt!288122)) lt!288465 lt!288472))))

(assert (=> b!186686 (arrayBitRangesEq!0 (buf!4798 (_2!8720 lt!288122)) (buf!4798 (_2!8720 lt!288133)) lt!288465 lt!288472)))

(assert (= (and d!64349 c!9513) b!186686))

(assert (= (and d!64349 (not c!9513)) b!186685))

(assert (= (and d!64349 res!155455) b!186683))

(assert (= (and b!186683 res!155454) b!186684))

(assert (= (and b!186684 res!155456) b!186682))

(declare-fun m!290263 () Bool)

(assert (=> b!186683 m!290263))

(declare-fun m!290265 () Bool)

(assert (=> b!186682 m!290265))

(assert (=> b!186682 m!290021))

(assert (=> b!186682 m!290033))

(declare-fun m!290267 () Bool)

(assert (=> d!64349 m!290267))

(declare-fun m!290269 () Bool)

(assert (=> d!64349 m!290269))

(declare-fun m!290271 () Bool)

(assert (=> d!64349 m!290271))

(declare-fun m!290273 () Bool)

(assert (=> d!64349 m!290273))

(declare-fun m!290275 () Bool)

(assert (=> d!64349 m!290275))

(assert (=> d!64349 m!289975))

(declare-fun m!290277 () Bool)

(assert (=> d!64349 m!290277))

(declare-fun m!290279 () Bool)

(assert (=> d!64349 m!290279))

(declare-fun m!290281 () Bool)

(assert (=> d!64349 m!290281))

(declare-fun m!290283 () Bool)

(assert (=> d!64349 m!290283))

(declare-fun m!290285 () Bool)

(assert (=> d!64349 m!290285))

(assert (=> b!186686 m!290033))

(declare-fun m!290287 () Bool)

(assert (=> b!186686 m!290287))

(declare-fun m!290289 () Bool)

(assert (=> b!186686 m!290289))

(declare-fun m!290291 () Bool)

(assert (=> b!186684 m!290291))

(assert (=> b!186541 d!64349))

(declare-fun b!186687 () Bool)

(declare-fun lt!288487 () (_ BitVec 64))

(declare-fun e!129157 () Bool)

(declare-fun lt!288486 () (_ BitVec 64))

(declare-fun lt!288489 () tuple2!16152)

(assert (=> b!186687 (= e!129157 (= (_1!8721 lt!288489) (withMovedBitIndex!0 (_2!8721 lt!288489) (bvsub lt!288487 lt!288486))))))

(assert (=> b!186687 (or (= (bvand lt!288487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288486 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288487 lt!288486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186687 (= lt!288486 (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288122))) (currentByte!9048 (_2!8720 lt!288122)) (currentBit!9043 (_2!8720 lt!288122))))))

(assert (=> b!186687 (= lt!288487 (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)))))

(declare-fun b!186688 () Bool)

(declare-fun res!155457 () Bool)

(assert (=> b!186688 (=> (not res!155457) (not e!129157))))

(assert (=> b!186688 (= res!155457 (isPrefixOf!0 (_1!8721 lt!288489) thiss!1204))))

(declare-fun d!64387 () Bool)

(assert (=> d!64387 e!129157))

(declare-fun res!155458 () Bool)

(assert (=> d!64387 (=> (not res!155458) (not e!129157))))

(assert (=> d!64387 (= res!155458 (isPrefixOf!0 (_1!8721 lt!288489) (_2!8721 lt!288489)))))

(declare-fun lt!288479 () BitStream!7778)

(assert (=> d!64387 (= lt!288489 (tuple2!16153 lt!288479 (_2!8720 lt!288122)))))

(declare-fun lt!288480 () Unit!13339)

(declare-fun lt!288493 () Unit!13339)

(assert (=> d!64387 (= lt!288480 lt!288493)))

(assert (=> d!64387 (isPrefixOf!0 lt!288479 (_2!8720 lt!288122))))

(assert (=> d!64387 (= lt!288493 (lemmaIsPrefixTransitive!0 lt!288479 (_2!8720 lt!288122) (_2!8720 lt!288122)))))

(declare-fun lt!288488 () Unit!13339)

(declare-fun lt!288482 () Unit!13339)

(assert (=> d!64387 (= lt!288488 lt!288482)))

(assert (=> d!64387 (isPrefixOf!0 lt!288479 (_2!8720 lt!288122))))

(assert (=> d!64387 (= lt!288482 (lemmaIsPrefixTransitive!0 lt!288479 thiss!1204 (_2!8720 lt!288122)))))

(declare-fun lt!288481 () Unit!13339)

(declare-fun e!129158 () Unit!13339)

(assert (=> d!64387 (= lt!288481 e!129158)))

(declare-fun c!9514 () Bool)

(assert (=> d!64387 (= c!9514 (not (= (size!4335 (buf!4798 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!288477 () Unit!13339)

(declare-fun lt!288490 () Unit!13339)

(assert (=> d!64387 (= lt!288477 lt!288490)))

(assert (=> d!64387 (isPrefixOf!0 (_2!8720 lt!288122) (_2!8720 lt!288122))))

(assert (=> d!64387 (= lt!288490 (lemmaIsPrefixRefl!0 (_2!8720 lt!288122)))))

(declare-fun lt!288474 () Unit!13339)

(declare-fun lt!288476 () Unit!13339)

(assert (=> d!64387 (= lt!288474 lt!288476)))

(assert (=> d!64387 (= lt!288476 (lemmaIsPrefixRefl!0 (_2!8720 lt!288122)))))

(declare-fun lt!288475 () Unit!13339)

(declare-fun lt!288484 () Unit!13339)

(assert (=> d!64387 (= lt!288475 lt!288484)))

(assert (=> d!64387 (isPrefixOf!0 lt!288479 lt!288479)))

(assert (=> d!64387 (= lt!288484 (lemmaIsPrefixRefl!0 lt!288479))))

(declare-fun lt!288491 () Unit!13339)

(declare-fun lt!288478 () Unit!13339)

(assert (=> d!64387 (= lt!288491 lt!288478)))

(assert (=> d!64387 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64387 (= lt!288478 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64387 (= lt!288479 (BitStream!7779 (buf!4798 (_2!8720 lt!288122)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)))))

(assert (=> d!64387 (isPrefixOf!0 thiss!1204 (_2!8720 lt!288122))))

(assert (=> d!64387 (= (reader!0 thiss!1204 (_2!8720 lt!288122)) lt!288489)))

(declare-fun b!186689 () Bool)

(declare-fun res!155459 () Bool)

(assert (=> b!186689 (=> (not res!155459) (not e!129157))))

(assert (=> b!186689 (= res!155459 (isPrefixOf!0 (_2!8721 lt!288489) (_2!8720 lt!288122)))))

(declare-fun b!186690 () Bool)

(declare-fun Unit!13354 () Unit!13339)

(assert (=> b!186690 (= e!129158 Unit!13354)))

(declare-fun b!186691 () Bool)

(declare-fun lt!288483 () Unit!13339)

(assert (=> b!186691 (= e!129158 lt!288483)))

(declare-fun lt!288485 () (_ BitVec 64))

(assert (=> b!186691 (= lt!288485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!288492 () (_ BitVec 64))

(assert (=> b!186691 (= lt!288492 (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)))))

(assert (=> b!186691 (= lt!288483 (arrayBitRangesEqSymmetric!0 (buf!4798 thiss!1204) (buf!4798 (_2!8720 lt!288122)) lt!288485 lt!288492))))

(assert (=> b!186691 (arrayBitRangesEq!0 (buf!4798 (_2!8720 lt!288122)) (buf!4798 thiss!1204) lt!288485 lt!288492)))

(assert (= (and d!64387 c!9514) b!186691))

(assert (= (and d!64387 (not c!9514)) b!186690))

(assert (= (and d!64387 res!155458) b!186688))

(assert (= (and b!186688 res!155457) b!186689))

(assert (= (and b!186689 res!155459) b!186687))

(declare-fun m!290293 () Bool)

(assert (=> b!186688 m!290293))

(declare-fun m!290295 () Bool)

(assert (=> b!186687 m!290295))

(assert (=> b!186687 m!290021))

(assert (=> b!186687 m!290035))

(declare-fun m!290297 () Bool)

(assert (=> d!64387 m!290297))

(declare-fun m!290299 () Bool)

(assert (=> d!64387 m!290299))

(declare-fun m!290301 () Bool)

(assert (=> d!64387 m!290301))

(assert (=> d!64387 m!290273))

(declare-fun m!290303 () Bool)

(assert (=> d!64387 m!290303))

(assert (=> d!64387 m!290023))

(declare-fun m!290305 () Bool)

(assert (=> d!64387 m!290305))

(declare-fun m!290307 () Bool)

(assert (=> d!64387 m!290307))

(declare-fun m!290309 () Bool)

(assert (=> d!64387 m!290309))

(declare-fun m!290311 () Bool)

(assert (=> d!64387 m!290311))

(assert (=> d!64387 m!290285))

(assert (=> b!186691 m!290035))

(declare-fun m!290313 () Bool)

(assert (=> b!186691 m!290313))

(declare-fun m!290315 () Bool)

(assert (=> b!186691 m!290315))

(declare-fun m!290317 () Bool)

(assert (=> b!186689 m!290317))

(assert (=> b!186541 d!64387))

(declare-fun d!64389 () Bool)

(assert (=> d!64389 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))) ((_ sign_extend 32) (currentByte!9048 thiss!1204)) ((_ sign_extend 32) (currentBit!9043 thiss!1204)) lt!288130) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))) ((_ sign_extend 32) (currentByte!9048 thiss!1204)) ((_ sign_extend 32) (currentBit!9043 thiss!1204))) lt!288130))))

(declare-fun bs!16021 () Bool)

(assert (= bs!16021 d!64389))

(declare-fun m!290319 () Bool)

(assert (=> bs!16021 m!290319))

(assert (=> b!186541 d!64389))

(declare-fun d!64391 () Bool)

(declare-fun e!129159 () Bool)

(assert (=> d!64391 e!129159))

(declare-fun res!155460 () Bool)

(assert (=> d!64391 (=> (not res!155460) (not e!129159))))

(declare-fun lt!288495 () (_ BitVec 64))

(declare-fun lt!288494 () (_ BitVec 64))

(declare-fun lt!288499 () (_ BitVec 64))

(assert (=> d!64391 (= res!155460 (= lt!288495 (bvsub lt!288494 lt!288499)))))

(assert (=> d!64391 (or (= (bvand lt!288494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288499 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288494 lt!288499) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64391 (= lt!288499 (remainingBits!0 ((_ sign_extend 32) (size!4335 (buf!4798 (_1!8719 lt!288131)))) ((_ sign_extend 32) (currentByte!9048 (_1!8719 lt!288131))) ((_ sign_extend 32) (currentBit!9043 (_1!8719 lt!288131)))))))

(declare-fun lt!288497 () (_ BitVec 64))

(declare-fun lt!288496 () (_ BitVec 64))

(assert (=> d!64391 (= lt!288494 (bvmul lt!288497 lt!288496))))

(assert (=> d!64391 (or (= lt!288497 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288496 (bvsdiv (bvmul lt!288497 lt!288496) lt!288497)))))

(assert (=> d!64391 (= lt!288496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64391 (= lt!288497 ((_ sign_extend 32) (size!4335 (buf!4798 (_1!8719 lt!288131)))))))

(assert (=> d!64391 (= lt!288495 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9048 (_1!8719 lt!288131))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9043 (_1!8719 lt!288131)))))))

(assert (=> d!64391 (invariant!0 (currentBit!9043 (_1!8719 lt!288131)) (currentByte!9048 (_1!8719 lt!288131)) (size!4335 (buf!4798 (_1!8719 lt!288131))))))

(assert (=> d!64391 (= (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288131))) (currentByte!9048 (_1!8719 lt!288131)) (currentBit!9043 (_1!8719 lt!288131))) lt!288495)))

(declare-fun b!186692 () Bool)

(declare-fun res!155461 () Bool)

(assert (=> b!186692 (=> (not res!155461) (not e!129159))))

(assert (=> b!186692 (= res!155461 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288495))))

(declare-fun b!186693 () Bool)

(declare-fun lt!288498 () (_ BitVec 64))

(assert (=> b!186693 (= e!129159 (bvsle lt!288495 (bvmul lt!288498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186693 (or (= lt!288498 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288498 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288498)))))

(assert (=> b!186693 (= lt!288498 ((_ sign_extend 32) (size!4335 (buf!4798 (_1!8719 lt!288131)))))))

(assert (= (and d!64391 res!155460) b!186692))

(assert (= (and b!186692 res!155461) b!186693))

(declare-fun m!290321 () Bool)

(assert (=> d!64391 m!290321))

(declare-fun m!290323 () Bool)

(assert (=> d!64391 m!290323))

(assert (=> b!186541 d!64391))

(declare-fun lt!288500 () tuple2!16156)

(declare-fun d!64393 () Bool)

(assert (=> d!64393 (= lt!288500 (readNBitsLSBFirstsLoop!0 (_1!8721 lt!288117) nBits!348 i!590 lt!288119))))

(assert (=> d!64393 (= (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288117) nBits!348 i!590 lt!288119) (tuple2!16155 (_2!8723 lt!288500) (_1!8723 lt!288500)))))

(declare-fun bs!16022 () Bool)

(assert (= bs!16022 d!64393))

(declare-fun m!290325 () Bool)

(assert (=> bs!16022 m!290325))

(assert (=> b!186541 d!64393))

(declare-fun d!64395 () Bool)

(assert (=> d!64395 (= (invariant!0 (currentBit!9043 thiss!1204) (currentByte!9048 thiss!1204) (size!4335 (buf!4798 (_2!8720 lt!288133)))) (and (bvsge (currentBit!9043 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9043 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9048 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9048 thiss!1204) (size!4335 (buf!4798 (_2!8720 lt!288133)))) (and (= (currentBit!9043 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9048 thiss!1204) (size!4335 (buf!4798 (_2!8720 lt!288133))))))))))

(assert (=> b!186541 d!64395))

(assert (=> b!186540 d!64307))

(declare-fun d!64397 () Bool)

(declare-fun e!129160 () Bool)

(assert (=> d!64397 e!129160))

(declare-fun res!155462 () Bool)

(assert (=> d!64397 (=> (not res!155462) (not e!129160))))

(declare-fun lt!288502 () (_ BitVec 64))

(declare-fun lt!288501 () (_ BitVec 64))

(declare-fun lt!288506 () (_ BitVec 64))

(assert (=> d!64397 (= res!155462 (= lt!288502 (bvsub lt!288501 lt!288506)))))

(assert (=> d!64397 (or (= (bvand lt!288501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288506 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288501 lt!288506) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64397 (= lt!288506 (remainingBits!0 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288122))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288122)))))))

(declare-fun lt!288504 () (_ BitVec 64))

(declare-fun lt!288503 () (_ BitVec 64))

(assert (=> d!64397 (= lt!288501 (bvmul lt!288504 lt!288503))))

(assert (=> d!64397 (or (= lt!288504 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!288503 (bvsdiv (bvmul lt!288504 lt!288503) lt!288504)))))

(assert (=> d!64397 (= lt!288503 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64397 (= lt!288504 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))))))

(assert (=> d!64397 (= lt!288502 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288122))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288122)))))))

(assert (=> d!64397 (invariant!0 (currentBit!9043 (_2!8720 lt!288122)) (currentByte!9048 (_2!8720 lt!288122)) (size!4335 (buf!4798 (_2!8720 lt!288122))))))

(assert (=> d!64397 (= (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288122))) (currentByte!9048 (_2!8720 lt!288122)) (currentBit!9043 (_2!8720 lt!288122))) lt!288502)))

(declare-fun b!186694 () Bool)

(declare-fun res!155463 () Bool)

(assert (=> b!186694 (=> (not res!155463) (not e!129160))))

(assert (=> b!186694 (= res!155463 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!288502))))

(declare-fun b!186695 () Bool)

(declare-fun lt!288505 () (_ BitVec 64))

(assert (=> b!186695 (= e!129160 (bvsle lt!288502 (bvmul lt!288505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186695 (or (= lt!288505 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!288505 #b0000000000000000000000000000000000000000000000000000000000001000) lt!288505)))))

(assert (=> b!186695 (= lt!288505 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288122)))))))

(assert (= (and d!64397 res!155462) b!186694))

(assert (= (and b!186694 res!155463) b!186695))

(declare-fun m!290327 () Bool)

(assert (=> d!64397 m!290327))

(assert (=> d!64397 m!289983))

(assert (=> b!186551 d!64397))

(declare-fun d!64399 () Bool)

(declare-fun res!155465 () Bool)

(declare-fun e!129162 () Bool)

(assert (=> d!64399 (=> (not res!155465) (not e!129162))))

(assert (=> d!64399 (= res!155465 (= (size!4335 (buf!4798 thiss!1204)) (size!4335 (buf!4798 (_2!8720 lt!288122)))))))

(assert (=> d!64399 (= (isPrefixOf!0 thiss!1204 (_2!8720 lt!288122)) e!129162)))

(declare-fun b!186696 () Bool)

(declare-fun res!155464 () Bool)

(assert (=> b!186696 (=> (not res!155464) (not e!129162))))

(assert (=> b!186696 (= res!155464 (bvsle (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204)) (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288122))) (currentByte!9048 (_2!8720 lt!288122)) (currentBit!9043 (_2!8720 lt!288122)))))))

(declare-fun b!186697 () Bool)

(declare-fun e!129161 () Bool)

(assert (=> b!186697 (= e!129162 e!129161)))

(declare-fun res!155466 () Bool)

(assert (=> b!186697 (=> res!155466 e!129161)))

(assert (=> b!186697 (= res!155466 (= (size!4335 (buf!4798 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!186698 () Bool)

(assert (=> b!186698 (= e!129161 (arrayBitRangesEq!0 (buf!4798 thiss!1204) (buf!4798 (_2!8720 lt!288122)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4335 (buf!4798 thiss!1204)) (currentByte!9048 thiss!1204) (currentBit!9043 thiss!1204))))))

(assert (= (and d!64399 res!155465) b!186696))

(assert (= (and b!186696 res!155464) b!186697))

(assert (= (and b!186697 (not res!155466)) b!186698))

(assert (=> b!186696 m!290035))

(assert (=> b!186696 m!290021))

(assert (=> b!186698 m!290035))

(assert (=> b!186698 m!290035))

(declare-fun m!290329 () Bool)

(assert (=> b!186698 m!290329))

(assert (=> b!186551 d!64399))

(declare-fun d!64401 () Bool)

(assert (=> d!64401 (isPrefixOf!0 thiss!1204 (_2!8720 lt!288122))))

(declare-fun lt!288509 () Unit!13339)

(declare-fun choose!30 (BitStream!7778 BitStream!7778 BitStream!7778) Unit!13339)

(assert (=> d!64401 (= lt!288509 (choose!30 thiss!1204 (_2!8720 lt!288133) (_2!8720 lt!288122)))))

(assert (=> d!64401 (isPrefixOf!0 thiss!1204 (_2!8720 lt!288133))))

(assert (=> d!64401 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8720 lt!288133) (_2!8720 lt!288122)) lt!288509)))

(declare-fun bs!16023 () Bool)

(assert (= bs!16023 d!64401))

(assert (=> bs!16023 m!290023))

(declare-fun m!290331 () Bool)

(assert (=> bs!16023 m!290331))

(assert (=> bs!16023 m!290029))

(assert (=> b!186551 d!64401))

(declare-fun d!64403 () Bool)

(declare-fun e!129218 () Bool)

(assert (=> d!64403 e!129218))

(declare-fun res!155547 () Bool)

(assert (=> d!64403 (=> (not res!155547) (not e!129218))))

(declare-fun lt!288857 () tuple2!16150)

(assert (=> d!64403 (= res!155547 (invariant!0 (currentBit!9043 (_2!8720 lt!288857)) (currentByte!9048 (_2!8720 lt!288857)) (size!4335 (buf!4798 (_2!8720 lt!288857)))))))

(declare-fun e!129221 () tuple2!16150)

(assert (=> d!64403 (= lt!288857 e!129221)))

(declare-fun c!9526 () Bool)

(assert (=> d!64403 (= c!9526 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64403 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64403 (= (appendBitsLSBFirstLoopTR!0 (_2!8720 lt!288133) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!288857)))

(declare-fun b!186793 () Bool)

(declare-fun lt!288831 () tuple2!16148)

(declare-fun lt!288834 () tuple2!16150)

(assert (=> b!186793 (= lt!288831 (readBitPure!0 (readerFrom!0 (_2!8720 lt!288834) (currentBit!9043 (_2!8720 lt!288133)) (currentByte!9048 (_2!8720 lt!288133)))))))

(declare-fun lt!288842 () Bool)

(declare-fun res!155546 () Bool)

(assert (=> b!186793 (= res!155546 (and (= (_2!8719 lt!288831) lt!288842) (= (_1!8719 lt!288831) (_2!8720 lt!288834))))))

(declare-fun e!129222 () Bool)

(assert (=> b!186793 (=> (not res!155546) (not e!129222))))

(declare-fun e!129217 () Bool)

(assert (=> b!186793 (= e!129217 e!129222)))

(declare-fun b!186794 () Bool)

(declare-fun Unit!13356 () Unit!13339)

(assert (=> b!186794 (= e!129221 (tuple2!16151 Unit!13356 (_2!8720 lt!288133)))))

(declare-fun lt!288867 () Unit!13339)

(assert (=> b!186794 (= lt!288867 (lemmaIsPrefixRefl!0 (_2!8720 lt!288133)))))

(declare-fun call!3002 () Bool)

(assert (=> b!186794 call!3002))

(declare-fun lt!288856 () Unit!13339)

(assert (=> b!186794 (= lt!288856 lt!288867)))

(declare-fun bm!2999 () Bool)

(assert (=> bm!2999 (= call!3002 (isPrefixOf!0 (_2!8720 lt!288133) (ite c!9526 (_2!8720 lt!288133) (_2!8720 lt!288834))))))

(declare-fun b!186795 () Bool)

(declare-fun e!129223 () (_ BitVec 64))

(assert (=> b!186795 (= e!129223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!186796 () Bool)

(declare-fun res!155549 () Bool)

(assert (=> b!186796 (= res!155549 call!3002)))

(assert (=> b!186796 (=> (not res!155549) (not e!129217))))

(declare-fun b!186797 () Bool)

(declare-fun e!129224 () Bool)

(declare-fun lt!288860 () tuple2!16154)

(declare-fun lt!288870 () tuple2!16152)

(assert (=> b!186797 (= e!129224 (= (_1!8722 lt!288860) (_2!8721 lt!288870)))))

(declare-fun b!186798 () Bool)

(declare-fun lt!288858 () tuple2!16150)

(assert (=> b!186798 (= e!129221 (tuple2!16151 (_1!8720 lt!288858) (_2!8720 lt!288858)))))

(assert (=> b!186798 (= lt!288842 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186798 (= lt!288834 (appendBit!0 (_2!8720 lt!288133) lt!288842))))

(declare-fun res!155552 () Bool)

(assert (=> b!186798 (= res!155552 (= (size!4335 (buf!4798 (_2!8720 lt!288133))) (size!4335 (buf!4798 (_2!8720 lt!288834)))))))

(assert (=> b!186798 (=> (not res!155552) (not e!129217))))

(assert (=> b!186798 e!129217))

(declare-fun lt!288868 () tuple2!16150)

(assert (=> b!186798 (= lt!288868 lt!288834)))

(assert (=> b!186798 (= lt!288858 (appendBitsLSBFirstLoopTR!0 (_2!8720 lt!288868) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!288829 () Unit!13339)

(assert (=> b!186798 (= lt!288829 (lemmaIsPrefixTransitive!0 (_2!8720 lt!288133) (_2!8720 lt!288868) (_2!8720 lt!288858)))))

(assert (=> b!186798 (isPrefixOf!0 (_2!8720 lt!288133) (_2!8720 lt!288858))))

(declare-fun lt!288843 () Unit!13339)

(assert (=> b!186798 (= lt!288843 lt!288829)))

(assert (=> b!186798 (invariant!0 (currentBit!9043 (_2!8720 lt!288133)) (currentByte!9048 (_2!8720 lt!288133)) (size!4335 (buf!4798 (_2!8720 lt!288868))))))

(declare-fun lt!288840 () BitStream!7778)

(assert (=> b!186798 (= lt!288840 (BitStream!7779 (buf!4798 (_2!8720 lt!288868)) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))))))

(assert (=> b!186798 (invariant!0 (currentBit!9043 lt!288840) (currentByte!9048 lt!288840) (size!4335 (buf!4798 (_2!8720 lt!288858))))))

(declare-fun lt!288845 () BitStream!7778)

(assert (=> b!186798 (= lt!288845 (BitStream!7779 (buf!4798 (_2!8720 lt!288858)) (currentByte!9048 lt!288840) (currentBit!9043 lt!288840)))))

(declare-fun lt!288864 () tuple2!16148)

(assert (=> b!186798 (= lt!288864 (readBitPure!0 lt!288840))))

(declare-fun lt!288851 () tuple2!16148)

(assert (=> b!186798 (= lt!288851 (readBitPure!0 lt!288845))))

(declare-fun lt!288821 () Unit!13339)

(assert (=> b!186798 (= lt!288821 (readBitPrefixLemma!0 lt!288840 (_2!8720 lt!288858)))))

(declare-fun res!155548 () Bool)

(assert (=> b!186798 (= res!155548 (= (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288864))) (currentByte!9048 (_1!8719 lt!288864)) (currentBit!9043 (_1!8719 lt!288864))) (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288851))) (currentByte!9048 (_1!8719 lt!288851)) (currentBit!9043 (_1!8719 lt!288851)))))))

(declare-fun e!129225 () Bool)

(assert (=> b!186798 (=> (not res!155548) (not e!129225))))

(assert (=> b!186798 e!129225))

(declare-fun lt!288854 () Unit!13339)

(assert (=> b!186798 (= lt!288854 lt!288821)))

(declare-fun lt!288825 () tuple2!16152)

(assert (=> b!186798 (= lt!288825 (reader!0 (_2!8720 lt!288133) (_2!8720 lt!288858)))))

(declare-fun lt!288861 () tuple2!16152)

(assert (=> b!186798 (= lt!288861 (reader!0 (_2!8720 lt!288868) (_2!8720 lt!288858)))))

(declare-fun lt!288824 () tuple2!16148)

(assert (=> b!186798 (= lt!288824 (readBitPure!0 (_1!8721 lt!288825)))))

(assert (=> b!186798 (= (_2!8719 lt!288824) lt!288842)))

(declare-fun lt!288874 () Unit!13339)

(declare-fun Unit!13357 () Unit!13339)

(assert (=> b!186798 (= lt!288874 Unit!13357)))

(declare-fun lt!288828 () (_ BitVec 64))

(assert (=> b!186798 (= lt!288828 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!288869 () (_ BitVec 64))

(assert (=> b!186798 (= lt!288869 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!288862 () Unit!13339)

(assert (=> b!186798 (= lt!288862 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8720 lt!288133) (buf!4798 (_2!8720 lt!288858)) lt!288869))))

(assert (=> b!186798 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288858)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133))) lt!288869)))

(declare-fun lt!288855 () Unit!13339)

(assert (=> b!186798 (= lt!288855 lt!288862)))

(declare-fun lt!288852 () tuple2!16154)

(assert (=> b!186798 (= lt!288852 (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288825) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288828))))

(declare-fun lt!288846 () (_ BitVec 64))

(assert (=> b!186798 (= lt!288846 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!288853 () Unit!13339)

(assert (=> b!186798 (= lt!288853 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8720 lt!288868) (buf!4798 (_2!8720 lt!288858)) lt!288846))))

(assert (=> b!186798 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288858)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288868))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288868))) lt!288846)))

(declare-fun lt!288841 () Unit!13339)

(assert (=> b!186798 (= lt!288841 lt!288853)))

(declare-fun lt!288835 () tuple2!16154)

(assert (=> b!186798 (= lt!288835 (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288861) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!288828 (ite (_2!8719 lt!288824) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!288859 () tuple2!16154)

(assert (=> b!186798 (= lt!288859 (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288825) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288828))))

(declare-fun c!9525 () Bool)

(assert (=> b!186798 (= c!9525 (_2!8719 (readBitPure!0 (_1!8721 lt!288825))))))

(declare-fun lt!288866 () tuple2!16154)

(assert (=> b!186798 (= lt!288866 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8721 lt!288825) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!288828 e!129223)))))

(declare-fun lt!288838 () Unit!13339)

(assert (=> b!186798 (= lt!288838 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8721 lt!288825) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!288828))))

(assert (=> b!186798 (and (= (_2!8722 lt!288859) (_2!8722 lt!288866)) (= (_1!8722 lt!288859) (_1!8722 lt!288866)))))

(declare-fun lt!288871 () Unit!13339)

(assert (=> b!186798 (= lt!288871 lt!288838)))

(assert (=> b!186798 (= (_1!8721 lt!288825) (withMovedBitIndex!0 (_2!8721 lt!288825) (bvsub (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))) (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288858))) (currentByte!9048 (_2!8720 lt!288858)) (currentBit!9043 (_2!8720 lt!288858))))))))

(declare-fun lt!288872 () Unit!13339)

(declare-fun Unit!13358 () Unit!13339)

(assert (=> b!186798 (= lt!288872 Unit!13358)))

(assert (=> b!186798 (= (_1!8721 lt!288861) (withMovedBitIndex!0 (_2!8721 lt!288861) (bvsub (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288868))) (currentByte!9048 (_2!8720 lt!288868)) (currentBit!9043 (_2!8720 lt!288868))) (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288858))) (currentByte!9048 (_2!8720 lt!288858)) (currentBit!9043 (_2!8720 lt!288858))))))))

(declare-fun lt!288839 () Unit!13339)

(declare-fun Unit!13359 () Unit!13339)

(assert (=> b!186798 (= lt!288839 Unit!13359)))

(assert (=> b!186798 (= (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))) (bvsub (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288868))) (currentByte!9048 (_2!8720 lt!288868)) (currentBit!9043 (_2!8720 lt!288868))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!288849 () Unit!13339)

(declare-fun Unit!13360 () Unit!13339)

(assert (=> b!186798 (= lt!288849 Unit!13360)))

(assert (=> b!186798 (= (_2!8722 lt!288852) (_2!8722 lt!288835))))

(declare-fun lt!288823 () Unit!13339)

(declare-fun Unit!13361 () Unit!13339)

(assert (=> b!186798 (= lt!288823 Unit!13361)))

(assert (=> b!186798 (invariant!0 (currentBit!9043 (_2!8720 lt!288858)) (currentByte!9048 (_2!8720 lt!288858)) (size!4335 (buf!4798 (_2!8720 lt!288858))))))

(declare-fun lt!288833 () Unit!13339)

(declare-fun Unit!13362 () Unit!13339)

(assert (=> b!186798 (= lt!288833 Unit!13362)))

(assert (=> b!186798 (= (size!4335 (buf!4798 (_2!8720 lt!288133))) (size!4335 (buf!4798 (_2!8720 lt!288858))))))

(declare-fun lt!288827 () Unit!13339)

(declare-fun Unit!13363 () Unit!13339)

(assert (=> b!186798 (= lt!288827 Unit!13363)))

(assert (=> b!186798 (= (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288858))) (currentByte!9048 (_2!8720 lt!288858)) (currentBit!9043 (_2!8720 lt!288858))) (bvsub (bvadd (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!288832 () Unit!13339)

(declare-fun Unit!13364 () Unit!13339)

(assert (=> b!186798 (= lt!288832 Unit!13364)))

(declare-fun lt!288830 () Unit!13339)

(declare-fun Unit!13365 () Unit!13339)

(assert (=> b!186798 (= lt!288830 Unit!13365)))

(declare-fun lt!288836 () tuple2!16152)

(assert (=> b!186798 (= lt!288836 (reader!0 (_2!8720 lt!288133) (_2!8720 lt!288858)))))

(declare-fun lt!288847 () (_ BitVec 64))

(assert (=> b!186798 (= lt!288847 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!288873 () Unit!13339)

(assert (=> b!186798 (= lt!288873 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8720 lt!288133) (buf!4798 (_2!8720 lt!288858)) lt!288847))))

(assert (=> b!186798 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288858)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133))) lt!288847)))

(declare-fun lt!288863 () Unit!13339)

(assert (=> b!186798 (= lt!288863 lt!288873)))

(declare-fun lt!288850 () tuple2!16154)

(assert (=> b!186798 (= lt!288850 (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288836) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!155551 () Bool)

(assert (=> b!186798 (= res!155551 (= (_2!8722 lt!288850) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!129220 () Bool)

(assert (=> b!186798 (=> (not res!155551) (not e!129220))))

(assert (=> b!186798 e!129220))

(declare-fun lt!288865 () Unit!13339)

(declare-fun Unit!13366 () Unit!13339)

(assert (=> b!186798 (= lt!288865 Unit!13366)))

(declare-fun b!186799 () Bool)

(assert (=> b!186799 (= e!129222 (= (bitIndex!0 (size!4335 (buf!4798 (_1!8719 lt!288831))) (currentByte!9048 (_1!8719 lt!288831)) (currentBit!9043 (_1!8719 lt!288831))) (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288834))) (currentByte!9048 (_2!8720 lt!288834)) (currentBit!9043 (_2!8720 lt!288834)))))))

(declare-fun b!186800 () Bool)

(assert (=> b!186800 (= e!129220 (= (_1!8722 lt!288850) (_2!8721 lt!288836)))))

(declare-fun b!186801 () Bool)

(declare-fun res!155545 () Bool)

(assert (=> b!186801 (=> (not res!155545) (not e!129218))))

(declare-fun lt!288826 () (_ BitVec 64))

(declare-fun lt!288875 () (_ BitVec 64))

(assert (=> b!186801 (= res!155545 (= (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288857))) (currentByte!9048 (_2!8720 lt!288857)) (currentBit!9043 (_2!8720 lt!288857))) (bvsub lt!288875 lt!288826)))))

(assert (=> b!186801 (or (= (bvand lt!288875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288826 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!288875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288875 lt!288826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186801 (= lt!288826 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!288844 () (_ BitVec 64))

(declare-fun lt!288820 () (_ BitVec 64))

(assert (=> b!186801 (= lt!288875 (bvadd lt!288844 lt!288820))))

(assert (=> b!186801 (or (not (= (bvand lt!288844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!288820 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288844 lt!288820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186801 (= lt!288820 ((_ sign_extend 32) nBits!348))))

(assert (=> b!186801 (= lt!288844 (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))))))

(declare-fun b!186802 () Bool)

(assert (=> b!186802 (= e!129225 (= (_2!8719 lt!288864) (_2!8719 lt!288851)))))

(declare-fun b!186803 () Bool)

(declare-fun res!155550 () Bool)

(assert (=> b!186803 (= res!155550 (= (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288834))) (currentByte!9048 (_2!8720 lt!288834)) (currentBit!9043 (_2!8720 lt!288834))) (bvadd (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!186803 (=> (not res!155550) (not e!129217))))

(declare-fun b!186804 () Bool)

(declare-fun res!155544 () Bool)

(assert (=> b!186804 (=> (not res!155544) (not e!129218))))

(assert (=> b!186804 (= res!155544 (isPrefixOf!0 (_2!8720 lt!288133) (_2!8720 lt!288857)))))

(declare-fun b!186805 () Bool)

(assert (=> b!186805 (= e!129223 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!186806 () Bool)

(declare-fun res!155542 () Bool)

(assert (=> b!186806 (=> (not res!155542) (not e!129218))))

(assert (=> b!186806 (= res!155542 (= (size!4335 (buf!4798 (_2!8720 lt!288133))) (size!4335 (buf!4798 (_2!8720 lt!288857)))))))

(declare-fun b!186807 () Bool)

(declare-fun e!129219 () Bool)

(declare-fun lt!288822 () (_ BitVec 64))

(assert (=> b!186807 (= e!129219 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288133)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133))) lt!288822))))

(declare-fun b!186808 () Bool)

(assert (=> b!186808 (= e!129218 e!129224)))

(declare-fun res!155543 () Bool)

(assert (=> b!186808 (=> (not res!155543) (not e!129224))))

(assert (=> b!186808 (= res!155543 (= (_2!8722 lt!288860) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!186808 (= lt!288860 (readNBitsLSBFirstsLoopPure!0 (_1!8721 lt!288870) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!288848 () Unit!13339)

(declare-fun lt!288837 () Unit!13339)

(assert (=> b!186808 (= lt!288848 lt!288837)))

(assert (=> b!186808 (validate_offset_bits!1 ((_ sign_extend 32) (size!4335 (buf!4798 (_2!8720 lt!288857)))) ((_ sign_extend 32) (currentByte!9048 (_2!8720 lt!288133))) ((_ sign_extend 32) (currentBit!9043 (_2!8720 lt!288133))) lt!288822)))

(assert (=> b!186808 (= lt!288837 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8720 lt!288133) (buf!4798 (_2!8720 lt!288857)) lt!288822))))

(assert (=> b!186808 e!129219))

(declare-fun res!155541 () Bool)

(assert (=> b!186808 (=> (not res!155541) (not e!129219))))

(assert (=> b!186808 (= res!155541 (and (= (size!4335 (buf!4798 (_2!8720 lt!288133))) (size!4335 (buf!4798 (_2!8720 lt!288857)))) (bvsge lt!288822 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186808 (= lt!288822 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!186808 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!186808 (= lt!288870 (reader!0 (_2!8720 lt!288133) (_2!8720 lt!288857)))))

(assert (= (and d!64403 c!9526) b!186794))

(assert (= (and d!64403 (not c!9526)) b!186798))

(assert (= (and b!186798 res!155552) b!186803))

(assert (= (and b!186803 res!155550) b!186796))

(assert (= (and b!186796 res!155549) b!186793))

(assert (= (and b!186793 res!155546) b!186799))

(assert (= (and b!186798 res!155548) b!186802))

(assert (= (and b!186798 c!9525) b!186805))

(assert (= (and b!186798 (not c!9525)) b!186795))

(assert (= (and b!186798 res!155551) b!186800))

(assert (= (or b!186794 b!186796) bm!2999))

(assert (= (and d!64403 res!155547) b!186806))

(assert (= (and b!186806 res!155542) b!186801))

(assert (= (and b!186801 res!155545) b!186804))

(assert (= (and b!186804 res!155544) b!186808))

(assert (= (and b!186808 res!155541) b!186807))

(assert (= (and b!186808 res!155543) b!186797))

(declare-fun m!290443 () Bool)

(assert (=> b!186799 m!290443))

(declare-fun m!290445 () Bool)

(assert (=> b!186799 m!290445))

(declare-fun m!290447 () Bool)

(assert (=> b!186801 m!290447))

(assert (=> b!186801 m!290033))

(declare-fun m!290449 () Bool)

(assert (=> b!186793 m!290449))

(assert (=> b!186793 m!290449))

(declare-fun m!290451 () Bool)

(assert (=> b!186793 m!290451))

(declare-fun m!290453 () Bool)

(assert (=> b!186807 m!290453))

(declare-fun m!290455 () Bool)

(assert (=> b!186804 m!290455))

(assert (=> b!186798 m!290033))

(declare-fun m!290457 () Bool)

(assert (=> b!186798 m!290457))

(declare-fun m!290459 () Bool)

(assert (=> b!186798 m!290459))

(declare-fun m!290461 () Bool)

(assert (=> b!186798 m!290461))

(declare-fun m!290463 () Bool)

(assert (=> b!186798 m!290463))

(declare-fun m!290465 () Bool)

(assert (=> b!186798 m!290465))

(declare-fun m!290467 () Bool)

(assert (=> b!186798 m!290467))

(declare-fun m!290469 () Bool)

(assert (=> b!186798 m!290469))

(declare-fun m!290471 () Bool)

(assert (=> b!186798 m!290471))

(declare-fun m!290473 () Bool)

(assert (=> b!186798 m!290473))

(declare-fun m!290475 () Bool)

(assert (=> b!186798 m!290475))

(declare-fun m!290477 () Bool)

(assert (=> b!186798 m!290477))

(declare-fun m!290479 () Bool)

(assert (=> b!186798 m!290479))

(declare-fun m!290481 () Bool)

(assert (=> b!186798 m!290481))

(declare-fun m!290483 () Bool)

(assert (=> b!186798 m!290483))

(declare-fun m!290485 () Bool)

(assert (=> b!186798 m!290485))

(assert (=> b!186798 m!290461))

(declare-fun m!290487 () Bool)

(assert (=> b!186798 m!290487))

(declare-fun m!290489 () Bool)

(assert (=> b!186798 m!290489))

(declare-fun m!290491 () Bool)

(assert (=> b!186798 m!290491))

(declare-fun m!290493 () Bool)

(assert (=> b!186798 m!290493))

(declare-fun m!290495 () Bool)

(assert (=> b!186798 m!290495))

(declare-fun m!290497 () Bool)

(assert (=> b!186798 m!290497))

(declare-fun m!290499 () Bool)

(assert (=> b!186798 m!290499))

(declare-fun m!290501 () Bool)

(assert (=> b!186798 m!290501))

(declare-fun m!290503 () Bool)

(assert (=> b!186798 m!290503))

(declare-fun m!290505 () Bool)

(assert (=> b!186798 m!290505))

(declare-fun m!290507 () Bool)

(assert (=> b!186798 m!290507))

(declare-fun m!290509 () Bool)

(assert (=> b!186798 m!290509))

(declare-fun m!290511 () Bool)

(assert (=> b!186798 m!290511))

(declare-fun m!290513 () Bool)

(assert (=> b!186798 m!290513))

(declare-fun m!290515 () Bool)

(assert (=> b!186798 m!290515))

(declare-fun m!290517 () Bool)

(assert (=> b!186798 m!290517))

(declare-fun m!290519 () Bool)

(assert (=> b!186798 m!290519))

(declare-fun m!290521 () Bool)

(assert (=> b!186798 m!290521))

(assert (=> b!186803 m!290445))

(assert (=> b!186803 m!290033))

(assert (=> b!186808 m!290459))

(declare-fun m!290523 () Bool)

(assert (=> b!186808 m!290523))

(assert (=> b!186808 m!290505))

(declare-fun m!290525 () Bool)

(assert (=> b!186808 m!290525))

(declare-fun m!290527 () Bool)

(assert (=> b!186808 m!290527))

(declare-fun m!290529 () Bool)

(assert (=> b!186808 m!290529))

(declare-fun m!290531 () Bool)

(assert (=> d!64403 m!290531))

(declare-fun m!290533 () Bool)

(assert (=> bm!2999 m!290533))

(assert (=> b!186794 m!290269))

(assert (=> b!186551 d!64403))

(declare-fun d!64427 () Bool)

(declare-fun e!129231 () Bool)

(assert (=> d!64427 e!129231))

(declare-fun res!155561 () Bool)

(assert (=> d!64427 (=> (not res!155561) (not e!129231))))

(declare-fun lt!288894 () BitStream!7778)

(declare-fun lt!288895 () (_ BitVec 64))

(assert (=> d!64427 (= res!155561 (= (bvadd lt!288895 (bvsub lt!288125 lt!288110)) (bitIndex!0 (size!4335 (buf!4798 lt!288894)) (currentByte!9048 lt!288894) (currentBit!9043 lt!288894))))))

(assert (=> d!64427 (or (not (= (bvand lt!288895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!288125 lt!288110) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!288895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!288895 (bvsub lt!288125 lt!288110)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64427 (= lt!288895 (bitIndex!0 (size!4335 (buf!4798 (_2!8721 lt!288118))) (currentByte!9048 (_2!8721 lt!288118)) (currentBit!9043 (_2!8721 lt!288118))))))

(assert (=> d!64427 (= lt!288894 (_2!8720 (moveBitIndex!0 (_2!8721 lt!288118) (bvsub lt!288125 lt!288110))))))

(assert (=> d!64427 (moveBitIndexPrecond!0 (_2!8721 lt!288118) (bvsub lt!288125 lt!288110))))

(assert (=> d!64427 (= (withMovedBitIndex!0 (_2!8721 lt!288118) (bvsub lt!288125 lt!288110)) lt!288894)))

(declare-fun b!186817 () Bool)

(assert (=> b!186817 (= e!129231 (= (size!4335 (buf!4798 (_2!8721 lt!288118))) (size!4335 (buf!4798 lt!288894))))))

(assert (= (and d!64427 res!155561) b!186817))

(declare-fun m!290535 () Bool)

(assert (=> d!64427 m!290535))

(declare-fun m!290537 () Bool)

(assert (=> d!64427 m!290537))

(declare-fun m!290539 () Bool)

(assert (=> d!64427 m!290539))

(declare-fun m!290541 () Bool)

(assert (=> d!64427 m!290541))

(assert (=> b!186550 d!64427))

(declare-fun d!64429 () Bool)

(declare-fun res!155563 () Bool)

(declare-fun e!129233 () Bool)

(assert (=> d!64429 (=> (not res!155563) (not e!129233))))

(assert (=> d!64429 (= res!155563 (= (size!4335 (buf!4798 (_2!8720 lt!288133))) (size!4335 (buf!4798 (_2!8720 lt!288122)))))))

(assert (=> d!64429 (= (isPrefixOf!0 (_2!8720 lt!288133) (_2!8720 lt!288122)) e!129233)))

(declare-fun b!186818 () Bool)

(declare-fun res!155562 () Bool)

(assert (=> b!186818 (=> (not res!155562) (not e!129233))))

(assert (=> b!186818 (= res!155562 (bvsle (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133))) (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288122))) (currentByte!9048 (_2!8720 lt!288122)) (currentBit!9043 (_2!8720 lt!288122)))))))

(declare-fun b!186819 () Bool)

(declare-fun e!129232 () Bool)

(assert (=> b!186819 (= e!129233 e!129232)))

(declare-fun res!155564 () Bool)

(assert (=> b!186819 (=> res!155564 e!129232)))

(assert (=> b!186819 (= res!155564 (= (size!4335 (buf!4798 (_2!8720 lt!288133))) #b00000000000000000000000000000000))))

(declare-fun b!186820 () Bool)

(assert (=> b!186820 (= e!129232 (arrayBitRangesEq!0 (buf!4798 (_2!8720 lt!288133)) (buf!4798 (_2!8720 lt!288122)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4335 (buf!4798 (_2!8720 lt!288133))) (currentByte!9048 (_2!8720 lt!288133)) (currentBit!9043 (_2!8720 lt!288133)))))))

(assert (= (and d!64429 res!155563) b!186818))

(assert (= (and b!186818 res!155562) b!186819))

(assert (= (and b!186819 (not res!155564)) b!186820))

(assert (=> b!186818 m!290033))

(assert (=> b!186818 m!290021))

(assert (=> b!186820 m!290033))

(assert (=> b!186820 m!290033))

(declare-fun m!290543 () Bool)

(assert (=> b!186820 m!290543))

(assert (=> b!186539 d!64429))

(push 1)

