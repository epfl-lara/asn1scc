; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42296 () Bool)

(assert start!42296)

(declare-fun b!199904 () Bool)

(declare-fun e!137184 () Bool)

(declare-fun e!137173 () Bool)

(assert (=> b!199904 (= e!137184 e!137173)))

(declare-fun res!167360 () Bool)

(assert (=> b!199904 (=> (not res!167360) (not e!137173))))

(declare-datatypes ((array!10121 0))(
  ( (array!10122 (arr!5389 (Array (_ BitVec 32) (_ BitVec 8))) (size!4459 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8026 0))(
  ( (BitStream!8027 (buf!4957 array!10121) (currentByte!9313 (_ BitVec 32)) (currentBit!9308 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8026)

(declare-fun lt!312123 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!199904 (= res!167360 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 thiss!1204))) ((_ sign_extend 32) (currentByte!9313 thiss!1204)) ((_ sign_extend 32) (currentBit!9308 thiss!1204)) lt!312123))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!199904 (= lt!312123 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!199905 () Bool)

(declare-fun e!137182 () Bool)

(declare-fun e!137178 () Bool)

(assert (=> b!199905 (= e!137182 e!137178)))

(declare-fun res!167342 () Bool)

(assert (=> b!199905 (=> res!167342 e!137178)))

(declare-datatypes ((tuple2!17144 0))(
  ( (tuple2!17145 (_1!9223 BitStream!8026) (_2!9223 BitStream!8026)) )
))
(declare-fun lt!312126 () tuple2!17144)

(declare-fun lt!312124 () BitStream!8026)

(assert (=> b!199905 (= res!167342 (not (= (_1!9223 lt!312126) lt!312124)))))

(declare-fun e!137179 () Bool)

(assert (=> b!199905 e!137179))

(declare-fun res!167353 () Bool)

(assert (=> b!199905 (=> (not res!167353) (not e!137179))))

(declare-datatypes ((tuple2!17146 0))(
  ( (tuple2!17147 (_1!9224 BitStream!8026) (_2!9224 (_ BitVec 64))) )
))
(declare-fun lt!312141 () tuple2!17146)

(declare-fun lt!312129 () tuple2!17146)

(assert (=> b!199905 (= res!167353 (and (= (_2!9224 lt!312141) (_2!9224 lt!312129)) (= (_1!9224 lt!312141) (_1!9224 lt!312129))))))

(declare-fun lt!312144 () (_ BitVec 64))

(declare-datatypes ((Unit!14199 0))(
  ( (Unit!14200) )
))
(declare-fun lt!312145 () Unit!14199)

(declare-fun lt!312132 () tuple2!17144)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14199)

(assert (=> b!199905 (= lt!312145 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9223 lt!312132) nBits!348 i!590 lt!312144))))

(declare-fun lt!312120 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17146)

(assert (=> b!199905 (= lt!312129 (readNBitsLSBFirstsLoopPure!0 lt!312124 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312120))))

(declare-fun withMovedBitIndex!0 (BitStream!8026 (_ BitVec 64)) BitStream!8026)

(assert (=> b!199905 (= lt!312124 (withMovedBitIndex!0 (_1!9223 lt!312132) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!199906 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!199906 (= e!137178 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9224 lt!312141))) (currentByte!9313 (_1!9224 lt!312141)) (currentBit!9308 (_1!9224 lt!312141))) (bitIndex!0 (size!4459 (buf!4957 (_2!9223 lt!312132))) (currentByte!9313 (_2!9223 lt!312132)) (currentBit!9308 (_2!9223 lt!312132)))))))

(declare-fun b!199907 () Bool)

(declare-fun e!137181 () Bool)

(declare-fun e!137185 () Bool)

(assert (=> b!199907 (= e!137181 e!137185)))

(declare-fun res!167361 () Bool)

(assert (=> b!199907 (=> (not res!167361) (not e!137185))))

(declare-fun lt!312133 () Bool)

(declare-datatypes ((tuple2!17148 0))(
  ( (tuple2!17149 (_1!9225 Unit!14199) (_2!9225 BitStream!8026)) )
))
(declare-fun lt!312127 () tuple2!17148)

(declare-datatypes ((tuple2!17150 0))(
  ( (tuple2!17151 (_1!9226 BitStream!8026) (_2!9226 Bool)) )
))
(declare-fun lt!312138 () tuple2!17150)

(assert (=> b!199907 (= res!167361 (and (= (_2!9226 lt!312138) lt!312133) (= (_1!9226 lt!312138) (_2!9225 lt!312127))))))

(declare-fun readBitPure!0 (BitStream!8026) tuple2!17150)

(declare-fun readerFrom!0 (BitStream!8026 (_ BitVec 32) (_ BitVec 32)) BitStream!8026)

(assert (=> b!199907 (= lt!312138 (readBitPure!0 (readerFrom!0 (_2!9225 lt!312127) (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204))))))

(declare-fun b!199908 () Bool)

(declare-fun res!167359 () Bool)

(declare-fun e!137177 () Bool)

(assert (=> b!199908 (=> res!167359 e!137177)))

(declare-fun lt!312119 () tuple2!17148)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!199908 (= res!167359 (not (invariant!0 (currentBit!9308 (_2!9225 lt!312119)) (currentByte!9313 (_2!9225 lt!312119)) (size!4459 (buf!4957 (_2!9225 lt!312119))))))))

(declare-fun b!199909 () Bool)

(declare-fun lt!312117 () tuple2!17146)

(declare-fun lt!312139 () (_ BitVec 64))

(declare-fun lt!312134 () (_ BitVec 64))

(assert (=> b!199909 (= e!137179 (and (= lt!312139 (bvsub lt!312134 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9223 lt!312126) lt!312124)) (= (_2!9224 lt!312141) (_2!9224 lt!312117)))))))

(declare-fun b!199910 () Bool)

(declare-fun lt!312135 () (_ BitVec 64))

(assert (=> b!199910 (= e!137185 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!312138))) (currentByte!9313 (_1!9226 lt!312138)) (currentBit!9308 (_1!9226 lt!312138))) lt!312135))))

(declare-fun b!199911 () Bool)

(declare-fun res!167349 () Bool)

(assert (=> b!199911 (=> (not res!167349) (not e!137179))))

(declare-fun lt!312128 () (_ BitVec 64))

(assert (=> b!199911 (= res!167349 (= (_1!9223 lt!312132) (withMovedBitIndex!0 (_2!9223 lt!312132) (bvsub lt!312139 lt!312128))))))

(declare-fun b!199912 () Bool)

(declare-fun res!167356 () Bool)

(assert (=> b!199912 (=> res!167356 e!137177)))

(declare-fun isPrefixOf!0 (BitStream!8026 BitStream!8026) Bool)

(assert (=> b!199912 (= res!167356 (not (isPrefixOf!0 thiss!1204 (_2!9225 lt!312127))))))

(declare-fun b!199913 () Bool)

(declare-fun res!167345 () Bool)

(assert (=> b!199913 (=> res!167345 e!137177)))

(assert (=> b!199913 (= res!167345 (or (not (= (size!4459 (buf!4957 (_2!9225 lt!312119))) (size!4459 (buf!4957 thiss!1204)))) (not (= lt!312128 (bvsub (bvadd lt!312139 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!199914 () Bool)

(declare-fun e!137183 () Bool)

(declare-fun array_inv!4200 (array!10121) Bool)

(assert (=> b!199914 (= e!137183 (array_inv!4200 (buf!4957 thiss!1204)))))

(declare-fun b!199915 () Bool)

(declare-fun res!167354 () Bool)

(assert (=> b!199915 (=> (not res!167354) (not e!137179))))

(assert (=> b!199915 (= res!167354 (= (_1!9223 lt!312126) (withMovedBitIndex!0 (_2!9223 lt!312126) (bvsub lt!312134 lt!312128))))))

(declare-fun b!199916 () Bool)

(declare-fun res!167358 () Bool)

(assert (=> b!199916 (=> (not res!167358) (not e!137173))))

(assert (=> b!199916 (= res!167358 (invariant!0 (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204) (size!4459 (buf!4957 thiss!1204))))))

(declare-fun b!199917 () Bool)

(declare-fun res!167352 () Bool)

(assert (=> b!199917 (=> (not res!167352) (not e!137173))))

(assert (=> b!199917 (= res!167352 (not (= i!590 nBits!348)))))

(declare-fun b!199918 () Bool)

(declare-fun e!137176 () Bool)

(declare-fun lt!312136 () tuple2!17150)

(declare-fun lt!312125 () tuple2!17150)

(assert (=> b!199918 (= e!137176 (= (_2!9226 lt!312136) (_2!9226 lt!312125)))))

(declare-fun b!199919 () Bool)

(declare-fun e!137180 () Bool)

(assert (=> b!199919 (= e!137180 e!137177)))

(declare-fun res!167357 () Bool)

(assert (=> b!199919 (=> res!167357 e!137177)))

(assert (=> b!199919 (= res!167357 (not (= lt!312128 (bvsub (bvsub (bvadd lt!312134 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!199919 (= lt!312128 (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312119))) (currentByte!9313 (_2!9225 lt!312119)) (currentBit!9308 (_2!9225 lt!312119))))))

(assert (=> b!199919 (isPrefixOf!0 thiss!1204 (_2!9225 lt!312119))))

(declare-fun lt!312130 () Unit!14199)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8026 BitStream!8026 BitStream!8026) Unit!14199)

(assert (=> b!199919 (= lt!312130 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9225 lt!312127) (_2!9225 lt!312119)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8026 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17148)

(assert (=> b!199919 (= lt!312119 (appendBitsLSBFirstLoopTR!0 (_2!9225 lt!312127) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!199920 () Bool)

(assert (=> b!199920 (= e!137177 e!137182)))

(declare-fun res!167347 () Bool)

(assert (=> b!199920 (=> res!167347 e!137182)))

(assert (=> b!199920 (= res!167347 (not (= (_1!9224 lt!312117) (_2!9223 lt!312126))))))

(assert (=> b!199920 (= lt!312117 (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!312126) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312120))))

(declare-fun lt!312118 () (_ BitVec 64))

(assert (=> b!199920 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127))) lt!312118)))

(declare-fun lt!312122 () Unit!14199)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8026 array!10121 (_ BitVec 64)) Unit!14199)

(assert (=> b!199920 (= lt!312122 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9225 lt!312127) (buf!4957 (_2!9225 lt!312119)) lt!312118))))

(assert (=> b!199920 (= lt!312118 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!312140 () (_ BitVec 64))

(declare-fun lt!312131 () tuple2!17150)

(assert (=> b!199920 (= lt!312120 (bvor lt!312144 (ite (_2!9226 lt!312131) lt!312140 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199920 (= lt!312141 (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!312132) nBits!348 i!590 lt!312144))))

(assert (=> b!199920 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))) ((_ sign_extend 32) (currentByte!9313 thiss!1204)) ((_ sign_extend 32) (currentBit!9308 thiss!1204)) lt!312123)))

(declare-fun lt!312137 () Unit!14199)

(assert (=> b!199920 (= lt!312137 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4957 (_2!9225 lt!312119)) lt!312123))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!199920 (= lt!312144 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!199920 (= (_2!9226 lt!312131) lt!312133)))

(assert (=> b!199920 (= lt!312131 (readBitPure!0 (_1!9223 lt!312132)))))

(declare-fun reader!0 (BitStream!8026 BitStream!8026) tuple2!17144)

(assert (=> b!199920 (= lt!312126 (reader!0 (_2!9225 lt!312127) (_2!9225 lt!312119)))))

(assert (=> b!199920 (= lt!312132 (reader!0 thiss!1204 (_2!9225 lt!312119)))))

(assert (=> b!199920 e!137176))

(declare-fun res!167344 () Bool)

(assert (=> b!199920 (=> (not res!167344) (not e!137176))))

(assert (=> b!199920 (= res!167344 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!312136))) (currentByte!9313 (_1!9226 lt!312136)) (currentBit!9308 (_1!9226 lt!312136))) (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!312125))) (currentByte!9313 (_1!9226 lt!312125)) (currentBit!9308 (_1!9226 lt!312125)))))))

(declare-fun lt!312143 () Unit!14199)

(declare-fun lt!312142 () BitStream!8026)

(declare-fun readBitPrefixLemma!0 (BitStream!8026 BitStream!8026) Unit!14199)

(assert (=> b!199920 (= lt!312143 (readBitPrefixLemma!0 lt!312142 (_2!9225 lt!312119)))))

(assert (=> b!199920 (= lt!312125 (readBitPure!0 (BitStream!8027 (buf!4957 (_2!9225 lt!312119)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204))))))

(assert (=> b!199920 (= lt!312136 (readBitPure!0 lt!312142))))

(declare-fun e!137186 () Bool)

(assert (=> b!199920 e!137186))

(declare-fun res!167355 () Bool)

(assert (=> b!199920 (=> (not res!167355) (not e!137186))))

(assert (=> b!199920 (= res!167355 (invariant!0 (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204) (size!4459 (buf!4957 (_2!9225 lt!312127)))))))

(assert (=> b!199920 (= lt!312142 (BitStream!8027 (buf!4957 (_2!9225 lt!312127)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)))))

(declare-fun b!199921 () Bool)

(assert (=> b!199921 (= e!137173 (not e!137180))))

(declare-fun res!167351 () Bool)

(assert (=> b!199921 (=> res!167351 e!137180)))

(assert (=> b!199921 (= res!167351 (not (= lt!312134 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!312139))))))

(assert (=> b!199921 (= lt!312134 (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))))))

(assert (=> b!199921 (= lt!312139 (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)))))

(declare-fun e!137175 () Bool)

(assert (=> b!199921 e!137175))

(declare-fun res!167348 () Bool)

(assert (=> b!199921 (=> (not res!167348) (not e!137175))))

(assert (=> b!199921 (= res!167348 (= (size!4459 (buf!4957 thiss!1204)) (size!4459 (buf!4957 (_2!9225 lt!312127)))))))

(declare-fun appendBit!0 (BitStream!8026 Bool) tuple2!17148)

(assert (=> b!199921 (= lt!312127 (appendBit!0 thiss!1204 lt!312133))))

