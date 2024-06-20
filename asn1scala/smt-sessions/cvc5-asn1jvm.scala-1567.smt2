; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44316 () Bool)

(assert start!44316)

(declare-fun b!211083 () Bool)

(declare-fun e!143955 () Bool)

(declare-fun e!143956 () Bool)

(assert (=> b!211083 (= e!143955 e!143956)))

(declare-fun res!177256 () Bool)

(assert (=> b!211083 (=> (not res!177256) (not e!143956))))

(declare-fun lt!331991 () (_ BitVec 64))

(declare-fun lt!331989 () (_ BitVec 64))

(assert (=> b!211083 (= res!177256 (= lt!331991 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!331989)))))

(declare-datatypes ((array!10499 0))(
  ( (array!10500 (arr!5542 (Array (_ BitVec 32) (_ BitVec 8))) (size!4612 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8332 0))(
  ( (BitStream!8333 (buf!5135 array!10499) (currentByte!9689 (_ BitVec 32)) (currentBit!9684 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15052 0))(
  ( (Unit!15053) )
))
(declare-datatypes ((tuple2!18074 0))(
  ( (tuple2!18075 (_1!9692 Unit!15052) (_2!9692 BitStream!8332)) )
))
(declare-fun lt!331988 () tuple2!18074)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211083 (= lt!331991 (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))))))

(declare-fun thiss!1204 () BitStream!8332)

(assert (=> b!211083 (= lt!331989 (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)))))

(declare-fun lt!331998 () (_ BitVec 64))

(declare-fun b!211084 () Bool)

(declare-datatypes ((tuple2!18076 0))(
  ( (tuple2!18077 (_1!9693 BitStream!8332) (_2!9693 BitStream!8332)) )
))
(declare-fun lt!332007 () tuple2!18076)

(declare-fun e!143954 () Bool)

(declare-fun lt!331994 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8332 (_ BitVec 64)) BitStream!8332)

(assert (=> b!211084 (= e!143954 (= (_1!9693 lt!332007) (withMovedBitIndex!0 (_2!9693 lt!332007) (bvsub lt!331994 lt!331998))))))

(declare-fun e!143953 () Bool)

(assert (=> b!211084 e!143953))

(declare-fun res!177246 () Bool)

(assert (=> b!211084 (=> (not res!177246) (not e!143953))))

(declare-datatypes ((tuple2!18078 0))(
  ( (tuple2!18079 (_1!9694 BitStream!8332) (_2!9694 (_ BitVec 64))) )
))
(declare-fun lt!332004 () tuple2!18078)

(declare-fun lt!331993 () tuple2!18078)

(assert (=> b!211084 (= res!177246 (and (= (_2!9694 lt!332004) (_2!9694 lt!331993)) (= (_1!9694 lt!332004) (_1!9694 lt!331993))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!332006 () (_ BitVec 64))

(declare-fun lt!332003 () tuple2!18076)

(declare-fun lt!332002 () Unit!15052)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15052)

(assert (=> b!211084 (= lt!332002 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9693 lt!332003) nBits!348 i!590 lt!332006))))

(declare-fun lt!332008 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18078)

(assert (=> b!211084 (= lt!331993 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9693 lt!332003) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332008))))

(declare-fun b!211086 () Bool)

(declare-fun e!143963 () Bool)

(assert (=> b!211086 (= e!143956 e!143963)))

(declare-fun res!177248 () Bool)

(assert (=> b!211086 (=> (not res!177248) (not e!143963))))

(declare-datatypes ((tuple2!18080 0))(
  ( (tuple2!18081 (_1!9695 BitStream!8332) (_2!9695 Bool)) )
))
(declare-fun lt!332012 () tuple2!18080)

(declare-fun lt!332009 () Bool)

(assert (=> b!211086 (= res!177248 (and (= (_2!9695 lt!332012) lt!332009) (= (_1!9695 lt!332012) (_2!9692 lt!331988))))))

(declare-fun readBitPure!0 (BitStream!8332) tuple2!18080)

(declare-fun readerFrom!0 (BitStream!8332 (_ BitVec 32) (_ BitVec 32)) BitStream!8332)

(assert (=> b!211086 (= lt!332012 (readBitPure!0 (readerFrom!0 (_2!9692 lt!331988) (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204))))))

(declare-fun b!211087 () Bool)

(declare-fun res!177260 () Bool)

(declare-fun e!143959 () Bool)

(assert (=> b!211087 (=> (not res!177260) (not e!143959))))

(assert (=> b!211087 (= res!177260 (not (= i!590 nBits!348)))))

(declare-fun b!211088 () Bool)

(declare-fun e!143962 () Bool)

(declare-fun lt!332000 () tuple2!18074)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!211088 (= e!143962 (invariant!0 (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204) (size!4612 (buf!5135 (_2!9692 lt!332000)))))))

(declare-fun b!211089 () Bool)

(declare-fun res!177243 () Bool)

(declare-fun e!143964 () Bool)

(assert (=> b!211089 (=> res!177243 e!143964)))

(assert (=> b!211089 (= res!177243 (not (invariant!0 (currentBit!9684 (_2!9692 lt!332000)) (currentByte!9689 (_2!9692 lt!332000)) (size!4612 (buf!5135 (_2!9692 lt!332000))))))))

(declare-fun b!211090 () Bool)

(declare-fun e!143961 () Bool)

(declare-fun array_inv!4353 (array!10499) Bool)

(assert (=> b!211090 (= e!143961 (array_inv!4353 (buf!5135 thiss!1204)))))

(declare-fun b!211091 () Bool)

(declare-fun res!177247 () Bool)

(assert (=> b!211091 (=> res!177247 e!143964)))

(declare-fun isPrefixOf!0 (BitStream!8332 BitStream!8332) Bool)

(assert (=> b!211091 (= res!177247 (not (isPrefixOf!0 (_2!9692 lt!331988) (_2!9692 lt!332000))))))

(declare-fun res!177244 () Bool)

(declare-fun e!143952 () Bool)

(assert (=> start!44316 (=> (not res!177244) (not e!143952))))

(assert (=> start!44316 (= res!177244 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44316 e!143952))

(assert (=> start!44316 true))

(declare-fun inv!12 (BitStream!8332) Bool)

(assert (=> start!44316 (and (inv!12 thiss!1204) e!143961)))

(declare-fun b!211085 () Bool)

(declare-fun res!177253 () Bool)

(assert (=> b!211085 (=> (not res!177253) (not e!143959))))

(assert (=> b!211085 (= res!177253 (invariant!0 (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204) (size!4612 (buf!5135 thiss!1204))))))

(declare-fun b!211092 () Bool)

(assert (=> b!211092 (= e!143964 e!143954)))

(declare-fun res!177251 () Bool)

(assert (=> b!211092 (=> res!177251 e!143954)))

(assert (=> b!211092 (= res!177251 (not (= (_1!9694 (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!332007) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332008)) (_2!9693 lt!332007))))))

(declare-fun lt!332005 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211092 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988))) lt!332005)))

(declare-fun lt!331987 () Unit!15052)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8332 array!10499 (_ BitVec 64)) Unit!15052)

(assert (=> b!211092 (= lt!331987 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9692 lt!331988) (buf!5135 (_2!9692 lt!332000)) lt!332005))))

(assert (=> b!211092 (= lt!332005 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!331997 () tuple2!18080)

(declare-fun lt!331995 () (_ BitVec 64))

(assert (=> b!211092 (= lt!332008 (bvor lt!332006 (ite (_2!9695 lt!331997) lt!331995 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211092 (= lt!332004 (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!332003) nBits!348 i!590 lt!332006))))

(declare-fun lt!331996 () (_ BitVec 64))

(assert (=> b!211092 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))) ((_ sign_extend 32) (currentByte!9689 thiss!1204)) ((_ sign_extend 32) (currentBit!9684 thiss!1204)) lt!331996)))

(declare-fun lt!331999 () Unit!15052)

(assert (=> b!211092 (= lt!331999 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5135 (_2!9692 lt!332000)) lt!331996))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211092 (= lt!332006 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!211092 (= (_2!9695 lt!331997) lt!332009)))

(assert (=> b!211092 (= lt!331997 (readBitPure!0 (_1!9693 lt!332003)))))

(declare-fun reader!0 (BitStream!8332 BitStream!8332) tuple2!18076)

(assert (=> b!211092 (= lt!332007 (reader!0 (_2!9692 lt!331988) (_2!9692 lt!332000)))))

(assert (=> b!211092 (= lt!332003 (reader!0 thiss!1204 (_2!9692 lt!332000)))))

(declare-fun e!143957 () Bool)

(assert (=> b!211092 e!143957))

(declare-fun res!177257 () Bool)

(assert (=> b!211092 (=> (not res!177257) (not e!143957))))

(declare-fun lt!332001 () tuple2!18080)

(declare-fun lt!332011 () tuple2!18080)

(assert (=> b!211092 (= res!177257 (= (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!332001))) (currentByte!9689 (_1!9695 lt!332001)) (currentBit!9684 (_1!9695 lt!332001))) (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!332011))) (currentByte!9689 (_1!9695 lt!332011)) (currentBit!9684 (_1!9695 lt!332011)))))))

(declare-fun lt!332010 () Unit!15052)

(declare-fun lt!331992 () BitStream!8332)

(declare-fun readBitPrefixLemma!0 (BitStream!8332 BitStream!8332) Unit!15052)

(assert (=> b!211092 (= lt!332010 (readBitPrefixLemma!0 lt!331992 (_2!9692 lt!332000)))))

(assert (=> b!211092 (= lt!332011 (readBitPure!0 (BitStream!8333 (buf!5135 (_2!9692 lt!332000)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204))))))

(assert (=> b!211092 (= lt!332001 (readBitPure!0 lt!331992))))

(assert (=> b!211092 e!143962))

(declare-fun res!177249 () Bool)

(assert (=> b!211092 (=> (not res!177249) (not e!143962))))

(assert (=> b!211092 (= res!177249 (invariant!0 (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204) (size!4612 (buf!5135 (_2!9692 lt!331988)))))))

(assert (=> b!211092 (= lt!331992 (BitStream!8333 (buf!5135 (_2!9692 lt!331988)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)))))

(declare-fun b!211093 () Bool)

(assert (=> b!211093 (= e!143952 e!143959)))

(declare-fun res!177254 () Bool)

(assert (=> b!211093 (=> (not res!177254) (not e!143959))))

(assert (=> b!211093 (= res!177254 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 thiss!1204))) ((_ sign_extend 32) (currentByte!9689 thiss!1204)) ((_ sign_extend 32) (currentBit!9684 thiss!1204)) lt!331996))))

(assert (=> b!211093 (= lt!331996 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!211094 () Bool)

(assert (=> b!211094 (= e!143957 (= (_2!9695 lt!332001) (_2!9695 lt!332011)))))

(declare-fun b!211095 () Bool)

(assert (=> b!211095 (= e!143963 (= (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!332012))) (currentByte!9689 (_1!9695 lt!332012)) (currentBit!9684 (_1!9695 lt!332012))) lt!331991))))

(declare-fun b!211096 () Bool)

(declare-fun res!177258 () Bool)

(assert (=> b!211096 (=> res!177258 e!143964)))

(declare-fun lt!331990 () (_ BitVec 64))

