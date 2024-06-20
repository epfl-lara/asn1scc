; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41018 () Bool)

(assert start!41018)

(declare-fun b!190216 () Bool)

(declare-fun res!158677 () Bool)

(declare-fun e!131273 () Bool)

(assert (=> b!190216 (=> (not res!158677) (not e!131273))))

(declare-datatypes ((array!9908 0))(
  ( (array!9909 (arr!5299 (Array (_ BitVec 32) (_ BitVec 8))) (size!4369 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7846 0))(
  ( (BitStream!7847 (buf!4843 array!9908) (currentByte!9115 (_ BitVec 32)) (currentBit!9110 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7846)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190216 (= res!158677 (invariant!0 (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204) (size!4369 (buf!4843 thiss!1204))))))

(declare-fun b!190217 () Bool)

(declare-fun res!158686 () Bool)

(declare-fun e!131272 () Bool)

(assert (=> b!190217 (=> res!158686 e!131272)))

(declare-datatypes ((Unit!13537 0))(
  ( (Unit!13538) )
))
(declare-datatypes ((tuple2!16460 0))(
  ( (tuple2!16461 (_1!8875 Unit!13537) (_2!8875 BitStream!7846)) )
))
(declare-fun lt!295143 () tuple2!16460)

(assert (=> b!190217 (= res!158686 (not (invariant!0 (currentBit!9110 (_2!8875 lt!295143)) (currentByte!9115 (_2!8875 lt!295143)) (size!4369 (buf!4843 (_2!8875 lt!295143))))))))

(declare-fun b!190218 () Bool)

(declare-fun res!158674 () Bool)

(assert (=> b!190218 (=> res!158674 e!131272)))

(declare-fun lt!295144 () tuple2!16460)

(declare-fun isPrefixOf!0 (BitStream!7846 BitStream!7846) Bool)

(assert (=> b!190218 (= res!158674 (not (isPrefixOf!0 thiss!1204 (_2!8875 lt!295144))))))

(declare-fun b!190219 () Bool)

(declare-fun res!158671 () Bool)

(declare-fun e!131271 () Bool)

(assert (=> b!190219 (=> (not res!158671) (not e!131271))))

(declare-fun lt!295140 () (_ BitVec 64))

(declare-fun lt!295161 () (_ BitVec 64))

(declare-datatypes ((tuple2!16462 0))(
  ( (tuple2!16463 (_1!8876 BitStream!7846) (_2!8876 BitStream!7846)) )
))
(declare-fun lt!295138 () tuple2!16462)

(declare-fun withMovedBitIndex!0 (BitStream!7846 (_ BitVec 64)) BitStream!7846)

(assert (=> b!190219 (= res!158671 (= (_1!8876 lt!295138) (withMovedBitIndex!0 (_2!8876 lt!295138) (bvsub lt!295140 lt!295161))))))

(declare-fun b!190220 () Bool)

(declare-fun e!131279 () Bool)

(assert (=> b!190220 (= e!131279 e!131273)))

(declare-fun res!158687 () Bool)

(assert (=> b!190220 (=> (not res!158687) (not e!131273))))

(declare-fun lt!295159 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190220 (= res!158687 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 thiss!1204))) ((_ sign_extend 32) (currentByte!9115 thiss!1204)) ((_ sign_extend 32) (currentBit!9110 thiss!1204)) lt!295159))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!190220 (= lt!295159 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!190221 () Bool)

(declare-fun e!131277 () Bool)

(assert (=> b!190221 (= e!131277 (invariant!0 (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204) (size!4369 (buf!4843 (_2!8875 lt!295143)))))))

(declare-fun b!190222 () Bool)

(declare-fun res!158681 () Bool)

(declare-fun e!131278 () Bool)

(assert (=> b!190222 (=> res!158681 e!131278)))

(declare-datatypes ((tuple2!16464 0))(
  ( (tuple2!16465 (_1!8877 BitStream!7846) (_2!8877 (_ BitVec 64))) )
))
(declare-fun lt!295162 () tuple2!16464)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190222 (= res!158681 (not (= (bitIndex!0 (size!4369 (buf!4843 (_1!8877 lt!295162))) (currentByte!9115 (_1!8877 lt!295162)) (currentBit!9110 (_1!8877 lt!295162))) (bitIndex!0 (size!4369 (buf!4843 (_2!8876 lt!295138))) (currentByte!9115 (_2!8876 lt!295138)) (currentBit!9110 (_2!8876 lt!295138))))))))

(declare-fun b!190223 () Bool)

(assert (=> b!190223 (= e!131278 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8876 lt!295138)))) ((_ sign_extend 32) (currentByte!9115 (_1!8876 lt!295138))) ((_ sign_extend 32) (currentBit!9110 (_1!8876 lt!295138))) lt!295159))))

(assert (=> b!190223 (= (size!4369 (buf!4843 thiss!1204)) (size!4369 (buf!4843 (_2!8875 lt!295143))))))

(declare-fun b!190224 () Bool)

(declare-fun e!131268 () Bool)

(assert (=> b!190224 (= e!131273 (not e!131268))))

(declare-fun res!158672 () Bool)

(assert (=> b!190224 (=> res!158672 e!131268)))

(declare-fun lt!295146 () (_ BitVec 64))

(assert (=> b!190224 (= res!158672 (not (= lt!295146 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!295140))))))

(assert (=> b!190224 (= lt!295146 (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))))))

(assert (=> b!190224 (= lt!295140 (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)))))

(declare-fun e!131267 () Bool)

(assert (=> b!190224 e!131267))

(declare-fun res!158683 () Bool)

(assert (=> b!190224 (=> (not res!158683) (not e!131267))))

(assert (=> b!190224 (= res!158683 (= (size!4369 (buf!4843 thiss!1204)) (size!4369 (buf!4843 (_2!8875 lt!295144)))))))

(declare-fun lt!295141 () Bool)

(declare-fun appendBit!0 (BitStream!7846 Bool) tuple2!16460)

(assert (=> b!190224 (= lt!295144 (appendBit!0 thiss!1204 lt!295141))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!295154 () (_ BitVec 64))

(assert (=> b!190224 (= lt!295141 (not (= (bvand v!189 lt!295154) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190224 (= lt!295154 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!190225 () Bool)

(declare-fun e!131266 () Bool)

(assert (=> b!190225 (= e!131272 e!131266)))

(declare-fun res!158685 () Bool)

(assert (=> b!190225 (=> res!158685 e!131266)))

(declare-fun lt!295158 () tuple2!16464)

(declare-fun lt!295160 () tuple2!16462)

(assert (=> b!190225 (= res!158685 (not (= (_1!8877 lt!295158) (_2!8876 lt!295160))))))

(declare-fun lt!295147 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16464)

(assert (=> b!190225 (= lt!295158 (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!295160) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295147))))

(declare-fun lt!295139 () (_ BitVec 64))

(assert (=> b!190225 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144))) lt!295139)))

(declare-fun lt!295149 () Unit!13537)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7846 array!9908 (_ BitVec 64)) Unit!13537)

(assert (=> b!190225 (= lt!295149 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8875 lt!295144) (buf!4843 (_2!8875 lt!295143)) lt!295139))))

(assert (=> b!190225 (= lt!295139 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!16466 0))(
  ( (tuple2!16467 (_1!8878 BitStream!7846) (_2!8878 Bool)) )
))
(declare-fun lt!295155 () tuple2!16466)

(declare-fun lt!295148 () (_ BitVec 64))

(assert (=> b!190225 (= lt!295147 (bvor lt!295148 (ite (_2!8878 lt!295155) lt!295154 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190225 (= lt!295162 (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!295138) nBits!348 i!590 lt!295148))))

(assert (=> b!190225 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))) ((_ sign_extend 32) (currentByte!9115 thiss!1204)) ((_ sign_extend 32) (currentBit!9110 thiss!1204)) lt!295159)))

(declare-fun lt!295152 () Unit!13537)

(assert (=> b!190225 (= lt!295152 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4843 (_2!8875 lt!295143)) lt!295159))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190225 (= lt!295148 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!190225 (= (_2!8878 lt!295155) lt!295141)))

(declare-fun readBitPure!0 (BitStream!7846) tuple2!16466)

(assert (=> b!190225 (= lt!295155 (readBitPure!0 (_1!8876 lt!295138)))))

(declare-fun reader!0 (BitStream!7846 BitStream!7846) tuple2!16462)

(assert (=> b!190225 (= lt!295160 (reader!0 (_2!8875 lt!295144) (_2!8875 lt!295143)))))

(assert (=> b!190225 (= lt!295138 (reader!0 thiss!1204 (_2!8875 lt!295143)))))

(declare-fun e!131275 () Bool)

(assert (=> b!190225 e!131275))

(declare-fun res!158670 () Bool)

(assert (=> b!190225 (=> (not res!158670) (not e!131275))))

(declare-fun lt!295164 () tuple2!16466)

(declare-fun lt!295153 () tuple2!16466)

(assert (=> b!190225 (= res!158670 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!295164))) (currentByte!9115 (_1!8878 lt!295164)) (currentBit!9110 (_1!8878 lt!295164))) (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!295153))) (currentByte!9115 (_1!8878 lt!295153)) (currentBit!9110 (_1!8878 lt!295153)))))))

(declare-fun lt!295142 () Unit!13537)

(declare-fun lt!295165 () BitStream!7846)

(declare-fun readBitPrefixLemma!0 (BitStream!7846 BitStream!7846) Unit!13537)

(assert (=> b!190225 (= lt!295142 (readBitPrefixLemma!0 lt!295165 (_2!8875 lt!295143)))))

(assert (=> b!190225 (= lt!295153 (readBitPure!0 (BitStream!7847 (buf!4843 (_2!8875 lt!295143)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204))))))

(assert (=> b!190225 (= lt!295164 (readBitPure!0 lt!295165))))

(assert (=> b!190225 e!131277))

(declare-fun res!158684 () Bool)

(assert (=> b!190225 (=> (not res!158684) (not e!131277))))

(assert (=> b!190225 (= res!158684 (invariant!0 (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204) (size!4369 (buf!4843 (_2!8875 lt!295144)))))))

(assert (=> b!190225 (= lt!295165 (BitStream!7847 (buf!4843 (_2!8875 lt!295144)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)))))

(declare-fun b!190226 () Bool)

(declare-fun e!131276 () Bool)

(declare-fun e!131269 () Bool)

(assert (=> b!190226 (= e!131276 e!131269)))

(declare-fun res!158682 () Bool)

(assert (=> b!190226 (=> (not res!158682) (not e!131269))))

(declare-fun lt!295137 () tuple2!16466)

(assert (=> b!190226 (= res!158682 (and (= (_2!8878 lt!295137) lt!295141) (= (_1!8878 lt!295137) (_2!8875 lt!295144))))))

(declare-fun readerFrom!0 (BitStream!7846 (_ BitVec 32) (_ BitVec 32)) BitStream!7846)

(assert (=> b!190226 (= lt!295137 (readBitPure!0 (readerFrom!0 (_2!8875 lt!295144) (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204))))))

(declare-fun b!190227 () Bool)

(assert (=> b!190227 (= e!131275 (= (_2!8878 lt!295164) (_2!8878 lt!295153)))))

(declare-fun lt!295150 () BitStream!7846)

(declare-fun b!190228 () Bool)

(assert (=> b!190228 (= e!131271 (and (= lt!295140 (bvsub lt!295146 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8876 lt!295160) lt!295150)) (= (_2!8877 lt!295162) (_2!8877 lt!295158)))))))

(declare-fun b!190229 () Bool)

(assert (=> b!190229 (= e!131267 e!131276)))

(declare-fun res!158676 () Bool)

(assert (=> b!190229 (=> (not res!158676) (not e!131276))))

(declare-fun lt!295157 () (_ BitVec 64))

(declare-fun lt!295163 () (_ BitVec 64))

(assert (=> b!190229 (= res!158676 (= lt!295157 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!295163)))))

(assert (=> b!190229 (= lt!295157 (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))))))

(assert (=> b!190229 (= lt!295163 (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)))))

(declare-fun b!190230 () Bool)

(declare-fun e!131274 () Bool)

(declare-fun array_inv!4110 (array!9908) Bool)

(assert (=> b!190230 (= e!131274 (array_inv!4110 (buf!4843 thiss!1204)))))

(declare-fun b!190231 () Bool)

(declare-fun res!158678 () Bool)

(assert (=> b!190231 (=> (not res!158678) (not e!131276))))

(assert (=> b!190231 (= res!158678 (isPrefixOf!0 thiss!1204 (_2!8875 lt!295144)))))

(declare-fun b!190232 () Bool)

(declare-fun res!158688 () Bool)

(assert (=> b!190232 (=> (not res!158688) (not e!131273))))

(assert (=> b!190232 (= res!158688 (not (= i!590 nBits!348)))))

(declare-fun b!190233 () Bool)

(assert (=> b!190233 (= e!131268 e!131272)))

(declare-fun res!158680 () Bool)

(assert (=> b!190233 (=> res!158680 e!131272)))