(assert (=> b!199921 (= lt!312133 (not (= (bvand v!189 lt!312140) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199921 (= lt!312140 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun res!167343 () Bool)

(assert (=> start!42296 (=> (not res!167343) (not e!137184))))

(assert (=> start!42296 (= res!167343 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42296 e!137184))

(assert (=> start!42296 true))

(declare-fun inv!12 (BitStream!8026) Bool)

(assert (=> start!42296 (and (inv!12 thiss!1204) e!137183)))

(declare-fun b!199922 () Bool)

(declare-fun res!167341 () Bool)

(assert (=> b!199922 (=> res!167341 e!137177)))

(assert (=> b!199922 (= res!167341 (not (isPrefixOf!0 (_2!9225 lt!312127) (_2!9225 lt!312119))))))

(declare-fun b!199923 () Bool)

(assert (=> b!199923 (= e!137186 (invariant!0 (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204) (size!4459 (buf!4957 (_2!9225 lt!312119)))))))

(declare-fun b!199924 () Bool)

(declare-fun res!167350 () Bool)

(assert (=> b!199924 (=> (not res!167350) (not e!137181))))

(assert (=> b!199924 (= res!167350 (isPrefixOf!0 thiss!1204 (_2!9225 lt!312127)))))

(declare-fun b!199925 () Bool)

(assert (=> b!199925 (= e!137175 e!137181)))

(declare-fun res!167346 () Bool)

(assert (=> b!199925 (=> (not res!167346) (not e!137181))))

(declare-fun lt!312121 () (_ BitVec 64))

(assert (=> b!199925 (= res!167346 (= lt!312135 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!312121)))))

(assert (=> b!199925 (= lt!312135 (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))))))

(assert (=> b!199925 (= lt!312121 (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)))))

(assert (= (and start!42296 res!167343) b!199904))

(assert (= (and b!199904 res!167360) b!199916))

(assert (= (and b!199916 res!167358) b!199917))

(assert (= (and b!199917 res!167352) b!199921))

(assert (= (and b!199921 res!167348) b!199925))

(assert (= (and b!199925 res!167346) b!199924))

(assert (= (and b!199924 res!167350) b!199907))

(assert (= (and b!199907 res!167361) b!199910))

(assert (= (and b!199921 (not res!167351)) b!199919))

(assert (= (and b!199919 (not res!167357)) b!199908))

(assert (= (and b!199908 (not res!167359)) b!199913))

(assert (= (and b!199913 (not res!167345)) b!199922))

(assert (= (and b!199922 (not res!167341)) b!199912))

(assert (= (and b!199912 (not res!167356)) b!199920))

(assert (= (and b!199920 res!167355) b!199923))

(assert (= (and b!199920 res!167344) b!199918))

(assert (= (and b!199920 (not res!167347)) b!199905))

(assert (= (and b!199905 res!167353) b!199911))

(assert (= (and b!199911 res!167349) b!199915))

(assert (= (and b!199915 res!167354) b!199909))

(assert (= (and b!199905 (not res!167342)) b!199906))

(assert (= start!42296 b!199914))

(declare-fun m!310255 () Bool)

(assert (=> b!199911 m!310255))

(declare-fun m!310257 () Bool)

(assert (=> b!199916 m!310257))

(declare-fun m!310259 () Bool)

(assert (=> b!199923 m!310259))

(declare-fun m!310261 () Bool)

(assert (=> b!199920 m!310261))

(declare-fun m!310263 () Bool)

(assert (=> b!199920 m!310263))

(declare-fun m!310265 () Bool)

(assert (=> b!199920 m!310265))

(declare-fun m!310267 () Bool)

(assert (=> b!199920 m!310267))

(declare-fun m!310269 () Bool)

(assert (=> b!199920 m!310269))

(declare-fun m!310271 () Bool)

(assert (=> b!199920 m!310271))

(declare-fun m!310273 () Bool)

(assert (=> b!199920 m!310273))

(declare-fun m!310275 () Bool)

(assert (=> b!199920 m!310275))

(declare-fun m!310277 () Bool)

(assert (=> b!199920 m!310277))

(declare-fun m!310279 () Bool)

(assert (=> b!199920 m!310279))

(declare-fun m!310281 () Bool)

(assert (=> b!199920 m!310281))

(declare-fun m!310283 () Bool)

(assert (=> b!199920 m!310283))

(declare-fun m!310285 () Bool)

(assert (=> b!199920 m!310285))

(declare-fun m!310287 () Bool)

(assert (=> b!199920 m!310287))

(declare-fun m!310289 () Bool)

(assert (=> b!199920 m!310289))

(declare-fun m!310291 () Bool)

(assert (=> b!199920 m!310291))

(declare-fun m!310293 () Bool)

(assert (=> b!199912 m!310293))

(declare-fun m!310295 () Bool)

(assert (=> start!42296 m!310295))

(declare-fun m!310297 () Bool)

(assert (=> b!199915 m!310297))

(declare-fun m!310299 () Bool)

(assert (=> b!199921 m!310299))

(declare-fun m!310301 () Bool)

(assert (=> b!199921 m!310301))

(declare-fun m!310303 () Bool)

(assert (=> b!199921 m!310303))

(assert (=> b!199924 m!310293))

(declare-fun m!310305 () Bool)

(assert (=> b!199922 m!310305))

(declare-fun m!310307 () Bool)

(assert (=> b!199905 m!310307))

(declare-fun m!310309 () Bool)

(assert (=> b!199905 m!310309))

(declare-fun m!310311 () Bool)

(assert (=> b!199905 m!310311))

(declare-fun m!310313 () Bool)

(assert (=> b!199908 m!310313))

(declare-fun m!310315 () Bool)

(assert (=> b!199906 m!310315))

(declare-fun m!310317 () Bool)

(assert (=> b!199906 m!310317))

(assert (=> b!199925 m!310299))

(assert (=> b!199925 m!310301))

(declare-fun m!310319 () Bool)

(assert (=> b!199907 m!310319))

(assert (=> b!199907 m!310319))

(declare-fun m!310321 () Bool)

(assert (=> b!199907 m!310321))

(declare-fun m!310323 () Bool)

(assert (=> b!199914 m!310323))

(declare-fun m!310325 () Bool)

(assert (=> b!199919 m!310325))

(declare-fun m!310327 () Bool)

(assert (=> b!199919 m!310327))

(declare-fun m!310329 () Bool)

(assert (=> b!199919 m!310329))

(declare-fun m!310331 () Bool)

(assert (=> b!199919 m!310331))

(declare-fun m!310333 () Bool)

(assert (=> b!199910 m!310333))

(declare-fun m!310335 () Bool)

(assert (=> b!199904 m!310335))

(push 1)

(assert (not b!199910))

(assert (not start!42296))

(assert (not b!199911))

(assert (not b!199922))

(assert (not b!199912))

(assert (not b!199907))

(assert (not b!199921))

(assert (not b!199906))

(assert (not b!199908))

(assert (not b!199916))

(assert (not b!199923))

(assert (not b!199905))

(assert (not b!199914))

(assert (not b!199924))

(assert (not b!199915))

(assert (not b!199919))

(assert (not b!199925))

(assert (not b!199920))

(assert (not b!199904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68515 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68515 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 thiss!1204))) ((_ sign_extend 32) (currentByte!9313 thiss!1204)) ((_ sign_extend 32) (currentBit!9308 thiss!1204)) lt!312123) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 thiss!1204))) ((_ sign_extend 32) (currentByte!9313 thiss!1204)) ((_ sign_extend 32) (currentBit!9308 thiss!1204))) lt!312123))))

(declare-fun bs!16878 () Bool)

(assert (= bs!16878 d!68515))

(declare-fun m!310509 () Bool)

(assert (=> bs!16878 m!310509))

(assert (=> b!199904 d!68515))

(declare-fun d!68517 () Bool)

(declare-fun e!137280 () Bool)

(assert (=> d!68517 e!137280))

(declare-fun res!167502 () Bool)

(assert (=> d!68517 (=> (not res!167502) (not e!137280))))

(declare-fun lt!312383 () (_ BitVec 64))

(declare-fun lt!312382 () (_ BitVec 64))

(declare-fun lt!312381 () (_ BitVec 64))

(assert (=> d!68517 (= res!167502 (= lt!312382 (bvsub lt!312383 lt!312381)))))

(assert (=> d!68517 (or (= (bvand lt!312383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312383 lt!312381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68517 (= lt!312381 (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312127)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127)))))))

(declare-fun lt!312378 () (_ BitVec 64))

(declare-fun lt!312379 () (_ BitVec 64))

(assert (=> d!68517 (= lt!312383 (bvmul lt!312378 lt!312379))))

(assert (=> d!68517 (or (= lt!312378 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312379 (bvsdiv (bvmul lt!312378 lt!312379) lt!312378)))))

(assert (=> d!68517 (= lt!312379 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68517 (= lt!312378 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312127)))))))

(assert (=> d!68517 (= lt!312382 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127)))))))

(assert (=> d!68517 (invariant!0 (currentBit!9308 (_2!9225 lt!312127)) (currentByte!9313 (_2!9225 lt!312127)) (size!4459 (buf!4957 (_2!9225 lt!312127))))))

(assert (=> d!68517 (= (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))) lt!312382)))

(declare-fun b!200075 () Bool)

(declare-fun res!167501 () Bool)

(assert (=> b!200075 (=> (not res!167501) (not e!137280))))

(assert (=> b!200075 (= res!167501 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312382))))

(declare-fun b!200076 () Bool)

(declare-fun lt!312380 () (_ BitVec 64))

(assert (=> b!200076 (= e!137280 (bvsle lt!312382 (bvmul lt!312380 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200076 (or (= lt!312380 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312380 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312380)))))

(assert (=> b!200076 (= lt!312380 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312127)))))))

(assert (= (and d!68517 res!167502) b!200075))

(assert (= (and b!200075 res!167501) b!200076))

(declare-fun m!310511 () Bool)

(assert (=> d!68517 m!310511))

(declare-fun m!310513 () Bool)

(assert (=> d!68517 m!310513))

(assert (=> b!199925 d!68517))

(declare-fun d!68519 () Bool)

(declare-fun e!137281 () Bool)

(assert (=> d!68519 e!137281))

(declare-fun res!167504 () Bool)

(assert (=> d!68519 (=> (not res!167504) (not e!137281))))

(declare-fun lt!312387 () (_ BitVec 64))

(declare-fun lt!312389 () (_ BitVec 64))

(declare-fun lt!312388 () (_ BitVec 64))

(assert (=> d!68519 (= res!167504 (= lt!312388 (bvsub lt!312389 lt!312387)))))

(assert (=> d!68519 (or (= (bvand lt!312389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312387 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312389 lt!312387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68519 (= lt!312387 (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 thiss!1204))) ((_ sign_extend 32) (currentByte!9313 thiss!1204)) ((_ sign_extend 32) (currentBit!9308 thiss!1204))))))

(declare-fun lt!312384 () (_ BitVec 64))

(declare-fun lt!312385 () (_ BitVec 64))

(assert (=> d!68519 (= lt!312389 (bvmul lt!312384 lt!312385))))

(assert (=> d!68519 (or (= lt!312384 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312385 (bvsdiv (bvmul lt!312384 lt!312385) lt!312384)))))

(assert (=> d!68519 (= lt!312385 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68519 (= lt!312384 ((_ sign_extend 32) (size!4459 (buf!4957 thiss!1204))))))

(assert (=> d!68519 (= lt!312388 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9313 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9308 thiss!1204))))))

(assert (=> d!68519 (invariant!0 (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204) (size!4459 (buf!4957 thiss!1204)))))

(assert (=> d!68519 (= (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)) lt!312388)))

(declare-fun b!200077 () Bool)

(declare-fun res!167503 () Bool)

(assert (=> b!200077 (=> (not res!167503) (not e!137281))))

(assert (=> b!200077 (= res!167503 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312388))))

(declare-fun b!200078 () Bool)

(declare-fun lt!312386 () (_ BitVec 64))

