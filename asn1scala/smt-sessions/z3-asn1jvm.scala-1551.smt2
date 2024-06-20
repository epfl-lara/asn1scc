; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43604 () Bool)

(assert start!43604)

(declare-fun b!206390 () Bool)

(declare-fun res!173063 () Bool)

(declare-fun e!141132 () Bool)

(assert (=> b!206390 (=> (not res!173063) (not e!141132))))

(declare-datatypes ((array!10387 0))(
  ( (array!10388 (arr!5495 (Array (_ BitVec 32) (_ BitVec 8))) (size!4565 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8238 0))(
  ( (BitStream!8239 (buf!5070 array!10387) (currentByte!9588 (_ BitVec 32)) (currentBit!9583 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8238)

(declare-datatypes ((Unit!14724 0))(
  ( (Unit!14725) )
))
(declare-datatypes ((tuple2!17636 0))(
  ( (tuple2!17637 (_1!9473 Unit!14724) (_2!9473 BitStream!8238)) )
))
(declare-fun lt!322583 () tuple2!17636)

(declare-fun isPrefixOf!0 (BitStream!8238 BitStream!8238) Bool)

(assert (=> b!206390 (= res!173063 (isPrefixOf!0 thiss!1204 (_2!9473 lt!322583)))))

(declare-fun b!206391 () Bool)

(declare-fun res!173054 () Bool)

(declare-fun e!141125 () Bool)

(assert (=> b!206391 (=> res!173054 e!141125)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!322570 () (_ BitVec 64))

(declare-fun lt!322576 () (_ BitVec 64))

(declare-fun lt!322573 () tuple2!17636)

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!206391 (= res!173054 (or (not (= (size!4565 (buf!5070 (_2!9473 lt!322573))) (size!4565 (buf!5070 thiss!1204)))) (not (= lt!322576 (bvsub (bvadd lt!322570 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun lt!322574 () (_ BitVec 64))

(declare-fun b!206392 () Bool)

(assert (=> b!206392 (= e!141125 (or (not (= (size!4565 (buf!5070 thiss!1204)) (size!4565 (buf!5070 (_2!9473 lt!322573))))) (bvsge lt!322574 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!17638 0))(
  ( (tuple2!17639 (_1!9474 BitStream!8238) (_2!9474 BitStream!8238)) )
))
(declare-fun lt!322580 () tuple2!17638)

(declare-fun lt!322571 () Bool)

(declare-datatypes ((tuple2!17640 0))(
  ( (tuple2!17641 (_1!9475 BitStream!8238) (_2!9475 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8238) tuple2!17640)

(assert (=> b!206392 (= (_2!9475 (readBitPure!0 (_1!9474 lt!322580))) lt!322571)))

(declare-fun lt!322582 () tuple2!17638)

(declare-fun reader!0 (BitStream!8238 BitStream!8238) tuple2!17638)

(assert (=> b!206392 (= lt!322582 (reader!0 (_2!9473 lt!322583) (_2!9473 lt!322573)))))

(assert (=> b!206392 (= lt!322580 (reader!0 thiss!1204 (_2!9473 lt!322573)))))

(declare-fun e!141129 () Bool)

(assert (=> b!206392 e!141129))

(declare-fun res!173058 () Bool)

(assert (=> b!206392 (=> (not res!173058) (not e!141129))))

(declare-fun lt!322578 () tuple2!17640)

(declare-fun lt!322581 () tuple2!17640)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206392 (= res!173058 (= (bitIndex!0 (size!4565 (buf!5070 (_1!9475 lt!322578))) (currentByte!9588 (_1!9475 lt!322578)) (currentBit!9583 (_1!9475 lt!322578))) (bitIndex!0 (size!4565 (buf!5070 (_1!9475 lt!322581))) (currentByte!9588 (_1!9475 lt!322581)) (currentBit!9583 (_1!9475 lt!322581)))))))

(declare-fun lt!322585 () Unit!14724)

(declare-fun lt!322586 () BitStream!8238)

(declare-fun readBitPrefixLemma!0 (BitStream!8238 BitStream!8238) Unit!14724)

(assert (=> b!206392 (= lt!322585 (readBitPrefixLemma!0 lt!322586 (_2!9473 lt!322573)))))

(assert (=> b!206392 (= lt!322581 (readBitPure!0 (BitStream!8239 (buf!5070 (_2!9473 lt!322573)) (currentByte!9588 thiss!1204) (currentBit!9583 thiss!1204))))))

(assert (=> b!206392 (= lt!322578 (readBitPure!0 lt!322586))))

(declare-fun e!141126 () Bool)

(assert (=> b!206392 e!141126))

(declare-fun res!173065 () Bool)

(assert (=> b!206392 (=> (not res!173065) (not e!141126))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206392 (= res!173065 (invariant!0 (currentBit!9583 thiss!1204) (currentByte!9588 thiss!1204) (size!4565 (buf!5070 (_2!9473 lt!322583)))))))

(assert (=> b!206392 (= lt!322586 (BitStream!8239 (buf!5070 (_2!9473 lt!322583)) (currentByte!9588 thiss!1204) (currentBit!9583 thiss!1204)))))

(declare-fun b!206394 () Bool)

(declare-fun res!173061 () Bool)

(assert (=> b!206394 (=> res!173061 e!141125)))

(assert (=> b!206394 (= res!173061 (not (isPrefixOf!0 thiss!1204 (_2!9473 lt!322583))))))

(declare-fun b!206395 () Bool)

(declare-fun e!141124 () Bool)

(assert (=> b!206395 (= e!141132 e!141124)))

(declare-fun res!173064 () Bool)

(assert (=> b!206395 (=> (not res!173064) (not e!141124))))

(declare-fun lt!322572 () tuple2!17640)

(assert (=> b!206395 (= res!173064 (and (= (_2!9475 lt!322572) lt!322571) (= (_1!9475 lt!322572) (_2!9473 lt!322583))))))

(declare-fun readerFrom!0 (BitStream!8238 (_ BitVec 32) (_ BitVec 32)) BitStream!8238)

(assert (=> b!206395 (= lt!322572 (readBitPure!0 (readerFrom!0 (_2!9473 lt!322583) (currentBit!9583 thiss!1204) (currentByte!9588 thiss!1204))))))

(declare-fun b!206396 () Bool)

(declare-fun e!141131 () Bool)

(assert (=> b!206396 (= e!141131 e!141125)))

(declare-fun res!173060 () Bool)

(assert (=> b!206396 (=> res!173060 e!141125)))

(declare-fun lt!322577 () (_ BitVec 64))

(assert (=> b!206396 (= res!173060 (not (= lt!322576 (bvsub (bvsub (bvadd lt!322577 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206396 (= lt!322576 (bitIndex!0 (size!4565 (buf!5070 (_2!9473 lt!322573))) (currentByte!9588 (_2!9473 lt!322573)) (currentBit!9583 (_2!9473 lt!322573))))))

(assert (=> b!206396 (isPrefixOf!0 thiss!1204 (_2!9473 lt!322573))))

(declare-fun lt!322584 () Unit!14724)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8238 BitStream!8238 BitStream!8238) Unit!14724)

(assert (=> b!206396 (= lt!322584 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9473 lt!322583) (_2!9473 lt!322573)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8238 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17636)

(assert (=> b!206396 (= lt!322573 (appendBitsLSBFirstLoopTR!0 (_2!9473 lt!322583) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206397 () Bool)

(assert (=> b!206397 (= e!141129 (= (_2!9475 lt!322578) (_2!9475 lt!322581)))))

(declare-fun b!206398 () Bool)

(declare-fun res!173053 () Bool)

(assert (=> b!206398 (=> res!173053 e!141125)))

(assert (=> b!206398 (= res!173053 (not (invariant!0 (currentBit!9583 (_2!9473 lt!322573)) (currentByte!9588 (_2!9473 lt!322573)) (size!4565 (buf!5070 (_2!9473 lt!322573))))))))

(declare-fun b!206399 () Bool)

(declare-fun e!141127 () Bool)

(declare-fun e!141122 () Bool)

(assert (=> b!206399 (= e!141127 e!141122)))

(declare-fun res!173066 () Bool)

(assert (=> b!206399 (=> (not res!173066) (not e!141122))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206399 (= res!173066 (validate_offset_bits!1 ((_ sign_extend 32) (size!4565 (buf!5070 thiss!1204))) ((_ sign_extend 32) (currentByte!9588 thiss!1204)) ((_ sign_extend 32) (currentBit!9583 thiss!1204)) lt!322574))))

(assert (=> b!206399 (= lt!322574 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!206400 () Bool)

(declare-fun lt!322579 () (_ BitVec 64))

(assert (=> b!206400 (= e!141124 (= (bitIndex!0 (size!4565 (buf!5070 (_1!9475 lt!322572))) (currentByte!9588 (_1!9475 lt!322572)) (currentBit!9583 (_1!9475 lt!322572))) lt!322579))))

(declare-fun b!206401 () Bool)

(assert (=> b!206401 (= e!141122 (not e!141131))))

(declare-fun res!173059 () Bool)

(assert (=> b!206401 (=> res!173059 e!141131)))

(assert (=> b!206401 (= res!173059 (not (= lt!322577 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322570))))))

(assert (=> b!206401 (= lt!322577 (bitIndex!0 (size!4565 (buf!5070 (_2!9473 lt!322583))) (currentByte!9588 (_2!9473 lt!322583)) (currentBit!9583 (_2!9473 lt!322583))))))

(assert (=> b!206401 (= lt!322570 (bitIndex!0 (size!4565 (buf!5070 thiss!1204)) (currentByte!9588 thiss!1204) (currentBit!9583 thiss!1204)))))

(declare-fun e!141130 () Bool)

(assert (=> b!206401 e!141130))

(declare-fun res!173057 () Bool)

(assert (=> b!206401 (=> (not res!173057) (not e!141130))))

(assert (=> b!206401 (= res!173057 (= (size!4565 (buf!5070 thiss!1204)) (size!4565 (buf!5070 (_2!9473 lt!322583)))))))

(declare-fun appendBit!0 (BitStream!8238 Bool) tuple2!17636)

(assert (=> b!206401 (= lt!322583 (appendBit!0 thiss!1204 lt!322571))))

(assert (=> b!206401 (= lt!322571 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206402 () Bool)

(declare-fun res!173056 () Bool)

(assert (=> b!206402 (=> res!173056 e!141125)))

(assert (=> b!206402 (= res!173056 (not (isPrefixOf!0 (_2!9473 lt!322583) (_2!9473 lt!322573))))))

(declare-fun b!206393 () Bool)

(assert (=> b!206393 (= e!141126 (invariant!0 (currentBit!9583 thiss!1204) (currentByte!9588 thiss!1204) (size!4565 (buf!5070 (_2!9473 lt!322573)))))))

(declare-fun res!173052 () Bool)

(assert (=> start!43604 (=> (not res!173052) (not e!141127))))

(assert (=> start!43604 (= res!173052 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43604 e!141127))

(assert (=> start!43604 true))

(declare-fun e!141123 () Bool)

(declare-fun inv!12 (BitStream!8238) Bool)

(assert (=> start!43604 (and (inv!12 thiss!1204) e!141123)))

(declare-fun b!206403 () Bool)

(declare-fun res!173055 () Bool)

(assert (=> b!206403 (=> (not res!173055) (not e!141122))))

(assert (=> b!206403 (= res!173055 (not (= i!590 nBits!348)))))

(declare-fun b!206404 () Bool)

(assert (=> b!206404 (= e!141130 e!141132)))

(declare-fun res!173051 () Bool)

(assert (=> b!206404 (=> (not res!173051) (not e!141132))))

(declare-fun lt!322575 () (_ BitVec 64))

(assert (=> b!206404 (= res!173051 (= lt!322579 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322575)))))

(assert (=> b!206404 (= lt!322579 (bitIndex!0 (size!4565 (buf!5070 (_2!9473 lt!322583))) (currentByte!9588 (_2!9473 lt!322583)) (currentBit!9583 (_2!9473 lt!322583))))))

(assert (=> b!206404 (= lt!322575 (bitIndex!0 (size!4565 (buf!5070 thiss!1204)) (currentByte!9588 thiss!1204) (currentBit!9583 thiss!1204)))))

(declare-fun b!206405 () Bool)

(declare-fun res!173062 () Bool)

(assert (=> b!206405 (=> (not res!173062) (not e!141122))))

(assert (=> b!206405 (= res!173062 (invariant!0 (currentBit!9583 thiss!1204) (currentByte!9588 thiss!1204) (size!4565 (buf!5070 thiss!1204))))))

(declare-fun b!206406 () Bool)

(declare-fun array_inv!4306 (array!10387) Bool)

(assert (=> b!206406 (= e!141123 (array_inv!4306 (buf!5070 thiss!1204)))))

(assert (= (and start!43604 res!173052) b!206399))

(assert (= (and b!206399 res!173066) b!206405))

(assert (= (and b!206405 res!173062) b!206403))

(assert (= (and b!206403 res!173055) b!206401))

(assert (= (and b!206401 res!173057) b!206404))

(assert (= (and b!206404 res!173051) b!206390))

(assert (= (and b!206390 res!173063) b!206395))

(assert (= (and b!206395 res!173064) b!206400))

(assert (= (and b!206401 (not res!173059)) b!206396))

(assert (= (and b!206396 (not res!173060)) b!206398))

(assert (= (and b!206398 (not res!173053)) b!206391))

(assert (= (and b!206391 (not res!173054)) b!206402))

(assert (= (and b!206402 (not res!173056)) b!206394))

(assert (= (and b!206394 (not res!173061)) b!206392))

(assert (= (and b!206392 res!173065) b!206393))

(assert (= (and b!206392 res!173058) b!206397))

(assert (= start!43604 b!206406))

(declare-fun m!317949 () Bool)

(assert (=> b!206392 m!317949))

(declare-fun m!317951 () Bool)

(assert (=> b!206392 m!317951))

(declare-fun m!317953 () Bool)

(assert (=> b!206392 m!317953))

(declare-fun m!317955 () Bool)

(assert (=> b!206392 m!317955))

(declare-fun m!317957 () Bool)

(assert (=> b!206392 m!317957))

(declare-fun m!317959 () Bool)

(assert (=> b!206392 m!317959))

(declare-fun m!317961 () Bool)

(assert (=> b!206392 m!317961))

(declare-fun m!317963 () Bool)

(assert (=> b!206392 m!317963))

(declare-fun m!317965 () Bool)

(assert (=> b!206392 m!317965))

(declare-fun m!317967 () Bool)

(assert (=> b!206406 m!317967))

(declare-fun m!317969 () Bool)

(assert (=> b!206405 m!317969))

(declare-fun m!317971 () Bool)

(assert (=> b!206396 m!317971))

(declare-fun m!317973 () Bool)

(assert (=> b!206396 m!317973))

(declare-fun m!317975 () Bool)

(assert (=> b!206396 m!317975))

(declare-fun m!317977 () Bool)

(assert (=> b!206396 m!317977))

(declare-fun m!317979 () Bool)

(assert (=> b!206394 m!317979))

(declare-fun m!317981 () Bool)

(assert (=> b!206402 m!317981))

(declare-fun m!317983 () Bool)

(assert (=> b!206395 m!317983))

(assert (=> b!206395 m!317983))

(declare-fun m!317985 () Bool)

(assert (=> b!206395 m!317985))

(declare-fun m!317987 () Bool)

(assert (=> start!43604 m!317987))

(declare-fun m!317989 () Bool)

(assert (=> b!206404 m!317989))

(declare-fun m!317991 () Bool)

(assert (=> b!206404 m!317991))

(declare-fun m!317993 () Bool)

(assert (=> b!206399 m!317993))

(declare-fun m!317995 () Bool)

(assert (=> b!206393 m!317995))

(assert (=> b!206401 m!317989))

(assert (=> b!206401 m!317991))

(declare-fun m!317997 () Bool)

(assert (=> b!206401 m!317997))

(assert (=> b!206390 m!317979))

(declare-fun m!317999 () Bool)

(assert (=> b!206400 m!317999))

(declare-fun m!318001 () Bool)

(assert (=> b!206398 m!318001))

(check-sat (not b!206400) (not b!206398) (not b!206392) (not b!206402) (not b!206395) (not b!206390) (not b!206393) (not b!206401) (not b!206405) (not b!206406) (not b!206404) (not b!206394) (not start!43604) (not b!206396) (not b!206399))
(check-sat)
