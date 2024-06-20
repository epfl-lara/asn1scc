; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26354 () Bool)

(assert start!26354)

(declare-fun b!134841 () Bool)

(declare-fun res!112098 () Bool)

(declare-fun e!89477 () Bool)

(assert (=> b!134841 (=> (not res!112098) (not e!89477))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6154 0))(
  ( (array!6155 (arr!3450 (Array (_ BitVec 32) (_ BitVec 8))) (size!2785 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4834 0))(
  ( (BitStream!4835 (buf!3178 array!6154) (currentByte!5975 (_ BitVec 32)) (currentBit!5970 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4834)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134841 (= res!112098 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2785 (buf!3178 thiss!1634))) ((_ sign_extend 32) (currentByte!5975 thiss!1634)) ((_ sign_extend 32) (currentBit!5970 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134842 () Bool)

(declare-fun res!112088 () Bool)

(declare-fun e!89480 () Bool)

(assert (=> b!134842 (=> (not res!112088) (not e!89480))))

(declare-datatypes ((Unit!8408 0))(
  ( (Unit!8409) )
))
(declare-datatypes ((tuple2!11676 0))(
  ( (tuple2!11677 (_1!6154 Unit!8408) (_2!6154 BitStream!4834)) )
))
(declare-fun lt!209190 () tuple2!11676)

(declare-fun isPrefixOf!0 (BitStream!4834 BitStream!4834) Bool)

(assert (=> b!134842 (= res!112088 (isPrefixOf!0 thiss!1634 (_2!6154 lt!209190)))))

(declare-fun arr!237 () array!6154)

(declare-datatypes ((tuple2!11678 0))(
  ( (tuple2!11679 (_1!6155 BitStream!4834) (_2!6155 (_ BitVec 8))) )
))
(declare-fun lt!209208 () tuple2!11678)

(declare-fun b!134843 () Bool)

(declare-datatypes ((tuple2!11680 0))(
  ( (tuple2!11681 (_1!6156 BitStream!4834) (_2!6156 BitStream!4834)) )
))
(declare-fun lt!209202 () tuple2!11680)

(assert (=> b!134843 (= e!89480 (and (= (_2!6155 lt!209208) (select (arr!3450 arr!237) from!447)) (= (_1!6155 lt!209208) (_2!6156 lt!209202))))))

(declare-fun readBytePure!0 (BitStream!4834) tuple2!11678)

(assert (=> b!134843 (= lt!209208 (readBytePure!0 (_1!6156 lt!209202)))))

(declare-fun reader!0 (BitStream!4834 BitStream!4834) tuple2!11680)

(assert (=> b!134843 (= lt!209202 (reader!0 thiss!1634 (_2!6154 lt!209190)))))

(declare-fun b!134844 () Bool)

(declare-fun e!89482 () Bool)

(declare-fun e!89481 () Bool)

(assert (=> b!134844 (= e!89482 e!89481)))

(declare-fun res!112086 () Bool)

(assert (=> b!134844 (=> (not res!112086) (not e!89481))))

(declare-fun lt!209196 () tuple2!11676)

(declare-fun lt!209205 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134844 (= res!112086 (= (bitIndex!0 (size!2785 (buf!3178 (_2!6154 lt!209196))) (currentByte!5975 (_2!6154 lt!209196)) (currentBit!5970 (_2!6154 lt!209196))) (bvadd (bitIndex!0 (size!2785 (buf!3178 (_2!6154 lt!209190))) (currentByte!5975 (_2!6154 lt!209190)) (currentBit!5970 (_2!6154 lt!209190))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209205))))))

(assert (=> b!134844 (= lt!209205 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134846 () Bool)

(declare-fun res!112089 () Bool)

(assert (=> b!134846 (=> (not res!112089) (not e!89477))))

(assert (=> b!134846 (= res!112089 (bvslt from!447 to!404))))

(declare-fun b!134847 () Bool)

(declare-datatypes ((tuple2!11682 0))(
  ( (tuple2!11683 (_1!6157 BitStream!4834) (_2!6157 array!6154)) )
))
(declare-fun lt!209210 () tuple2!11682)

(declare-fun e!89479 () Bool)

(declare-fun arrayRangesEq!188 (array!6154 array!6154 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134847 (= e!89479 (not (arrayRangesEq!188 arr!237 (_2!6157 lt!209210) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134848 () Bool)

(declare-fun res!112085 () Bool)

(assert (=> b!134848 (=> (not res!112085) (not e!89480))))

(assert (=> b!134848 (= res!112085 (= (bitIndex!0 (size!2785 (buf!3178 (_2!6154 lt!209190))) (currentByte!5975 (_2!6154 lt!209190)) (currentBit!5970 (_2!6154 lt!209190))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2785 (buf!3178 thiss!1634)) (currentByte!5975 thiss!1634) (currentBit!5970 thiss!1634)))))))

(declare-fun b!134849 () Bool)

(declare-fun e!89478 () Bool)

(declare-fun lt!209213 () tuple2!11678)

(declare-fun lt!209197 () tuple2!11678)

(assert (=> b!134849 (= e!89478 (= (_2!6155 lt!209213) (_2!6155 lt!209197)))))

(declare-fun b!134850 () Bool)

(declare-fun res!112093 () Bool)

(assert (=> b!134850 (=> (not res!112093) (not e!89481))))

(assert (=> b!134850 (= res!112093 (isPrefixOf!0 (_2!6154 lt!209190) (_2!6154 lt!209196)))))

(declare-fun b!134851 () Bool)

(declare-fun e!89484 () Bool)

(assert (=> b!134851 (= e!89484 true)))

(declare-fun lt!209200 () tuple2!11682)

(declare-fun lt!209198 () tuple2!11682)

(assert (=> b!134851 (arrayRangesEq!188 (_2!6157 lt!209200) (_2!6157 lt!209198) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209203 () Unit!8408)

(declare-fun arrayRangesEqSymmetricLemma!1 (array!6154 array!6154 (_ BitVec 32) (_ BitVec 32)) Unit!8408)

(assert (=> b!134851 (= lt!209203 (arrayRangesEqSymmetricLemma!1 (_2!6157 lt!209198) (_2!6157 lt!209200) #b00000000000000000000000000000000 to!404))))

(declare-fun res!112091 () Bool)

(assert (=> start!26354 (=> (not res!112091) (not e!89477))))

(assert (=> start!26354 (= res!112091 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2785 arr!237))))))

(assert (=> start!26354 e!89477))

(assert (=> start!26354 true))

(declare-fun array_inv!2574 (array!6154) Bool)

(assert (=> start!26354 (array_inv!2574 arr!237)))

(declare-fun e!89475 () Bool)

(declare-fun inv!12 (BitStream!4834) Bool)

(assert (=> start!26354 (and (inv!12 thiss!1634) e!89475)))

(declare-fun b!134845 () Bool)

(assert (=> b!134845 (= e!89477 (not e!89484))))

(declare-fun res!112096 () Bool)

(assert (=> b!134845 (=> res!112096 e!89484)))

(assert (=> b!134845 (= res!112096 (not (arrayRangesEq!188 (_2!6157 lt!209198) (_2!6157 lt!209200) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209193 () tuple2!11682)

(assert (=> b!134845 (arrayRangesEq!188 (_2!6157 lt!209198) (_2!6157 lt!209193) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209201 () Unit!8408)

(declare-fun lt!209199 () tuple2!11680)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4834 array!6154 (_ BitVec 32) (_ BitVec 32)) Unit!8408)

(assert (=> b!134845 (= lt!209201 (readByteArrayLoopArrayPrefixLemma!0 (_1!6156 lt!209199) arr!237 from!447 to!404))))

(declare-fun lt!209192 () array!6154)

(declare-fun readByteArrayLoopPure!0 (BitStream!4834 array!6154 (_ BitVec 32) (_ BitVec 32)) tuple2!11682)

(declare-fun withMovedByteIndex!0 (BitStream!4834 (_ BitVec 32)) BitStream!4834)

(assert (=> b!134845 (= lt!209193 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6156 lt!209199) #b00000000000000000000000000000001) lt!209192 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209207 () tuple2!11680)

(assert (=> b!134845 (= lt!209200 (readByteArrayLoopPure!0 (_1!6156 lt!209207) lt!209192 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209209 () tuple2!11678)

(assert (=> b!134845 (= lt!209192 (array!6155 (store (arr!3450 arr!237) from!447 (_2!6155 lt!209209)) (size!2785 arr!237)))))

(declare-fun lt!209214 () (_ BitVec 32))

(assert (=> b!134845 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2785 (buf!3178 (_2!6154 lt!209196)))) ((_ sign_extend 32) (currentByte!5975 (_2!6154 lt!209190))) ((_ sign_extend 32) (currentBit!5970 (_2!6154 lt!209190))) lt!209214)))

(declare-fun lt!209204 () Unit!8408)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4834 array!6154 (_ BitVec 32)) Unit!8408)

(assert (=> b!134845 (= lt!209204 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6154 lt!209190) (buf!3178 (_2!6154 lt!209196)) lt!209214))))

(assert (=> b!134845 (= (_1!6157 lt!209198) (_2!6156 lt!209199))))

(assert (=> b!134845 (= lt!209198 (readByteArrayLoopPure!0 (_1!6156 lt!209199) arr!237 from!447 to!404))))

(assert (=> b!134845 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2785 (buf!3178 (_2!6154 lt!209196)))) ((_ sign_extend 32) (currentByte!5975 thiss!1634)) ((_ sign_extend 32) (currentBit!5970 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209194 () Unit!8408)

(assert (=> b!134845 (= lt!209194 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3178 (_2!6154 lt!209196)) (bvsub to!404 from!447)))))

(assert (=> b!134845 (= (_2!6155 lt!209209) (select (arr!3450 arr!237) from!447))))

(assert (=> b!134845 (= lt!209209 (readBytePure!0 (_1!6156 lt!209199)))))

(assert (=> b!134845 (= lt!209207 (reader!0 (_2!6154 lt!209190) (_2!6154 lt!209196)))))

(assert (=> b!134845 (= lt!209199 (reader!0 thiss!1634 (_2!6154 lt!209196)))))

(assert (=> b!134845 e!89478))

(declare-fun res!112097 () Bool)

(assert (=> b!134845 (=> (not res!112097) (not e!89478))))

(assert (=> b!134845 (= res!112097 (= (bitIndex!0 (size!2785 (buf!3178 (_1!6155 lt!209213))) (currentByte!5975 (_1!6155 lt!209213)) (currentBit!5970 (_1!6155 lt!209213))) (bitIndex!0 (size!2785 (buf!3178 (_1!6155 lt!209197))) (currentByte!5975 (_1!6155 lt!209197)) (currentBit!5970 (_1!6155 lt!209197)))))))

(declare-fun lt!209212 () Unit!8408)

(declare-fun lt!209206 () BitStream!4834)

(declare-fun readBytePrefixLemma!0 (BitStream!4834 BitStream!4834) Unit!8408)

(assert (=> b!134845 (= lt!209212 (readBytePrefixLemma!0 lt!209206 (_2!6154 lt!209196)))))

(assert (=> b!134845 (= lt!209197 (readBytePure!0 (BitStream!4835 (buf!3178 (_2!6154 lt!209196)) (currentByte!5975 thiss!1634) (currentBit!5970 thiss!1634))))))

(assert (=> b!134845 (= lt!209213 (readBytePure!0 lt!209206))))

(assert (=> b!134845 (= lt!209206 (BitStream!4835 (buf!3178 (_2!6154 lt!209190)) (currentByte!5975 thiss!1634) (currentBit!5970 thiss!1634)))))

(declare-fun e!89483 () Bool)

(assert (=> b!134845 e!89483))

(declare-fun res!112092 () Bool)

(assert (=> b!134845 (=> (not res!112092) (not e!89483))))

(assert (=> b!134845 (= res!112092 (isPrefixOf!0 thiss!1634 (_2!6154 lt!209196)))))

(declare-fun lt!209195 () Unit!8408)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4834 BitStream!4834 BitStream!4834) Unit!8408)

(assert (=> b!134845 (= lt!209195 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6154 lt!209190) (_2!6154 lt!209196)))))

(assert (=> b!134845 e!89482))

(declare-fun res!112090 () Bool)

(assert (=> b!134845 (=> (not res!112090) (not e!89482))))

(assert (=> b!134845 (= res!112090 (= (size!2785 (buf!3178 (_2!6154 lt!209190))) (size!2785 (buf!3178 (_2!6154 lt!209196)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4834 array!6154 (_ BitVec 32) (_ BitVec 32)) tuple2!11676)

(assert (=> b!134845 (= lt!209196 (appendByteArrayLoop!0 (_2!6154 lt!209190) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134845 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2785 (buf!3178 (_2!6154 lt!209190)))) ((_ sign_extend 32) (currentByte!5975 (_2!6154 lt!209190))) ((_ sign_extend 32) (currentBit!5970 (_2!6154 lt!209190))) lt!209214)))

(assert (=> b!134845 (= lt!209214 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209211 () Unit!8408)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4834 BitStream!4834 (_ BitVec 64) (_ BitVec 32)) Unit!8408)

(assert (=> b!134845 (= lt!209211 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6154 lt!209190) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!134845 e!89480))

(declare-fun res!112087 () Bool)

(assert (=> b!134845 (=> (not res!112087) (not e!89480))))

(assert (=> b!134845 (= res!112087 (= (size!2785 (buf!3178 thiss!1634)) (size!2785 (buf!3178 (_2!6154 lt!209190)))))))

(declare-fun appendByte!0 (BitStream!4834 (_ BitVec 8)) tuple2!11676)

(assert (=> b!134845 (= lt!209190 (appendByte!0 thiss!1634 (select (arr!3450 arr!237) from!447)))))

(declare-fun b!134852 () Bool)

(assert (=> b!134852 (= e!89475 (array_inv!2574 (buf!3178 thiss!1634)))))

(declare-fun b!134853 () Bool)

(declare-fun res!112094 () Bool)

(assert (=> b!134853 (=> (not res!112094) (not e!89477))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134853 (= res!112094 (invariant!0 (currentBit!5970 thiss!1634) (currentByte!5975 thiss!1634) (size!2785 (buf!3178 thiss!1634))))))

(declare-fun b!134854 () Bool)

(assert (=> b!134854 (= e!89483 (invariant!0 (currentBit!5970 thiss!1634) (currentByte!5975 thiss!1634) (size!2785 (buf!3178 (_2!6154 lt!209190)))))))

(declare-fun b!134855 () Bool)

(assert (=> b!134855 (= e!89481 (not e!89479))))

(declare-fun res!112095 () Bool)

(assert (=> b!134855 (=> res!112095 e!89479)))

(declare-fun lt!209215 () tuple2!11680)

(assert (=> b!134855 (= res!112095 (or (not (= (size!2785 (_2!6157 lt!209210)) (size!2785 arr!237))) (not (= (_1!6157 lt!209210) (_2!6156 lt!209215)))))))

(assert (=> b!134855 (= lt!209210 (readByteArrayLoopPure!0 (_1!6156 lt!209215) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134855 (validate_offset_bits!1 ((_ sign_extend 32) (size!2785 (buf!3178 (_2!6154 lt!209196)))) ((_ sign_extend 32) (currentByte!5975 (_2!6154 lt!209190))) ((_ sign_extend 32) (currentBit!5970 (_2!6154 lt!209190))) lt!209205)))

(declare-fun lt!209191 () Unit!8408)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4834 array!6154 (_ BitVec 64)) Unit!8408)

(assert (=> b!134855 (= lt!209191 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6154 lt!209190) (buf!3178 (_2!6154 lt!209196)) lt!209205))))

(assert (=> b!134855 (= lt!209215 (reader!0 (_2!6154 lt!209190) (_2!6154 lt!209196)))))

(assert (= (and start!26354 res!112091) b!134841))

(assert (= (and b!134841 res!112098) b!134846))

(assert (= (and b!134846 res!112089) b!134853))

(assert (= (and b!134853 res!112094) b!134845))

(assert (= (and b!134845 res!112087) b!134848))

(assert (= (and b!134848 res!112085) b!134842))

(assert (= (and b!134842 res!112088) b!134843))

(assert (= (and b!134845 res!112090) b!134844))

(assert (= (and b!134844 res!112086) b!134850))

(assert (= (and b!134850 res!112093) b!134855))

(assert (= (and b!134855 (not res!112095)) b!134847))

(assert (= (and b!134845 res!112092) b!134854))

(assert (= (and b!134845 res!112097) b!134849))

(assert (= (and b!134845 (not res!112096)) b!134851))

(assert (= start!26354 b!134852))

(declare-fun m!205399 () Bool)

(assert (=> b!134841 m!205399))

(declare-fun m!205401 () Bool)

(assert (=> b!134847 m!205401))

(declare-fun m!205403 () Bool)

(assert (=> b!134855 m!205403))

(declare-fun m!205405 () Bool)

(assert (=> b!134855 m!205405))

(declare-fun m!205407 () Bool)

(assert (=> b!134855 m!205407))

(declare-fun m!205409 () Bool)

(assert (=> b!134855 m!205409))

(declare-fun m!205411 () Bool)

(assert (=> b!134850 m!205411))

(declare-fun m!205413 () Bool)

(assert (=> b!134842 m!205413))

(declare-fun m!205415 () Bool)

(assert (=> b!134845 m!205415))

(declare-fun m!205417 () Bool)

(assert (=> b!134845 m!205417))

(declare-fun m!205419 () Bool)

(assert (=> b!134845 m!205419))

(declare-fun m!205421 () Bool)

(assert (=> b!134845 m!205421))

(declare-fun m!205423 () Bool)

(assert (=> b!134845 m!205423))

(declare-fun m!205425 () Bool)

(assert (=> b!134845 m!205425))

(assert (=> b!134845 m!205409))

(declare-fun m!205427 () Bool)

(assert (=> b!134845 m!205427))

(declare-fun m!205429 () Bool)

(assert (=> b!134845 m!205429))

(declare-fun m!205431 () Bool)

(assert (=> b!134845 m!205431))

(declare-fun m!205433 () Bool)

(assert (=> b!134845 m!205433))

(declare-fun m!205435 () Bool)

(assert (=> b!134845 m!205435))

(declare-fun m!205437 () Bool)

(assert (=> b!134845 m!205437))

(declare-fun m!205439 () Bool)

(assert (=> b!134845 m!205439))

(declare-fun m!205441 () Bool)

(assert (=> b!134845 m!205441))

(declare-fun m!205443 () Bool)

(assert (=> b!134845 m!205443))

(declare-fun m!205445 () Bool)

(assert (=> b!134845 m!205445))

(declare-fun m!205447 () Bool)

(assert (=> b!134845 m!205447))

(declare-fun m!205449 () Bool)

(assert (=> b!134845 m!205449))

(declare-fun m!205451 () Bool)

(assert (=> b!134845 m!205451))

(declare-fun m!205453 () Bool)

(assert (=> b!134845 m!205453))

(declare-fun m!205455 () Bool)

(assert (=> b!134845 m!205455))

(declare-fun m!205457 () Bool)

(assert (=> b!134845 m!205457))

(declare-fun m!205459 () Bool)

(assert (=> b!134845 m!205459))

(declare-fun m!205461 () Bool)

(assert (=> b!134845 m!205461))

(declare-fun m!205463 () Bool)

(assert (=> b!134845 m!205463))

(assert (=> b!134845 m!205423))

(declare-fun m!205465 () Bool)

(assert (=> b!134845 m!205465))

(assert (=> b!134845 m!205429))

(declare-fun m!205467 () Bool)

(assert (=> b!134851 m!205467))

(declare-fun m!205469 () Bool)

(assert (=> b!134851 m!205469))

(declare-fun m!205471 () Bool)

(assert (=> b!134854 m!205471))

(declare-fun m!205473 () Bool)

(assert (=> b!134844 m!205473))

(declare-fun m!205475 () Bool)

(assert (=> b!134844 m!205475))

(declare-fun m!205477 () Bool)

(assert (=> start!26354 m!205477))

(declare-fun m!205479 () Bool)

(assert (=> start!26354 m!205479))

(declare-fun m!205481 () Bool)

(assert (=> b!134853 m!205481))

(declare-fun m!205483 () Bool)

(assert (=> b!134852 m!205483))

(assert (=> b!134848 m!205475))

(declare-fun m!205485 () Bool)

(assert (=> b!134848 m!205485))

(assert (=> b!134843 m!205429))

(declare-fun m!205487 () Bool)

(assert (=> b!134843 m!205487))

(declare-fun m!205489 () Bool)

(assert (=> b!134843 m!205489))

(push 1)

(assert (not b!134841))

(assert (not b!134855))

(assert (not b!134848))

(assert (not b!134843))

(assert (not b!134844))

(assert (not b!134850))

(assert (not b!134851))

(assert (not b!134847))

(assert (not b!134853))

(assert (not start!26354))

(assert (not b!134852))

(assert (not b!134845))

(assert (not b!134854))

(assert (not b!134842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