(assert (=> b!211096 (= res!177258 (or (not (= (size!4612 (buf!5135 (_2!9692 lt!332000))) (size!4612 (buf!5135 thiss!1204)))) (not (= lt!331998 (bvsub (bvadd lt!331990 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!211097 () Bool)

(declare-fun res!177252 () Bool)

(assert (=> b!211097 (=> (not res!177252) (not e!143956))))

(assert (=> b!211097 (= res!177252 (isPrefixOf!0 thiss!1204 (_2!9692 lt!331988)))))

(declare-fun b!211098 () Bool)

(assert (=> b!211098 (= e!143953 (= (_1!9693 lt!332003) (withMovedBitIndex!0 (_2!9693 lt!332003) (bvsub lt!331990 lt!331998))))))

(declare-fun b!211099 () Bool)

(declare-fun e!143960 () Bool)

(assert (=> b!211099 (= e!143959 (not e!143960))))

(declare-fun res!177250 () Bool)

(assert (=> b!211099 (=> res!177250 e!143960)))

(assert (=> b!211099 (= res!177250 (not (= lt!331994 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!331990))))))

(assert (=> b!211099 (= lt!331994 (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))))))

(assert (=> b!211099 (= lt!331990 (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)))))

(assert (=> b!211099 e!143955))

(declare-fun res!177245 () Bool)

(assert (=> b!211099 (=> (not res!177245) (not e!143955))))

(assert (=> b!211099 (= res!177245 (= (size!4612 (buf!5135 thiss!1204)) (size!4612 (buf!5135 (_2!9692 lt!331988)))))))

(declare-fun appendBit!0 (BitStream!8332 Bool) tuple2!18074)

(assert (=> b!211099 (= lt!331988 (appendBit!0 thiss!1204 lt!332009))))

(assert (=> b!211099 (= lt!332009 (not (= (bvand v!189 lt!331995) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211099 (= lt!331995 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!211100 () Bool)

(declare-fun res!177259 () Bool)

(assert (=> b!211100 (=> res!177259 e!143964)))

(assert (=> b!211100 (= res!177259 (not (isPrefixOf!0 thiss!1204 (_2!9692 lt!331988))))))

(declare-fun b!211101 () Bool)

(assert (=> b!211101 (= e!143960 e!143964)))

(declare-fun res!177255 () Bool)

(assert (=> b!211101 (=> res!177255 e!143964)))

(assert (=> b!211101 (= res!177255 (not (= lt!331998 (bvsub (bvsub (bvadd lt!331994 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!211101 (= lt!331998 (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!332000))) (currentByte!9689 (_2!9692 lt!332000)) (currentBit!9684 (_2!9692 lt!332000))))))

(assert (=> b!211101 (isPrefixOf!0 thiss!1204 (_2!9692 lt!332000))))

(declare-fun lt!331986 () Unit!15052)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8332 BitStream!8332 BitStream!8332) Unit!15052)

(assert (=> b!211101 (= lt!331986 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9692 lt!331988) (_2!9692 lt!332000)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8332 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18074)

(assert (=> b!211101 (= lt!332000 (appendBitsLSBFirstLoopTR!0 (_2!9692 lt!331988) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!44316 res!177244) b!211093))

(assert (= (and b!211093 res!177254) b!211085))

(assert (= (and b!211085 res!177253) b!211087))

(assert (= (and b!211087 res!177260) b!211099))

(assert (= (and b!211099 res!177245) b!211083))

(assert (= (and b!211083 res!177256) b!211097))

(assert (= (and b!211097 res!177252) b!211086))

(assert (= (and b!211086 res!177248) b!211095))

(assert (= (and b!211099 (not res!177250)) b!211101))

(assert (= (and b!211101 (not res!177255)) b!211089))

(assert (= (and b!211089 (not res!177243)) b!211096))

(assert (= (and b!211096 (not res!177258)) b!211091))

(assert (= (and b!211091 (not res!177247)) b!211100))

(assert (= (and b!211100 (not res!177259)) b!211092))

(assert (= (and b!211092 res!177249) b!211088))

(assert (= (and b!211092 res!177257) b!211094))

(assert (= (and b!211092 (not res!177251)) b!211084))

(assert (= (and b!211084 res!177246) b!211098))

(assert (= start!44316 b!211090))

(declare-fun m!325191 () Bool)

(assert (=> b!211095 m!325191))

(declare-fun m!325193 () Bool)

(assert (=> b!211086 m!325193))

(assert (=> b!211086 m!325193))

(declare-fun m!325195 () Bool)

(assert (=> b!211086 m!325195))

(declare-fun m!325197 () Bool)

(assert (=> b!211101 m!325197))

(declare-fun m!325199 () Bool)

(assert (=> b!211101 m!325199))

(declare-fun m!325201 () Bool)

(assert (=> b!211101 m!325201))

(declare-fun m!325203 () Bool)

(assert (=> b!211101 m!325203))

(declare-fun m!325205 () Bool)

(assert (=> b!211097 m!325205))

(declare-fun m!325207 () Bool)

(assert (=> start!44316 m!325207))

(declare-fun m!325209 () Bool)

(assert (=> b!211093 m!325209))

(declare-fun m!325211 () Bool)

(assert (=> b!211084 m!325211))

(declare-fun m!325213 () Bool)

(assert (=> b!211084 m!325213))

(declare-fun m!325215 () Bool)

(assert (=> b!211084 m!325215))

(assert (=> b!211084 m!325215))

(declare-fun m!325217 () Bool)

(assert (=> b!211084 m!325217))

(declare-fun m!325219 () Bool)

(assert (=> b!211090 m!325219))

(declare-fun m!325221 () Bool)

(assert (=> b!211083 m!325221))

(declare-fun m!325223 () Bool)

(assert (=> b!211083 m!325223))

(declare-fun m!325225 () Bool)

(assert (=> b!211088 m!325225))

(assert (=> b!211100 m!325205))

(assert (=> b!211099 m!325221))

(assert (=> b!211099 m!325223))

(declare-fun m!325227 () Bool)

(assert (=> b!211099 m!325227))

(declare-fun m!325229 () Bool)

(assert (=> b!211098 m!325229))

(declare-fun m!325231 () Bool)

(assert (=> b!211089 m!325231))

(declare-fun m!325233 () Bool)

(assert (=> b!211085 m!325233))

(declare-fun m!325235 () Bool)

(assert (=> b!211092 m!325235))

(declare-fun m!325237 () Bool)

(assert (=> b!211092 m!325237))

(declare-fun m!325239 () Bool)

(assert (=> b!211092 m!325239))

(declare-fun m!325241 () Bool)

(assert (=> b!211092 m!325241))

(declare-fun m!325243 () Bool)

(assert (=> b!211092 m!325243))

(declare-fun m!325245 () Bool)

(assert (=> b!211092 m!325245))

(declare-fun m!325247 () Bool)

(assert (=> b!211092 m!325247))

(declare-fun m!325249 () Bool)

(assert (=> b!211092 m!325249))

(declare-fun m!325251 () Bool)

(assert (=> b!211092 m!325251))

(declare-fun m!325253 () Bool)

(assert (=> b!211092 m!325253))

(declare-fun m!325255 () Bool)

(assert (=> b!211092 m!325255))

(declare-fun m!325257 () Bool)

(assert (=> b!211092 m!325257))

(declare-fun m!325259 () Bool)

(assert (=> b!211092 m!325259))

(declare-fun m!325261 () Bool)

(assert (=> b!211092 m!325261))

(declare-fun m!325263 () Bool)

(assert (=> b!211092 m!325263))

(declare-fun m!325265 () Bool)

(assert (=> b!211092 m!325265))

(declare-fun m!325267 () Bool)

(assert (=> b!211091 m!325267))

(push 1)

(assert (not b!211088))

(assert (not b!211090))

(assert (not b!211083))

(assert (not b!211089))

(assert (not b!211098))

(assert (not b!211101))

(assert (not b!211097))

(assert (not b!211086))

(assert (not b!211085))

(assert (not b!211093))

(assert (not b!211092))

(assert (not b!211100))

(assert (not b!211084))

(assert (not b!211095))

(assert (not start!44316))

(assert (not b!211099))

(assert (not b!211091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!71527 () Bool)

(declare-fun res!177421 () Bool)

(declare-fun e!144075 () Bool)

(assert (=> d!71527 (=> (not res!177421) (not e!144075))))

(assert (=> d!71527 (= res!177421 (= (size!4612 (buf!5135 thiss!1204)) (size!4612 (buf!5135 (_2!9692 lt!331988)))))))

(assert (=> d!71527 (= (isPrefixOf!0 thiss!1204 (_2!9692 lt!331988)) e!144075)))

(declare-fun b!211267 () Bool)

(declare-fun res!177419 () Bool)

(assert (=> b!211267 (=> (not res!177419) (not e!144075))))

(assert (=> b!211267 (= res!177419 (bvsle (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)) (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988)))))))

(declare-fun b!211268 () Bool)

(declare-fun e!144074 () Bool)

(assert (=> b!211268 (= e!144075 e!144074)))

(declare-fun res!177420 () Bool)

(assert (=> b!211268 (=> res!177420 e!144074)))

(assert (=> b!211268 (= res!177420 (= (size!4612 (buf!5135 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211269 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10499 array!10499 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211269 (= e!144074 (arrayBitRangesEq!0 (buf!5135 thiss!1204) (buf!5135 (_2!9692 lt!331988)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204))))))

(assert (= (and d!71527 res!177421) b!211267))

(assert (= (and b!211267 res!177419) b!211268))

(assert (= (and b!211268 (not res!177420)) b!211269))

(assert (=> b!211267 m!325223))

(assert (=> b!211267 m!325221))

(assert (=> b!211269 m!325223))

(assert (=> b!211269 m!325223))

(declare-fun m!325489 () Bool)

(assert (=> b!211269 m!325489))

(assert (=> b!211097 d!71527))

(declare-fun d!71529 () Bool)

(declare-datatypes ((tuple2!18102 0))(
  ( (tuple2!18103 (_1!9706 Bool) (_2!9706 BitStream!8332)) )
))
(declare-fun lt!332259 () tuple2!18102)

(declare-fun readBit!0 (BitStream!8332) tuple2!18102)

(assert (=> d!71529 (= lt!332259 (readBit!0 (readerFrom!0 (_2!9692 lt!331988) (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204))))))

(assert (=> d!71529 (= (readBitPure!0 (readerFrom!0 (_2!9692 lt!331988) (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204))) (tuple2!18081 (_2!9706 lt!332259) (_1!9706 lt!332259)))))

(declare-fun bs!17555 () Bool)

(assert (= bs!17555 d!71529))

(assert (=> bs!17555 m!325193))

(declare-fun m!325491 () Bool)

(assert (=> bs!17555 m!325491))

(assert (=> b!211086 d!71529))

(declare-fun d!71531 () Bool)

(declare-fun e!144078 () Bool)

(assert (=> d!71531 e!144078))

(declare-fun res!177425 () Bool)

(assert (=> d!71531 (=> (not res!177425) (not e!144078))))

(assert (=> d!71531 (= res!177425 (invariant!0 (currentBit!9684 (_2!9692 lt!331988)) (currentByte!9689 (_2!9692 lt!331988)) (size!4612 (buf!5135 (_2!9692 lt!331988)))))))

(assert (=> d!71531 (= (readerFrom!0 (_2!9692 lt!331988) (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204)) (BitStream!8333 (buf!5135 (_2!9692 lt!331988)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)))))

(declare-fun b!211272 () Bool)

(assert (=> b!211272 (= e!144078 (invariant!0 (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204) (size!4612 (buf!5135 (_2!9692 lt!331988)))))))

(assert (= (and d!71531 res!177425) b!211272))

(declare-fun m!325493 () Bool)

(assert (=> d!71531 m!325493))

(assert (=> b!211272 m!325249))

(assert (=> b!211086 d!71531))

(declare-fun d!71533 () Bool)

(assert (=> d!71533 (= (invariant!0 (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204) (size!4612 (buf!5135 thiss!1204))) (and (bvsge (currentBit!9684 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9684 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9689 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9689 thiss!1204) (size!4612 (buf!5135 thiss!1204))) (and (= (currentBit!9684 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9689 thiss!1204) (size!4612 (buf!5135 thiss!1204)))))))))

(assert (=> b!211085 d!71533))

(declare-fun d!71535 () Bool)

(declare-fun e!144081 () Bool)

(assert (=> d!71535 e!144081))

(declare-fun res!177430 () Bool)

(assert (=> d!71535 (=> (not res!177430) (not e!144081))))

(declare-fun lt!332274 () (_ BitVec 64))

(declare-fun lt!332276 () (_ BitVec 64))

(declare-fun lt!332275 () (_ BitVec 64))

(assert (=> d!71535 (= res!177430 (= lt!332276 (bvsub lt!332274 lt!332275)))))

(assert (=> d!71535 (or (= (bvand lt!332274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332275 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332274 lt!332275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71535 (= lt!332275 (remainingBits!0 ((_ sign_extend 32) (size!4612 (buf!5135 (_1!9695 lt!332012)))) ((_ sign_extend 32) (currentByte!9689 (_1!9695 lt!332012))) ((_ sign_extend 32) (currentBit!9684 (_1!9695 lt!332012)))))))

(declare-fun lt!332272 () (_ BitVec 64))

(declare-fun lt!332277 () (_ BitVec 64))

(assert (=> d!71535 (= lt!332274 (bvmul lt!332272 lt!332277))))

(assert (=> d!71535 (or (= lt!332272 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332277 (bvsdiv (bvmul lt!332272 lt!332277) lt!332272)))))

(assert (=> d!71535 (= lt!332277 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71535 (= lt!332272 ((_ sign_extend 32) (size!4612 (buf!5135 (_1!9695 lt!332012)))))))

(assert (=> d!71535 (= lt!332276 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9689 (_1!9695 lt!332012))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9684 (_1!9695 lt!332012)))))))

(assert (=> d!71535 (invariant!0 (currentBit!9684 (_1!9695 lt!332012)) (currentByte!9689 (_1!9695 lt!332012)) (size!4612 (buf!5135 (_1!9695 lt!332012))))))

(assert (=> d!71535 (= (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!332012))) (currentByte!9689 (_1!9695 lt!332012)) (currentBit!9684 (_1!9695 lt!332012))) lt!332276)))

(declare-fun b!211277 () Bool)

(declare-fun res!177431 () Bool)

(assert (=> b!211277 (=> (not res!177431) (not e!144081))))

(assert (=> b!211277 (= res!177431 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332276))))

(declare-fun b!211278 () Bool)

(declare-fun lt!332273 () (_ BitVec 64))

(assert (=> b!211278 (= e!144081 (bvsle lt!332276 (bvmul lt!332273 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211278 (or (= lt!332273 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332273 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332273)))))

(assert (=> b!211278 (= lt!332273 ((_ sign_extend 32) (size!4612 (buf!5135 (_1!9695 lt!332012)))))))

(assert (= (and d!71535 res!177430) b!211277))

(assert (= (and b!211277 res!177431) b!211278))

(declare-fun m!325495 () Bool)

(assert (=> d!71535 m!325495))

(declare-fun m!325497 () Bool)

(assert (=> d!71535 m!325497))

(assert (=> b!211095 d!71535))

(declare-fun d!71537 () Bool)

(declare-fun e!144084 () Bool)

(assert (=> d!71537 e!144084))

(declare-fun res!177434 () Bool)

(assert (=> d!71537 (=> (not res!177434) (not e!144084))))

(declare-fun lt!332282 () BitStream!8332)

(declare-fun lt!332283 () (_ BitVec 64))

(assert (=> d!71537 (= res!177434 (= (bvadd lt!332283 (bvsub lt!331994 lt!331998)) (bitIndex!0 (size!4612 (buf!5135 lt!332282)) (currentByte!9689 lt!332282) (currentBit!9684 lt!332282))))))

(assert (=> d!71537 (or (not (= (bvand lt!332283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331994 lt!331998) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!332283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!332283 (bvsub lt!331994 lt!331998)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71537 (= lt!332283 (bitIndex!0 (size!4612 (buf!5135 (_2!9693 lt!332007))) (currentByte!9689 (_2!9693 lt!332007)) (currentBit!9684 (_2!9693 lt!332007))))))

(declare-fun moveBitIndex!0 (BitStream!8332 (_ BitVec 64)) tuple2!18074)

(assert (=> d!71537 (= lt!332282 (_2!9692 (moveBitIndex!0 (_2!9693 lt!332007) (bvsub lt!331994 lt!331998))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8332 (_ BitVec 64)) Bool)

(assert (=> d!71537 (moveBitIndexPrecond!0 (_2!9693 lt!332007) (bvsub lt!331994 lt!331998))))

(assert (=> d!71537 (= (withMovedBitIndex!0 (_2!9693 lt!332007) (bvsub lt!331994 lt!331998)) lt!332282)))

(declare-fun b!211281 () Bool)

(assert (=> b!211281 (= e!144084 (= (size!4612 (buf!5135 (_2!9693 lt!332007))) (size!4612 (buf!5135 lt!332282))))))

(assert (= (and d!71537 res!177434) b!211281))

(declare-fun m!325499 () Bool)

(assert (=> d!71537 m!325499))

(declare-fun m!325501 () Bool)

(assert (=> d!71537 m!325501))

(declare-fun m!325503 () Bool)

(assert (=> d!71537 m!325503))

(declare-fun m!325505 () Bool)

(assert (=> d!71537 m!325505))

(assert (=> b!211084 d!71537))

(declare-fun d!71539 () Bool)

(declare-fun lt!332298 () tuple2!18078)

(declare-fun lt!332299 () tuple2!18078)

(assert (=> d!71539 (and (= (_2!9694 lt!332298) (_2!9694 lt!332299)) (= (_1!9694 lt!332298) (_1!9694 lt!332299)))))

(declare-fun lt!332300 () (_ BitVec 64))

(declare-fun lt!332297 () Unit!15052)

(declare-fun lt!332296 () BitStream!8332)

(declare-fun lt!332301 () Bool)

(declare-fun choose!56 (BitStream!8332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18078 tuple2!18078 BitStream!8332 (_ BitVec 64) Bool BitStream!8332 (_ BitVec 64) tuple2!18078 tuple2!18078 BitStream!8332 (_ BitVec 64)) Unit!15052)

(assert (=> d!71539 (= lt!332297 (choose!56 (_1!9693 lt!332003) nBits!348 i!590 lt!332006 lt!332298 (tuple2!18079 (_1!9694 lt!332298) (_2!9694 lt!332298)) (_1!9694 lt!332298) (_2!9694 lt!332298) lt!332301 lt!332296 lt!332300 lt!332299 (tuple2!18079 (_1!9694 lt!332299) (_2!9694 lt!332299)) (_1!9694 lt!332299) (_2!9694 lt!332299)))))

(assert (=> d!71539 (= lt!332299 (readNBitsLSBFirstsLoopPure!0 lt!332296 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!332300))))

(assert (=> d!71539 (= lt!332300 (bvor lt!332006 (ite lt!332301 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71539 (= lt!332296 (withMovedBitIndex!0 (_1!9693 lt!332003) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71539 (= lt!332301 (_2!9695 (readBitPure!0 (_1!9693 lt!332003))))))

(assert (=> d!71539 (= lt!332298 (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!332003) nBits!348 i!590 lt!332006))))

(assert (=> d!71539 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9693 lt!332003) nBits!348 i!590 lt!332006) lt!332297)))

(declare-fun bs!17557 () Bool)

(assert (= bs!17557 d!71539))

(assert (=> bs!17557 m!325251))

(assert (=> bs!17557 m!325259))

(assert (=> bs!17557 m!325215))

(declare-fun m!325507 () Bool)

(assert (=> bs!17557 m!325507))

(declare-fun m!325509 () Bool)

(assert (=> bs!17557 m!325509))

(assert (=> b!211084 d!71539))

(declare-fun d!71541 () Bool)

(declare-datatypes ((tuple2!18104 0))(
  ( (tuple2!18105 (_1!9707 (_ BitVec 64)) (_2!9707 BitStream!8332)) )
))
(declare-fun lt!332304 () tuple2!18104)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18104)

(assert (=> d!71541 (= lt!332304 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9693 lt!332003) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332008))))

(assert (=> d!71541 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9693 lt!332003) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332008) (tuple2!18079 (_2!9707 lt!332304) (_1!9707 lt!332304)))))

(declare-fun bs!17558 () Bool)

(assert (= bs!17558 d!71541))

(assert (=> bs!17558 m!325215))

(declare-fun m!325511 () Bool)

(assert (=> bs!17558 m!325511))

(assert (=> b!211084 d!71541))

(declare-fun d!71543 () Bool)

(declare-fun e!144085 () Bool)

(assert (=> d!71543 e!144085))

(declare-fun res!177435 () Bool)

(assert (=> d!71543 (=> (not res!177435) (not e!144085))))

(declare-fun lt!332306 () (_ BitVec 64))

(declare-fun lt!332305 () BitStream!8332)

(assert (=> d!71543 (= res!177435 (= (bvadd lt!332306 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4612 (buf!5135 lt!332305)) (currentByte!9689 lt!332305) (currentBit!9684 lt!332305))))))

(assert (=> d!71543 (or (not (= (bvand lt!332306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!332306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!332306 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71543 (= lt!332306 (bitIndex!0 (size!4612 (buf!5135 (_1!9693 lt!332003))) (currentByte!9689 (_1!9693 lt!332003)) (currentBit!9684 (_1!9693 lt!332003))))))

(assert (=> d!71543 (= lt!332305 (_2!9692 (moveBitIndex!0 (_1!9693 lt!332003) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71543 (moveBitIndexPrecond!0 (_1!9693 lt!332003) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71543 (= (withMovedBitIndex!0 (_1!9693 lt!332003) #b0000000000000000000000000000000000000000000000000000000000000001) lt!332305)))

(declare-fun b!211282 () Bool)

(assert (=> b!211282 (= e!144085 (= (size!4612 (buf!5135 (_1!9693 lt!332003))) (size!4612 (buf!5135 lt!332305))))))

(assert (= (and d!71543 res!177435) b!211282))

(declare-fun m!325513 () Bool)

(assert (=> d!71543 m!325513))

(declare-fun m!325515 () Bool)

(assert (=> d!71543 m!325515))

(declare-fun m!325517 () Bool)

(assert (=> d!71543 m!325517))

(declare-fun m!325519 () Bool)

(assert (=> d!71543 m!325519))

(assert (=> b!211084 d!71543))

(declare-fun d!71545 () Bool)

(declare-fun e!144086 () Bool)

(assert (=> d!71545 e!144086))

(declare-fun res!177436 () Bool)

(assert (=> d!71545 (=> (not res!177436) (not e!144086))))

(declare-fun lt!332311 () (_ BitVec 64))

(declare-fun lt!332309 () (_ BitVec 64))

(declare-fun lt!332310 () (_ BitVec 64))

(assert (=> d!71545 (= res!177436 (= lt!332311 (bvsub lt!332309 lt!332310)))))

(assert (=> d!71545 (or (= (bvand lt!332309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332310 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332309 lt!332310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71545 (= lt!332310 (remainingBits!0 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!331988)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988)))))))

(declare-fun lt!332307 () (_ BitVec 64))

(declare-fun lt!332312 () (_ BitVec 64))

(assert (=> d!71545 (= lt!332309 (bvmul lt!332307 lt!332312))))

(assert (=> d!71545 (or (= lt!332307 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332312 (bvsdiv (bvmul lt!332307 lt!332312) lt!332307)))))

(assert (=> d!71545 (= lt!332312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71545 (= lt!332307 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!331988)))))))

(assert (=> d!71545 (= lt!332311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988)))))))

(assert (=> d!71545 (invariant!0 (currentBit!9684 (_2!9692 lt!331988)) (currentByte!9689 (_2!9692 lt!331988)) (size!4612 (buf!5135 (_2!9692 lt!331988))))))

(assert (=> d!71545 (= (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))) lt!332311)))

(declare-fun b!211283 () Bool)

(declare-fun res!177437 () Bool)

(assert (=> b!211283 (=> (not res!177437) (not e!144086))))

(assert (=> b!211283 (= res!177437 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332311))))

(declare-fun b!211284 () Bool)

(declare-fun lt!332308 () (_ BitVec 64))

(assert (=> b!211284 (= e!144086 (bvsle lt!332311 (bvmul lt!332308 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211284 (or (= lt!332308 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332308 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332308)))))

(assert (=> b!211284 (= lt!332308 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!331988)))))))

(assert (= (and d!71545 res!177436) b!211283))

(assert (= (and b!211283 res!177437) b!211284))

(declare-fun m!325521 () Bool)

(assert (=> d!71545 m!325521))

(assert (=> d!71545 m!325493))

(assert (=> b!211083 d!71545))

(declare-fun d!71547 () Bool)

(declare-fun e!144087 () Bool)

(assert (=> d!71547 e!144087))

(declare-fun res!177438 () Bool)

(assert (=> d!71547 (=> (not res!177438) (not e!144087))))

(declare-fun lt!332317 () (_ BitVec 64))

(declare-fun lt!332316 () (_ BitVec 64))

(declare-fun lt!332315 () (_ BitVec 64))

(assert (=> d!71547 (= res!177438 (= lt!332317 (bvsub lt!332315 lt!332316)))))

(assert (=> d!71547 (or (= (bvand lt!332315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332315 lt!332316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71547 (= lt!332316 (remainingBits!0 ((_ sign_extend 32) (size!4612 (buf!5135 thiss!1204))) ((_ sign_extend 32) (currentByte!9689 thiss!1204)) ((_ sign_extend 32) (currentBit!9684 thiss!1204))))))

(declare-fun lt!332313 () (_ BitVec 64))

(declare-fun lt!332318 () (_ BitVec 64))

(assert (=> d!71547 (= lt!332315 (bvmul lt!332313 lt!332318))))

(assert (=> d!71547 (or (= lt!332313 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332318 (bvsdiv (bvmul lt!332313 lt!332318) lt!332313)))))

(assert (=> d!71547 (= lt!332318 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71547 (= lt!332313 ((_ sign_extend 32) (size!4612 (buf!5135 thiss!1204))))))

(assert (=> d!71547 (= lt!332317 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9689 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9684 thiss!1204))))))

(assert (=> d!71547 (invariant!0 (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204) (size!4612 (buf!5135 thiss!1204)))))

(assert (=> d!71547 (= (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)) lt!332317)))

(declare-fun b!211285 () Bool)

(declare-fun res!177439 () Bool)

(assert (=> b!211285 (=> (not res!177439) (not e!144087))))

(assert (=> b!211285 (= res!177439 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332317))))

(declare-fun b!211286 () Bool)

(declare-fun lt!332314 () (_ BitVec 64))

(assert (=> b!211286 (= e!144087 (bvsle lt!332317 (bvmul lt!332314 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211286 (or (= lt!332314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332314)))))

(assert (=> b!211286 (= lt!332314 ((_ sign_extend 32) (size!4612 (buf!5135 thiss!1204))))))

(assert (= (and d!71547 res!177438) b!211285))

(assert (= (and b!211285 res!177439) b!211286))

(declare-fun m!325523 () Bool)

(assert (=> d!71547 m!325523))

(assert (=> d!71547 m!325233))

(assert (=> b!211083 d!71547))

(declare-fun d!71549 () Bool)

(assert (=> d!71549 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204) (size!4612 (buf!5135 thiss!1204))))))

(declare-fun bs!17559 () Bool)

(assert (= bs!17559 d!71549))

(assert (=> bs!17559 m!325233))

(assert (=> start!44316 d!71549))

(declare-fun d!71551 () Bool)

(assert (=> d!71551 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 thiss!1204))) ((_ sign_extend 32) (currentByte!9689 thiss!1204)) ((_ sign_extend 32) (currentBit!9684 thiss!1204)) lt!331996) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4612 (buf!5135 thiss!1204))) ((_ sign_extend 32) (currentByte!9689 thiss!1204)) ((_ sign_extend 32) (currentBit!9684 thiss!1204))) lt!331996))))