(assert (=> b!200078 (= e!137281 (bvsle lt!312388 (bvmul lt!312386 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200078 (or (= lt!312386 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312386 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312386)))))

(assert (=> b!200078 (= lt!312386 ((_ sign_extend 32) (size!4459 (buf!4957 thiss!1204))))))

(assert (= (and d!68519 res!167504) b!200077))

(assert (= (and b!200077 res!167503) b!200078))

(assert (=> d!68519 m!310509))

(assert (=> d!68519 m!310257))

(assert (=> b!199925 d!68519))

(declare-fun d!68521 () Bool)

(assert (=> d!68521 (= (array_inv!4200 (buf!4957 thiss!1204)) (bvsge (size!4459 (buf!4957 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!199914 d!68521))

(declare-fun d!68523 () Bool)

(assert (=> d!68523 (= (invariant!0 (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204) (size!4459 (buf!4957 thiss!1204))) (and (bvsge (currentBit!9308 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9308 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9313 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9313 thiss!1204) (size!4459 (buf!4957 thiss!1204))) (and (= (currentBit!9308 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9313 thiss!1204) (size!4459 (buf!4957 thiss!1204)))))))))

(assert (=> b!199916 d!68523))

(declare-fun d!68525 () Bool)

(declare-fun lt!312432 () tuple2!17146)

(declare-fun lt!312429 () tuple2!17146)

(assert (=> d!68525 (and (= (_2!9224 lt!312432) (_2!9224 lt!312429)) (= (_1!9224 lt!312432) (_1!9224 lt!312429)))))

(declare-fun lt!312428 () BitStream!8026)

(declare-fun lt!312430 () (_ BitVec 64))

(declare-fun lt!312433 () Unit!14199)

(declare-fun lt!312431 () Bool)

(declare-fun choose!56 (BitStream!8026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17146 tuple2!17146 BitStream!8026 (_ BitVec 64) Bool BitStream!8026 (_ BitVec 64) tuple2!17146 tuple2!17146 BitStream!8026 (_ BitVec 64)) Unit!14199)

(assert (=> d!68525 (= lt!312433 (choose!56 (_1!9223 lt!312132) nBits!348 i!590 lt!312144 lt!312432 (tuple2!17147 (_1!9224 lt!312432) (_2!9224 lt!312432)) (_1!9224 lt!312432) (_2!9224 lt!312432) lt!312431 lt!312428 lt!312430 lt!312429 (tuple2!17147 (_1!9224 lt!312429) (_2!9224 lt!312429)) (_1!9224 lt!312429) (_2!9224 lt!312429)))))

(assert (=> d!68525 (= lt!312429 (readNBitsLSBFirstsLoopPure!0 lt!312428 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!312430))))

(assert (=> d!68525 (= lt!312430 (bvor lt!312144 (ite lt!312431 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68525 (= lt!312428 (withMovedBitIndex!0 (_1!9223 lt!312132) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!68525 (= lt!312431 (_2!9226 (readBitPure!0 (_1!9223 lt!312132))))))

(assert (=> d!68525 (= lt!312432 (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!312132) nBits!348 i!590 lt!312144))))

(assert (=> d!68525 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9223 lt!312132) nBits!348 i!590 lt!312144) lt!312433)))

(declare-fun bs!16882 () Bool)

(assert (= bs!16882 d!68525))

(declare-fun m!310549 () Bool)

(assert (=> bs!16882 m!310549))

(declare-fun m!310551 () Bool)

(assert (=> bs!16882 m!310551))

(assert (=> bs!16882 m!310263))

(assert (=> bs!16882 m!310311))

(assert (=> bs!16882 m!310265))

(assert (=> b!199905 d!68525))

(declare-fun d!68535 () Bool)

(declare-datatypes ((tuple2!17172 0))(
  ( (tuple2!17173 (_1!9237 (_ BitVec 64)) (_2!9237 BitStream!8026)) )
))
(declare-fun lt!312461 () tuple2!17172)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17172)

(assert (=> d!68535 (= lt!312461 (readNBitsLSBFirstsLoop!0 lt!312124 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312120))))

(assert (=> d!68535 (= (readNBitsLSBFirstsLoopPure!0 lt!312124 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312120) (tuple2!17147 (_2!9237 lt!312461) (_1!9237 lt!312461)))))

(declare-fun bs!16886 () Bool)

(assert (= bs!16886 d!68535))

(declare-fun m!310585 () Bool)

(assert (=> bs!16886 m!310585))

(assert (=> b!199905 d!68535))

(declare-fun d!68545 () Bool)

(declare-fun e!137288 () Bool)

(assert (=> d!68545 e!137288))

(declare-fun res!167513 () Bool)

(assert (=> d!68545 (=> (not res!167513) (not e!137288))))

(declare-fun lt!312467 () (_ BitVec 64))

(declare-fun lt!312466 () BitStream!8026)

(assert (=> d!68545 (= res!167513 (= (bvadd lt!312467 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4459 (buf!4957 lt!312466)) (currentByte!9313 lt!312466) (currentBit!9308 lt!312466))))))

(assert (=> d!68545 (or (not (= (bvand lt!312467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312467 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68545 (= lt!312467 (bitIndex!0 (size!4459 (buf!4957 (_1!9223 lt!312132))) (currentByte!9313 (_1!9223 lt!312132)) (currentBit!9308 (_1!9223 lt!312132))))))

(declare-fun moveBitIndex!0 (BitStream!8026 (_ BitVec 64)) tuple2!17148)

(assert (=> d!68545 (= lt!312466 (_2!9225 (moveBitIndex!0 (_1!9223 lt!312132) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8026 (_ BitVec 64)) Bool)

(assert (=> d!68545 (moveBitIndexPrecond!0 (_1!9223 lt!312132) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!68545 (= (withMovedBitIndex!0 (_1!9223 lt!312132) #b0000000000000000000000000000000000000000000000000000000000000001) lt!312466)))

(declare-fun b!200091 () Bool)

(assert (=> b!200091 (= e!137288 (= (size!4459 (buf!4957 (_1!9223 lt!312132))) (size!4459 (buf!4957 lt!312466))))))

(assert (= (and d!68545 res!167513) b!200091))

(declare-fun m!310587 () Bool)

(assert (=> d!68545 m!310587))

(declare-fun m!310589 () Bool)

(assert (=> d!68545 m!310589))

(declare-fun m!310591 () Bool)

(assert (=> d!68545 m!310591))

(declare-fun m!310593 () Bool)

(assert (=> d!68545 m!310593))

(assert (=> b!199905 d!68545))

(declare-fun d!68547 () Bool)

(declare-fun e!137289 () Bool)

(assert (=> d!68547 e!137289))

(declare-fun res!167514 () Bool)

(assert (=> d!68547 (=> (not res!167514) (not e!137289))))

(declare-fun lt!312470 () BitStream!8026)

(declare-fun lt!312471 () (_ BitVec 64))

(assert (=> d!68547 (= res!167514 (= (bvadd lt!312471 (bvsub lt!312134 lt!312128)) (bitIndex!0 (size!4459 (buf!4957 lt!312470)) (currentByte!9313 lt!312470) (currentBit!9308 lt!312470))))))

(assert (=> d!68547 (or (not (= (bvand lt!312471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312134 lt!312128) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312471 (bvsub lt!312134 lt!312128)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68547 (= lt!312471 (bitIndex!0 (size!4459 (buf!4957 (_2!9223 lt!312126))) (currentByte!9313 (_2!9223 lt!312126)) (currentBit!9308 (_2!9223 lt!312126))))))

(assert (=> d!68547 (= lt!312470 (_2!9225 (moveBitIndex!0 (_2!9223 lt!312126) (bvsub lt!312134 lt!312128))))))

(assert (=> d!68547 (moveBitIndexPrecond!0 (_2!9223 lt!312126) (bvsub lt!312134 lt!312128))))

(assert (=> d!68547 (= (withMovedBitIndex!0 (_2!9223 lt!312126) (bvsub lt!312134 lt!312128)) lt!312470)))

(declare-fun b!200092 () Bool)

(assert (=> b!200092 (= e!137289 (= (size!4459 (buf!4957 (_2!9223 lt!312126))) (size!4459 (buf!4957 lt!312470))))))

(assert (= (and d!68547 res!167514) b!200092))

(declare-fun m!310595 () Bool)

(assert (=> d!68547 m!310595))

(declare-fun m!310597 () Bool)

(assert (=> d!68547 m!310597))

(declare-fun m!310599 () Bool)

(assert (=> d!68547 m!310599))

(declare-fun m!310601 () Bool)

(assert (=> d!68547 m!310601))

(assert (=> b!199915 d!68547))

(declare-fun d!68549 () Bool)

(declare-fun res!167529 () Bool)

(declare-fun e!137299 () Bool)

(assert (=> d!68549 (=> (not res!167529) (not e!137299))))

(assert (=> d!68549 (= res!167529 (= (size!4459 (buf!4957 thiss!1204)) (size!4459 (buf!4957 (_2!9225 lt!312127)))))))

(assert (=> d!68549 (= (isPrefixOf!0 thiss!1204 (_2!9225 lt!312127)) e!137299)))

(declare-fun b!200107 () Bool)

(declare-fun res!167530 () Bool)

(assert (=> b!200107 (=> (not res!167530) (not e!137299))))

(assert (=> b!200107 (= res!167530 (bvsle (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)) (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127)))))))

(declare-fun b!200108 () Bool)

(declare-fun e!137298 () Bool)

(assert (=> b!200108 (= e!137299 e!137298)))

(declare-fun res!167531 () Bool)

(assert (=> b!200108 (=> res!167531 e!137298)))

(assert (=> b!200108 (= res!167531 (= (size!4459 (buf!4957 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200109 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10121 array!10121 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200109 (= e!137298 (arrayBitRangesEq!0 (buf!4957 thiss!1204) (buf!4957 (_2!9225 lt!312127)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204))))))

(assert (= (and d!68549 res!167529) b!200107))

(assert (= (and b!200107 res!167530) b!200108))

(assert (= (and b!200108 (not res!167531)) b!200109))

(assert (=> b!200107 m!310301))

(assert (=> b!200107 m!310299))

(assert (=> b!200109 m!310301))

(assert (=> b!200109 m!310301))

(declare-fun m!310611 () Bool)

(assert (=> b!200109 m!310611))

(assert (=> b!199912 d!68549))

(declare-fun d!68555 () Bool)

(declare-fun res!167532 () Bool)

(declare-fun e!137301 () Bool)

(assert (=> d!68555 (=> (not res!167532) (not e!137301))))

(assert (=> d!68555 (= res!167532 (= (size!4459 (buf!4957 (_2!9225 lt!312127))) (size!4459 (buf!4957 (_2!9225 lt!312119)))))))

(assert (=> d!68555 (= (isPrefixOf!0 (_2!9225 lt!312127) (_2!9225 lt!312119)) e!137301)))

(declare-fun b!200110 () Bool)

(declare-fun res!167533 () Bool)

(assert (=> b!200110 (=> (not res!167533) (not e!137301))))

(assert (=> b!200110 (= res!167533 (bvsle (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))) (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312119))) (currentByte!9313 (_2!9225 lt!312119)) (currentBit!9308 (_2!9225 lt!312119)))))))

(declare-fun b!200111 () Bool)

(declare-fun e!137300 () Bool)

(assert (=> b!200111 (= e!137301 e!137300)))

(declare-fun res!167534 () Bool)

(assert (=> b!200111 (=> res!167534 e!137300)))

(assert (=> b!200111 (= res!167534 (= (size!4459 (buf!4957 (_2!9225 lt!312127))) #b00000000000000000000000000000000))))

(declare-fun b!200112 () Bool)

(assert (=> b!200112 (= e!137300 (arrayBitRangesEq!0 (buf!4957 (_2!9225 lt!312127)) (buf!4957 (_2!9225 lt!312119)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127)))))))

(assert (= (and d!68555 res!167532) b!200110))

(assert (= (and b!200110 res!167533) b!200111))

(assert (= (and b!200111 (not res!167534)) b!200112))

(assert (=> b!200110 m!310299))

(assert (=> b!200110 m!310325))

(assert (=> b!200112 m!310299))

(assert (=> b!200112 m!310299))

(declare-fun m!310613 () Bool)

(assert (=> b!200112 m!310613))

(assert (=> b!199922 d!68555))

(declare-fun d!68557 () Bool)

(declare-fun e!137302 () Bool)

(assert (=> d!68557 e!137302))

(declare-fun res!167535 () Bool)

(assert (=> d!68557 (=> (not res!167535) (not e!137302))))

(declare-fun lt!312494 () BitStream!8026)

(declare-fun lt!312495 () (_ BitVec 64))

(assert (=> d!68557 (= res!167535 (= (bvadd lt!312495 (bvsub lt!312139 lt!312128)) (bitIndex!0 (size!4459 (buf!4957 lt!312494)) (currentByte!9313 lt!312494) (currentBit!9308 lt!312494))))))

(assert (=> d!68557 (or (not (= (bvand lt!312495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312139 lt!312128) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312495 (bvsub lt!312139 lt!312128)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68557 (= lt!312495 (bitIndex!0 (size!4459 (buf!4957 (_2!9223 lt!312132))) (currentByte!9313 (_2!9223 lt!312132)) (currentBit!9308 (_2!9223 lt!312132))))))

(assert (=> d!68557 (= lt!312494 (_2!9225 (moveBitIndex!0 (_2!9223 lt!312132) (bvsub lt!312139 lt!312128))))))

(assert (=> d!68557 (moveBitIndexPrecond!0 (_2!9223 lt!312132) (bvsub lt!312139 lt!312128))))

(assert (=> d!68557 (= (withMovedBitIndex!0 (_2!9223 lt!312132) (bvsub lt!312139 lt!312128)) lt!312494)))

(declare-fun b!200113 () Bool)

(assert (=> b!200113 (= e!137302 (= (size!4459 (buf!4957 (_2!9223 lt!312132))) (size!4459 (buf!4957 lt!312494))))))

(assert (= (and d!68557 res!167535) b!200113))

(declare-fun m!310615 () Bool)

(assert (=> d!68557 m!310615))

(assert (=> d!68557 m!310317))

(declare-fun m!310617 () Bool)

(assert (=> d!68557 m!310617))

(declare-fun m!310619 () Bool)

(assert (=> d!68557 m!310619))

(assert (=> b!199911 d!68557))

(assert (=> b!199924 d!68549))

(declare-fun d!68559 () Bool)

(assert (=> d!68559 (= (invariant!0 (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204) (size!4459 (buf!4957 (_2!9225 lt!312119)))) (and (bvsge (currentBit!9308 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9308 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9313 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9313 thiss!1204) (size!4459 (buf!4957 (_2!9225 lt!312119)))) (and (= (currentBit!9308 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9313 thiss!1204) (size!4459 (buf!4957 (_2!9225 lt!312119))))))))))

(assert (=> b!199923 d!68559))

(declare-fun d!68561 () Bool)

(assert (=> d!68561 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204) (size!4459 (buf!4957 thiss!1204))))))

(declare-fun bs!16887 () Bool)

(assert (= bs!16887 d!68561))

(assert (=> bs!16887 m!310257))

(assert (=> start!42296 d!68561))

(declare-fun d!68563 () Bool)

(assert (=> d!68563 (= (invariant!0 (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204) (size!4459 (buf!4957 (_2!9225 lt!312127)))) (and (bvsge (currentBit!9308 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9308 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9313 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9313 thiss!1204) (size!4459 (buf!4957 (_2!9225 lt!312127)))) (and (= (currentBit!9308 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9313 thiss!1204) (size!4459 (buf!4957 (_2!9225 lt!312127))))))))))

(assert (=> b!199920 d!68563))

(declare-fun d!68565 () Bool)

(assert (=> d!68565 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))) ((_ sign_extend 32) (currentByte!9313 thiss!1204)) ((_ sign_extend 32) (currentBit!9308 thiss!1204)) lt!312123) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))) ((_ sign_extend 32) (currentByte!9313 thiss!1204)) ((_ sign_extend 32) (currentBit!9308 thiss!1204))) lt!312123))))

(declare-fun bs!16888 () Bool)

(assert (= bs!16888 d!68565))

(declare-fun m!310621 () Bool)

(assert (=> bs!16888 m!310621))

(assert (=> b!199920 d!68565))

(declare-fun d!68567 () Bool)

(declare-fun e!137303 () Bool)

(assert (=> d!68567 e!137303))

(declare-fun res!167537 () Bool)

(assert (=> d!68567 (=> (not res!167537) (not e!137303))))

(declare-fun lt!312499 () (_ BitVec 64))

(declare-fun lt!312500 () (_ BitVec 64))

(declare-fun lt!312501 () (_ BitVec 64))

(assert (=> d!68567 (= res!167537 (= lt!312500 (bvsub lt!312501 lt!312499)))))

(assert (=> d!68567 (or (= (bvand lt!312501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312499 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312501 lt!312499) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68567 (= lt!312499 (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9226 lt!312136)))) ((_ sign_extend 32) (currentByte!9313 (_1!9226 lt!312136))) ((_ sign_extend 32) (currentBit!9308 (_1!9226 lt!312136)))))))

(declare-fun lt!312496 () (_ BitVec 64))

(declare-fun lt!312497 () (_ BitVec 64))

(assert (=> d!68567 (= lt!312501 (bvmul lt!312496 lt!312497))))

(assert (=> d!68567 (or (= lt!312496 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312497 (bvsdiv (bvmul lt!312496 lt!312497) lt!312496)))))

(assert (=> d!68567 (= lt!312497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68567 (= lt!312496 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9226 lt!312136)))))))

(assert (=> d!68567 (= lt!312500 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9313 (_1!9226 lt!312136))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9308 (_1!9226 lt!312136)))))))

(assert (=> d!68567 (invariant!0 (currentBit!9308 (_1!9226 lt!312136)) (currentByte!9313 (_1!9226 lt!312136)) (size!4459 (buf!4957 (_1!9226 lt!312136))))))