(assert (=> b!190233 (= res!158680 (not (= lt!295161 (bvsub (bvsub (bvadd lt!295146 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!190233 (= lt!295161 (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295143))) (currentByte!9115 (_2!8875 lt!295143)) (currentBit!9110 (_2!8875 lt!295143))))))

(assert (=> b!190233 (isPrefixOf!0 thiss!1204 (_2!8875 lt!295143))))

(declare-fun lt!295151 () Unit!13537)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7846 BitStream!7846 BitStream!7846) Unit!13537)

(assert (=> b!190233 (= lt!295151 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8875 lt!295144) (_2!8875 lt!295143)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7846 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16460)

(assert (=> b!190233 (= lt!295143 (appendBitsLSBFirstLoopTR!0 (_2!8875 lt!295144) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!158673 () Bool)

(assert (=> start!41018 (=> (not res!158673) (not e!131279))))

(assert (=> start!41018 (= res!158673 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41018 e!131279))

(assert (=> start!41018 true))

(declare-fun inv!12 (BitStream!7846) Bool)

(assert (=> start!41018 (and (inv!12 thiss!1204) e!131274)))

(declare-fun b!190234 () Bool)

(declare-fun res!158691 () Bool)

(assert (=> b!190234 (=> res!158691 e!131272)))

(assert (=> b!190234 (= res!158691 (not (isPrefixOf!0 (_2!8875 lt!295144) (_2!8875 lt!295143))))))

(declare-fun b!190235 () Bool)

(assert (=> b!190235 (= e!131266 e!131278)))

(declare-fun res!158689 () Bool)

(assert (=> b!190235 (=> res!158689 e!131278)))

(assert (=> b!190235 (= res!158689 (not (= (_1!8876 lt!295160) lt!295150)))))

(assert (=> b!190235 e!131271))

(declare-fun res!158690 () Bool)

(assert (=> b!190235 (=> (not res!158690) (not e!131271))))

(declare-fun lt!295156 () tuple2!16464)

(assert (=> b!190235 (= res!158690 (and (= (_2!8877 lt!295162) (_2!8877 lt!295156)) (= (_1!8877 lt!295162) (_1!8877 lt!295156))))))

(declare-fun lt!295145 () Unit!13537)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13537)

(assert (=> b!190235 (= lt!295145 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8876 lt!295138) nBits!348 i!590 lt!295148))))

(assert (=> b!190235 (= lt!295156 (readNBitsLSBFirstsLoopPure!0 lt!295150 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295147))))

(assert (=> b!190235 (= lt!295150 (withMovedBitIndex!0 (_1!8876 lt!295138) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!190236 () Bool)

(declare-fun res!158679 () Bool)

(assert (=> b!190236 (=> (not res!158679) (not e!131271))))

(assert (=> b!190236 (= res!158679 (= (_1!8876 lt!295160) (withMovedBitIndex!0 (_2!8876 lt!295160) (bvsub lt!295146 lt!295161))))))

(declare-fun b!190237 () Bool)

(declare-fun res!158675 () Bool)

(assert (=> b!190237 (=> res!158675 e!131272)))

(assert (=> b!190237 (= res!158675 (or (not (= (size!4369 (buf!4843 (_2!8875 lt!295143))) (size!4369 (buf!4843 thiss!1204)))) (not (= lt!295161 (bvsub (bvadd lt!295140 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!190238 () Bool)

(assert (=> b!190238 (= e!131269 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!295137))) (currentByte!9115 (_1!8878 lt!295137)) (currentBit!9110 (_1!8878 lt!295137))) lt!295157))))

(assert (= (and start!41018 res!158673) b!190220))

(assert (= (and b!190220 res!158687) b!190216))

(assert (= (and b!190216 res!158677) b!190232))

(assert (= (and b!190232 res!158688) b!190224))

(assert (= (and b!190224 res!158683) b!190229))

(assert (= (and b!190229 res!158676) b!190231))

(assert (= (and b!190231 res!158678) b!190226))

(assert (= (and b!190226 res!158682) b!190238))

(assert (= (and b!190224 (not res!158672)) b!190233))

(assert (= (and b!190233 (not res!158680)) b!190217))

(assert (= (and b!190217 (not res!158686)) b!190237))

(assert (= (and b!190237 (not res!158675)) b!190234))

(assert (= (and b!190234 (not res!158691)) b!190218))

(assert (= (and b!190218 (not res!158674)) b!190225))

(assert (= (and b!190225 res!158684) b!190221))

(assert (= (and b!190225 res!158670) b!190227))

(assert (= (and b!190225 (not res!158685)) b!190235))

(assert (= (and b!190235 res!158690) b!190219))

(assert (= (and b!190219 res!158671) b!190236))

(assert (= (and b!190236 res!158679) b!190228))

(assert (= (and b!190235 (not res!158689)) b!190222))

(assert (= (and b!190222 (not res!158681)) b!190223))

(assert (= start!41018 b!190230))

(declare-fun m!295373 () Bool)

(assert (=> start!41018 m!295373))

(declare-fun m!295375 () Bool)

(assert (=> b!190229 m!295375))

(declare-fun m!295377 () Bool)

(assert (=> b!190229 m!295377))

(declare-fun m!295379 () Bool)

(assert (=> b!190235 m!295379))

(declare-fun m!295381 () Bool)

(assert (=> b!190235 m!295381))

(declare-fun m!295383 () Bool)

(assert (=> b!190235 m!295383))

(declare-fun m!295385 () Bool)

(assert (=> b!190220 m!295385))

(declare-fun m!295387 () Bool)

(assert (=> b!190234 m!295387))

(declare-fun m!295389 () Bool)

(assert (=> b!190226 m!295389))

(assert (=> b!190226 m!295389))

(declare-fun m!295391 () Bool)

(assert (=> b!190226 m!295391))

(declare-fun m!295393 () Bool)

(assert (=> b!190225 m!295393))

(declare-fun m!295395 () Bool)

(assert (=> b!190225 m!295395))

(declare-fun m!295397 () Bool)

(assert (=> b!190225 m!295397))

(declare-fun m!295399 () Bool)

(assert (=> b!190225 m!295399))

(declare-fun m!295401 () Bool)

(assert (=> b!190225 m!295401))

(declare-fun m!295403 () Bool)

(assert (=> b!190225 m!295403))

(declare-fun m!295405 () Bool)

(assert (=> b!190225 m!295405))

(declare-fun m!295407 () Bool)

(assert (=> b!190225 m!295407))

(declare-fun m!295409 () Bool)

(assert (=> b!190225 m!295409))

(declare-fun m!295411 () Bool)

(assert (=> b!190225 m!295411))

(declare-fun m!295413 () Bool)

(assert (=> b!190225 m!295413))

(declare-fun m!295415 () Bool)

(assert (=> b!190225 m!295415))

(declare-fun m!295417 () Bool)

(assert (=> b!190225 m!295417))

(declare-fun m!295419 () Bool)

(assert (=> b!190225 m!295419))

(declare-fun m!295421 () Bool)

(assert (=> b!190225 m!295421))

(declare-fun m!295423 () Bool)

(assert (=> b!190225 m!295423))

(declare-fun m!295425 () Bool)

(assert (=> b!190218 m!295425))

(declare-fun m!295427 () Bool)

(assert (=> b!190216 m!295427))

(declare-fun m!295429 () Bool)

(assert (=> b!190238 m!295429))

(declare-fun m!295431 () Bool)

(assert (=> b!190223 m!295431))

(assert (=> b!190231 m!295425))

(declare-fun m!295433 () Bool)

(assert (=> b!190236 m!295433))

(declare-fun m!295435 () Bool)

(assert (=> b!190219 m!295435))

(declare-fun m!295437 () Bool)

(assert (=> b!190233 m!295437))

(declare-fun m!295439 () Bool)

(assert (=> b!190233 m!295439))

(declare-fun m!295441 () Bool)

(assert (=> b!190233 m!295441))

(declare-fun m!295443 () Bool)

(assert (=> b!190233 m!295443))

(declare-fun m!295445 () Bool)

(assert (=> b!190222 m!295445))

(declare-fun m!295447 () Bool)

(assert (=> b!190222 m!295447))

(declare-fun m!295449 () Bool)

(assert (=> b!190230 m!295449))

(declare-fun m!295451 () Bool)

(assert (=> b!190221 m!295451))

(declare-fun m!295453 () Bool)

(assert (=> b!190217 m!295453))

(assert (=> b!190224 m!295375))

(assert (=> b!190224 m!295377))

(declare-fun m!295455 () Bool)

(assert (=> b!190224 m!295455))

(push 1)

(assert (not b!190216))

(assert (not b!190233))

(assert (not b!190230))

(assert (not b!190218))

(assert (not b!190226))

(assert (not b!190225))

(assert (not b!190229))

(assert (not b!190223))

(assert (not b!190234))

(assert (not b!190236))

(assert (not b!190220))

(assert (not b!190235))

(assert (not b!190238))

(assert (not b!190231))

(assert (not start!41018))

(assert (not b!190219))

(assert (not b!190217))

(assert (not b!190221))

(assert (not b!190222))

(assert (not b!190224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65235 () Bool)

(declare-fun res!158898 () Bool)

(declare-fun e!131412 () Bool)

(assert (=> d!65235 (=> (not res!158898) (not e!131412))))

(assert (=> d!65235 (= res!158898 (= (size!4369 (buf!4843 thiss!1204)) (size!4369 (buf!4843 (_2!8875 lt!295144)))))))

(assert (=> d!65235 (= (isPrefixOf!0 thiss!1204 (_2!8875 lt!295144)) e!131412)))

(declare-fun b!190458 () Bool)

(declare-fun res!158897 () Bool)

(assert (=> b!190458 (=> (not res!158897) (not e!131412))))

(assert (=> b!190458 (= res!158897 (bvsle (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)) (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144)))))))

(declare-fun b!190459 () Bool)

(declare-fun e!131411 () Bool)

(assert (=> b!190459 (= e!131412 e!131411)))

(declare-fun res!158899 () Bool)

(assert (=> b!190459 (=> res!158899 e!131411)))

(assert (=> b!190459 (= res!158899 (= (size!4369 (buf!4843 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!190460 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9908 array!9908 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190460 (= e!131411 (arrayBitRangesEq!0 (buf!4843 thiss!1204) (buf!4843 (_2!8875 lt!295144)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204))))))

(assert (= (and d!65235 res!158898) b!190458))

(assert (= (and b!190458 res!158897) b!190459))

(assert (= (and b!190459 (not res!158899)) b!190460))

(assert (=> b!190458 m!295377))

(assert (=> b!190458 m!295375))

(assert (=> b!190460 m!295377))

(assert (=> b!190460 m!295377))

(declare-fun m!295783 () Bool)

(assert (=> b!190460 m!295783))

(assert (=> b!190218 d!65235))

(declare-fun d!65237 () Bool)

(declare-fun e!131415 () Bool)

(assert (=> d!65237 e!131415))

(declare-fun res!158904 () Bool)

(assert (=> d!65237 (=> (not res!158904) (not e!131415))))

(declare-fun lt!295552 () (_ BitVec 64))

(declare-fun lt!295551 () (_ BitVec 64))

(declare-fun lt!295553 () (_ BitVec 64))

(assert (=> d!65237 (= res!158904 (= lt!295551 (bvsub lt!295552 lt!295553)))))

(assert (=> d!65237 (or (= (bvand lt!295552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295552 lt!295553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65237 (= lt!295553 (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295144)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144)))))))

(declare-fun lt!295555 () (_ BitVec 64))

(declare-fun lt!295550 () (_ BitVec 64))

(assert (=> d!65237 (= lt!295552 (bvmul lt!295555 lt!295550))))

(assert (=> d!65237 (or (= lt!295555 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295550 (bvsdiv (bvmul lt!295555 lt!295550) lt!295555)))))

(assert (=> d!65237 (= lt!295550 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65237 (= lt!295555 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295144)))))))

(assert (=> d!65237 (= lt!295551 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144)))))))

(assert (=> d!65237 (invariant!0 (currentBit!9110 (_2!8875 lt!295144)) (currentByte!9115 (_2!8875 lt!295144)) (size!4369 (buf!4843 (_2!8875 lt!295144))))))

(assert (=> d!65237 (= (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))) lt!295551)))

(declare-fun b!190465 () Bool)

(declare-fun res!158905 () Bool)

(assert (=> b!190465 (=> (not res!158905) (not e!131415))))

(assert (=> b!190465 (= res!158905 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295551))))

(declare-fun b!190466 () Bool)

(declare-fun lt!295554 () (_ BitVec 64))

(assert (=> b!190466 (= e!131415 (bvsle lt!295551 (bvmul lt!295554 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190466 (or (= lt!295554 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295554 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295554)))))

(assert (=> b!190466 (= lt!295554 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295144)))))))

(assert (= (and d!65237 res!158904) b!190465))

(assert (= (and b!190465 res!158905) b!190466))

(declare-fun m!295785 () Bool)

(assert (=> d!65237 m!295785))

(declare-fun m!295787 () Bool)

(assert (=> d!65237 m!295787))

(assert (=> b!190229 d!65237))

(declare-fun d!65239 () Bool)

(declare-fun e!131416 () Bool)

(assert (=> d!65239 e!131416))

(declare-fun res!158906 () Bool)

(assert (=> d!65239 (=> (not res!158906) (not e!131416))))

(declare-fun lt!295557 () (_ BitVec 64))

(declare-fun lt!295558 () (_ BitVec 64))

(declare-fun lt!295559 () (_ BitVec 64))

(assert (=> d!65239 (= res!158906 (= lt!295557 (bvsub lt!295558 lt!295559)))))

(assert (=> d!65239 (or (= (bvand lt!295558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295559 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295558 lt!295559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65239 (= lt!295559 (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 thiss!1204))) ((_ sign_extend 32) (currentByte!9115 thiss!1204)) ((_ sign_extend 32) (currentBit!9110 thiss!1204))))))

(declare-fun lt!295561 () (_ BitVec 64))

(declare-fun lt!295556 () (_ BitVec 64))

(assert (=> d!65239 (= lt!295558 (bvmul lt!295561 lt!295556))))

(assert (=> d!65239 (or (= lt!295561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295556 (bvsdiv (bvmul lt!295561 lt!295556) lt!295561)))))

(assert (=> d!65239 (= lt!295556 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65239 (= lt!295561 ((_ sign_extend 32) (size!4369 (buf!4843 thiss!1204))))))

(assert (=> d!65239 (= lt!295557 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9115 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9110 thiss!1204))))))

(assert (=> d!65239 (invariant!0 (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204) (size!4369 (buf!4843 thiss!1204)))))

(assert (=> d!65239 (= (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)) lt!295557)))

(declare-fun b!190467 () Bool)

(declare-fun res!158907 () Bool)

(assert (=> b!190467 (=> (not res!158907) (not e!131416))))

(assert (=> b!190467 (= res!158907 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295557))))

(declare-fun b!190468 () Bool)

(declare-fun lt!295560 () (_ BitVec 64))

(assert (=> b!190468 (= e!131416 (bvsle lt!295557 (bvmul lt!295560 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190468 (or (= lt!295560 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295560 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295560)))))

(assert (=> b!190468 (= lt!295560 ((_ sign_extend 32) (size!4369 (buf!4843 thiss!1204))))))

(assert (= (and d!65239 res!158906) b!190467))

(assert (= (and b!190467 res!158907) b!190468))

(declare-fun m!295789 () Bool)

(assert (=> d!65239 m!295789))

(assert (=> d!65239 m!295427))

(assert (=> b!190229 d!65239))

(declare-fun d!65241 () Bool)

(declare-fun e!131417 () Bool)

(assert (=> d!65241 e!131417))

(declare-fun res!158908 () Bool)

(assert (=> d!65241 (=> (not res!158908) (not e!131417))))

(declare-fun lt!295565 () (_ BitVec 64))

(declare-fun lt!295563 () (_ BitVec 64))

(declare-fun lt!295564 () (_ BitVec 64))

(assert (=> d!65241 (= res!158908 (= lt!295563 (bvsub lt!295564 lt!295565)))))

(assert (=> d!65241 (or (= (bvand lt!295564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295565 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295564 lt!295565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65241 (= lt!295565 (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8878 lt!295137)))) ((_ sign_extend 32) (currentByte!9115 (_1!8878 lt!295137))) ((_ sign_extend 32) (currentBit!9110 (_1!8878 lt!295137)))))))

(declare-fun lt!295567 () (_ BitVec 64))

(declare-fun lt!295562 () (_ BitVec 64))

(assert (=> d!65241 (= lt!295564 (bvmul lt!295567 lt!295562))))

(assert (=> d!65241 (or (= lt!295567 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295562 (bvsdiv (bvmul lt!295567 lt!295562) lt!295567)))))

(assert (=> d!65241 (= lt!295562 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65241 (= lt!295567 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8878 lt!295137)))))))