(declare-fun bs!17560 () Bool)

(assert (= bs!17560 d!71551))

(assert (=> bs!17560 m!325523))

(assert (=> b!211093 d!71551))

(declare-fun d!71553 () Bool)

(declare-fun e!144088 () Bool)

(assert (=> d!71553 e!144088))

(declare-fun res!177440 () Bool)

(assert (=> d!71553 (=> (not res!177440) (not e!144088))))

(declare-fun lt!332322 () (_ BitVec 64))

(declare-fun lt!332323 () (_ BitVec 64))

(declare-fun lt!332321 () (_ BitVec 64))

(assert (=> d!71553 (= res!177440 (= lt!332323 (bvsub lt!332321 lt!332322)))))

(assert (=> d!71553 (or (= (bvand lt!332321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332322 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332321 lt!332322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71553 (= lt!332322 (remainingBits!0 ((_ sign_extend 32) (size!4612 (buf!5135 (_1!9695 lt!332001)))) ((_ sign_extend 32) (currentByte!9689 (_1!9695 lt!332001))) ((_ sign_extend 32) (currentBit!9684 (_1!9695 lt!332001)))))))

(declare-fun lt!332319 () (_ BitVec 64))

(declare-fun lt!332324 () (_ BitVec 64))

(assert (=> d!71553 (= lt!332321 (bvmul lt!332319 lt!332324))))

(assert (=> d!71553 (or (= lt!332319 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332324 (bvsdiv (bvmul lt!332319 lt!332324) lt!332319)))))

(assert (=> d!71553 (= lt!332324 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71553 (= lt!332319 ((_ sign_extend 32) (size!4612 (buf!5135 (_1!9695 lt!332001)))))))

(assert (=> d!71553 (= lt!332323 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9689 (_1!9695 lt!332001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9684 (_1!9695 lt!332001)))))))

(assert (=> d!71553 (invariant!0 (currentBit!9684 (_1!9695 lt!332001)) (currentByte!9689 (_1!9695 lt!332001)) (size!4612 (buf!5135 (_1!9695 lt!332001))))))

(assert (=> d!71553 (= (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!332001))) (currentByte!9689 (_1!9695 lt!332001)) (currentBit!9684 (_1!9695 lt!332001))) lt!332323)))

