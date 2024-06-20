; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27476 () Bool)

(assert start!27476)

(declare-fun b!141492 () Bool)

(declare-fun res!118030 () Bool)

(declare-fun e!94264 () Bool)

(assert (=> b!141492 (=> (not res!118030) (not e!94264))))

(declare-datatypes ((array!6491 0))(
  ( (array!6492 (arr!3646 (Array (_ BitVec 32) (_ BitVec 8))) (size!2939 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5136 0))(
  ( (BitStream!5137 (buf!3360 array!6491) (currentByte!6220 (_ BitVec 32)) (currentBit!6215 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8860 0))(
  ( (Unit!8861) )
))
(declare-datatypes ((tuple2!12528 0))(
  ( (tuple2!12529 (_1!6594 Unit!8860) (_2!6594 BitStream!5136)) )
))
(declare-fun lt!219569 () tuple2!12528)

(declare-fun lt!219578 () tuple2!12528)

(declare-fun isPrefixOf!0 (BitStream!5136 BitStream!5136) Bool)

(assert (=> b!141492 (= res!118030 (isPrefixOf!0 (_2!6594 lt!219569) (_2!6594 lt!219578)))))

(declare-fun b!141493 () Bool)

(declare-fun e!94268 () Bool)

(assert (=> b!141493 (= e!94264 (not e!94268))))

(declare-fun res!118028 () Bool)

(assert (=> b!141493 (=> res!118028 e!94268)))

(declare-datatypes ((tuple2!12530 0))(
  ( (tuple2!12531 (_1!6595 BitStream!5136) (_2!6595 array!6491)) )
))
(declare-fun lt!219570 () tuple2!12530)

(declare-fun arr!237 () array!6491)

(declare-datatypes ((tuple2!12532 0))(
  ( (tuple2!12533 (_1!6596 BitStream!5136) (_2!6596 BitStream!5136)) )
))
(declare-fun lt!219576 () tuple2!12532)

(assert (=> b!141493 (= res!118028 (or (not (= (size!2939 (_2!6595 lt!219570)) (size!2939 arr!237))) (not (= (_1!6595 lt!219570) (_2!6596 lt!219576)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5136 array!6491 (_ BitVec 32) (_ BitVec 32)) tuple2!12530)

(assert (=> b!141493 (= lt!219570 (readByteArrayLoopPure!0 (_1!6596 lt!219576) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!219574 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141493 (validate_offset_bits!1 ((_ sign_extend 32) (size!2939 (buf!3360 (_2!6594 lt!219578)))) ((_ sign_extend 32) (currentByte!6220 (_2!6594 lt!219569))) ((_ sign_extend 32) (currentBit!6215 (_2!6594 lt!219569))) lt!219574)))

(declare-fun lt!219577 () Unit!8860)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5136 array!6491 (_ BitVec 64)) Unit!8860)

(assert (=> b!141493 (= lt!219577 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6594 lt!219569) (buf!3360 (_2!6594 lt!219578)) lt!219574))))

(declare-fun reader!0 (BitStream!5136 BitStream!5136) tuple2!12532)

(assert (=> b!141493 (= lt!219576 (reader!0 (_2!6594 lt!219569) (_2!6594 lt!219578)))))

(declare-fun b!141494 () Bool)

(declare-fun e!94263 () Bool)

(assert (=> b!141494 (= e!94263 e!94264)))

(declare-fun res!118034 () Bool)

(assert (=> b!141494 (=> (not res!118034) (not e!94264))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141494 (= res!118034 (= (bitIndex!0 (size!2939 (buf!3360 (_2!6594 lt!219578))) (currentByte!6220 (_2!6594 lt!219578)) (currentBit!6215 (_2!6594 lt!219578))) (bvadd (bitIndex!0 (size!2939 (buf!3360 (_2!6594 lt!219569))) (currentByte!6220 (_2!6594 lt!219569)) (currentBit!6215 (_2!6594 lt!219569))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219574))))))

(assert (=> b!141494 (= lt!219574 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!118027 () Bool)

(declare-fun e!94265 () Bool)

(assert (=> start!27476 (=> (not res!118027) (not e!94265))))

(assert (=> start!27476 (= res!118027 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2939 arr!237))))))

(assert (=> start!27476 e!94265))

(assert (=> start!27476 true))

(declare-fun array_inv!2728 (array!6491) Bool)

(assert (=> start!27476 (array_inv!2728 arr!237)))

(declare-fun thiss!1634 () BitStream!5136)

(declare-fun e!94267 () Bool)

(declare-fun inv!12 (BitStream!5136) Bool)

(assert (=> start!27476 (and (inv!12 thiss!1634) e!94267)))

(declare-fun b!141495 () Bool)

(assert (=> b!141495 (= e!94267 (array_inv!2728 (buf!3360 thiss!1634)))))

(declare-fun b!141496 () Bool)

(assert (=> b!141496 (= e!94265 (not true))))

(assert (=> b!141496 (isPrefixOf!0 thiss!1634 (_2!6594 lt!219578))))

(declare-fun lt!219572 () Unit!8860)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5136 BitStream!5136 BitStream!5136) Unit!8860)

(assert (=> b!141496 (= lt!219572 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6594 lt!219569) (_2!6594 lt!219578)))))

(assert (=> b!141496 e!94263))

(declare-fun res!118033 () Bool)

(assert (=> b!141496 (=> (not res!118033) (not e!94263))))

(assert (=> b!141496 (= res!118033 (= (size!2939 (buf!3360 (_2!6594 lt!219569))) (size!2939 (buf!3360 (_2!6594 lt!219578)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5136 array!6491 (_ BitVec 32) (_ BitVec 32)) tuple2!12528)

(assert (=> b!141496 (= lt!219578 (appendByteArrayLoop!0 (_2!6594 lt!219569) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141496 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2939 (buf!3360 (_2!6594 lt!219569)))) ((_ sign_extend 32) (currentByte!6220 (_2!6594 lt!219569))) ((_ sign_extend 32) (currentBit!6215 (_2!6594 lt!219569))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219573 () Unit!8860)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5136 BitStream!5136 (_ BitVec 64) (_ BitVec 32)) Unit!8860)

(assert (=> b!141496 (= lt!219573 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6594 lt!219569) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94269 () Bool)

(assert (=> b!141496 e!94269))

(declare-fun res!118026 () Bool)

(assert (=> b!141496 (=> (not res!118026) (not e!94269))))

(assert (=> b!141496 (= res!118026 (= (size!2939 (buf!3360 thiss!1634)) (size!2939 (buf!3360 (_2!6594 lt!219569)))))))

(declare-fun appendByte!0 (BitStream!5136 (_ BitVec 8)) tuple2!12528)

(assert (=> b!141496 (= lt!219569 (appendByte!0 thiss!1634 (select (arr!3646 arr!237) from!447)))))

(declare-fun b!141497 () Bool)

(declare-fun res!118032 () Bool)

(assert (=> b!141497 (=> (not res!118032) (not e!94269))))

(assert (=> b!141497 (= res!118032 (= (bitIndex!0 (size!2939 (buf!3360 (_2!6594 lt!219569))) (currentByte!6220 (_2!6594 lt!219569)) (currentBit!6215 (_2!6594 lt!219569))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2939 (buf!3360 thiss!1634)) (currentByte!6220 thiss!1634) (currentBit!6215 thiss!1634)))))))

(declare-fun b!141498 () Bool)

(declare-fun arrayRangesEq!255 (array!6491 array!6491 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141498 (= e!94268 (not (arrayRangesEq!255 arr!237 (_2!6595 lt!219570) #b00000000000000000000000000000000 to!404)))))

(declare-datatypes ((tuple2!12534 0))(
  ( (tuple2!12535 (_1!6597 BitStream!5136) (_2!6597 (_ BitVec 8))) )
))
(declare-fun lt!219571 () tuple2!12534)

(declare-fun b!141499 () Bool)

(declare-fun lt!219575 () tuple2!12532)

(assert (=> b!141499 (= e!94269 (and (= (_2!6597 lt!219571) (select (arr!3646 arr!237) from!447)) (= (_1!6597 lt!219571) (_2!6596 lt!219575))))))

(declare-fun readBytePure!0 (BitStream!5136) tuple2!12534)

(assert (=> b!141499 (= lt!219571 (readBytePure!0 (_1!6596 lt!219575)))))

(assert (=> b!141499 (= lt!219575 (reader!0 thiss!1634 (_2!6594 lt!219569)))))

(declare-fun b!141500 () Bool)

(declare-fun res!118031 () Bool)

(assert (=> b!141500 (=> (not res!118031) (not e!94265))))

(assert (=> b!141500 (= res!118031 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2939 (buf!3360 thiss!1634))) ((_ sign_extend 32) (currentByte!6220 thiss!1634)) ((_ sign_extend 32) (currentBit!6215 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141501 () Bool)

(declare-fun res!118029 () Bool)

(assert (=> b!141501 (=> (not res!118029) (not e!94265))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141501 (= res!118029 (invariant!0 (currentBit!6215 thiss!1634) (currentByte!6220 thiss!1634) (size!2939 (buf!3360 thiss!1634))))))

(declare-fun b!141502 () Bool)

(declare-fun res!118036 () Bool)

(assert (=> b!141502 (=> (not res!118036) (not e!94265))))

(assert (=> b!141502 (= res!118036 (bvslt from!447 to!404))))

(declare-fun b!141503 () Bool)

(declare-fun res!118035 () Bool)

(assert (=> b!141503 (=> (not res!118035) (not e!94269))))

(assert (=> b!141503 (= res!118035 (isPrefixOf!0 thiss!1634 (_2!6594 lt!219569)))))

(assert (= (and start!27476 res!118027) b!141500))

(assert (= (and b!141500 res!118031) b!141502))

(assert (= (and b!141502 res!118036) b!141501))

(assert (= (and b!141501 res!118029) b!141496))

(assert (= (and b!141496 res!118026) b!141497))

(assert (= (and b!141497 res!118032) b!141503))

(assert (= (and b!141503 res!118035) b!141499))

(assert (= (and b!141496 res!118033) b!141494))

(assert (= (and b!141494 res!118034) b!141492))

(assert (= (and b!141492 res!118030) b!141493))

(assert (= (and b!141493 (not res!118028)) b!141498))

(assert (= start!27476 b!141495))

(declare-fun m!217385 () Bool)

(assert (=> b!141493 m!217385))

(declare-fun m!217387 () Bool)

(assert (=> b!141493 m!217387))

(declare-fun m!217389 () Bool)

(assert (=> b!141493 m!217389))

(declare-fun m!217391 () Bool)

(assert (=> b!141493 m!217391))

(declare-fun m!217393 () Bool)

(assert (=> b!141496 m!217393))

(declare-fun m!217395 () Bool)

(assert (=> b!141496 m!217395))

(declare-fun m!217397 () Bool)

(assert (=> b!141496 m!217397))

(declare-fun m!217399 () Bool)

(assert (=> b!141496 m!217399))

(declare-fun m!217401 () Bool)

(assert (=> b!141496 m!217401))

(declare-fun m!217403 () Bool)

(assert (=> b!141496 m!217403))

(declare-fun m!217405 () Bool)

(assert (=> b!141496 m!217405))

(assert (=> b!141496 m!217401))

(declare-fun m!217407 () Bool)

(assert (=> b!141495 m!217407))

(declare-fun m!217409 () Bool)

(assert (=> b!141494 m!217409))

(declare-fun m!217411 () Bool)

(assert (=> b!141494 m!217411))

(assert (=> b!141497 m!217411))

(declare-fun m!217413 () Bool)

(assert (=> b!141497 m!217413))

(declare-fun m!217415 () Bool)

(assert (=> b!141500 m!217415))

(declare-fun m!217417 () Bool)

(assert (=> start!27476 m!217417))

(declare-fun m!217419 () Bool)

(assert (=> start!27476 m!217419))

(declare-fun m!217421 () Bool)

(assert (=> b!141498 m!217421))

(assert (=> b!141499 m!217401))

(declare-fun m!217423 () Bool)

(assert (=> b!141499 m!217423))

(declare-fun m!217425 () Bool)

(assert (=> b!141499 m!217425))

(declare-fun m!217427 () Bool)

(assert (=> b!141492 m!217427))

(declare-fun m!217429 () Bool)

(assert (=> b!141501 m!217429))

(declare-fun m!217431 () Bool)

(assert (=> b!141503 m!217431))

(check-sat (not b!141495) (not b!141492) (not b!141494) (not b!141497) (not b!141503) (not b!141499) (not b!141501) (not b!141498) (not b!141496) (not start!27476) (not b!141493) (not b!141500))