(assert (=> d!68567 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!312136))) (currentByte!9313 (_1!9226 lt!312136)) (currentBit!9308 (_1!9226 lt!312136))) lt!312500)))

(declare-fun b!200114 () Bool)

(declare-fun res!167536 () Bool)

(assert (=> b!200114 (=> (not res!167536) (not e!137303))))

(assert (=> b!200114 (= res!167536 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312500))))

(declare-fun b!200115 () Bool)

(declare-fun lt!312498 () (_ BitVec 64))

(assert (=> b!200115 (= e!137303 (bvsle lt!312500 (bvmul lt!312498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200115 (or (= lt!312498 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312498 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312498)))))

(assert (=> b!200115 (= lt!312498 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9226 lt!312136)))))))

(assert (= (and d!68567 res!167537) b!200114))

(assert (= (and b!200114 res!167536) b!200115))

(declare-fun m!310623 () Bool)

(assert (=> d!68567 m!310623))

(declare-fun m!310625 () Bool)

(assert (=> d!68567 m!310625))

(assert (=> b!199920 d!68567))

(declare-fun d!68569 () Bool)

(assert (=> d!68569 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127))) lt!312118)))

(declare-fun lt!312510 () Unit!14199)

(declare-fun choose!9 (BitStream!8026 array!10121 (_ BitVec 64) BitStream!8026) Unit!14199)

(assert (=> d!68569 (= lt!312510 (choose!9 (_2!9225 lt!312127) (buf!4957 (_2!9225 lt!312119)) lt!312118 (BitStream!8027 (buf!4957 (_2!9225 lt!312119)) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127)))))))

(assert (=> d!68569 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9225 lt!312127) (buf!4957 (_2!9225 lt!312119)) lt!312118) lt!312510)))

(declare-fun bs!16889 () Bool)

(assert (= bs!16889 d!68569))

(assert (=> bs!16889 m!310271))

(declare-fun m!310627 () Bool)

(assert (=> bs!16889 m!310627))

(assert (=> b!199920 d!68569))

(declare-fun d!68571 () Bool)

(declare-datatypes ((tuple2!17174 0))(
  ( (tuple2!17175 (_1!9238 Bool) (_2!9238 BitStream!8026)) )
))
(declare-fun lt!312519 () tuple2!17174)

(declare-fun readBit!0 (BitStream!8026) tuple2!17174)

(assert (=> d!68571 (= lt!312519 (readBit!0 (_1!9223 lt!312132)))))

(assert (=> d!68571 (= (readBitPure!0 (_1!9223 lt!312132)) (tuple2!17151 (_2!9238 lt!312519) (_1!9238 lt!312519)))))

(declare-fun bs!16890 () Bool)

(assert (= bs!16890 d!68571))

(declare-fun m!310637 () Bool)

(assert (=> bs!16890 m!310637))

(assert (=> b!199920 d!68571))

(declare-fun d!68573 () Bool)

(declare-fun lt!312520 () tuple2!17172)

(assert (=> d!68573 (= lt!312520 (readNBitsLSBFirstsLoop!0 (_1!9223 lt!312126) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312120))))

(assert (=> d!68573 (= (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!312126) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312120) (tuple2!17147 (_2!9237 lt!312520) (_1!9237 lt!312520)))))

(declare-fun bs!16892 () Bool)

(assert (= bs!16892 d!68573))

(declare-fun m!310643 () Bool)

(assert (=> bs!16892 m!310643))

(assert (=> b!199920 d!68573))

(declare-fun b!200144 () Bool)

(declare-fun e!137321 () Unit!14199)

(declare-fun Unit!14207 () Unit!14199)

(assert (=> b!200144 (= e!137321 Unit!14207)))

(declare-fun lt!312591 () (_ BitVec 64))

(declare-fun lt!312581 () (_ BitVec 64))

(declare-fun e!137322 () Bool)

(declare-fun lt!312590 () tuple2!17144)

(declare-fun b!200145 () Bool)

(assert (=> b!200145 (= e!137322 (= (_1!9223 lt!312590) (withMovedBitIndex!0 (_2!9223 lt!312590) (bvsub lt!312581 lt!312591))))))

(assert (=> b!200145 (or (= (bvand lt!312581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312591 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312581 lt!312591) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200145 (= lt!312591 (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312119))) (currentByte!9313 (_2!9225 lt!312119)) (currentBit!9308 (_2!9225 lt!312119))))))

(assert (=> b!200145 (= lt!312581 (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)))))

(declare-fun b!200146 () Bool)

(declare-fun lt!312574 () Unit!14199)

(assert (=> b!200146 (= e!137321 lt!312574)))

(declare-fun lt!312583 () (_ BitVec 64))

(assert (=> b!200146 (= lt!312583 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!312577 () (_ BitVec 64))

(assert (=> b!200146 (= lt!312577 (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10121 array!10121 (_ BitVec 64) (_ BitVec 64)) Unit!14199)

(assert (=> b!200146 (= lt!312574 (arrayBitRangesEqSymmetric!0 (buf!4957 thiss!1204) (buf!4957 (_2!9225 lt!312119)) lt!312583 lt!312577))))

(assert (=> b!200146 (arrayBitRangesEq!0 (buf!4957 (_2!9225 lt!312119)) (buf!4957 thiss!1204) lt!312583 lt!312577)))

(declare-fun b!200147 () Bool)

(declare-fun res!167563 () Bool)

(assert (=> b!200147 (=> (not res!167563) (not e!137322))))

(assert (=> b!200147 (= res!167563 (isPrefixOf!0 (_1!9223 lt!312590) thiss!1204))))

(declare-fun d!68579 () Bool)

(assert (=> d!68579 e!137322))

(declare-fun res!167564 () Bool)

(assert (=> d!68579 (=> (not res!167564) (not e!137322))))

(assert (=> d!68579 (= res!167564 (isPrefixOf!0 (_1!9223 lt!312590) (_2!9223 lt!312590)))))

(declare-fun lt!312587 () BitStream!8026)

(assert (=> d!68579 (= lt!312590 (tuple2!17145 lt!312587 (_2!9225 lt!312119)))))

(declare-fun lt!312584 () Unit!14199)

(declare-fun lt!312593 () Unit!14199)

(assert (=> d!68579 (= lt!312584 lt!312593)))

(assert (=> d!68579 (isPrefixOf!0 lt!312587 (_2!9225 lt!312119))))

(assert (=> d!68579 (= lt!312593 (lemmaIsPrefixTransitive!0 lt!312587 (_2!9225 lt!312119) (_2!9225 lt!312119)))))

(declare-fun lt!312580 () Unit!14199)

(declare-fun lt!312579 () Unit!14199)

(assert (=> d!68579 (= lt!312580 lt!312579)))

(assert (=> d!68579 (isPrefixOf!0 lt!312587 (_2!9225 lt!312119))))

(assert (=> d!68579 (= lt!312579 (lemmaIsPrefixTransitive!0 lt!312587 thiss!1204 (_2!9225 lt!312119)))))

(declare-fun lt!312576 () Unit!14199)

(assert (=> d!68579 (= lt!312576 e!137321)))

(declare-fun c!9986 () Bool)

(assert (=> d!68579 (= c!9986 (not (= (size!4459 (buf!4957 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!312589 () Unit!14199)

(declare-fun lt!312592 () Unit!14199)

(assert (=> d!68579 (= lt!312589 lt!312592)))

(assert (=> d!68579 (isPrefixOf!0 (_2!9225 lt!312119) (_2!9225 lt!312119))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8026) Unit!14199)

(assert (=> d!68579 (= lt!312592 (lemmaIsPrefixRefl!0 (_2!9225 lt!312119)))))

(declare-fun lt!312586 () Unit!14199)

(declare-fun lt!312578 () Unit!14199)

(assert (=> d!68579 (= lt!312586 lt!312578)))

(assert (=> d!68579 (= lt!312578 (lemmaIsPrefixRefl!0 (_2!9225 lt!312119)))))

(declare-fun lt!312575 () Unit!14199)

(declare-fun lt!312582 () Unit!14199)

(assert (=> d!68579 (= lt!312575 lt!312582)))

(assert (=> d!68579 (isPrefixOf!0 lt!312587 lt!312587)))

(assert (=> d!68579 (= lt!312582 (lemmaIsPrefixRefl!0 lt!312587))))

(declare-fun lt!312585 () Unit!14199)

(declare-fun lt!312588 () Unit!14199)

(assert (=> d!68579 (= lt!312585 lt!312588)))

(assert (=> d!68579 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68579 (= lt!312588 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!68579 (= lt!312587 (BitStream!8027 (buf!4957 (_2!9225 lt!312119)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)))))

(assert (=> d!68579 (isPrefixOf!0 thiss!1204 (_2!9225 lt!312119))))

(assert (=> d!68579 (= (reader!0 thiss!1204 (_2!9225 lt!312119)) lt!312590)))

(declare-fun b!200148 () Bool)

(declare-fun res!167562 () Bool)

(assert (=> b!200148 (=> (not res!167562) (not e!137322))))

(assert (=> b!200148 (= res!167562 (isPrefixOf!0 (_2!9223 lt!312590) (_2!9225 lt!312119)))))

(assert (= (and d!68579 c!9986) b!200146))

(assert (= (and d!68579 (not c!9986)) b!200144))

(assert (= (and d!68579 res!167564) b!200147))

(assert (= (and b!200147 res!167563) b!200148))

(assert (= (and b!200148 res!167562) b!200145))

(declare-fun m!310665 () Bool)

(assert (=> b!200145 m!310665))

(assert (=> b!200145 m!310325))

(assert (=> b!200145 m!310301))

(assert (=> b!200146 m!310301))

(declare-fun m!310667 () Bool)

(assert (=> b!200146 m!310667))

(declare-fun m!310669 () Bool)

(assert (=> b!200146 m!310669))

(assert (=> d!68579 m!310327))

(declare-fun m!310671 () Bool)

(assert (=> d!68579 m!310671))

(declare-fun m!310673 () Bool)

(assert (=> d!68579 m!310673))

(declare-fun m!310675 () Bool)

(assert (=> d!68579 m!310675))

(declare-fun m!310677 () Bool)

(assert (=> d!68579 m!310677))

(declare-fun m!310679 () Bool)

(assert (=> d!68579 m!310679))

(declare-fun m!310681 () Bool)

(assert (=> d!68579 m!310681))

(declare-fun m!310683 () Bool)

(assert (=> d!68579 m!310683))

(declare-fun m!310685 () Bool)

(assert (=> d!68579 m!310685))

(declare-fun m!310687 () Bool)

(assert (=> d!68579 m!310687))

(declare-fun m!310689 () Bool)

(assert (=> d!68579 m!310689))

(declare-fun m!310691 () Bool)

(assert (=> b!200148 m!310691))

(declare-fun m!310693 () Bool)

(assert (=> b!200147 m!310693))

(assert (=> b!199920 d!68579))

(declare-fun d!68601 () Bool)

(assert (=> d!68601 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))) ((_ sign_extend 32) (currentByte!9313 thiss!1204)) ((_ sign_extend 32) (currentBit!9308 thiss!1204)) lt!312123)))

(declare-fun lt!312594 () Unit!14199)

(assert (=> d!68601 (= lt!312594 (choose!9 thiss!1204 (buf!4957 (_2!9225 lt!312119)) lt!312123 (BitStream!8027 (buf!4957 (_2!9225 lt!312119)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204))))))

(assert (=> d!68601 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4957 (_2!9225 lt!312119)) lt!312123) lt!312594)))

(declare-fun bs!16897 () Bool)

(assert (= bs!16897 d!68601))

(assert (=> bs!16897 m!310269))

(declare-fun m!310695 () Bool)

(assert (=> bs!16897 m!310695))

(assert (=> b!199920 d!68601))

(declare-fun d!68603 () Bool)

(declare-fun lt!312595 () tuple2!17174)

(assert (=> d!68603 (= lt!312595 (readBit!0 lt!312142))))

(assert (=> d!68603 (= (readBitPure!0 lt!312142) (tuple2!17151 (_2!9238 lt!312595) (_1!9238 lt!312595)))))

(declare-fun bs!16898 () Bool)

(assert (= bs!16898 d!68603))

(declare-fun m!310697 () Bool)

(assert (=> bs!16898 m!310697))

(assert (=> b!199920 d!68603))

(declare-fun d!68605 () Bool)

(declare-fun e!137323 () Bool)

(assert (=> d!68605 e!137323))

(declare-fun res!167566 () Bool)

(assert (=> d!68605 (=> (not res!167566) (not e!137323))))

(declare-fun lt!312600 () (_ BitVec 64))

(declare-fun lt!312599 () (_ BitVec 64))

(declare-fun lt!312601 () (_ BitVec 64))

(assert (=> d!68605 (= res!167566 (= lt!312600 (bvsub lt!312601 lt!312599)))))

(assert (=> d!68605 (or (= (bvand lt!312601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312599 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312601 lt!312599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68605 (= lt!312599 (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9226 lt!312125)))) ((_ sign_extend 32) (currentByte!9313 (_1!9226 lt!312125))) ((_ sign_extend 32) (currentBit!9308 (_1!9226 lt!312125)))))))

(declare-fun lt!312596 () (_ BitVec 64))

(declare-fun lt!312597 () (_ BitVec 64))

(assert (=> d!68605 (= lt!312601 (bvmul lt!312596 lt!312597))))

(assert (=> d!68605 (or (= lt!312596 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312597 (bvsdiv (bvmul lt!312596 lt!312597) lt!312596)))))

(assert (=> d!68605 (= lt!312597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68605 (= lt!312596 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9226 lt!312125)))))))

(assert (=> d!68605 (= lt!312600 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9313 (_1!9226 lt!312125))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9308 (_1!9226 lt!312125)))))))

(assert (=> d!68605 (invariant!0 (currentBit!9308 (_1!9226 lt!312125)) (currentByte!9313 (_1!9226 lt!312125)) (size!4459 (buf!4957 (_1!9226 lt!312125))))))

(assert (=> d!68605 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!312125))) (currentByte!9313 (_1!9226 lt!312125)) (currentBit!9308 (_1!9226 lt!312125))) lt!312600)))

(declare-fun b!200149 () Bool)

(declare-fun res!167565 () Bool)

(assert (=> b!200149 (=> (not res!167565) (not e!137323))))

(assert (=> b!200149 (= res!167565 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312600))))

(declare-fun b!200150 () Bool)

(declare-fun lt!312598 () (_ BitVec 64))

(assert (=> b!200150 (= e!137323 (bvsle lt!312600 (bvmul lt!312598 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200150 (or (= lt!312598 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312598 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312598)))))

(assert (=> b!200150 (= lt!312598 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9226 lt!312125)))))))