(declare-fun b!211287 () Bool)

(declare-fun res!177441 () Bool)

(assert (=> b!211287 (=> (not res!177441) (not e!144088))))

(assert (=> b!211287 (= res!177441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332323))))

(declare-fun b!211288 () Bool)

(declare-fun lt!332320 () (_ BitVec 64))

(assert (=> b!211288 (= e!144088 (bvsle lt!332323 (bvmul lt!332320 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211288 (or (= lt!332320 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332320 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332320)))))

(assert (=> b!211288 (= lt!332320 ((_ sign_extend 32) (size!4612 (buf!5135 (_1!9695 lt!332001)))))))

(assert (= (and d!71553 res!177440) b!211287))

(assert (= (and b!211287 res!177441) b!211288))

(declare-fun m!325525 () Bool)

(assert (=> d!71553 m!325525))

(declare-fun m!325527 () Bool)

(assert (=> d!71553 m!325527))

(assert (=> b!211092 d!71553))

(declare-fun d!71555 () Bool)

(assert (=> d!71555 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!211092 d!71555))

(declare-fun d!71557 () Bool)

(assert (=> d!71557 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))) ((_ sign_extend 32) (currentByte!9689 thiss!1204)) ((_ sign_extend 32) (currentBit!9684 thiss!1204)) lt!331996)))

(declare-fun lt!332327 () Unit!15052)

(declare-fun choose!9 (BitStream!8332 array!10499 (_ BitVec 64) BitStream!8332) Unit!15052)

(assert (=> d!71557 (= lt!332327 (choose!9 thiss!1204 (buf!5135 (_2!9692 lt!332000)) lt!331996 (BitStream!8333 (buf!5135 (_2!9692 lt!332000)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204))))))

(assert (=> d!71557 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5135 (_2!9692 lt!332000)) lt!331996) lt!332327)))

(declare-fun bs!17561 () Bool)

(assert (= bs!17561 d!71557))

(assert (=> bs!17561 m!325239))

(declare-fun m!325529 () Bool)

(assert (=> bs!17561 m!325529))

(assert (=> b!211092 d!71557))

(declare-fun d!71559 () Bool)

(declare-fun e!144093 () Bool)

(assert (=> d!71559 e!144093))

(declare-fun res!177448 () Bool)

(assert (=> d!71559 (=> (not res!177448) (not e!144093))))

(declare-fun lt!332374 () tuple2!18076)

(assert (=> d!71559 (= res!177448 (isPrefixOf!0 (_1!9693 lt!332374) (_2!9693 lt!332374)))))

(declare-fun lt!332380 () BitStream!8332)

(assert (=> d!71559 (= lt!332374 (tuple2!18077 lt!332380 (_2!9692 lt!332000)))))

(declare-fun lt!332387 () Unit!15052)

(declare-fun lt!332371 () Unit!15052)

(assert (=> d!71559 (= lt!332387 lt!332371)))

(assert (=> d!71559 (isPrefixOf!0 lt!332380 (_2!9692 lt!332000))))

(assert (=> d!71559 (= lt!332371 (lemmaIsPrefixTransitive!0 lt!332380 (_2!9692 lt!332000) (_2!9692 lt!332000)))))

(declare-fun lt!332383 () Unit!15052)

(declare-fun lt!332377 () Unit!15052)

(assert (=> d!71559 (= lt!332383 lt!332377)))

(assert (=> d!71559 (isPrefixOf!0 lt!332380 (_2!9692 lt!332000))))

(assert (=> d!71559 (= lt!332377 (lemmaIsPrefixTransitive!0 lt!332380 (_2!9692 lt!331988) (_2!9692 lt!332000)))))

(declare-fun lt!332385 () Unit!15052)

(declare-fun e!144094 () Unit!15052)

(assert (=> d!71559 (= lt!332385 e!144094)))

(declare-fun c!10391 () Bool)

(assert (=> d!71559 (= c!10391 (not (= (size!4612 (buf!5135 (_2!9692 lt!331988))) #b00000000000000000000000000000000)))))

(declare-fun lt!332375 () Unit!15052)

(declare-fun lt!332386 () Unit!15052)

(assert (=> d!71559 (= lt!332375 lt!332386)))

(assert (=> d!71559 (isPrefixOf!0 (_2!9692 lt!332000) (_2!9692 lt!332000))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8332) Unit!15052)

(assert (=> d!71559 (= lt!332386 (lemmaIsPrefixRefl!0 (_2!9692 lt!332000)))))

(declare-fun lt!332382 () Unit!15052)

(declare-fun lt!332370 () Unit!15052)

(assert (=> d!71559 (= lt!332382 lt!332370)))

(assert (=> d!71559 (= lt!332370 (lemmaIsPrefixRefl!0 (_2!9692 lt!332000)))))

(declare-fun lt!332384 () Unit!15052)

(declare-fun lt!332368 () Unit!15052)

(assert (=> d!71559 (= lt!332384 lt!332368)))

(assert (=> d!71559 (isPrefixOf!0 lt!332380 lt!332380)))

(assert (=> d!71559 (= lt!332368 (lemmaIsPrefixRefl!0 lt!332380))))

(declare-fun lt!332379 () Unit!15052)

(declare-fun lt!332378 () Unit!15052)

(assert (=> d!71559 (= lt!332379 lt!332378)))

(assert (=> d!71559 (isPrefixOf!0 (_2!9692 lt!331988) (_2!9692 lt!331988))))

(assert (=> d!71559 (= lt!332378 (lemmaIsPrefixRefl!0 (_2!9692 lt!331988)))))

(assert (=> d!71559 (= lt!332380 (BitStream!8333 (buf!5135 (_2!9692 lt!332000)) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))))))

(assert (=> d!71559 (isPrefixOf!0 (_2!9692 lt!331988) (_2!9692 lt!332000))))

(assert (=> d!71559 (= (reader!0 (_2!9692 lt!331988) (_2!9692 lt!332000)) lt!332374)))

(declare-fun b!211299 () Bool)

(declare-fun res!177449 () Bool)

(assert (=> b!211299 (=> (not res!177449) (not e!144093))))

(assert (=> b!211299 (= res!177449 (isPrefixOf!0 (_2!9693 lt!332374) (_2!9692 lt!332000)))))

(declare-fun b!211300 () Bool)

(declare-fun Unit!15071 () Unit!15052)

(assert (=> b!211300 (= e!144094 Unit!15071)))

(declare-fun lt!332381 () (_ BitVec 64))

(declare-fun lt!332376 () (_ BitVec 64))

(declare-fun b!211301 () Bool)

(assert (=> b!211301 (= e!144093 (= (_1!9693 lt!332374) (withMovedBitIndex!0 (_2!9693 lt!332374) (bvsub lt!332376 lt!332381))))))

(assert (=> b!211301 (or (= (bvand lt!332376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332376 lt!332381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211301 (= lt!332381 (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!332000))) (currentByte!9689 (_2!9692 lt!332000)) (currentBit!9684 (_2!9692 lt!332000))))))

(assert (=> b!211301 (= lt!332376 (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))))))

(declare-fun b!211302 () Bool)

(declare-fun res!177450 () Bool)

(assert (=> b!211302 (=> (not res!177450) (not e!144093))))

(assert (=> b!211302 (= res!177450 (isPrefixOf!0 (_1!9693 lt!332374) (_2!9692 lt!331988)))))

(declare-fun b!211303 () Bool)

(declare-fun lt!332372 () Unit!15052)

(assert (=> b!211303 (= e!144094 lt!332372)))

(declare-fun lt!332373 () (_ BitVec 64))

(assert (=> b!211303 (= lt!332373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332369 () (_ BitVec 64))

(assert (=> b!211303 (= lt!332369 (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10499 array!10499 (_ BitVec 64) (_ BitVec 64)) Unit!15052)

(assert (=> b!211303 (= lt!332372 (arrayBitRangesEqSymmetric!0 (buf!5135 (_2!9692 lt!331988)) (buf!5135 (_2!9692 lt!332000)) lt!332373 lt!332369))))

(assert (=> b!211303 (arrayBitRangesEq!0 (buf!5135 (_2!9692 lt!332000)) (buf!5135 (_2!9692 lt!331988)) lt!332373 lt!332369)))

(assert (= (and d!71559 c!10391) b!211303))

(assert (= (and d!71559 (not c!10391)) b!211300))

(assert (= (and d!71559 res!177448) b!211302))

(assert (= (and b!211302 res!177450) b!211299))

(assert (= (and b!211299 res!177449) b!211301))

(declare-fun m!325531 () Bool)

(assert (=> b!211301 m!325531))

(assert (=> b!211301 m!325197))

(assert (=> b!211301 m!325221))

(declare-fun m!325533 () Bool)

(assert (=> b!211302 m!325533))

(declare-fun m!325535 () Bool)

(assert (=> d!71559 m!325535))

(declare-fun m!325537 () Bool)

(assert (=> d!71559 m!325537))

(declare-fun m!325539 () Bool)

(assert (=> d!71559 m!325539))

(declare-fun m!325541 () Bool)

(assert (=> d!71559 m!325541))

(declare-fun m!325543 () Bool)

(assert (=> d!71559 m!325543))

(declare-fun m!325545 () Bool)

(assert (=> d!71559 m!325545))

(declare-fun m!325547 () Bool)

(assert (=> d!71559 m!325547))

(declare-fun m!325549 () Bool)

(assert (=> d!71559 m!325549))

(assert (=> d!71559 m!325267))

(declare-fun m!325551 () Bool)

(assert (=> d!71559 m!325551))

(declare-fun m!325553 () Bool)

(assert (=> d!71559 m!325553))

(assert (=> b!211303 m!325221))

(declare-fun m!325555 () Bool)

(assert (=> b!211303 m!325555))

(declare-fun m!325557 () Bool)

(assert (=> b!211303 m!325557))

(declare-fun m!325559 () Bool)

(assert (=> b!211299 m!325559))

(assert (=> b!211092 d!71559))

(declare-fun d!71561 () Bool)

(declare-fun lt!332388 () tuple2!18102)

(assert (=> d!71561 (= lt!332388 (readBit!0 lt!331992))))

(assert (=> d!71561 (= (readBitPure!0 lt!331992) (tuple2!18081 (_2!9706 lt!332388) (_1!9706 lt!332388)))))

(declare-fun bs!17562 () Bool)

(assert (= bs!17562 d!71561))

(declare-fun m!325561 () Bool)

(assert (=> bs!17562 m!325561))

(assert (=> b!211092 d!71561))

(declare-fun d!71563 () Bool)

(assert (=> d!71563 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988))) lt!332005)))

(declare-fun lt!332389 () Unit!15052)

(assert (=> d!71563 (= lt!332389 (choose!9 (_2!9692 lt!331988) (buf!5135 (_2!9692 lt!332000)) lt!332005 (BitStream!8333 (buf!5135 (_2!9692 lt!332000)) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988)))))))

(assert (=> d!71563 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9692 lt!331988) (buf!5135 (_2!9692 lt!332000)) lt!332005) lt!332389)))

(declare-fun bs!17563 () Bool)

(assert (= bs!17563 d!71563))

(assert (=> bs!17563 m!325265))

(declare-fun m!325563 () Bool)

(assert (=> bs!17563 m!325563))

(assert (=> b!211092 d!71563))

(declare-fun d!71565 () Bool)

(assert (=> d!71565 (= (invariant!0 (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204) (size!4612 (buf!5135 (_2!9692 lt!331988)))) (and (bvsge (currentBit!9684 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9684 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9689 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9689 thiss!1204) (size!4612 (buf!5135 (_2!9692 lt!331988)))) (and (= (currentBit!9684 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9689 thiss!1204) (size!4612 (buf!5135 (_2!9692 lt!331988))))))))))

(assert (=> b!211092 d!71565))

(declare-fun d!71567 () Bool)

(declare-fun lt!332390 () tuple2!18102)

(assert (=> d!71567 (= lt!332390 (readBit!0 (BitStream!8333 (buf!5135 (_2!9692 lt!332000)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204))))))

(assert (=> d!71567 (= (readBitPure!0 (BitStream!8333 (buf!5135 (_2!9692 lt!332000)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204))) (tuple2!18081 (_2!9706 lt!332390) (_1!9706 lt!332390)))))

(declare-fun bs!17564 () Bool)

(assert (= bs!17564 d!71567))

(declare-fun m!325565 () Bool)

(assert (=> bs!17564 m!325565))

(assert (=> b!211092 d!71567))

(declare-fun d!71569 () Bool)

(declare-fun e!144095 () Bool)

(assert (=> d!71569 e!144095))

(declare-fun res!177451 () Bool)

(assert (=> d!71569 (=> (not res!177451) (not e!144095))))

(declare-fun lt!332397 () tuple2!18076)

(assert (=> d!71569 (= res!177451 (isPrefixOf!0 (_1!9693 lt!332397) (_2!9693 lt!332397)))))

(declare-fun lt!332403 () BitStream!8332)

(assert (=> d!71569 (= lt!332397 (tuple2!18077 lt!332403 (_2!9692 lt!332000)))))

(declare-fun lt!332410 () Unit!15052)

(declare-fun lt!332394 () Unit!15052)

(assert (=> d!71569 (= lt!332410 lt!332394)))

(assert (=> d!71569 (isPrefixOf!0 lt!332403 (_2!9692 lt!332000))))

(assert (=> d!71569 (= lt!332394 (lemmaIsPrefixTransitive!0 lt!332403 (_2!9692 lt!332000) (_2!9692 lt!332000)))))

(declare-fun lt!332406 () Unit!15052)

(declare-fun lt!332400 () Unit!15052)

(assert (=> d!71569 (= lt!332406 lt!332400)))

(assert (=> d!71569 (isPrefixOf!0 lt!332403 (_2!9692 lt!332000))))