(assert (=> d!65241 (= lt!295563 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9115 (_1!8878 lt!295137))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9110 (_1!8878 lt!295137)))))))

(assert (=> d!65241 (invariant!0 (currentBit!9110 (_1!8878 lt!295137)) (currentByte!9115 (_1!8878 lt!295137)) (size!4369 (buf!4843 (_1!8878 lt!295137))))))

(assert (=> d!65241 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!295137))) (currentByte!9115 (_1!8878 lt!295137)) (currentBit!9110 (_1!8878 lt!295137))) lt!295563)))

(declare-fun b!190469 () Bool)

(declare-fun res!158909 () Bool)

(assert (=> b!190469 (=> (not res!158909) (not e!131417))))

(assert (=> b!190469 (= res!158909 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295563))))

(declare-fun b!190470 () Bool)

(declare-fun lt!295566 () (_ BitVec 64))

(assert (=> b!190470 (= e!131417 (bvsle lt!295563 (bvmul lt!295566 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190470 (or (= lt!295566 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295566 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295566)))))

(assert (=> b!190470 (= lt!295566 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8878 lt!295137)))))))

(assert (= (and d!65241 res!158908) b!190469))

(assert (= (and b!190469 res!158909) b!190470))

(declare-fun m!295791 () Bool)

(assert (=> d!65241 m!295791))

(declare-fun m!295793 () Bool)

(assert (=> d!65241 m!295793))

(assert (=> b!190238 d!65241))

(declare-fun d!65243 () Bool)

(assert (=> d!65243 (= (invariant!0 (currentBit!9110 (_2!8875 lt!295143)) (currentByte!9115 (_2!8875 lt!295143)) (size!4369 (buf!4843 (_2!8875 lt!295143)))) (and (bvsge (currentBit!9110 (_2!8875 lt!295143)) #b00000000000000000000000000000000) (bvslt (currentBit!9110 (_2!8875 lt!295143)) #b00000000000000000000000000001000) (bvsge (currentByte!9115 (_2!8875 lt!295143)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9115 (_2!8875 lt!295143)) (size!4369 (buf!4843 (_2!8875 lt!295143)))) (and (= (currentBit!9110 (_2!8875 lt!295143)) #b00000000000000000000000000000000) (= (currentByte!9115 (_2!8875 lt!295143)) (size!4369 (buf!4843 (_2!8875 lt!295143))))))))))

(assert (=> b!190217 d!65243))

(declare-fun d!65245 () Bool)

(declare-datatypes ((tuple2!16488 0))(
  ( (tuple2!16489 (_1!8889 Bool) (_2!8889 BitStream!7846)) )
))
(declare-fun lt!295570 () tuple2!16488)

(declare-fun readBit!0 (BitStream!7846) tuple2!16488)

(assert (=> d!65245 (= lt!295570 (readBit!0 (readerFrom!0 (_2!8875 lt!295144) (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204))))))

(assert (=> d!65245 (= (readBitPure!0 (readerFrom!0 (_2!8875 lt!295144) (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204))) (tuple2!16467 (_2!8889 lt!295570) (_1!8889 lt!295570)))))

(declare-fun bs!16223 () Bool)

(assert (= bs!16223 d!65245))

(assert (=> bs!16223 m!295389))

(declare-fun m!295795 () Bool)

(assert (=> bs!16223 m!295795))

(assert (=> b!190226 d!65245))

(declare-fun d!65247 () Bool)

(declare-fun e!131420 () Bool)

(assert (=> d!65247 e!131420))

(declare-fun res!158913 () Bool)

(assert (=> d!65247 (=> (not res!158913) (not e!131420))))

(assert (=> d!65247 (= res!158913 (invariant!0 (currentBit!9110 (_2!8875 lt!295144)) (currentByte!9115 (_2!8875 lt!295144)) (size!4369 (buf!4843 (_2!8875 lt!295144)))))))

(assert (=> d!65247 (= (readerFrom!0 (_2!8875 lt!295144) (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204)) (BitStream!7847 (buf!4843 (_2!8875 lt!295144)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)))))

(declare-fun b!190473 () Bool)

(assert (=> b!190473 (= e!131420 (invariant!0 (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204) (size!4369 (buf!4843 (_2!8875 lt!295144)))))))

(assert (= (and d!65247 res!158913) b!190473))

(assert (=> d!65247 m!295787))

(assert (=> b!190473 m!295423))

(assert (=> b!190226 d!65247))

(declare-fun d!65249 () Bool)

(assert (=> d!65249 (= (invariant!0 (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204) (size!4369 (buf!4843 thiss!1204))) (and (bvsge (currentBit!9110 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9110 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9115 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9115 thiss!1204) (size!4369 (buf!4843 thiss!1204))) (and (= (currentBit!9110 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9115 thiss!1204) (size!4369 (buf!4843 thiss!1204)))))))))

(assert (=> b!190216 d!65249))

(declare-fun d!65251 () Bool)

(declare-fun lt!295588 () tuple2!16464)

(declare-fun lt!295587 () tuple2!16464)

(assert (=> d!65251 (and (= (_2!8877 lt!295588) (_2!8877 lt!295587)) (= (_1!8877 lt!295588) (_1!8877 lt!295587)))))

(declare-fun lt!295583 () BitStream!7846)

(declare-fun lt!295585 () Bool)

(declare-fun lt!295586 () Unit!13537)

(declare-fun lt!295584 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16464 tuple2!16464 BitStream!7846 (_ BitVec 64) Bool BitStream!7846 (_ BitVec 64) tuple2!16464 tuple2!16464 BitStream!7846 (_ BitVec 64)) Unit!13537)

(assert (=> d!65251 (= lt!295586 (choose!56 (_1!8876 lt!295138) nBits!348 i!590 lt!295148 lt!295588 (tuple2!16465 (_1!8877 lt!295588) (_2!8877 lt!295588)) (_1!8877 lt!295588) (_2!8877 lt!295588) lt!295585 lt!295583 lt!295584 lt!295587 (tuple2!16465 (_1!8877 lt!295587) (_2!8877 lt!295587)) (_1!8877 lt!295587) (_2!8877 lt!295587)))))

(assert (=> d!65251 (= lt!295587 (readNBitsLSBFirstsLoopPure!0 lt!295583 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!295584))))

(assert (=> d!65251 (= lt!295584 (bvor lt!295148 (ite lt!295585 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65251 (= lt!295583 (withMovedBitIndex!0 (_1!8876 lt!295138) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65251 (= lt!295585 (_2!8878 (readBitPure!0 (_1!8876 lt!295138))))))

(assert (=> d!65251 (= lt!295588 (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!295138) nBits!348 i!590 lt!295148))))

(assert (=> d!65251 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8876 lt!295138) nBits!348 i!590 lt!295148) lt!295586)))

(declare-fun bs!16225 () Bool)

(assert (= bs!16225 d!65251))

(declare-fun m!295797 () Bool)

(assert (=> bs!16225 m!295797))

(assert (=> bs!16225 m!295401))

(assert (=> bs!16225 m!295399))

(declare-fun m!295799 () Bool)

(assert (=> bs!16225 m!295799))

(assert (=> bs!16225 m!295383))

(assert (=> b!190235 d!65251))

(declare-datatypes ((tuple2!16490 0))(
  ( (tuple2!16491 (_1!8890 (_ BitVec 64)) (_2!8890 BitStream!7846)) )
))
(declare-fun lt!295591 () tuple2!16490)

(declare-fun d!65253 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16490)

(assert (=> d!65253 (= lt!295591 (readNBitsLSBFirstsLoop!0 lt!295150 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295147))))

(assert (=> d!65253 (= (readNBitsLSBFirstsLoopPure!0 lt!295150 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295147) (tuple2!16465 (_2!8890 lt!295591) (_1!8890 lt!295591)))))

(declare-fun bs!16226 () Bool)

(assert (= bs!16226 d!65253))

(declare-fun m!295801 () Bool)

(assert (=> bs!16226 m!295801))

(assert (=> b!190235 d!65253))

(declare-fun d!65255 () Bool)

(declare-fun e!131423 () Bool)

(assert (=> d!65255 e!131423))

(declare-fun res!158916 () Bool)

(assert (=> d!65255 (=> (not res!158916) (not e!131423))))

(declare-fun lt!295597 () (_ BitVec 64))

(declare-fun lt!295596 () BitStream!7846)

(assert (=> d!65255 (= res!158916 (= (bvadd lt!295597 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4369 (buf!4843 lt!295596)) (currentByte!9115 lt!295596) (currentBit!9110 lt!295596))))))

(assert (=> d!65255 (or (not (= (bvand lt!295597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295597 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65255 (= lt!295597 (bitIndex!0 (size!4369 (buf!4843 (_1!8876 lt!295138))) (currentByte!9115 (_1!8876 lt!295138)) (currentBit!9110 (_1!8876 lt!295138))))))

(declare-fun moveBitIndex!0 (BitStream!7846 (_ BitVec 64)) tuple2!16460)

(assert (=> d!65255 (= lt!295596 (_2!8875 (moveBitIndex!0 (_1!8876 lt!295138) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7846 (_ BitVec 64)) Bool)

(assert (=> d!65255 (moveBitIndexPrecond!0 (_1!8876 lt!295138) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65255 (= (withMovedBitIndex!0 (_1!8876 lt!295138) #b0000000000000000000000000000000000000000000000000000000000000001) lt!295596)))

(declare-fun b!190476 () Bool)

(assert (=> b!190476 (= e!131423 (= (size!4369 (buf!4843 (_1!8876 lt!295138))) (size!4369 (buf!4843 lt!295596))))))

(assert (= (and d!65255 res!158916) b!190476))

(declare-fun m!295803 () Bool)

(assert (=> d!65255 m!295803))

(declare-fun m!295805 () Bool)

(assert (=> d!65255 m!295805))

(declare-fun m!295807 () Bool)

(assert (=> d!65255 m!295807))

(declare-fun m!295809 () Bool)

(assert (=> d!65255 m!295809))

(assert (=> b!190235 d!65255))

(declare-fun d!65257 () Bool)

(declare-fun e!131424 () Bool)

(assert (=> d!65257 e!131424))

(declare-fun res!158917 () Bool)

(assert (=> d!65257 (=> (not res!158917) (not e!131424))))

(declare-fun lt!295598 () BitStream!7846)

(declare-fun lt!295599 () (_ BitVec 64))

(assert (=> d!65257 (= res!158917 (= (bvadd lt!295599 (bvsub lt!295146 lt!295161)) (bitIndex!0 (size!4369 (buf!4843 lt!295598)) (currentByte!9115 lt!295598) (currentBit!9110 lt!295598))))))

(assert (=> d!65257 (or (not (= (bvand lt!295599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295146 lt!295161) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295599 (bvsub lt!295146 lt!295161)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65257 (= lt!295599 (bitIndex!0 (size!4369 (buf!4843 (_2!8876 lt!295160))) (currentByte!9115 (_2!8876 lt!295160)) (currentBit!9110 (_2!8876 lt!295160))))))

(assert (=> d!65257 (= lt!295598 (_2!8875 (moveBitIndex!0 (_2!8876 lt!295160) (bvsub lt!295146 lt!295161))))))

(assert (=> d!65257 (moveBitIndexPrecond!0 (_2!8876 lt!295160) (bvsub lt!295146 lt!295161))))

(assert (=> d!65257 (= (withMovedBitIndex!0 (_2!8876 lt!295160) (bvsub lt!295146 lt!295161)) lt!295598)))

(declare-fun b!190477 () Bool)

(assert (=> b!190477 (= e!131424 (= (size!4369 (buf!4843 (_2!8876 lt!295160))) (size!4369 (buf!4843 lt!295598))))))

(assert (= (and d!65257 res!158917) b!190477))

(declare-fun m!295811 () Bool)

(assert (=> d!65257 m!295811))

(declare-fun m!295813 () Bool)

(assert (=> d!65257 m!295813))

(declare-fun m!295815 () Bool)

(assert (=> d!65257 m!295815))

(declare-fun m!295817 () Bool)

(assert (=> d!65257 m!295817))

(assert (=> b!190236 d!65257))

(declare-fun d!65259 () Bool)

(assert (=> d!65259 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!190225 d!65259))

(declare-fun d!65261 () Bool)

(declare-fun lt!295600 () tuple2!16488)

(assert (=> d!65261 (= lt!295600 (readBit!0 (_1!8876 lt!295138)))))

(assert (=> d!65261 (= (readBitPure!0 (_1!8876 lt!295138)) (tuple2!16467 (_2!8889 lt!295600) (_1!8889 lt!295600)))))

(declare-fun bs!16227 () Bool)

(assert (= bs!16227 d!65261))

(declare-fun m!295819 () Bool)

(assert (=> bs!16227 m!295819))

(assert (=> b!190225 d!65261))

(declare-fun d!65263 () Bool)

(assert (=> d!65263 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144))) lt!295139)))

(declare-fun lt!295603 () Unit!13537)

(declare-fun choose!9 (BitStream!7846 array!9908 (_ BitVec 64) BitStream!7846) Unit!13537)

(assert (=> d!65263 (= lt!295603 (choose!9 (_2!8875 lt!295144) (buf!4843 (_2!8875 lt!295143)) lt!295139 (BitStream!7847 (buf!4843 (_2!8875 lt!295143)) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144)))))))

(assert (=> d!65263 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8875 lt!295144) (buf!4843 (_2!8875 lt!295143)) lt!295139) lt!295603)))

(declare-fun bs!16228 () Bool)

(assert (= bs!16228 d!65263))

(assert (=> bs!16228 m!295397))

(declare-fun m!295821 () Bool)

(assert (=> bs!16228 m!295821))

(assert (=> b!190225 d!65263))

(declare-fun d!65265 () Bool)

(declare-fun e!131427 () Bool)

(assert (=> d!65265 e!131427))

(declare-fun res!158920 () Bool)

(assert (=> d!65265 (=> (not res!158920) (not e!131427))))

(declare-fun lt!295614 () tuple2!16466)

(declare-fun lt!295613 () tuple2!16466)

(assert (=> d!65265 (= res!158920 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!295614))) (currentByte!9115 (_1!8878 lt!295614)) (currentBit!9110 (_1!8878 lt!295614))) (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!295613))) (currentByte!9115 (_1!8878 lt!295613)) (currentBit!9110 (_1!8878 lt!295613)))))))

(declare-fun lt!295615 () Unit!13537)

(declare-fun lt!295612 () BitStream!7846)

(declare-fun choose!50 (BitStream!7846 BitStream!7846 BitStream!7846 tuple2!16466 tuple2!16466 BitStream!7846 Bool tuple2!16466 tuple2!16466 BitStream!7846 Bool) Unit!13537)

(assert (=> d!65265 (= lt!295615 (choose!50 lt!295165 (_2!8875 lt!295143) lt!295612 lt!295614 (tuple2!16467 (_1!8878 lt!295614) (_2!8878 lt!295614)) (_1!8878 lt!295614) (_2!8878 lt!295614) lt!295613 (tuple2!16467 (_1!8878 lt!295613) (_2!8878 lt!295613)) (_1!8878 lt!295613) (_2!8878 lt!295613)))))

(assert (=> d!65265 (= lt!295613 (readBitPure!0 lt!295612))))

(assert (=> d!65265 (= lt!295614 (readBitPure!0 lt!295165))))

(assert (=> d!65265 (= lt!295612 (BitStream!7847 (buf!4843 (_2!8875 lt!295143)) (currentByte!9115 lt!295165) (currentBit!9110 lt!295165)))))

(assert (=> d!65265 (invariant!0 (currentBit!9110 lt!295165) (currentByte!9115 lt!295165) (size!4369 (buf!4843 (_2!8875 lt!295143))))))

(assert (=> d!65265 (= (readBitPrefixLemma!0 lt!295165 (_2!8875 lt!295143)) lt!295615)))

(declare-fun b!190480 () Bool)

(assert (=> b!190480 (= e!131427 (= (_2!8878 lt!295614) (_2!8878 lt!295613)))))

(assert (= (and d!65265 res!158920) b!190480))

(declare-fun m!295823 () Bool)

(assert (=> d!65265 m!295823))

(declare-fun m!295825 () Bool)

(assert (=> d!65265 m!295825))

(declare-fun m!295827 () Bool)

(assert (=> d!65265 m!295827))

(assert (=> d!65265 m!295393))

(declare-fun m!295829 () Bool)

(assert (=> d!65265 m!295829))

(declare-fun m!295831 () Bool)

(assert (=> d!65265 m!295831))

(assert (=> b!190225 d!65265))

(declare-fun d!65267 () Bool)

(declare-fun lt!295616 () tuple2!16490)

(assert (=> d!65267 (= lt!295616 (readNBitsLSBFirstsLoop!0 (_1!8876 lt!295160) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295147))))

(assert (=> d!65267 (= (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!295160) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295147) (tuple2!16465 (_2!8890 lt!295616) (_1!8890 lt!295616)))))