(assert (= (and d!68605 res!167566) b!200149))

(assert (= (and b!200149 res!167565) b!200150))

(declare-fun m!310699 () Bool)

(assert (=> d!68605 m!310699))

(declare-fun m!310701 () Bool)

(assert (=> d!68605 m!310701))

(assert (=> b!199920 d!68605))

(declare-fun d!68607 () Bool)

(declare-fun lt!312602 () tuple2!17174)

(assert (=> d!68607 (= lt!312602 (readBit!0 (BitStream!8027 (buf!4957 (_2!9225 lt!312119)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204))))))

(assert (=> d!68607 (= (readBitPure!0 (BitStream!8027 (buf!4957 (_2!9225 lt!312119)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204))) (tuple2!17151 (_2!9238 lt!312602) (_1!9238 lt!312602)))))

(declare-fun bs!16899 () Bool)

(assert (= bs!16899 d!68607))

(declare-fun m!310703 () Bool)

(assert (=> bs!16899 m!310703))

(assert (=> b!199920 d!68607))

(declare-fun d!68609 () Bool)

(declare-fun e!137326 () Bool)

(assert (=> d!68609 e!137326))

(declare-fun res!167569 () Bool)

(assert (=> d!68609 (=> (not res!167569) (not e!137326))))

(declare-fun lt!312614 () tuple2!17150)

(declare-fun lt!312611 () tuple2!17150)

(assert (=> d!68609 (= res!167569 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!312614))) (currentByte!9313 (_1!9226 lt!312614)) (currentBit!9308 (_1!9226 lt!312614))) (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!312611))) (currentByte!9313 (_1!9226 lt!312611)) (currentBit!9308 (_1!9226 lt!312611)))))))

(declare-fun lt!312612 () BitStream!8026)

(declare-fun lt!312613 () Unit!14199)

(declare-fun choose!50 (BitStream!8026 BitStream!8026 BitStream!8026 tuple2!17150 tuple2!17150 BitStream!8026 Bool tuple2!17150 tuple2!17150 BitStream!8026 Bool) Unit!14199)

(assert (=> d!68609 (= lt!312613 (choose!50 lt!312142 (_2!9225 lt!312119) lt!312612 lt!312614 (tuple2!17151 (_1!9226 lt!312614) (_2!9226 lt!312614)) (_1!9226 lt!312614) (_2!9226 lt!312614) lt!312611 (tuple2!17151 (_1!9226 lt!312611) (_2!9226 lt!312611)) (_1!9226 lt!312611) (_2!9226 lt!312611)))))

(assert (=> d!68609 (= lt!312611 (readBitPure!0 lt!312612))))

(assert (=> d!68609 (= lt!312614 (readBitPure!0 lt!312142))))

(assert (=> d!68609 (= lt!312612 (BitStream!8027 (buf!4957 (_2!9225 lt!312119)) (currentByte!9313 lt!312142) (currentBit!9308 lt!312142)))))

(assert (=> d!68609 (invariant!0 (currentBit!9308 lt!312142) (currentByte!9313 lt!312142) (size!4459 (buf!4957 (_2!9225 lt!312119))))))

(assert (=> d!68609 (= (readBitPrefixLemma!0 lt!312142 (_2!9225 lt!312119)) lt!312613)))

(declare-fun b!200153 () Bool)

(assert (=> b!200153 (= e!137326 (= (_2!9226 lt!312614) (_2!9226 lt!312611)))))

(assert (= (and d!68609 res!167569) b!200153))

(declare-fun m!310705 () Bool)

(assert (=> d!68609 m!310705))

(declare-fun m!310707 () Bool)

(assert (=> d!68609 m!310707))

(declare-fun m!310709 () Bool)

(assert (=> d!68609 m!310709))

(declare-fun m!310711 () Bool)

(assert (=> d!68609 m!310711))

(declare-fun m!310713 () Bool)

(assert (=> d!68609 m!310713))

(assert (=> d!68609 m!310261))

(assert (=> b!199920 d!68609))

(declare-fun d!68611 () Bool)

(assert (=> d!68611 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!199920 d!68611))

(declare-fun d!68613 () Bool)

(assert (=> d!68613 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127))) lt!312118) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127)))) lt!312118))))

(declare-fun bs!16900 () Bool)

(assert (= bs!16900 d!68613))

(declare-fun m!310715 () Bool)

(assert (=> bs!16900 m!310715))

(assert (=> b!199920 d!68613))

(declare-fun d!68615 () Bool)

(declare-fun lt!312615 () tuple2!17172)

(assert (=> d!68615 (= lt!312615 (readNBitsLSBFirstsLoop!0 (_1!9223 lt!312132) nBits!348 i!590 lt!312144))))

(assert (=> d!68615 (= (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!312132) nBits!348 i!590 lt!312144) (tuple2!17147 (_2!9237 lt!312615) (_1!9237 lt!312615)))))

(declare-fun bs!16901 () Bool)

(assert (= bs!16901 d!68615))

(declare-fun m!310717 () Bool)

(assert (=> bs!16901 m!310717))

(assert (=> b!199920 d!68615))

(declare-fun b!200154 () Bool)

(declare-fun e!137327 () Unit!14199)

(declare-fun Unit!14208 () Unit!14199)

(assert (=> b!200154 (= e!137327 Unit!14208)))

(declare-fun lt!312632 () tuple2!17144)

(declare-fun lt!312623 () (_ BitVec 64))

(declare-fun lt!312633 () (_ BitVec 64))

(declare-fun e!137328 () Bool)

(declare-fun b!200155 () Bool)

(assert (=> b!200155 (= e!137328 (= (_1!9223 lt!312632) (withMovedBitIndex!0 (_2!9223 lt!312632) (bvsub lt!312623 lt!312633))))))

(assert (=> b!200155 (or (= (bvand lt!312623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312633 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312623 lt!312633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200155 (= lt!312633 (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312119))) (currentByte!9313 (_2!9225 lt!312119)) (currentBit!9308 (_2!9225 lt!312119))))))

(assert (=> b!200155 (= lt!312623 (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))))))

(declare-fun b!200156 () Bool)

(declare-fun lt!312616 () Unit!14199)

(assert (=> b!200156 (= e!137327 lt!312616)))

(declare-fun lt!312625 () (_ BitVec 64))

(assert (=> b!200156 (= lt!312625 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!312619 () (_ BitVec 64))

(assert (=> b!200156 (= lt!312619 (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))))))

(assert (=> b!200156 (= lt!312616 (arrayBitRangesEqSymmetric!0 (buf!4957 (_2!9225 lt!312127)) (buf!4957 (_2!9225 lt!312119)) lt!312625 lt!312619))))

(assert (=> b!200156 (arrayBitRangesEq!0 (buf!4957 (_2!9225 lt!312119)) (buf!4957 (_2!9225 lt!312127)) lt!312625 lt!312619)))

(declare-fun b!200157 () Bool)

(declare-fun res!167571 () Bool)

(assert (=> b!200157 (=> (not res!167571) (not e!137328))))

(assert (=> b!200157 (= res!167571 (isPrefixOf!0 (_1!9223 lt!312632) (_2!9225 lt!312127)))))

(declare-fun d!68617 () Bool)

(assert (=> d!68617 e!137328))

(declare-fun res!167572 () Bool)

(assert (=> d!68617 (=> (not res!167572) (not e!137328))))

(assert (=> d!68617 (= res!167572 (isPrefixOf!0 (_1!9223 lt!312632) (_2!9223 lt!312632)))))

(declare-fun lt!312629 () BitStream!8026)

(assert (=> d!68617 (= lt!312632 (tuple2!17145 lt!312629 (_2!9225 lt!312119)))))

(declare-fun lt!312626 () Unit!14199)

(declare-fun lt!312635 () Unit!14199)

(assert (=> d!68617 (= lt!312626 lt!312635)))

(assert (=> d!68617 (isPrefixOf!0 lt!312629 (_2!9225 lt!312119))))

(assert (=> d!68617 (= lt!312635 (lemmaIsPrefixTransitive!0 lt!312629 (_2!9225 lt!312119) (_2!9225 lt!312119)))))

(declare-fun lt!312622 () Unit!14199)

(declare-fun lt!312621 () Unit!14199)

(assert (=> d!68617 (= lt!312622 lt!312621)))

(assert (=> d!68617 (isPrefixOf!0 lt!312629 (_2!9225 lt!312119))))

(assert (=> d!68617 (= lt!312621 (lemmaIsPrefixTransitive!0 lt!312629 (_2!9225 lt!312127) (_2!9225 lt!312119)))))

(declare-fun lt!312618 () Unit!14199)

(assert (=> d!68617 (= lt!312618 e!137327)))

(declare-fun c!9987 () Bool)

(assert (=> d!68617 (= c!9987 (not (= (size!4459 (buf!4957 (_2!9225 lt!312127))) #b00000000000000000000000000000000)))))

(declare-fun lt!312631 () Unit!14199)

(declare-fun lt!312634 () Unit!14199)

(assert (=> d!68617 (= lt!312631 lt!312634)))

(assert (=> d!68617 (isPrefixOf!0 (_2!9225 lt!312119) (_2!9225 lt!312119))))

(assert (=> d!68617 (= lt!312634 (lemmaIsPrefixRefl!0 (_2!9225 lt!312119)))))

(declare-fun lt!312628 () Unit!14199)

(declare-fun lt!312620 () Unit!14199)

(assert (=> d!68617 (= lt!312628 lt!312620)))

(assert (=> d!68617 (= lt!312620 (lemmaIsPrefixRefl!0 (_2!9225 lt!312119)))))

(declare-fun lt!312617 () Unit!14199)

(declare-fun lt!312624 () Unit!14199)

(assert (=> d!68617 (= lt!312617 lt!312624)))

(assert (=> d!68617 (isPrefixOf!0 lt!312629 lt!312629)))

(assert (=> d!68617 (= lt!312624 (lemmaIsPrefixRefl!0 lt!312629))))

(declare-fun lt!312627 () Unit!14199)

(declare-fun lt!312630 () Unit!14199)

(assert (=> d!68617 (= lt!312627 lt!312630)))

(assert (=> d!68617 (isPrefixOf!0 (_2!9225 lt!312127) (_2!9225 lt!312127))))

(assert (=> d!68617 (= lt!312630 (lemmaIsPrefixRefl!0 (_2!9225 lt!312127)))))

(assert (=> d!68617 (= lt!312629 (BitStream!8027 (buf!4957 (_2!9225 lt!312119)) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))))))

(assert (=> d!68617 (isPrefixOf!0 (_2!9225 lt!312127) (_2!9225 lt!312119))))

(assert (=> d!68617 (= (reader!0 (_2!9225 lt!312127) (_2!9225 lt!312119)) lt!312632)))

(declare-fun b!200158 () Bool)

(declare-fun res!167570 () Bool)

(assert (=> b!200158 (=> (not res!167570) (not e!137328))))

(assert (=> b!200158 (= res!167570 (isPrefixOf!0 (_2!9223 lt!312632) (_2!9225 lt!312119)))))

(assert (= (and d!68617 c!9987) b!200156))

(assert (= (and d!68617 (not c!9987)) b!200154))

(assert (= (and d!68617 res!167572) b!200157))

(assert (= (and b!200157 res!167571) b!200158))

(assert (= (and b!200158 res!167570) b!200155))

(declare-fun m!310719 () Bool)

(assert (=> b!200155 m!310719))

(assert (=> b!200155 m!310325))

(assert (=> b!200155 m!310299))

(assert (=> b!200156 m!310299))

(declare-fun m!310721 () Bool)

(assert (=> b!200156 m!310721))

(declare-fun m!310723 () Bool)

(assert (=> b!200156 m!310723))

(assert (=> d!68617 m!310305))

(declare-fun m!310725 () Bool)

(assert (=> d!68617 m!310725))

(declare-fun m!310727 () Bool)

(assert (=> d!68617 m!310727))

(assert (=> d!68617 m!310675))

(assert (=> d!68617 m!310677))

(declare-fun m!310729 () Bool)

(assert (=> d!68617 m!310729))

(declare-fun m!310731 () Bool)

(assert (=> d!68617 m!310731))

(declare-fun m!310733 () Bool)

(assert (=> d!68617 m!310733))

(declare-fun m!310735 () Bool)

(assert (=> d!68617 m!310735))

(declare-fun m!310737 () Bool)

(assert (=> d!68617 m!310737))

(declare-fun m!310739 () Bool)

(assert (=> d!68617 m!310739))

(declare-fun m!310741 () Bool)

(assert (=> b!200158 m!310741))

(declare-fun m!310743 () Bool)

(assert (=> b!200157 m!310743))

(assert (=> b!199920 d!68617))

(declare-fun d!68619 () Bool)

(declare-fun e!137329 () Bool)

(assert (=> d!68619 e!137329))

(declare-fun res!167574 () Bool)

(assert (=> d!68619 (=> (not res!167574) (not e!137329))))

(declare-fun lt!312641 () (_ BitVec 64))

(declare-fun lt!312640 () (_ BitVec 64))

(declare-fun lt!312639 () (_ BitVec 64))

(assert (=> d!68619 (= res!167574 (= lt!312640 (bvsub lt!312641 lt!312639)))))

(assert (=> d!68619 (or (= (bvand lt!312641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312641 lt!312639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68619 (= lt!312639 (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312119))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312119)))))))

(declare-fun lt!312636 () (_ BitVec 64))

(declare-fun lt!312637 () (_ BitVec 64))

(assert (=> d!68619 (= lt!312641 (bvmul lt!312636 lt!312637))))

(assert (=> d!68619 (or (= lt!312636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312637 (bvsdiv (bvmul lt!312636 lt!312637) lt!312636)))))

(assert (=> d!68619 (= lt!312637 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68619 (= lt!312636 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))))))

(assert (=> d!68619 (= lt!312640 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312119))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312119)))))))

(assert (=> d!68619 (invariant!0 (currentBit!9308 (_2!9225 lt!312119)) (currentByte!9313 (_2!9225 lt!312119)) (size!4459 (buf!4957 (_2!9225 lt!312119))))))

(assert (=> d!68619 (= (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312119))) (currentByte!9313 (_2!9225 lt!312119)) (currentBit!9308 (_2!9225 lt!312119))) lt!312640)))

(declare-fun b!200159 () Bool)

(declare-fun res!167573 () Bool)

(assert (=> b!200159 (=> (not res!167573) (not e!137329))))

(assert (=> b!200159 (= res!167573 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312640))))

(declare-fun b!200160 () Bool)

(declare-fun lt!312638 () (_ BitVec 64))