(assert (=> d!71569 (= lt!332400 (lemmaIsPrefixTransitive!0 lt!332403 thiss!1204 (_2!9692 lt!332000)))))

(declare-fun lt!332408 () Unit!15052)

(declare-fun e!144096 () Unit!15052)

(assert (=> d!71569 (= lt!332408 e!144096)))

(declare-fun c!10392 () Bool)

(assert (=> d!71569 (= c!10392 (not (= (size!4612 (buf!5135 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!332398 () Unit!15052)

(declare-fun lt!332409 () Unit!15052)

(assert (=> d!71569 (= lt!332398 lt!332409)))

(assert (=> d!71569 (isPrefixOf!0 (_2!9692 lt!332000) (_2!9692 lt!332000))))

(assert (=> d!71569 (= lt!332409 (lemmaIsPrefixRefl!0 (_2!9692 lt!332000)))))

(declare-fun lt!332405 () Unit!15052)

(declare-fun lt!332393 () Unit!15052)

(assert (=> d!71569 (= lt!332405 lt!332393)))

(assert (=> d!71569 (= lt!332393 (lemmaIsPrefixRefl!0 (_2!9692 lt!332000)))))

(declare-fun lt!332407 () Unit!15052)

(declare-fun lt!332391 () Unit!15052)

(assert (=> d!71569 (= lt!332407 lt!332391)))

(assert (=> d!71569 (isPrefixOf!0 lt!332403 lt!332403)))

(assert (=> d!71569 (= lt!332391 (lemmaIsPrefixRefl!0 lt!332403))))

(declare-fun lt!332402 () Unit!15052)

(declare-fun lt!332401 () Unit!15052)

(assert (=> d!71569 (= lt!332402 lt!332401)))

(assert (=> d!71569 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71569 (= lt!332401 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71569 (= lt!332403 (BitStream!8333 (buf!5135 (_2!9692 lt!332000)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)))))

(assert (=> d!71569 (isPrefixOf!0 thiss!1204 (_2!9692 lt!332000))))

(assert (=> d!71569 (= (reader!0 thiss!1204 (_2!9692 lt!332000)) lt!332397)))

(declare-fun b!211304 () Bool)

(declare-fun res!177452 () Bool)

(assert (=> b!211304 (=> (not res!177452) (not e!144095))))

(assert (=> b!211304 (= res!177452 (isPrefixOf!0 (_2!9693 lt!332397) (_2!9692 lt!332000)))))

(declare-fun b!211305 () Bool)

(declare-fun Unit!15072 () Unit!15052)

(assert (=> b!211305 (= e!144096 Unit!15072)))

(declare-fun b!211306 () Bool)

(declare-fun lt!332404 () (_ BitVec 64))

(declare-fun lt!332399 () (_ BitVec 64))

(assert (=> b!211306 (= e!144095 (= (_1!9693 lt!332397) (withMovedBitIndex!0 (_2!9693 lt!332397) (bvsub lt!332399 lt!332404))))))

(assert (=> b!211306 (or (= (bvand lt!332399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332404 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332399 lt!332404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211306 (= lt!332404 (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!332000))) (currentByte!9689 (_2!9692 lt!332000)) (currentBit!9684 (_2!9692 lt!332000))))))

(assert (=> b!211306 (= lt!332399 (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)))))

(declare-fun b!211307 () Bool)

(declare-fun res!177453 () Bool)

(assert (=> b!211307 (=> (not res!177453) (not e!144095))))

(assert (=> b!211307 (= res!177453 (isPrefixOf!0 (_1!9693 lt!332397) thiss!1204))))

(declare-fun b!211308 () Bool)

(declare-fun lt!332395 () Unit!15052)

(assert (=> b!211308 (= e!144096 lt!332395)))

(declare-fun lt!332396 () (_ BitVec 64))

(assert (=> b!211308 (= lt!332396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332392 () (_ BitVec 64))

(assert (=> b!211308 (= lt!332392 (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)))))

(assert (=> b!211308 (= lt!332395 (arrayBitRangesEqSymmetric!0 (buf!5135 thiss!1204) (buf!5135 (_2!9692 lt!332000)) lt!332396 lt!332392))))

(assert (=> b!211308 (arrayBitRangesEq!0 (buf!5135 (_2!9692 lt!332000)) (buf!5135 thiss!1204) lt!332396 lt!332392)))

(assert (= (and d!71569 c!10392) b!211308))

(assert (= (and d!71569 (not c!10392)) b!211305))

(assert (= (and d!71569 res!177451) b!211307))

(assert (= (and b!211307 res!177453) b!211304))

(assert (= (and b!211304 res!177452) b!211306))

(declare-fun m!325567 () Bool)

(assert (=> b!211306 m!325567))

(assert (=> b!211306 m!325197))

(assert (=> b!211306 m!325223))

(declare-fun m!325569 () Bool)

(assert (=> b!211307 m!325569))

(declare-fun m!325571 () Bool)

(assert (=> d!71569 m!325571))

(assert (=> d!71569 m!325537))

(assert (=> d!71569 m!325539))

(declare-fun m!325573 () Bool)

(assert (=> d!71569 m!325573))

(declare-fun m!325575 () Bool)

(assert (=> d!71569 m!325575))

(declare-fun m!325577 () Bool)

(assert (=> d!71569 m!325577))

(declare-fun m!325579 () Bool)

(assert (=> d!71569 m!325579))

(declare-fun m!325581 () Bool)

(assert (=> d!71569 m!325581))

(assert (=> d!71569 m!325199))

(declare-fun m!325583 () Bool)

(assert (=> d!71569 m!325583))

(declare-fun m!325585 () Bool)

(assert (=> d!71569 m!325585))

(assert (=> b!211308 m!325223))

(declare-fun m!325587 () Bool)

(assert (=> b!211308 m!325587))

(declare-fun m!325589 () Bool)

(assert (=> b!211308 m!325589))

(declare-fun m!325591 () Bool)

(assert (=> b!211304 m!325591))

(assert (=> b!211092 d!71569))

(declare-fun d!71571 () Bool)

(declare-fun lt!332411 () tuple2!18104)

(assert (=> d!71571 (= lt!332411 (readNBitsLSBFirstsLoop!0 (_1!9693 lt!332003) nBits!348 i!590 lt!332006))))

(assert (=> d!71571 (= (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!332003) nBits!348 i!590 lt!332006) (tuple2!18079 (_2!9707 lt!332411) (_1!9707 lt!332411)))))

(declare-fun bs!17565 () Bool)

(assert (= bs!17565 d!71571))

(declare-fun m!325593 () Bool)

(assert (=> bs!17565 m!325593))

(assert (=> b!211092 d!71571))

(declare-fun d!71573 () Bool)

(assert (=> d!71573 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))) ((_ sign_extend 32) (currentByte!9689 thiss!1204)) ((_ sign_extend 32) (currentBit!9684 thiss!1204)) lt!331996) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))) ((_ sign_extend 32) (currentByte!9689 thiss!1204)) ((_ sign_extend 32) (currentBit!9684 thiss!1204))) lt!331996))))

(declare-fun bs!17566 () Bool)

(assert (= bs!17566 d!71573))

(declare-fun m!325595 () Bool)

(assert (=> bs!17566 m!325595))

(assert (=> b!211092 d!71573))

(declare-fun d!71575 () Bool)

(assert (=> d!71575 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988))) lt!332005) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988)))) lt!332005))))

(declare-fun bs!17567 () Bool)

(assert (= bs!17567 d!71575))

(declare-fun m!325597 () Bool)

(assert (=> bs!17567 m!325597))

(assert (=> b!211092 d!71575))

(declare-fun d!71577 () Bool)

(declare-fun e!144099 () Bool)

(assert (=> d!71577 e!144099))

(declare-fun res!177456 () Bool)

(assert (=> d!71577 (=> (not res!177456) (not e!144099))))

(declare-fun lt!332422 () tuple2!18080)

(declare-fun lt!332420 () tuple2!18080)

(assert (=> d!71577 (= res!177456 (= (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!332422))) (currentByte!9689 (_1!9695 lt!332422)) (currentBit!9684 (_1!9695 lt!332422))) (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!332420))) (currentByte!9689 (_1!9695 lt!332420)) (currentBit!9684 (_1!9695 lt!332420)))))))

(declare-fun lt!332421 () Unit!15052)

(declare-fun lt!332423 () BitStream!8332)

(declare-fun choose!50 (BitStream!8332 BitStream!8332 BitStream!8332 tuple2!18080 tuple2!18080 BitStream!8332 Bool tuple2!18080 tuple2!18080 BitStream!8332 Bool) Unit!15052)

(assert (=> d!71577 (= lt!332421 (choose!50 lt!331992 (_2!9692 lt!332000) lt!332423 lt!332422 (tuple2!18081 (_1!9695 lt!332422) (_2!9695 lt!332422)) (_1!9695 lt!332422) (_2!9695 lt!332422) lt!332420 (tuple2!18081 (_1!9695 lt!332420) (_2!9695 lt!332420)) (_1!9695 lt!332420) (_2!9695 lt!332420)))))

(assert (=> d!71577 (= lt!332420 (readBitPure!0 lt!332423))))

(assert (=> d!71577 (= lt!332422 (readBitPure!0 lt!331992))))

(assert (=> d!71577 (= lt!332423 (BitStream!8333 (buf!5135 (_2!9692 lt!332000)) (currentByte!9689 lt!331992) (currentBit!9684 lt!331992)))))

(assert (=> d!71577 (invariant!0 (currentBit!9684 lt!331992) (currentByte!9689 lt!331992) (size!4612 (buf!5135 (_2!9692 lt!332000))))))

(assert (=> d!71577 (= (readBitPrefixLemma!0 lt!331992 (_2!9692 lt!332000)) lt!332421)))

(declare-fun b!211311 () Bool)

(assert (=> b!211311 (= e!144099 (= (_2!9695 lt!332422) (_2!9695 lt!332420)))))

(assert (= (and d!71577 res!177456) b!211311))

(declare-fun m!325599 () Bool)

(assert (=> d!71577 m!325599))

(declare-fun m!325601 () Bool)

(assert (=> d!71577 m!325601))

(declare-fun m!325603 () Bool)

(assert (=> d!71577 m!325603))

(declare-fun m!325605 () Bool)

(assert (=> d!71577 m!325605))

(declare-fun m!325607 () Bool)

(assert (=> d!71577 m!325607))

(assert (=> d!71577 m!325241))

(assert (=> b!211092 d!71577))

(declare-fun d!71579 () Bool)

(declare-fun lt!332424 () tuple2!18102)

(assert (=> d!71579 (= lt!332424 (readBit!0 (_1!9693 lt!332003)))))

(assert (=> d!71579 (= (readBitPure!0 (_1!9693 lt!332003)) (tuple2!18081 (_2!9706 lt!332424) (_1!9706 lt!332424)))))

(declare-fun bs!17568 () Bool)

(assert (= bs!17568 d!71579))

(declare-fun m!325609 () Bool)

(assert (=> bs!17568 m!325609))

(assert (=> b!211092 d!71579))

(declare-fun d!71581 () Bool)

(declare-fun e!144100 () Bool)

(assert (=> d!71581 e!144100))

(declare-fun res!177457 () Bool)

(assert (=> d!71581 (=> (not res!177457) (not e!144100))))

(declare-fun lt!332429 () (_ BitVec 64))

(declare-fun lt!332427 () (_ BitVec 64))

(declare-fun lt!332428 () (_ BitVec 64))

(assert (=> d!71581 (= res!177457 (= lt!332429 (bvsub lt!332427 lt!332428)))))

(assert (=> d!71581 (or (= (bvand lt!332427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332428 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332427 lt!332428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71581 (= lt!332428 (remainingBits!0 ((_ sign_extend 32) (size!4612 (buf!5135 (_1!9695 lt!332011)))) ((_ sign_extend 32) (currentByte!9689 (_1!9695 lt!332011))) ((_ sign_extend 32) (currentBit!9684 (_1!9695 lt!332011)))))))

(declare-fun lt!332425 () (_ BitVec 64))

(declare-fun lt!332430 () (_ BitVec 64))

(assert (=> d!71581 (= lt!332427 (bvmul lt!332425 lt!332430))))

(assert (=> d!71581 (or (= lt!332425 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332430 (bvsdiv (bvmul lt!332425 lt!332430) lt!332425)))))

(assert (=> d!71581 (= lt!332430 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71581 (= lt!332425 ((_ sign_extend 32) (size!4612 (buf!5135 (_1!9695 lt!332011)))))))

(assert (=> d!71581 (= lt!332429 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9689 (_1!9695 lt!332011))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9684 (_1!9695 lt!332011)))))))

(assert (=> d!71581 (invariant!0 (currentBit!9684 (_1!9695 lt!332011)) (currentByte!9689 (_1!9695 lt!332011)) (size!4612 (buf!5135 (_1!9695 lt!332011))))))

(assert (=> d!71581 (= (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!332011))) (currentByte!9689 (_1!9695 lt!332011)) (currentBit!9684 (_1!9695 lt!332011))) lt!332429)))

(declare-fun b!211312 () Bool)

(declare-fun res!177458 () Bool)

(assert (=> b!211312 (=> (not res!177458) (not e!144100))))

(assert (=> b!211312 (= res!177458 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332429))))

(declare-fun b!211313 () Bool)

(declare-fun lt!332426 () (_ BitVec 64))

