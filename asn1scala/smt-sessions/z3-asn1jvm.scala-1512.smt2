; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41914 () Bool)

(assert start!41914)

(declare-fun b!197302 () Bool)

(declare-fun res!165130 () Bool)

(declare-fun e!135515 () Bool)

(assert (=> b!197302 (=> res!165130 e!135515)))

(declare-datatypes ((array!10099 0))(
  ( (array!10100 (arr!5381 (Array (_ BitVec 32) (_ BitVec 8))) (size!4451 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8010 0))(
  ( (BitStream!8011 (buf!4937 array!10099) (currentByte!9275 (_ BitVec 32)) (currentBit!9270 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13967 0))(
  ( (Unit!13968) )
))
(declare-datatypes ((tuple2!17064 0))(
  ( (tuple2!17065 (_1!9177 Unit!13967) (_2!9177 BitStream!8010)) )
))
(declare-fun lt!307127 () tuple2!17064)

(declare-fun lt!307128 () tuple2!17064)

(declare-fun isPrefixOf!0 (BitStream!8010 BitStream!8010) Bool)

(assert (=> b!197302 (= res!165130 (not (isPrefixOf!0 (_2!9177 lt!307127) (_2!9177 lt!307128))))))

(declare-fun b!197303 () Bool)

(declare-fun res!165131 () Bool)

(declare-fun e!135517 () Bool)

(assert (=> b!197303 (=> (not res!165131) (not e!135517))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!197303 (= res!165131 (not (= i!590 nBits!348)))))

(declare-fun b!197304 () Bool)

(declare-fun e!135512 () Bool)

(assert (=> b!197304 (= e!135517 (not e!135512))))

(declare-fun res!165135 () Bool)

(assert (=> b!197304 (=> res!165135 e!135512)))

(declare-fun lt!307126 () (_ BitVec 64))

(declare-fun lt!307131 () (_ BitVec 64))

(assert (=> b!197304 (= res!165135 (not (= lt!307126 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307131))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197304 (= lt!307126 (bitIndex!0 (size!4451 (buf!4937 (_2!9177 lt!307127))) (currentByte!9275 (_2!9177 lt!307127)) (currentBit!9270 (_2!9177 lt!307127))))))

(declare-fun thiss!1204 () BitStream!8010)

(assert (=> b!197304 (= lt!307131 (bitIndex!0 (size!4451 (buf!4937 thiss!1204)) (currentByte!9275 thiss!1204) (currentBit!9270 thiss!1204)))))

(declare-fun e!135518 () Bool)

(assert (=> b!197304 e!135518))

(declare-fun res!165133 () Bool)

(assert (=> b!197304 (=> (not res!165133) (not e!135518))))

(assert (=> b!197304 (= res!165133 (= (size!4451 (buf!4937 thiss!1204)) (size!4451 (buf!4937 (_2!9177 lt!307127)))))))

(declare-fun lt!307135 () Bool)

(declare-fun appendBit!0 (BitStream!8010 Bool) tuple2!17064)

(assert (=> b!197304 (= lt!307127 (appendBit!0 thiss!1204 lt!307135))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!197304 (= lt!307135 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!197305 () Bool)

(declare-fun e!135513 () Bool)

(declare-fun array_inv!4192 (array!10099) Bool)

(assert (=> b!197305 (= e!135513 (array_inv!4192 (buf!4937 thiss!1204)))))

(declare-fun b!197307 () Bool)

(declare-fun e!135511 () Bool)

(declare-fun e!135516 () Bool)

(assert (=> b!197307 (= e!135511 e!135516)))

(declare-fun res!165138 () Bool)

(assert (=> b!197307 (=> (not res!165138) (not e!135516))))

(declare-datatypes ((tuple2!17066 0))(
  ( (tuple2!17067 (_1!9178 BitStream!8010) (_2!9178 Bool)) )
))
(declare-fun lt!307130 () tuple2!17066)

(assert (=> b!197307 (= res!165138 (and (= (_2!9178 lt!307130) lt!307135) (= (_1!9178 lt!307130) (_2!9177 lt!307127))))))

(declare-fun readBitPure!0 (BitStream!8010) tuple2!17066)

(declare-fun readerFrom!0 (BitStream!8010 (_ BitVec 32) (_ BitVec 32)) BitStream!8010)

(assert (=> b!197307 (= lt!307130 (readBitPure!0 (readerFrom!0 (_2!9177 lt!307127) (currentBit!9270 thiss!1204) (currentByte!9275 thiss!1204))))))

(declare-fun b!197308 () Bool)

(declare-fun res!165132 () Bool)

(assert (=> b!197308 (=> (not res!165132) (not e!135517))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!197308 (= res!165132 (invariant!0 (currentBit!9270 thiss!1204) (currentByte!9275 thiss!1204) (size!4451 (buf!4937 thiss!1204))))))

(declare-fun b!197309 () Bool)

(assert (=> b!197309 (= e!135518 e!135511)))

(declare-fun res!165129 () Bool)

(assert (=> b!197309 (=> (not res!165129) (not e!135511))))

(declare-fun lt!307129 () (_ BitVec 64))

(declare-fun lt!307133 () (_ BitVec 64))

(assert (=> b!197309 (= res!165129 (= lt!307129 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307133)))))

(assert (=> b!197309 (= lt!307129 (bitIndex!0 (size!4451 (buf!4937 (_2!9177 lt!307127))) (currentByte!9275 (_2!9177 lt!307127)) (currentBit!9270 (_2!9177 lt!307127))))))

(assert (=> b!197309 (= lt!307133 (bitIndex!0 (size!4451 (buf!4937 thiss!1204)) (currentByte!9275 thiss!1204) (currentBit!9270 thiss!1204)))))

(declare-fun b!197310 () Bool)

(assert (=> b!197310 (= e!135516 (= (bitIndex!0 (size!4451 (buf!4937 (_1!9178 lt!307130))) (currentByte!9275 (_1!9178 lt!307130)) (currentBit!9270 (_1!9178 lt!307130))) lt!307129))))

(declare-fun b!197311 () Bool)

(assert (=> b!197311 (= e!135512 e!135515)))

(declare-fun res!165126 () Bool)

(assert (=> b!197311 (=> res!165126 e!135515)))

(declare-fun lt!307134 () (_ BitVec 64))

(assert (=> b!197311 (= res!165126 (not (= lt!307134 (bvsub (bvsub (bvadd lt!307126 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!197311 (= lt!307134 (bitIndex!0 (size!4451 (buf!4937 (_2!9177 lt!307128))) (currentByte!9275 (_2!9177 lt!307128)) (currentBit!9270 (_2!9177 lt!307128))))))

(assert (=> b!197311 (isPrefixOf!0 thiss!1204 (_2!9177 lt!307128))))

(declare-fun lt!307132 () Unit!13967)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8010 BitStream!8010 BitStream!8010) Unit!13967)

(assert (=> b!197311 (= lt!307132 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9177 lt!307127) (_2!9177 lt!307128)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8010 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17064)

(assert (=> b!197311 (= lt!307128 (appendBitsLSBFirstLoopTR!0 (_2!9177 lt!307127) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!197312 () Bool)

(declare-fun res!165127 () Bool)

(assert (=> b!197312 (=> res!165127 e!135515)))

(assert (=> b!197312 (= res!165127 (not (invariant!0 (currentBit!9270 (_2!9177 lt!307128)) (currentByte!9275 (_2!9177 lt!307128)) (size!4451 (buf!4937 (_2!9177 lt!307128))))))))

(declare-fun b!197313 () Bool)

(declare-fun res!165136 () Bool)

(assert (=> b!197313 (=> res!165136 e!135515)))

(assert (=> b!197313 (= res!165136 (or (not (= (size!4451 (buf!4937 (_2!9177 lt!307128))) (size!4451 (buf!4937 thiss!1204)))) (not (= lt!307134 (bvsub (bvadd lt!307131 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!165137 () Bool)

(assert (=> start!41914 (=> (not res!165137) (not e!135517))))

(assert (=> start!41914 (= res!165137 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41914 e!135517))

(assert (=> start!41914 true))

(declare-fun inv!12 (BitStream!8010) Bool)

(assert (=> start!41914 (and (inv!12 thiss!1204) e!135513)))

(declare-fun b!197306 () Bool)

(declare-fun res!165128 () Bool)

(assert (=> b!197306 (=> (not res!165128) (not e!135517))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197306 (= res!165128 (validate_offset_bits!1 ((_ sign_extend 32) (size!4451 (buf!4937 thiss!1204))) ((_ sign_extend 32) (currentByte!9275 thiss!1204)) ((_ sign_extend 32) (currentBit!9270 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!197314 () Bool)

(declare-fun res!165134 () Bool)

(assert (=> b!197314 (=> (not res!165134) (not e!135511))))

(assert (=> b!197314 (= res!165134 (isPrefixOf!0 thiss!1204 (_2!9177 lt!307127)))))

(declare-fun b!197315 () Bool)

(assert (=> b!197315 (= e!135515 (isPrefixOf!0 thiss!1204 (_2!9177 lt!307127)))))

(assert (= (and start!41914 res!165137) b!197306))

(assert (= (and b!197306 res!165128) b!197308))

(assert (= (and b!197308 res!165132) b!197303))

(assert (= (and b!197303 res!165131) b!197304))

(assert (= (and b!197304 res!165133) b!197309))

(assert (= (and b!197309 res!165129) b!197314))

(assert (= (and b!197314 res!165134) b!197307))

(assert (= (and b!197307 res!165138) b!197310))

(assert (= (and b!197304 (not res!165135)) b!197311))

(assert (= (and b!197311 (not res!165126)) b!197312))

(assert (= (and b!197312 (not res!165127)) b!197313))

(assert (= (and b!197313 (not res!165136)) b!197302))

(assert (= (and b!197302 (not res!165130)) b!197315))

(assert (= start!41914 b!197305))

(declare-fun m!304911 () Bool)

(assert (=> b!197305 m!304911))

(declare-fun m!304913 () Bool)

(assert (=> b!197310 m!304913))

(declare-fun m!304915 () Bool)

(assert (=> b!197306 m!304915))

(declare-fun m!304917 () Bool)

(assert (=> b!197311 m!304917))

(declare-fun m!304919 () Bool)

(assert (=> b!197311 m!304919))

(declare-fun m!304921 () Bool)

(assert (=> b!197311 m!304921))

(declare-fun m!304923 () Bool)

(assert (=> b!197311 m!304923))

(declare-fun m!304925 () Bool)

(assert (=> b!197315 m!304925))

(declare-fun m!304927 () Bool)

(assert (=> b!197304 m!304927))

(declare-fun m!304929 () Bool)

(assert (=> b!197304 m!304929))

(declare-fun m!304931 () Bool)

(assert (=> b!197304 m!304931))

(declare-fun m!304933 () Bool)

(assert (=> start!41914 m!304933))

(declare-fun m!304935 () Bool)

(assert (=> b!197312 m!304935))

(declare-fun m!304937 () Bool)

(assert (=> b!197307 m!304937))

(assert (=> b!197307 m!304937))

(declare-fun m!304939 () Bool)

(assert (=> b!197307 m!304939))

(declare-fun m!304941 () Bool)

(assert (=> b!197308 m!304941))

(declare-fun m!304943 () Bool)

(assert (=> b!197302 m!304943))

(assert (=> b!197309 m!304927))

(assert (=> b!197309 m!304929))

(assert (=> b!197314 m!304925))

(check-sat (not b!197307) (not b!197302) (not b!197314) (not b!197306) (not b!197308) (not b!197304) (not b!197312) (not start!41914) (not b!197315) (not b!197310) (not b!197311) (not b!197305) (not b!197309))