(assert (=> b!200160 (= e!137329 (bvsle lt!312640 (bvmul lt!312638 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200160 (or (= lt!312638 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312638 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312638)))))

(assert (=> b!200160 (= lt!312638 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312119)))))))

(assert (= (and d!68619 res!167574) b!200159))

(assert (= (and b!200159 res!167573) b!200160))

(declare-fun m!310745 () Bool)

(assert (=> d!68619 m!310745))

(assert (=> d!68619 m!310313))

(assert (=> b!199919 d!68619))

(declare-fun d!68621 () Bool)

(declare-fun res!167575 () Bool)

(declare-fun e!137331 () Bool)

(assert (=> d!68621 (=> (not res!167575) (not e!137331))))

(assert (=> d!68621 (= res!167575 (= (size!4459 (buf!4957 thiss!1204)) (size!4459 (buf!4957 (_2!9225 lt!312119)))))))

(assert (=> d!68621 (= (isPrefixOf!0 thiss!1204 (_2!9225 lt!312119)) e!137331)))

(declare-fun b!200161 () Bool)

(declare-fun res!167576 () Bool)

(assert (=> b!200161 (=> (not res!167576) (not e!137331))))

(assert (=> b!200161 (= res!167576 (bvsle (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)) (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312119))) (currentByte!9313 (_2!9225 lt!312119)) (currentBit!9308 (_2!9225 lt!312119)))))))

(declare-fun b!200162 () Bool)

(declare-fun e!137330 () Bool)

(assert (=> b!200162 (= e!137331 e!137330)))

(declare-fun res!167577 () Bool)

(assert (=> b!200162 (=> res!167577 e!137330)))

(assert (=> b!200162 (= res!167577 (= (size!4459 (buf!4957 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200163 () Bool)

(assert (=> b!200163 (= e!137330 (arrayBitRangesEq!0 (buf!4957 thiss!1204) (buf!4957 (_2!9225 lt!312119)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204))))))

(assert (= (and d!68621 res!167575) b!200161))

(assert (= (and b!200161 res!167576) b!200162))

(assert (= (and b!200162 (not res!167577)) b!200163))

(assert (=> b!200161 m!310301))

(assert (=> b!200161 m!310325))

(assert (=> b!200163 m!310301))

(assert (=> b!200163 m!310301))

(declare-fun m!310747 () Bool)

(assert (=> b!200163 m!310747))

(assert (=> b!199919 d!68621))

(declare-fun d!68623 () Bool)

(assert (=> d!68623 (isPrefixOf!0 thiss!1204 (_2!9225 lt!312119))))

(declare-fun lt!312644 () Unit!14199)

(declare-fun choose!30 (BitStream!8026 BitStream!8026 BitStream!8026) Unit!14199)

(assert (=> d!68623 (= lt!312644 (choose!30 thiss!1204 (_2!9225 lt!312127) (_2!9225 lt!312119)))))

(assert (=> d!68623 (isPrefixOf!0 thiss!1204 (_2!9225 lt!312127))))

(assert (=> d!68623 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9225 lt!312127) (_2!9225 lt!312119)) lt!312644)))

(declare-fun bs!16902 () Bool)

(assert (= bs!16902 d!68623))

(assert (=> bs!16902 m!310327))

(declare-fun m!310749 () Bool)

(assert (=> bs!16902 m!310749))

(assert (=> bs!16902 m!310293))

(assert (=> b!199919 d!68623))

(declare-fun b!200350 () Bool)

(declare-fun e!137441 () Bool)

(declare-fun lt!313196 () tuple2!17150)

(declare-fun lt!313191 () tuple2!17148)

(assert (=> b!200350 (= e!137441 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!313196))) (currentByte!9313 (_1!9226 lt!313196)) (currentBit!9308 (_1!9226 lt!313196))) (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313191))) (currentByte!9313 (_2!9225 lt!313191)) (currentBit!9308 (_2!9225 lt!313191)))))))

(declare-fun b!200351 () Bool)

(declare-fun res!167747 () Bool)

(declare-fun e!137444 () Bool)

(assert (=> b!200351 (=> (not res!167747) (not e!137444))))

(declare-fun lt!313203 () (_ BitVec 64))

(declare-fun lt!313186 () tuple2!17148)

(declare-fun lt!313180 () (_ BitVec 64))

(assert (=> b!200351 (= res!167747 (= (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313186))) (currentByte!9313 (_2!9225 lt!313186)) (currentBit!9308 (_2!9225 lt!313186))) (bvsub lt!313180 lt!313203)))))

(assert (=> b!200351 (or (= (bvand lt!313180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313180 lt!313203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200351 (= lt!313203 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!313187 () (_ BitVec 64))

(declare-fun lt!313214 () (_ BitVec 64))

(assert (=> b!200351 (= lt!313180 (bvadd lt!313187 lt!313214))))

(assert (=> b!200351 (or (not (= (bvand lt!313187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313214 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!313187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!313187 lt!313214) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200351 (= lt!313214 ((_ sign_extend 32) nBits!348))))

(assert (=> b!200351 (= lt!313187 (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))))))

(declare-fun b!200352 () Bool)

(declare-fun e!137438 () (_ BitVec 64))

(assert (=> b!200352 (= e!137438 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!200353 () Bool)

(declare-fun res!167745 () Bool)

(assert (=> b!200353 (=> (not res!167745) (not e!137444))))

(assert (=> b!200353 (= res!167745 (= (size!4459 (buf!4957 (_2!9225 lt!312127))) (size!4459 (buf!4957 (_2!9225 lt!313186)))))))

(declare-fun b!200354 () Bool)

(declare-fun res!167738 () Bool)

(assert (=> b!200354 (= res!167738 (= (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313191))) (currentByte!9313 (_2!9225 lt!313191)) (currentBit!9308 (_2!9225 lt!313191))) (bvadd (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!137440 () Bool)

(assert (=> b!200354 (=> (not res!167738) (not e!137440))))

(declare-fun b!200355 () Bool)

(declare-fun e!137445 () Bool)

(assert (=> b!200355 (= e!137444 e!137445)))

(declare-fun res!167736 () Bool)

(assert (=> b!200355 (=> (not res!167736) (not e!137445))))

(declare-fun lt!313201 () tuple2!17146)

(assert (=> b!200355 (= res!167736 (= (_2!9224 lt!313201) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!313205 () tuple2!17144)

(assert (=> b!200355 (= lt!313201 (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!313205) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!313175 () Unit!14199)

(declare-fun lt!313198 () Unit!14199)

(assert (=> b!200355 (= lt!313175 lt!313198)))

(declare-fun lt!313177 () (_ BitVec 64))

(assert (=> b!200355 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!313186)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127))) lt!313177)))

(assert (=> b!200355 (= lt!313198 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9225 lt!312127) (buf!4957 (_2!9225 lt!313186)) lt!313177))))

(declare-fun e!137443 () Bool)

(assert (=> b!200355 e!137443))

(declare-fun res!167741 () Bool)

(assert (=> b!200355 (=> (not res!167741) (not e!137443))))

(assert (=> b!200355 (= res!167741 (and (= (size!4459 (buf!4957 (_2!9225 lt!312127))) (size!4459 (buf!4957 (_2!9225 lt!313186)))) (bvsge lt!313177 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200355 (= lt!313177 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!200355 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!200355 (= lt!313205 (reader!0 (_2!9225 lt!312127) (_2!9225 lt!313186)))))

(declare-fun b!200356 () Bool)

(declare-fun e!137442 () Bool)

(declare-fun lt!313202 () tuple2!17146)

(declare-fun lt!313179 () tuple2!17144)

(assert (=> b!200356 (= e!137442 (= (_1!9224 lt!313202) (_2!9223 lt!313179)))))

(declare-fun d!68625 () Bool)

(assert (=> d!68625 e!137444))

(declare-fun res!167739 () Bool)

(assert (=> d!68625 (=> (not res!167739) (not e!137444))))

(assert (=> d!68625 (= res!167739 (invariant!0 (currentBit!9308 (_2!9225 lt!313186)) (currentByte!9313 (_2!9225 lt!313186)) (size!4459 (buf!4957 (_2!9225 lt!313186)))))))

(declare-fun e!137439 () tuple2!17148)

(assert (=> d!68625 (= lt!313186 e!137439)))

(declare-fun c!10003 () Bool)

(assert (=> d!68625 (= c!10003 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!68625 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68625 (= (appendBitsLSBFirstLoopTR!0 (_2!9225 lt!312127) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!313186)))

(declare-fun b!200357 () Bool)

(declare-fun lt!313223 () tuple2!17148)

(assert (=> b!200357 (= e!137439 (tuple2!17149 (_1!9225 lt!313223) (_2!9225 lt!313223)))))

(declare-fun lt!313185 () Bool)

(assert (=> b!200357 (= lt!313185 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200357 (= lt!313191 (appendBit!0 (_2!9225 lt!312127) lt!313185))))

(declare-fun res!167740 () Bool)

(assert (=> b!200357 (= res!167740 (= (size!4459 (buf!4957 (_2!9225 lt!312127))) (size!4459 (buf!4957 (_2!9225 lt!313191)))))))

(assert (=> b!200357 (=> (not res!167740) (not e!137440))))

(assert (=> b!200357 e!137440))

(declare-fun lt!313173 () tuple2!17148)

(assert (=> b!200357 (= lt!313173 lt!313191)))

(assert (=> b!200357 (= lt!313223 (appendBitsLSBFirstLoopTR!0 (_2!9225 lt!313173) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!313210 () Unit!14199)

(assert (=> b!200357 (= lt!313210 (lemmaIsPrefixTransitive!0 (_2!9225 lt!312127) (_2!9225 lt!313173) (_2!9225 lt!313223)))))

(assert (=> b!200357 (isPrefixOf!0 (_2!9225 lt!312127) (_2!9225 lt!313223))))

(declare-fun lt!313188 () Unit!14199)

(assert (=> b!200357 (= lt!313188 lt!313210)))

(assert (=> b!200357 (invariant!0 (currentBit!9308 (_2!9225 lt!312127)) (currentByte!9313 (_2!9225 lt!312127)) (size!4459 (buf!4957 (_2!9225 lt!313173))))))

(declare-fun lt!313195 () BitStream!8026)

(assert (=> b!200357 (= lt!313195 (BitStream!8027 (buf!4957 (_2!9225 lt!313173)) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))))))

(assert (=> b!200357 (invariant!0 (currentBit!9308 lt!313195) (currentByte!9313 lt!313195) (size!4459 (buf!4957 (_2!9225 lt!313223))))))

(declare-fun lt!313218 () BitStream!8026)

(assert (=> b!200357 (= lt!313218 (BitStream!8027 (buf!4957 (_2!9225 lt!313223)) (currentByte!9313 lt!313195) (currentBit!9308 lt!313195)))))

(declare-fun lt!313221 () tuple2!17150)

(assert (=> b!200357 (= lt!313221 (readBitPure!0 lt!313195))))

(declare-fun lt!313174 () tuple2!17150)

(assert (=> b!200357 (= lt!313174 (readBitPure!0 lt!313218))))

(declare-fun lt!313184 () Unit!14199)

(assert (=> b!200357 (= lt!313184 (readBitPrefixLemma!0 lt!313195 (_2!9225 lt!313223)))))

(declare-fun res!167746 () Bool)

(assert (=> b!200357 (= res!167746 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!313221))) (currentByte!9313 (_1!9226 lt!313221)) (currentBit!9308 (_1!9226 lt!313221))) (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!313174))) (currentByte!9313 (_1!9226 lt!313174)) (currentBit!9308 (_1!9226 lt!313174)))))))

(declare-fun e!137437 () Bool)

(assert (=> b!200357 (=> (not res!167746) (not e!137437))))

(assert (=> b!200357 e!137437))

(declare-fun lt!313208 () Unit!14199)

(assert (=> b!200357 (= lt!313208 lt!313184)))

(declare-fun lt!313209 () tuple2!17144)

(assert (=> b!200357 (= lt!313209 (reader!0 (_2!9225 lt!312127) (_2!9225 lt!313223)))))

(declare-fun lt!313194 () tuple2!17144)

(assert (=> b!200357 (= lt!313194 (reader!0 (_2!9225 lt!313173) (_2!9225 lt!313223)))))

(declare-fun lt!313222 () tuple2!17150)

(assert (=> b!200357 (= lt!313222 (readBitPure!0 (_1!9223 lt!313209)))))

(assert (=> b!200357 (= (_2!9226 lt!313222) lt!313185)))

(declare-fun lt!313216 () Unit!14199)

(declare-fun Unit!14210 () Unit!14199)

(assert (=> b!200357 (= lt!313216 Unit!14210)))

(declare-fun lt!313215 () (_ BitVec 64))

(assert (=> b!200357 (= lt!313215 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!313211 () (_ BitVec 64))

(assert (=> b!200357 (= lt!313211 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!313176 () Unit!14199)

(assert (=> b!200357 (= lt!313176 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9225 lt!312127) (buf!4957 (_2!9225 lt!313223)) lt!313211))))

(assert (=> b!200357 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!313223)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127))) lt!313211)))

(declare-fun lt!313226 () Unit!14199)

(assert (=> b!200357 (= lt!313226 lt!313176)))

(declare-fun lt!313172 () tuple2!17146)

(assert (=> b!200357 (= lt!313172 (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!313209) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!313215))))

(declare-fun lt!313178 () (_ BitVec 64))

(assert (=> b!200357 (= lt!313178 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!313207 () Unit!14199)

(assert (=> b!200357 (= lt!313207 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9225 lt!313173) (buf!4957 (_2!9225 lt!313223)) lt!313178))))

(assert (=> b!200357 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!313223)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!313173))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!313173))) lt!313178)))

(declare-fun lt!313224 () Unit!14199)

(assert (=> b!200357 (= lt!313224 lt!313207)))

(declare-fun lt!313183 () tuple2!17146)

(assert (=> b!200357 (= lt!313183 (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!313194) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!313215 (ite (_2!9226 lt!313222) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!313181 () tuple2!17146)

(assert (=> b!200357 (= lt!313181 (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!313209) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!313215))))

(declare-fun c!10002 () Bool)

(assert (=> b!200357 (= c!10002 (_2!9226 (readBitPure!0 (_1!9223 lt!313209))))))

(declare-fun lt!313206 () tuple2!17146)

(assert (=> b!200357 (= lt!313206 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9223 lt!313209) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!313215 e!137438)))))

(declare-fun lt!313204 () Unit!14199)

(assert (=> b!200357 (= lt!313204 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9223 lt!313209) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!313215))))

(assert (=> b!200357 (and (= (_2!9224 lt!313181) (_2!9224 lt!313206)) (= (_1!9224 lt!313181) (_1!9224 lt!313206)))))

(declare-fun lt!313199 () Unit!14199)