(assert (=> b!211313 (= e!144100 (bvsle lt!332429 (bvmul lt!332426 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211313 (or (= lt!332426 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332426 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332426)))))

(assert (=> b!211313 (= lt!332426 ((_ sign_extend 32) (size!4612 (buf!5135 (_1!9695 lt!332011)))))))

(assert (= (and d!71581 res!177457) b!211312))

(assert (= (and b!211312 res!177458) b!211313))

(declare-fun m!325611 () Bool)

(assert (=> d!71581 m!325611))

(declare-fun m!325613 () Bool)

(assert (=> d!71581 m!325613))

(assert (=> b!211092 d!71581))

(declare-fun d!71583 () Bool)

(declare-fun lt!332431 () tuple2!18104)

(assert (=> d!71583 (= lt!332431 (readNBitsLSBFirstsLoop!0 (_1!9693 lt!332007) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332008))))

(assert (=> d!71583 (= (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!332007) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332008) (tuple2!18079 (_2!9707 lt!332431) (_1!9707 lt!332431)))))

(declare-fun bs!17569 () Bool)

(assert (= bs!17569 d!71583))

(declare-fun m!325615 () Bool)

(assert (=> bs!17569 m!325615))

(assert (=> b!211092 d!71583))

(declare-fun d!71585 () Bool)

(declare-fun res!177461 () Bool)

(declare-fun e!144102 () Bool)

(assert (=> d!71585 (=> (not res!177461) (not e!144102))))

(assert (=> d!71585 (= res!177461 (= (size!4612 (buf!5135 (_2!9692 lt!331988))) (size!4612 (buf!5135 (_2!9692 lt!332000)))))))

(assert (=> d!71585 (= (isPrefixOf!0 (_2!9692 lt!331988) (_2!9692 lt!332000)) e!144102)))

(declare-fun b!211314 () Bool)

(declare-fun res!177459 () Bool)

(assert (=> b!211314 (=> (not res!177459) (not e!144102))))

(assert (=> b!211314 (= res!177459 (bvsle (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))) (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!332000))) (currentByte!9689 (_2!9692 lt!332000)) (currentBit!9684 (_2!9692 lt!332000)))))))

(declare-fun b!211315 () Bool)

(declare-fun e!144101 () Bool)

(assert (=> b!211315 (= e!144102 e!144101)))

(declare-fun res!177460 () Bool)

(assert (=> b!211315 (=> res!177460 e!144101)))

(assert (=> b!211315 (= res!177460 (= (size!4612 (buf!5135 (_2!9692 lt!331988))) #b00000000000000000000000000000000))))

(declare-fun b!211316 () Bool)

(assert (=> b!211316 (= e!144101 (arrayBitRangesEq!0 (buf!5135 (_2!9692 lt!331988)) (buf!5135 (_2!9692 lt!332000)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988)))))))

(assert (= (and d!71585 res!177461) b!211314))

(assert (= (and b!211314 res!177459) b!211315))

(assert (= (and b!211315 (not res!177460)) b!211316))

(assert (=> b!211314 m!325221))

(assert (=> b!211314 m!325197))

(assert (=> b!211316 m!325221))

(assert (=> b!211316 m!325221))

(declare-fun m!325617 () Bool)

(assert (=> b!211316 m!325617))

(assert (=> b!211091 d!71585))

(declare-fun d!71587 () Bool)

(declare-fun e!144103 () Bool)

(assert (=> d!71587 e!144103))

(declare-fun res!177462 () Bool)

(assert (=> d!71587 (=> (not res!177462) (not e!144103))))

(declare-fun lt!332436 () (_ BitVec 64))

(declare-fun lt!332434 () (_ BitVec 64))

(declare-fun lt!332435 () (_ BitVec 64))

(assert (=> d!71587 (= res!177462 (= lt!332436 (bvsub lt!332434 lt!332435)))))

(assert (=> d!71587 (or (= (bvand lt!332434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332435 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332434 lt!332435) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71587 (= lt!332435 (remainingBits!0 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!332000))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!332000)))))))

(declare-fun lt!332432 () (_ BitVec 64))

(declare-fun lt!332437 () (_ BitVec 64))

(assert (=> d!71587 (= lt!332434 (bvmul lt!332432 lt!332437))))

(assert (=> d!71587 (or (= lt!332432 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332437 (bvsdiv (bvmul lt!332432 lt!332437) lt!332432)))))

(assert (=> d!71587 (= lt!332437 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71587 (= lt!332432 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))))))

(assert (=> d!71587 (= lt!332436 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!332000))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!332000)))))))

(assert (=> d!71587 (invariant!0 (currentBit!9684 (_2!9692 lt!332000)) (currentByte!9689 (_2!9692 lt!332000)) (size!4612 (buf!5135 (_2!9692 lt!332000))))))

(assert (=> d!71587 (= (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!332000))) (currentByte!9689 (_2!9692 lt!332000)) (currentBit!9684 (_2!9692 lt!332000))) lt!332436)))

(declare-fun b!211317 () Bool)

(declare-fun res!177463 () Bool)

(assert (=> b!211317 (=> (not res!177463) (not e!144103))))

(assert (=> b!211317 (= res!177463 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332436))))

(declare-fun b!211318 () Bool)

(declare-fun lt!332433 () (_ BitVec 64))

(assert (=> b!211318 (= e!144103 (bvsle lt!332436 (bvmul lt!332433 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211318 (or (= lt!332433 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332433 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332433)))))

(assert (=> b!211318 (= lt!332433 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!332000)))))))

(assert (= (and d!71587 res!177462) b!211317))

(assert (= (and b!211317 res!177463) b!211318))

(declare-fun m!325619 () Bool)

(assert (=> d!71587 m!325619))

(assert (=> d!71587 m!325231))

(assert (=> b!211101 d!71587))

(declare-fun d!71589 () Bool)

(declare-fun res!177466 () Bool)

(declare-fun e!144105 () Bool)

(assert (=> d!71589 (=> (not res!177466) (not e!144105))))

(assert (=> d!71589 (= res!177466 (= (size!4612 (buf!5135 thiss!1204)) (size!4612 (buf!5135 (_2!9692 lt!332000)))))))

(assert (=> d!71589 (= (isPrefixOf!0 thiss!1204 (_2!9692 lt!332000)) e!144105)))

(declare-fun b!211319 () Bool)

(declare-fun res!177464 () Bool)

(assert (=> b!211319 (=> (not res!177464) (not e!144105))))

(assert (=> b!211319 (= res!177464 (bvsle (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)) (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!332000))) (currentByte!9689 (_2!9692 lt!332000)) (currentBit!9684 (_2!9692 lt!332000)))))))

(declare-fun b!211320 () Bool)

(declare-fun e!144104 () Bool)

(assert (=> b!211320 (= e!144105 e!144104)))

(declare-fun res!177465 () Bool)

(assert (=> b!211320 (=> res!177465 e!144104)))

(assert (=> b!211320 (= res!177465 (= (size!4612 (buf!5135 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211321 () Bool)

(assert (=> b!211321 (= e!144104 (arrayBitRangesEq!0 (buf!5135 thiss!1204) (buf!5135 (_2!9692 lt!332000)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204))))))

(assert (= (and d!71589 res!177466) b!211319))

(assert (= (and b!211319 res!177464) b!211320))

(assert (= (and b!211320 (not res!177465)) b!211321))

(assert (=> b!211319 m!325223))

(assert (=> b!211319 m!325197))

(assert (=> b!211321 m!325223))

(assert (=> b!211321 m!325223))

(declare-fun m!325621 () Bool)

(assert (=> b!211321 m!325621))

(assert (=> b!211101 d!71589))

(declare-fun d!71591 () Bool)

(assert (=> d!71591 (isPrefixOf!0 thiss!1204 (_2!9692 lt!332000))))

(declare-fun lt!332440 () Unit!15052)

(declare-fun choose!30 (BitStream!8332 BitStream!8332 BitStream!8332) Unit!15052)

(assert (=> d!71591 (= lt!332440 (choose!30 thiss!1204 (_2!9692 lt!331988) (_2!9692 lt!332000)))))

(assert (=> d!71591 (isPrefixOf!0 thiss!1204 (_2!9692 lt!331988))))

(assert (=> d!71591 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9692 lt!331988) (_2!9692 lt!332000)) lt!332440)))

(declare-fun bs!17570 () Bool)

(assert (= bs!17570 d!71591))

(assert (=> bs!17570 m!325199))

(declare-fun m!325623 () Bool)

(assert (=> bs!17570 m!325623))

(assert (=> bs!17570 m!325205))

(assert (=> b!211101 d!71591))

(declare-fun b!211486 () Bool)

(declare-fun e!144203 () tuple2!18074)

(declare-fun Unit!15073 () Unit!15052)

(assert (=> b!211486 (= e!144203 (tuple2!18075 Unit!15073 (_2!9692 lt!331988)))))

(declare-fun lt!333013 () Unit!15052)

(assert (=> b!211486 (= lt!333013 (lemmaIsPrefixRefl!0 (_2!9692 lt!331988)))))

(declare-fun call!3330 () Bool)

(assert (=> b!211486 call!3330))

(declare-fun lt!333005 () Unit!15052)

(assert (=> b!211486 (= lt!333005 lt!333013)))

(declare-fun lt!332994 () tuple2!18074)

(declare-fun bm!3327 () Bool)

(declare-fun c!10412 () Bool)

(assert (=> bm!3327 (= call!3330 (isPrefixOf!0 (_2!9692 lt!331988) (ite c!10412 (_2!9692 lt!331988) (_2!9692 lt!332994))))))

(declare-fun b!211487 () Bool)

(declare-fun lt!333018 () tuple2!18080)

(assert (=> b!211487 (= lt!333018 (readBitPure!0 (readerFrom!0 (_2!9692 lt!332994) (currentBit!9684 (_2!9692 lt!331988)) (currentByte!9689 (_2!9692 lt!331988)))))))

(declare-fun lt!332993 () Bool)

(declare-fun res!177599 () Bool)

(assert (=> b!211487 (= res!177599 (and (= (_2!9695 lt!333018) lt!332993) (= (_1!9695 lt!333018) (_2!9692 lt!332994))))))

(declare-fun e!144199 () Bool)

(assert (=> b!211487 (=> (not res!177599) (not e!144199))))

(declare-fun e!144202 () Bool)

(assert (=> b!211487 (= e!144202 e!144199)))

(declare-fun b!211488 () Bool)

(declare-fun res!177606 () Bool)

(assert (=> b!211488 (= res!177606 (= (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!332994))) (currentByte!9689 (_2!9692 lt!332994)) (currentBit!9684 (_2!9692 lt!332994))) (bvadd (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!211488 (=> (not res!177606) (not e!144202))))

(declare-fun b!211489 () Bool)

(declare-fun res!177601 () Bool)

(declare-fun e!144198 () Bool)

(assert (=> b!211489 (=> (not res!177601) (not e!144198))))

(declare-fun lt!333034 () tuple2!18074)

(assert (=> b!211489 (= res!177601 (= (size!4612 (buf!5135 (_2!9692 lt!331988))) (size!4612 (buf!5135 (_2!9692 lt!333034)))))))

(declare-fun b!211490 () Bool)

(declare-fun lt!333019 () tuple2!18074)

(assert (=> b!211490 (= e!144203 (tuple2!18075 (_1!9692 lt!333019) (_2!9692 lt!333019)))))

(assert (=> b!211490 (= lt!332993 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211490 (= lt!332994 (appendBit!0 (_2!9692 lt!331988) lt!332993))))

(declare-fun res!177597 () Bool)

(assert (=> b!211490 (= res!177597 (= (size!4612 (buf!5135 (_2!9692 lt!331988))) (size!4612 (buf!5135 (_2!9692 lt!332994)))))))

(assert (=> b!211490 (=> (not res!177597) (not e!144202))))

(assert (=> b!211490 e!144202))

(declare-fun lt!333002 () tuple2!18074)

(assert (=> b!211490 (= lt!333002 lt!332994)))

(assert (=> b!211490 (= lt!333019 (appendBitsLSBFirstLoopTR!0 (_2!9692 lt!333002) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!333008 () Unit!15052)

(assert (=> b!211490 (= lt!333008 (lemmaIsPrefixTransitive!0 (_2!9692 lt!331988) (_2!9692 lt!333002) (_2!9692 lt!333019)))))

(assert (=> b!211490 (isPrefixOf!0 (_2!9692 lt!331988) (_2!9692 lt!333019))))

(declare-fun lt!333004 () Unit!15052)

(assert (=> b!211490 (= lt!333004 lt!333008)))

(assert (=> b!211490 (invariant!0 (currentBit!9684 (_2!9692 lt!331988)) (currentByte!9689 (_2!9692 lt!331988)) (size!4612 (buf!5135 (_2!9692 lt!333002))))))

(declare-fun lt!333003 () BitStream!8332)

(assert (=> b!211490 (= lt!333003 (BitStream!8333 (buf!5135 (_2!9692 lt!333002)) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))))))

(assert (=> b!211490 (invariant!0 (currentBit!9684 lt!333003) (currentByte!9689 lt!333003) (size!4612 (buf!5135 (_2!9692 lt!333019))))))

(declare-fun lt!333025 () BitStream!8332)

(assert (=> b!211490 (= lt!333025 (BitStream!8333 (buf!5135 (_2!9692 lt!333019)) (currentByte!9689 lt!333003) (currentBit!9684 lt!333003)))))

(declare-fun lt!333006 () tuple2!18080)

(assert (=> b!211490 (= lt!333006 (readBitPure!0 lt!333003))))

(declare-fun lt!332992 () tuple2!18080)

(assert (=> b!211490 (= lt!332992 (readBitPure!0 lt!333025))))

(declare-fun lt!332988 () Unit!15052)

(assert (=> b!211490 (= lt!332988 (readBitPrefixLemma!0 lt!333003 (_2!9692 lt!333019)))))

(declare-fun res!177596 () Bool)

(assert (=> b!211490 (= res!177596 (= (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!333006))) (currentByte!9689 (_1!9695 lt!333006)) (currentBit!9684 (_1!9695 lt!333006))) (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!332992))) (currentByte!9689 (_1!9695 lt!332992)) (currentBit!9684 (_1!9695 lt!332992)))))))

(declare-fun e!144201 () Bool)

