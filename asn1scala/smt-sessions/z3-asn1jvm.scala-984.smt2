; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27590 () Bool)

(assert start!27590)

(declare-fun b!142084 () Bool)

(declare-fun e!94642 () Bool)

(declare-fun lt!220389 () (_ BitVec 64))

(declare-datatypes ((array!6512 0))(
  ( (array!6513 (arr!3661 (Array (_ BitVec 32) (_ BitVec 8))) (size!2948 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5154 0))(
  ( (BitStream!5155 (buf!3372 array!6512) (currentByte!6241 (_ BitVec 32)) (currentBit!6236 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8884 0))(
  ( (Unit!8885) )
))
(declare-datatypes ((tuple2!12606 0))(
  ( (tuple2!12607 (_1!6636 Unit!8884) (_2!6636 BitStream!5154)) )
))
(declare-fun lt!220386 () tuple2!12606)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142084 (= e!94642 (bvsle lt!220389 (bitIndex!0 (size!2948 (buf!3372 (_2!6636 lt!220386))) (currentByte!6241 (_2!6636 lt!220386)) (currentBit!6236 (_2!6636 lt!220386)))))))

(declare-fun b!142085 () Bool)

(declare-fun res!118572 () Bool)

(declare-fun e!94646 () Bool)

(assert (=> b!142085 (=> (not res!118572) (not e!94646))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!142085 (= res!118572 (bvslt from!447 to!404))))

(declare-fun b!142086 () Bool)

(declare-fun res!118571 () Bool)

(assert (=> b!142086 (=> (not res!118571) (not e!94646))))

(declare-fun thiss!1634 () BitStream!5154)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142086 (= res!118571 (invariant!0 (currentBit!6236 thiss!1634) (currentByte!6241 thiss!1634) (size!2948 (buf!3372 thiss!1634))))))

(declare-fun arr!237 () array!6512)

(declare-datatypes ((tuple2!12608 0))(
  ( (tuple2!12609 (_1!6637 BitStream!5154) (_2!6637 array!6512)) )
))
(declare-fun lt!220383 () tuple2!12608)

(declare-fun b!142087 () Bool)

(declare-fun e!94644 () Bool)

(declare-fun arrayRangesEq!264 (array!6512 array!6512 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142087 (= e!94644 (not (arrayRangesEq!264 arr!237 (_2!6637 lt!220383) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!118573 () Bool)

(assert (=> start!27590 (=> (not res!118573) (not e!94646))))

(assert (=> start!27590 (= res!118573 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2948 arr!237))))))

(assert (=> start!27590 e!94646))

(assert (=> start!27590 true))

(declare-fun array_inv!2737 (array!6512) Bool)

(assert (=> start!27590 (array_inv!2737 arr!237)))

(declare-fun e!94647 () Bool)

(declare-fun inv!12 (BitStream!5154) Bool)

(assert (=> start!27590 (and (inv!12 thiss!1634) e!94647)))

(declare-fun b!142088 () Bool)

(declare-fun res!118574 () Bool)

(assert (=> b!142088 (=> (not res!118574) (not e!94646))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142088 (= res!118574 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2948 (buf!3372 thiss!1634))) ((_ sign_extend 32) (currentByte!6241 thiss!1634)) ((_ sign_extend 32) (currentBit!6236 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!142089 () Bool)

(assert (=> b!142089 (= e!94646 (not e!94642))))

(declare-fun res!118575 () Bool)

(assert (=> b!142089 (=> res!118575 e!94642)))

(declare-fun lt!220390 () tuple2!12606)

(assert (=> b!142089 (= res!118575 (bvsgt lt!220389 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2948 (buf!3372 (_2!6636 lt!220390)))))))))

(assert (=> b!142089 (= lt!220389 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2948 (buf!3372 (_2!6636 lt!220390))) (currentByte!6241 thiss!1634) (currentBit!6236 thiss!1634))))))

(declare-fun e!94650 () Bool)

(assert (=> b!142089 e!94650))

(declare-fun res!118579 () Bool)

(assert (=> b!142089 (=> (not res!118579) (not e!94650))))

(declare-fun isPrefixOf!0 (BitStream!5154 BitStream!5154) Bool)

(assert (=> b!142089 (= res!118579 (isPrefixOf!0 thiss!1634 (_2!6636 lt!220386)))))

(declare-fun lt!220388 () Unit!8884)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5154 BitStream!5154 BitStream!5154) Unit!8884)

(assert (=> b!142089 (= lt!220388 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6636 lt!220390) (_2!6636 lt!220386)))))

(declare-fun e!94649 () Bool)

(assert (=> b!142089 e!94649))

(declare-fun res!118578 () Bool)

(assert (=> b!142089 (=> (not res!118578) (not e!94649))))