(assert (=> b!200357 (= lt!313199 lt!313204)))

(assert (=> b!200357 (= (_1!9223 lt!313209) (withMovedBitIndex!0 (_2!9223 lt!313209) (bvsub (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))) (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313223))) (currentByte!9313 (_2!9225 lt!313223)) (currentBit!9308 (_2!9225 lt!313223))))))))

(declare-fun lt!313182 () Unit!14199)

(declare-fun Unit!14211 () Unit!14199)

(assert (=> b!200357 (= lt!313182 Unit!14211)))

(assert (=> b!200357 (= (_1!9223 lt!313194) (withMovedBitIndex!0 (_2!9223 lt!313194) (bvsub (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313173))) (currentByte!9313 (_2!9225 lt!313173)) (currentBit!9308 (_2!9225 lt!313173))) (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313223))) (currentByte!9313 (_2!9225 lt!313223)) (currentBit!9308 (_2!9225 lt!313223))))))))

(declare-fun lt!313192 () Unit!14199)

(declare-fun Unit!14212 () Unit!14199)

(assert (=> b!200357 (= lt!313192 Unit!14212)))

(assert (=> b!200357 (= (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))) (bvsub (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313173))) (currentByte!9313 (_2!9225 lt!313173)) (currentBit!9308 (_2!9225 lt!313173))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!313217 () Unit!14199)

(declare-fun Unit!14213 () Unit!14199)

(assert (=> b!200357 (= lt!313217 Unit!14213)))

(assert (=> b!200357 (= (_2!9224 lt!313172) (_2!9224 lt!313183))))

(declare-fun lt!313225 () Unit!14199)

(declare-fun Unit!14214 () Unit!14199)

(assert (=> b!200357 (= lt!313225 Unit!14214)))

(assert (=> b!200357 (invariant!0 (currentBit!9308 (_2!9225 lt!313223)) (currentByte!9313 (_2!9225 lt!313223)) (size!4459 (buf!4957 (_2!9225 lt!313223))))))

(declare-fun lt!313220 () Unit!14199)

(declare-fun Unit!14215 () Unit!14199)

(assert (=> b!200357 (= lt!313220 Unit!14215)))

(assert (=> b!200357 (= (size!4459 (buf!4957 (_2!9225 lt!312127))) (size!4459 (buf!4957 (_2!9225 lt!313223))))))

(declare-fun lt!313213 () Unit!14199)

(declare-fun Unit!14216 () Unit!14199)

(assert (=> b!200357 (= lt!313213 Unit!14216)))

(assert (=> b!200357 (= (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313223))) (currentByte!9313 (_2!9225 lt!313223)) (currentBit!9308 (_2!9225 lt!313223))) (bvsub (bvadd (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!312127))) (currentByte!9313 (_2!9225 lt!312127)) (currentBit!9308 (_2!9225 lt!312127))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!313227 () Unit!14199)

(declare-fun Unit!14217 () Unit!14199)

(assert (=> b!200357 (= lt!313227 Unit!14217)))

(declare-fun lt!313200 () Unit!14199)

(declare-fun Unit!14218 () Unit!14199)

(assert (=> b!200357 (= lt!313200 Unit!14218)))

(assert (=> b!200357 (= lt!313179 (reader!0 (_2!9225 lt!312127) (_2!9225 lt!313223)))))

(declare-fun lt!313189 () (_ BitVec 64))

(assert (=> b!200357 (= lt!313189 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!313193 () Unit!14199)

(assert (=> b!200357 (= lt!313193 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9225 lt!312127) (buf!4957 (_2!9225 lt!313223)) lt!313189))))

(assert (=> b!200357 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!313223)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127))) lt!313189)))

(declare-fun lt!313219 () Unit!14199)

(assert (=> b!200357 (= lt!313219 lt!313193)))

(assert (=> b!200357 (= lt!313202 (readNBitsLSBFirstsLoopPure!0 (_1!9223 lt!313179) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!167744 () Bool)

(assert (=> b!200357 (= res!167744 (= (_2!9224 lt!313202) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!200357 (=> (not res!167744) (not e!137442))))

(assert (=> b!200357 e!137442))

(declare-fun lt!313212 () Unit!14199)

(declare-fun Unit!14219 () Unit!14199)

(assert (=> b!200357 (= lt!313212 Unit!14219)))

(declare-fun b!200358 () Bool)

(declare-fun Unit!14220 () Unit!14199)

(assert (=> b!200358 (= e!137439 (tuple2!17149 Unit!14220 (_2!9225 lt!312127)))))

(declare-fun lt!313190 () Unit!14199)

(assert (=> b!200358 (= lt!313190 (lemmaIsPrefixRefl!0 (_2!9225 lt!312127)))))

(declare-fun call!3173 () Bool)

(assert (=> b!200358 call!3173))

(declare-fun lt!313197 () Unit!14199)

(assert (=> b!200358 (= lt!313197 lt!313190)))

(declare-fun b!200359 () Bool)

(assert (=> b!200359 (= e!137443 (validate_offset_bits!1 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9225 lt!312127)))) ((_ sign_extend 32) (currentByte!9313 (_2!9225 lt!312127))) ((_ sign_extend 32) (currentBit!9308 (_2!9225 lt!312127))) lt!313177))))

(declare-fun b!200360 () Bool)

(assert (=> b!200360 (= lt!313196 (readBitPure!0 (readerFrom!0 (_2!9225 lt!313191) (currentBit!9308 (_2!9225 lt!312127)) (currentByte!9313 (_2!9225 lt!312127)))))))

(declare-fun res!167737 () Bool)

(assert (=> b!200360 (= res!167737 (and (= (_2!9226 lt!313196) lt!313185) (= (_1!9226 lt!313196) (_2!9225 lt!313191))))))

(assert (=> b!200360 (=> (not res!167737) (not e!137441))))

(assert (=> b!200360 (= e!137440 e!137441)))

(declare-fun b!200361 () Bool)

(assert (=> b!200361 (= e!137445 (= (_1!9224 lt!313201) (_2!9223 lt!313205)))))

(declare-fun b!200362 () Bool)

(assert (=> b!200362 (= e!137438 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!200363 () Bool)

(assert (=> b!200363 (= e!137437 (= (_2!9226 lt!313221) (_2!9226 lt!313174)))))

(declare-fun b!200364 () Bool)

(declare-fun res!167743 () Bool)

(assert (=> b!200364 (=> (not res!167743) (not e!137444))))

(assert (=> b!200364 (= res!167743 (isPrefixOf!0 (_2!9225 lt!312127) (_2!9225 lt!313186)))))

(declare-fun bm!3170 () Bool)

(assert (=> bm!3170 (= call!3173 (isPrefixOf!0 (_2!9225 lt!312127) (ite c!10003 (_2!9225 lt!312127) (_2!9225 lt!313191))))))

(declare-fun b!200365 () Bool)

(declare-fun res!167742 () Bool)

(assert (=> b!200365 (= res!167742 call!3173)))

(assert (=> b!200365 (=> (not res!167742) (not e!137440))))

(assert (= (and d!68625 c!10003) b!200358))

(assert (= (and d!68625 (not c!10003)) b!200357))

(assert (= (and b!200357 res!167740) b!200354))

(assert (= (and b!200354 res!167738) b!200365))

(assert (= (and b!200365 res!167742) b!200360))

(assert (= (and b!200360 res!167737) b!200350))

(assert (= (and b!200357 res!167746) b!200363))

(assert (= (and b!200357 c!10002) b!200362))

(assert (= (and b!200357 (not c!10002)) b!200352))

(assert (= (and b!200357 res!167744) b!200356))

(assert (= (or b!200358 b!200365) bm!3170))

(assert (= (and d!68625 res!167739) b!200353))

(assert (= (and b!200353 res!167745) b!200351))

(assert (= (and b!200351 res!167747) b!200364))

(assert (= (and b!200364 res!167743) b!200355))

(assert (= (and b!200355 res!167741) b!200359))

(assert (= (and b!200355 res!167736) b!200361))

(declare-fun m!311039 () Bool)

(assert (=> d!68625 m!311039))

(declare-fun m!311043 () Bool)

(assert (=> b!200357 m!311043))

(declare-fun m!311047 () Bool)

(assert (=> b!200357 m!311047))

(declare-fun m!311049 () Bool)

(assert (=> b!200357 m!311049))

(declare-fun m!311051 () Bool)

(assert (=> b!200357 m!311051))

(declare-fun m!311053 () Bool)

(assert (=> b!200357 m!311053))

(declare-fun m!311055 () Bool)

(assert (=> b!200357 m!311055))

(declare-fun m!311057 () Bool)

(assert (=> b!200357 m!311057))

(declare-fun m!311061 () Bool)

(assert (=> b!200357 m!311061))

(declare-fun m!311063 () Bool)

(assert (=> b!200357 m!311063))

(declare-fun m!311065 () Bool)

(assert (=> b!200357 m!311065))

(declare-fun m!311067 () Bool)

(assert (=> b!200357 m!311067))

(declare-fun m!311069 () Bool)

(assert (=> b!200357 m!311069))

(declare-fun m!311071 () Bool)

(assert (=> b!200357 m!311071))

(declare-fun m!311073 () Bool)

(assert (=> b!200357 m!311073))

(declare-fun m!311075 () Bool)

(assert (=> b!200357 m!311075))

(declare-fun m!311077 () Bool)

(assert (=> b!200357 m!311077))

(declare-fun m!311079 () Bool)

(assert (=> b!200357 m!311079))

(declare-fun m!311081 () Bool)

(assert (=> b!200357 m!311081))

(declare-fun m!311083 () Bool)

(assert (=> b!200357 m!311083))

(declare-fun m!311085 () Bool)

(assert (=> b!200357 m!311085))

(declare-fun m!311089 () Bool)

(assert (=> b!200357 m!311089))

(declare-fun m!311095 () Bool)

(assert (=> b!200357 m!311095))

(assert (=> b!200357 m!310299))

(declare-fun m!311099 () Bool)

(assert (=> b!200357 m!311099))

(assert (=> b!200357 m!311051))

(declare-fun m!311101 () Bool)

(assert (=> b!200357 m!311101))

(declare-fun m!311103 () Bool)

(assert (=> b!200357 m!311103))

(declare-fun m!311105 () Bool)

(assert (=> b!200357 m!311105))

(declare-fun m!311107 () Bool)

(assert (=> b!200357 m!311107))

(declare-fun m!311109 () Bool)

(assert (=> b!200357 m!311109))

(declare-fun m!311115 () Bool)

(assert (=> b!200357 m!311115))

(declare-fun m!311117 () Bool)

(assert (=> b!200357 m!311117))

(declare-fun m!311119 () Bool)

(assert (=> b!200357 m!311119))

(declare-fun m!311121 () Bool)

(assert (=> b!200357 m!311121))

(declare-fun m!311123 () Bool)

(assert (=> b!200357 m!311123))

(declare-fun m!311125 () Bool)

(assert (=> b!200359 m!311125))

(declare-fun m!311127 () Bool)

(assert (=> bm!3170 m!311127))

(assert (=> b!200358 m!310737))

(declare-fun m!311129 () Bool)

(assert (=> b!200354 m!311129))

(assert (=> b!200354 m!310299))

(declare-fun m!311131 () Bool)

(assert (=> b!200350 m!311131))

(assert (=> b!200350 m!311129))

(declare-fun m!311133 () Bool)

(assert (=> b!200360 m!311133))

(assert (=> b!200360 m!311133))

(declare-fun m!311135 () Bool)

(assert (=> b!200360 m!311135))

(declare-fun m!311137 () Bool)

(assert (=> b!200355 m!311137))

(declare-fun m!311139 () Bool)

(assert (=> b!200355 m!311139))

(declare-fun m!311141 () Bool)

(assert (=> b!200355 m!311141))

(declare-fun m!311143 () Bool)

(assert (=> b!200355 m!311143))

(assert (=> b!200355 m!311071))

(assert (=> b!200355 m!311121))

(declare-fun m!311145 () Bool)

(assert (=> b!200364 m!311145))

(declare-fun m!311147 () Bool)

(assert (=> b!200351 m!311147))

(assert (=> b!200351 m!310299))

(assert (=> b!199919 d!68625))

(assert (=> b!199921 d!68517))

(assert (=> b!199921 d!68519))

(declare-fun b!200379 () Bool)

(declare-fun res!167760 () Bool)

(declare-fun e!137452 () Bool)

(assert (=> b!200379 (=> (not res!167760) (not e!137452))))

(declare-fun lt!313266 () tuple2!17148)

(assert (=> b!200379 (= res!167760 (isPrefixOf!0 thiss!1204 (_2!9225 lt!313266)))))

(declare-fun b!200378 () Bool)

(declare-fun res!167762 () Bool)

(assert (=> b!200378 (=> (not res!167762) (not e!137452))))

(declare-fun lt!313263 () (_ BitVec 64))

(declare-fun lt!313265 () (_ BitVec 64))

(assert (=> b!200378 (= res!167762 (= (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313266))) (currentByte!9313 (_2!9225 lt!313266)) (currentBit!9308 (_2!9225 lt!313266))) (bvadd lt!313265 lt!313263)))))

(assert (=> b!200378 (or (not (= (bvand lt!313265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313263 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!313265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!313265 lt!313263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200378 (= lt!313263 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!200378 (= lt!313265 (bitIndex!0 (size!4459 (buf!4957 thiss!1204)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)))))

(declare-fun d!68737 () Bool)

(assert (=> d!68737 e!137452))

(declare-fun res!167761 () Bool)

(assert (=> d!68737 (=> (not res!167761) (not e!137452))))

(assert (=> d!68737 (= res!167761 (= (size!4459 (buf!4957 thiss!1204)) (size!4459 (buf!4957 (_2!9225 lt!313266)))))))

(declare-fun choose!16 (BitStream!8026 Bool) tuple2!17148)

(assert (=> d!68737 (= lt!313266 (choose!16 thiss!1204 lt!312133))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!68737 (validate_offset_bit!0 ((_ sign_extend 32) (size!4459 (buf!4957 thiss!1204))) ((_ sign_extend 32) (currentByte!9313 thiss!1204)) ((_ sign_extend 32) (currentBit!9308 thiss!1204)))))

(assert (=> d!68737 (= (appendBit!0 thiss!1204 lt!312133) lt!313266)))

(declare-fun b!200380 () Bool)

(declare-fun e!137453 () Bool)

(assert (=> b!200380 (= e!137452 e!137453)))

(declare-fun res!167759 () Bool)

(assert (=> b!200380 (=> (not res!167759) (not e!137453))))

(declare-fun lt!313264 () tuple2!17150)

(assert (=> b!200380 (= res!167759 (and (= (_2!9226 lt!313264) lt!312133) (= (_1!9226 lt!313264) (_2!9225 lt!313266))))))

(assert (=> b!200380 (= lt!313264 (readBitPure!0 (readerFrom!0 (_2!9225 lt!313266) (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204))))))

(declare-fun b!200381 () Bool)

(assert (=> b!200381 (= e!137453 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!313264))) (currentByte!9313 (_1!9226 lt!313264)) (currentBit!9308 (_1!9226 lt!313264))) (bitIndex!0 (size!4459 (buf!4957 (_2!9225 lt!313266))) (currentByte!9313 (_2!9225 lt!313266)) (currentBit!9308 (_2!9225 lt!313266)))))))