(declare-fun bs!16229 () Bool)

(assert (= bs!16229 d!65267))

(declare-fun m!295833 () Bool)

(assert (=> bs!16229 m!295833))

(assert (=> b!190225 d!65267))

(declare-fun d!65269 () Bool)

(assert (=> d!65269 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))) ((_ sign_extend 32) (currentByte!9115 thiss!1204)) ((_ sign_extend 32) (currentBit!9110 thiss!1204)) lt!295159) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))) ((_ sign_extend 32) (currentByte!9115 thiss!1204)) ((_ sign_extend 32) (currentBit!9110 thiss!1204))) lt!295159))))

(declare-fun bs!16230 () Bool)

(assert (= bs!16230 d!65269))

(declare-fun m!295835 () Bool)

(assert (=> bs!16230 m!295835))

(assert (=> b!190225 d!65269))

(declare-fun d!65273 () Bool)

(declare-fun e!131438 () Bool)

(assert (=> d!65273 e!131438))

(declare-fun res!158938 () Bool)

(assert (=> d!65273 (=> (not res!158938) (not e!131438))))

(declare-fun lt!295682 () tuple2!16462)

(assert (=> d!65273 (= res!158938 (isPrefixOf!0 (_1!8876 lt!295682) (_2!8876 lt!295682)))))

(declare-fun lt!295694 () BitStream!7846)

(assert (=> d!65273 (= lt!295682 (tuple2!16463 lt!295694 (_2!8875 lt!295143)))))

(declare-fun lt!295690 () Unit!13537)

(declare-fun lt!295691 () Unit!13537)

(assert (=> d!65273 (= lt!295690 lt!295691)))

(assert (=> d!65273 (isPrefixOf!0 lt!295694 (_2!8875 lt!295143))))

(assert (=> d!65273 (= lt!295691 (lemmaIsPrefixTransitive!0 lt!295694 (_2!8875 lt!295143) (_2!8875 lt!295143)))))

(declare-fun lt!295699 () Unit!13537)

(declare-fun lt!295685 () Unit!13537)

(assert (=> d!65273 (= lt!295699 lt!295685)))

(assert (=> d!65273 (isPrefixOf!0 lt!295694 (_2!8875 lt!295143))))

(assert (=> d!65273 (= lt!295685 (lemmaIsPrefixTransitive!0 lt!295694 (_2!8875 lt!295144) (_2!8875 lt!295143)))))

(declare-fun lt!295686 () Unit!13537)

(declare-fun e!131439 () Unit!13537)

(assert (=> d!65273 (= lt!295686 e!131439)))

(declare-fun c!9626 () Bool)

(assert (=> d!65273 (= c!9626 (not (= (size!4369 (buf!4843 (_2!8875 lt!295144))) #b00000000000000000000000000000000)))))

(declare-fun lt!295696 () Unit!13537)

(declare-fun lt!295688 () Unit!13537)

(assert (=> d!65273 (= lt!295696 lt!295688)))

(assert (=> d!65273 (isPrefixOf!0 (_2!8875 lt!295143) (_2!8875 lt!295143))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7846) Unit!13537)

(assert (=> d!65273 (= lt!295688 (lemmaIsPrefixRefl!0 (_2!8875 lt!295143)))))

(declare-fun lt!295695 () Unit!13537)

(declare-fun lt!295698 () Unit!13537)

(assert (=> d!65273 (= lt!295695 lt!295698)))

(assert (=> d!65273 (= lt!295698 (lemmaIsPrefixRefl!0 (_2!8875 lt!295143)))))

(declare-fun lt!295700 () Unit!13537)

(declare-fun lt!295681 () Unit!13537)

(assert (=> d!65273 (= lt!295700 lt!295681)))

(assert (=> d!65273 (isPrefixOf!0 lt!295694 lt!295694)))

(assert (=> d!65273 (= lt!295681 (lemmaIsPrefixRefl!0 lt!295694))))

(declare-fun lt!295692 () Unit!13537)

(declare-fun lt!295683 () Unit!13537)

(assert (=> d!65273 (= lt!295692 lt!295683)))

(assert (=> d!65273 (isPrefixOf!0 (_2!8875 lt!295144) (_2!8875 lt!295144))))

(assert (=> d!65273 (= lt!295683 (lemmaIsPrefixRefl!0 (_2!8875 lt!295144)))))

(assert (=> d!65273 (= lt!295694 (BitStream!7847 (buf!4843 (_2!8875 lt!295143)) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))))))

(assert (=> d!65273 (isPrefixOf!0 (_2!8875 lt!295144) (_2!8875 lt!295143))))

(assert (=> d!65273 (= (reader!0 (_2!8875 lt!295144) (_2!8875 lt!295143)) lt!295682)))

(declare-fun b!190500 () Bool)

(declare-fun lt!295687 () Unit!13537)

(assert (=> b!190500 (= e!131439 lt!295687)))

(declare-fun lt!295689 () (_ BitVec 64))

(assert (=> b!190500 (= lt!295689 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!295697 () (_ BitVec 64))

(assert (=> b!190500 (= lt!295697 (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9908 array!9908 (_ BitVec 64) (_ BitVec 64)) Unit!13537)

(assert (=> b!190500 (= lt!295687 (arrayBitRangesEqSymmetric!0 (buf!4843 (_2!8875 lt!295144)) (buf!4843 (_2!8875 lt!295143)) lt!295689 lt!295697))))

(assert (=> b!190500 (arrayBitRangesEq!0 (buf!4843 (_2!8875 lt!295143)) (buf!4843 (_2!8875 lt!295144)) lt!295689 lt!295697)))

(declare-fun b!190501 () Bool)

(declare-fun Unit!13556 () Unit!13537)

(assert (=> b!190501 (= e!131439 Unit!13556)))

(declare-fun b!190502 () Bool)

(declare-fun res!158936 () Bool)

(assert (=> b!190502 (=> (not res!158936) (not e!131438))))

(assert (=> b!190502 (= res!158936 (isPrefixOf!0 (_2!8876 lt!295682) (_2!8875 lt!295143)))))

(declare-fun b!190503 () Bool)

(declare-fun res!158937 () Bool)

(assert (=> b!190503 (=> (not res!158937) (not e!131438))))

(assert (=> b!190503 (= res!158937 (isPrefixOf!0 (_1!8876 lt!295682) (_2!8875 lt!295144)))))

(declare-fun lt!295684 () (_ BitVec 64))

(declare-fun lt!295693 () (_ BitVec 64))

(declare-fun b!190504 () Bool)

(assert (=> b!190504 (= e!131438 (= (_1!8876 lt!295682) (withMovedBitIndex!0 (_2!8876 lt!295682) (bvsub lt!295693 lt!295684))))))

(assert (=> b!190504 (or (= (bvand lt!295693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295693 lt!295684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190504 (= lt!295684 (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295143))) (currentByte!9115 (_2!8875 lt!295143)) (currentBit!9110 (_2!8875 lt!295143))))))

(assert (=> b!190504 (= lt!295693 (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))))))

(assert (= (and d!65273 c!9626) b!190500))

(assert (= (and d!65273 (not c!9626)) b!190501))

(assert (= (and d!65273 res!158938) b!190503))

(assert (= (and b!190503 res!158937) b!190502))

(assert (= (and b!190502 res!158936) b!190504))

(declare-fun m!295851 () Bool)

(assert (=> b!190503 m!295851))

(declare-fun m!295853 () Bool)

(assert (=> b!190504 m!295853))

(assert (=> b!190504 m!295437))

(assert (=> b!190504 m!295375))

(declare-fun m!295855 () Bool)

(assert (=> b!190502 m!295855))

(declare-fun m!295857 () Bool)

(assert (=> d!65273 m!295857))

(declare-fun m!295859 () Bool)

(assert (=> d!65273 m!295859))

(declare-fun m!295861 () Bool)

(assert (=> d!65273 m!295861))

(declare-fun m!295863 () Bool)

(assert (=> d!65273 m!295863))

(declare-fun m!295865 () Bool)

(assert (=> d!65273 m!295865))

(declare-fun m!295867 () Bool)

(assert (=> d!65273 m!295867))

(declare-fun m!295869 () Bool)

(assert (=> d!65273 m!295869))

(declare-fun m!295871 () Bool)

(assert (=> d!65273 m!295871))

(declare-fun m!295873 () Bool)

(assert (=> d!65273 m!295873))

(assert (=> d!65273 m!295387))

(declare-fun m!295875 () Bool)

(assert (=> d!65273 m!295875))

(assert (=> b!190500 m!295375))

(declare-fun m!295877 () Bool)

(assert (=> b!190500 m!295877))

(declare-fun m!295879 () Bool)

(assert (=> b!190500 m!295879))

(assert (=> b!190225 d!65273))

(declare-fun d!65285 () Bool)

(assert (=> d!65285 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))) ((_ sign_extend 32) (currentByte!9115 thiss!1204)) ((_ sign_extend 32) (currentBit!9110 thiss!1204)) lt!295159)))

(declare-fun lt!295713 () Unit!13537)

(assert (=> d!65285 (= lt!295713 (choose!9 thiss!1204 (buf!4843 (_2!8875 lt!295143)) lt!295159 (BitStream!7847 (buf!4843 (_2!8875 lt!295143)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204))))))

(assert (=> d!65285 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4843 (_2!8875 lt!295143)) lt!295159) lt!295713)))

(declare-fun bs!16232 () Bool)

(assert (= bs!16232 d!65285))

(assert (=> bs!16232 m!295409))

(declare-fun m!295883 () Bool)

(assert (=> bs!16232 m!295883))

(assert (=> b!190225 d!65285))

(declare-fun d!65289 () Bool)

(assert (=> d!65289 (= (invariant!0 (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204) (size!4369 (buf!4843 (_2!8875 lt!295144)))) (and (bvsge (currentBit!9110 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9110 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9115 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9115 thiss!1204) (size!4369 (buf!4843 (_2!8875 lt!295144)))) (and (= (currentBit!9110 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9115 thiss!1204) (size!4369 (buf!4843 (_2!8875 lt!295144))))))))))

(assert (=> b!190225 d!65289))

(declare-fun d!65291 () Bool)

(declare-fun lt!295714 () tuple2!16488)

(assert (=> d!65291 (= lt!295714 (readBit!0 (BitStream!7847 (buf!4843 (_2!8875 lt!295143)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204))))))

(assert (=> d!65291 (= (readBitPure!0 (BitStream!7847 (buf!4843 (_2!8875 lt!295143)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204))) (tuple2!16467 (_2!8889 lt!295714) (_1!8889 lt!295714)))))

(declare-fun bs!16233 () Bool)

(assert (= bs!16233 d!65291))

(declare-fun m!295885 () Bool)

(assert (=> bs!16233 m!295885))

(assert (=> b!190225 d!65291))

(declare-fun d!65293 () Bool)

(assert (=> d!65293 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144))) lt!295139) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144)))) lt!295139))))

(declare-fun bs!16234 () Bool)

(assert (= bs!16234 d!65293))

(declare-fun m!295887 () Bool)

(assert (=> bs!16234 m!295887))

(assert (=> b!190225 d!65293))

(declare-fun d!65295 () Bool)

(declare-fun lt!295715 () tuple2!16488)

(assert (=> d!65295 (= lt!295715 (readBit!0 lt!295165))))

(assert (=> d!65295 (= (readBitPure!0 lt!295165) (tuple2!16467 (_2!8889 lt!295715) (_1!8889 lt!295715)))))

(declare-fun bs!16235 () Bool)

(assert (= bs!16235 d!65295))

(declare-fun m!295889 () Bool)

(assert (=> bs!16235 m!295889))

(assert (=> b!190225 d!65295))

(declare-fun d!65297 () Bool)

(declare-fun e!131442 () Bool)

(assert (=> d!65297 e!131442))

(declare-fun res!158943 () Bool)

(assert (=> d!65297 (=> (not res!158943) (not e!131442))))

(declare-fun lt!295719 () (_ BitVec 64))

(declare-fun lt!295717 () (_ BitVec 64))

(declare-fun lt!295718 () (_ BitVec 64))

(assert (=> d!65297 (= res!158943 (= lt!295717 (bvsub lt!295718 lt!295719)))))

(assert (=> d!65297 (or (= (bvand lt!295718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295719 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295718 lt!295719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65297 (= lt!295719 (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8878 lt!295153)))) ((_ sign_extend 32) (currentByte!9115 (_1!8878 lt!295153))) ((_ sign_extend 32) (currentBit!9110 (_1!8878 lt!295153)))))))

(declare-fun lt!295721 () (_ BitVec 64))

(declare-fun lt!295716 () (_ BitVec 64))