(assert (=> b!211490 (=> (not res!177596) (not e!144201))))

(assert (=> b!211490 e!144201))

(declare-fun lt!333040 () Unit!15052)

(assert (=> b!211490 (= lt!333040 lt!332988)))

(declare-fun lt!333028 () tuple2!18076)

(assert (=> b!211490 (= lt!333028 (reader!0 (_2!9692 lt!331988) (_2!9692 lt!333019)))))

(declare-fun lt!333014 () tuple2!18076)

(assert (=> b!211490 (= lt!333014 (reader!0 (_2!9692 lt!333002) (_2!9692 lt!333019)))))

(declare-fun lt!332998 () tuple2!18080)

(assert (=> b!211490 (= lt!332998 (readBitPure!0 (_1!9693 lt!333028)))))

(assert (=> b!211490 (= (_2!9695 lt!332998) lt!332993)))

(declare-fun lt!332997 () Unit!15052)

(declare-fun Unit!15074 () Unit!15052)

(assert (=> b!211490 (= lt!332997 Unit!15074)))

(declare-fun lt!333023 () (_ BitVec 64))

(assert (=> b!211490 (= lt!333023 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333001 () (_ BitVec 64))

(assert (=> b!211490 (= lt!333001 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333015 () Unit!15052)

(assert (=> b!211490 (= lt!333015 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9692 lt!331988) (buf!5135 (_2!9692 lt!333019)) lt!333001))))

(assert (=> b!211490 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!333019)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988))) lt!333001)))

(declare-fun lt!333026 () Unit!15052)

(assert (=> b!211490 (= lt!333026 lt!333015)))

(declare-fun lt!333043 () tuple2!18078)

(assert (=> b!211490 (= lt!333043 (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!333028) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333023))))

(declare-fun lt!333033 () (_ BitVec 64))

(assert (=> b!211490 (= lt!333033 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!333038 () Unit!15052)

(assert (=> b!211490 (= lt!333038 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9692 lt!333002) (buf!5135 (_2!9692 lt!333019)) lt!333033))))

(assert (=> b!211490 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!333019)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!333002))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!333002))) lt!333033)))

(declare-fun lt!332991 () Unit!15052)

(assert (=> b!211490 (= lt!332991 lt!333038)))

(declare-fun lt!333039 () tuple2!18078)

(assert (=> b!211490 (= lt!333039 (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!333014) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!333023 (ite (_2!9695 lt!332998) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!333010 () tuple2!18078)

(assert (=> b!211490 (= lt!333010 (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!333028) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333023))))

(declare-fun c!10411 () Bool)

(assert (=> b!211490 (= c!10411 (_2!9695 (readBitPure!0 (_1!9693 lt!333028))))))

(declare-fun lt!333041 () tuple2!18078)

(declare-fun e!144204 () (_ BitVec 64))

(assert (=> b!211490 (= lt!333041 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9693 lt!333028) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!333023 e!144204)))))

(declare-fun lt!332999 () Unit!15052)

(assert (=> b!211490 (= lt!332999 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9693 lt!333028) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333023))))

(assert (=> b!211490 (and (= (_2!9694 lt!333010) (_2!9694 lt!333041)) (= (_1!9694 lt!333010) (_1!9694 lt!333041)))))

(declare-fun lt!333030 () Unit!15052)

(assert (=> b!211490 (= lt!333030 lt!332999)))

(assert (=> b!211490 (= (_1!9693 lt!333028) (withMovedBitIndex!0 (_2!9693 lt!333028) (bvsub (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))) (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!333019))) (currentByte!9689 (_2!9692 lt!333019)) (currentBit!9684 (_2!9692 lt!333019))))))))

(declare-fun lt!333011 () Unit!15052)

(declare-fun Unit!15075 () Unit!15052)

(assert (=> b!211490 (= lt!333011 Unit!15075)))

(assert (=> b!211490 (= (_1!9693 lt!333014) (withMovedBitIndex!0 (_2!9693 lt!333014) (bvsub (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!333002))) (currentByte!9689 (_2!9692 lt!333002)) (currentBit!9684 (_2!9692 lt!333002))) (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!333019))) (currentByte!9689 (_2!9692 lt!333019)) (currentBit!9684 (_2!9692 lt!333019))))))))

(declare-fun lt!333024 () Unit!15052)

(declare-fun Unit!15076 () Unit!15052)

(assert (=> b!211490 (= lt!333024 Unit!15076)))

(assert (=> b!211490 (= (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))) (bvsub (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!333002))) (currentByte!9689 (_2!9692 lt!333002)) (currentBit!9684 (_2!9692 lt!333002))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!332989 () Unit!15052)

(declare-fun Unit!15077 () Unit!15052)

(assert (=> b!211490 (= lt!332989 Unit!15077)))

(assert (=> b!211490 (= (_2!9694 lt!333043) (_2!9694 lt!333039))))

(declare-fun lt!333036 () Unit!15052)

(declare-fun Unit!15078 () Unit!15052)

(assert (=> b!211490 (= lt!333036 Unit!15078)))

(assert (=> b!211490 (invariant!0 (currentBit!9684 (_2!9692 lt!333019)) (currentByte!9689 (_2!9692 lt!333019)) (size!4612 (buf!5135 (_2!9692 lt!333019))))))

(declare-fun lt!333009 () Unit!15052)

(declare-fun Unit!15079 () Unit!15052)

(assert (=> b!211490 (= lt!333009 Unit!15079)))

(assert (=> b!211490 (= (size!4612 (buf!5135 (_2!9692 lt!331988))) (size!4612 (buf!5135 (_2!9692 lt!333019))))))

(declare-fun lt!333032 () Unit!15052)

(declare-fun Unit!15080 () Unit!15052)

(assert (=> b!211490 (= lt!333032 Unit!15080)))

(assert (=> b!211490 (= (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!333019))) (currentByte!9689 (_2!9692 lt!333019)) (currentBit!9684 (_2!9692 lt!333019))) (bvsub (bvadd (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333012 () Unit!15052)

(declare-fun Unit!15081 () Unit!15052)

(assert (=> b!211490 (= lt!333012 Unit!15081)))

(declare-fun lt!333029 () Unit!15052)

(declare-fun Unit!15082 () Unit!15052)

(assert (=> b!211490 (= lt!333029 Unit!15082)))

(declare-fun lt!332996 () tuple2!18076)

(assert (=> b!211490 (= lt!332996 (reader!0 (_2!9692 lt!331988) (_2!9692 lt!333019)))))

(declare-fun lt!333031 () (_ BitVec 64))

(assert (=> b!211490 (= lt!333031 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333021 () Unit!15052)

(assert (=> b!211490 (= lt!333021 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9692 lt!331988) (buf!5135 (_2!9692 lt!333019)) lt!333031))))

(assert (=> b!211490 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!333019)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988))) lt!333031)))

(declare-fun lt!333017 () Unit!15052)

(assert (=> b!211490 (= lt!333017 lt!333021)))

(declare-fun lt!333020 () tuple2!18078)

