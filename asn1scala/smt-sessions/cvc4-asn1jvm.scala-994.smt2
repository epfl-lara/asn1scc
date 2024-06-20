; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27990 () Bool)

(assert start!27990)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!96344 () Bool)

(declare-fun b!144575 () Bool)

(declare-datatypes ((array!6582 0))(
  ( (array!6583 (arr!3712 (Array (_ BitVec 32) (_ BitVec 8))) (size!2979 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5216 0))(
  ( (BitStream!5217 (buf!3418 array!6582) (currentByte!6308 (_ BitVec 32)) (currentBit!6303 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12874 0))(
  ( (tuple2!12875 (_1!6783 BitStream!5216) (_2!6783 array!6582)) )
))
(declare-fun lt!224215 () tuple2!12874)

(declare-fun arr!237 () array!6582)

(declare-fun arrayRangesEq!295 (array!6582 array!6582 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144575 (= e!96344 (not (arrayRangesEq!295 arr!237 (_2!6783 lt!224215) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144576 () Bool)

(declare-fun res!120808 () Bool)

(declare-fun e!96340 () Bool)

(assert (=> b!144576 (=> (not res!120808) (not e!96340))))

(declare-fun thiss!1634 () BitStream!5216)

(declare-datatypes ((Unit!9031 0))(
  ( (Unit!9032) )
))
(declare-datatypes ((tuple2!12876 0))(
  ( (tuple2!12877 (_1!6784 Unit!9031) (_2!6784 BitStream!5216)) )
))
(declare-fun lt!224216 () tuple2!12876)

(declare-fun isPrefixOf!0 (BitStream!5216 BitStream!5216) Bool)

(assert (=> b!144576 (= res!120808 (isPrefixOf!0 thiss!1634 (_2!6784 lt!224216)))))

(declare-fun b!144577 () Bool)

(declare-fun e!96345 () Bool)

(declare-fun array_inv!2768 (array!6582) Bool)

(assert (=> b!144577 (= e!96345 (array_inv!2768 (buf!3418 thiss!1634)))))

(declare-fun b!144578 () Bool)

(declare-fun res!120807 () Bool)

(assert (=> b!144578 (=> (not res!120807) (not e!96340))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144578 (= res!120807 (= (bitIndex!0 (size!2979 (buf!3418 (_2!6784 lt!224216))) (currentByte!6308 (_2!6784 lt!224216)) (currentBit!6303 (_2!6784 lt!224216))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2979 (buf!3418 thiss!1634)) (currentByte!6308 thiss!1634) (currentBit!6303 thiss!1634)))))))

(declare-fun b!144579 () Bool)

(declare-fun res!120813 () Bool)

(declare-fun e!96348 () Bool)

(assert (=> b!144579 (=> (not res!120813) (not e!96348))))

(declare-fun lt!224202 () tuple2!12876)

(assert (=> b!144579 (= res!120813 (isPrefixOf!0 (_2!6784 lt!224216) (_2!6784 lt!224202)))))

(declare-fun b!144580 () Bool)

(declare-fun res!120818 () Bool)

(declare-fun e!96347 () Bool)

(assert (=> b!144580 (=> (not res!120818) (not e!96347))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144580 (= res!120818 (invariant!0 (currentBit!6303 thiss!1634) (currentByte!6308 thiss!1634) (size!2979 (buf!3418 thiss!1634))))))

(declare-fun b!144581 () Bool)

(declare-fun res!120817 () Bool)

(assert (=> b!144581 (=> (not res!120817) (not e!96347))))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!144581 (= res!120817 (bvslt from!447 to!404))))

(declare-fun res!120814 () Bool)

(assert (=> start!27990 (=> (not res!120814) (not e!96347))))

(assert (=> start!27990 (= res!120814 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2979 arr!237))))))

(assert (=> start!27990 e!96347))

(assert (=> start!27990 true))

(assert (=> start!27990 (array_inv!2768 arr!237)))

(declare-fun inv!12 (BitStream!5216) Bool)

(assert (=> start!27990 (and (inv!12 thiss!1634) e!96345)))

(declare-fun b!144582 () Bool)

(assert (=> b!144582 (= e!96348 (not e!96344))))

(declare-fun res!120811 () Bool)

(assert (=> b!144582 (=> res!120811 e!96344)))

(declare-datatypes ((tuple2!12878 0))(
  ( (tuple2!12879 (_1!6785 BitStream!5216) (_2!6785 BitStream!5216)) )
))
(declare-fun lt!224207 () tuple2!12878)

(assert (=> b!144582 (= res!120811 (or (not (= (size!2979 (_2!6783 lt!224215)) (size!2979 arr!237))) (not (= (_1!6783 lt!224215) (_2!6785 lt!224207)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5216 array!6582 (_ BitVec 32) (_ BitVec 32)) tuple2!12874)

(assert (=> b!144582 (= lt!224215 (readByteArrayLoopPure!0 (_1!6785 lt!224207) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224200 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144582 (validate_offset_bits!1 ((_ sign_extend 32) (size!2979 (buf!3418 (_2!6784 lt!224202)))) ((_ sign_extend 32) (currentByte!6308 (_2!6784 lt!224216))) ((_ sign_extend 32) (currentBit!6303 (_2!6784 lt!224216))) lt!224200)))

(declare-fun lt!224203 () Unit!9031)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5216 array!6582 (_ BitVec 64)) Unit!9031)

(assert (=> b!144582 (= lt!224203 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6784 lt!224216) (buf!3418 (_2!6784 lt!224202)) lt!224200))))

(declare-fun reader!0 (BitStream!5216 BitStream!5216) tuple2!12878)

(assert (=> b!144582 (= lt!224207 (reader!0 (_2!6784 lt!224216) (_2!6784 lt!224202)))))

(declare-fun b!144583 () Bool)

(declare-fun e!96342 () Bool)

(assert (=> b!144583 (= e!96342 e!96348)))

(declare-fun res!120812 () Bool)

(assert (=> b!144583 (=> (not res!120812) (not e!96348))))

(assert (=> b!144583 (= res!120812 (= (bitIndex!0 (size!2979 (buf!3418 (_2!6784 lt!224202))) (currentByte!6308 (_2!6784 lt!224202)) (currentBit!6303 (_2!6784 lt!224202))) (bvadd (bitIndex!0 (size!2979 (buf!3418 (_2!6784 lt!224216))) (currentByte!6308 (_2!6784 lt!224216)) (currentBit!6303 (_2!6784 lt!224216))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224200))))))

(assert (=> b!144583 (= lt!224200 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144584 () Bool)

(declare-fun lt!224212 () tuple2!12878)

(declare-datatypes ((tuple2!12880 0))(
  ( (tuple2!12881 (_1!6786 BitStream!5216) (_2!6786 (_ BitVec 8))) )
))
(declare-fun lt!224208 () tuple2!12880)

(assert (=> b!144584 (= e!96340 (and (= (_2!6786 lt!224208) (select (arr!3712 arr!237) from!447)) (= (_1!6786 lt!224208) (_2!6785 lt!224212))))))

(declare-fun readBytePure!0 (BitStream!5216) tuple2!12880)

(assert (=> b!144584 (= lt!224208 (readBytePure!0 (_1!6785 lt!224212)))))

(assert (=> b!144584 (= lt!224212 (reader!0 thiss!1634 (_2!6784 lt!224216)))))

(declare-fun b!144585 () Bool)

(declare-fun e!96341 () Bool)

(declare-fun lt!224201 () tuple2!12880)

(declare-fun lt!224205 () tuple2!12880)

(assert (=> b!144585 (= e!96341 (= (_2!6786 lt!224201) (_2!6786 lt!224205)))))

(declare-fun b!144586 () Bool)

(declare-fun lt!224213 () tuple2!12878)

(declare-fun e!96339 () Bool)

(assert (=> b!144586 (= e!96339 (= (_1!6783 (readByteArrayLoopPure!0 (_1!6785 lt!224213) arr!237 from!447 to!404)) (_2!6785 lt!224213)))))

(declare-fun b!144587 () Bool)

(declare-fun e!96343 () Bool)

(assert (=> b!144587 (= e!96343 (invariant!0 (currentBit!6303 thiss!1634) (currentByte!6308 thiss!1634) (size!2979 (buf!3418 (_2!6784 lt!224216)))))))

(declare-fun b!144588 () Bool)

(declare-fun lt!224209 () (_ BitVec 32))

(declare-fun lt!224214 () (_ BitVec 32))

(assert (=> b!144588 (= e!96347 (not (or (= lt!224209 #b00000000000000000000000000000000) (= lt!224209 (bvand lt!224214 #b10000000000000000000000000000000)))))))

(assert (=> b!144588 (= lt!224209 (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))

(assert (=> b!144588 e!96339))

(declare-fun res!120816 () Bool)

(assert (=> b!144588 (=> (not res!120816) (not e!96339))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144588 (= res!120816 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2979 (buf!3418 (_2!6784 lt!224202)))) ((_ sign_extend 32) (currentByte!6308 thiss!1634)) ((_ sign_extend 32) (currentBit!6303 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224204 () Unit!9031)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5216 array!6582 (_ BitVec 32)) Unit!9031)

(assert (=> b!144588 (= lt!224204 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3418 (_2!6784 lt!224202)) (bvsub to!404 from!447)))))

(assert (=> b!144588 (= (_2!6786 (readBytePure!0 (_1!6785 lt!224213))) (select (arr!3712 arr!237) from!447))))

(declare-fun lt!224210 () tuple2!12878)

(assert (=> b!144588 (= lt!224210 (reader!0 (_2!6784 lt!224216) (_2!6784 lt!224202)))))

(assert (=> b!144588 (= lt!224213 (reader!0 thiss!1634 (_2!6784 lt!224202)))))

(assert (=> b!144588 e!96341))

(declare-fun res!120815 () Bool)

(assert (=> b!144588 (=> (not res!120815) (not e!96341))))

(assert (=> b!144588 (= res!120815 (= (bitIndex!0 (size!2979 (buf!3418 (_1!6786 lt!224201))) (currentByte!6308 (_1!6786 lt!224201)) (currentBit!6303 (_1!6786 lt!224201))) (bitIndex!0 (size!2979 (buf!3418 (_1!6786 lt!224205))) (currentByte!6308 (_1!6786 lt!224205)) (currentBit!6303 (_1!6786 lt!224205)))))))

(declare-fun lt!224211 () Unit!9031)

(declare-fun lt!224206 () BitStream!5216)

(declare-fun readBytePrefixLemma!0 (BitStream!5216 BitStream!5216) Unit!9031)

(assert (=> b!144588 (= lt!224211 (readBytePrefixLemma!0 lt!224206 (_2!6784 lt!224202)))))

(assert (=> b!144588 (= lt!224205 (readBytePure!0 (BitStream!5217 (buf!3418 (_2!6784 lt!224202)) (currentByte!6308 thiss!1634) (currentBit!6303 thiss!1634))))))

(assert (=> b!144588 (= lt!224201 (readBytePure!0 lt!224206))))

(assert (=> b!144588 (= lt!224206 (BitStream!5217 (buf!3418 (_2!6784 lt!224216)) (currentByte!6308 thiss!1634) (currentBit!6303 thiss!1634)))))

(assert (=> b!144588 e!96343))

(declare-fun res!120819 () Bool)

(assert (=> b!144588 (=> (not res!120819) (not e!96343))))

(assert (=> b!144588 (= res!120819 (isPrefixOf!0 thiss!1634 (_2!6784 lt!224202)))))

(declare-fun lt!224217 () Unit!9031)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5216 BitStream!5216 BitStream!5216) Unit!9031)

(assert (=> b!144588 (= lt!224217 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6784 lt!224216) (_2!6784 lt!224202)))))

(assert (=> b!144588 e!96342))

(declare-fun res!120810 () Bool)

(assert (=> b!144588 (=> (not res!120810) (not e!96342))))

(assert (=> b!144588 (= res!120810 (= (size!2979 (buf!3418 (_2!6784 lt!224216))) (size!2979 (buf!3418 (_2!6784 lt!224202)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5216 array!6582 (_ BitVec 32) (_ BitVec 32)) tuple2!12876)

(assert (=> b!144588 (= lt!224202 (appendByteArrayLoop!0 (_2!6784 lt!224216) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144588 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2979 (buf!3418 (_2!6784 lt!224216)))) ((_ sign_extend 32) (currentByte!6308 (_2!6784 lt!224216))) ((_ sign_extend 32) (currentBit!6303 (_2!6784 lt!224216))) lt!224214)))

(assert (=> b!144588 (= lt!224214 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224199 () Unit!9031)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5216 BitStream!5216 (_ BitVec 64) (_ BitVec 32)) Unit!9031)

(assert (=> b!144588 (= lt!224199 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6784 lt!224216) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144588 e!96340))

(declare-fun res!120820 () Bool)

(assert (=> b!144588 (=> (not res!120820) (not e!96340))))

(assert (=> b!144588 (= res!120820 (= (size!2979 (buf!3418 thiss!1634)) (size!2979 (buf!3418 (_2!6784 lt!224216)))))))

(declare-fun appendByte!0 (BitStream!5216 (_ BitVec 8)) tuple2!12876)

(assert (=> b!144588 (= lt!224216 (appendByte!0 thiss!1634 (select (arr!3712 arr!237) from!447)))))

(declare-fun b!144589 () Bool)

(declare-fun res!120809 () Bool)

(assert (=> b!144589 (=> (not res!120809) (not e!96347))))

(assert (=> b!144589 (= res!120809 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2979 (buf!3418 thiss!1634))) ((_ sign_extend 32) (currentByte!6308 thiss!1634)) ((_ sign_extend 32) (currentBit!6303 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27990 res!120814) b!144589))

(assert (= (and b!144589 res!120809) b!144581))

(assert (= (and b!144581 res!120817) b!144580))

(assert (= (and b!144580 res!120818) b!144588))

(assert (= (and b!144588 res!120820) b!144578))

(assert (= (and b!144578 res!120807) b!144576))

(assert (= (and b!144576 res!120808) b!144584))

(assert (= (and b!144588 res!120810) b!144583))

(assert (= (and b!144583 res!120812) b!144579))

(assert (= (and b!144579 res!120813) b!144582))

(assert (= (and b!144582 (not res!120811)) b!144575))

(assert (= (and b!144588 res!120819) b!144587))

(assert (= (and b!144588 res!120815) b!144585))

(assert (= (and b!144588 res!120816) b!144586))

(assert (= start!27990 b!144577))

(declare-fun m!222361 () Bool)

(assert (=> start!27990 m!222361))

(declare-fun m!222363 () Bool)

(assert (=> start!27990 m!222363))

(declare-fun m!222365 () Bool)

(assert (=> b!144579 m!222365))

(declare-fun m!222367 () Bool)

(assert (=> b!144588 m!222367))

(declare-fun m!222369 () Bool)

(assert (=> b!144588 m!222369))

(declare-fun m!222371 () Bool)

(assert (=> b!144588 m!222371))

(declare-fun m!222373 () Bool)

(assert (=> b!144588 m!222373))

(declare-fun m!222375 () Bool)

(assert (=> b!144588 m!222375))

(declare-fun m!222377 () Bool)

(assert (=> b!144588 m!222377))

(declare-fun m!222379 () Bool)

(assert (=> b!144588 m!222379))

(declare-fun m!222381 () Bool)

(assert (=> b!144588 m!222381))

(declare-fun m!222383 () Bool)

(assert (=> b!144588 m!222383))

(assert (=> b!144588 m!222381))

(declare-fun m!222385 () Bool)

(assert (=> b!144588 m!222385))

(declare-fun m!222387 () Bool)

(assert (=> b!144588 m!222387))

(declare-fun m!222389 () Bool)

(assert (=> b!144588 m!222389))

(declare-fun m!222391 () Bool)

(assert (=> b!144588 m!222391))

(declare-fun m!222393 () Bool)

(assert (=> b!144588 m!222393))

(declare-fun m!222395 () Bool)

(assert (=> b!144588 m!222395))

(declare-fun m!222397 () Bool)

(assert (=> b!144588 m!222397))

(declare-fun m!222399 () Bool)

(assert (=> b!144588 m!222399))

(declare-fun m!222401 () Bool)

(assert (=> b!144582 m!222401))

(declare-fun m!222403 () Bool)

(assert (=> b!144582 m!222403))

(declare-fun m!222405 () Bool)

(assert (=> b!144582 m!222405))

(assert (=> b!144582 m!222375))

(declare-fun m!222407 () Bool)

(assert (=> b!144576 m!222407))

(declare-fun m!222409 () Bool)

(assert (=> b!144577 m!222409))

(declare-fun m!222411 () Bool)

(assert (=> b!144586 m!222411))

(declare-fun m!222413 () Bool)

(assert (=> b!144587 m!222413))

(declare-fun m!222415 () Bool)

(assert (=> b!144578 m!222415))

(declare-fun m!222417 () Bool)

(assert (=> b!144578 m!222417))

(declare-fun m!222419 () Bool)

(assert (=> b!144575 m!222419))

(declare-fun m!222421 () Bool)

(assert (=> b!144589 m!222421))

(declare-fun m!222423 () Bool)

(assert (=> b!144580 m!222423))

(declare-fun m!222425 () Bool)

(assert (=> b!144583 m!222425))

(assert (=> b!144583 m!222415))

(assert (=> b!144584 m!222381))

(declare-fun m!222427 () Bool)

(assert (=> b!144584 m!222427))

(declare-fun m!222429 () Bool)

(assert (=> b!144584 m!222429))

(push 1)

(assert (not b!144575))

(assert (not b!144582))

(assert (not b!144589))

(assert (not start!27990))

(assert (not b!144584))

(assert (not b!144587))

(assert (not b!144588))

(assert (not b!144578))

(assert (not b!144576))

(assert (not b!144577))

(assert (not b!144580))

(assert (not b!144583))

(assert (not b!144579))

(assert (not b!144586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