(assert (=> d!65297 (= lt!295718 (bvmul lt!295721 lt!295716))))

(assert (=> d!65297 (or (= lt!295721 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295716 (bvsdiv (bvmul lt!295721 lt!295716) lt!295721)))))

(assert (=> d!65297 (= lt!295716 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65297 (= lt!295721 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8878 lt!295153)))))))

(assert (=> d!65297 (= lt!295717 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9115 (_1!8878 lt!295153))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9110 (_1!8878 lt!295153)))))))

(assert (=> d!65297 (invariant!0 (currentBit!9110 (_1!8878 lt!295153)) (currentByte!9115 (_1!8878 lt!295153)) (size!4369 (buf!4843 (_1!8878 lt!295153))))))

(assert (=> d!65297 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!295153))) (currentByte!9115 (_1!8878 lt!295153)) (currentBit!9110 (_1!8878 lt!295153))) lt!295717)))

(declare-fun b!190509 () Bool)

(declare-fun res!158944 () Bool)

(assert (=> b!190509 (=> (not res!158944) (not e!131442))))

(assert (=> b!190509 (= res!158944 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295717))))

(declare-fun b!190510 () Bool)

(declare-fun lt!295720 () (_ BitVec 64))

(assert (=> b!190510 (= e!131442 (bvsle lt!295717 (bvmul lt!295720 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190510 (or (= lt!295720 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295720 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295720)))))

(assert (=> b!190510 (= lt!295720 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8878 lt!295153)))))))

(assert (= (and d!65297 res!158943) b!190509))

(assert (= (and b!190509 res!158944) b!190510))

(declare-fun m!295891 () Bool)

(assert (=> d!65297 m!295891))

(declare-fun m!295893 () Bool)

(assert (=> d!65297 m!295893))

(assert (=> b!190225 d!65297))

(declare-fun d!65299 () Bool)

(declare-fun e!131443 () Bool)

(assert (=> d!65299 e!131443))

(declare-fun res!158947 () Bool)

(assert (=> d!65299 (=> (not res!158947) (not e!131443))))

(declare-fun lt!295723 () tuple2!16462)

(assert (=> d!65299 (= res!158947 (isPrefixOf!0 (_1!8876 lt!295723) (_2!8876 lt!295723)))))

(declare-fun lt!295735 () BitStream!7846)

(assert (=> d!65299 (= lt!295723 (tuple2!16463 lt!295735 (_2!8875 lt!295143)))))

(declare-fun lt!295731 () Unit!13537)

(declare-fun lt!295732 () Unit!13537)

(assert (=> d!65299 (= lt!295731 lt!295732)))

(assert (=> d!65299 (isPrefixOf!0 lt!295735 (_2!8875 lt!295143))))

(assert (=> d!65299 (= lt!295732 (lemmaIsPrefixTransitive!0 lt!295735 (_2!8875 lt!295143) (_2!8875 lt!295143)))))

(declare-fun lt!295740 () Unit!13537)

(declare-fun lt!295726 () Unit!13537)

(assert (=> d!65299 (= lt!295740 lt!295726)))

(assert (=> d!65299 (isPrefixOf!0 lt!295735 (_2!8875 lt!295143))))

(assert (=> d!65299 (= lt!295726 (lemmaIsPrefixTransitive!0 lt!295735 thiss!1204 (_2!8875 lt!295143)))))

(declare-fun lt!295727 () Unit!13537)

(declare-fun e!131444 () Unit!13537)

(assert (=> d!65299 (= lt!295727 e!131444)))

(declare-fun c!9627 () Bool)

(assert (=> d!65299 (= c!9627 (not (= (size!4369 (buf!4843 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!295737 () Unit!13537)

(declare-fun lt!295729 () Unit!13537)

(assert (=> d!65299 (= lt!295737 lt!295729)))

(assert (=> d!65299 (isPrefixOf!0 (_2!8875 lt!295143) (_2!8875 lt!295143))))

(assert (=> d!65299 (= lt!295729 (lemmaIsPrefixRefl!0 (_2!8875 lt!295143)))))

(declare-fun lt!295736 () Unit!13537)

(declare-fun lt!295739 () Unit!13537)

(assert (=> d!65299 (= lt!295736 lt!295739)))

(assert (=> d!65299 (= lt!295739 (lemmaIsPrefixRefl!0 (_2!8875 lt!295143)))))

(declare-fun lt!295741 () Unit!13537)

(declare-fun lt!295722 () Unit!13537)

(assert (=> d!65299 (= lt!295741 lt!295722)))

(assert (=> d!65299 (isPrefixOf!0 lt!295735 lt!295735)))

(assert (=> d!65299 (= lt!295722 (lemmaIsPrefixRefl!0 lt!295735))))

(declare-fun lt!295733 () Unit!13537)

(declare-fun lt!295724 () Unit!13537)

(assert (=> d!65299 (= lt!295733 lt!295724)))

(assert (=> d!65299 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65299 (= lt!295724 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65299 (= lt!295735 (BitStream!7847 (buf!4843 (_2!8875 lt!295143)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)))))

(assert (=> d!65299 (isPrefixOf!0 thiss!1204 (_2!8875 lt!295143))))

(assert (=> d!65299 (= (reader!0 thiss!1204 (_2!8875 lt!295143)) lt!295723)))

(declare-fun b!190511 () Bool)

(declare-fun lt!295728 () Unit!13537)

(assert (=> b!190511 (= e!131444 lt!295728)))

(declare-fun lt!295730 () (_ BitVec 64))

(assert (=> b!190511 (= lt!295730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!295738 () (_ BitVec 64))

(assert (=> b!190511 (= lt!295738 (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)))))

(assert (=> b!190511 (= lt!295728 (arrayBitRangesEqSymmetric!0 (buf!4843 thiss!1204) (buf!4843 (_2!8875 lt!295143)) lt!295730 lt!295738))))

(assert (=> b!190511 (arrayBitRangesEq!0 (buf!4843 (_2!8875 lt!295143)) (buf!4843 thiss!1204) lt!295730 lt!295738)))

(declare-fun b!190512 () Bool)

(declare-fun Unit!13557 () Unit!13537)

(assert (=> b!190512 (= e!131444 Unit!13557)))

(declare-fun b!190513 () Bool)

(declare-fun res!158945 () Bool)

(assert (=> b!190513 (=> (not res!158945) (not e!131443))))

(assert (=> b!190513 (= res!158945 (isPrefixOf!0 (_2!8876 lt!295723) (_2!8875 lt!295143)))))

(declare-fun b!190514 () Bool)

(declare-fun res!158946 () Bool)

(assert (=> b!190514 (=> (not res!158946) (not e!131443))))

(assert (=> b!190514 (= res!158946 (isPrefixOf!0 (_1!8876 lt!295723) thiss!1204))))

(declare-fun lt!295725 () (_ BitVec 64))

(declare-fun lt!295734 () (_ BitVec 64))

(declare-fun b!190515 () Bool)

(assert (=> b!190515 (= e!131443 (= (_1!8876 lt!295723) (withMovedBitIndex!0 (_2!8876 lt!295723) (bvsub lt!295734 lt!295725))))))

(assert (=> b!190515 (or (= (bvand lt!295734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295725 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295734 lt!295725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190515 (= lt!295725 (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295143))) (currentByte!9115 (_2!8875 lt!295143)) (currentBit!9110 (_2!8875 lt!295143))))))

(assert (=> b!190515 (= lt!295734 (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)))))

(assert (= (and d!65299 c!9627) b!190511))

(assert (= (and d!65299 (not c!9627)) b!190512))

(assert (= (and d!65299 res!158947) b!190514))

(assert (= (and b!190514 res!158946) b!190513))

(assert (= (and b!190513 res!158945) b!190515))

(declare-fun m!295895 () Bool)

(assert (=> b!190514 m!295895))

(declare-fun m!295897 () Bool)

(assert (=> b!190515 m!295897))

(assert (=> b!190515 m!295437))

(assert (=> b!190515 m!295377))

(declare-fun m!295899 () Bool)

(assert (=> b!190513 m!295899))

(declare-fun m!295901 () Bool)

(assert (=> d!65299 m!295901))

(declare-fun m!295903 () Bool)

(assert (=> d!65299 m!295903))

(declare-fun m!295905 () Bool)

(assert (=> d!65299 m!295905))

(declare-fun m!295907 () Bool)

(assert (=> d!65299 m!295907))

(declare-fun m!295909 () Bool)

(assert (=> d!65299 m!295909))

(assert (=> d!65299 m!295867))

(declare-fun m!295911 () Bool)

(assert (=> d!65299 m!295911))

(declare-fun m!295913 () Bool)

(assert (=> d!65299 m!295913))

(declare-fun m!295915 () Bool)

(assert (=> d!65299 m!295915))

(assert (=> d!65299 m!295439))

(assert (=> d!65299 m!295875))

(assert (=> b!190511 m!295377))

(declare-fun m!295917 () Bool)

(assert (=> b!190511 m!295917))

(declare-fun m!295919 () Bool)

(assert (=> b!190511 m!295919))

(assert (=> b!190225 d!65299))

(declare-fun d!65301 () Bool)

(declare-fun e!131445 () Bool)

(assert (=> d!65301 e!131445))

(declare-fun res!158948 () Bool)

(assert (=> d!65301 (=> (not res!158948) (not e!131445))))

(declare-fun lt!295743 () (_ BitVec 64))

(declare-fun lt!295744 () (_ BitVec 64))

(declare-fun lt!295745 () (_ BitVec 64))

(assert (=> d!65301 (= res!158948 (= lt!295743 (bvsub lt!295744 lt!295745)))))

(assert (=> d!65301 (or (= (bvand lt!295744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295745 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295744 lt!295745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65301 (= lt!295745 (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8878 lt!295164)))) ((_ sign_extend 32) (currentByte!9115 (_1!8878 lt!295164))) ((_ sign_extend 32) (currentBit!9110 (_1!8878 lt!295164)))))))

(declare-fun lt!295747 () (_ BitVec 64))

(declare-fun lt!295742 () (_ BitVec 64))

(assert (=> d!65301 (= lt!295744 (bvmul lt!295747 lt!295742))))

(assert (=> d!65301 (or (= lt!295747 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295742 (bvsdiv (bvmul lt!295747 lt!295742) lt!295747)))))

(assert (=> d!65301 (= lt!295742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65301 (= lt!295747 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8878 lt!295164)))))))

(assert (=> d!65301 (= lt!295743 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9115 (_1!8878 lt!295164))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9110 (_1!8878 lt!295164)))))))

(assert (=> d!65301 (invariant!0 (currentBit!9110 (_1!8878 lt!295164)) (currentByte!9115 (_1!8878 lt!295164)) (size!4369 (buf!4843 (_1!8878 lt!295164))))))

(assert (=> d!65301 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!295164))) (currentByte!9115 (_1!8878 lt!295164)) (currentBit!9110 (_1!8878 lt!295164))) lt!295743)))

(declare-fun b!190516 () Bool)

(declare-fun res!158949 () Bool)

(assert (=> b!190516 (=> (not res!158949) (not e!131445))))

(assert (=> b!190516 (= res!158949 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295743))))

(declare-fun b!190517 () Bool)

(declare-fun lt!295746 () (_ BitVec 64))

(assert (=> b!190517 (= e!131445 (bvsle lt!295743 (bvmul lt!295746 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190517 (or (= lt!295746 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295746 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295746)))))

(assert (=> b!190517 (= lt!295746 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8878 lt!295164)))))))

(assert (= (and d!65301 res!158948) b!190516))

(assert (= (and b!190516 res!158949) b!190517))

(declare-fun m!295921 () Bool)

(assert (=> d!65301 m!295921))

(declare-fun m!295923 () Bool)

(assert (=> d!65301 m!295923))

(assert (=> b!190225 d!65301))

(declare-fun lt!295748 () tuple2!16490)

(declare-fun d!65303 () Bool)

(assert (=> d!65303 (= lt!295748 (readNBitsLSBFirstsLoop!0 (_1!8876 lt!295138) nBits!348 i!590 lt!295148))))

(assert (=> d!65303 (= (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!295138) nBits!348 i!590 lt!295148) (tuple2!16465 (_2!8890 lt!295748) (_1!8890 lt!295748)))))

(declare-fun bs!16236 () Bool)

(assert (= bs!16236 d!65303))

(declare-fun m!295925 () Bool)

(assert (=> bs!16236 m!295925))

(assert (=> b!190225 d!65303))

(declare-fun d!65305 () Bool)

(declare-fun res!158951 () Bool)

(declare-fun e!131447 () Bool)

(assert (=> d!65305 (=> (not res!158951) (not e!131447))))

(assert (=> d!65305 (= res!158951 (= (size!4369 (buf!4843 (_2!8875 lt!295144))) (size!4369 (buf!4843 (_2!8875 lt!295143)))))))

(assert (=> d!65305 (= (isPrefixOf!0 (_2!8875 lt!295144) (_2!8875 lt!295143)) e!131447)))

(declare-fun b!190518 () Bool)

(declare-fun res!158950 () Bool)

(assert (=> b!190518 (=> (not res!158950) (not e!131447))))

(assert (=> b!190518 (= res!158950 (bvsle (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))) (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295143))) (currentByte!9115 (_2!8875 lt!295143)) (currentBit!9110 (_2!8875 lt!295143)))))))

(declare-fun b!190519 () Bool)

(declare-fun e!131446 () Bool)

(assert (=> b!190519 (= e!131447 e!131446)))

(declare-fun res!158952 () Bool)

(assert (=> b!190519 (=> res!158952 e!131446)))

(assert (=> b!190519 (= res!158952 (= (size!4369 (buf!4843 (_2!8875 lt!295144))) #b00000000000000000000000000000000))))

(declare-fun b!190520 () Bool)

(assert (=> b!190520 (= e!131446 (arrayBitRangesEq!0 (buf!4843 (_2!8875 lt!295144)) (buf!4843 (_2!8875 lt!295143)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144)))))))

(assert (= (and d!65305 res!158951) b!190518))

(assert (= (and b!190518 res!158950) b!190519))

(assert (= (and b!190519 (not res!158952)) b!190520))

(assert (=> b!190518 m!295375))

(assert (=> b!190518 m!295437))

(assert (=> b!190520 m!295375))

(assert (=> b!190520 m!295375))

(declare-fun m!295927 () Bool)

(assert (=> b!190520 m!295927))

(assert (=> b!190234 d!65305))

(declare-fun d!65307 () Bool)

(assert (=> d!65307 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8876 lt!295138)))) ((_ sign_extend 32) (currentByte!9115 (_1!8876 lt!295138))) ((_ sign_extend 32) (currentBit!9110 (_1!8876 lt!295138))) lt!295159) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8876 lt!295138)))) ((_ sign_extend 32) (currentByte!9115 (_1!8876 lt!295138))) ((_ sign_extend 32) (currentBit!9110 (_1!8876 lt!295138)))) lt!295159))))