(assert (= (and d!68737 res!167761) b!200378))

(assert (= (and b!200378 res!167762) b!200379))

(assert (= (and b!200379 res!167760) b!200380))

(assert (= (and b!200380 res!167759) b!200381))

(declare-fun m!311149 () Bool)

(assert (=> b!200379 m!311149))

(declare-fun m!311151 () Bool)

(assert (=> b!200381 m!311151))

(declare-fun m!311153 () Bool)

(assert (=> b!200381 m!311153))

(declare-fun m!311155 () Bool)

(assert (=> d!68737 m!311155))

(declare-fun m!311157 () Bool)

(assert (=> d!68737 m!311157))

(declare-fun m!311159 () Bool)

(assert (=> b!200380 m!311159))

(assert (=> b!200380 m!311159))

(declare-fun m!311161 () Bool)

(assert (=> b!200380 m!311161))

(assert (=> b!200378 m!311153))

(assert (=> b!200378 m!310301))

(assert (=> b!199921 d!68737))

(declare-fun d!68739 () Bool)

(declare-fun e!137454 () Bool)

(assert (=> d!68739 e!137454))

(declare-fun res!167764 () Bool)

(assert (=> d!68739 (=> (not res!167764) (not e!137454))))

(declare-fun lt!313272 () (_ BitVec 64))

(declare-fun lt!313270 () (_ BitVec 64))

(declare-fun lt!313271 () (_ BitVec 64))

(assert (=> d!68739 (= res!167764 (= lt!313271 (bvsub lt!313272 lt!313270)))))

(assert (=> d!68739 (or (= (bvand lt!313272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313270 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313272 lt!313270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68739 (= lt!313270 (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9226 lt!312138)))) ((_ sign_extend 32) (currentByte!9313 (_1!9226 lt!312138))) ((_ sign_extend 32) (currentBit!9308 (_1!9226 lt!312138)))))))

(declare-fun lt!313267 () (_ BitVec 64))

(declare-fun lt!313268 () (_ BitVec 64))

(assert (=> d!68739 (= lt!313272 (bvmul lt!313267 lt!313268))))

(assert (=> d!68739 (or (= lt!313267 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313268 (bvsdiv (bvmul lt!313267 lt!313268) lt!313267)))))

(assert (=> d!68739 (= lt!313268 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68739 (= lt!313267 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9226 lt!312138)))))))

(assert (=> d!68739 (= lt!313271 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9313 (_1!9226 lt!312138))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9308 (_1!9226 lt!312138)))))))

(assert (=> d!68739 (invariant!0 (currentBit!9308 (_1!9226 lt!312138)) (currentByte!9313 (_1!9226 lt!312138)) (size!4459 (buf!4957 (_1!9226 lt!312138))))))

(assert (=> d!68739 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9226 lt!312138))) (currentByte!9313 (_1!9226 lt!312138)) (currentBit!9308 (_1!9226 lt!312138))) lt!313271)))

(declare-fun b!200382 () Bool)

(declare-fun res!167763 () Bool)

(assert (=> b!200382 (=> (not res!167763) (not e!137454))))

(assert (=> b!200382 (= res!167763 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313271))))

(declare-fun b!200383 () Bool)

(declare-fun lt!313269 () (_ BitVec 64))

(assert (=> b!200383 (= e!137454 (bvsle lt!313271 (bvmul lt!313269 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200383 (or (= lt!313269 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313269 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313269)))))

(assert (=> b!200383 (= lt!313269 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9226 lt!312138)))))))

(assert (= (and d!68739 res!167764) b!200382))

(assert (= (and b!200382 res!167763) b!200383))

(declare-fun m!311163 () Bool)

(assert (=> d!68739 m!311163))

(declare-fun m!311165 () Bool)

(assert (=> d!68739 m!311165))

(assert (=> b!199910 d!68739))

(declare-fun d!68741 () Bool)

(declare-fun e!137455 () Bool)

(assert (=> d!68741 e!137455))

(declare-fun res!167766 () Bool)

(assert (=> d!68741 (=> (not res!167766) (not e!137455))))

(declare-fun lt!313276 () (_ BitVec 64))

(declare-fun lt!313277 () (_ BitVec 64))

(declare-fun lt!313278 () (_ BitVec 64))

(assert (=> d!68741 (= res!167766 (= lt!313277 (bvsub lt!313278 lt!313276)))))

(assert (=> d!68741 (or (= (bvand lt!313278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313276 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313278 lt!313276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68741 (= lt!313276 (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9224 lt!312141)))) ((_ sign_extend 32) (currentByte!9313 (_1!9224 lt!312141))) ((_ sign_extend 32) (currentBit!9308 (_1!9224 lt!312141)))))))

(declare-fun lt!313273 () (_ BitVec 64))

(declare-fun lt!313274 () (_ BitVec 64))

(assert (=> d!68741 (= lt!313278 (bvmul lt!313273 lt!313274))))

(assert (=> d!68741 (or (= lt!313273 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313274 (bvsdiv (bvmul lt!313273 lt!313274) lt!313273)))))

(assert (=> d!68741 (= lt!313274 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68741 (= lt!313273 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9224 lt!312141)))))))

(assert (=> d!68741 (= lt!313277 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9313 (_1!9224 lt!312141))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9308 (_1!9224 lt!312141)))))))

(assert (=> d!68741 (invariant!0 (currentBit!9308 (_1!9224 lt!312141)) (currentByte!9313 (_1!9224 lt!312141)) (size!4459 (buf!4957 (_1!9224 lt!312141))))))

(assert (=> d!68741 (= (bitIndex!0 (size!4459 (buf!4957 (_1!9224 lt!312141))) (currentByte!9313 (_1!9224 lt!312141)) (currentBit!9308 (_1!9224 lt!312141))) lt!313277)))

(declare-fun b!200384 () Bool)

(declare-fun res!167765 () Bool)

(assert (=> b!200384 (=> (not res!167765) (not e!137455))))

(assert (=> b!200384 (= res!167765 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313277))))

(declare-fun b!200385 () Bool)

(declare-fun lt!313275 () (_ BitVec 64))

(assert (=> b!200385 (= e!137455 (bvsle lt!313277 (bvmul lt!313275 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200385 (or (= lt!313275 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313275 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313275)))))

(assert (=> b!200385 (= lt!313275 ((_ sign_extend 32) (size!4459 (buf!4957 (_1!9224 lt!312141)))))))

(assert (= (and d!68741 res!167766) b!200384))

(assert (= (and b!200384 res!167765) b!200385))

(declare-fun m!311167 () Bool)

(assert (=> d!68741 m!311167))

(declare-fun m!311169 () Bool)

(assert (=> d!68741 m!311169))

(assert (=> b!199906 d!68741))

(declare-fun d!68743 () Bool)

(declare-fun e!137456 () Bool)

(assert (=> d!68743 e!137456))

(declare-fun res!167768 () Bool)

(assert (=> d!68743 (=> (not res!167768) (not e!137456))))

(declare-fun lt!313283 () (_ BitVec 64))

(declare-fun lt!313284 () (_ BitVec 64))

(declare-fun lt!313282 () (_ BitVec 64))

(assert (=> d!68743 (= res!167768 (= lt!313283 (bvsub lt!313284 lt!313282)))))

(assert (=> d!68743 (or (= (bvand lt!313284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313284 lt!313282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68743 (= lt!313282 (remainingBits!0 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9223 lt!312132)))) ((_ sign_extend 32) (currentByte!9313 (_2!9223 lt!312132))) ((_ sign_extend 32) (currentBit!9308 (_2!9223 lt!312132)))))))

(declare-fun lt!313279 () (_ BitVec 64))

(declare-fun lt!313280 () (_ BitVec 64))

(assert (=> d!68743 (= lt!313284 (bvmul lt!313279 lt!313280))))

(assert (=> d!68743 (or (= lt!313279 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313280 (bvsdiv (bvmul lt!313279 lt!313280) lt!313279)))))

(assert (=> d!68743 (= lt!313280 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68743 (= lt!313279 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9223 lt!312132)))))))

(assert (=> d!68743 (= lt!313283 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9313 (_2!9223 lt!312132))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9308 (_2!9223 lt!312132)))))))

(assert (=> d!68743 (invariant!0 (currentBit!9308 (_2!9223 lt!312132)) (currentByte!9313 (_2!9223 lt!312132)) (size!4459 (buf!4957 (_2!9223 lt!312132))))))

(assert (=> d!68743 (= (bitIndex!0 (size!4459 (buf!4957 (_2!9223 lt!312132))) (currentByte!9313 (_2!9223 lt!312132)) (currentBit!9308 (_2!9223 lt!312132))) lt!313283)))

(declare-fun b!200386 () Bool)

(declare-fun res!167767 () Bool)

(assert (=> b!200386 (=> (not res!167767) (not e!137456))))

(assert (=> b!200386 (= res!167767 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313283))))

(declare-fun b!200387 () Bool)

(declare-fun lt!313281 () (_ BitVec 64))

(assert (=> b!200387 (= e!137456 (bvsle lt!313283 (bvmul lt!313281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200387 (or (= lt!313281 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313281 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313281)))))

(assert (=> b!200387 (= lt!313281 ((_ sign_extend 32) (size!4459 (buf!4957 (_2!9223 lt!312132)))))))

(assert (= (and d!68743 res!167768) b!200386))

(assert (= (and b!200386 res!167767) b!200387))

(declare-fun m!311171 () Bool)

(assert (=> d!68743 m!311171))

(declare-fun m!311173 () Bool)

(assert (=> d!68743 m!311173))

(assert (=> b!199906 d!68743))

(declare-fun d!68745 () Bool)

(assert (=> d!68745 (= (invariant!0 (currentBit!9308 (_2!9225 lt!312119)) (currentByte!9313 (_2!9225 lt!312119)) (size!4459 (buf!4957 (_2!9225 lt!312119)))) (and (bvsge (currentBit!9308 (_2!9225 lt!312119)) #b00000000000000000000000000000000) (bvslt (currentBit!9308 (_2!9225 lt!312119)) #b00000000000000000000000000001000) (bvsge (currentByte!9313 (_2!9225 lt!312119)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9313 (_2!9225 lt!312119)) (size!4459 (buf!4957 (_2!9225 lt!312119)))) (and (= (currentBit!9308 (_2!9225 lt!312119)) #b00000000000000000000000000000000) (= (currentByte!9313 (_2!9225 lt!312119)) (size!4459 (buf!4957 (_2!9225 lt!312119))))))))))

(assert (=> b!199908 d!68745))

(declare-fun d!68747 () Bool)

(declare-fun lt!313285 () tuple2!17174)

(assert (=> d!68747 (= lt!313285 (readBit!0 (readerFrom!0 (_2!9225 lt!312127) (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204))))))

(assert (=> d!68747 (= (readBitPure!0 (readerFrom!0 (_2!9225 lt!312127) (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204))) (tuple2!17151 (_2!9238 lt!313285) (_1!9238 lt!313285)))))

(declare-fun bs!16925 () Bool)

(assert (= bs!16925 d!68747))

(assert (=> bs!16925 m!310319))

(declare-fun m!311175 () Bool)

(assert (=> bs!16925 m!311175))

(assert (=> b!199907 d!68747))

(declare-fun d!68749 () Bool)

(declare-fun e!137459 () Bool)

(assert (=> d!68749 e!137459))

(declare-fun res!167772 () Bool)

(assert (=> d!68749 (=> (not res!167772) (not e!137459))))

(assert (=> d!68749 (= res!167772 (invariant!0 (currentBit!9308 (_2!9225 lt!312127)) (currentByte!9313 (_2!9225 lt!312127)) (size!4459 (buf!4957 (_2!9225 lt!312127)))))))

(assert (=> d!68749 (= (readerFrom!0 (_2!9225 lt!312127) (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204)) (BitStream!8027 (buf!4957 (_2!9225 lt!312127)) (currentByte!9313 thiss!1204) (currentBit!9308 thiss!1204)))))

(declare-fun b!200390 () Bool)

(assert (=> b!200390 (= e!137459 (invariant!0 (currentBit!9308 thiss!1204) (currentByte!9313 thiss!1204) (size!4459 (buf!4957 (_2!9225 lt!312127)))))))

(assert (= (and d!68749 res!167772) b!200390))

(assert (=> d!68749 m!310513))

(assert (=> b!200390 m!310275))

(assert (=> b!199907 d!68749))

(push 1)

(assert (not b!200163))

(assert (not b!200350))

(assert (not d!68617))

(assert (not b!200381))

(assert (not d!68535))

(assert (not d!68567))

(assert (not d!68741))

(assert (not b!200161))

(assert (not b!200112))

(assert (not b!200379))

(assert (not bm!3170))

(assert (not b!200107))

(assert (not d!68743))

(assert (not d!68615))

(assert (not d!68547))

(assert (not b!200357))

(assert (not b!200390))

(assert (not b!200360))

(assert (not b!200145))

(assert (not b!200147))

(assert (not d!68571))

(assert (not b!200364))

(assert (not d!68603))

(assert (not b!200110))

(assert (not d!68749))

(assert (not d!68517))

(assert (not b!200351))

(assert (not b!200380))

(assert (not d!68605))

(assert (not b!200158))

(assert (not d!68545))

(assert (not d!68747))

(assert (not d!68573))

(assert (not b!200146))

(assert (not d!68561))

(assert (not d!68625))

(assert (not b!200359))

(assert (not d!68525))

(assert (not b!200109))

(assert (not b!200155))

(assert (not d!68579))

(assert (not b!200378))

(assert (not d!68601))

(assert (not d!68609))

(assert (not d!68619))

(assert (not d!68557))

(assert (not d!68565))

(assert (not b!200354))

(assert (not d!68739))

(assert (not d!68519))

(assert (not b!200358))

(assert (not b!200157))

(assert (not b!200156))

(assert (not b!200148))

(assert (not d!68737))

(assert (not d!68607))

(assert (not d!68613))

(assert (not d!68623))

(assert (not d!68569))

(assert (not b!200355))

(assert (not d!68515))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