(assert (=> b!142089 (= res!118578 (= (size!2948 (buf!3372 (_2!6636 lt!220390))) (size!2948 (buf!3372 (_2!6636 lt!220386)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5154 array!6512 (_ BitVec 32) (_ BitVec 32)) tuple2!12606)

(assert (=> b!142089 (= lt!220386 (appendByteArrayLoop!0 (_2!6636 lt!220390) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!142089 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2948 (buf!3372 (_2!6636 lt!220390)))) ((_ sign_extend 32) (currentByte!6241 (_2!6636 lt!220390))) ((_ sign_extend 32) (currentBit!6236 (_2!6636 lt!220390))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!220382 () Unit!8884)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5154 BitStream!5154 (_ BitVec 64) (_ BitVec 32)) Unit!8884)

(assert (=> b!142089 (= lt!220382 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6636 lt!220390) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94643 () Bool)

(assert (=> b!142089 e!94643))

(declare-fun res!118576 () Bool)

(assert (=> b!142089 (=> (not res!118576) (not e!94643))))

(assert (=> b!142089 (= res!118576 (= (size!2948 (buf!3372 thiss!1634)) (size!2948 (buf!3372 (_2!6636 lt!220390)))))))

(declare-fun appendByte!0 (BitStream!5154 (_ BitVec 8)) tuple2!12606)

(assert (=> b!142089 (= lt!220390 (appendByte!0 thiss!1634 (select (arr!3661 arr!237) from!447)))))

(declare-fun b!142090 () Bool)

(declare-fun e!94645 () Bool)

(assert (=> b!142090 (= e!94645 (not e!94644))))

(declare-fun res!118570 () Bool)

(assert (=> b!142090 (=> res!118570 e!94644)))

(declare-datatypes ((tuple2!12610 0))(
  ( (tuple2!12611 (_1!6638 BitStream!5154) (_2!6638 BitStream!5154)) )
))
(declare-fun lt!220391 () tuple2!12610)

(assert (=> b!142090 (= res!118570 (or (not (= (size!2948 (_2!6637 lt!220383)) (size!2948 arr!237))) (not (= (_1!6637 lt!220383) (_2!6638 lt!220391)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5154 array!6512 (_ BitVec 32) (_ BitVec 32)) tuple2!12608)

(assert (=> b!142090 (= lt!220383 (readByteArrayLoopPure!0 (_1!6638 lt!220391) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!220381 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142090 (validate_offset_bits!1 ((_ sign_extend 32) (size!2948 (buf!3372 (_2!6636 lt!220386)))) ((_ sign_extend 32) (currentByte!6241 (_2!6636 lt!220390))) ((_ sign_extend 32) (currentBit!6236 (_2!6636 lt!220390))) lt!220381)))

(declare-fun lt!220384 () Unit!8884)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5154 array!6512 (_ BitVec 64)) Unit!8884)

(assert (=> b!142090 (= lt!220384 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6636 lt!220390) (buf!3372 (_2!6636 lt!220386)) lt!220381))))

(declare-fun reader!0 (BitStream!5154 BitStream!5154) tuple2!12610)

(assert (=> b!142090 (= lt!220391 (reader!0 (_2!6636 lt!220390) (_2!6636 lt!220386)))))

(declare-fun b!142091 () Bool)

(declare-fun res!118569 () Bool)

(assert (=> b!142091 (=> (not res!118569) (not e!94643))))

(assert (=> b!142091 (= res!118569 (isPrefixOf!0 thiss!1634 (_2!6636 lt!220390)))))

(declare-fun b!142092 () Bool)

(assert (=> b!142092 (= e!94647 (array_inv!2737 (buf!3372 thiss!1634)))))

(declare-fun b!142093 () Bool)

(assert (=> b!142093 (= e!94650 (invariant!0 (currentBit!6236 thiss!1634) (currentByte!6241 thiss!1634) (size!2948 (buf!3372 (_2!6636 lt!220390)))))))

(declare-datatypes ((tuple2!12612 0))(
  ( (tuple2!12613 (_1!6639 BitStream!5154) (_2!6639 (_ BitVec 8))) )
))
(declare-fun lt!220387 () tuple2!12612)

(declare-fun b!142094 () Bool)

(declare-fun lt!220385 () tuple2!12610)

(assert (=> b!142094 (= e!94643 (and (= (_2!6639 lt!220387) (select (arr!3661 arr!237) from!447)) (= (_1!6639 lt!220387) (_2!6638 lt!220385))))))

(declare-fun readBytePure!0 (BitStream!5154) tuple2!12612)

(assert (=> b!142094 (= lt!220387 (readBytePure!0 (_1!6638 lt!220385)))))

(assert (=> b!142094 (= lt!220385 (reader!0 thiss!1634 (_2!6636 lt!220390)))))

(declare-fun b!142095 () Bool)

(declare-fun res!118577 () Bool)

(assert (=> b!142095 (=> (not res!118577) (not e!94645))))

(assert (=> b!142095 (= res!118577 (isPrefixOf!0 (_2!6636 lt!220390) (_2!6636 lt!220386)))))

(declare-fun b!142096 () Bool)

(declare-fun res!118567 () Bool)

(assert (=> b!142096 (=> (not res!118567) (not e!94643))))

(assert (=> b!142096 (= res!118567 (= (bitIndex!0 (size!2948 (buf!3372 (_2!6636 lt!220390))) (currentByte!6241 (_2!6636 lt!220390)) (currentBit!6236 (_2!6636 lt!220390))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2948 (buf!3372 thiss!1634)) (currentByte!6241 thiss!1634) (currentBit!6236 thiss!1634)))))))

(declare-fun b!142097 () Bool)

(assert (=> b!142097 (= e!94649 e!94645)))

(declare-fun res!118568 () Bool)

(assert (=> b!142097 (=> (not res!118568) (not e!94645))))

(assert (=> b!142097 (= res!118568 (= (bitIndex!0 (size!2948 (buf!3372 (_2!6636 lt!220386))) (currentByte!6241 (_2!6636 lt!220386)) (currentBit!6236 (_2!6636 lt!220386))) (bvadd (bitIndex!0 (size!2948 (buf!3372 (_2!6636 lt!220390))) (currentByte!6241 (_2!6636 lt!220390)) (currentBit!6236 (_2!6636 lt!220390))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!220381))))))

(assert (=> b!142097 (= lt!220381 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!27590 res!118573) b!142088))

(assert (= (and b!142088 res!118574) b!142085))

(assert (= (and b!142085 res!118572) b!142086))

(assert (= (and b!142086 res!118571) b!142089))

(assert (= (and b!142089 res!118576) b!142096))

(assert (= (and b!142096 res!118567) b!142091))

(assert (= (and b!142091 res!118569) b!142094))

(assert (= (and b!142089 res!118578) b!142097))

(assert (= (and b!142097 res!118568) b!142095))

(assert (= (and b!142095 res!118577) b!142090))

(assert (= (and b!142090 (not res!118570)) b!142087))

(assert (= (and b!142089 res!118579) b!142093))

(assert (= (and b!142089 (not res!118575)) b!142084))

(assert (= start!27590 b!142092))

(declare-fun m!218211 () Bool)

(assert (=> b!142089 m!218211))

(declare-fun m!218213 () Bool)

(assert (=> b!142089 m!218213))

(declare-fun m!218215 () Bool)

(assert (=> b!142089 m!218215))

(declare-fun m!218217 () Bool)

(assert (=> b!142089 m!218217))

(declare-fun m!218219 () Bool)

(assert (=> b!142089 m!218219))

(declare-fun m!218221 () Bool)

(assert (=> b!142089 m!218221))

(declare-fun m!218223 () Bool)

(assert (=> b!142089 m!218223))

(declare-fun m!218225 () Bool)

(assert (=> b!142089 m!218225))

(assert (=> b!142089 m!218223))

(declare-fun m!218227 () Bool)

(assert (=> b!142084 m!218227))

(declare-fun m!218229 () Bool)

(assert (=> b!142095 m!218229))

(declare-fun m!218231 () Bool)

(assert (=> b!142086 m!218231))

(declare-fun m!218233 () Bool)

(assert (=> start!27590 m!218233))

(declare-fun m!218235 () Bool)

(assert (=> start!27590 m!218235))

(declare-fun m!218237 () Bool)

(assert (=> b!142090 m!218237))

(declare-fun m!218239 () Bool)

(assert (=> b!142090 m!218239))

(declare-fun m!218241 () Bool)

(assert (=> b!142090 m!218241))

(declare-fun m!218243 () Bool)

(assert (=> b!142090 m!218243))

(assert (=> b!142097 m!218227))

(declare-fun m!218245 () Bool)

(assert (=> b!142097 m!218245))

(assert (=> b!142096 m!218245))

(declare-fun m!218247 () Bool)

(assert (=> b!142096 m!218247))

(assert (=> b!142094 m!218223))

(declare-fun m!218249 () Bool)

(assert (=> b!142094 m!218249))

(declare-fun m!218251 () Bool)

(assert (=> b!142094 m!218251))

(declare-fun m!218253 () Bool)

(assert (=> b!142091 m!218253))

(declare-fun m!218255 () Bool)

(assert (=> b!142093 m!218255))

(declare-fun m!218257 () Bool)

(assert (=> b!142088 m!218257))

(declare-fun m!218259 () Bool)

(assert (=> b!142087 m!218259))

(declare-fun m!218261 () Bool)

(assert (=> b!142092 m!218261))

(check-sat (not b!142091) (not b!142084) (not b!142095) (not b!142086) (not b!142090) (not b!142089) (not b!142087) (not start!27590) (not b!142093) (not b!142096) (not b!142092) (not b!142097) (not b!142088) (not b!142094))
(check-sat)