(declare-fun bs!16237 () Bool)

(assert (= bs!16237 d!65307))

(declare-fun m!295929 () Bool)

(assert (=> bs!16237 m!295929))

(assert (=> b!190223 d!65307))

(assert (=> b!190224 d!65237))

(assert (=> b!190224 d!65239))

(declare-fun b!190541 () Bool)

(declare-fun e!131457 () Bool)

(declare-fun e!131456 () Bool)

(assert (=> b!190541 (= e!131457 e!131456)))

(declare-fun res!158969 () Bool)

(assert (=> b!190541 (=> (not res!158969) (not e!131456))))

(declare-fun lt!295768 () tuple2!16460)

(declare-fun lt!295766 () tuple2!16466)

(assert (=> b!190541 (= res!158969 (and (= (_2!8878 lt!295766) lt!295141) (= (_1!8878 lt!295766) (_2!8875 lt!295768))))))

(assert (=> b!190541 (= lt!295766 (readBitPure!0 (readerFrom!0 (_2!8875 lt!295768) (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204))))))

(declare-fun d!65309 () Bool)

(assert (=> d!65309 e!131457))

(declare-fun res!158970 () Bool)

(assert (=> d!65309 (=> (not res!158970) (not e!131457))))

(assert (=> d!65309 (= res!158970 (= (size!4369 (buf!4843 thiss!1204)) (size!4369 (buf!4843 (_2!8875 lt!295768)))))))

(declare-fun choose!16 (BitStream!7846 Bool) tuple2!16460)

(assert (=> d!65309 (= lt!295768 (choose!16 thiss!1204 lt!295141))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65309 (validate_offset_bit!0 ((_ sign_extend 32) (size!4369 (buf!4843 thiss!1204))) ((_ sign_extend 32) (currentByte!9115 thiss!1204)) ((_ sign_extend 32) (currentBit!9110 thiss!1204)))))

(assert (=> d!65309 (= (appendBit!0 thiss!1204 lt!295141) lt!295768)))

(declare-fun b!190542 () Bool)

(assert (=> b!190542 (= e!131456 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!295766))) (currentByte!9115 (_1!8878 lt!295766)) (currentBit!9110 (_1!8878 lt!295766))) (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295768))) (currentByte!9115 (_2!8875 lt!295768)) (currentBit!9110 (_2!8875 lt!295768)))))))

(declare-fun b!190539 () Bool)

(declare-fun res!158972 () Bool)

(assert (=> b!190539 (=> (not res!158972) (not e!131457))))

(declare-fun lt!295765 () (_ BitVec 64))

(declare-fun lt!295767 () (_ BitVec 64))

(assert (=> b!190539 (= res!158972 (= (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295768))) (currentByte!9115 (_2!8875 lt!295768)) (currentBit!9110 (_2!8875 lt!295768))) (bvadd lt!295765 lt!295767)))))

(assert (=> b!190539 (or (not (= (bvand lt!295765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295767 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295765 lt!295767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190539 (= lt!295767 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!190539 (= lt!295765 (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)))))

(declare-fun b!190540 () Bool)

(declare-fun res!158971 () Bool)

(assert (=> b!190540 (=> (not res!158971) (not e!131457))))

(assert (=> b!190540 (= res!158971 (isPrefixOf!0 thiss!1204 (_2!8875 lt!295768)))))

(assert (= (and d!65309 res!158970) b!190539))

(assert (= (and b!190539 res!158972) b!190540))

(assert (= (and b!190540 res!158971) b!190541))

(assert (= (and b!190541 res!158969) b!190542))

(declare-fun m!295931 () Bool)

(assert (=> d!65309 m!295931))

(declare-fun m!295933 () Bool)

(assert (=> d!65309 m!295933))

(declare-fun m!295935 () Bool)

(assert (=> b!190539 m!295935))

(assert (=> b!190539 m!295377))

(declare-fun m!295937 () Bool)

(assert (=> b!190542 m!295937))

(assert (=> b!190542 m!295935))

(declare-fun m!295939 () Bool)

(assert (=> b!190540 m!295939))

(declare-fun m!295941 () Bool)

(assert (=> b!190541 m!295941))

(assert (=> b!190541 m!295941))

(declare-fun m!295943 () Bool)

(assert (=> b!190541 m!295943))

(assert (=> b!190224 d!65309))

(declare-fun d!65311 () Bool)

(declare-fun e!131460 () Bool)

(assert (=> d!65311 e!131460))

(declare-fun res!158977 () Bool)

(assert (=> d!65311 (=> (not res!158977) (not e!131460))))

(declare-fun lt!295775 () (_ BitVec 64))

(declare-fun lt!295776 () (_ BitVec 64))

(declare-fun lt!295774 () (_ BitVec 64))

(assert (=> d!65311 (= res!158977 (= lt!295774 (bvsub lt!295775 lt!295776)))))

(assert (=> d!65311 (or (= (bvand lt!295775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295776 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295775 lt!295776) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65311 (= lt!295776 (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8877 lt!295162)))) ((_ sign_extend 32) (currentByte!9115 (_1!8877 lt!295162))) ((_ sign_extend 32) (currentBit!9110 (_1!8877 lt!295162)))))))

(declare-fun lt!295778 () (_ BitVec 64))

(declare-fun lt!295773 () (_ BitVec 64))

(assert (=> d!65311 (= lt!295775 (bvmul lt!295778 lt!295773))))

(assert (=> d!65311 (or (= lt!295778 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295773 (bvsdiv (bvmul lt!295778 lt!295773) lt!295778)))))

(assert (=> d!65311 (= lt!295773 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65311 (= lt!295778 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8877 lt!295162)))))))

(assert (=> d!65311 (= lt!295774 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9115 (_1!8877 lt!295162))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9110 (_1!8877 lt!295162)))))))

(assert (=> d!65311 (invariant!0 (currentBit!9110 (_1!8877 lt!295162)) (currentByte!9115 (_1!8877 lt!295162)) (size!4369 (buf!4843 (_1!8877 lt!295162))))))

(assert (=> d!65311 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8877 lt!295162))) (currentByte!9115 (_1!8877 lt!295162)) (currentBit!9110 (_1!8877 lt!295162))) lt!295774)))

(declare-fun b!190547 () Bool)

(declare-fun res!158978 () Bool)

(assert (=> b!190547 (=> (not res!158978) (not e!131460))))

(assert (=> b!190547 (= res!158978 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295774))))

(declare-fun b!190548 () Bool)

(declare-fun lt!295777 () (_ BitVec 64))

(assert (=> b!190548 (= e!131460 (bvsle lt!295774 (bvmul lt!295777 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190548 (or (= lt!295777 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295777 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295777)))))

(assert (=> b!190548 (= lt!295777 ((_ sign_extend 32) (size!4369 (buf!4843 (_1!8877 lt!295162)))))))

(assert (= (and d!65311 res!158977) b!190547))

(assert (= (and b!190547 res!158978) b!190548))

(declare-fun m!295955 () Bool)

(assert (=> d!65311 m!295955))

(declare-fun m!295959 () Bool)

(assert (=> d!65311 m!295959))

(assert (=> b!190222 d!65311))

(declare-fun d!65313 () Bool)

(declare-fun e!131461 () Bool)

(assert (=> d!65313 e!131461))

(declare-fun res!158979 () Bool)

(assert (=> d!65313 (=> (not res!158979) (not e!131461))))

(declare-fun lt!295781 () (_ BitVec 64))

(declare-fun lt!295780 () (_ BitVec 64))

(declare-fun lt!295782 () (_ BitVec 64))

(assert (=> d!65313 (= res!158979 (= lt!295780 (bvsub lt!295781 lt!295782)))))

(assert (=> d!65313 (or (= (bvand lt!295781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295782 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295781 lt!295782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65313 (= lt!295782 (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8876 lt!295138)))) ((_ sign_extend 32) (currentByte!9115 (_2!8876 lt!295138))) ((_ sign_extend 32) (currentBit!9110 (_2!8876 lt!295138)))))))

(declare-fun lt!295784 () (_ BitVec 64))

(declare-fun lt!295779 () (_ BitVec 64))

(assert (=> d!65313 (= lt!295781 (bvmul lt!295784 lt!295779))))

(assert (=> d!65313 (or (= lt!295784 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295779 (bvsdiv (bvmul lt!295784 lt!295779) lt!295784)))))

(assert (=> d!65313 (= lt!295779 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65313 (= lt!295784 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8876 lt!295138)))))))

(assert (=> d!65313 (= lt!295780 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9115 (_2!8876 lt!295138))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9110 (_2!8876 lt!295138)))))))

(assert (=> d!65313 (invariant!0 (currentBit!9110 (_2!8876 lt!295138)) (currentByte!9115 (_2!8876 lt!295138)) (size!4369 (buf!4843 (_2!8876 lt!295138))))))

(assert (=> d!65313 (= (bitIndex!0 (size!4369 (buf!4843 (_2!8876 lt!295138))) (currentByte!9115 (_2!8876 lt!295138)) (currentBit!9110 (_2!8876 lt!295138))) lt!295780)))

(declare-fun b!190549 () Bool)

(declare-fun res!158980 () Bool)

(assert (=> b!190549 (=> (not res!158980) (not e!131461))))

(assert (=> b!190549 (= res!158980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295780))))

(declare-fun b!190550 () Bool)

(declare-fun lt!295783 () (_ BitVec 64))

(assert (=> b!190550 (= e!131461 (bvsle lt!295780 (bvmul lt!295783 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190550 (or (= lt!295783 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295783 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295783)))))

(assert (=> b!190550 (= lt!295783 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8876 lt!295138)))))))

(assert (= (and d!65313 res!158979) b!190549))

(assert (= (and b!190549 res!158980) b!190550))

(declare-fun m!295963 () Bool)

(assert (=> d!65313 m!295963))

(declare-fun m!295965 () Bool)

(assert (=> d!65313 m!295965))

(assert (=> b!190222 d!65313))

(declare-fun d!65317 () Bool)

(declare-fun e!131463 () Bool)

(assert (=> d!65317 e!131463))

(declare-fun res!158983 () Bool)

(assert (=> d!65317 (=> (not res!158983) (not e!131463))))

(declare-fun lt!295794 () (_ BitVec 64))

(declare-fun lt!295792 () (_ BitVec 64))

(declare-fun lt!295793 () (_ BitVec 64))

(assert (=> d!65317 (= res!158983 (= lt!295792 (bvsub lt!295793 lt!295794)))))

(assert (=> d!65317 (or (= (bvand lt!295793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295794 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295793 lt!295794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65317 (= lt!295794 (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295143))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295143)))))))

(declare-fun lt!295796 () (_ BitVec 64))

(declare-fun lt!295791 () (_ BitVec 64))

(assert (=> d!65317 (= lt!295793 (bvmul lt!295796 lt!295791))))

(assert (=> d!65317 (or (= lt!295796 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295791 (bvsdiv (bvmul lt!295796 lt!295791) lt!295796)))))

(assert (=> d!65317 (= lt!295791 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65317 (= lt!295796 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))))))

(assert (=> d!65317 (= lt!295792 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295143))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295143)))))))

(assert (=> d!65317 (invariant!0 (currentBit!9110 (_2!8875 lt!295143)) (currentByte!9115 (_2!8875 lt!295143)) (size!4369 (buf!4843 (_2!8875 lt!295143))))))

(assert (=> d!65317 (= (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295143))) (currentByte!9115 (_2!8875 lt!295143)) (currentBit!9110 (_2!8875 lt!295143))) lt!295792)))

(declare-fun b!190553 () Bool)

(declare-fun res!158984 () Bool)

(assert (=> b!190553 (=> (not res!158984) (not e!131463))))

(assert (=> b!190553 (= res!158984 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295792))))

(declare-fun b!190554 () Bool)

(declare-fun lt!295795 () (_ BitVec 64))

(assert (=> b!190554 (= e!131463 (bvsle lt!295792 (bvmul lt!295795 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190554 (or (= lt!295795 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295795 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295795)))))

(assert (=> b!190554 (= lt!295795 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295143)))))))

(assert (= (and d!65317 res!158983) b!190553))

(assert (= (and b!190553 res!158984) b!190554))

(declare-fun m!295971 () Bool)

(assert (=> d!65317 m!295971))

(assert (=> d!65317 m!295453))

(assert (=> b!190233 d!65317))

(declare-fun d!65321 () Bool)

(declare-fun res!158988 () Bool)

(declare-fun e!131466 () Bool)

(assert (=> d!65321 (=> (not res!158988) (not e!131466))))

(assert (=> d!65321 (= res!158988 (= (size!4369 (buf!4843 thiss!1204)) (size!4369 (buf!4843 (_2!8875 lt!295143)))))))

(assert (=> d!65321 (= (isPrefixOf!0 thiss!1204 (_2!8875 lt!295143)) e!131466)))

(declare-fun b!190557 () Bool)

(declare-fun res!158987 () Bool)

(assert (=> b!190557 (=> (not res!158987) (not e!131466))))

(assert (=> b!190557 (= res!158987 (bvsle (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204)) (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295143))) (currentByte!9115 (_2!8875 lt!295143)) (currentBit!9110 (_2!8875 lt!295143)))))))

(declare-fun b!190558 () Bool)

(declare-fun e!131465 () Bool)

(assert (=> b!190558 (= e!131466 e!131465)))

(declare-fun res!158989 () Bool)

(assert (=> b!190558 (=> res!158989 e!131465)))

