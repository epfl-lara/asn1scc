; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26714 () Bool)

(assert start!26714)

(declare-fun b!137244 () Bool)

(declare-fun res!114280 () Bool)

(declare-fun e!91187 () Bool)

(assert (=> b!137244 (=> (not res!114280) (not e!91187))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!137244 (= res!114280 (bvslt from!447 to!404))))

(declare-fun b!137245 () Bool)

(declare-fun e!91192 () Bool)

(assert (=> b!137245 (= e!91187 (not e!91192))))

(declare-fun res!114269 () Bool)

(assert (=> b!137245 (=> res!114269 e!91192)))

(declare-datatypes ((array!6223 0))(
  ( (array!6224 (arr!3503 (Array (_ BitVec 32) (_ BitVec 8))) (size!2817 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4898 0))(
  ( (BitStream!4899 (buf!3224 array!6223) (currentByte!6031 (_ BitVec 32)) (currentBit!6026 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11946 0))(
  ( (tuple2!11947 (_1!6296 BitStream!4898) (_2!6296 array!6223)) )
))
(declare-fun lt!213807 () tuple2!11946)

(declare-fun lt!213805 () tuple2!11946)

(declare-fun arrayRangesEq!220 (array!6223 array!6223 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137245 (= res!114269 (not (arrayRangesEq!220 (_2!6296 lt!213805) (_2!6296 lt!213807) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!213814 () tuple2!11946)

(assert (=> b!137245 (arrayRangesEq!220 (_2!6296 lt!213805) (_2!6296 lt!213814) #b00000000000000000000000000000000 to!404)))

(declare-fun arr!237 () array!6223)

(declare-datatypes ((tuple2!11948 0))(
  ( (tuple2!11949 (_1!6297 BitStream!4898) (_2!6297 BitStream!4898)) )
))
(declare-fun lt!213817 () tuple2!11948)

(declare-datatypes ((Unit!8581 0))(
  ( (Unit!8582) )
))
(declare-fun lt!213822 () Unit!8581)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4898 array!6223 (_ BitVec 32) (_ BitVec 32)) Unit!8581)

(assert (=> b!137245 (= lt!213822 (readByteArrayLoopArrayPrefixLemma!0 (_1!6297 lt!213817) arr!237 from!447 to!404))))

(declare-fun lt!213809 () array!6223)

(declare-fun readByteArrayLoopPure!0 (BitStream!4898 array!6223 (_ BitVec 32) (_ BitVec 32)) tuple2!11946)

(declare-fun withMovedByteIndex!0 (BitStream!4898 (_ BitVec 32)) BitStream!4898)

(assert (=> b!137245 (= lt!213814 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6297 lt!213817) #b00000000000000000000000000000001) lt!213809 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!213802 () tuple2!11948)

(assert (=> b!137245 (= lt!213807 (readByteArrayLoopPure!0 (_1!6297 lt!213802) lt!213809 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11950 0))(
  ( (tuple2!11951 (_1!6298 BitStream!4898) (_2!6298 (_ BitVec 8))) )
))
(declare-fun lt!213801 () tuple2!11950)

(assert (=> b!137245 (= lt!213809 (array!6224 (store (arr!3503 arr!237) from!447 (_2!6298 lt!213801)) (size!2817 arr!237)))))

(declare-datatypes ((tuple2!11952 0))(
  ( (tuple2!11953 (_1!6299 Unit!8581) (_2!6299 BitStream!4898)) )
))
(declare-fun lt!213796 () tuple2!11952)

(declare-fun lt!213798 () tuple2!11952)

(declare-fun lt!213820 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137245 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2817 (buf!3224 (_2!6299 lt!213796)))) ((_ sign_extend 32) (currentByte!6031 (_2!6299 lt!213798))) ((_ sign_extend 32) (currentBit!6026 (_2!6299 lt!213798))) lt!213820)))

(declare-fun lt!213804 () Unit!8581)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4898 array!6223 (_ BitVec 32)) Unit!8581)

(assert (=> b!137245 (= lt!213804 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6299 lt!213798) (buf!3224 (_2!6299 lt!213796)) lt!213820))))

(assert (=> b!137245 (= (_1!6296 lt!213805) (_2!6297 lt!213817))))

(assert (=> b!137245 (= lt!213805 (readByteArrayLoopPure!0 (_1!6297 lt!213817) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!4898)

(assert (=> b!137245 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2817 (buf!3224 (_2!6299 lt!213796)))) ((_ sign_extend 32) (currentByte!6031 thiss!1634)) ((_ sign_extend 32) (currentBit!6026 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!213794 () Unit!8581)

(assert (=> b!137245 (= lt!213794 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3224 (_2!6299 lt!213796)) (bvsub to!404 from!447)))))

(assert (=> b!137245 (= (_2!6298 lt!213801) (select (arr!3503 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4898) tuple2!11950)

(assert (=> b!137245 (= lt!213801 (readBytePure!0 (_1!6297 lt!213817)))))

(declare-fun reader!0 (BitStream!4898 BitStream!4898) tuple2!11948)

(assert (=> b!137245 (= lt!213802 (reader!0 (_2!6299 lt!213798) (_2!6299 lt!213796)))))

(assert (=> b!137245 (= lt!213817 (reader!0 thiss!1634 (_2!6299 lt!213796)))))

(declare-fun e!91195 () Bool)

(assert (=> b!137245 e!91195))

(declare-fun res!114277 () Bool)

(assert (=> b!137245 (=> (not res!114277) (not e!91195))))

(declare-fun lt!213812 () tuple2!11950)

(declare-fun lt!213816 () tuple2!11950)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137245 (= res!114277 (= (bitIndex!0 (size!2817 (buf!3224 (_1!6298 lt!213812))) (currentByte!6031 (_1!6298 lt!213812)) (currentBit!6026 (_1!6298 lt!213812))) (bitIndex!0 (size!2817 (buf!3224 (_1!6298 lt!213816))) (currentByte!6031 (_1!6298 lt!213816)) (currentBit!6026 (_1!6298 lt!213816)))))))

(declare-fun lt!213813 () Unit!8581)

(declare-fun lt!213821 () BitStream!4898)

(declare-fun readBytePrefixLemma!0 (BitStream!4898 BitStream!4898) Unit!8581)

(assert (=> b!137245 (= lt!213813 (readBytePrefixLemma!0 lt!213821 (_2!6299 lt!213796)))))

(assert (=> b!137245 (= lt!213816 (readBytePure!0 (BitStream!4899 (buf!3224 (_2!6299 lt!213796)) (currentByte!6031 thiss!1634) (currentBit!6026 thiss!1634))))))

(assert (=> b!137245 (= lt!213812 (readBytePure!0 lt!213821))))

(assert (=> b!137245 (= lt!213821 (BitStream!4899 (buf!3224 (_2!6299 lt!213798)) (currentByte!6031 thiss!1634) (currentBit!6026 thiss!1634)))))

(declare-fun e!91196 () Bool)

(assert (=> b!137245 e!91196))

(declare-fun res!114282 () Bool)

(assert (=> b!137245 (=> (not res!114282) (not e!91196))))

(declare-fun isPrefixOf!0 (BitStream!4898 BitStream!4898) Bool)

(assert (=> b!137245 (= res!114282 (isPrefixOf!0 thiss!1634 (_2!6299 lt!213796)))))

(declare-fun lt!213808 () Unit!8581)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4898 BitStream!4898 BitStream!4898) Unit!8581)

(assert (=> b!137245 (= lt!213808 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6299 lt!213798) (_2!6299 lt!213796)))))

(declare-fun e!91197 () Bool)

(assert (=> b!137245 e!91197))

(declare-fun res!114272 () Bool)

(assert (=> b!137245 (=> (not res!114272) (not e!91197))))

(assert (=> b!137245 (= res!114272 (= (size!2817 (buf!3224 (_2!6299 lt!213798))) (size!2817 (buf!3224 (_2!6299 lt!213796)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4898 array!6223 (_ BitVec 32) (_ BitVec 32)) tuple2!11952)

(assert (=> b!137245 (= lt!213796 (appendByteArrayLoop!0 (_2!6299 lt!213798) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137245 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2817 (buf!3224 (_2!6299 lt!213798)))) ((_ sign_extend 32) (currentByte!6031 (_2!6299 lt!213798))) ((_ sign_extend 32) (currentBit!6026 (_2!6299 lt!213798))) lt!213820)))

(assert (=> b!137245 (= lt!213820 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!213797 () Unit!8581)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4898 BitStream!4898 (_ BitVec 64) (_ BitVec 32)) Unit!8581)

(assert (=> b!137245 (= lt!213797 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6299 lt!213798) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!91193 () Bool)

(assert (=> b!137245 e!91193))

(declare-fun res!114278 () Bool)

(assert (=> b!137245 (=> (not res!114278) (not e!91193))))

(assert (=> b!137245 (= res!114278 (= (size!2817 (buf!3224 thiss!1634)) (size!2817 (buf!3224 (_2!6299 lt!213798)))))))

(declare-fun appendByte!0 (BitStream!4898 (_ BitVec 8)) tuple2!11952)

(assert (=> b!137245 (= lt!213798 (appendByte!0 thiss!1634 (select (arr!3503 arr!237) from!447)))))

(declare-fun b!137246 () Bool)

(declare-fun lt!213799 () tuple2!11950)

(declare-fun lt!213818 () tuple2!11948)

(assert (=> b!137246 (= e!91193 (and (= (_2!6298 lt!213799) (select (arr!3503 arr!237) from!447)) (= (_1!6298 lt!213799) (_2!6297 lt!213818))))))

(assert (=> b!137246 (= lt!213799 (readBytePure!0 (_1!6297 lt!213818)))))

(assert (=> b!137246 (= lt!213818 (reader!0 thiss!1634 (_2!6299 lt!213798)))))

(declare-fun b!137247 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137247 (= e!91196 (invariant!0 (currentBit!6026 thiss!1634) (currentByte!6031 thiss!1634) (size!2817 (buf!3224 (_2!6299 lt!213798)))))))

(declare-fun b!137248 () Bool)

(declare-fun res!114268 () Bool)

(assert (=> b!137248 (=> (not res!114268) (not e!91193))))

(assert (=> b!137248 (= res!114268 (isPrefixOf!0 thiss!1634 (_2!6299 lt!213798)))))

(declare-fun b!137249 () Bool)

(declare-fun res!114279 () Bool)

(assert (=> b!137249 (=> (not res!114279) (not e!91187))))

(assert (=> b!137249 (= res!114279 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2817 (buf!3224 thiss!1634))) ((_ sign_extend 32) (currentByte!6031 thiss!1634)) ((_ sign_extend 32) (currentBit!6026 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!137250 () Bool)

(declare-fun e!91191 () Bool)

(assert (=> b!137250 (= e!91191 true)))

(declare-fun lt!213806 () (_ BitVec 64))

(assert (=> b!137250 (= lt!213806 (bitIndex!0 (size!2817 (buf!3224 (_2!6299 lt!213796))) (currentByte!6031 (_2!6299 lt!213796)) (currentBit!6026 (_2!6299 lt!213796))))))

(declare-fun lt!213810 () (_ BitVec 64))

(assert (=> b!137250 (= lt!213810 (bitIndex!0 (size!2817 (buf!3224 thiss!1634)) (currentByte!6031 thiss!1634) (currentBit!6026 thiss!1634)))))

(declare-fun b!137251 () Bool)

(assert (=> b!137251 (= e!91195 (= (_2!6298 lt!213812) (_2!6298 lt!213816)))))

(declare-fun b!137252 () Bool)

(declare-fun e!91194 () Bool)

(declare-fun e!91188 () Bool)

(assert (=> b!137252 (= e!91194 (not e!91188))))

(declare-fun res!114273 () Bool)

(assert (=> b!137252 (=> res!114273 e!91188)))

(declare-fun lt!213803 () tuple2!11946)

(declare-fun lt!213800 () tuple2!11948)

(assert (=> b!137252 (= res!114273 (or (not (= (size!2817 (_2!6296 lt!213803)) (size!2817 arr!237))) (not (= (_1!6296 lt!213803) (_2!6297 lt!213800)))))))

(assert (=> b!137252 (= lt!213803 (readByteArrayLoopPure!0 (_1!6297 lt!213800) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!213795 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137252 (validate_offset_bits!1 ((_ sign_extend 32) (size!2817 (buf!3224 (_2!6299 lt!213796)))) ((_ sign_extend 32) (currentByte!6031 (_2!6299 lt!213798))) ((_ sign_extend 32) (currentBit!6026 (_2!6299 lt!213798))) lt!213795)))

(declare-fun lt!213819 () Unit!8581)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4898 array!6223 (_ BitVec 64)) Unit!8581)

(assert (=> b!137252 (= lt!213819 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6299 lt!213798) (buf!3224 (_2!6299 lt!213796)) lt!213795))))

(assert (=> b!137252 (= lt!213800 (reader!0 (_2!6299 lt!213798) (_2!6299 lt!213796)))))

(declare-fun b!137253 () Bool)

(assert (=> b!137253 (= e!91192 e!91191)))

(declare-fun res!114271 () Bool)

(assert (=> b!137253 (=> res!114271 e!91191)))

(assert (=> b!137253 (= res!114271 (not (= (size!2817 (buf!3224 thiss!1634)) (size!2817 (buf!3224 (_2!6299 lt!213796))))))))

(assert (=> b!137253 (arrayRangesEq!220 arr!237 (_2!6296 lt!213805) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213811 () Unit!8581)

(declare-fun arrayRangesEqTransitive!22 (array!6223 array!6223 array!6223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8581)

(assert (=> b!137253 (= lt!213811 (arrayRangesEqTransitive!22 arr!237 (_2!6296 lt!213807) (_2!6296 lt!213805) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137253 (arrayRangesEq!220 (_2!6296 lt!213807) (_2!6296 lt!213805) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213815 () Unit!8581)

(declare-fun arrayRangesEqSymmetricLemma!33 (array!6223 array!6223 (_ BitVec 32) (_ BitVec 32)) Unit!8581)

(assert (=> b!137253 (= lt!213815 (arrayRangesEqSymmetricLemma!33 (_2!6296 lt!213805) (_2!6296 lt!213807) #b00000000000000000000000000000000 to!404))))

(declare-fun res!114275 () Bool)

(assert (=> start!26714 (=> (not res!114275) (not e!91187))))

(assert (=> start!26714 (= res!114275 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2817 arr!237))))))

(assert (=> start!26714 e!91187))

(assert (=> start!26714 true))

(declare-fun array_inv!2606 (array!6223) Bool)

(assert (=> start!26714 (array_inv!2606 arr!237)))

(declare-fun e!91186 () Bool)

(declare-fun inv!12 (BitStream!4898) Bool)

(assert (=> start!26714 (and (inv!12 thiss!1634) e!91186)))

(declare-fun b!137254 () Bool)

(assert (=> b!137254 (= e!91186 (array_inv!2606 (buf!3224 thiss!1634)))))

(declare-fun b!137255 () Bool)

(assert (=> b!137255 (= e!91197 e!91194)))

(declare-fun res!114281 () Bool)

(assert (=> b!137255 (=> (not res!114281) (not e!91194))))

(assert (=> b!137255 (= res!114281 (= (bitIndex!0 (size!2817 (buf!3224 (_2!6299 lt!213796))) (currentByte!6031 (_2!6299 lt!213796)) (currentBit!6026 (_2!6299 lt!213796))) (bvadd (bitIndex!0 (size!2817 (buf!3224 (_2!6299 lt!213798))) (currentByte!6031 (_2!6299 lt!213798)) (currentBit!6026 (_2!6299 lt!213798))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!213795))))))

(assert (=> b!137255 (= lt!213795 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!137256 () Bool)

(assert (=> b!137256 (= e!91188 (not (arrayRangesEq!220 arr!237 (_2!6296 lt!213803) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!137257 () Bool)

(declare-fun res!114270 () Bool)

(assert (=> b!137257 (=> (not res!114270) (not e!91187))))

(assert (=> b!137257 (= res!114270 (invariant!0 (currentBit!6026 thiss!1634) (currentByte!6031 thiss!1634) (size!2817 (buf!3224 thiss!1634))))))

(declare-fun b!137258 () Bool)

(declare-fun res!114276 () Bool)

(assert (=> b!137258 (=> (not res!114276) (not e!91193))))

(assert (=> b!137258 (= res!114276 (= (bitIndex!0 (size!2817 (buf!3224 (_2!6299 lt!213798))) (currentByte!6031 (_2!6299 lt!213798)) (currentBit!6026 (_2!6299 lt!213798))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2817 (buf!3224 thiss!1634)) (currentByte!6031 thiss!1634) (currentBit!6026 thiss!1634)))))))

(declare-fun b!137259 () Bool)

(declare-fun res!114274 () Bool)

(assert (=> b!137259 (=> (not res!114274) (not e!91194))))

(assert (=> b!137259 (= res!114274 (isPrefixOf!0 (_2!6299 lt!213798) (_2!6299 lt!213796)))))

(assert (= (and start!26714 res!114275) b!137249))

(assert (= (and b!137249 res!114279) b!137244))

(assert (= (and b!137244 res!114280) b!137257))

(assert (= (and b!137257 res!114270) b!137245))

(assert (= (and b!137245 res!114278) b!137258))

(assert (= (and b!137258 res!114276) b!137248))

(assert (= (and b!137248 res!114268) b!137246))

(assert (= (and b!137245 res!114272) b!137255))

(assert (= (and b!137255 res!114281) b!137259))

(assert (= (and b!137259 res!114274) b!137252))

(assert (= (and b!137252 (not res!114273)) b!137256))

(assert (= (and b!137245 res!114282) b!137247))

(assert (= (and b!137245 res!114277) b!137251))

(assert (= (and b!137245 (not res!114269)) b!137253))

(assert (= (and b!137253 (not res!114271)) b!137250))

(assert (= start!26714 b!137254))

(declare-fun m!210575 () Bool)

(assert (=> b!137258 m!210575))

(declare-fun m!210577 () Bool)

(assert (=> b!137258 m!210577))

(declare-fun m!210579 () Bool)

(assert (=> b!137249 m!210579))

(declare-fun m!210581 () Bool)

(assert (=> b!137253 m!210581))

(declare-fun m!210583 () Bool)

(assert (=> b!137253 m!210583))

(declare-fun m!210585 () Bool)

(assert (=> b!137253 m!210585))

(declare-fun m!210587 () Bool)

(assert (=> b!137253 m!210587))

(declare-fun m!210589 () Bool)

(assert (=> b!137248 m!210589))

(declare-fun m!210591 () Bool)

(assert (=> b!137250 m!210591))

(assert (=> b!137250 m!210577))

(assert (=> b!137255 m!210591))

(assert (=> b!137255 m!210575))

(declare-fun m!210593 () Bool)

(assert (=> start!26714 m!210593))

(declare-fun m!210595 () Bool)

(assert (=> start!26714 m!210595))

(declare-fun m!210597 () Bool)

(assert (=> b!137256 m!210597))

(declare-fun m!210599 () Bool)

(assert (=> b!137257 m!210599))

(declare-fun m!210601 () Bool)

(assert (=> b!137245 m!210601))

(declare-fun m!210603 () Bool)

(assert (=> b!137245 m!210603))

(declare-fun m!210605 () Bool)

(assert (=> b!137245 m!210605))

(declare-fun m!210607 () Bool)

(assert (=> b!137245 m!210607))

(declare-fun m!210609 () Bool)

(assert (=> b!137245 m!210609))

(declare-fun m!210611 () Bool)

(assert (=> b!137245 m!210611))

(declare-fun m!210613 () Bool)

(assert (=> b!137245 m!210613))

(declare-fun m!210615 () Bool)

(assert (=> b!137245 m!210615))

(declare-fun m!210617 () Bool)

(assert (=> b!137245 m!210617))

(declare-fun m!210619 () Bool)

(assert (=> b!137245 m!210619))

(declare-fun m!210621 () Bool)

(assert (=> b!137245 m!210621))

(declare-fun m!210623 () Bool)

(assert (=> b!137245 m!210623))

(declare-fun m!210625 () Bool)

(assert (=> b!137245 m!210625))

(declare-fun m!210627 () Bool)

(assert (=> b!137245 m!210627))

(declare-fun m!210629 () Bool)

(assert (=> b!137245 m!210629))

(declare-fun m!210631 () Bool)

(assert (=> b!137245 m!210631))

(declare-fun m!210633 () Bool)

(assert (=> b!137245 m!210633))

(declare-fun m!210635 () Bool)

(assert (=> b!137245 m!210635))

(declare-fun m!210637 () Bool)

(assert (=> b!137245 m!210637))

(declare-fun m!210639 () Bool)

(assert (=> b!137245 m!210639))

(declare-fun m!210641 () Bool)

(assert (=> b!137245 m!210641))

(declare-fun m!210643 () Bool)

(assert (=> b!137245 m!210643))

(declare-fun m!210645 () Bool)

(assert (=> b!137245 m!210645))

(declare-fun m!210647 () Bool)

(assert (=> b!137245 m!210647))

(declare-fun m!210649 () Bool)

(assert (=> b!137245 m!210649))

(declare-fun m!210651 () Bool)

(assert (=> b!137245 m!210651))

(declare-fun m!210653 () Bool)

(assert (=> b!137245 m!210653))

(assert (=> b!137245 m!210651))

(assert (=> b!137245 m!210617))

(declare-fun m!210655 () Bool)

(assert (=> b!137254 m!210655))

(declare-fun m!210657 () Bool)

(assert (=> b!137247 m!210657))

(declare-fun m!210659 () Bool)

(assert (=> b!137259 m!210659))

(assert (=> b!137246 m!210617))

(declare-fun m!210661 () Bool)

(assert (=> b!137246 m!210661))

(declare-fun m!210663 () Bool)

(assert (=> b!137246 m!210663))

(declare-fun m!210665 () Bool)

(assert (=> b!137252 m!210665))

(declare-fun m!210667 () Bool)

(assert (=> b!137252 m!210667))

(declare-fun m!210669 () Bool)

(assert (=> b!137252 m!210669))

(assert (=> b!137252 m!210643))

(push 1)

(assert (not start!26714))

(assert (not b!137249))

(assert (not b!137254))

(assert (not b!137248))

(assert (not b!137245))

(assert (not b!137252))

(assert (not b!137257))

(assert (not b!137247))

(assert (not b!137256))

(assert (not b!137246))

(assert (not b!137258))

(assert (not b!137259))

(assert (not b!137250))

(assert (not b!137255))

(assert (not b!137253))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