(assert (=> b!211490 (= lt!333020 (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!332996) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!177603 () Bool)

(assert (=> b!211490 (= res!177603 (= (_2!9694 lt!333020) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!144200 () Bool)

(assert (=> b!211490 (=> (not res!177603) (not e!144200))))

(assert (=> b!211490 e!144200))

(declare-fun lt!332990 () Unit!15052)

(declare-fun Unit!15083 () Unit!15052)

(assert (=> b!211490 (= lt!332990 Unit!15083)))

(declare-fun b!211491 () Bool)

(assert (=> b!211491 (= e!144201 (= (_2!9695 lt!333006) (_2!9695 lt!332992)))))

(declare-fun b!211492 () Bool)

(declare-fun res!177598 () Bool)

(assert (=> b!211492 (=> (not res!177598) (not e!144198))))

(declare-fun lt!333042 () (_ BitVec 64))

(declare-fun lt!333037 () (_ BitVec 64))

(assert (=> b!211492 (= res!177598 (= (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!333034))) (currentByte!9689 (_2!9692 lt!333034)) (currentBit!9684 (_2!9692 lt!333034))) (bvsub lt!333037 lt!333042)))))

(assert (=> b!211492 (or (= (bvand lt!333037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333037 lt!333042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211492 (= lt!333042 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!333027 () (_ BitVec 64))

(declare-fun lt!333035 () (_ BitVec 64))

(assert (=> b!211492 (= lt!333037 (bvadd lt!333027 lt!333035))))

(assert (=> b!211492 (or (not (= (bvand lt!333027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333035 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333027 lt!333035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211492 (= lt!333035 ((_ sign_extend 32) nBits!348))))

(assert (=> b!211492 (= lt!333027 (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!331988))) (currentByte!9689 (_2!9692 lt!331988)) (currentBit!9684 (_2!9692 lt!331988))))))

(declare-fun b!211493 () Bool)

(assert (=> b!211493 (= e!144204 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!211494 () Bool)

(declare-fun e!144206 () Bool)

(assert (=> b!211494 (= e!144198 e!144206)))

(declare-fun res!177605 () Bool)

(assert (=> b!211494 (=> (not res!177605) (not e!144206))))

(declare-fun lt!333016 () tuple2!18078)

(assert (=> b!211494 (= res!177605 (= (_2!9694 lt!333016) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!332995 () tuple2!18076)

(assert (=> b!211494 (= lt!333016 (readNBitsLSBFirstsLoopPure!0 (_1!9693 lt!332995) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!333007 () Unit!15052)

(declare-fun lt!333022 () Unit!15052)

(assert (=> b!211494 (= lt!333007 lt!333022)))

(declare-fun lt!333000 () (_ BitVec 64))

(assert (=> b!211494 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!333034)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988))) lt!333000)))

(assert (=> b!211494 (= lt!333022 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9692 lt!331988) (buf!5135 (_2!9692 lt!333034)) lt!333000))))

(declare-fun e!144205 () Bool)

(assert (=> b!211494 e!144205))

(declare-fun res!177607 () Bool)

(assert (=> b!211494 (=> (not res!177607) (not e!144205))))

(assert (=> b!211494 (= res!177607 (and (= (size!4612 (buf!5135 (_2!9692 lt!331988))) (size!4612 (buf!5135 (_2!9692 lt!333034)))) (bvsge lt!333000 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211494 (= lt!333000 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!211494 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!211494 (= lt!332995 (reader!0 (_2!9692 lt!331988) (_2!9692 lt!333034)))))

(declare-fun b!211495 () Bool)

(assert (=> b!211495 (= e!144204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!211485 () Bool)

(declare-fun res!177600 () Bool)

(assert (=> b!211485 (= res!177600 call!3330)))

(assert (=> b!211485 (=> (not res!177600) (not e!144202))))

(declare-fun d!71593 () Bool)

(assert (=> d!71593 e!144198))

(declare-fun res!177604 () Bool)

(assert (=> d!71593 (=> (not res!177604) (not e!144198))))

(assert (=> d!71593 (= res!177604 (invariant!0 (currentBit!9684 (_2!9692 lt!333034)) (currentByte!9689 (_2!9692 lt!333034)) (size!4612 (buf!5135 (_2!9692 lt!333034)))))))

(assert (=> d!71593 (= lt!333034 e!144203)))

(assert (=> d!71593 (= c!10412 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71593 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71593 (= (appendBitsLSBFirstLoopTR!0 (_2!9692 lt!331988) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!333034)))

(declare-fun b!211496 () Bool)

(assert (=> b!211496 (= e!144200 (= (_1!9694 lt!333020) (_2!9693 lt!332996)))))

(declare-fun b!211497 () Bool)

(declare-fun res!177602 () Bool)

(assert (=> b!211497 (=> (not res!177602) (not e!144198))))

(assert (=> b!211497 (= res!177602 (isPrefixOf!0 (_2!9692 lt!331988) (_2!9692 lt!333034)))))

(declare-fun b!211498 () Bool)

(assert (=> b!211498 (= e!144206 (= (_1!9694 lt!333016) (_2!9693 lt!332995)))))

(declare-fun b!211499 () Bool)

(assert (=> b!211499 (= e!144205 (validate_offset_bits!1 ((_ sign_extend 32) (size!4612 (buf!5135 (_2!9692 lt!331988)))) ((_ sign_extend 32) (currentByte!9689 (_2!9692 lt!331988))) ((_ sign_extend 32) (currentBit!9684 (_2!9692 lt!331988))) lt!333000))))

(declare-fun b!211500 () Bool)

(assert (=> b!211500 (= e!144199 (= (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!333018))) (currentByte!9689 (_1!9695 lt!333018)) (currentBit!9684 (_1!9695 lt!333018))) (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!332994))) (currentByte!9689 (_2!9692 lt!332994)) (currentBit!9684 (_2!9692 lt!332994)))))))

(assert (= (and d!71593 c!10412) b!211486))

(assert (= (and d!71593 (not c!10412)) b!211490))

(assert (= (and b!211490 res!177597) b!211488))

(assert (= (and b!211488 res!177606) b!211485))

(assert (= (and b!211485 res!177600) b!211487))

(assert (= (and b!211487 res!177599) b!211500))

(assert (= (and b!211490 res!177596) b!211491))

(assert (= (and b!211490 c!10411) b!211493))

(assert (= (and b!211490 (not c!10411)) b!211495))

(assert (= (and b!211490 res!177603) b!211496))

(assert (= (or b!211486 b!211485) bm!3327))

(assert (= (and d!71593 res!177604) b!211489))

(assert (= (and b!211489 res!177601) b!211492))

(assert (= (and b!211492 res!177598) b!211497))

(assert (= (and b!211497 res!177602) b!211494))

(assert (= (and b!211494 res!177607) b!211499))

(assert (= (and b!211494 res!177605) b!211498))

(declare-fun m!325927 () Bool)

(assert (=> b!211497 m!325927))

(declare-fun m!325929 () Bool)

(assert (=> b!211487 m!325929))

(assert (=> b!211487 m!325929))

(declare-fun m!325931 () Bool)

(assert (=> b!211487 m!325931))

(declare-fun m!325933 () Bool)

(assert (=> b!211500 m!325933))

(declare-fun m!325935 () Bool)

(assert (=> b!211500 m!325935))

(declare-fun m!325937 () Bool)

(assert (=> b!211490 m!325937))

(declare-fun m!325939 () Bool)

(assert (=> b!211490 m!325939))

(declare-fun m!325941 () Bool)

(assert (=> b!211490 m!325941))

(declare-fun m!325943 () Bool)

(assert (=> b!211490 m!325943))

(declare-fun m!325945 () Bool)

(assert (=> b!211490 m!325945))

(declare-fun m!325947 () Bool)

(assert (=> b!211490 m!325947))

(declare-fun m!325949 () Bool)

(assert (=> b!211490 m!325949))

(declare-fun m!325951 () Bool)

(assert (=> b!211490 m!325951))

(declare-fun m!325953 () Bool)

(assert (=> b!211490 m!325953))

(declare-fun m!325955 () Bool)

(assert (=> b!211490 m!325955))

(declare-fun m!325957 () Bool)

(assert (=> b!211490 m!325957))

(declare-fun m!325959 () Bool)

(assert (=> b!211490 m!325959))

(declare-fun m!325961 () Bool)

(assert (=> b!211490 m!325961))

(declare-fun m!325963 () Bool)

(assert (=> b!211490 m!325963))

(declare-fun m!325965 () Bool)

(assert (=> b!211490 m!325965))

(declare-fun m!325967 () Bool)

(assert (=> b!211490 m!325967))

(declare-fun m!325969 () Bool)

(assert (=> b!211490 m!325969))

(declare-fun m!325971 () Bool)

(assert (=> b!211490 m!325971))

(declare-fun m!325973 () Bool)

(assert (=> b!211490 m!325973))

(declare-fun m!325975 () Bool)

(assert (=> b!211490 m!325975))

(declare-fun m!325977 () Bool)

(assert (=> b!211490 m!325977))

(declare-fun m!325979 () Bool)

(assert (=> b!211490 m!325979))

(declare-fun m!325981 () Bool)

(assert (=> b!211490 m!325981))

(assert (=> b!211490 m!325939))

(declare-fun m!325983 () Bool)

(assert (=> b!211490 m!325983))

(declare-fun m!325985 () Bool)

(assert (=> b!211490 m!325985))

(assert (=> b!211490 m!325221))

(declare-fun m!325987 () Bool)

(assert (=> b!211490 m!325987))

(declare-fun m!325989 () Bool)

(assert (=> b!211490 m!325989))

(declare-fun m!325991 () Bool)

(assert (=> b!211490 m!325991))

(declare-fun m!325993 () Bool)

(assert (=> b!211490 m!325993))

(declare-fun m!325995 () Bool)

(assert (=> b!211490 m!325995))

(declare-fun m!325997 () Bool)

(assert (=> b!211490 m!325997))

(declare-fun m!325999 () Bool)

(assert (=> b!211490 m!325999))

(declare-fun m!326001 () Bool)

(assert (=> b!211490 m!326001))

(assert (=> b!211486 m!325543))

(declare-fun m!326003 () Bool)

(assert (=> b!211499 m!326003))

(declare-fun m!326005 () Bool)

(assert (=> bm!3327 m!326005))

(declare-fun m!326007 () Bool)

(assert (=> b!211494 m!326007))

(declare-fun m!326009 () Bool)

(assert (=> b!211494 m!326009))

(declare-fun m!326011 () Bool)

(assert (=> b!211494 m!326011))

(assert (=> b!211494 m!325957))

(declare-fun m!326013 () Bool)

(assert (=> b!211494 m!326013))

(assert (=> b!211494 m!325999))

(declare-fun m!326015 () Bool)

(assert (=> b!211492 m!326015))

(assert (=> b!211492 m!325221))

(declare-fun m!326017 () Bool)

(assert (=> d!71593 m!326017))

(assert (=> b!211488 m!325935))

(assert (=> b!211488 m!325221))

(assert (=> b!211101 d!71593))

(declare-fun d!71683 () Bool)

(assert (=> d!71683 (= (array_inv!4353 (buf!5135 thiss!1204)) (bvsge (size!4612 (buf!5135 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!211090 d!71683))

(declare-fun d!71685 () Bool)

(assert (=> d!71685 (= (invariant!0 (currentBit!9684 (_2!9692 lt!332000)) (currentByte!9689 (_2!9692 lt!332000)) (size!4612 (buf!5135 (_2!9692 lt!332000)))) (and (bvsge (currentBit!9684 (_2!9692 lt!332000)) #b00000000000000000000000000000000) (bvslt (currentBit!9684 (_2!9692 lt!332000)) #b00000000000000000000000000001000) (bvsge (currentByte!9689 (_2!9692 lt!332000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9689 (_2!9692 lt!332000)) (size!4612 (buf!5135 (_2!9692 lt!332000)))) (and (= (currentBit!9684 (_2!9692 lt!332000)) #b00000000000000000000000000000000) (= (currentByte!9689 (_2!9692 lt!332000)) (size!4612 (buf!5135 (_2!9692 lt!332000))))))))))

(assert (=> b!211089 d!71685))

(assert (=> b!211100 d!71527))

(assert (=> b!211099 d!71545))

(assert (=> b!211099 d!71547))

(declare-fun b!211512 () Bool)

(declare-fun e!144212 () Bool)

(declare-fun e!144211 () Bool)

(assert (=> b!211512 (= e!144212 e!144211)))

(declare-fun res!177617 () Bool)

(assert (=> b!211512 (=> (not res!177617) (not e!144211))))

(declare-fun lt!333055 () tuple2!18074)

(declare-fun lt!333054 () tuple2!18080)

(assert (=> b!211512 (= res!177617 (and (= (_2!9695 lt!333054) lt!332009) (= (_1!9695 lt!333054) (_2!9692 lt!333055))))))

(assert (=> b!211512 (= lt!333054 (readBitPure!0 (readerFrom!0 (_2!9692 lt!333055) (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204))))))

(declare-fun b!211513 () Bool)

(assert (=> b!211513 (= e!144211 (= (bitIndex!0 (size!4612 (buf!5135 (_1!9695 lt!333054))) (currentByte!9689 (_1!9695 lt!333054)) (currentBit!9684 (_1!9695 lt!333054))) (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!333055))) (currentByte!9689 (_2!9692 lt!333055)) (currentBit!9684 (_2!9692 lt!333055)))))))

(declare-fun d!71687 () Bool)

(assert (=> d!71687 e!144212))

(declare-fun res!177616 () Bool)

(assert (=> d!71687 (=> (not res!177616) (not e!144212))))

(assert (=> d!71687 (= res!177616 (= (size!4612 (buf!5135 thiss!1204)) (size!4612 (buf!5135 (_2!9692 lt!333055)))))))

(declare-fun choose!16 (BitStream!8332 Bool) tuple2!18074)

(assert (=> d!71687 (= lt!333055 (choose!16 thiss!1204 lt!332009))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71687 (validate_offset_bit!0 ((_ sign_extend 32) (size!4612 (buf!5135 thiss!1204))) ((_ sign_extend 32) (currentByte!9689 thiss!1204)) ((_ sign_extend 32) (currentBit!9684 thiss!1204)))))

(assert (=> d!71687 (= (appendBit!0 thiss!1204 lt!332009) lt!333055)))

(declare-fun b!211510 () Bool)

(declare-fun res!177619 () Bool)

(assert (=> b!211510 (=> (not res!177619) (not e!144212))))

(declare-fun lt!333053 () (_ BitVec 64))

(declare-fun lt!333052 () (_ BitVec 64))

(assert (=> b!211510 (= res!177619 (= (bitIndex!0 (size!4612 (buf!5135 (_2!9692 lt!333055))) (currentByte!9689 (_2!9692 lt!333055)) (currentBit!9684 (_2!9692 lt!333055))) (bvadd lt!333053 lt!333052)))))

(assert (=> b!211510 (or (not (= (bvand lt!333053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333052 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333053 lt!333052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211510 (= lt!333052 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!211510 (= lt!333053 (bitIndex!0 (size!4612 (buf!5135 thiss!1204)) (currentByte!9689 thiss!1204) (currentBit!9684 thiss!1204)))))

(declare-fun b!211511 () Bool)

(declare-fun res!177618 () Bool)

(assert (=> b!211511 (=> (not res!177618) (not e!144212))))

(assert (=> b!211511 (= res!177618 (isPrefixOf!0 thiss!1204 (_2!9692 lt!333055)))))

(assert (= (and d!71687 res!177616) b!211510))

(assert (= (and b!211510 res!177619) b!211511))

(assert (= (and b!211511 res!177618) b!211512))

(assert (= (and b!211512 res!177617) b!211513))

(declare-fun m!326019 () Bool)

(assert (=> b!211511 m!326019))

(declare-fun m!326021 () Bool)

(assert (=> d!71687 m!326021))

(declare-fun m!326023 () Bool)

(assert (=> d!71687 m!326023))

(declare-fun m!326025 () Bool)

(assert (=> b!211513 m!326025))

(declare-fun m!326027 () Bool)

(assert (=> b!211513 m!326027))

(assert (=> b!211510 m!326027))

(assert (=> b!211510 m!325223))

(declare-fun m!326029 () Bool)

(assert (=> b!211512 m!326029))

(assert (=> b!211512 m!326029))

(declare-fun m!326031 () Bool)

(assert (=> b!211512 m!326031))

(assert (=> b!211099 d!71687))

(declare-fun d!71689 () Bool)

(assert (=> d!71689 (= (invariant!0 (currentBit!9684 thiss!1204) (currentByte!9689 thiss!1204) (size!4612 (buf!5135 (_2!9692 lt!332000)))) (and (bvsge (currentBit!9684 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9684 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9689 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9689 thiss!1204) (size!4612 (buf!5135 (_2!9692 lt!332000)))) (and (= (currentBit!9684 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9689 thiss!1204) (size!4612 (buf!5135 (_2!9692 lt!332000))))))))))

(assert (=> b!211088 d!71689))

(declare-fun d!71691 () Bool)

(declare-fun e!144213 () Bool)

(assert (=> d!71691 e!144213))

(declare-fun res!177620 () Bool)

(assert (=> d!71691 (=> (not res!177620) (not e!144213))))

(declare-fun lt!333057 () (_ BitVec 64))

(declare-fun lt!333056 () BitStream!8332)

(assert (=> d!71691 (= res!177620 (= (bvadd lt!333057 (bvsub lt!331990 lt!331998)) (bitIndex!0 (size!4612 (buf!5135 lt!333056)) (currentByte!9689 lt!333056) (currentBit!9684 lt!333056))))))

(assert (=> d!71691 (or (not (= (bvand lt!333057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331990 lt!331998) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333057 (bvsub lt!331990 lt!331998)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71691 (= lt!333057 (bitIndex!0 (size!4612 (buf!5135 (_2!9693 lt!332003))) (currentByte!9689 (_2!9693 lt!332003)) (currentBit!9684 (_2!9693 lt!332003))))))

(assert (=> d!71691 (= lt!333056 (_2!9692 (moveBitIndex!0 (_2!9693 lt!332003) (bvsub lt!331990 lt!331998))))))

(assert (=> d!71691 (moveBitIndexPrecond!0 (_2!9693 lt!332003) (bvsub lt!331990 lt!331998))))

(assert (=> d!71691 (= (withMovedBitIndex!0 (_2!9693 lt!332003) (bvsub lt!331990 lt!331998)) lt!333056)))

(declare-fun b!211514 () Bool)

(assert (=> b!211514 (= e!144213 (= (size!4612 (buf!5135 (_2!9693 lt!332003))) (size!4612 (buf!5135 lt!333056))))))

(assert (= (and d!71691 res!177620) b!211514))

(declare-fun m!326033 () Bool)

(assert (=> d!71691 m!326033))

(declare-fun m!326035 () Bool)

(assert (=> d!71691 m!326035))

(declare-fun m!326037 () Bool)

(assert (=> d!71691 m!326037))

(declare-fun m!326039 () Bool)

(assert (=> d!71691 m!326039))

(assert (=> b!211098 d!71691))

(push 1)

(assert (not d!71573))

(assert (not b!211304))

(assert (not b!211500))

(assert (not b!211301))

(assert (not b!211488))

(assert (not d!71691))

(assert (not b!211299))

(assert (not d!71591))

(assert (not d!71593))

(assert (not d!71529))

(assert (not b!211487))

(assert (not b!211511))

(assert (not d!71551))

(assert (not b!211316))

(assert (not bm!3327))

(assert (not d!71581))

(assert (not d!71575))

(assert (not d!71537))

(assert (not b!211306))

(assert (not b!211303))

(assert (not b!211319))

(assert (not d!71577))

(assert (not b!211499))

(assert (not d!71561))

(assert (not b!211486))

(assert (not b!211513))

(assert (not d!71553))

(assert (not b!211321))

(assert (not d!71569))

(assert (not b!211492))

(assert (not d!71559))

(assert (not d!71535))

(assert (not d!71587))

(assert (not d!71531))

(assert (not d!71579))

(assert (not b!211494))

(assert (not b!211512))

(assert (not d!71557))

(assert (not b!211490))

(assert (not b!211510))

(assert (not d!71567))

(assert (not d!71541))

(assert (not b!211267))

(assert (not b!211308))

(assert (not d!71545))

(assert (not d!71687))

(assert (not d!71543))

(assert (not b!211314))

(assert (not b!211272))

(assert (not b!211302))

(assert (not d!71539))

(assert (not d!71571))

(assert (not d!71547))

(assert (not b!211497))

(assert (not b!211269))

(assert (not d!71549))

(assert (not b!211307))

(assert (not d!71563))

(assert (not d!71583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