(assert (=> b!190558 (= res!158989 (= (size!4369 (buf!4843 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!190559 () Bool)

(assert (=> b!190559 (= e!131465 (arrayBitRangesEq!0 (buf!4843 thiss!1204) (buf!4843 (_2!8875 lt!295143)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4369 (buf!4843 thiss!1204)) (currentByte!9115 thiss!1204) (currentBit!9110 thiss!1204))))))

(assert (= (and d!65321 res!158988) b!190557))

(assert (= (and b!190557 res!158987) b!190558))

(assert (= (and b!190558 (not res!158989)) b!190559))

(assert (=> b!190557 m!295377))

(assert (=> b!190557 m!295437))

(assert (=> b!190559 m!295377))

(assert (=> b!190559 m!295377))

(declare-fun m!295977 () Bool)

(assert (=> b!190559 m!295977))

(assert (=> b!190233 d!65321))

(declare-fun d!65325 () Bool)

(assert (=> d!65325 (isPrefixOf!0 thiss!1204 (_2!8875 lt!295143))))

(declare-fun lt!295805 () Unit!13537)

(declare-fun choose!30 (BitStream!7846 BitStream!7846 BitStream!7846) Unit!13537)

(assert (=> d!65325 (= lt!295805 (choose!30 thiss!1204 (_2!8875 lt!295144) (_2!8875 lt!295143)))))

(assert (=> d!65325 (isPrefixOf!0 thiss!1204 (_2!8875 lt!295144))))

(assert (=> d!65325 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8875 lt!295144) (_2!8875 lt!295143)) lt!295805)))

(declare-fun bs!16238 () Bool)

(assert (= bs!16238 d!65325))

(assert (=> bs!16238 m!295439))

(declare-fun m!295979 () Bool)

(assert (=> bs!16238 m!295979))

(assert (=> bs!16238 m!295425))

(assert (=> b!190233 d!65325))

(declare-fun b!190692 () Bool)

(declare-fun res!159099 () Bool)

(declare-fun e!131546 () Bool)

(assert (=> b!190692 (=> (not res!159099) (not e!131546))))

(declare-fun lt!296278 () tuple2!16460)

(assert (=> b!190692 (= res!159099 (= (size!4369 (buf!4843 (_2!8875 lt!295144))) (size!4369 (buf!4843 (_2!8875 lt!296278)))))))

(declare-fun d!65327 () Bool)

(assert (=> d!65327 e!131546))

(declare-fun res!159105 () Bool)

(assert (=> d!65327 (=> (not res!159105) (not e!131546))))

(assert (=> d!65327 (= res!159105 (invariant!0 (currentBit!9110 (_2!8875 lt!296278)) (currentByte!9115 (_2!8875 lt!296278)) (size!4369 (buf!4843 (_2!8875 lt!296278)))))))

(declare-fun e!131548 () tuple2!16460)

(assert (=> d!65327 (= lt!296278 e!131548)))

(declare-fun c!9642 () Bool)

(assert (=> d!65327 (= c!9642 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65327 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65327 (= (appendBitsLSBFirstLoopTR!0 (_2!8875 lt!295144) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!296278)))

(declare-fun b!190693 () Bool)

(declare-fun res!159103 () Bool)

(declare-fun lt!296258 () tuple2!16460)

(assert (=> b!190693 (= res!159103 (= (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!296258))) (currentByte!9115 (_2!8875 lt!296258)) (currentBit!9110 (_2!8875 lt!296258))) (bvadd (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!131544 () Bool)

(assert (=> b!190693 (=> (not res!159103) (not e!131544))))

(declare-fun b!190694 () Bool)

(declare-fun e!131542 () Bool)

(declare-fun lt!296294 () tuple2!16466)

(declare-fun lt!296253 () tuple2!16466)

(assert (=> b!190694 (= e!131542 (= (_2!8878 lt!296294) (_2!8878 lt!296253)))))

(declare-fun b!190695 () Bool)

(declare-fun lt!296264 () tuple2!16460)

(assert (=> b!190695 (= e!131548 (tuple2!16461 (_1!8875 lt!296264) (_2!8875 lt!296264)))))

(declare-fun lt!296286 () Bool)

(assert (=> b!190695 (= lt!296286 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190695 (= lt!296258 (appendBit!0 (_2!8875 lt!295144) lt!296286))))

(declare-fun res!159101 () Bool)

(assert (=> b!190695 (= res!159101 (= (size!4369 (buf!4843 (_2!8875 lt!295144))) (size!4369 (buf!4843 (_2!8875 lt!296258)))))))

(assert (=> b!190695 (=> (not res!159101) (not e!131544))))

(assert (=> b!190695 e!131544))

(declare-fun lt!296297 () tuple2!16460)

(assert (=> b!190695 (= lt!296297 lt!296258)))

(assert (=> b!190695 (= lt!296264 (appendBitsLSBFirstLoopTR!0 (_2!8875 lt!296297) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!296274 () Unit!13537)

(assert (=> b!190695 (= lt!296274 (lemmaIsPrefixTransitive!0 (_2!8875 lt!295144) (_2!8875 lt!296297) (_2!8875 lt!296264)))))

(declare-fun call!3035 () Bool)

(assert (=> b!190695 call!3035))

(declare-fun lt!296257 () Unit!13537)

(assert (=> b!190695 (= lt!296257 lt!296274)))

(assert (=> b!190695 (invariant!0 (currentBit!9110 (_2!8875 lt!295144)) (currentByte!9115 (_2!8875 lt!295144)) (size!4369 (buf!4843 (_2!8875 lt!296297))))))

(declare-fun lt!296288 () BitStream!7846)

(assert (=> b!190695 (= lt!296288 (BitStream!7847 (buf!4843 (_2!8875 lt!296297)) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))))))

(assert (=> b!190695 (invariant!0 (currentBit!9110 lt!296288) (currentByte!9115 lt!296288) (size!4369 (buf!4843 (_2!8875 lt!296264))))))

(declare-fun lt!296277 () BitStream!7846)

(assert (=> b!190695 (= lt!296277 (BitStream!7847 (buf!4843 (_2!8875 lt!296264)) (currentByte!9115 lt!296288) (currentBit!9110 lt!296288)))))

(assert (=> b!190695 (= lt!296294 (readBitPure!0 lt!296288))))

(assert (=> b!190695 (= lt!296253 (readBitPure!0 lt!296277))))

(declare-fun lt!296265 () Unit!13537)

(assert (=> b!190695 (= lt!296265 (readBitPrefixLemma!0 lt!296288 (_2!8875 lt!296264)))))

(declare-fun res!159100 () Bool)

(assert (=> b!190695 (= res!159100 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!296294))) (currentByte!9115 (_1!8878 lt!296294)) (currentBit!9110 (_1!8878 lt!296294))) (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!296253))) (currentByte!9115 (_1!8878 lt!296253)) (currentBit!9110 (_1!8878 lt!296253)))))))

(assert (=> b!190695 (=> (not res!159100) (not e!131542))))

(assert (=> b!190695 e!131542))

(declare-fun lt!296261 () Unit!13537)

(assert (=> b!190695 (= lt!296261 lt!296265)))

(declare-fun lt!296271 () tuple2!16462)

(assert (=> b!190695 (= lt!296271 (reader!0 (_2!8875 lt!295144) (_2!8875 lt!296264)))))

(declare-fun lt!296255 () tuple2!16462)

(assert (=> b!190695 (= lt!296255 (reader!0 (_2!8875 lt!296297) (_2!8875 lt!296264)))))

(declare-fun lt!296279 () tuple2!16466)

(assert (=> b!190695 (= lt!296279 (readBitPure!0 (_1!8876 lt!296271)))))

(assert (=> b!190695 (= (_2!8878 lt!296279) lt!296286)))

(declare-fun lt!296301 () Unit!13537)

(declare-fun Unit!13558 () Unit!13537)

(assert (=> b!190695 (= lt!296301 Unit!13558)))

(declare-fun lt!296292 () (_ BitVec 64))

(assert (=> b!190695 (= lt!296292 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296254 () (_ BitVec 64))

(assert (=> b!190695 (= lt!296254 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296289 () Unit!13537)

(assert (=> b!190695 (= lt!296289 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8875 lt!295144) (buf!4843 (_2!8875 lt!296264)) lt!296254))))

(assert (=> b!190695 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!296264)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144))) lt!296254)))

(declare-fun lt!296284 () Unit!13537)

(assert (=> b!190695 (= lt!296284 lt!296289)))

(declare-fun lt!296287 () tuple2!16464)

(assert (=> b!190695 (= lt!296287 (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!296271) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296292))))

(declare-fun lt!296295 () (_ BitVec 64))

(assert (=> b!190695 (= lt!296295 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!296296 () Unit!13537)

(assert (=> b!190695 (= lt!296296 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8875 lt!296297) (buf!4843 (_2!8875 lt!296264)) lt!296295))))

(assert (=> b!190695 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!296264)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!296297))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!296297))) lt!296295)))

(declare-fun lt!296280 () Unit!13537)

(assert (=> b!190695 (= lt!296280 lt!296296)))

(declare-fun lt!296283 () tuple2!16464)

(assert (=> b!190695 (= lt!296283 (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!296255) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!296292 (ite (_2!8878 lt!296279) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!296267 () tuple2!16464)

(assert (=> b!190695 (= lt!296267 (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!296271) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296292))))

(declare-fun c!9643 () Bool)

(assert (=> b!190695 (= c!9643 (_2!8878 (readBitPure!0 (_1!8876 lt!296271))))))

(declare-fun e!131543 () (_ BitVec 64))

(declare-fun lt!296268 () tuple2!16464)

(assert (=> b!190695 (= lt!296268 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8876 lt!296271) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!296292 e!131543)))))

(declare-fun lt!296259 () Unit!13537)

(assert (=> b!190695 (= lt!296259 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8876 lt!296271) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296292))))

(assert (=> b!190695 (and (= (_2!8877 lt!296267) (_2!8877 lt!296268)) (= (_1!8877 lt!296267) (_1!8877 lt!296268)))))

(declare-fun lt!296269 () Unit!13537)

(assert (=> b!190695 (= lt!296269 lt!296259)))

(assert (=> b!190695 (= (_1!8876 lt!296271) (withMovedBitIndex!0 (_2!8876 lt!296271) (bvsub (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))) (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!296264))) (currentByte!9115 (_2!8875 lt!296264)) (currentBit!9110 (_2!8875 lt!296264))))))))

(declare-fun lt!296256 () Unit!13537)

(declare-fun Unit!13559 () Unit!13537)

(assert (=> b!190695 (= lt!296256 Unit!13559)))

(assert (=> b!190695 (= (_1!8876 lt!296255) (withMovedBitIndex!0 (_2!8876 lt!296255) (bvsub (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!296297))) (currentByte!9115 (_2!8875 lt!296297)) (currentBit!9110 (_2!8875 lt!296297))) (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!296264))) (currentByte!9115 (_2!8875 lt!296264)) (currentBit!9110 (_2!8875 lt!296264))))))))

(declare-fun lt!296282 () Unit!13537)

(declare-fun Unit!13560 () Unit!13537)

(assert (=> b!190695 (= lt!296282 Unit!13560)))

(assert (=> b!190695 (= (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))) (bvsub (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!296297))) (currentByte!9115 (_2!8875 lt!296297)) (currentBit!9110 (_2!8875 lt!296297))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!296276 () Unit!13537)

(declare-fun Unit!13561 () Unit!13537)

(assert (=> b!190695 (= lt!296276 Unit!13561)))

(assert (=> b!190695 (= (_2!8877 lt!296287) (_2!8877 lt!296283))))

(declare-fun lt!296266 () Unit!13537)

(declare-fun Unit!13562 () Unit!13537)

(assert (=> b!190695 (= lt!296266 Unit!13562)))

(assert (=> b!190695 (invariant!0 (currentBit!9110 (_2!8875 lt!296264)) (currentByte!9115 (_2!8875 lt!296264)) (size!4369 (buf!4843 (_2!8875 lt!296264))))))

(declare-fun lt!296246 () Unit!13537)

(declare-fun Unit!13563 () Unit!13537)

(assert (=> b!190695 (= lt!296246 Unit!13563)))

(assert (=> b!190695 (= (size!4369 (buf!4843 (_2!8875 lt!295144))) (size!4369 (buf!4843 (_2!8875 lt!296264))))))

(declare-fun lt!296275 () Unit!13537)

(declare-fun Unit!13564 () Unit!13537)

(assert (=> b!190695 (= lt!296275 Unit!13564)))

(assert (=> b!190695 (= (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!296264))) (currentByte!9115 (_2!8875 lt!296264)) (currentBit!9110 (_2!8875 lt!296264))) (bvsub (bvadd (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296300 () Unit!13537)

(declare-fun Unit!13565 () Unit!13537)

(assert (=> b!190695 (= lt!296300 Unit!13565)))

(declare-fun lt!296285 () Unit!13537)

(declare-fun Unit!13566 () Unit!13537)

(assert (=> b!190695 (= lt!296285 Unit!13566)))

(declare-fun lt!296252 () tuple2!16462)

(assert (=> b!190695 (= lt!296252 (reader!0 (_2!8875 lt!295144) (_2!8875 lt!296264)))))

(declare-fun lt!296290 () (_ BitVec 64))

(assert (=> b!190695 (= lt!296290 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296260 () Unit!13537)

(assert (=> b!190695 (= lt!296260 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8875 lt!295144) (buf!4843 (_2!8875 lt!296264)) lt!296290))))

(assert (=> b!190695 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!296264)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144))) lt!296290)))

(declare-fun lt!296272 () Unit!13537)

(assert (=> b!190695 (= lt!296272 lt!296260)))

(declare-fun lt!296263 () tuple2!16464)

(assert (=> b!190695 (= lt!296263 (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!296252) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!159097 () Bool)

(assert (=> b!190695 (= res!159097 (= (_2!8877 lt!296263) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!131550 () Bool)

(assert (=> b!190695 (=> (not res!159097) (not e!131550))))

(assert (=> b!190695 e!131550))

(declare-fun lt!296270 () Unit!13537)

(declare-fun Unit!13567 () Unit!13537)

(assert (=> b!190695 (= lt!296270 Unit!13567)))

(declare-fun bm!3032 () Bool)

(assert (=> bm!3032 (= call!3035 (isPrefixOf!0 (_2!8875 lt!295144) (ite c!9642 (_2!8875 lt!295144) (_2!8875 lt!296264))))))

(declare-fun b!190696 () Bool)

(declare-fun e!131545 () Bool)

(declare-fun lt!296250 () tuple2!16464)

(declare-fun lt!296298 () tuple2!16462)

(assert (=> b!190696 (= e!131545 (= (_1!8877 lt!296250) (_2!8876 lt!296298)))))

(declare-fun b!190697 () Bool)

(assert (=> b!190697 (= e!131546 e!131545)))

(declare-fun res!159106 () Bool)

(assert (=> b!190697 (=> (not res!159106) (not e!131545))))

(assert (=> b!190697 (= res!159106 (= (_2!8877 lt!296250) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!190697 (= lt!296250 (readNBitsLSBFirstsLoopPure!0 (_1!8876 lt!296298) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!296293 () Unit!13537)

(declare-fun lt!296299 () Unit!13537)

(assert (=> b!190697 (= lt!296293 lt!296299)))

(declare-fun lt!296291 () (_ BitVec 64))

(assert (=> b!190697 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!296278)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144))) lt!296291)))

(assert (=> b!190697 (= lt!296299 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8875 lt!295144) (buf!4843 (_2!8875 lt!296278)) lt!296291))))

(declare-fun e!131549 () Bool)

(assert (=> b!190697 e!131549))

(declare-fun res!159104 () Bool)

(assert (=> b!190697 (=> (not res!159104) (not e!131549))))

(assert (=> b!190697 (= res!159104 (and (= (size!4369 (buf!4843 (_2!8875 lt!295144))) (size!4369 (buf!4843 (_2!8875 lt!296278)))) (bvsge lt!296291 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190697 (= lt!296291 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!190697 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!190697 (= lt!296298 (reader!0 (_2!8875 lt!295144) (_2!8875 lt!296278)))))

(declare-fun b!190698 () Bool)

(declare-fun e!131547 () Bool)

(declare-fun lt!296273 () tuple2!16466)

(assert (=> b!190698 (= e!131547 (= (bitIndex!0 (size!4369 (buf!4843 (_1!8878 lt!296273))) (currentByte!9115 (_1!8878 lt!296273)) (currentBit!9110 (_1!8878 lt!296273))) (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!296258))) (currentByte!9115 (_2!8875 lt!296258)) (currentBit!9110 (_2!8875 lt!296258)))))))

(declare-fun b!190699 () Bool)

(declare-fun res!159096 () Bool)

(assert (=> b!190699 (=> (not res!159096) (not e!131546))))

(assert (=> b!190699 (= res!159096 (isPrefixOf!0 (_2!8875 lt!295144) (_2!8875 lt!296278)))))

(declare-fun b!190700 () Bool)

(assert (=> b!190700 (= lt!296273 (readBitPure!0 (readerFrom!0 (_2!8875 lt!296258) (currentBit!9110 (_2!8875 lt!295144)) (currentByte!9115 (_2!8875 lt!295144)))))))

(declare-fun res!159102 () Bool)

(assert (=> b!190700 (= res!159102 (and (= (_2!8878 lt!296273) lt!296286) (= (_1!8878 lt!296273) (_2!8875 lt!296258))))))

(assert (=> b!190700 (=> (not res!159102) (not e!131547))))

(assert (=> b!190700 (= e!131544 e!131547)))

(declare-fun b!190701 () Bool)

(declare-fun Unit!13568 () Unit!13537)

(assert (=> b!190701 (= e!131548 (tuple2!16461 Unit!13568 (_2!8875 lt!295144)))))

(declare-fun lt!296249 () Unit!13537)

(assert (=> b!190701 (= lt!296249 (lemmaIsPrefixRefl!0 (_2!8875 lt!295144)))))

(assert (=> b!190701 call!3035))

(declare-fun lt!296247 () Unit!13537)

(assert (=> b!190701 (= lt!296247 lt!296249)))

(declare-fun b!190702 () Bool)

(assert (=> b!190702 (= e!131543 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!190703 () Bool)

(assert (=> b!190703 (= e!131549 (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 (_2!8875 lt!295144)))) ((_ sign_extend 32) (currentByte!9115 (_2!8875 lt!295144))) ((_ sign_extend 32) (currentBit!9110 (_2!8875 lt!295144))) lt!296291))))

(declare-fun b!190704 () Bool)

(declare-fun res!159098 () Bool)

(assert (=> b!190704 (=> (not res!159098) (not e!131546))))

(declare-fun lt!296248 () (_ BitVec 64))

(declare-fun lt!296262 () (_ BitVec 64))

(assert (=> b!190704 (= res!159098 (= (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!296278))) (currentByte!9115 (_2!8875 lt!296278)) (currentBit!9110 (_2!8875 lt!296278))) (bvsub lt!296248 lt!296262)))))

(assert (=> b!190704 (or (= (bvand lt!296248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296262 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296248 lt!296262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190704 (= lt!296262 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!296281 () (_ BitVec 64))

(declare-fun lt!296251 () (_ BitVec 64))

(assert (=> b!190704 (= lt!296248 (bvadd lt!296281 lt!296251))))

(assert (=> b!190704 (or (not (= (bvand lt!296281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296251 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!296281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!296281 lt!296251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190704 (= lt!296251 ((_ sign_extend 32) nBits!348))))

(assert (=> b!190704 (= lt!296281 (bitIndex!0 (size!4369 (buf!4843 (_2!8875 lt!295144))) (currentByte!9115 (_2!8875 lt!295144)) (currentBit!9110 (_2!8875 lt!295144))))))

(declare-fun b!190705 () Bool)

(assert (=> b!190705 (= e!131543 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!190706 () Bool)

(declare-fun res!159095 () Bool)

(assert (=> b!190706 (= res!159095 (isPrefixOf!0 (_2!8875 lt!295144) (_2!8875 lt!296258)))))

(assert (=> b!190706 (=> (not res!159095) (not e!131544))))

(declare-fun b!190707 () Bool)

(assert (=> b!190707 (= e!131550 (= (_1!8877 lt!296263) (_2!8876 lt!296252)))))

(assert (= (and d!65327 c!9642) b!190701))

(assert (= (and d!65327 (not c!9642)) b!190695))

(assert (= (and b!190695 res!159101) b!190693))

(assert (= (and b!190693 res!159103) b!190706))

(assert (= (and b!190706 res!159095) b!190700))

(assert (= (and b!190700 res!159102) b!190698))

(assert (= (and b!190695 res!159100) b!190694))

(assert (= (and b!190695 c!9643) b!190705))

(assert (= (and b!190695 (not c!9643)) b!190702))

(assert (= (and b!190695 res!159097) b!190707))

(assert (= (or b!190701 b!190695) bm!3032))

(assert (= (and d!65327 res!159105) b!190692))

(assert (= (and b!190692 res!159099) b!190704))

(assert (= (and b!190704 res!159098) b!190699))

(assert (= (and b!190699 res!159096) b!190697))

(assert (= (and b!190697 res!159104) b!190703))

(assert (= (and b!190697 res!159106) b!190696))

(declare-fun m!296201 () Bool)

(assert (=> b!190700 m!296201))

(assert (=> b!190700 m!296201))

(declare-fun m!296203 () Bool)

(assert (=> b!190700 m!296203))

(declare-fun m!296205 () Bool)

(assert (=> d!65327 m!296205))

(declare-fun m!296207 () Bool)

(assert (=> b!190693 m!296207))

(assert (=> b!190693 m!295375))

(declare-fun m!296209 () Bool)

(assert (=> b!190704 m!296209))

(assert (=> b!190704 m!295375))

(declare-fun m!296211 () Bool)

(assert (=> b!190699 m!296211))

(assert (=> b!190701 m!295863))

(declare-fun m!296213 () Bool)

(assert (=> b!190695 m!296213))

(declare-fun m!296215 () Bool)

(assert (=> b!190695 m!296215))

(declare-fun m!296217 () Bool)

(assert (=> b!190695 m!296217))

(assert (=> b!190695 m!295375))

(declare-fun m!296219 () Bool)

(assert (=> b!190695 m!296219))

(declare-fun m!296221 () Bool)

(assert (=> b!190695 m!296221))

(declare-fun m!296223 () Bool)

(assert (=> b!190695 m!296223))

(declare-fun m!296225 () Bool)

(assert (=> b!190695 m!296225))

(declare-fun m!296227 () Bool)

(assert (=> b!190695 m!296227))

(declare-fun m!296229 () Bool)

(assert (=> b!190695 m!296229))

(declare-fun m!296231 () Bool)

(assert (=> b!190695 m!296231))

(declare-fun m!296233 () Bool)

(assert (=> b!190695 m!296233))

(declare-fun m!296235 () Bool)

(assert (=> b!190695 m!296235))

(declare-fun m!296237 () Bool)

(assert (=> b!190695 m!296237))

(declare-fun m!296239 () Bool)

(assert (=> b!190695 m!296239))

(declare-fun m!296241 () Bool)

(assert (=> b!190695 m!296241))

(declare-fun m!296243 () Bool)

(assert (=> b!190695 m!296243))

(declare-fun m!296245 () Bool)

(assert (=> b!190695 m!296245))

(declare-fun m!296247 () Bool)

(assert (=> b!190695 m!296247))

(declare-fun m!296249 () Bool)

(assert (=> b!190695 m!296249))

(declare-fun m!296251 () Bool)

(assert (=> b!190695 m!296251))

(declare-fun m!296253 () Bool)

(assert (=> b!190695 m!296253))

(declare-fun m!296255 () Bool)

(assert (=> b!190695 m!296255))

(declare-fun m!296257 () Bool)

(assert (=> b!190695 m!296257))

(declare-fun m!296259 () Bool)

(assert (=> b!190695 m!296259))

(declare-fun m!296261 () Bool)

(assert (=> b!190695 m!296261))

(declare-fun m!296263 () Bool)

(assert (=> b!190695 m!296263))

(declare-fun m!296265 () Bool)

(assert (=> b!190695 m!296265))

(declare-fun m!296267 () Bool)

(assert (=> b!190695 m!296267))

(declare-fun m!296269 () Bool)

(assert (=> b!190695 m!296269))

(declare-fun m!296271 () Bool)

(assert (=> b!190695 m!296271))

(declare-fun m!296273 () Bool)

(assert (=> b!190695 m!296273))

(declare-fun m!296275 () Bool)

(assert (=> b!190695 m!296275))

(assert (=> b!190695 m!296227))

(declare-fun m!296277 () Bool)

(assert (=> b!190703 m!296277))

(declare-fun m!296279 () Bool)

(assert (=> bm!3032 m!296279))

(assert (=> b!190697 m!296249))

(assert (=> b!190697 m!296223))

(declare-fun m!296281 () Bool)

(assert (=> b!190697 m!296281))

(declare-fun m!296283 () Bool)

(assert (=> b!190697 m!296283))

(declare-fun m!296285 () Bool)

(assert (=> b!190697 m!296285))

(declare-fun m!296287 () Bool)

(assert (=> b!190697 m!296287))

(declare-fun m!296289 () Bool)

(assert (=> b!190706 m!296289))

(declare-fun m!296291 () Bool)

(assert (=> b!190698 m!296291))

(assert (=> b!190698 m!296207))

(assert (=> b!190233 d!65327))

(assert (=> b!190231 d!65235))

(declare-fun d!65391 () Bool)

(assert (=> d!65391 (= (invariant!0 (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204) (size!4369 (buf!4843 (_2!8875 lt!295143)))) (and (bvsge (currentBit!9110 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9110 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9115 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9115 thiss!1204) (size!4369 (buf!4843 (_2!8875 lt!295143)))) (and (= (currentBit!9110 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9115 thiss!1204) (size!4369 (buf!4843 (_2!8875 lt!295143))))))))))

(assert (=> b!190221 d!65391))

(declare-fun d!65393 () Bool)

(assert (=> d!65393 (= (array_inv!4110 (buf!4843 thiss!1204)) (bvsge (size!4369 (buf!4843 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!190230 d!65393))

(declare-fun d!65395 () Bool)

(assert (=> d!65395 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9110 thiss!1204) (currentByte!9115 thiss!1204) (size!4369 (buf!4843 thiss!1204))))))

(declare-fun bs!16254 () Bool)

(assert (= bs!16254 d!65395))

(assert (=> bs!16254 m!295427))

(assert (=> start!41018 d!65395))

(declare-fun d!65397 () Bool)

(declare-fun e!131551 () Bool)

(assert (=> d!65397 e!131551))

(declare-fun res!159107 () Bool)

(assert (=> d!65397 (=> (not res!159107) (not e!131551))))

(declare-fun lt!296303 () (_ BitVec 64))

(declare-fun lt!296302 () BitStream!7846)

(assert (=> d!65397 (= res!159107 (= (bvadd lt!296303 (bvsub lt!295140 lt!295161)) (bitIndex!0 (size!4369 (buf!4843 lt!296302)) (currentByte!9115 lt!296302) (currentBit!9110 lt!296302))))))

(assert (=> d!65397 (or (not (= (bvand lt!296303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295140 lt!295161) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!296303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!296303 (bvsub lt!295140 lt!295161)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65397 (= lt!296303 (bitIndex!0 (size!4369 (buf!4843 (_2!8876 lt!295138))) (currentByte!9115 (_2!8876 lt!295138)) (currentBit!9110 (_2!8876 lt!295138))))))

(assert (=> d!65397 (= lt!296302 (_2!8875 (moveBitIndex!0 (_2!8876 lt!295138) (bvsub lt!295140 lt!295161))))))

(assert (=> d!65397 (moveBitIndexPrecond!0 (_2!8876 lt!295138) (bvsub lt!295140 lt!295161))))

(assert (=> d!65397 (= (withMovedBitIndex!0 (_2!8876 lt!295138) (bvsub lt!295140 lt!295161)) lt!296302)))

(declare-fun b!190708 () Bool)

(assert (=> b!190708 (= e!131551 (= (size!4369 (buf!4843 (_2!8876 lt!295138))) (size!4369 (buf!4843 lt!296302))))))

(assert (= (and d!65397 res!159107) b!190708))

(declare-fun m!296293 () Bool)

(assert (=> d!65397 m!296293))

(assert (=> d!65397 m!295447))

(declare-fun m!296295 () Bool)

(assert (=> d!65397 m!296295))

(declare-fun m!296297 () Bool)

(assert (=> d!65397 m!296297))

(assert (=> b!190219 d!65397))

(declare-fun d!65399 () Bool)

(assert (=> d!65399 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4369 (buf!4843 thiss!1204))) ((_ sign_extend 32) (currentByte!9115 thiss!1204)) ((_ sign_extend 32) (currentBit!9110 thiss!1204)) lt!295159) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4369 (buf!4843 thiss!1204))) ((_ sign_extend 32) (currentByte!9115 thiss!1204)) ((_ sign_extend 32) (currentBit!9110 thiss!1204))) lt!295159))))

(declare-fun bs!16255 () Bool)

(assert (= bs!16255 d!65399))

(assert (=> bs!16255 m!295789))

(assert (=> b!190220 d!65399))

(push 1)

(assert (not d!65293))

(assert (not d!65255))

(assert (not d!65263))

(assert (not b!190557))

(assert (not b!190515))

(assert (not b!190697))

(assert (not d!65317))

(assert (not d!65265))

(assert (not b!190700))

(assert (not d!65245))

(assert (not d!65261))

(assert (not b!190542))

(assert (not d!65297))

(assert (not b!190473))

(assert (not bm!3032))

(assert (not d!65309))

(assert (not d!65295))

(assert (not d!65395))

(assert (not d!65327))

(assert (not b!190520))

(assert (not d!65299))

(assert (not d!65303))

(assert (not d!65253))

(assert (not d!65247))

(assert (not b!190500))

(assert (not d!65291))

(assert (not d!65285))

(assert (not b!190458))

(assert (not b!190541))

(assert (not d!65399))

(assert (not d!65313))

(assert (not b!190460))

(assert (not d!65307))

(assert (not b!190559))

(assert (not b!190539))

(assert (not d!65301))

(assert (not b!190513))

(assert (not d!65237))

(assert (not d!65257))

(assert (not b!190704))

(assert (not b!190503))

(assert (not b!190703))

(assert (not d!65269))

(assert (not d!65325))

(assert (not b!190693))

(assert (not d!65273))

(assert (not d!65239))

(assert (not d!65267))

(assert (not b!190504))

(assert (not b!190698))

(assert (not d!65241))

(assert (not b!190701))

(assert (not b!190695))

(assert (not b!190502))

(assert (not b!190706))

(assert (not d!65251))

(assert (not b!190540))

(assert (not b!190511))

(assert (not d!65397))

(assert (not b!190518))

(assert (not d!65311))

(assert (not b!190699))

(assert (not b!190514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

